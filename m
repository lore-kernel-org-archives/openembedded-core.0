Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (unknown [209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id ACC6F65F09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 13:49:58 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 63so8064685qgz.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 06:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nyCdLPIP+tkc3bP2QfSgOWoQmo/uT1il9/dg5bBDvXI=;
	b=RJfhHWLpMz2E/aF0uVExiJ1X0GSus9PPViJDlC8c4LFejHHODsrgzZLQGBkdAa9FAg
	2t2YZBIWdZYowUI7qKI05xqMlxsHBf/0paeyKSv1tE6BM+Wcv9+bWt0qG5uXKEs3jNm2
	+raTA5gpM1heNHKAzD+7e7JZgV+v9fNbJnx9bQopOsslZj/FDqetNjaOBISnCUDdUpFW
	T1f3NOr3RhI3hmf0cCzg+vxCC9fB9+4evmOgHsjQSSspvBB1XYE7WxT+8HVpuDpklcZ/
	UR90FSWyDdekxedYq5xptcoJz9EDT0L+OscUYNsHKU+yvAedCWrXbQMo5jZY2XXuAoh3
	JQyQ==
X-Gm-Message-State: ALoCoQmP8ku6r3ME7dZtMmlCVOqGMX+eTUYqb6O2Rbb//c3k4OObeqS1+3E0NPV3uqYcky/kOrI8
X-Received: by 10.229.72.10 with SMTP id k10mr7018181qcj.2.1400852999956; Fri,
	23 May 2014 06:49:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 23 May 2014 06:49:38 -0700 (PDT)
In-Reply-To: <1400825337-3955-1-git-send-email-b40527@freescale.com>
References: <1400825337-3955-1-git-send-email-b40527@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 May 2014 14:49:38 +0100
Message-ID: <CAJTo0LbMGfDFMre2dNJXZ73R2NNzjtHyso_4orZT4yv0oc_OpA@mail.gmail.com>
To: "b40527@freescale.com" <b40527@freescale.com>
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2][v2] doxygen-native: add recipe
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
X-List-Received-Date: Fri, 23 May 2014 13:50:00 -0000
Content-Type: text/plain; charset=UTF-8

Whilst this recipe works, I wonder if it would be more useful if it
were cross-compilable and used BBCLASSEXTEND to become native.

Ross

On 23 May 2014 07:08,  <b40527@freescale.com> wrote:
> From: Zongchun Yu <Zongchun.Yu@freescale.com>
>
> Signed-off-by: Zongchun Yu <Zongchun.Yu@freescale.com>
> ---
>  .../doxygen/doxygen-native_1.8.6.bb                |   23 ++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
>
> diff --git a/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
> new file mode 100644
> index 0000000..eac4c9b
> --- /dev/null
> +++ b/meta/recipes-devtools/doxygen/doxygen-native_1.8.6.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION = "Utilities for generating documentation from source code"
> +HOMEPAGE = "http://www.stack.nl/~dimitri/doxygen/index.html"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
> +DEPENDS = "flex-native bison-native"
> +
> +SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/doxygen-${PV}.src.tar.gz"
> +
> +SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
> +SRC_URI[sha256sum] = "6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
> +
> +inherit native
> +
> +EXTRA_OECONF = "--prefix ${prefix}"
> +
> +do_configure () {
> +    ./configure ${EXTRA_OECONF}
> +}
> +
> +do_install() {
> +    oe_runmake install DESTDIR=${D} MAN1DIR=share/man/man1
> +}
> --
> 1.7.0.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

