Return-Path: <max.oss.09@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 30B3471A39
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 18:41:32 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v42so24294398wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 11:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kms54DtU2Ic/jNrU7zm5g7Mk0estzt8/8NoENOtFYTo=;
	b=uEPmHig5tKA0ApySMf3xSIay8EUPoHLEGQ9ZvcyLV2wi2qrKRUXEP8zNzS947e3u/4
	XeXK9CzGnuIJdxrH82SPOQWLlPvyo8Ciq1zCrK4vcSKREG/zkuJmrI1ptIktqmsDY54e
	ZF4tTsCzugp+ZVfnISkNK28ODZi6RYUYwcvWztLlTo+0NRmHPtU5y6MdAok/TxGtKIkE
	WJLMbuKEDomOUuSd9zqti/AbRz3LQ8EY2ITqreRrrGwmaiRkC+jL89U7EeAbChCx1J/v
	ST2HSaZwCpB80jen6GA82V4h9aUOl7QtLrQSyGEpeb7GVR4y2wovXex5wNbAGb8XRq1r
	Zh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kms54DtU2Ic/jNrU7zm5g7Mk0estzt8/8NoENOtFYTo=;
	b=ElW1WSMA9CJJmwGp36rnt9ExbKx/L2VQr2rz5i8osBzbxYJsebxOiDh5roB8IX/Ad5
	AmA8TDCopn7/VuGRtuL5M3GMhDFidcQh6q75ltue+c6PtocAUBbKISlwQVuUyd/gjoQ1
	nUkyAvPZRdFEXqwjF6pdNn9XsHTEnO6dXf3NjxoTeQPa1bLyFWDSgxv/YZ4bBL4qF49P
	idzZwCXNt/ZwNyzYpHNhSNjPxjyhBwCgkxoi9uJZtXG+rWSPBNNn60NL7Wa4clInnjex
	AIRyJp2xc5hLDBHHywRafymg/Pnz1+dZqYOGAAO/7fYbVAokK3DiqZXKGbKKR3r8ezo+
	aWrw==
X-Gm-Message-State: AN3rC/4x+EwyzS/pLM2RvyC6OGhwMoCSwHzhR7hjicv1MmBVZ+auGAY8
	PXKhCPeXrpevMmB4
X-Received: by 10.80.205.93 with SMTP id d29mr4183099edj.74.1493836893729;
	Wed, 03 May 2017 11:41:33 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	l51sm7123304eda.52.2017.05.03.11.41.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 May 2017 11:41:33 -0700 (PDT)
Message-ID: <1493836892.2405.4.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 May 2017 20:41:32 +0200
In-Reply-To: <20170503131153.1780-3-alexander.kanavin@linux.intel.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Wed, 03 May 2017 18:41:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alexander

Am Mittwoch, den 03.05.2017, 16:11 +0300 schrieb Alexander Kanavin:
> It was only in oe-core because of LSB; let's remove it. Current libpng is 1.6.x.

This will break at least meta-openembedded glmark2 and glcompbench.

Max

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../packagegroups/packagegroup-core-lsb.bb         |  1 -
>  meta/recipes-lsb4/libpng/libpng12_1.2.57.bb        | 36 ----------------------
>  2 files changed, 37 deletions(-)
>  delete mode 100644 meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
> 
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes
> -extended/packagegroups/packagegroup-core-lsb.bb
> index 61b35e68921..a6fb3023052 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -177,7 +177,6 @@ RDEPENDS_packagegroup-core-lsb-core = "\
>      ncurses \
>      zlib \
>      nspr \
> -    libpng12 \
>      nss \
>  "
>  
> diff --git a/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb b/meta/recipes
> -lsb4/libpng/libpng12_1.2.57.bb
> deleted file mode 100644
> index 9f74f5fdb5a..00000000000
> --- a/meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -SUMMARY = "PNG image format decoding library"
> -HOMEPAGE = "http://www.libpng.org/"
> -SECTION = "libs"
> -LICENSE = "Libpng"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=597b8a91994a3e27ae6aa79bf02677d9 \
> -                    file://png.h;beginline=19;endline=109;md5=166406397718925b660f0033f7558ef7"
> -DEPENDS = "zlib"
> -
> -PN = "libpng12"
> -S = "${WORKDIR}/libpng-${PV}"
> -
> -SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz"
> -
> -SRC_URI[md5sum] = "307052e5e8af97b82b17b64fb1b3677a"
> -SRC_URI[sha256sum] = "0f4620e11fa283fedafb474427c8e96bf149511a1804bdc47350963ae5cf54d8"
> -
> -UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libpng/files/libpng12/"
> -UPSTREAM_CHECK_REGEX = "/libpng12/(?P<pver>(\d+[\.\-_]*)+)/"
> -
> -BINCONFIG_GLOB = "${PN}-config"
> -
> -inherit autotools binconfig pkgconfig
> -
> -do_install_append() {
> -	# The follow link files link to corresponding png12*.h and libpng12* files
> -	# They conflict with higher verison, so drop them
> -	rm ${D}/${includedir}/png.h
> -	rm ${D}/${includedir}/pngconf.h
> -
> -	rm ${D}/${libdir}/libpng.la
> -	rm ${D}/${libdir}/libpng.so
> -	rm ${D}/${libdir}/libpng.a || true
> -	rm ${D}/${libdir}/pkgconfig/libpng.pc
> -
> -	rm ${D}/${bindir}/libpng-config
> -}
> -- 
> 2.11.0
> 

