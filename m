Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 95F0E73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 19:32:11 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so34823601wic.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 12:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1BjspjQ2zKAHjrerbfwaJaYFL0d+axRRTgjsW32Sz1g=;
	b=N9T5eCGvZK8JlfH22ZaW/bpkhH+CqW3MGBDKLWvMncszd7xAZTZd3RMibZGux914St
	cmlbIpp08JvC7O4b0Y8z5Gp43kBYogciJ6EO2Pr5Fv2ywvlY6Kq5uqSFStvoi9Yxfj5D
	Z/h6C4xZ0L5LPsBEsqnE2xo3AV4ecYK91kllN1aIjdsRAq+DH24pYeE4PmK4YC+q0KmR
	lRRBa0rmxuVrcKnQKongKXoaaYTDnHxN8zbIeXHre7/bGplBnlw+M7olic6XSECEIqBi
	7p5UFydSxhPK+3996QGyD1Rse247rPfEfGmA8/pMq0K+bJO4daR5fB8Iph9UVHMvMM88
	BlZg==
X-Received: by 10.194.10.165 with SMTP id j5mr77277672wjb.147.1441913531604;
	Thu, 10 Sep 2015 12:32:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	s16sm10846415wik.13.2015.09.10.12.32.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Sep 2015 12:32:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Sep 2015 21:33:10 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20150910193310.GE2387@jama>
References: <1441912203-27833-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1441912203-27833-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] meta: Fix Upstream-Status statements
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
X-List-Received-Date: Thu, 10 Sep 2015 19:32:13 -0000
X-Groupsio-MsgNum: 70987
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2015 at 08:10:03PM +0100, Ross Burton wrote:
> Fix a variety of problems such as typos, bad punctuations, or incorrect
> Upstream-Status values.

There are at least 2 cases where SOB line is added, why?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../files/0001-Unset-need_charset_alias-when-building-for-musl.patch   |=
 2 +-
>  meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch               |=
 2 +-
>  meta/recipes-bsp/setserial/setserial/ldflags.patch                     |=
 2 +-
>  .../bind/bind-ensure-searching-for-json-headers-searches-sysr.patch    |=
 2 +-
>  .../0001-Removed-icon-from-connman-gnome-about-applet.patch            |=
 2 +-
>  meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch   |=
 2 +-
>  .../iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch  |=
 2 +-
>  .../libpcap/libpcap/libpcap-pkgconfig-support.patch                    |=
 2 +-
>  .../nfs-utils/files/nfs-utils-debianize-start-statd.patch              |=
 2 +-
>  meta/recipes-core/base-passwd/base-passwd/input.patch                  |=
 2 +-
>  meta/recipes-core/base-passwd/base-passwd/nobash.patch                 |=
 2 +-
>  meta/recipes-core/base-passwd/base-passwd/noshadow.patch               |=
 2 +-
>  meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch       |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  meta/recipes-core/dbus/dbus/os-test.patch                              |=
 2 +-
>  .../ldconfig-native-2.12.1/add-64-bit-flag-for-ELF64-entries.patch     |=
 2 +-
>  meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch          |=
 3 +--
>  meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch                  |=
 2 +-
>  meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch         |=
 2 +-
>  .../bison/0001-Unset-need_charset_alias-when-building-for-musl.patch   |=
 2 +-
>  .../0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch    |=
 2 +-
>  .../e2fsprogs/e2fsprogs/0012-Fix-musl-build-failures.patch             |=
 2 +-
>  meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch             |=
 2 +-
>  .../misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch        |=
 2 +-
>  meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch      |=
 2 +-
>  .../gcc-4.9/0054-gcc-Makefile.in-fix-parallel-building-failure.patch   |=
 2 +-
>  meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch               |=
 2 +-
>  .../gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-63348.patch               |=
 2 +-
>  .../m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch   |=
 2 +-
>  meta/recipes-devtools/mklibs/files/fix_cross_compile.patch             |=
 2 +-
>  .../mklibs/files/show-GNU-unique-symbols-as-provided-symbols.patch     |=
 2 +-
>  meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch                |=
 2 +-
>  .../patch/0001-Unset-need_charset_alias-when-building-for-musl.patch   |=
 2 +-
>  .../perl/perl/test/dist-threads-t-join.t-adjust-ps-option.patch        |=
 2 +-
>  .../test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch    |=
 2 +-
>  meta/recipes-devtools/python/python/setuptweaks.patch                  |=
 2 +-
>  meta/recipes-devtools/python/python3/setuptweaks.patch                 |=
 2 +-
>  meta/recipes-devtools/rpm/rpm/dbconvert.patch                          |=
 3 ++-
>  meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch                     |=
 2 +-
>  meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch                   |=
 2 +-
>  meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch                     |=
 2 +-
>  .../rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch |=
 2 +-
>  .../strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch             |=
 2 +-
>  .../valgrind/valgrind/pass-maltivec-only-if-it-supported.patch         |=
 2 +-
>  .../configure.in-drop-the-test-of-xmllint-and-xsltproc.patch           |=
 2 +-
>  .../augeas/0001-Unset-need_charset_alias-when-building-for-musl.patch  |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  .../grep/0001-Unset-need_charset_alias-when-building-for-musl.patch    |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.patch |=
 2 +-
>  .../0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch     |=
 2 +-
>  .../0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch    |=
 2 +-
>  .../files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch |=
 2 +-
>  .../mailx/files/0011-outof-Introduce-expandaddr-flag.patch             |=
 2 +-
>  .../0012-unpack-Disable-option-processing-for-email-addresses.patch    |=
 2 +-
>  .../files/0013-fio.c-Unconditionally-require-wordexp-support.patch     |=
 2 +-
>  .../mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch     |=
 2 +-
>  meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch         |=
 2 +-
>  .../recipes-extended/mailx/files/explicitly.disable.krb5.support.patch |=
 2 +-
>  meta/recipes-extended/mc/mc/mc-CTRL.patch                              |=
 2 +-
>  .../files/0001-Unset-need_charset_alias-when-building-for-musl.patch   |=
 2 +-
>  .../psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch              |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  .../slang/slang/sprintf-bug-concerning-8-bit-characters.patch          |=
 3 ++-
>  meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch         |=
 2 +-
>  .../recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch |=
 2 +-
>  meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch  |=
 2 +-
>  .../texinfo/0001-Unset-need_charset_alias-when-building-for-musl.patch |=
 2 +-
>  .../wget/0001-Unset-need_charset_alias-when-building-for-musl.patch    |=
 2 +-
>  .../xdg-utils/xdg-utils/0001-Reinstate-xdg-terminal.patch              |=
 2 +-
>  .../clutter/clutter-1.0/run-installed-tests-with-tap-output.patch      |=
 2 +-
>  .../fontconfig/fontconfig/revert-static-pkgconfig.patch                |=
 2 +-
>  meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch      |=
 2 +-
>  .../libpfm/files/0001-Makefile-Add-LDFLAGS-variable-to-SLDFLAGS.patch  |=
 2 +-
>  .../trace-cmd/trace-cmd/blktrace-api-compatibility.patch               |=
 2 +-
>  .../do-not-change-eos-event-to-gap-event-if.patch                      |=
 2 +-
>  .../get-caps-from-src-pad-when-query-caps.patch                        |=
 2 +-
>  .../taglist-not-send-to-down-stream-if-all-the-frame-cor.patch         |=
 2 +-
>  .../0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch    |=
 2 +-
>  .../gstreamer1.0-plugins-good/decrease_asteriskh263_rank.patch         |=
 2 +-
>  .../0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch    |=
 2 +-
>  meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch                     |=
 2 +-
>  meta/recipes-support/gnupg/gnupg/pkgconfig.patch                       |=
 2 +-
>  meta/recipes-support/gpgme/gpgme/pkgconfig.patch                       |=
 2 +-
>  .../libassuan/libassuan/libassuan-add-pkgconfig-support.patch          |=
 2 +-
>  meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch       |=
 2 +-
>  .../libgcrypt/files/fix-ICE-failure-on-mips-with-option-O-and-g.patch  |=
 2 +-
>  meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch  |=
 2 +-
>  .../0001-Unset-need_charset_alias-when-building-for-musl.patch         |=
 2 +-
>  meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch                 |=
 2 +-
>  meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch                  |=
 2 +-
>  meta/recipes-support/npth/npth/pkgconfig.patch                         |=
 2 +-
>  94 files changed, 96 insertions(+), 95 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-wh=
en-building-for-musl.patch b/meta/recipes-bsp/grub/files/0001-Unset-need_ch=
arset_alias-when-building-for-musl.patch
> index 3706e6b..67dc115 100644
> --- a/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-buil=
ding-for-musl.patch
> +++ b/meta/recipes-bsp/grub/files/0001-Unset-need_charset_alias-when-buil=
ding-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch b/m=
eta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
> index c4655cf..3e99d0d 100644
> --- a/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
> +++ b/meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
> @@ -1,7 +1,7 @@
>  Obey LDFLAGS
> =20
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  --- hostap-utils-0.4.7.orig/Makefile
>  +++ hostap-utils-0.4.7/Makefile
> diff --git a/meta/recipes-bsp/setserial/setserial/ldflags.patch b/meta/re=
cipes-bsp/setserial/setserial/ldflags.patch
> index 4313d2c..174adc8 100644
> --- a/meta/recipes-bsp/setserial/setserial/ldflags.patch
> +++ b/meta/recipes-bsp/setserial/setserial/ldflags.patch
> @@ -1,7 +1,7 @@
>  Obey LDFLAGS
> =20
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  --- setserial-2.17.orig/Makefile.in
>  +++ setserial-2.17/Makefile.in
> diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-fo=
r-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bi=
nd-ensure-searching-for-json-headers-searches-sysr.patch
> index dedc437..13df3bb 100644
> --- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-=
headers-searches-sysr.patch
> +++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-=
headers-searches-sysr.patch
> @@ -25,7 +25,7 @@ to make use of the combination some day.
>  [1] https://trac.macports.org/ticket/45305
>  [2] https://trac.macports.org/changeset/126406
> =20
> -Upstream-status: Inappropriate [OE Specific]
> +Upstream-Status: Inappropriate [OE Specific]
>  Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>  ---
>   configure.in | 2 +-
> diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Removed=
-icon-from-connman-gnome-about-applet.patch b/meta/recipes-connectivity/con=
nman/connman-gnome/0001-Removed-icon-from-connman-gnome-about-applet.patch
> index 4f36b95..7957500 100644
> --- a/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-f=
rom-connman-gnome-about-applet.patch
> +++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Removed-icon-f=
rom-connman-gnome-about-applet.patch
> @@ -10,7 +10,7 @@ it was removed.
> =20
>  [OE-Core #2509]
> =20
> -Upstream-Status : Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
>  ---
> diff --git a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldfla=
gs.patch b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.p=
atch
> index 2cdd1ac..e95fe35 100644
> --- a/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
> +++ b/meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
> @@ -1,7 +1,7 @@
>  Obey LDFLAGS
> =20
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  --- irda-utils-0.9.18.orig/findchip/Makefile
>  +++ irda-utils-0.9.18/findchip/Makefile
> diff --git a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use=
-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw/0001-i=
w-version.sh-don-t-use-git-describe-for-versioning.patch
> index e64dd0a..a0a77b2 100644
> --- a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-de=
scribe-for-versioning.patch
> +++ b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-de=
scribe-for-versioning.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] iw: version.sh: don't use git describe f=
or versioning
> =20
>  It will detect top-level git repositories like the Angstrom setup-script=
s and break.
> =20
> -Upstream-Status: Unknown
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>  ---
> diff --git a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-=
support.patch b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig=
-support.patch
> index 9cfb9df..b861513 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support=
=2Epatch
> +++ b/meta/recipes-connectivity/libpcap/libpcap/libpcap-pkgconfig-support=
=2Epatch
> @@ -5,7 +5,7 @@ Subject: [PATCH] libpcap: pkgconfig support
> =20
>  Adding basic structure to support pkg-config.
> =20
> -Upstream-status: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
> =20
>  Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
>  ---
> diff --git a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianiz=
e-start-statd.patch b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-d=
ebianize-start-statd.patch
> index 5a2d5c8..8500229 100644
> --- a/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start=
-statd.patch
> +++ b/meta/recipes-connectivity/nfs-utils/files/nfs-utils-debianize-start=
-statd.patch
> @@ -1,6 +1,6 @@
>  [PATCH] nfs-utils: debianize start-statd
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  make start-statd command to use nfscommon configure, too.
> =20
> diff --git a/meta/recipes-core/base-passwd/base-passwd/input.patch b/meta=
/recipes-core/base-passwd/base-passwd/input.patch
> index f1bfc2f..3abbcad 100644
> --- a/meta/recipes-core/base-passwd/base-passwd/input.patch
> +++ b/meta/recipes-core/base-passwd/base-passwd/input.patch
> @@ -1,6 +1,6 @@
>  Add an input group for the /dev/input/* devices.
> =20
> -Upstream-Status: Invalid [configuration]
> +Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> =20
> diff --git a/meta/recipes-core/base-passwd/base-passwd/nobash.patch b/met=
a/recipes-core/base-passwd/base-passwd/nobash.patch
> index eed87db..b5a6922 100644
> --- a/meta/recipes-core/base-passwd/base-passwd/nobash.patch
> +++ b/meta/recipes-core/base-passwd/base-passwd/nobash.patch
> @@ -1,7 +1,7 @@
>  use /bin/sh instead of /bin/bash, since the latter may not be included in
>  some images such as minimal
> =20
> -Upstream-Status: Invalid [configuration]
> +Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> =20
> diff --git a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch b/m=
eta/recipes-core/base-passwd/base-passwd/noshadow.patch
> index e1cded6..e27bf7d 100644
> --- a/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
> +++ b/meta/recipes-core/base-passwd/base-passwd/noshadow.patch
> @@ -1,6 +1,6 @@
>  remove "*" for root since we don't have a /etc/shadow so far.
> =20
> -Upstream-Status: Invalid [configuration]
> +Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> =20
> diff --git a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.p=
atch b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
> index 781f5af..bda8685 100644
> --- a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
> +++ b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
> @@ -2,7 +2,7 @@ From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Sun, 3 Mar 2013 12:31:40 -0600
>  Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of n=
curses location
> =20
> -Upstream-status: Submitted=20
> +Upstream-Status: Submitted
> =20
>  [ based on: https://lkml.org/lkml/2013/3/3/103 ]
> =20
> diff --git a/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_c=
harset_alias-when-building-for-musl.patch b/meta/recipes-core/coreutils/cor=
eutils-8.24/0001-Unset-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_=
alias-when-building-for-musl.patch
> +++ b/meta/recipes-core/coreutils/coreutils-8.24/0001-Unset-need_charset_=
alias-when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-core/dbus/dbus/os-test.patch b/meta/recipes-cor=
e/dbus/dbus/os-test.patch
> index 79554b1..54c257f 100644
> --- a/meta/recipes-core/dbus/dbus/os-test.patch
> +++ b/meta/recipes-core/dbus/dbus/os-test.patch
> @@ -6,7 +6,7 @@ unconditionally as the oe-core initscript has a redhat-st=
yle pid file
>  path.
> =20
>  Signed-off-by: Andy Ross <andy.ross@windriver.com>
> -Upstream-Status: innappropriate [embedded]
> +Upstream-Status: Inappropriate [embedded]
> =20
>  diff -u a/configure.ac b/configure.ac
>  --- a/configure.ac	2012-08-28 11:23:43.040609874 -0700
> diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-fl=
ag-for-ELF64-entries.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1=
/add-64-bit-flag-for-ELF64-entries.patch
> index a0fabae..a9af110 100644
> --- a/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-=
ELF64-entries.patch
> +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/add-64-bit-flag-for-=
ELF64-entries.patch
> @@ -9,7 +9,7 @@ Due to this defect, ctypes.util.find_library() python fun=
ction fails to
>  detect any library due to the old file format that ldconfig-native
>  creates. This fix sets architecture-dependent 64bit flags for 64-bit ELF.
> =20
> -Upstream-status: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
> =20
>  Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
>  ---
> diff --git a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patc=
h b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
> index 548a241..593c46c 100644
> --- a/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
> +++ b/meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
> @@ -18,8 +18,7 @@ Ignore the argument and use a relative path instead.
> =20
> =20
>  Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
> -Upstream status pending
> -Upstream status Inappropriate (cross environment path)
> +Upstream-Status: Inappropriate (cross environment path)
> =20
>  diff -Naur udev-182.orig/src/keymap/95-keymap.rules udev-182/src/keymap/=
95-keymap.rules
>  --- udev-182.orig/src/keymap/95-keymap.rules	2012-02-07 00:01:55.1546407=
92 +0100
> diff --git a/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch b/meta=
/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
> index 650794f..19c40b7 100644
> --- a/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
> +++ b/meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
> @@ -1,7 +1,7 @@
>  Obey LDFLAGS for tests
> =20
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  --- zlib-1.2.8.orig/Makefile.in
>  +++ zlib-1.2.8/Makefile.in
> diff --git a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.pat=
ch b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
> index e5beaae..6108c0d 100644
> --- a/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
> +++ b/meta/recipes-devtools/binutils/binutils/binutils-octeon3.patch
> @@ -1,4 +1,4 @@
> -Upstream Status: Backport
> +Upstream-Status: Backport
> =20
>  https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dcommit;h=
=3D2c62985659da21a3fe16062d211a7158f79ad2e9
> =20
> diff --git a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_al=
ias-when-building-for-musl.patch b/meta/recipes-devtools/bison/bison/0001-U=
nset-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-whe=
n-building-for-musl.patch
> +++ b/meta/recipes-devtools/bison/bison/0001-Unset-need_charset_alias-whe=
n-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-re=
cent-change-related-to-zlib-in-n.patch b/meta/recipes-devtools/ccache/files=
/0001-Fix-regression-in-recent-change-related-to-zlib-in-n.patch
> index a8400d5..f5bd9aa 100644
> --- a/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-ch=
ange-related-to-zlib-in-n.patch
> +++ b/meta/recipes-devtools/ccache/files/0001-Fix-regression-in-recent-ch=
ange-related-to-zlib-in-n.patch
> @@ -14,7 +14,7 @@ prerequisite.
>  This fix is to revert 0220de9c8ebfb18caae2ac1aa163d060e98ceade and
>  instead make sure that LDFLAGS comes before extra_ldflags.
> =20
> -Upstream-status: Backport
> +Upstream-Status: Backport
>  ---
>   Makefile.in  |  2 +-
>   NEWS.txt     | 10 ++++++++++
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-buil=
d-failures.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-=
build-failures.patch
> index 2624f90..0b8008d 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failu=
res.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0012-Fix-musl-build-failu=
res.patch
> @@ -15,7 +15,7 @@ those are larger commits containing other changes not n=
eeded here.
> =20
>  Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> =20
> -Upstream-status: Backport
> +Upstream-Status: Backport
>  ---
>   lib/ext2fs/unix_io.c | 6 +++---
>   misc/create_inode.c  | 1 +
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch b=
/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
> index 03c0abc..d38cc4d 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-icache.patch
> @@ -16,7 +16,7 @@ cache[0]: cached ino 15 when bufsize =3D 156 by ext2fs_=
read_inode_full()
>  Then the ino 14 would hit the cache[1] when bufsize =3D 128 (but it was
>  cached by bufsize =3D 156), so there would be errors.
> =20
> -Upstream-Status: [Submitted]
> +Upstream-Status: Submitted
> =20
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-retu=
rn-error-when-failed-to-populate-fs.patch b/meta/recipes-devtools/e2fsprogs=
/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
> index 9b467c3..cba0ce0 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-erro=
r-when-failed-to-populate-fs.patch
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-erro=
r-when-failed-to-populate-fs.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] misc/mke2fs.c: return error when failed =
to populate filesystem
>  We need return retval when "mke2fs -d" failed, otherwise the "$?" would
>  be 0 which is misleading.
> =20
> -Upstream-Status Submitted
> +Upstream-Status: Submitted
> =20
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>  ---
> diff --git a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.=
patch b/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
> index 374cba5..f861e89 100644
> --- a/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
> +++ b/meta/recipes-devtools/elfutils/elfutils/Fix_elf_cvt_gunhash.patch
> @@ -1,6 +1,6 @@
>  Fix elf_cvt_gunhash if dest and src are same.
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  The 'dest' and 'src' can be same, we need to save the value of src32[2]
>  before swaping it.
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-p=
arallel-building-failure.patch b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc=
-Makefile.in-fix-parallel-building-failure.patch
> index 4c98ca2..7e8efa1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel=
-building-failure.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0054-gcc-Makefile.in-fix-parallel=
-building-failure.patch
> @@ -18,7 +18,7 @@ of gengtype).
>  [GCC #61899]
>  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61899
> =20
> -Upstream-Status: Send to gcc-patches@gcc.gnu.org mailing list
> +Upstream-Status: Submitted [gcc-patches@gcc.gnu.org]
> =20
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch b/m=
eta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
> index 4b312d4..d442ba8 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0058-gcc-r212171.patch
> @@ -11,7 +11,7 @@ Subject: [PATCH] r212171
> =20
>  git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212171 138bc75d-0d04-041=
0-961f-82ee72b054a4
> =20
> -Upstream-status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=3Drevisi=
on&revision=3D212171]
> +Upstream-Status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=3Drevisi=
on&revision=3D212171]
>  Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
>  ---
>   gcc/except.c |   23 ++++++++++++++++++-----
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimizati=
on-63348.patch b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimiza=
tion-63348.patch
> index 6d24aa4..de827cb 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-6334=
8.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0059-gcc-PR-rtl-optimization-6334=
8.patch
> @@ -11,7 +11,7 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D63348
> =20
>  git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@215613 138bc75d-0d04-041=
0-961f-82ee72b054a4
> =20
> -Upstream-status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=3Drevisi=
on&revision=3D215613]
> +Upstream-Status: Backport [https://gcc.gnu.org/viewcvs/gcc?view=3Drevisi=
on&revision=3D215613]
>  Signed-off-by: Baoshan Pang <baoshan.pang@windriver.com>
>  Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>  ---
> diff --git a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-wh=
en-building-for-musl.patch b/meta/recipes-devtools/m4/m4/0001-Unset-need_ch=
arset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-buil=
ding-for-musl.patch
> +++ b/meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-buil=
ding-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch b=
/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> index 7eb8659..13e4606 100644
> --- a/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> +++ b/meta/recipes-devtools/mklibs/files/fix_cross_compile.patch
> @@ -1,6 +1,6 @@
>  Remove dependency on dpkg
> =20
> -Upstream-Status Submitted
> +Upstream-Status: Submitted
> =20
>  Asking the host OS whether it supports multiarch is not useful
>  in a cross-compilation environment, or if the user has specified
> diff --git a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-a=
s-provided-symbols.patch b/meta/recipes-devtools/mklibs/files/show-GNU-uniq=
ue-symbols-as-provided-symbols.patch
> index 3f14ca1..bc56593 100644
> --- a/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provi=
ded-symbols.patch
> +++ b/meta/recipes-devtools/mklibs/files/show-GNU-unique-symbols-as-provi=
ded-symbols.patch
> @@ -3,7 +3,7 @@ From: Yuanjie Huang <yuanjie.huang@windriver.com>
>  Date: Wed, 15 Apr 2015 14:00:06 +0800
>  Subject: [PATCH] Show GNU unique symbols as provided symbols
> =20
> -Upstream-Status Submitted
> +Upstream-Status: Submitted
> =20
>  GNU Unique symbol is a GNU extension employed by new version of GCC
>  by default. Even Standard C++ library in GCC 4.9 provides some symbols,
> diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch b/me=
ta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
> index f4f0ef8..4dfc137 100644
> --- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
> +++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
> @@ -1,7 +1,7 @@
>  Obey LDFLAGS
> =20
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  --- uuid-1.6.2.orig/Makefile.in
>  +++ uuid-1.6.2/Makefile.in
> diff --git a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_al=
ias-when-building-for-musl.patch b/meta/recipes-devtools/patch/patch/0001-U=
nset-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-whe=
n-building-for-musl.patch
> +++ b/meta/recipes-devtools/patch/patch/0001-Unset-need_charset_alias-whe=
n-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-a=
djust-ps-option.patch b/meta/recipes-devtools/perl/perl/test/dist-threads-t=
-join.t-adjust-ps-option.patch
> index 08a6b0a..c8293c3 100644
> --- a/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-p=
s-option.patch
> +++ b/meta/recipes-devtools/perl/perl/test/dist-threads-t-join.t-adjust-p=
s-option.patch
> @@ -2,7 +2,7 @@ dist/threads/t/join.t: adjust ps option
> =20
>  The ps's option '-f' is not supported by busybox in oe.
> =20
> -Upstream-Status: [oe specific]
> +Upstream-Status: Inappropriate
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   dist/threads/t/join.t | 6 +++---
> diff --git a/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLo=
ader.t-fix-calling-dl_findfil.patch b/meta/recipes-devtools/perl/perl/test/=
ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch
> index 1ee818c..ce577fe 100644
> --- a/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-=
fix-calling-dl_findfil.patch
> +++ b/meta/recipes-devtools/perl/perl/test/ext-DynaLoader-t-DynaLoader.t-=
fix-calling-dl_findfil.patch
> @@ -2,7 +2,7 @@ ext/DynaLoader/t/DynaLoader.t: fix calling dl_findfile() =
failed
> =20
>  Use '$Config{libc}' as the libc file name
> =20
> -Upstream-Status: oe specific
> +Upstream-Status: Inappropriate
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   ext/DynaLoader/t/DynaLoader.t | 2 +-
> diff --git a/meta/recipes-devtools/python/python/setuptweaks.patch b/meta=
/recipes-devtools/python/python/setuptweaks.patch
> index c34ef16..3a91b19 100644
> --- a/meta/recipes-devtools/python/python/setuptweaks.patch
> +++ b/meta/recipes-devtools/python/python/setuptweaks.patch
> @@ -1,7 +1,7 @@
>  This patch removes various ways native system options can pass into the =
python=20
>  compilation and somehow break C modules.
> =20
> -Upstream-Status: Configuration [OE Specific]
> +Upstream-Status: Inappropriate [OE Specific]
> =20
>  RP 2012/04/23
> =20
> diff --git a/meta/recipes-devtools/python/python3/setuptweaks.patch b/met=
a/recipes-devtools/python/python3/setuptweaks.patch
> index c34ef16..3a91b19 100644
> --- a/meta/recipes-devtools/python/python3/setuptweaks.patch
> +++ b/meta/recipes-devtools/python/python3/setuptweaks.patch
> @@ -1,7 +1,7 @@
>  This patch removes various ways native system options can pass into the =
python=20
>  compilation and somehow break C modules.
> =20
> -Upstream-Status: Configuration [OE Specific]
> +Upstream-Status: Inappropriate [OE Specific]
> =20
>  RP 2012/04/23
> =20
> diff --git a/meta/recipes-devtools/rpm/rpm/dbconvert.patch b/meta/recipes=
-devtools/rpm/rpm/dbconvert.patch
> index 78de7d9..09a6b9c 100644
> --- a/meta/recipes-devtools/rpm/rpm/dbconvert.patch
> +++ b/meta/recipes-devtools/rpm/rpm/dbconvert.patch
> @@ -1,4 +1,5 @@
> -Upstream-Status: Not applicable
> +Upstream-Status: Inappropriate
> +Signed-off-by: Matthew McClintock <msm@freescale.com>
> =20
>  Hack to prevent unneeded demo app from building on older libc
>  where it will break the build
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch b/meta/re=
cipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
> index edb6ea2..77020a3 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch
> @@ -1,6 +1,6 @@
>  Support both db5 and db6.
> =20
> -Upstream-status: Inappropriate [configuration]
> +Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> =20
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch b/meta/=
recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
> index fa1ff43..27a0a8d 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-fix-logio-cp.patch
> @@ -1,7 +1,7 @@
>  Occasionally the cp -p fails with a non-zero return code.  This will cau=
se
>  the system abort the build.
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> =20
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch b/meta/re=
cipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
> index fcbc25d..d8feed7 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
> @@ -3,7 +3,7 @@ rpmpgp.c: Add missing if defs around crypto implementatio=
ns
>  Without these, the system will error trying to find the correct crypto=
=20
>  library to use.
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> =20
> diff --git a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-gh=
ost-avoidance-Mark-Hat.patch b/meta/recipes-devtools/rpm/rpm/verify-fix-bro=
ken-logic-for-ghost-avoidance-Mark-Hat.patch
> index 5a70f14..71045ae 100644
> --- a/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avo=
idance-Mark-Hat.patch
> +++ b/meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avo=
idance-Mark-Hat.patch
> @@ -4,7 +4,7 @@ Date: Wed, 14 May 2014 21:19:41 +0000
>  Subject: [PATCH] - verify: fix: broken logic for %ghost avoidance (Mark
>   Hatle).
> =20
> -Upstream-status: backport
> +Upstream-Status: Backport
> =20
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  ---
> diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-a=
rch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch=
64-arch_regs.h.patch
> index f70766b..0853959 100644
> --- a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_reg=
s.h.patch
> +++ b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_reg=
s.h.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] Add linux/aarch64/arch_regs.h
>  It is missing from the tarball, but it is present in git for v4.10
> =20
>  Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> -Upstream-status: Pending
> +Upstream-Status: Pending
>  ---
>   linux/aarch64/arch_regs.h | 2 ++
>   1 file changed, 2 insertions(+)
> diff --git a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-i=
f-it-supported.patch b/meta/recipes-devtools/valgrind/valgrind/pass-maltive=
c-only-if-it-supported.patch
> index 12ad4c3..f8167cb 100644
> --- a/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-su=
pported.patch
> +++ b/meta/recipes-devtools/valgrind/valgrind/pass-maltivec-only-if-it-su=
pported.patch
> @@ -1,4 +1,4 @@
> -Upstream-status: Backport
> +Upstream-Status: Backport
> =20
>  r14566 | florian | 2014-09-24 17:02:54 -0500 (Wed, 24 Sep 2014) | 4 lines
> =20
> diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-t=
he-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto-0=
=2E0.26/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
> index 69ca432..6d547a6 100644
> --- a/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test=
-of-xmllint-and-xsltproc.patch
> +++ b/meta/recipes-devtools/xmlto/xmlto-0.0.26/configure.in-drop-the-test=
-of-xmllint-and-xsltproc.patch
> @@ -3,7 +3,7 @@ configure.in: drop the test of xmllint and xsltproc
>  The test is unnecessary, the xmllint and xsltproc were explicitly
>  added to RDEPENDS.
> =20
> -Upstream-Status: oe-specific
> +Upstream-Status: Inappropriate
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
>   configure.in | 4 ++--
> diff --git a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_=
alias-when-building-for-musl.patch b/meta/recipes-extended/augeas/augeas/00=
01-Unset-need_charset_alias-when-building-for-musl.patch
> index b85a6a6..9a19876 100644
> --- a/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-w=
hen-building-for-musl.patch
> +++ b/meta/recipes-extended/augeas/augeas/0001-Unset-need_charset_alias-w=
hen-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset=
_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.11/=
0001-Unset-need_charset_alias-when-building-for-musl.patch
> index 4979415..6ae2139 100644
> --- a/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-=
when-building-for-musl.patch
> +++ b/meta/recipes-extended/cpio/cpio-2.11/0001-Unset-need_charset_alias-=
when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-nee=
d_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/diffut=
ils/diffutils-3.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_chars=
et_alias-when-building-for-musl.patch
> +++ b/meta/recipes-extended/diffutils/diffutils-3.3/0001-Unset-need_chars=
et_alias-when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/findutils/findutils/0001-Unset-need_ch=
arset_alias-when-building-for-musl.patch b/meta/recipes-extended/findutils/=
findutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
> index 85d243b..8729e1b 100644
> --- a/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_a=
lias-when-building-for-musl.patch
> +++ b/meta/recipes-extended/findutils/findutils/0001-Unset-need_charset_a=
lias-when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alia=
s-when-building-for-musl.patch b/meta/recipes-extended/grep/grep/0001-Unset=
-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-=
building-for-musl.patch
> +++ b/meta/recipes-extended/grep/grep/0001-Unset-need_charset_alias-when-=
building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_cha=
rset_alias-when-building-for-musl.patch b/meta/recipes-extended/groff/groff=
-1.22.3/0001-Unset-need_charset_alias-when-building-for-musl.patch
> index 0aaf701..b61b432 100644
> --- a/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_al=
ias-when-building-for-musl.patch
> +++ b/meta/recipes-extended/groff/groff-1.22.3/0001-Unset-need_charset_al=
ias-when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_sysc=
alls.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscal=
ls.patch
> index 022276a..9c6850c 100644
> --- a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.pa=
tch
> +++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips_syscalls.pa=
tch
> @@ -1,4 +1,4 @@
> -Upstream status: Inappropriate [embedded specific]
> +Upstream-Status: Inappropriate [embedded specific]
> =20
>  Signed-off-by: Phil Staub <Phil.Staub@windriver.com>
> =20
> diff --git a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symb=
ol-optopt-to-fix-FTBFS-on-mips.patch b/meta/recipes-extended/mailx/files/00=
01-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
> index 126f505..77da333 100644
> --- a/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-opto=
pt-to-fix-FTBFS-on-mips.patch
> +++ b/meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-opto=
pt-to-fix-FTBFS-on-mips.patch
> @@ -5,7 +5,7 @@ Subject: Don't reuse weak symbol optopt to fix FTBFS on m=
ips*
>  This patch is taken from=20
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   getopt.c |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> diff --git a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-supp=
ort-since-it-is-no-longer-suppo.patch b/meta/recipes-extended/mailx/files/0=
002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
> index f70f8fc..6bad433 100644
> --- a/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-sin=
ce-it-is-no-longer-suppo.patch
> +++ b/meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-sin=
ce-it-is-no-longer-suppo.patch
> @@ -5,7 +5,7 @@ Subject: Patched out SSL2 support since it is no longer s=
upported by OpenSSL.
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   mailx.1   |    2 +-
>   openssl.c |    4 +---
> diff --git a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning=
-warning-macro-N-not-defined.patch b/meta/recipes-extended/mailx/files/0003=
-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
> index 0ee133a..13b73ae 100644
> --- a/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warnin=
g-macro-N-not-defined.patch
> +++ b/meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warnin=
g-macro-N-not-defined.patch
> @@ -5,7 +5,7 @@ Subject: Fixed Lintian warning (warning: macro `N' not de=
fined)
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   mailx.1 |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expan=
daddr-flag.patch b/meta/recipes-extended/mailx/files/0011-outof-Introduce-e=
xpandaddr-flag.patch
> index fdce13f..5d61645 100644
> --- a/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-f=
lag.patch
> +++ b/meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-f=
lag.patch
> @@ -12,7 +12,7 @@ a vulnerability in Heirloom mailx because this feature =
was documented.
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   mailx.1 | 14 ++++++++++++++
>   names.c |  3 +++
> diff --git a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option=
-processing-for-email-addresses.patch b/meta/recipes-extended/mailx/files/0=
012-unpack-Disable-option-processing-for-email-addresses.patch
> index b51472f..8cdbfd8 100644
> --- a/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-proces=
sing-for-email-addresses.patch
> +++ b/meta/recipes-extended/mailx/files/0012-unpack-Disable-option-proces=
sing-for-email-addresses.patch
> @@ -7,7 +7,7 @@ Subject: [PATCH 2/4] unpack: Disable option processing fo=
r email addresses
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   extern.h  | 2 +-
>   names.c   | 8 ++++++--
> diff --git a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally=
-require-wordexp-support.patch b/meta/recipes-extended/mailx/files/0013-fio=
=2Ec-Unconditionally-require-wordexp-support.patch
> index 5bf3cdd..5558d86 100644
> --- a/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-requir=
e-wordexp-support.patch
> +++ b/meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-requir=
e-wordexp-support.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH 3/4] fio.c: Unconditionally require worde=
xp support
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   fio.c | 67 +++++-------------------------------------------------------=
-------
>   1 file changed, 5 insertions(+), 62 deletions(-)
> diff --git a/meta/recipes-extended/mailx/files/0014-globname-Invoke-worde=
xp-with-WRDE_NOCMD.patch b/meta/recipes-extended/mailx/files/0014-globname-=
Invoke-wordexp-with-WRDE_NOCMD.patch
> index 6f162ea..f65cfa8 100644
> --- a/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with=
-WRDE_NOCMD.patch
> +++ b/meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with=
-WRDE_NOCMD.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH 4/4] globname: Invoke wordexp with WRDE_N=
OCMD (CVE-2004-2771)
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
>  ---
>   fio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.pat=
ch b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
> index 7e33789..2b59914 100644
> --- a/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
> +++ b/meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
> @@ -10,7 +10,7 @@ Index: heirloom-mailx-12.5/Makefile
>  This patch is taken from
>  ftp://ftp.debian.org/debian/pool/main/h/heirloom-mailx/heirloom-mailx_12=
=2E5-5.debian.tar.xz
> =20
> -Upstream-status: Inappropriate [upstream is dead]
> +Upstream-Status: Inappropriate [upstream is dead]
> =20
>  --- heirloom-mailx-12.5.orig/Makefile	2011-04-26 17:23:22.000000000 -0400
>  +++ heirloom-mailx-12.5/Makefile	2015-01-27 13:20:04.733542801 -0500
> diff --git a/meta/recipes-extended/mailx/files/explicitly.disable.krb5.su=
pport.patch b/meta/recipes-extended/mailx/files/explicitly.disable.krb5.sup=
port.patch
> index 8c7178b..b74fd04 100644
> --- a/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.p=
atch
> +++ b/meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.p=
atch
> @@ -1,7 +1,7 @@
>  krb5 support is autodetected from sysroot making builds undeterministic
>  feel free to improve this to support explicitly enabling/disabling it
> =20
> -Upstream-Status: Penging
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> =20
> diff --git a/meta/recipes-extended/mc/mc/mc-CTRL.patch b/meta/recipes-ext=
ended/mc/mc/mc-CTRL.patch
> index e23d9dd..ee4ba9f 100644
> --- a/meta/recipes-extended/mc/mc/mc-CTRL.patch
> +++ b/meta/recipes-extended/mc/mc/mc-CTRL.patch
> @@ -15,7 +15,7 @@ Therefore this should be good to include in OpenEmbedde=
d.
> =20
>  Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> =20
> -Upstream-status: Accepted (should be included in v4.8.14)
> +Upstream-Status: Accepted (should be included in v4.8.14)
> =20
>  diff -u mc-4.8.1.7.org/lib/tty/tty-ncurses.c mc-4.8.1.7/lib/tty/tty-ncur=
ses.c
>  --- mc-4.8.1.7.org/lib/tty/tty-ncurses.c
> diff --git a/meta/recipes-extended/parted/files/0001-Unset-need_charset_a=
lias-when-building-for-musl.patch b/meta/recipes-extended/parted/files/0001=
-Unset-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-wh=
en-building-for-musl.patch
> +++ b/meta/recipes-extended/parted/files/0001-Unset-need_charset_alias-wh=
en-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for=
-PATH_MAX.patch b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-=
for-PATH_MAX.patch
> index c0835e0..c8afcac 100644
> --- a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_M=
AX.patch
> +++ b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_M=
AX.patch
> @@ -7,7 +7,7 @@ When building against musl libc, PATH_MAX is defined in <=
limits.h>.
> =20
>  Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> =20
> -Upstream-status: Accepted (Should be in next release after 22.21)
> +Upstream-Status: Accepted (Should be in next release after 22.21)
>  ---
>   src/pstree.c | 1 +
>   1 file changed, 1 insertion(+)
> diff --git a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_=
alias-when-building-for-musl.patch b/meta/recipes-extended/sed/sed-4.2.2/00=
01-Unset-need_charset_alias-when-building-for-musl.patch
> index abdfa2a..ba1a4ba 100644
> --- a/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-w=
hen-building-for-musl.patch
> +++ b/meta/recipes-extended/sed/sed-4.2.2/0001-Unset-need_charset_alias-w=
hen-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-b=
it-characters.patch b/meta/recipes-extended/slang/slang/sprintf-bug-concern=
ing-8-bit-characters.patch
> index ddf5cce..5b637cb 100644
> --- a/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-char=
acters.patch
> +++ b/meta/recipes-extended/slang/slang/sprintf-bug-concerning-8-bit-char=
acters.patch
> @@ -1,4 +1,5 @@
> -Upstream-Status: Backported
> +Upstream-Status: Backport
> +Signed-off-by: Marius Avram <marius.avram@intel.com>
> =20
>  From 3a05d1a920140e9f2c72791c12f664213feb46df Mon Sep 17 00:00:00 2001
>  From: Manfred Hanke <Manfred.Hanke@tngtech.com>
> diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.pat=
ch b/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
> index 4a8cc57..f4d6660 100644
> --- a/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
> +++ b/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
> @@ -1,6 +1,6 @@
>  fix the macro check
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  configure does not check if locale.h exists, but check setlocale,
>  if setlocale exist, the locale.h should exist.
> diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-=
tools.patch b/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-t=
ools.patch
> index 2cc5fbb..81ebe26 100644
> --- a/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.p=
atch
> +++ b/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.p=
atch
> @@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
>  Date: Wed, 10 Sep 2014 17:03:29 +0800
>  Subject: [PATCH] do not compile host tools, since we have native
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>  ---
> diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makei=
nfo.patch b/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo=
=2Epatch
> index d9bed69..2297051 100644
> --- a/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.pat=
ch
> +++ b/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.pat=
ch
> @@ -3,7 +3,7 @@ From: "Roy.Li" <rongqing.li@windriver.com>
>  Date: Wed, 10 Sep 2014 17:10:03 +0800
>  Subject: [PATCH] using native makeinfo
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>  ---
> diff --git a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charse=
t_alias-when-building-for-musl.patch b/meta/recipes-extended/texinfo/texinf=
o/0001-Unset-need_charset_alias-when-building-for-musl.patch
> index 6ea6380..c7338aa 100644
> --- a/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias=
-when-building-for-musl.patch
> +++ b/meta/recipes-extended/texinfo/texinfo/0001-Unset-need_charset_alias=
-when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alia=
s-when-building-for-musl.patch b/meta/recipes-extended/wget/wget/0001-Unset=
-need_charset_alias-when-building-for-musl.patch
> index c1cbd14..0b3c6f5 100644
> --- a/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-=
building-for-musl.patch
> +++ b/meta/recipes-extended/wget/wget/0001-Unset-need_charset_alias-when-=
building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg=
-terminal.patch b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-=
xdg-terminal.patch
> index 6d5cc2f..4cd1baf 100644
> --- a/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-termin=
al.patch
> +++ b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Reinstate-xdg-termin=
al.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] Reinstate xdg-terminal
> =20
>  Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> =20
> -Upstream-status: Inappropriate [Revert]
> +Upstream-Status: Inappropriate [Revert]
>  ---
>   scripts/Makefile.in  |   6 +-
>   scripts/xdg-terminal | 622 ++++++++++++++++++++++++++++++++++++++++++++=
+++++++
> diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-test=
s-with-tap-output.patch b/meta/recipes-graphics/clutter/clutter-1.0/run-ins=
talled-tests-with-tap-output.patch
> index 86d841b..f5c18c5 100644
> --- a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-=
tap-output.patch
> +++ b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-=
tap-output.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] Run installed tests with tap output
>  Configure output from installed-tests to be TAP compliant such that
>  gnome-desktop-testing-runner properly interprets the results.
> =20
> -Upstream-status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Tim Orling <TicoTimo@gmail.com>
>  ---
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pk=
gconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-p=
kgconfig.patch
> index a2f3409..fca1e65 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig=
=2Epatch
> +++ b/meta/recipes-graphics/fontconfig/fontconfig/revert-static-pkgconfig=
=2Epatch
> @@ -5,7 +5,7 @@ we end up with -I <sysroot>/<sysroot>/usr/include/fontcon=
fig in CFLAGS of client
>  is matchbox-panel-2 and it was working fine with gcc < 5 because it tole=
rated non-existing paths in -I flags but gcc-5
>  gently refuses and rightly so.
> =20
> -Upstream-Status: Not-Submitted [OE-Specific]
> +Upstream-Status: Inappropriate [OE-Specific]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> =20
>  Index: fontconfig-2.11.93/fontconfig.pc.in
> diff --git a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.=
patch b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
> index dc5ef28..4b8fea5 100644
> --- a/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
> +++ b/meta/recipes-graphics/libepoxy/libepoxy/no-need-for-python3.patch
> @@ -1,7 +1,7 @@
>  There is no need to use python3 by this package (the python scripts
>  that are using during configuration only need python2.7+)
> =20
> -Upstream-Status: innapropriate [configuration]
> +Upstream-Status: Inappropriate [configuration]
> =20
>  Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>  --
> diff --git a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-v=
ariable-to-SLDFLAGS.patch b/meta/recipes-kernel/libpfm/files/0001-Makefile-=
Add-LDFLAGS-variable-to-SLDFLAGS.patch
> index be58706..d59a7f7 100644
> --- a/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable=
-to-SLDFLAGS.patch
> +++ b/meta/recipes-kernel/libpfm/files/0001-Makefile-Add-LDFLAGS-variable=
-to-SLDFLAGS.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] Makefile: Add LDFLAGS variable to SLDFLA=
GS.
>  * Add LDFLAGS variable to SLDFLAGS so that extra linker
>    flags can be sent via this variable.
> =20
> -Upstream status Sumbitted [perfmon2-libpfm4-commits@lists.sourceforge.ne=
t]
> +Upstream-Status: Submitted [perfmon2-libpfm4-commits@lists.sourceforge.n=
et]
> =20
>  Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
>  ---
> diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compati=
bility.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compati=
bility.patch
> index 0789e9f..320db6a 100644
> --- a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.=
patch
> +++ b/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.=
patch
> @@ -3,7 +3,7 @@ trace-cmd: Add blktrace_api compatibility for TC_BARRIER
>  Newer kernels replace TC_BARRIER with TC_FLUSH. Ensure trace-cmd
>  can build regardless of the linux-kernel-headers version.
> =20
> -Upstream-Status: Innapropriate [Stop gap]
> +Upstream-Status: Inappropriate [Stop gap]
> =20
>  Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> =20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
do-not-change-eos-event-to-gap-event-if.patch b/meta/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.pa=
tch
> index 0407a30..aa55de1 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-=
change-eos-event-to-gap-event-if.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-=
change-eos-event-to-gap-event-if.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] ENGR00312034: do not change eos event to=
 gap event if no
> =20
>  https://bugzilla.gnome.org/show_bug.cgi?id=3D727074
> =20
> -Upstream Status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: zhouming <b42586@freescale.com>
>  ---
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstre=
amer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
> index 0fc561c..284abbe 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-cap=
s-from-src-pad-when-query-caps.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-cap=
s-from-src-pad-when-query-caps.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] ENGR00312515: get caps from src pad when=
 query caps
> =20
>  https://bugzilla.gnome.org/show_bug.cgi?id=3D728312
> =20
> -Upstream Status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: zhouming <b42586@freescale.com>
>  ---
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/=
taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-m=
ultimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stre=
am-if-all-the-frame-cor.patch
> index 51fdc7e..62a52b0 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist=
-not-send-to-down-stream-if-all-the-frame-cor.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist=
-not-send-to-down-stream-if-all-the-frame-cor.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] taglist not send to down stream if all t=
he frame corrupted
> =20
>  https://bugzilla.gnome.org/show_bug.cgi?id=3D737246
> =20
> -Upstream status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Jian Li <lj.qfy.sh@gmail.com>
>  ---
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gstrtpmp4gpay-set-d=
afault-value-for-MPEG4-without-co.patch
> index 53147df..d1973d4 100755
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gs=
trtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-gs=
trtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch
> @@ -6,7 +6,7 @@ Subject: [PATCH] gstrtpmp4gpay: set dafault value for MPE=
G4 without codec
> =20
>  https://bugzilla.gnome.org/show_bug.cgi?id=3D734263
> =20
> -Upstream Status: Submitted
> +Upstream-Status: Submitted
> =20
>  Signed-off-by: Song Bing <b06498@freescale.com>
>  ---
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
decrease_asteriskh263_rank.patch b/meta/recipes-multimedia/gstreamer/gstrea=
mer1.0-plugins-good/decrease_asteriskh263_rank.patch
> index 7f94f50..288631b 100755
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decreas=
e_asteriskh263_rank.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/decreas=
e_asteriskh263_rank.patch
> @@ -8,7 +8,7 @@ Decrease the rank as we havn't this kind of decoder.
> =20
>  https://bugzilla.gnome.org/show_bug.cgi?id=3D739935
> =20
> -Upstream Status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Song Bing <b06498@freescale.com>
> =20
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink=
-Fix-QoS-lateness-checking-if-subclass-imple.patch b/meta/recipes-multimedi=
a/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclas=
s-imple.patch
> index b6edda1..1505cbe 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-Qo=
S-lateness-checking-if-subclass-imple.patch
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-Qo=
S-lateness-checking-if-subclass-imple.patch
> @@ -23,7 +23,7 @@ rewind in slow speed, such as -2X.
> =20
>  https://bugzilla.gnome.org/show_bug.cgi?id=3D749258
> =20
> -Upstream-Status:=A0Backport [1.5.1]
> +Upstream-Status: Backport [1.5.1]
>  ---
>   libs/gst/base/gstbasesink.c |   26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> diff --git a/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch b/meta/re=
cipes-support/gdbm/gdbm-1.8.3/ldflags.patch
> index 770d8f6..d3cb43b 100644
> --- a/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
> +++ b/meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch
> @@ -1,7 +1,7 @@
>  Obey LDFLAGS
> =20
>  Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> -Upstream-status: Inappropriate [old version]
> +Upstream-Status: Inappropriate [old version]
> =20
>  --- gdbm-1.8.3.orig/Makefile.in
>  +++ gdbm-1.8.3/Makefile.in
> diff --git a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch b/meta/reci=
pes-support/gnupg/gnupg/pkgconfig.patch
> index 5e036ba..f958603 100644
> --- a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
> +++ b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
> @@ -1,6 +1,6 @@
>  Use pkg-config to find pth instead of pth-config.
> =20
> -Upstream-Status: Rejected
> +Upstream-Status: Denied
>  [not submitted but they've been clear they don't want a pkg-config depen=
dency]
> =20
>  RP 2014/5/22
> diff --git a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch b/meta/reci=
pes-support/gpgme/gpgme/pkgconfig.patch
> index f79e865..e2f1f4f 100644
> --- a/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
> +++ b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
> @@ -1,7 +1,7 @@
>  Update gpgme to use pkgconfig instead of -config files since its
>  simpler and less error prone when cross compiling.
> =20
> -Upstream-Status: Rejected [Upstream not interested in pkg-config support]
> +Upstream-Status: Denied [Upstream not interested in pkg-config support]
>  RP 2015/4/17
> =20
>  diff --git a/configure.ac b/configure.ac
> diff --git a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgco=
nfig-support.patch b/meta/recipes-support/libassuan/libassuan/libassuan-add=
-pkgconfig-support.patch
> index f130d85..b6ccdda 100644
> --- a/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-su=
pport.patch
> +++ b/meta/recipes-support/libassuan/libassuan/libassuan-add-pkgconfig-su=
pport.patch
> @@ -2,7 +2,7 @@ Add pkgconfig support to libassuan.
>  This patch is rejected by upstream for the reason below:
>  They think pkgconfig adds no portability and maintaining them is not wor=
thwhile.
> =20
> -Upstream-Status: Rejected
> +Upstream-Status: Denied
>  Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>  Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> =20
> diff --git a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.p=
atch b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
> index 82c93bd..67ddfc6 100644
> --- a/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
> +++ b/meta/recipes-support/libgcrypt/files/add-pkgconfig-support.patch
> @@ -1,6 +1,6 @@
>  Add and use pkg-config for libgcrypt instead of -config scripts.
> =20
> -Upstream-Status: Rejected [upstream have indicated they don't want a pkg=
-config dependency]
> +Upstream-Status: Denied [upstream have indicated they don't want a pkg-c=
onfig dependency]
> =20
>  RP 2014/5/22
> =20
> diff --git a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips=
-with-option-O-and-g.patch b/meta/recipes-support/libgcrypt/files/fix-ICE-f=
ailure-on-mips-with-option-O-and-g.patch
> index 56c591f..582e62f 100644
> --- a/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-o=
ption-O-and-g.patch
> +++ b/meta/recipes-support/libgcrypt/files/fix-ICE-failure-on-mips-with-o=
ption-O-and-g.patch
> @@ -37,7 +37,7 @@ than 2.
>  4. File a bug to GNU, but it could not be reproduced on there environmen=
t.
>  http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D60643
> =20
> -Upstream-Status: [oe specific]
> +Upstream-Status: Inappropriate [oe specific]
> =20
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  ---
> diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-supp=
ort.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support=
=2Epatch
> index 0f136fd..b5886c5 100644
> --- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.pat=
ch
> +++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.pat=
ch
> @@ -1,4 +1,4 @@
> -Upstream-Status: Rejected
> +Upstream-Status: Denied
> =20
>  Add pkgconfig support to libksba.
>  This patch is rejected by upstream for the reason below:
> diff --git a/meta/recipes-support/libunistring/libunistring/0001-Unset-ne=
ed_charset_alias-when-building-for-musl.patch b/meta/recipes-support/libuni=
string/libunistring/0001-Unset-need_charset_alias-when-building-for-musl.pa=
tch
> index a62194b..2aeacb8 100644
> --- a/meta/recipes-support/libunistring/libunistring/0001-Unset-need_char=
set_alias-when-building-for-musl.patch
> +++ b/meta/recipes-support/libunistring/libunistring/0001-Unset-need_char=
set_alias-when-building-for-musl.patch
> @@ -8,7 +8,7 @@ which actually shoudl be fixed in gnulib and then all dow=
nstream
>  projects will get it eventually. For now we apply the fix to
>  coreutils
> =20
> -Upstream-Status: Not Required
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch b/met=
a/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
> index 527589f..739be82 100644
> --- a/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
> +++ b/meta/recipes-support/lzop/lzop/x32_abi_miniacc_h.patch
> @@ -4,7 +4,7 @@ x32 ABI requires to have 64-bit variable to store FLAGS r=
egister
>  instead of size_t that is 32-bit variable, this fix operand
>  type mismatch when try to pop previous pushf value.
> =20
> -Upstream-status: Submitted
> +Upstream-Status: Submitted
> =20
>  Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> =20
> diff --git a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch b/meta=
/recipes-support/neon/neon/gnutls_4.3_fixup.patch
> index a76560a..459f5e3 100644
> --- a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
> +++ b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
> @@ -1,6 +1,6 @@
>  replace deprecated GnuTLS functions with newer ones if available=20
> =20
> -Upstream Status: Pending
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Armin Kuster <akuster808@gmail.com>
> =20
> diff --git a/meta/recipes-support/npth/npth/pkgconfig.patch b/meta/recipe=
s-support/npth/npth/pkgconfig.patch
> index 178ed54..b6a12e7 100644
> --- a/meta/recipes-support/npth/npth/pkgconfig.patch
> +++ b/meta/recipes-support/npth/npth/pkgconfig.patch
> @@ -1,6 +1,6 @@
>  Added npth pkgconfig file
> =20
> -Upstream-Status: Incompatible [oe-core specific]
> +Upstream-Status: Pending
> =20
>  Signed-off-by: Saul Wold <sgw@linux.intel.com>
> =20
> --=20
> 2.3.2 (Apple Git-55)
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXx2vUACgkQN1Ujt2V2gBxqEwCePXGeM6fxh2AIbjykm82wp7kL
VhAAnjF5C/qA9aY1Qj35bD+OR7b2JA85
=FYAR
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
