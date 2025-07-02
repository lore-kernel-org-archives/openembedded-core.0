Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C173C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 06:27:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.17298.1751437613914437510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 23:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AKgvytNk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B3804434D;
	Wed,  2 Jul 2025 06:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751437611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cWigSgV4pD2Rw6uwS7wgKtCBH7ODRUEqyQN2I4e2888=;
	b=AKgvytNkUlF6w01kLsPMORBth4n4o6whUIAA2ur3MclJ9shWkVWfLdQ9eZWdzrX8cRsliQ
	Wo0VJcAuMBC+bXC3C6h42nM4rBnK2eBYypArP4AO2nkqT3n3z5bse6ibLQEpVOqwS37PfV
	WGbtXfxY79/kFgMY2e8FwfOUCGXtoqotqb04JneFsv1nOVy76Y/nwuqKclKpAWSEVAVBeh
	IBDmp5Fpt33e++bIdVa3gzA9qitmS9arPVa/2Yro0Qx4Zn8k+D9YRC0HzG5ebeysFMMJuX
	88C04Isb5xSCwvj7SVAmjTwq5vNeWjJf/ZH/y7tqDbKg5+5wZoscXRO0TrZX6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Jul 2025 08:26:51 +0200
Message-Id: <DB1CTEVUVWZP.13OQTLFJG9G9S@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.1
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <gudni.m.g@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20250627181217.3481-1-gudni.m.g@gmail.com>
In-Reply-To: <20250627181217.3481-1-gudni.m.g@gmail.com>
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucgoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepggfgtgffkffuhffvfhgjsehtqhertddttdejnecuhfhrohhmpedftehnthhonhhinhcuifhouggrrhgufdcuoegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfefteegffeihfevgfdvgeekkedutdfhkefhteevieejudfhjeehffdugfeuhffgnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdhiohdpshhqlhhithgvrdhorhhgpdhgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdelmeekudejrgemgedttddumegttdgsvgemugehkegrmeegvdeltdemlegvrgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvleemkedujegrmeegtddtudemtgdtsggvmeguheekrgemgedvledtmeelvggrjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepghhuu
 ghnihdrmhdrghesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 06:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219780

On Fri Jun 27, 2025 at 8:12 PM CEST, Gu=C3=B0ni M=C3=A1r Gilbert via lists.=
openembedded.org wrote:
> This update includes major change in how it is built.
> Instead of autotools, autosetup is used.
>
> Autosetup (https://msteveb.github.io/autosetup/) claims to be
> * Replacement for autoconf in many situations
> However it also claims NOT to
> * Intended to replace all possible uses of autoconf
> This means that some autoconf features are not available.
>
> Recipe changes:
> * stop inheriting autotools and define B, do_configure and do_install
> * depend on zlib unconditionally, autoconf cannot be preconfigured in
>   similar way as autotools
> * update packageconfig options to match new syntax
> * libedit is detected with ncurses linking options (as seen in
>   do_configure log)
> * backport rpaths fix
> * define soname to avoid file-rdeps QA error due to wrong library name
> * add hack to force cross-compilation in native case to link against
>   zlib in sysroot and thus avoid crashes when sstate-cache from different
>   distro is used
> * clean B for do_configure as the new Makefiles do not seem to properly
>   retrigger build if configuration changes
>
> Kudos to Peter Marko for the initial work on upgrading SQLite
>
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc       | 43 ++++++++++---
>  ...rpath-configure-script-flag-to-addre.patch | 60 +++++++++++++++++++
>  .../{sqlite3_3.48.0.bb =3D> sqlite3_3.50.1.bb}  |  4 +-
>  3 files changed, 98 insertions(+), 9 deletions(-)
>  create mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disa=
ble-rpath-configure-script-flag-to-addre.patch
>  rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb =3D> sqlite3_3.50.=
1.bb} (53%)
>
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-suppo=
rt/sqlite/sqlite3.inc
> index 28a33282ae..3251d310fb 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -14,34 +14,37 @@ def sqlite_download_version(d):
>  SQLITE_PV =3D "${@sqlite_download_version(d)}"
> =20
>  S =3D "${UNPACKDIR}/sqlite-autoconf-${SQLITE_PV}"
> +B =3D "${WORKDIR}/build"
> =20
> -UPSTREAM_CHECK_URI =3D "http://www.sqlite.org/"
> +UPSTREAM_CHECK_URI =3D "https://www.sqlite.org/"
>  UPSTREAM_CHECK_REGEX =3D "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
> =20
>  CVE_PRODUCT =3D "sqlite"
> =20
> -inherit autotools pkgconfig siteinfo
> +inherit pkgconfig siteinfo
> +
> +# zlib is autodetected and gets to sysroots as transitive dependency, ma=
ke this deterministic
> +DEPENDS =3D "zlib"
> =20
>  # enable those which are enabled by default in configure
>  PACKAGECONFIG ?=3D "fts4 fts5 rtree dyn_ext"
>  PACKAGECONFIG:class-native ?=3D "fts4 fts5 rtree dyn_ext"
> =20
> -PACKAGECONFIG[editline] =3D "--enable-editline,--disable-editline,libedi=
t"
> -PACKAGECONFIG[readline] =3D "--enable-readline,--disable-readline,readli=
ne ncurses"
> +PACKAGECONFIG[editline] =3D "--enable-editline --with-readline-header=3D=
${includedir}/editline/readline.h,--disable-editline,libedit ncurses"
> +PACKAGECONFIG[readline] =3D "--enable-readline --with-readline-header=3D=
${includedir}/readline/readline.h,--disable-readline,readline ncurses"
>  PACKAGECONFIG[fts3] =3D "--enable-fts3,--disable-fts3"
>  PACKAGECONFIG[fts4] =3D "--enable-fts4,--disable-fts4"
>  PACKAGECONFIG[fts5] =3D "--enable-fts5,--disable-fts5"
>  PACKAGECONFIG[rtree] =3D "--enable-rtree,--disable-rtree"
>  PACKAGECONFIG[session] =3D "--enable-session,--disable-session"
> -PACKAGECONFIG[dyn_ext] =3D "--enable-dynamic-extensions,--disable-dynami=
c-extensions"
> -PACKAGECONFIG[zlib] =3D ",,zlib"
> -
> -CACHED_CONFIGUREVARS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'zlib',=
 '', 'ac_cv_search_deflate=3Dno',d)}"
> +PACKAGECONFIG[dyn_ext] =3D "--enable-load-extension,--disable-load-exten=
sion"
> =20
>  EXTRA_OECONF =3D " \
>      --enable-shared \
>      --enable-threadsafe \
> +    --disable-rpath \
>      --disable-static-shell \
> +    --soname=3D${PV} \
>  "
> =20
>  # pread() is in POSIX.1-2001 so any reasonable system must surely suppor=
t it
> @@ -65,4 +68,28 @@ FILES:lib${BPN}-staticdev =3D "${libdir}/lib*.a"
> =20
>  AUTO_LIBNAME_PKGS =3D "${MLPREFIX}lib${BPN}"
> =20
> +do_configure() {
> +    ${S}/configure \
> +        --build=3D${BUILD_SYS} \
> +        --host=3D${TARGET_SYS} \
> +        --prefix=3D${prefix} \
> +        --bindir=3D${bindir} \
> +        --libdir=3D${libdir} \
> +        --includedir=3D${includedir} \
> +        --mandir=3D${mandir} \
> +        ${EXTRA_OECONF} \
> +        ${PACKAGECONFIG_CONFARGS}
> +}
> +do_configure[cleandirs] =3D "${B}"
> +
> +do_install() {
> +    oe_runmake DESTDIR=3D${D} install
> +
> +    # binaries are stripped during installation when not cross-compiling=
, take the unstripped ones instead
> +    if [ "${BUILD_SYS}" =3D "${TARGET_SYS}" ]; then
> +        install -m 0644 ${B}/sqlite3 ${D}${bindir}
> +        install -m 0644 ${B}/libsqlite3.so ${D}${libdir}/libsqlite3.so.$=
{PV}
> +    fi
> +}
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpa=
th-configure-script-flag-to-addre.patch b/meta/recipes-support/sqlite/sqlit=
e3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
> new file mode 100644
> index 0000000000..9625b3045d
> --- /dev/null
> +++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-conf=
igure-script-flag-to-addre.patch
> @@ -0,0 +1,60 @@
> +From 509f5574267c8353a10ff81e96d8393248810b80 Mon Sep 17 00:00:00 2001
> +From: stephan <stephan@noemail.net>
> +Date: Sun, 22 Jun 2025 22:48:11 +0000
> +Subject: [PATCH] Add the --disable-rpath configure script flag to addres=
s
> + [forum:13cac3b56516f849 | forum post 13cac3b56516f849].
> +
> +FossilOrigin-Name: a59d9bb25e518f5d79f654615b92f6c50cfb704b5abee0f820912=
644b89366c5
> +
> +Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/87c80=
7c6dd4df67328919fa28e89a06839e634fe]
> +Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> +---
> + autosetup/sqlite-config.tcl | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
> +index 85fe414382..8409dbdd81 100644
> +--- a/autosetup/sqlite-config.tcl
> ++++ b/autosetup/sqlite-config.tcl
> +@@ -334,8 +334,8 @@ proc sqlite-configure {buildMode configScript} {
> +           =3D> {Link the sqlite3 shell app against the DLL instead of e=
mbedding sqlite3.c}
> +       }
> +       {canonical autoconf} {
> +-        # A potential TODO without a current use case:
> +-        #rpath=3D1 =3D> {Disable use of the rpath linker flag}
> ++        rpath=3D1 =3D> {Disable use of the rpath linker flag}
> ++
> +         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
> +         soname:=3Dlegacy
> +           =3D> {SONAME for libsqlite3.so. "none", or not using this fla=
g, sets no
> +@@ -2119,7 +2119,6 @@ proc sqlite-handle-tcl {} {
> + #######################################################################=
#
> + # Handle the --enable/disable-rpath flag.
> + proc sqlite-handle-rpath {} {
> +-  proj-check-rpath
> +   # autosetup/cc-shared.tcl sets the rpath flag definition in
> +   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
> +   # rather than as a compiler check. Though we should do a proper
> +@@ -2128,12 +2127,13 @@ proc sqlite-handle-rpath {} {
> +   # for which sqlite-env-is-unix-on-windows returns a non-empty
> +   # string.
> +=20
> +-#  if {[proj-opt-truthy rpath]} {
> +-#    proj-check-rpath
> +-#  } else {
> +-#    msg-result "Disabling use of rpath."
> +-#    define LDFLAGS_RPATH ""
> +-#  }
> ++  # https://sqlite.org/forum/forumpost/13cac3b56516f849
> ++  if {[proj-opt-truthy rpath]} {
> ++    proj-check-rpath
> ++  } else {
> ++    msg-result "Disabling use of rpath."
> ++    define LDFLAGS_RPATH ""
> ++  }
> + }
> +=20
> + #######################################################################=
#
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes=
-support/sqlite/sqlite3_3.50.1.bb
> similarity index 53%
> rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.50.1.bb
> index bd2ac6614d..bf2e883082 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.50.1.bb
> @@ -4,5 +4,7 @@ LICENSE =3D "PD"
>  LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D786d3dc581eff0=
3f4fd9e4a77ed00c66"
> =20
>  SRC_URI =3D "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar=
.gz"
> -SRC_URI[sha256sum] =3D "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158da=
fd4eb927a2e02fd5"
> +SRC_URI[sha256sum] =3D "00a65114d697cfaa8fe0630281d76fd1b77afcd95cd5e40e=
c6a02cbbadbfea71"
> +
> +SRC_URI +=3D "file://0001-Add-the-disable-rpath-configure-script-flag-to=
-addre.patch"
> =20

Hi,

This patch introduces errors such as the following on the Autobuilder:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/server/=
process.py", line 450, in idle_thread_internal
    retval =3D function(self, data, False)
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/cooker.=
py", line 1493, in buildTargetsIdle
    retval =3D rq.execute_runqueue()
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/runqueu=
e.py", line 1659, in execute_runqueue
    return self._execute_runqueue()
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/runqueu=
e.py", line 1625, in _execute_runqueue
    retval =3D self.rqexe.execute()
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/runqueu=
e.py", line 2315, in execute
    self.rq.start_fakeworker(self, mc)
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/runqueu=
e.py", line 1435, in start_fakeworker
    self.fakeworker[mc] =3D self._start_worker(mc, True, rqexec)
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/runqueu=
e.py", line 1404, in _start_worker
    RunQueue.send_pickled_data(worker, workerdata, "workerdata")
  File "/srv/pokybuild/yocto-worker/beaglebone/build/bitbake/lib/bb/runqueu=
e.py", line 1363, in send_pickled_data
    worker.stdin.write(msg)
BrokenPipeError: [Errno 32] Broken pipe

I didn't have the time to reproduce the issue locally, but bisecting shows =
that
this patch triggers such errors pretty on almost all builders. See this bui=
ld
for example:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/1957

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


