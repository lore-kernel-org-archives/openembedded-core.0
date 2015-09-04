Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 188DE76FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 08:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id B5E761588C6A
Message-ID: <1441354255.3071.5.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 04 Sep 2015 09:10:55 +0100
In-Reply-To: <1441311635-6303-1-git-send-email-sgw@linux.intel.com>
References: <1441311635-6303-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Mime-Version: 1.0
Subject: Re: [PATCH][master/fido/dizzy] oprofileui: Use inherit gettext
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
X-List-Received-Date: Fri, 04 Sep 2015 08:10:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 13:20 -0700, Saul Wold wrote:
> oprofileui uses gettext during the configuration task so should be
> inherit
> gettext. This issue appears when an older version of gettext is used
> do to
> pinning to the older non-gplv3 version.
> 
> [YOCTO #7795]

I've queued this in my fido-next branch[1].

Cheers,

Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-kernel/oprofile/oprofileui.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/oprofile/oprofileui.inc
> b/meta/recipes-kernel/oprofile/oprofileui.inc
> index 1dfd0c6..8fcf014 100644
> --- a/meta/recipes-kernel/oprofile/oprofileui.inc
> +++ b/meta/recipes-kernel/oprofile/oprofileui.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "
> file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  
>  DEPENDS = "glib-2.0 avahi intltool-native"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig gettext
>  
>  EXTRA_OECONF = "--with-avahi"
>  
> -- 
> 2.1.0
> 

