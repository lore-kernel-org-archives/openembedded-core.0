Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A171D7BD64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 20:40:08 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id p197so3693097itp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1cC7Afpdej8/qMmejM5cx5x4BKBeErszWJ8tRIiP7to=;
	b=xFoZNpECzb6rUo4efzxSZwPl42S8MjJiFBymLBs0ZuFPNxEbfMRGzEDg/MezKhV7xS
	ufh77H0yJ+tZB7X4aRpSlP/e8tbZdrNcyVkSdx5iRWNUPWy95c+g9gmFn+NFepOWloT+
	7mv4HtI0ly+jdks1TrtfXXH2HRT9rcDAIn0P/IcvqvVIOiGj6+Nl4jPS5uPiv7hMqoqE
	DjXRJDy/4Gmo3QDbVGnE0/cS7m3pknTHjS3KA0qsA9bEVMYHhCiExasFcy1hl5clEtWl
	q7k4kPMmgRF8fqBJDSoI6KQ093WD5bYYPrZnSgD7wOcQdnB03NzDifOrBQIzfKA9zuYc
	VLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1cC7Afpdej8/qMmejM5cx5x4BKBeErszWJ8tRIiP7to=;
	b=p8JKkw3Dgn/l0Zd+tHR5cMEc3CSLnES9T0ZEabLvIyuA/NOEJK+pYM/+QFOVIVn7uY
	t2lGq0GX/V/iWBaqQEtuwSkDfsDU2FWz8Egsr57R8pb+jaeD4wAljvG0LKAAYRCbTcjm
	woXtkoEFPXOnMpKjitZFWChgqQdeHazrC5zsrdB3Vi0F6BTlXkaLr0d6x1o/H5iF/z+i
	dhQyCBjniVklRRKDDnBYcp3YXXegkIQtuLsYO9Oc24s7+na/XRkfzlj7MjCRq3CCQo+c
	/hChB1KblqVZOsEgIyb6QpVyId/0vu8Jxsi5rgEEb+YCTADSt7PrMOUtOSQ7FKERNNnT
	OHWg==
X-Gm-Message-State: AA+aEWbik184NbLiUgSWDurTjY4emRlPjVRHzstWe8edW+O2akE7Alx8
	9N6EbP5Wljbbf1AuqxPNRkAb+V1+VT7BAAo5enB93fSXz80=
X-Google-Smtp-Source: AFSGD/VlVdrtFziFg8/ULgYWU8ADX4fRFpZujSlQvf/HlHBx+4OlctgC2KwTXDJ6cKI7dlEXM5j3qlwhE1S8wIVR2ys=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr166007ite.26.1545338409495;
	Thu, 20 Dec 2018 12:40:09 -0800 (PST)
MIME-Version: 1.0
References: <20181220054044.29476-1-douglas.royds@taitradio.com>
	<CAJTo0LZ+9K+AbMeWb5PV_0bmivHcv+2JAXtuA2ZxKJMsaL=Tbg@mail.gmail.com>
	<150da13c-a7d6-c6c1-c623-5acba13904df@taitradio.com>
	<CAJTo0Lb6rpmOjJt_kmFr9c3CEnxV_b5nRFjgq52ZvqgfPFUn7A@mail.gmail.com>
In-Reply-To: <CAJTo0Lb6rpmOjJt_kmFr9c3CEnxV_b5nRFjgq52ZvqgfPFUn7A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 20:39:57 +0000
Message-ID: <CAJTo0LYp27adY9QDO90WMRUTC2uwvfXkP-c=aVqzo-d+D6H4EQ@mail.gmail.com>
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 20:40:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 20:37, Burton, Ross <ross.burton@intel.com> wrote:
> > I haven't come across any other cases of a patch creating a file, but if
> > there are, then we could certainly move this setting. Perhaps we should
> > wait until others emerge.
>
> I definitely wouldn't want to make the assumption that libpam is the
> only recipe of all time that will create a file.

Quick grep for chunks that have /dev/null as the input, so are creating files:

$ git grep -l -- '--- /dev/null'
recipes-bsp/keymaps/files/GPLv2.patch
recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch
recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.patch
recipes-connectivity/openssl/openssl10/debian1.0.2/version-script.patch
recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch
recipes-core/glibc/glibc/0006-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
recipes-core/glibc/glibc/0018-eglibc-Cross-building-and-testing-instructions.patch
recipes-core/glibc/glibc/0019-eglibc-Help-bootstrap-cross-toolchain.patch
recipes-core/glibc/glibc/0022-eglibc-Forward-port-cross-locale-generation-support.patch
recipes-core/initscripts/initscripts-1.0/GPLv2.patch
recipes-core/ovmf/ovmf/0007-OvmfPkg-EnrollDefaultKeys-application-for-enrolling-.patch
recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
recipes-core/udev/eudev/0014-Revert-rules-remove-firmware-loading-rules.patch
recipes-core/udev/eudev/Revert-udev-remove-userspace-firmware-loading-suppor.patch
recipes-devtools/build-compare/files/Rename-rpm-check.sh-to-pkg-diff.sh.patch
recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
recipes-devtools/elfutils/files/debian/arm_backend.diff
recipes-devtools/elfutils/files/debian/hppa_backend.diff
recipes-devtools/elfutils/files/debian/mips_backend.diff
recipes-devtools/go/go-dep/0001-Add-support-for-mips-mips64.patch
recipes-devtools/patch/patch/0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
recipes-devtools/python/python/float-endian.patch
recipes-devtools/python/python3-iniparse/0001-Add-python-3-compatibility.patch
recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
recipes-devtools/python/python3/float-endian.patch
recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
recipes-devtools/syslinux/syslinux/0006-linux-syslinux-implement-write_to_ext-and-add-syslin.patch
recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
recipes-extended/libaio/libaio/00_arches.patch
recipes-extended/libsolv/libsolv/0001-Add-fallback-fopencookie-implementation.patch
recipes-extended/ltp/ltp/0001-syscalls-fcntl-make-OFD-command-use-fcntl64-syscall-.patch
recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
recipes-extended/pam/libpam/pam-security-abstract-securetty-handling.patch
recipes-extended/slang/slang/terminfo_fixes.patch
recipes-gnome/gdk-pixbuf/gdk-pixbuf/extending-libinstall-dependencies.patch
recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
recipes-graphics/mesa/mesa-demos/0001-mesa-demos-Add-missing-data-files.patch
recipes-graphics/wayland/weston/0001-make-error-portable.patch
recipes-graphics/x11-common/xserver-nodm-init/gplv2-license.patch
recipes-graphics/xorg-lib/libx11/X18NCMSstubs.patch
recipes-kernel/modutils-initscripts/files/PD.patch
recipes-multimedia/libid3tag/libid3tag/addpkgconfig.patch
recipes-support/attr/attr/attr-Missing-configure.ac.patch
recipes-support/gpgme/gpgme/0001-pkgconfig.patch
recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-support.patch
recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch
recipes-support/libgcrypt/files/0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch
recipes-support/libxslt/libxslt/fix-rvts-handling.patch
recipes-support/npth/npth/pkgconfig.patch

Ross

