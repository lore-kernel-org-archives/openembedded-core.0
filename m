Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E05060557;
	Wed, 15 Jun 2016 11:43:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m124so5277841wme.3;
	Wed, 15 Jun 2016 04:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Ru0o/5Gr9cwlTxkBmKlaRcN77fuFTSFktPOSWhzOt1g=;
	b=jFB/7RY5KFWbTlPk9srrJJSDbXMKVu8EqzIcQjdcFQ0y1rnUiwW8AqFjw9I2bVJGJH
	3+FSCnbMxNXkU6Oe32BM7IlJEh1Ni5GT1CFBbZavP3IZnsf/z9iZz0ns40ql+WIMahpQ
	ARTAsk2YRC5yhxXECO/SF33ggyFYLyvuMh2MUyMo2l7QI47F0m/GCugi615zzhsFC0X8
	cqkgOZpCWybRMMQCAgoncIysYiTDvuQ/nbozijs9r+WIl0MnzLG5ObPlVuXwD41nAQbA
	uAE7/1WvBXDWIz3qiwhZibHECi3d6RANAi+8rOyXLQah6sA4Jy+/4OwuDgW7scJW7wvj
	WCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Ru0o/5Gr9cwlTxkBmKlaRcN77fuFTSFktPOSWhzOt1g=;
	b=HIPsH1z4bgkKnQzEzF3EdzOuJgHYNHYXOHY4kHt3fI1l7B7bzZtcvIMEd83YfiTTUw
	XquylrXnbytlmk6D47yDNIszf3HVk+hObAFBNHD+8IGPAJ/E5Y0ShelD7wZtQWKkxu94
	xK1e5YDryxPCBTzMPU6dCg9j9iHtT9gkrWNZ2ps27qt2GxLyIZn9grDmRhQAaQ0T28TG
	EfcHr0/el3hrDUnT+CGAYfoOuKNts8+siPnxFap1Y02gPmf232ugbl1IlGMzPY+XTq/F
	Pi2yGvzMeqNGj4b4NhQ6jOzXsJm6onJ2s6DYCTZbV+YiuWLJtYQYM4/WrOhOK1670hVL
	lUVA==
X-Gm-Message-State: ALyK8tLDnG3FiKJMm4mtFlpN2piK7fc5GADoso2gWatlDfm3tTKZTA2RG2p79ve21f4tdg==
X-Received: by 10.194.206.39 with SMTP id ll7mr10656115wjc.179.1465991033134; 
	Wed, 15 Jun 2016 04:43:53 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r129sm9271570wmr.20.2016.06.15.04.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Jun 2016 04:43:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 15 Jun 2016 13:44:15 +0200
To: openembedded-core@lists.openembedded.org,
	Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20160615114415.GD2569@jama>
References: <20160615073536.26531.95097@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20160615073536.26531.95097@opal.openembedded.org>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] branch master updated (2fdd2c1 -> c57ab66)
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
X-List-Received-Date: Wed, 15 Jun 2016 11:43:54 -0000
X-Groupsio-MsgNum: 83463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jL2BoiuKMElzg3CS"
Content-Disposition: inline

--jL2BoiuKMElzg3CS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 07:35:36AM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a change to branch master
> in repository openembedded-core.
>=20
>       from  2fdd2c1   systemtap: add build dependency on ncurses
>       adds  91403a8   systemd-boot: Set COMPATIBLE_HOST in recipe
>       adds  155588a   grep: upgrade to 2.25
>       adds  01990eb   sysstat: upgrade to 11.3.4
>       adds  cab69cc   sudo: upgrade to 1.8.16
>       adds  6bc378f   byacc: upgrade to 20160324
>       adds  53761f4   curl: upgrade to 7.49.1
>       adds  8504817   tar: upgrade to 1.29
>       adds  c1ac613   pciutils: upgrade to 3.5.1
>       adds  439bee0   resolvconf: upgrade to 1.79
>       adds  bb5c0e9   autogen-native: 5.18.6 -> 5.18.10
>       adds  44a5da0   file: 5.25 -> 5.27
>       adds  562e336   mklibs-native: 0.1.40 -> 0.1.41
>       adds  1d55b4d   git: 2.8.2 -> 2.8.4
>       adds  3ff14b3   make: 4.1 -> 4.2
>       adds  e053117   e2fsprogs: 1.42.99+1.43+git -> 1.43

This doesn't look right, there is extra dot in filename:
=2E/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43..bb

>       adds  15f7044   libbsd: 0.8.2 -> 0.8.3
>       adds  0ffcb59   libcap: 2.24 -> 2.25
>       adds  0d388ca   tcl: 8.6.4 -> 8.6.5
>       adds  53b3d06   strace: 4.11 -> 4.12
>       adds  9764de9   binutils: fix the incorrect assembling for ppc wait=
 instruction
>       adds  2a6f88d   staging: Add BB_SETSCENE_VERIFY_FUNCTION2 for bitba=
ke runqueue changes
>       adds  0a78e20   python-mako: rm -df -> rmdir
>       adds  d9f3af6   devtool: tweak README in created workspace layer
>       adds  ad92ed8   devtool: reset: allow specifying multiple recipes
>       adds  d36fdea   scripts: ensure not specifying subcommand shows hel=
p text
>       adds  79aa2d3   testexport-tarball: Add default value for TEST_EXPO=
RT_SDK_PACKAGES
>       adds  76de50f   python-ptyprocess: Extend to cover nativesdk
>       adds  3f7359d   python3-native Add RPROVIDES python3-importlib-nati=
ve
>       adds  a70f661   webkitgtk: do not inherit pythonnative
>       adds  7f6d7f7   libc-package: ensure glibc-locale package list is d=
eterministic
>       adds  d2b6e32   xinput-calibrator: add missing dependency for xinpu=
t_calibrator_once.sh
>       adds  46bc438   image.bbclass: do exact match for rootfs type
>       adds  f9172ba   dhcp: upgrade to 4.3.4
>       adds  227ca0a   ghostscript: upgrade to 9.19
>       adds  21078e8   gnugp: upgrade to 2.1.12
>       adds  8b7bd66   help2man-native: upgrade to 1.47.4
>       adds  f9ed35e   libgcrypt: upgrade to 1.7.0
>       adds  8e24a6e   libnewt/libnewt-python: upgrade to 0.52.19
>       adds  323c7ce   libxml2: upgrade to 2.9.4
>       adds  62a2f5c   man-pages: upgrade to 4.06
>       adds  3d53e72   pax-utils: upgrade to 1.1.6
>       adds  1ac29df   ncurses: upgrade to 6.0+20160319
>       adds  c57ab66   gzip: upgrade to 1.8
>=20
> No new revisions were added by this update.
>=20
> Summary of changes:
>  meta/classes/image.bbclass                         |   2 +-
>  meta/classes/libc-package.bbclass                  |   3 +-
>  meta/classes/staging.bbclass                       |  13 +
>  meta/conf/distro/include/tcmode-default.inc        |   2 +-
>  .../{pciutils_3.4.1.bb =3D> pciutils_3.5.1.bb}       |   4 +-
>  meta/recipes-bsp/systemd-boot/systemd-boot.bb      |   1 +
>  meta/recipes-connectivity/dhcp/dhcp.inc            |   3 +-
>  .../dhcp/0001-site.h-enable-gentle-shutdown.patch  |   6 +-
>  .../dhcp/dhcp/CVE-2015-8605.patch                  |  99 -------
>  .../dhcp/dhcp/CVE-2016-2774.patch                  |  65 -----
>  ...dhclient-script-drop-resolv.conf.dhclient.patch |   2 +-
>  .../dhcp/dhcp/fix-external-bind.patch              | 115 --------
>  .../dhcp/dhcp/fixsepbuild.patch                    |  78 +++---
>  .../dhcp/dhcp/libxml2-configure-argument.patch     |  19 +-
>  .../dhcp/dhcp/link-with-lcrypto.patch              |  21 +-
>  .../dhcp/dhcp/replace-ifconfig-route.patch         |  34 ++-
>  .../dhcp/dhcp/tweak-to-support-external-bind.patch | 117 ++++++++
>  .../dhcp/{dhcp_4.3.3.bb =3D> dhcp_4.3.4.bb}          |   8 +-
>  .../{resolvconf_1.78.bb =3D> resolvconf_1.79.bb}     |   6 +-
>  .../configure.ac-fix-cross-compiling-warning.patch |  45 ---
>  .../libxml/{libxml2_2.9.3.bb =3D> libxml2_2.9.4.bb}  |   5 +-
>  meta/recipes-core/meta/testexport-tarball.bb       |   2 +
>  ...ses_6.0+20160213.bb =3D> ncurses_6.0+20160319.bb} |   2 +-
>  ...-native_5.18.6.bb =3D> autogen-native_5.18.10.bb} |   5 +-
>  .../autogen/autogen/redirect-output-dir.patch      |  28 --
>  meta/recipes-devtools/binutils/binutils-2.26.inc   |   1 +
>  ...ncorrect-assembling-for-ppc-wait-mnemonic.patch |  36 +++
>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |   2 +-
>  ...fs-enable-the-metadata_csum-and-64bit-fea.patch |  34 ---
>  .../e2fsprogs/e2fsprogs/xattr_ordering.patch       | 219 ---------------
>  .../{e2fsprogs_git.bb =3D> e2fsprogs_1.43..bb}       |   5 +-
>  .../file/{file_5.25.bb =3D> file_5.27.bb}            |   2 +-
>  meta/recipes-devtools/git/git_2.8.2.bb             |  11 -
>  meta/recipes-devtools/git/git_2.8.4.bb             |  11 +
>  ...-native_1.47.3.bb =3D> help2man-native_1.47.4.bb} |   4 +-
>  ...-SV-43434-Handle-NULL-returns-from-ttynam.patch |   0
>  .../make/{make_4.1.bb =3D> make_4.2.bb}              |   6 +-
>  ...bs-native_0.1.40.bb =3D> mklibs-native_0.1.41.bb} |   4 +-
>  .../{pax-utils_1.1.5.bb =3D> pax-utils_1.1.6.bb}     |   4 +-
>  meta/recipes-devtools/python/python-mako_1.0.4.bb  |   2 +-
>  .../python/python-ptyprocess_0.5.1.bb              |   2 +
>  .../python/python3-native_3.5.1.bb                 |   2 +-
>  ...01-Move-gcc-compat-macros-to-gcc_compat.h.patch | 176 ------------
>  .../0001-arc-metag-nios2-or1k-tile-fix-build.patch | 117 --------
>  ...1-scm_rights-fd.test-rewrite-without-fork.patch | 198 -------------
>  .../strace/0001-tests-introduce-libtests.patch     | 306 ---------------=
------
>  .../0001-tests-scm_rights.c-use-libtests.patch     |  54 ----
>  .../strace/strace/update-gawk-paths.patch          | 114 ++++----
>  .../strace/{strace_4.11.bb =3D> strace_4.12.bb}      |   9 +-
>  .../tcltk/{tcl_8.6.4.bb =3D> tcl_8.6.5.bb}           |   4 +-
>  .../byacc/{byacc_20150711.bb =3D> byacc_20160324.bb} |   7 +-
>  ...Fix-support-for-building-with-no-jbig2-de.patch |  81 ------
>  ...part-2-fix-support-for-building-with-a-JP.patch |  48 ----
>  .../files/do-not-check-local-libpng-source.patch   |   8 +-
>  .../ghostscript-9.02-prevent_recompiling.patch     | 105 ++++---
>  .../ghostscript/ghostscript/png_mak.patch          |  27 +-
>  .../{ghostscript_9.18.bb =3D> ghostscript_9.19.bb}   |   9 +-
>  .../grep/{grep_2.23.bb =3D> grep_2.25.bb}            |   4 +-
>  .../{gzip-1.6 =3D> gzip-1.8}/wrong-path-fix.patch    |  10 +-
>  meta/recipes-extended/gzip/gzip.inc                |   5 -
>  .../gzip/{gzip_1.6.bb =3D> gzip_1.8.bb}              |   5 +-
>  .../{man-pages_4.04.bb =3D> man-pages_4.06.bb}       |   4 +-
>  .../newt/files/remove_slang_include.patch          |  16 --
>  ...python_0.52.18.bb =3D> libnewt-python_0.52.19.bb} |   0
>  .../{libnewt_0.52.18.bb =3D> libnewt_0.52.19.bb}     |   5 +-
>  .../sudo/{sudo_1.8.15.bb =3D> sudo_1.8.16.bb}        |   4 +-
>  meta/recipes-extended/sysstat/sysstat_11.2.0.bb    |   8 -
>  meta/recipes-extended/sysstat/sysstat_11.3.4.bb    |   8 +
>  meta/recipes-extended/tar/tar/remove-gets.patch    |  21 +-
>  .../tar/{tar_1.28.bb =3D> tar_1.29.bb}               |   4 +-
>  .../xinput-calibrator/xinput-calibrator_git.bb     |   2 +-
>  meta/recipes-sato/webkit/webkitgtk_2.12.3.bb       |  10 +-
>  .../curl/{curl_7.47.1.bb =3D> curl_7.49.1.bb}        |   4 +-
>  .../gnupg/{gnupg_2.1.11.bb =3D> gnupg_2.1.12.bb}     |   4 +-
>  .../libbsd/{libbsd_0.8.2.bb =3D> libbsd_0.8.3.bb}    |   6 +-
>  .../libcap/{libcap_2.24.bb =3D> libcap_2.25.bb}      |   6 +-
>  .../libgcrypt/files/add-pkgconfig-support.patch    | 140 ++++++----
>  .../files/fix-undefined-reference-to-pthread.patch |  27 ++
>  meta/recipes-support/libgcrypt/libgcrypt.inc       |   1 +
>  meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb  |   4 -
>  meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb  |   4 +
>  scripts/contrib/devtool-stress.py                  |   1 +
>  scripts/devtool                                    |  12 +-
>  scripts/lib/devtool/standard.py                    |   9 +-
>  scripts/recipetool                                 |   1 +
>  85 files changed, 647 insertions(+), 1971 deletions(-)
>  rename meta/recipes-bsp/pciutils/{pciutils_3.4.1.bb =3D> pciutils_3.5.1.=
bb} (92%)
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2015-8605.pat=
ch
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2016-2774.pat=
ch
>  delete mode 100644 meta/recipes-connectivity/dhcp/dhcp/fix-external-bind=
=2Epatch
>  create mode 100644 meta/recipes-connectivity/dhcp/dhcp/tweak-to-support-=
external-bind.patch
>  rename meta/recipes-connectivity/dhcp/{dhcp_4.3.3.bb =3D> dhcp_4.3.4.bb}=
 (65%)
>  rename meta/recipes-connectivity/resolvconf/{resolvconf_1.78.bb =3D> res=
olvconf_1.79.bb} (90%)
>  delete mode 100644 meta/recipes-core/libxml/libxml2/configure.ac-fix-cro=
ss-compiling-warning.patch
>  rename meta/recipes-core/libxml/{libxml2_2.9.3.bb =3D> libxml2_2.9.4.bb}=
 (93%)
>  rename meta/recipes-core/ncurses/{ncurses_6.0+20160213.bb =3D> ncurses_6=
=2E0+20160319.bb} (84%)
>  rename meta/recipes-devtools/autogen/{autogen-native_5.18.6.bb =3D> auto=
gen-native_5.18.10.bb} (87%)
>  delete mode 100644 meta/recipes-devtools/autogen/autogen/redirect-output=
-dir.patch
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-fix-the-=
incorrect-assembling-for-ppc-wait-mnemonic.patch
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2=
fs-enable-the-metadata_csum-and-64bit-fea.patch
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/xattr_order=
ing.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_git.bb =3D> e2fsprogs_=
1.43..bb} (94%)
>  rename meta/recipes-devtools/file/{file_5.25.bb =3D> file_5.27.bb} (96%)
>  delete mode 100644 meta/recipes-devtools/git/git_2.8.2.bb
>  create mode 100644 meta/recipes-devtools/git/git_2.8.4.bb
>  rename meta/recipes-devtools/help2man/{help2man-native_1.47.3.bb =3D> he=
lp2man-native_1.47.4.bb} (79%)
>  rename meta/recipes-devtools/make/{make-4.1 =3D> make-4.2}/0001-main.c-m=
ain-SV-43434-Handle-NULL-returns-from-ttynam.patch (100%)
>  rename meta/recipes-devtools/make/{make_4.1.bb =3D> make_4.2.bb} (60%)
>  rename meta/recipes-devtools/mklibs/{mklibs-native_0.1.40.bb =3D> mklibs=
-native_0.1.41.bb} (84%)
>  rename meta/recipes-devtools/pax-utils/{pax-utils_1.1.5.bb =3D> pax-util=
s_1.1.6.bb} (89%)
>  delete mode 100644 meta/recipes-devtools/strace/strace/0001-Move-gcc-com=
pat-macros-to-gcc_compat.h.patch
>  delete mode 100644 meta/recipes-devtools/strace/strace/0001-arc-metag-ni=
os2-or1k-tile-fix-build.patch
>  delete mode 100644 meta/recipes-devtools/strace/strace/0001-scm_rights-f=
d.test-rewrite-without-fork.patch
>  delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-introd=
uce-libtests.patch
>  delete mode 100644 meta/recipes-devtools/strace/strace/0001-tests-scm_ri=
ghts.c-use-libtests.patch
>  rename meta/recipes-devtools/strace/{strace_4.11.bb =3D> strace_4.12.bb}=
 (75%)
>  rename meta/recipes-devtools/tcltk/{tcl_8.6.4.bb =3D> tcl_8.6.5.bb} (95%)
>  rename meta/recipes-extended/byacc/{byacc_20150711.bb =3D> byacc_2016032=
4.bb} (58%)
>  delete mode 100644 meta/recipes-extended/ghostscript/files/0001-Bug-6964=
97-Fix-support-for-building-with-no-jbig2-de.patch
>  delete mode 100644 meta/recipes-extended/ghostscript/files/0002-Bug-6964=
97-part-2-fix-support-for-building-with-a-JP.patch
>  rename meta/recipes-extended/ghostscript/{ghostscript_9.18.bb =3D> ghost=
script_9.19.bb} (86%)
>  rename meta/recipes-extended/grep/{grep_2.23.bb =3D> grep_2.25.bb} (88%)
>  rename meta/recipes-extended/gzip/{gzip-1.6 =3D> gzip-1.8}/wrong-path-fi=
x.patch (74%)
>  rename meta/recipes-extended/gzip/{gzip_1.6.bb =3D> gzip_1.8.bb} (75%)
>  rename meta/recipes-extended/man-pages/{man-pages_4.04.bb =3D> man-pages=
_4.06.bb} (86%)
>  delete mode 100644 meta/recipes-extended/newt/files/remove_slang_include=
=2Epatch
>  rename meta/recipes-extended/newt/{libnewt-python_0.52.18.bb =3D> libnew=
t-python_0.52.19.bb} (100%)
>  rename meta/recipes-extended/newt/{libnewt_0.52.18.bb =3D> libnewt_0.52.=
19.bb} (88%)
>  rename meta/recipes-extended/sudo/{sudo_1.8.15.bb =3D> sudo_1.8.16.bb} (=
90%)
>  delete mode 100644 meta/recipes-extended/sysstat/sysstat_11.2.0.bb
>  create mode 100644 meta/recipes-extended/sysstat/sysstat_11.3.4.bb
>  rename meta/recipes-extended/tar/{tar_1.28.bb =3D> tar_1.29.bb} (73%)
>  rename meta/recipes-support/curl/{curl_7.47.1.bb =3D> curl_7.49.1.bb} (9=
4%)
>  rename meta/recipes-support/gnupg/{gnupg_2.1.11.bb =3D> gnupg_2.1.12.bb}=
 (90%)
>  rename meta/recipes-support/libbsd/{libbsd_0.8.2.bb =3D> libbsd_0.8.3.bb=
} (86%)
>  rename meta/recipes-support/libcap/{libcap_2.24.bb =3D> libcap_2.25.bb} =
(92%)
>  create mode 100644 meta/recipes-support/libgcrypt/files/fix-undefined-re=
ference-to-pthread.patch
>  delete mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.6.5.bb
>  create mode 100644 meta/recipes-support/libgcrypt/libgcrypt_1.7.0.bb
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jL2BoiuKMElzg3CS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldhP48ACgkQN1Ujt2V2gBwh1gCdENkLMdpc7vV/j4bQ+1rZ4FCB
Mm4AoK/SJ2mKmLQGnkUtbIG2Jf1+qjGP
=caC/
-----END PGP SIGNATURE-----

--jL2BoiuKMElzg3CS--
