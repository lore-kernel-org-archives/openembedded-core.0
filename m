Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TdIoA-0002zj-TI
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 11:54:32 +0100
Received: from mail190.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id A67D4DC8041
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 11:32:25 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 27 Nov 2012 12:24:26 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	buildor.local.eukrea.com) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 27 Nov 2012 12:24:24 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: Openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Date: Tue, 27 Nov 2012 11:24:49 +0100
Message-Id: <1354011889-18394-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10725322514286947778
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinheprghprggthhgvrdhorhhgpdhovghtihhkvghrrdgthhenucfjughrpefhvffufffkofggtgfgsehtkeertdertdej
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehhedrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinheprghprggthhgvrdhorhhgpdhovghtihhkvghrrdgthhenucfjughrpefhvffufffkofggtgfgsehtkeertdertdej
Subject: [PATCH] subversion: update to 1.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 10:54:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

- fix WARNING: Failed to fetch URL http://www.apache.org/dist/subversion/=
subversion-1.7.6.tar.bz2
- subversion-1.7.6_mod_dontdothat_svnserve_only.patch doesn't seems to be=
 useful,
  cc Marcin to get confirmation

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 ...ersion-1.7.6_mod_dontdothat_svnserve_only.patch |  109 --------------=
------
 .../fix-install-depends.patch                      |    0
 .../libtool2.patch                                 |    0
 .../{subversion_1.7.6.bb =3D> subversion_1.7.7.bb}   |    5 +-
 4 files changed, 2 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.6/sub=
version-1.7.6_mod_dontdothat_svnserve_only.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.6 =3D> subversio=
n-1.7.7}/fix-install-depends.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.7.6 =3D> subversio=
n-1.7.7}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.6.bb =3D> subver=
sion_1.7.7.bb} (83%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/subversion=
-1.7.6_mod_dontdothat_svnserve_only.patch b/meta/recipes-devtools/subvers=
ion/subversion-1.7.6/subversion-1.7.6_mod_dontdothat_svnserve_only.patch
deleted file mode 100644
index ad3e767..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.6/subversion-1.7.6_=
mod_dontdothat_svnserve_only.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-Patch taken from subversion-users ML.
-
-From: Roman Plessl <roman.plessl_at_oetiker.ch>=20
-Date: Thu, 16 Aug 2012 09:48:32 +0200 (CEST)
-
-Hi All,=20
-I try to compile and installe the new subversion 1.7.6 using my build=20
-system. I use svnserve as standalone subversion server so my build=20
-is not using the apache bindings.=20
-I got the following compile error for the module mod_dontdothat:=20
-...=20
-/bin/bash /scratch/build/subversion-1.7.6-rp/subversion-1.7.6/libtool=20
---tag=3DCC --silent --mode=3Dcompile gcc=20
--I/usr/pack/subversion-1.7.6-rp/include -DLINUX=3D2 -D_REENTRANT=20
--D_GNU_SOURCE -g -O2 -g -O2 -pthread=20
--Werror=3Dimplicit-function-declaration -I./subversion/include=20
--I./subversion -I/usr/pack/subversion-1.7.6-rp/include/apr-1=20
--I/usr/pack/subversion-1.7.6-rp/include/apr-1=20
--I/usr/pack/subversion-1.7.6-rp/include=20
--I/usr/pack/subversion-1.7.6-rp/include/neon=20
--I/usr/pack/subversion-1.7.6-rp/include/serf-1 -o=20
-tools/server-side/mod_dontdothat/mod_dontdothat.lo -c=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:25:19: error: httpd.h:=
=20
-No such file or directory=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:26:25: error:=20
-http_config.h: No such file or directory=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:27:27: error:=20
-http_protocol.h: No such file or directory=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:28:26: error:=20
-http_request.h: No such file or directory=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:29:22: error:=20
-http_log.h: No such file or directory=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:30:25: error:=20
-util_filter.h: No such file or directory=20
-tools/server-side/mod_dontdothat/mod_dontdothat.c:31:23: error:=20
-ap_config.h: No such file or directory=20
-...=20
-I suppose the module mod_dontdothat should be only build with activated=20
-'apache-mod's . Maybe the build target declaration has been forget when=20
-moving the target for subversion 1.7.6.=20
-...=20
-checking for Apache module support via DSO through APXS... no=20
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
-WARNING: skipping the build of mod_dav_svn=20
-          try using --with-apxs=20
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
-...=20
-Could you check that?=20
-I have used the attached patch to fix it for myself.=20
-Cheers=20
-Roman=20
---
-Roman Plessl            phone:        +41 (62) 775 9904
-OETIKER+PARTNER AG      email:        roman.plessl_at_oetiker.ch
-Aarweg 15               web:          http://it.oetiker.ch
-CH-4600 Olten           switch board: +41 (62) 775 9900
-
-
-Upstream-Status: Backport [from ML]
-
----
- build-outputs.mk |    4 ++--
- build.conf       |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
---- subversion-1.7.6.orig/build-outputs.mk
-+++ subversion-1.7.6/build-outputs.mk
-@@ -823,11 +823,11 @@ subversion/tests/libsvn_delta/window-tes
-=20
- ########################################
- # Section 6: Install-Group build targets
- ########################################
-=20
--apache-mod: subversion/mod_authz_svn/mod_authz_svn.la subversion/mod_da=
v_svn/mod_dav_svn.la
-+apache-mod: subversion/mod_authz_svn/mod_authz_svn.la subversion/mod_da=
v_svn/mod_dav_svn.la tools/server-side/mod_dontdothat/mod_dontdothat.la
-=20
- bdb-lib: subversion/libsvn_fs_base/libsvn_fs_base-1.la
-=20
- bdb-test: subversion/tests/libsvn_fs_base/changes-test$(EXEEXT) subvers=
ion/tests/libsvn_fs_base/fs-base-test$(EXEEXT) subversion/tests/libsvn_fs=
_base/strings-reps-test$(EXEEXT)
-=20
-@@ -875,11 +875,11 @@ swig-rb: subversion/bindings/swig/ruby/c
-=20
- swig-rb-lib: subversion/bindings/swig/ruby/libsvn_swig_ruby/libsvn_swig=
_ruby-1.la
-=20
- test: subversion/tests/cmdline/atomic-ra-revprop-change$(EXEEXT) subver=
sion/tests/libsvn_subr/auth-test$(EXEEXT) subversion/tests/libsvn_subr/ca=
che-test$(EXEEXT) subversion/tests/libsvn_subr/checksum-test$(EXEEXT) sub=
version/tests/libsvn_client/client-test$(EXEEXT) subversion/tests/libsvn_=
subr/compat-test$(EXEEXT) subversion/tests/libsvn_subr/config-test$(EXEEX=
T) subversion/tests/libsvn_wc/db-test$(EXEEXT) subversion/tests/libsvn_di=
ff/diff-diff3-test$(EXEEXT) subversion/tests/libsvn_subr/dirent_uri-test$=
(EXEEXT) subversion/tests/libsvn_wc/entries-compat-test$(EXEEXT) subversi=
on/tests/cmdline/entries-dump$(EXEEXT) subversion/tests/libsvn_subr/error=
-test$(EXEEXT) subversion/tests/libsvn_fs_fs/fs-pack-test$(EXEEXT) subver=
sion/tests/libsvn_fs/fs-test$(EXEEXT) subversion/tests/libsvn_subr/hashdu=
mp-test$(EXEEXT) subversion/tests/libsvn_test-1.la subversion/tests/libsv=
n_fs/locks-test$(EXEEXT) subversion/tests/libsvn_subr/mergeinfo-test$(EXE=
EXT) subversion/tests/libsvn_wc/op-depth-test$(EXEEXT) subversion/tests/l=
ibsvn_subr/opt-test$(EXEEXT) subversion/tests/libsvn_diff/parse-diff-test=
$(EXEEXT) subversion/tests/libsvn_subr/path-test$(EXEEXT) subversion/test=
s/libsvn_wc/pristine-store-test$(EXEEXT) subversion/tests/libsvn_ra_local=
/ra-local-test$(EXEEXT) subversion/tests/libsvn_delta/random-test$(EXEEXT=
) subversion/tests/libsvn_repos/repos-test$(EXEEXT) subversion/tests/libs=
vn_subr/revision-test$(EXEEXT) subversion/tests/libsvn_subr/skel-test$(EX=
EEXT) subversion/tests/libsvn_subr/stream-test$(EXEEXT) subversion/tests/=
libsvn_subr/string-test$(EXEEXT) subversion/tests/libsvn_subr/subst_trans=
late-test$(EXEEXT) subversion/tests/libsvn_delta/svndiff-test$(EXEEXT) su=
bversion/tests/libsvn_subr/target-test$(EXEEXT) subversion/tests/libsvn_s=
ubr/time-test$(EXEEXT) subversion/tests/libsvn_subr/translate-test$(EXEEX=
T) subversion/tests/libsvn_wc/tree-conflict-data-test$(EXEEXT) subversion=
/tests/libsvn_subr/utf-test$(EXEEXT) subversion/tests/libsvn_delta/vdelta=
-test$(EXEEXT) subversion/tests/libsvn_wc/wc-incomplete-tester$(EXEEXT) s=
ubversion/tests/libsvn_wc/wc-lock-tester$(EXEEXT) subversion/tests/libsvn=
_delta/window-test$(EXEEXT)
-=20
--tools: tools/diff/diff$(EXEEXT) tools/diff/diff3$(EXEEXT) tools/diff/di=
ff4$(EXEEXT) tools/server-side/mod_dontdothat/mod_dontdothat.la tools/ser=
ver-side/svn-populate-node-origins-index$(EXEEXT) tools/server-side/svn-r=
ep-sharing-stats$(EXEEXT) tools/server-side/svnauthz-validate$(EXEEXT) to=
ols/client-side/svnmucc/svnmucc$(EXEEXT) tools/dev/svnraisetreeconflict/s=
vnraisetreeconflict$(EXEEXT)
-+tools: tools/diff/diff$(EXEEXT) tools/diff/diff3$(EXEEXT) tools/diff/di=
ff4$(EXEEXT) tools/server-side/svn-populate-node-origins-index$(EXEEXT) t=
ools/server-side/svn-rep-sharing-stats$(EXEEXT) tools/server-side/svnauth=
z-validate$(EXEEXT) tools/client-side/svnmucc/svnmucc$(EXEEXT) tools/dev/=
svnraisetreeconflict/svnraisetreeconflict$(EXEEXT)
-=20
-=20
- ########################################
- # Section 7: Install-Group install targets
- ########################################
---- subversion-1.7.6.orig/build.conf
-+++ subversion-1.7.6/build.conf
-@@ -367,11 +367,11 @@ msvc-libs =3D libhttpd.lib
- description =3D Apache Httpd module to block certain kinds of Apache Su=
bversion requests
- type =3D apache-mod
- path =3D tools/server-side/mod_dontdothat
- nonlibs =3D mod_dav_svn apr aprutil
- libs =3D libsvn_subr xml
--install =3D tools
-+install =3D apache-mod
- msvc-libs =3D libhttpd.lib
-=20
- # ---------------------------------------------------------------------=
-------
- #
- # CONSTRUCTED HEADERS
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/fix-instal=
l-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.7/fix-i=
nstall-depends.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.6/fix-install=
-depends.patch
rename to meta/recipes-devtools/subversion/subversion-1.7.7/fix-install-d=
epends.patch
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.6/libtool2.p=
atch b/meta/recipes-devtools/subversion/subversion-1.7.7/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.6/libtool2.pa=
tch
rename to meta/recipes-devtools/subversion/subversion-1.7.7/libtool2.patc=
h
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.6.bb b/meta/=
recipes-devtools/subversion/subversion_1.7.7.bb
similarity index 83%
rename from meta/recipes-devtools/subversion/subversion_1.7.6.bb
rename to meta/recipes-devtools/subversion/subversion_1.7.7.bb
index b21d5be..f006217 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.6.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.7.bb
@@ -12,10 +12,9 @@ inherit gettext
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
-           file://subversion-1.7.6_mod_dontdothat_svnserve_only.patch \
 "
-SRC_URI[md5sum] =3D "4baa434db7709bb059b05d02a2547663"
-SRC_URI[sha256sum] =3D "d1a4f13c5c992a1527a2aeac262c6f54e073963ce1d13abf=
abb2a90980fa7d05"
+SRC_URI[md5sum] =3D "5a42b7d0f1366a8d60f9ad7d5890295d"
+SRC_URI[sha256sum] =3D "fc85a9341d1dc275b279e470776014b02328a028e48a7ac7=
868ac07d4a40a321"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4a14fd2da3134e40a087eb4326a4e=
cd4"
=20
--=20
1.7.10.4



