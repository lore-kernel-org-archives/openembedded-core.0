Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f44.google.com (mail-bk0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id B5BC76E15B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 09:33:09 +0000 (UTC)
Received: by mail-bk0-f44.google.com with SMTP id mz12so2226388bkb.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 01:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=9mzlx2+LER/TtarkUJDUu1gTDp/hFXd1xrsq5XsOEzg=;
	b=GF6SGDLWLGpVN6oW6/dNfXorQei6d5RFXUfKcZLjsIE4+jiKcvUaPwDM0q6nUHFUuz
	V2WNHnO5ynxbP7u+uHbyXtiQO3YKCLxpXiWtrzYg9PjRhtju+3hRzoslQ5jqyCwhorry
	wUkYktc8MqPS68xWQSXPgUWQeeQ3r2KfIya5PeO5SbnPfux3HfYZrOz3JJiu8xsxZ9nB
	WSjMRStuPxbdgqTlvuVK9TxB29PtPWYiKyWuWtG66zQqmnLV7dM77FP9VS6gF9ijvHwB
	Iw1vLqfMb7Bw3uWSX0exyrZ+4SmrP59jwjU0yk/3E5xFJjdyKGiijxzX47OYkql6H2m+
	auZA==
X-Gm-Message-State: ALoCoQmlay1bs/bzFoebHCGpdSYABjQNbg5Kc5T2qERCia1bJtQ/JcvgChF23FeVkqgQ9iZS3Vnl
X-Received: by 10.204.173.9 with SMTP id n9mr6062944bkz.63.1390728789604;
	Sun, 26 Jan 2014 01:33:09 -0800 (PST)
Received: from ?IPv6:2001:610:612::8df1:8490:dccf:2b72?
	([2001:610:612:0:8df1:8490:dccf:2b72])
	by mx.google.com with ESMTPSA id f3sm9400001bkk.4.2014.01.26.01.33.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 Jan 2014 01:33:09 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1390716716.git.liezhi.yang@windriver.com>
Date: Sun, 26 Jan 2014 10:32:45 +0100
Message-Id: <E20F3D69-C00E-4C63-8D6F-D8229F010309@dominion.thruhere.net>
References: <cover.1390716716.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/58] [dora-next] fixes for dora (cover letter only)
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
X-List-Received-Date: Sun, 26 Jan 2014 09:33:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jan. 2014, om 07:16 heeft Robert Yang <liezhi.yang@windriver.com> =
het volgende geschreven:

> Note:
> This PULL is based on oe-core, and here is another one based on poky:
>=20
> git://git.yoctoproject.org/poky-contrib robert/dora-next
>=20
> // Robert
>=20
>=20
> The following changes since commit =
198623d80d31f19c963e61d03cbcb12dd318dfdf:
>=20
>  ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script =
(2014-01-24 12:48:15 +0000)
>=20
> are available in the git repository at:
>=20
>  git://git.openembedded.org/openembedded-core-contrib robert/dora-next
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dr=
obert/dora-next
>=20
> Alexandre Belloni (1):
>  wpa-supplicant-2.0: don't exit in pkg_postinst
>=20
> Anders Darander (1):
>  terminal.bbclass: do not export PS1
>=20
> Andreas Oberritter (1):
>  cogl-1.0: explicitly disable cairo
>=20
> Bruce Ashfield (1):
>  linux-libc-headers: fix MIPS klibc build error
>=20
> Chen Qi (1):
>  subversion: fix build problem when sysroot contains '-D' or '-I'
>=20
> Christopher Larson (4):
>  python, python-native: fix PARALLEL_MAKEINST failure
>  cairo: add/use packageconfig for valgrind support
>  pulseaudio: fix RDEPENDS traversal for consolekit
>  xz: make the LICENSE info more accurate
>=20
> Cristiana Voicu (1):
>  babeltrace: correct PV variable
>=20
> Enrico Scholz (1):
>  bluez4: added dependency on 'libsndfile1'
>=20
> Hongxu Jia (5):
>  kconfig-frontends: add python to kconfig-frontends's RDEPENDS
>  qemu: add PACKAGECONFIG for vnc, libcurl, nss, uuid, curses, gtk+,
>    libcap-ng
>  qemu: add bash and python to qemu's RDEPENDS
>  license.bbclass: fix copying license directories failed
>  nativesdk.bbclass: support nativesdk to override with the
>    PACKAGES_DYNAMIC statement
>=20
> Jackie Huang (3):
>  grub: add explicit dependency on bison-native
>  kconfig-frontends: fix the incorrect depends on gperf
>  guile: fix the depends for target recipes
>=20
> Jacob Kroon (1):
>  meta/lib/oe/terminal.py: Don't pass non-supported '--disable-factory'
>    flag to gnome-terminal
>=20
> Kai Kang (1):
>  x264: install libraries to right directory when enable multilib
>=20
> Krzysztof Sywula (1):
>  Minicom depends on libiconv
>=20
> Laurentiu Palcu (1):
>  x11vnc: fix CAPS_LOCK issues
>=20
> Li Wang (1):
>  xinetd: CVE-2013-4342
>=20
> Martin Jansa (3):
>  avahi: add leading space to RRECOMMENDS append
>  xinput-calibrator: add formfactor to RDEPENDS
>  base.bbclass: Set umask 022 also for do_unpack task
>=20
> Ming Liu (4):
>  qemu: use PACKAGECONFIG to address xfsprogs dependency
>  qemu: explicitly disable xen support
>  libpthread-stubs: should set ALLOW_EMPTY
>  grub: add PACKAGECONFIG for device-mapper
>=20
> Nick D'Ademo (1):
>  libav: install libraries to right directory when multilib is enabled
>=20
> Otavio Salvador (1):
>  gcc-4.8: Backport PR c++/57532 fix from 4.8.2
>=20
> Paul Eggleton (2):
>  linux-firmware: add missing linux-firmware-iwlwifi-7260-7 package
>  libav: add libpostproc to PROVIDES (for 0.8.x version only)
>=20
> Phil Blundell (2):
>  libsoup: Remove libproxy from DEPENDS
>  binutils: Also add autoconf-native to DEPENDS
>=20
> Richard Purdie (7):
>  base/gcc-common: Ensure umask setting is consistent for shared =
workdir
>  image.bbclass: Depend on virtual/kernel:do_deploy
>  gcc-cross-canadian: Fix fortran build
>  gcc-crosssdk.inc: Fix missing dependencies (such as libmpc-native)
>  eglibc-locale: Fix depends on binutils
>  eglibc-locale: Fix previous dependency change to properly work in
>    nativesdk case
>  eglibc-locale: Fix multilib builds to depend on the correct binutils
>=20
> Robert Yang (2):
>  coreutils 6.9: fix coreutils.texi
>  gcc-4.8/libstdc++-v3: disable sdt
>=20
> Ross Burton (3):
>  ptest: ensure do_install_ptest_base task runs in fakeroot context
>  useradd.bbclass: add dependency on base-files
>  dbus: use PACKAGECONFIG for X11 and systemd
>=20
> Roy Li (1):
>  multilib: Ensure we map the SYSTEMD_PACKAGES variable
>=20
> Saul Wold (1):
>  openssl: use PACKAGECONFIG to disable perl bits
>=20
> Scott Garman (1):
>  runqemu: remove core-image-* whitelist
>=20
> Tom Zanussi (1):
>  systemtap: Add --enable-prologues to configuration
>=20
> Yue Tao (3):
>  python: do not replace ccache in the middle of a path
>  acpid: CVE-2011-1159
>  icu: CVE-2013-2924
>=20
> mykhani (1):
>  openssl.inc: Install c_rehash utility with openssl
>=20
> yzhu1 (1):
>  populate_sdk: verify executable or dynamically linked library

I absolutely hate these massive pull requests for stable branches:

1) important fixes keep collecting dust
2) 56 changes at once makes testing and debugging really painfull

So for the future could you *please* send pull requests directly after =
patches get proposed?=

