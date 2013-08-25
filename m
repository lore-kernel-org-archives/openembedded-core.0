Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id A904961013
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 06:41:09 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so2221290pde.23
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=35+ST3rOeRgqRUkDyMF5O9OmH+k8fBU648KiiUaZsAU=;
	b=PHbyFoWkqz651e+vFukvtdtV9vTQqCN1sryUAhkVlNHUMpOfIovWsJfLLCAPHmlL/F
	tbrkVBUObApIGFuHGHUU9XDBTX0Wx57yzUhdHYcAxJalc1eSlogNtTwHAdeaICJRMQvA
	+5AB0TgANzX9JvGWHxvIl/mCHsFtHN7j0Z1iqD0bK0E7/Y70wue8I+KjNkiixDl8t70+
	ye8LiLuNsd4VMz81UqLsuoDgwV2Ydurn5RvJLtknMrr6ivIdt29tm+5aPiHUDFqfUqBF
	n35kM6bwXkGXCt12HbICfzBA7xg5sRRrpCg6J11IJ7Lu+bNICrYIqrvVbk/WyqiFAxge
	RevQ==
X-Received: by 10.68.252.168 with SMTP id zt8mr8725393pbc.35.1377412870589;
	Sat, 24 Aug 2013 23:41:10 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id yg1sm10210314pbb.1.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 24 Aug 2013 23:41:10 -0700 (PDT)
Message-ID: <5219A5DA.5040708@gmail.com>
Date: Sun, 25 Aug 2013 16:36:10 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<03d9de265ca50b2182016c8335193e2f2302698a.1377405083.git.bruce.ashfield@windriver.com>
In-Reply-To: <03d9de265ca50b2182016c8335193e2f2302698a.1377405083.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/7] gst-plugins-good: fix 3.10 libc-headers build failure
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
X-List-Received-Date: Sun, 25 Aug 2013 06:41:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/2013 3:16 PM, Bruce Ashfield wrote:
> kernel commit 24b9f5017 [[media] V4L: Remove deprecated image centering controls]
> removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after three
> years of depreciation.
>
> The ioctl values are still free, and the case statement which processess them
> in v4l2 userspace falls through to the proper replacement. So in the short
> term, we can explicitly define them using the old absolute values, and everything
> will work.
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>   ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 ++++++++++++++++++++
>   .../gstreamer/gst-plugins-good_0.10.31.bb          |    1 +
>   2 files changed, 46 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> new file mode 100644
> index 0000000..bd0de58
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch
> @@ -0,0 +1,45 @@
> +From ccb01de8096a32d86d47b0d92ec3416c57ee4d25 Mon Sep 17 00:00:00 2001
> +From: Bruce Ashfield <bruce.ashfield@windriver.com>
> +Date: Thu, 22 Aug 2013 12:15:54 -0400
> +Subject: [PATCH] v4l2_calls: define V4L2_CID_HCENTER and V4L2_CID_VCENTER
> +
> +kernel commit 24b9f5017 [[media] V4L: Remove deprecated image centering controls]
> +removed the definitions of V4L2_CID_HCENTER and V4L2_CID_VCENTER after three
> +years of depreciation.
> +
> +The ioctl values are still free, and the case statement which processess them
> +in v4l2 userspace falls through to the proper replacement. So in the short
> +term, we can explicitly define them using the old absolute values, and everything
> +will work.
Missing Upstream-Status.

Regards,
Jonathan
> +
> +Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> +---
> + sys/v4l2/v4l2_calls.c |    9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/sys/v4l2/v4l2_calls.c b/sys/v4l2/v4l2_calls.c
> +index 309bfb6..3c64544 100644
> +--- a/sys/v4l2/v4l2_calls.c
> ++++ b/sys/v4l2/v4l2_calls.c
> +@@ -54,11 +54,16 @@
> + #include "gst/gst-i18n-plugin.h"
> +
> + /* Those are ioctl calls */
> ++
> ++/* V4L2_CID_HCENTER has been removed from the mainline kernel, but
> ++   the ioctl space is still present. Since these values fall through
> ++   to their replacement, it is safe (in the short term) to re-use the
> ++    old values explictily */
> + #ifndef V4L2_CID_HCENTER
> +-#define V4L2_CID_HCENTER V4L2_CID_HCENTER_DEPRECATED
> ++#define V4L2_CID_HCENTER V4L2_CID_BASE+22
> + #endif
> + #ifndef V4L2_CID_VCENTER
> +-#define V4L2_CID_VCENTER V4L2_CID_VCENTER_DEPRECATED
> ++#define V4L2_CID_VCENTER V4L2_CID_BASE+23
> + #endif
> +
> + GST_DEBUG_CATEGORY_EXTERN (v4l2_debug);
> +--
> +1.7.10.4
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> index daffcf1..d18e155 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
> @@ -23,6 +23,7 @@ DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
>   inherit gettext gconf
>   
>   SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
> +SRC_URI += "file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
>   
>   EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal --without-check \
>                    --disable-examples --disable-taglib"


