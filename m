Return-Path: <prvs=226f6f9bf=Hugo.Jacob@bmw.de>
X-Greylist: delayed 597 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Mar 2017 13:31:40 UTC
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id 4C760730B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1488375103; x=1519911103; h=from:to:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=MvdW6D1ELhHxe8+vhp9BOP+79urxgraY89zYYlBj3Gk=;
	b=ZD2Zl2o+CMZn5/lhLR1KgptyR+AWUck/gIOvjC2dufQ/Ket1lEffg2d5
	zfJJtCzi+32woLHwiWhVfn8JJidzNEYnAVim8l7f9I+ouHA4S2/ZSl/wF
	HmZ0WUTKek+8eGyeMCXsDOKGfbDpUUL6HItj7nl3qsc9Qn7sRPLqdec9a 4=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 01 Mar 2017 14:21:45 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
	01 Mar 2017 14:21:43 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb1.muc with ESMTP/TLS; 01 Mar 2017 14:21:43 +0100
Received: from smucm10j.europe.bmw.corp (160.48.96.46) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Wed, 1 Mar 2017 14:21:43 +0100
Received: from smucm10j.europe.bmw.corp ([160.48.96.46]) by
	smucm10j.europe.bmw.corp ([160.48.96.46]) with mapi id 15.00.1263.000;
	Wed, 1 Mar 2017 14:21:43 +0100
From: <Hugo.Jacob@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 1/1] buildhistory.bbclass: Add license declaration to
	packages and recipes
Thread-Index: AQHSko5PVWl6Pg5C7U2jAgJG7hFKgA==
Date: Wed, 1 Mar 2017 13:21:43 +0000
Message-ID: <1488374504121.73746@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Subject: [PATCH v2 1/1] buildhistory.bbclass: Add license declaration to packages and recipes
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
X-List-Received-Date: Wed, 01 Mar 2017 13:31:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Having the license declaration in the buildhistory is useful to track=0A=
licenses changes, licenses going to a given image and etc. This change=0A=
adds the license declaration for recipes and packages to its=0A=
buildhistory data.=0A=
=0A=
Signed-off-by: Hugo Jacob <Hugo.Jacob@bmw.de>=0A=
---=0A=
 meta/classes/buildhistory.bbclass | 8 ++++++++=0A=
 1 file changed, 8 insertions(+)=0A=
=0A=
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass=0A=
index 3a5bc2c3e3..f6525dfd72 100644=0A=
--- a/meta/classes/buildhistory.bbclass=0A=
+++ b/meta/classes/buildhistory.bbclass=0A=
@@ -83,6 +83,7 @@ python buildhistory_emit_pkghistory() {=0A=
             self.pe =3D "0"=0A=
             self.pv =3D "0"=0A=
             self.pr =3D "r0"=0A=
+            self.license =3D ""=0A=
             self.depends =3D ""=0A=
             self.packages =3D ""=0A=
             self.srcrev =3D ""=0A=
@@ -94,6 +95,7 @@ python buildhistory_emit_pkghistory() {=0A=
             self.pe =3D "0"=0A=
             self.pv =3D "0"=0A=
             self.pr =3D "r0"=0A=
+            self.license =3D ""=0A=
             # pkg/pkge/pkgv/pkgr should be empty because we want to be abl=
e to default them=0A=
             self.pkg =3D ""=0A=
             self.pkge =3D ""=0A=
@@ -186,6 +188,7 @@ python buildhistory_emit_pkghistory() {=0A=
     pe =3D d.getVar('PE', True) or "0"=0A=
     pv =3D d.getVar('PV', True)=0A=
     pr =3D d.getVar('PR', True)=0A=
+    license =3D d.getVar('LICENSE', True)=0A=
=0A=
     pkgdata_dir =3D d.getVar('PKGDATA_DIR', True)=0A=
     packages =3D ""=0A=
@@ -223,6 +226,7 @@ python buildhistory_emit_pkghistory() {=0A=
     rcpinfo.pe =3D pe=0A=
     rcpinfo.pv =3D pv=0A=
     rcpinfo.pr =3D pr=0A=
+    rcpinfo.license =3D license=0A=
     rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar('DEPENDS',=
 True) or ""))=0A=
     rcpinfo.packages =3D packages=0A=
     write_recipehistory(rcpinfo, d)=0A=
@@ -241,6 +245,7 @@ python buildhistory_emit_pkghistory() {=0A=
         pkge =3D pkgdata.get('PKGE', '0')=0A=
         pkgv =3D pkgdata['PKGV']=0A=
         pkgr =3D pkgdata['PKGR']=0A=
+        pkg_license =3D d.getVar('LICENSE_%s' % pkg, True) or license=0A=
         #=0A=
         # Find out what the last version was=0A=
         # Make sure the version did not decrease=0A=
@@ -261,6 +266,7 @@ python buildhistory_emit_pkghistory() {=0A=
         pkginfo.pv =3D pkgdata['PV']=0A=
         pkginfo.pr =3D pkgdata['PR']=0A=
         pkginfo.pkg =3D pkgdata['PKG']=0A=
+        pkginfo.license =3D pkg_license=0A=
         pkginfo.pkge =3D pkge=0A=
         pkginfo.pkgv =3D pkgv=0A=
         pkginfo.pkgr =3D pkgr=0A=
@@ -301,6 +307,7 @@ def write_recipehistory(rcpinfo, d):=0A=
             f.write(u"PE =3D %s\n" %  rcpinfo.pe)=0A=
         f.write(u"PV =3D %s\n" %  rcpinfo.pv)=0A=
         f.write(u"PR =3D %s\n" %  rcpinfo.pr)=0A=
+        f.write(u"LICENSE =3D %s\n" %  rcpinfo.license)=0A=
         f.write(u"DEPENDS =3D %s\n" %  rcpinfo.depends)=0A=
         f.write(u"PACKAGES =3D %s\n" %  rcpinfo.packages)=0A=
=0A=
@@ -320,6 +327,7 @@ def write_pkghistory(pkginfo, d):=0A=
             f.write(u"PE =3D %s\n" %  pkginfo.pe)=0A=
         f.write(u"PV =3D %s\n" %  pkginfo.pv)=0A=
         f.write(u"PR =3D %s\n" %  pkginfo.pr)=0A=
+        f.write(u"LICENSE =3D %s\n" %  pkginfo.license)=0A=
=0A=
         if pkginfo.pkg !=3D pkginfo.name:=0A=
             f.write(u"PKG =3D %s\n" % pkginfo.pkg)=0A=
--=0A=
2.11.0=

