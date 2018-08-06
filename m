Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD05F78A74
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:53:15 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id m11-v6so23460152oic.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lhHx+y008dKVe/041gkd6b3rlKYrpsYJWhBsRJ7p1dk=;
	b=HhBbBzVmpX3J8GyrBU3SU3dU40iYAECPxdzft6xRIR/vTVi+1GIHshKZBZcpp+hsYp
	pXomIIXc+nRfAvUnKBMBSUK/B4lz9k3ZkDJjWiW3uWFXNL+gs7gvXSRrNHo1Q4moJ2FG
	nvzdqC8u/bpfx/rabpu/ChFkgNLjsVAOqErn2V6kIvy43WgoIOj4jQFbQbKUYE3JHQyH
	rAcDlOPksdNDbtZDu+Ua8jOVozaE/rrBIxXHEiu/eJXYqd6fgMdFwy8zCSZXoGM7CHNz
	/8r+mxJJNwslMr+xYYyGZ5uQcvSNfSUhFVHuZOHgrgdXGv+cN66Jb+p6fUZMCzyCtZ4N
	pA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lhHx+y008dKVe/041gkd6b3rlKYrpsYJWhBsRJ7p1dk=;
	b=bbzStbPXTA0/mrS+HikKP2sgxGxedCdXXlwQN0Ms+6WOlMRY2TDs2szxD4SrUpctSQ
	6cX6v73YqRTLbGXIeNa9INpDdKvc/lTTfHcrxP+LpRPMvypsE2nWMqOoqABjZ3xbxh4Y
	lvR4A2jtlvpCi5prriJFqL578BZyoOgWIXEm06PwRSR50blOelX2RDkd/3b1qhgknDM6
	+g19ZsTbzdOQfuFgekML/Q7kNxV9LomKzcgt45TO8L9Lo9nn4p1odYkJbRBqu2cMzGER
	G+MOLNnOiXMogweUCo+4r1vY5+Oe50rtevb2ZTBXMqTLF6Kn9GJDgkCsfSdM4Z1UyiPu
	mRjw==
X-Gm-Message-State: AOUpUlH5Ck87xSodDNpHN0K7oxvVR2hJINTwCta4kNRq3uBzwxrSYREH
	ow6biuH7ufkvEB/h93RzQKX2bhMCamAbni/FQqZ3CQ==
X-Google-Smtp-Source: AAOMgpfc8h/kH+T8ax0zQVeDmR70lRL/1kedl05YSWfjmpQlcRDNdZKBzPrX2/Dw7lo8Akwht/obOAKwSExQ5q+Gt4k=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr16234322oih.102.1533574396862; 
	Mon, 06 Aug 2018 09:53:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Mon, 6 Aug 2018 09:52:56 -0700 (PDT)
In-Reply-To: <1533565018-19188-1-git-send-email-maksym.kokhan@globallogic.com>
References: <a80f3bf9-abba-fd2c-b1b9-d2327de69f78@intel.com>
	<1533565018-19188-1-git-send-email-maksym.kokhan@globallogic.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Aug 2018 17:52:56 +0100
Message-ID: <CAJTo0LZJyJneBza8cg3pUTUd04vQ+k270RYAdfrB+j11feCkuA@mail.gmail.com>
To: Maksym Kokhan <maksym.kokhan@globallogic.com>
Cc: Ruslan Bilovol <ruslan.bilovol@globallogic.com>,
	Andrii Bordunov <andrii.bordunov@globallogic.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libusb: Add ptest
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
X-List-Received-Date: Mon, 06 Aug 2018 16:53:16 -0000
Content-Type: text/plain; charset="UTF-8"

The upgrade to libusb 1.0.22 happened in *May* so please do try and
keep up to date with master.  In this case git did managed to merge
anyway, but generally that won't be true.

Ross

On 6 August 2018 at 15:16, Maksym Kokhan via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
> The run-ptest script was added to run existing libusb1 tests and libusb1
> recipe was changed to add ptest support to that package.
>
> Signed-off-by: Maksym Kokhan <maksym.kokhan@globallogic.com>
> Reviewed-by: Andrii Bordunov <andrii.bordunov@globallogic.com>
> ---
>  meta/recipes-support/libusb/libusb1/run-ptest | 15 +++++++++++++++
>  meta/recipes-support/libusb/libusb1_1.0.21.bb | 11 ++++++++++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100755 meta/recipes-support/libusb/libusb1/run-ptest
>
> diff --git a/meta/recipes-support/libusb/libusb1/run-ptest b/meta/recipes-support/libusb/libusb1/run-ptest
> new file mode 100755
> index 0000000..646a966
> --- /dev/null
> +++ b/meta/recipes-support/libusb/libusb1/run-ptest
> @@ -0,0 +1,15 @@
> +#!/bin/sh
> +
> +echo
> +echo "---------------------------- libusb1 tests ---------------------------"
> +echo
> +
> +./stress | tr '\n' ' '  | \
> +sed 's/Starting test run: \([a-zA-Z_]*\)\.\.\. \([a-zA-Z_]*\) (.) /\2 \1\n/g' | \
> +sed '$d' | \
> +sed '{
> +       s/^Success/PASS:/g
> +       s/^Failure/FAIL:/g
> +       s/^Error/FAIL:/g
> +       s/^Skip/SKIP:/g
> +}'
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.21.bb b/meta/recipes-support/libusb/libusb1_1.0.21.bb
> index 1fefd14..56822a6 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.21.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.21.bb
> @@ -10,6 +10,7 @@ BBCLASSEXTEND = "native nativesdk"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>             file://no-dll.patch \
> +           file://run-ptest \
>            "
>
>  SRC_URI[md5sum] = "1da9ea3c27b3858fa85c5f4466003e44"
> @@ -17,7 +18,7 @@ SRC_URI[sha256sum] = "7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66
>
>  S = "${WORKDIR}/libusb-${PV}"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  # Don't configure udev by default since it will cause a circular
>  # dependecy with udev package, which depends on libusb
> @@ -30,6 +31,14 @@ do_install_append() {
>         fi
>  }
>
> +do_compile_ptest() {
> +    oe_runmake -C tests stress
> +}
> +
> +do_install_ptest() {
> +    install -m 755 ${B}/tests/.libs/stress ${D}${PTEST_PATH}
> +}
> +
>  FILES_${PN} += "${base_libdir}/*.so.*"
>
>  FILES_${PN}-dev += "${base_libdir}/*.so ${base_libdir}/*.la"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

