Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 82B047FD3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 21:43:34 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r18so55528edl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 13:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fmewGOEQ1VEtf6aaotNrO+eYz5CzG1p6i2YtvD9nQgM=;
	b=pKg4LS48D6x3sZ3XkA+FPAV96odf70Qav/SHRt+jVsAiio5z3UNVPobsfQkwjOf67n
	aIoRjP0GUqoxuRuxnxYK006hHXyaL0zYoyxh/cYrrnNL3NzqmYc13jZznmBLkYsoW+tA
	O5Rrh5Pt9+qJmZcAgLfZCEcP/4R6AP9ESEGQk8Fp2Q2L1XSItU8R4J+kbJIF4+IsqrK3
	LyFqiOXcy7sGvNAqGDuP4qfu/46CFc7X9eYweXDr0sH9tbFqMR/gVpXffe6iUMDVfKzn
	3lwuZXRJQorkejHzhrQHqWjlkbDvKrqRIhcnLATlLOMOaZ7QRhjSv3HSTNoJINZRRFXS
	stoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fmewGOEQ1VEtf6aaotNrO+eYz5CzG1p6i2YtvD9nQgM=;
	b=j1UtOGmoJ2HZPO8EWXHOFwcGOk9B9Qep8xoN+JtGnt+ocihBiFwpwUp/vh1Teoo1Sn
	lW02v8qRIqwebopWBs4Vl0iPIPr7KleCCXa5K6OhCBcxCDBGMRrRC9y9wCevr7eLKox5
	/7j5ZhhEw8W8whpPamnU6wMVq88x0SYy4d8xl8pKleeiajjyWvQm7H3PSm4X5ylWzZHV
	xJPNIkAhVHBEhlcq4KRxQtB3Qvew8fNPaJqkoxdD6pdyU6io56ok6ZPAunfWmRWGFH3K
	RVlsGZtCc5jkrfa/3C09kKHGs5M7BgyL/ZvEpvm4h0DvlTo9/aN8a0I01RvJjWF50mjW
	SpDw==
X-Gm-Message-State: APjAAAWOryW4pHFqlgubf5J98r+IGQUsGmvD8RHsm0vtE09ZXR5vYENg
	NrvyVE/KL/WdmywlQhQKiEKrqlO0eU3cw/tYbio=
X-Google-Smtp-Source: APXvYqycS500RuAz23+cq5xMgAyqx0tZ72t96PZhNd5G1PJ12HUwjD7UN4vT7ufKQkVDUABZCh8kGVy34IVot2O1vno=
X-Received: by 2002:a17:906:f49:: with SMTP id h9mr136953ejj.6.1579815814998; 
	Thu, 23 Jan 2020 13:43:34 -0800 (PST)
MIME-Version: 1.0
References: <1579813185-1950-1-git-send-email-denis@denix.org>
In-Reply-To: <1579813185-1950-1-git-send-email-denis@denix.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Jan 2020 16:43:23 -0500
Message-ID: <CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>, Jon Mason <jdmason@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 21:43:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> To avoid duplicating efforts of adding very similar recipes to BSP layers,
> add an upstream reference implementation to openembedded-core, which can be
> customized by BSPs, if needed.

Isn't this one of the things that Jon Mason is trying to
standardize/support in meta-arm ?

http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a

What's the delta between the two ?

Bruce

>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  .../arm-trusted-firmware_2.2.bb                    | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
>
> diff --git a/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> new file mode 100644
> index 0000000..3079a70
> --- /dev/null
> +++ b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> @@ -0,0 +1,55 @@
> +SUMMARY = "ARM Trusted Firmware"
> +DESCRIPTION = "ARM Trusted Firmware provides a reference implementation of \
> +Secure World software for ARMv8-A, including Exception Level 3 (EL3) software. \
> +It provides implementations of various ARM interface standards such as the \
> +Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
> +(TBBR) and Secure monitor code."
> +HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> +
> +inherit deploy
> +
> +DEPENDS = "dtc-native openssl-native"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +B = "${WORKDIR}/build"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=http;branch=${BRANCH}"
> +SRCREV = "a04808c16cfc126d9fe572ae7c4b5a3d39de5796"
> +
> +ATF_BINARY ??= "bl31"
> +ATF_SUFFIX ??= "bin"
> +ATF_TARGET ??= "all"
> +
> +CFLAGS[unexport] = "1"
> +LDFLAGS[unexport] = "1"
> +AS[unexport] = "1"
> +LD[unexport] = "1"
> +
> +do_configure[noexec] = "1"
> +
> +EXTRA_OEMAKE = '-C ${S} BUILD_BASE=${B} DEBUG=0 CROSS_COMPILE="${TARGET_PREFIX}" \
> +               PLAT="${ATF_PLATFORM}" TARGET_BOARD="${ATF_BOARD}" ${PACKAGECONFIG_CONFARGS}'
> +
> +do_compile() {
> +       oe_runmake ${ATF_TARGET}
> +}
> +
> +do_install() {
> +       install -d ${D}/boot
> +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${D}/boot/
> +}
> +
> +do_deploy() {
> +       install -d ${DEPLOYDIR}
> +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${DEPLOYDIR}/
> +}
> +addtask deploy before do_build after do_compile
> +
> +FILES_${PN} = "/boot"
> +SYSROOT_DIRS += "/boot"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

