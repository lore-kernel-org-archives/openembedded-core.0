Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D025675E80
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:42:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7P9glcd009883
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 02:42:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 25 Aug 2015 02:42:47 -0700
Message-ID: <55DC3896.5080001@windriver.com>
Date: Tue, 25 Aug 2015 17:42:46 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1440495482.git.liezhi.yang@windriver.com>
	<4ada90ff0e1b302636d6f9a23e932956d99a0a82.1440495482.git.liezhi.yang@windriver.com>
In-Reply-To: <4ada90ff0e1b302636d6f9a23e932956d99a0a82.1440495482.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/1] libnotify: set GNOME_COMPRESS_TYPE to bz2
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
X-List-Received-Date: Tue, 25 Aug 2015 09:42:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/25/2015 05:38 PM, Robert Yang wrote:
> Fixed do_fetch error:
> WARNING: Failed to fetch URL http://ftp.gnome.org/pub/GNOME/sources/libnotify/0.6/libnotify-0.6.0.tar.xz;name=archive, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 8, output:
> http://ftp.gnome.org/pub/GNOME/sources/libnotify/0.6/libnotify-0.6.0.tar.xz:
> 2015-08-25 02:31:32 ERROR 404: Not Found.
>
> There are .tar.gz and .bz2, but no .tar.xz.
>
> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-core 20150825

Sorry, this line should not be here, I updated it in the repo.

// Robert

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-gnome/libnotify/libnotify_0.6.0.bb |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> index e6ee89b..b90dbe4 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> @@ -12,6 +12,8 @@ inherit gnomebase distro_features_check
>   # Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
>   REQUIRED_DISTRO_FEATURES = "x11"
>
> +GNOME_COMPRESS_TYPE = "bz2"
> +
>   SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
>   SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
>
>

