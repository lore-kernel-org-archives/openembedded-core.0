Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 5DEC373CF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 11:57:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 936006002C8
Message-ID: <558160B7.3070405@collabora.co.uk>
Date: Wed, 17 Jun 2015 12:57:43 +0100
From: Joshua Lock <joshua.lock@collabora.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433946506-85872-1-git-send-email-martin.stolpe@gmail.com>
In-Reply-To: <1433946506-85872-1-git-send-email-martin.stolpe@gmail.com>
Subject: Re: [PATCH] [fido] ncurses: fix native builds when host has gcc5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Jun 2015 11:57:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/06/15 15:28, Martin Stolpe wrote:
> GCC"s preprocessor starts to add newlines which are not
> handled properly by ncurses build system startin from
> version 5.0.
>
> See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7870
>
> Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>

Thanks for the patch, I've queued a modified version that only passes -P 
to the native variant of the ncurses recipe:

http://cgit.openembedded.org/openembedded-core-contrib/commit/?h=joshuagl/fido-next&id=5b5067831144112914d2d31752177bc13ffcda5b

Regards,

Joshua

> ---
>   meta/recipes-core/ncurses/ncurses.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 10f7dd1..a7a265d 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -26,7 +26,7 @@ ENABLE_WIDEC ?= "true"
>   # _GNU_SOURCE is required for widec stuff and is detected automatically
>   # for target objects.  But it must be set manually for native and sdk
>   # builds.
> -BUILD_CPPFLAGS += "-D_GNU_SOURCE"
> +BUILD_CPPFLAGS += "-D_GNU_SOURCE -P"
>
>   # natives don't generally look in base_libdir
>   base_libdir_class-native = "${libdir}"
>


