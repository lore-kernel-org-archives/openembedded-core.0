Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677F1C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 10:29:36 +0000 (UTC)
Received: from a11-75.smtp-out.amazonses.com (a11-75.smtp-out.amazonses.com [54.240.11.75])
 by mx.groups.io with SMTP id smtpd.web11.39413.1676975374976908642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 02:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=FXWKmAqh;
 spf=pass (domain: amazonses.com, ip: 54.240.11.75, mailfrom: 0100018673857e8b-00b0aec2-b383-481a-bf90-e830b0590bc8-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676975374;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=EhSyQDIr6ULFBHpDiRMjJnFISgFuYaYP5JRwEhSSRp8=;
	b=FXWKmAqhl+nTHmwrnDYqVKPzBY4Qh5IT1DOC0+YV+noa/M86sg/KjM/FK5OeGZl3
	hsKeAlV/6psMD7jqIrn8+BEKDRebLQOiOsEBRBjR/bfXVa2d05iG3IyGkS8u4uHDjgy
	/YaLglSk5YXFzbB3s1M7ZhmVpJ+SysxDBW92MDuI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676975374;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=EhSyQDIr6ULFBHpDiRMjJnFISgFuYaYP5JRwEhSSRp8=;
	b=eZtwEA29WWU1YozmFa6LYcABlTh8QrKPGpezdeDLmnG1AnFdczwsVoa3YTlRja9W
	0A0MzyrmX298WNMJujJMnDapvYqHgZCBJgkX8lwdZSn0xZrtOc41/mbnl9Zant8p1uy
	5yeQY1YWXJMM4HNqD8fViKwfWxdl+MmlNRxC8c5A=
Subject: [PATCH] docbook-xml: Switch from debian packages to upstream docbook
 sources
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Cc: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
Date: Tue, 21 Feb 2023 10:29:33 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20230221102927.3454570-1-rich@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRd9i92JcIljXS5q94rdId299Og==
Thread-Topic: [PATCH] docbook-xml: Switch from debian packages to upstream
 docbook sources
X-Original-Mailer: git-send-email 2.34.1
X-Wm-Sent-Timestamp: 1676975372
Message-ID: <0100018673857e8b-00b0aec2-b383-481a-bf90-e830b0590bc8-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.21-54.240.11.75
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 10:29:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177490

This patch changes the docbook-xml distribution package source from=0D=0A=
debian to docbook which aligns the recipe with the source=0D=0Aoriginator=
=2E Other changes made to the recipe include:=0D=0A=0D=0AThis patch resol=
ves [YOCTO #13270].=0D=0A=0D=0A- removal of version 4.0 given docbook no =
longer distributes version=0D=0A  4.0=0D=0A- simplification of the header=
 description.=0D=0A- inline comments to communicate the rationale behind =
gathering=0D=0A  multiple versions and LICENSE file handling.=0D=0A- mino=
r ordering changes to align with styling conventions and better=0D=0A  co=
ntext to better communicate use - i.e. the inherit statements and=0D=0A  =
related operations.=0D=0A=0D=0ASigned-off-by: Richard Elberger <rich@rich=
elberger.com>=0D=0A---=0D=0A .../docbook-xml/docbook-xml-dtd4_4.5.bb     =
  | 60 ++++++++++++-------=0D=0A 1 file changed, 39 insertions(+), 21 del=
etions(-)=0D=0A=0D=0Adiff --git a/meta/recipes-devtools/docbook-xml/docbo=
ok-xml-dtd4_4.5.bb b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4_4=
=2E5.bb=0D=0Aindex 2bec1442af..dd6159b2f3 100644=0D=0A--- a/meta/recipes-=
devtools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A+++ b/meta/recipes-devt=
ools/docbook-xml/docbook-xml-dtd4_4.5.bb=0D=0A@@ -1,28 +1,46 @@=0D=0A SUM=
MARY =3D "Document type definitions for verification of XML data files"=0D=
=0A DESCRIPTION =3D "Document type definitions for verification of XML da=
ta \=0D=0A-files against the DocBook rule set, it ships with the latest D=
ocBook 4.5 \=0D=0A-XML DTD, as well as a selected set of legacy DTDs for =
use with older \=0D=0A-documents, including 4.0, 4.1.2, 4.2, 4.3 and 4.4"=
=0D=0A-HOMEPAGE =3D "http://www.docbook.org/xml/"=0D=0A+files against the=
 DocBook rule set."=0D=0A+HOMEPAGE =3D "https://docbook.org"=0D=0A+=0D=0A=
+# The upstream sources are not distributed with a license file.=0D=0A+# =
LICENSE-OASIS is included as a "patch" to workaround this. When=0D=0A+# u=
pgrading this recipe, please verify whether this is still needed.=0D=0A=20=
=0D=0A LICENSE =3D "OASIS"=0D=0A LIC_FILES_CHKSUM =3D "file://${WORKDIR}/=
LICENSE-OASIS;md5=3Dc608985dd5f7f215e669e7639a0b1d2e"=0D=0A=20=0D=0A-# No=
te: the upstream sources are not distributed with a license file.=0D=0A-#=
 LICENSE-OASIS is included as a "patch" to workaround this. When=0D=0A-# =
upgrading this recipe, please verify whether this is still needed.=0D=0A-=
SRC_URI =3D "http://snapshot.debian.org/archive/debian/20160728T043443Z/p=
ool/main/d/docbook-xml/docbook-xml_${PV}.orig.tar.gz \=0D=0A-           f=
ile://LICENSE-OASIS \=0D=0A-           file://docbook-xml-update-catalog.=
xml.patch \=0D=0A-"=0D=0A+# To support apps with xml schema backward comp=
atibility, we must=0D=0A+# install a set of schemas. Install the latest b=
ased on PV and then=0D=0A+# name any specific versions as required. TODO:=
 Figure out a mechanism=0D=0A+# to filter exactly which versions are nece=
ssary, if that's even=0D=0A+# possible.=0D=0A+#=0D=0A+# DocBook.org lists=
 available release packages at https://docbook.org/xml/.=0D=0A+#=0D=0A+# =
The release packages relate docbook source at=0D=0A+# https://github.com/=
docbook/docbook but building them requires the=0D=0A+# Gradle build syste=
m. In future, it might be safer to use the source=0D=0A+# tree which woul=
d also enable proper SBOM generation through the=0D=0A+# bitbake build sy=
stem.=0D=0A+#=0D=0A=20=0D=0A-SRC_URI[md5sum] =3D "487b4d44e15cffb1f4048af=
23f98208e"=0D=0A-SRC_URI[sha256sum] =3D "b0f8edcf697f5318e63dd98c9a931f3f=
ee167af0805ba441db372e0f17b2a44f"=0D=0A+SRC_URI =3D "https://docbook.org/=
xml/4.1.2/docbkx412.zip;name=3Dpayload412;subdir=3Ddocbook-xml-4.1.2 \=0D=
=0A+           https://docbook.org/xml/4.2/docbook-xml-4.2.zip;name=3Dpay=
load42;subdir=3Ddocbook-xml-4.2 \=0D=0A+           https://docbook.org/xm=
l/4.3/docbook-xml-4.3.zip;name=3Dpayload43;subdir=3Ddocbook-xml-4.3 \=0D=0A=
+           https://docbook.org/xml/4.4/docbook-xml-4.4.zip;name=3Dpayloa=
d44;subdir=3Ddocbook-xml-4.4 \=0D=0A+           https://docbook.org/xml/$=
{PV}/docbook-xml-${PV}.zip;name=3DpayloadPV;subdir=3Ddocbook-xml-${PV} \=0D=
=0A+           file://LICENSE-OASIS"=0D=0A=20=0D=0A-UPSTREAM_CHECK_URI =3D=
 "${DEBIAN_MIRROR}/main/d/docbook-xml/"=0D=0A+SRC_URI[payload412.sha256su=
m] =3D "30f0644064e0ea71751438251940b1431f46acada814a062870f486c772e7772"=
=0D=0A+SRC_URI[payload42.sha256sum] =3D "acc4601e4f97a196076b7e64b368d924=
8b07c7abf26b34a02cca40eeebe60fa2"=0D=0A+SRC_URI[payload43.sha256sum] =3D =
"23068a94ea6fd484b004c5a73ec36a66aa47ea8f0d6b62cc1695931f5c143464"=0D=0A+=
SRC_URI[payload44.sha256sum] =3D "02f159eb88c4254d95e831c51c144b1863b216d=
909b5ff45743a1ce6f5273090"=0D=0A+SRC_URI[payloadPV.sha256sum] =3D "4e4e03=
7a2b83c98c6c94818390d4bdd3f6e10f6ec62dd79188594e26190dc7b4"=0D=0A=20=0D=0A=
-S =3D "${WORKDIR}/docbook-xml-4.5.c31424"=0D=0A+UPSTREAM_CHECK_REGEX =3D=
 "docbook-xml-(=3FP<pver>4(\.\d+)).zip"=0D=0A=20=0D=0A+S =3D "${WORKDIR}"=
=0D=0A inherit allarch=0D=0A BBCLASSEXTEND =3D "native"=0D=0A=20=0D=0A@@ =
-34,19 +52,19 @@ do_compile (){=0D=0A     :=0D=0A }=0D=0A=20=0D=0A+inheri=
t xmlcatalog=0D=0A+=0D=0A do_install () {=0D=0A     install -d ${D}${sysc=
onfdir}/xml/=0D=0A     xmlcatalog --create --noout ${D}${sysconfdir}/xml/=
docbook-xml.xml=0D=0A=20=0D=0A-    for DTDVERSION in 4.0 4.1.2 4.2 4.3 4.=
4 4.5; do=0D=0A+    for DTDVERSION in 4.1.2 4.2 4.3 4.4 4.5; do=0D=0A    =
     DEST=3D${datadir}/xml/docbook/schema/dtd/$DTDVERSION=0D=0A         i=
nstall -d -m 755 ${D}$DEST=0D=0A-        cp -v -R docbook-$DTDVERSION/* $=
{D}$DEST=0D=0A-        xmlcatalog --verbose --noout --add nextCatalog unu=
sed file://$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A+=
        cp -v -R docbook-xml-$DTDVERSION/* ${D}$DEST=0D=0A+        xmlcat=
alog --verbose --noout --add nextCatalog unused \=0D=0A+          file://=
$DEST/catalog.xml ${D}${sysconfdir}/xml/docbook-xml.xml=0D=0A     done=0D=
=0A }=0D=0A=20=0D=0A-XMLCATALOGS =3D "${sysconfdir}/xml/docbook-xml.xml"=0D=
=0A-inherit xmlcatalog=0D=0A-=0D=0A FILES:${PN} =3D "${datadir}/* ${sysco=
nfdir}/xml/docbook-xml.xml"=0D=0A--=20=0D=0A2.34.1=0D=0A=0D=0A

