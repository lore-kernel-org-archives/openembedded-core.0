Return-Path: <s.mueller-klieser@phytec.de>
X-Greylist: delayed 397 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Jan 2018 15:38:35 UTC
Received: from root.phytec.de (mail.microcatalog.org.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 37080786E7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 15:38:35 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id EFFD0A0023E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jan 2018 16:32:00 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2018010516315911-21705 ;
	Fri, 5 Jan 2018 16:31:59 +0100 
From: =?UTF-8?q?Stefan=20M=C3=BCller-Klieser?= <s.mueller-klieser@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 5 Jan 2018 16:31:54 +0100
Message-Id: <1515166314-34823-1-git-send-email-s.mueller-klieser@phytec.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 05.01.2018 16:31:59,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 05.01.2018 16:31:59
X-TNEFEvaluated: 1
Subject: [PATCH] libpcre2: add packages for 16-bit and 32-bit code unit support
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
X-List-Received-Date: Fri, 05 Jan 2018 15:38:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The packages loosely follow the debian package names. In that way more
projects, e.g. Qt5 for 16-bit, are able use system libraries. This does
not change the existing default package.

Signed-off-by: Stefan M=C3=BCller-Klieser <s.mueller-klieser@phytec.de>
---
 meta/recipes-support/libpcre/libpcre2=5F10.30.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2=5F10.30.bb b/meta/recipe=
s-support/libpcre/libpcre2=5F10.30.bb
index a7df055..46c2d63 100644
--- a/meta/recipes-support/libpcre/libpcre2=5F10.30.bb
+++ b/meta/recipes-support/libpcre/libpcre2=5F10.30.bb
@@ -33,8 +33,9 @@ EXTRA=5FOECONF =3D "\
     --enable-rebuild-chartables \
     --with-link-size=3D2 \
     --with-match-limit=3D10000000 \
+    --enable-pcre2-16 \
+    --enable-pcre2-32 \
 "
-
 # Set LINK=5FSIZE in BUILD=5FCFLAGS given that the autotools bbclass use i=
t to
 # set CFLAGS=5FFOR=5FBUILD, required for the libpcre build.
 BUILD=5FCFLAGS =3D+ "-DLINK=5FSIZE=3D2 -I${B}/src"
@@ -43,13 +44,15 @@ CXXFLAGS=5Fappend=5Fpowerpc =3D " -lstdc++"
=20
 export CCLD=5FFOR=5FBUILD =3D"${BUILD=5FCCLD}"
=20
-PACKAGES =3D+ "pcre2grep pcre2grep-doc pcre2test pcre2test-doc"
+PACKAGES =3D+ "libpcre2-16 libpcre2-32 pcre2grep pcre2grep-doc pcre2test p=
cre2test-doc"
=20
 SUMMARY=5Fpcre2grep =3D "grep utility that uses perl 5 compatible regexes"
 SUMMARY=5Fpcre2grep-doc =3D "grep utility that uses perl 5 compatible rege=
xes - docs"
 SUMMARY=5Fpcre2test =3D "program for testing Perl-comatible regular expres=
sions"
 SUMMARY=5Fpcre2test-doc =3D "program for testing Perl-comatible regular ex=
pressions - docs"
=20
+FILES=5Flibpcre2-16 =3D "${libdir}/libpcre2-16.so.*"
+FILES=5Flibpcre2-32 =3D "${libdir}/libpcre2-32.so.*"
 FILES=5Fpcre2grep =3D "${bindir}/pcre2grep"
 FILES=5Fpcre2grep-doc =3D "${mandir}/man1/pcre2grep.1"
 FILES=5Fpcre2test =3D "${bindir}/pcre2test"
--=20
2.7.4


