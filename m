Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 283157EDF5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:57:39 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d17so35849326qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=upOorgqcHsWCxoh5/ASLw9b3brXj4nA2JqTWcGmzTuI=;
	b=SF6Z/W+PesMyT2RxJ+h5UDzeI4r4KvBTEcGYCIc3zeyrdLOqu4oi3xk7ACjISxXA7O
	wtZ7nlYFupF/w+60xfv2VjeqiYyM8YX5yNELmDzI8u8x68k5LyeTaye6zEIPgUCgWHI3
	PsgRdgnSI9NpcLa5zadNrNGOJjJgIShM7KWbKZTi3AtxcIHjG1YLIzZ8PY9pxWCVLuS/
	ptOaPQ8nqU2CZzJHWixA0sqMtHy6fTi01DxLxpjfhPUiWRX0LxL9BNZSvW2MqdPCdjFX
	BMtB+xmrF6zudwoJ5vfUddDfsXwFwLJOkRwmus9qZLetMVuoqmQC6LSHKKFrG1e4Pi0N
	kY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=upOorgqcHsWCxoh5/ASLw9b3brXj4nA2JqTWcGmzTuI=;
	b=Jm7A543+jixbltJNjssD08YivdaxXBXoDWXGl4j+dU8eOyalhLzFPIx8lxeHjTypPI
	yA1Q/5eUgmfJZxmXKYZdCDm0TMVIgXmZCCyk7PCzbj4jfCBeVfq/jwJX0Z0MvMPSn3IT
	CsD/c3eEx1TppuRHUbQBPCnNF3FtIkuA2LGRAPiDBhBNQ/T3eDUxuYWF9tZAfEaA9yBy
	Rp9+fmzRo1h6DXvXU5DpTQMeZbNQfGNJ8+5mD0pyf5YVx19wcyPKYKHtuHSE5F+aJxSZ
	/QCAiyoA/gr2BO1rzdfjxh77mcBIWmKdX6mfbo6Q2f9uW5vQtTE5JR7od4/q/V2Q45kO
	0xyA==
X-Gm-Message-State: APjAAAWi5a78LE0bJw6LFjs8aBDJ2w67pppZJVoNHNhvrqTvN0hDF0xw
	uSgbh7tVQ++Rl7bbrp2oqelai+OHRv/5d1xN9wo=
X-Google-Smtp-Source: APXvYqxTRq3NWmtO0kDWv7t4Er0FgSFR/S2iqri7wMy+96JcsWaNlXAgR1P3u/KT/o52wH2e13gYyNEwMaPhZQJ1Fnw=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr47861190qvg.181.1563721060659;
	Sun, 21 Jul 2019 07:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1563719003.git.akuster808@gmail.com>
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Jul 2019 07:57:14 -0700
Message-ID: <CAMKF1srqEDR0PDxSDO+Pu=uv-31ZQ-gpM+FbnBXBRvjUOSE8Ww@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud] 00/30] Platch review for thud-next
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
X-List-Received-Date: Sun, 21 Jul 2019 14:57:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 21, 2019 at 7:25 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Comments regarding this patch series due by Wednesday.
>
> The following changes since commit f162d5bfe6eaeca24f441c83c87252c8d05744fc:
>
>   core-image-sato-sdk-ptest: Tweak size to stay within 4GB limit (2019-05-17 22:05:59 -0700)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/thud-nmut
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/thud-nmut
>
> Armin Kuster (16):
>   glibc: Security fix CVE-2019-9169
>   elfutils: Security fixes  CVE-2019-7146,7149,7150
>   qemu: Several CVE fixes
>   python: Update to 2.7.16
>   busybox: Security fixes for CVE-2018-20679 CVE-2019-5747
>   sqlite3: Security fixes for CVE-2018-20505 & 20506
>   file: Multiple Secruity fixes
>   go: update to minor update 1.11.10
>   qemu: Security fix for CVE-2018-19489
>   Tar: Security fix CVE-2019-0023
>   glib-2.0: Security fix for CVE-2019-12450
>   wget: Security fix for CVE-2019-5953
>   Curl: Securiyt fix CVE-2019-5435 CVE-2019-5436
>   qemu: Security fix for CVE-2019-12155
>   qemu: Security fixes CVE-2018-20815 CVE-2019-9824
>   glib: Security fix for CVE-2019-9633
>
> Chen Qi (2):
>   cups: upgrade to 2.2.9
>   cups: upgrade to 2.2.10
>
> Hongxu Jia (1):
>   go-target.inc: fix go not found while multilib enabled
>
> Joshua DeWeese (1):
>   wpa_supplicant: Changed systemd template units
>
> Khem Raj (1):
>   go: Upgrade 1.11.1 -> 1.11.4 minor release
>
> Martin Jansa (1):
>   python: add a fix for CVE-2019-9948 and CVE-2019-9636
>
> Richard Purdie (4):
>   go-crosssdk: PN should use SDK_SYS, not TARGET_ARCH
>   yocto-uninative: Update to 2.5 release
>   uninative: Switch from bz2 to xz
>   uninative: Update to 2.6 release
>
> Robert Yang (1):
>   uboot-sign.bbclass: Remove tab indentations in python code
>
> Ross Burton (3):
>   cairo: fix CVE-2018-19876 CVE-2019-6461 CVE-2019-6462
>   lighttpd: fix CVE-2019-11072
>   glibc: backport CVE fixes
>

Looks fine to me


>  meta/classes/uboot-sign.bbclass                    |  20 +-
>  meta/classes/uninative.bbclass                     |   4 +-
>  meta/conf/distro/include/yocto-uninative.inc       |   8 +-
>  ...place-systemd-install-Alias-with-WantedBy.patch |  52 ++++
>  .../wpa-supplicant/wpa-supplicant_2.6.bb           |   1 +
>  .../busybox/busybox/CVE-2018-20679.patch           | 142 +++++++++
>  .../busybox/busybox/CVE-2019-5747.patch            |  60 ++++
>  meta/recipes-core/busybox/busybox_1.29.3.bb        |   2 +
>  .../glib-2.0/glib-2.0/CVE-2019-12450.patch         |  59 ++++
>  .../glib-2.0/glib-2.0/CVE-2019-9633_p1.patch       | 316 +++++++++++++++++++++
>  .../glib-2.0/glib-2.0/CVE-2019-9633_p2.patch       | 231 +++++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.58.0.bb      |   3 +
>  meta/recipes-core/glibc/glibc/CVE-2016-10739.patch | 232 +++++++++++++++
>  meta/recipes-core/glibc/glibc/CVE-2018-19591.patch |  48 ++++
>  meta/recipes-core/glibc/glibc/CVE-2019-9169.patch  |  63 ++++
>  meta/recipes-core/glibc/glibc_2.28.bb              |   3 +
>  meta/recipes-devtools/elfutils/elfutils_0.175.bb   |   4 +
>  .../elfutils/files/CVE-2019-7146_p1.patch          |  52 ++++
>  .../elfutils/files/CVE-2019-7146_p2.patch          |  65 +++++
>  .../elfutils/files/CVE-2019-7149.patch             | 148 ++++++++++
>  .../elfutils/files/CVE-2019-7150.patch             |  51 ++++
>  .../recipes-devtools/file/file/CVE-2019-8904.patch |  30 ++
>  .../file/file/CVE-2019-8905_CVE-2019-8907.patch    | 120 ++++++++
>  .../recipes-devtools/file/file/CVE-2019-8906.patch |  27 ++
>  meta/recipes-devtools/file/file_5.34.bb            |   3 +
>  meta/recipes-devtools/go/go-1.11.inc               |   7 +-
>  ...07-cmd-go-make-GOROOT-precious-by-default.patch |   6 +-
>  .../0008-use-GOBUILDMODE-to-set-buildmode.patch    |  13 +-
>  meta/recipes-devtools/go/go-crosssdk.inc           |   2 +-
>  meta/recipes-devtools/go/go-target.inc             |   2 +-
>  ...on-native_2.7.15.bb => python-native_2.7.16.bb} |   2 -
>  meta/recipes-devtools/python/python.inc            |  18 +-
>  ...23-Use-XML_SetHashSalt-in-_elementtree-GH.patch |  96 -------
>  ...ix-test_ssl-when-a-filename-cannot-be-enc.patch |  55 ----
>  ...LS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch | 120 --------
>  ...34540-Convert-shutil._call_external_zip-t.patch |  67 -----
>  ...dd-missing-closing-wrapper-in-test_tls1_3.patch |  37 ---
>  ...ix-test_ssl.test_options-to-account-for-O.patch |  37 ---
>  ...ix-test_default_ecdh_curve-needs-no-tlsv1.patch |  34 ---
>  .../python/bpo-35907-cve-2019-9948-fix.patch       |  55 ++++
>  .../python/python/bpo-35907-cve-2019-9948.patch    |  55 ++++
>  .../python/bpo-36216-cve-2019-9636-fix.patch       |  28 ++
>  .../python/python/bpo-36216-cve-2019-9636.patch    | 111 ++++++++
>  .../python/{python_2.7.15.bb => python_2.7.16.bb}  |   6 +-
>  .../qemu/qemu/CVE-2018-16867.patch                 |  49 ++++
>  .../qemu/qemu/CVE-2018-16872.patch                 |  89 ++++++
>  .../qemu/qemu/CVE-2018-18849.patch                 |  86 ++++++
>  .../qemu/qemu/CVE-2018-19364_p1.patch              |  51 ++++
>  .../qemu/qemu/CVE-2018-19364_p2.patch              | 115 ++++++++
>  .../qemu/qemu/CVE-2018-19489.patch                 |  83 ++++++
>  .../qemu/qemu/CVE-2018-20815_p1.patch              |  42 +++
>  .../qemu/qemu/CVE-2018-20815_p2.patch              |  52 ++++
>  .../qemu/qemu/CVE-2019-12155.patch                 |  38 +++
>  .../recipes-devtools/qemu/qemu/CVE-2019-9824.patch |  47 +++
>  meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  10 +
>  .../0001-don-t-try-to-run-generated-binaries.patch |  29 +-
>  .../cups/{cups_2.2.8.bb => cups_2.2.10.bb}         |   4 +-
>  .../lighttpd/lighttpd/fix-http-parseopts.patch     |  51 ++++
>  meta/recipes-extended/lighttpd/lighttpd_1.4.51.bb  |   1 +
>  meta/recipes-extended/tar/tar/CVE-2019-9923.patch  |  38 +++
>  meta/recipes-extended/tar/tar_1.30.bb              |   1 +
>  .../recipes-extended/wget/wget/CVE-2019-5953.patch |  51 ++++
>  meta/recipes-extended/wget/wget_1.19.5.bb          |   1 +
>  .../cairo/cairo/CVE-2019-6461.patch                |  19 ++
>  .../cairo/cairo/CVE-2019-6462.patch                |  20 ++
>  meta/recipes-graphics/cairo/cairo_1.14.12.bb       |   2 +
>  meta/recipes-support/curl/curl/CVE-2019-5435.patch | 200 +++++++++++++
>  meta/recipes-support/curl/curl/CVE-2019-5436.patch |  32 +++
>  meta/recipes-support/curl/curl_7.61.0.bb           |   2 +
>  .../sqlite/files/CVE-2018-20505.patch              |  31 ++
>  .../sqlite/files/CVE-2018-20506.patch              | 103 +++++++
>  meta/recipes-support/sqlite/sqlite3_3.23.1.bb      |   2 +
>  72 files changed, 3233 insertions(+), 511 deletions(-)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-replace-systemd-install-Alias-with-WantedBy.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2018-20679.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2019-5747.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-12450.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p1.patch
>  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-9633_p2.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2016-10739.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2018-19591.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-9169.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7146_p1.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7146_p2.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7149.patch
>  create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2019-7150.patch
>  create mode 100644 meta/recipes-devtools/file/file/CVE-2019-8904.patch
>  create mode 100644 meta/recipes-devtools/file/file/CVE-2019-8905_CVE-2019-8907.patch
>  create mode 100644 meta/recipes-devtools/file/file/CVE-2019-8906.patch
>  rename meta/recipes-devtools/python/{python-native_2.7.15.bb => python-native_2.7.16.bb} (96%)
>  delete mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
>  delete mode 100644 meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
>  create mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948-fix.patch
>  create mode 100644 meta/recipes-devtools/python/python/bpo-35907-cve-2019-9948.patch
>  create mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636-fix.patch
>  create mode 100644 meta/recipes-devtools/python/python/bpo-36216-cve-2019-9636.patch
>  rename meta/recipes-devtools/python/{python_2.7.15.bb => python_2.7.16.bb} (98%)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-16867.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-16872.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-18849.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p1.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-19364_p2.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-19489.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p1.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-20815_p2.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12155.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-9824.patch
>  rename meta/recipes-extended/cups/{cups_2.2.8.bb => cups_2.2.10.bb} (40%)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/fix-http-parseopts.patch
>  create mode 100644 meta/recipes-extended/tar/tar/CVE-2019-9923.patch
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2019-5953.patch
>  create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6461.patch
>  create mode 100644 meta/recipes-graphics/cairo/cairo/CVE-2019-6462.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5435.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5436.patch
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2018-20505.patch
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2018-20506.patch
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

