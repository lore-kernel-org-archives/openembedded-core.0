Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9F17470A30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BANWAS031578; Mon, 11 Aug 2014 11:23:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id alBdfodDfFNm; Mon, 11 Aug 2014 11:23:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BANSea031575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 11 Aug 2014 11:23:29 +0100
Message-ID: <1407752608.22187.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max Eliaser <max.eliaser@intel.com>
Date: Mon, 11 Aug 2014 11:23:28 +0100
In-Reply-To: <67c3a9199068f3e3b0f9061a8fb765f64b2ee7fd.1407443396.git.max.eliaser@intel.com>
References: <cover.1407443396.git.max.eliaser@intel.com>
	<67c3a9199068f3e3b0f9061a8fb765f64b2ee7fd.1407443396.git.max.eliaser@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] xorg-drivers: xf86-video-cirrus: add a recipe for the Cirrus Logic X.Org driver
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
X-List-Received-Date: Mon, 11 Aug 2014 10:23:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-07 at 13:31 -0700, Max Eliaser wrote:
> This driver allows X.Org to use the Cirrus Logic family of VGA adapters. Since
> QEMU can emulate a Cirrus VGA adapter, this driver will be of use for images
> that are expected to run under QEMU, if QEMU's other VGA adapters are
> unavailable.
> 
> Signed-off-by: Max Eliaser <max.eliaser@intel.com>
> ---
>  .../recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb
> 
> diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb
> new file mode 100644
> index 0000000..f110522
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-driver/xf86-video-cirrus_1.5.2.bb
> @@ -0,0 +1,13 @@
> +require xorg-driver-video.inc
> +
> +SUMMARY = "X.Org X server -- cirrus display driver"
> +DESCRIPTION = "cirrus is an Xorg driver for Cirrus Logic VGA adapters. These \
> +devices are not so common in the wild anymore, QEMU can emulate one, so the \
> +driver is still useful."
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6ddc7ca860dc5fd014e7f160ea699295"
> +
> +SRC_URI[md5sum] = "91fd6b677d62027cd3001debb587a6a6"
> +SRC_URI[sha256sum] = "3361e1a65d9b84c464752fd612bdf6087622c6dd204121715366a170e5c3ccd7"
> +
> +DEPENDS_${PN} = "virtual/libx11"

There is no such variable as DEPENDS_${PN} so that line does nothing.

Cheers,

Richard


