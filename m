Return-Path: <samantha.jalabert@syslinbit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1FFE6FE58
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:48:19 +0000 (UTC)
Received: from 20.mo583.mail-out.ovh.net (20.mo583.mail-out.ovh.net [91.121.55.239])
 by mx.groups.io with SMTP id smtpd.web10.23281.1695394098505510122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=softfail (domain: syslinbit.com, ip: 91.121.55.239, mailfrom: samantha.jalabert@syslinbit.com)
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.143.238])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 743FC24B8F
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:16 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zgg77 (unknown [10.108.20.174])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 27F9F1FEC3;
	Fri, 22 Sep 2023 14:48:16 +0000 (UTC)
Received: from syslinbit.com ([37.59.142.95])
	by ghost-submission-6684bf9d7b-zgg77 with ESMTPSA
	id qONhCDCpDWXllzIA/woYXQ
	(envelope-from <samantha.jalabert@syslinbit.com>); Fri, 22 Sep 2023 14:48:16 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-95G00113e5c0d8-a8d4-4f96-80bc-fe2a8d35a494,
                    AFFFA5016FD5D6F266D6A3E59BAD914049384489) smtp.auth=samantha.jalabert@syslinbit.com
X-OVh-ClientIp: 141.94.99.231
From: samantha.jalabert@syslinbit.com
To: openembedded-core@lists.openembedded.org,
	mrybczynska@syslinbit.com,
	leon.anavi@konsulko.com,
	wangmy@fujitsu.com,
	zhengrq.fnst@fujitsu.com
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [PATCH 17/17] maintainers.inc: add python3-spdx-tools and dependencies
Date: Fri, 22 Sep 2023 14:46:29 +0000
Message-Id: <20230922144628.2495839-18-samantha.jalabert@syslinbit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12191244192490457353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrudekkedgieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepshgrmhgrnhhthhgrrdhjrghlrggsvghrthesshihshhlihhnsghithdrtghomhenucggtffrrghtthgvrhhnpeetleffjeffvdejvdfgueelvdfgheejieetheevteehleeljeduuedtteekgfeuffenucfkphepuddvjedrtddrtddruddpudeguddrleegrdelledrvdefuddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgepudefnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsrghmrghnthhhrgdrjhgrlhgrsggvrhhtsehshihslhhinhgsihhtrdgtohhmqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdpoffvtefjohhsthepmhhoheekfedpmhhouggvpehsmhhtphhouhht
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188120

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Add maintainers for new packages and also some copied from meta-python:
python3-beartype, python3-booleanpy, python3-click, python3-isodate,
python3-license-expression, python3-rdflib, python3-spdx-tools,
python3-uritools, python3-xmltodict

Signed-off-by: Marta Rybczynska <mrybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
---
 meta/conf/distro/include/maintainers.inc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3619588ae6..7a94fd5020 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -604,11 +604,14 @@ RECIPE_MAINTAINER:pn-python3-atomicwrites =3D "Tim =
Orling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-python3-attrs =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-babel =3D "Tim Orling <tim.orling@konsulko.=
com>"
 RECIPE_MAINTAINER:pn-python3-bcrypt =3D "Tim Orling <tim.orling@konsulko=
.com>"
+RECIPE_MAINTAINER:pn-python3-beartype =3D "Marta Rybczynska <mrybczynska=
@syslinbit.com>"
+RECIPE_MAINTAINER:pn-python3-booleanpy =3D "zhengrq.fnst <zhengrq.fnst@f=
ujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-build =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-python3-calver =3D "Trevor Gamblin <tgamblin@baylib=
re.com>"
 RECIPE_MAINTAINER:pn-python3-certifi =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-cffi =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-chardet =3D "Tim Orling <tim.orling@konsulk=
o.com>"
+RECIPE_MAINTAINER:pn-python3-click =3D "Wang Mingyu <wangmy@fujitsu.com>=
"
 RECIPE_MAINTAINER:pn-python3-cryptography =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cryptography-vectors =3D "Tim Orling <tim.o=
rling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-cython =3D "Trevor Gamblin <tgamblin@baylib=
re.com>"
@@ -636,10 +639,12 @@ RECIPE_MAINTAINER:pn-python3-importlib-metadata =3D=
 "Tim Orling <tim.orling@konsul
 RECIPE_MAINTAINER:pn-python3-iniconfig =3D "Tim Orling <tim.orling@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-iniparse =3D "Trevor Gamblin <tgamblin@bayl=
ibre.com>"
 RECIPE_MAINTAINER:pn-python3-iso8601 =3D "Tim Orling <tim.orling@konsulk=
o.com>"
+RECIPE_MAINTAINER:pn-python3-isodate =3D "Leon Anavi <leon.anavi@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-installer =3D "Ross Burton <ross.burton@arm=
.com>"
 RECIPE_MAINTAINER:pn-python3-jinja2 =3D "Richard Purdie <richard.purdie@=
linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-jsonpointer =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-jsonschema =3D "Bruce Ashfield <bruce.ashfi=
eld@gmail.com>"
+RECIPE_MAINTAINER:pn-python3-license-expression =3D "Wang Mingyu <wangmy=
@fujitsu.com>"
 RECIPE_MAINTAINER:pn-python3-libarchive-c =3D "Joshua Watt <JPEWhacker@g=
mail.com>"
 RECIPE_MAINTAINER:pn-python3-lxml =3D "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-magic =3D "Joshua Watt <JPEWhacker@gmail.co=
m>"
@@ -675,6 +680,7 @@ RECIPE_MAINTAINER:pn-python3-pytest-runner =3D "Tim O=
rling <tim.orling@konsulko.co
 RECIPE_MAINTAINER:pn-python3-pytest-subtests =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pytz =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-python3-pyyaml =3D "Tim Orling <tim.orling@konsulko=
.com>"
+RECIPE_MAINTAINER:pn-python3-rdflib =3D "Wang Mingyu <wangmy@fujitsu.com=
>"
 RECIPE_MAINTAINER:pn-python3-requests =3D "Tim Orling <tim.orling@konsul=
ko.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3339-validator =3D "Bruce Ashfield <bruc=
e.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-rfc3986-validator =3D "Bruce Ashfield <bruc=
e.ashfield@gmail.com>"
@@ -690,6 +696,7 @@ RECIPE_MAINTAINER:pn-python3-smartypants =3D "Alexand=
er Kanavin <alex.kanavin@gmai
 RECIPE_MAINTAINER:pn-python3-smmap =3D "Unassigned <unassigned@yoctoproj=
ect.org>"
 RECIPE_MAINTAINER:pn-python3-snowballstemmer =3D "Tim Orling <tim.orling=
@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sortedcontainers =3D "Tim Orling <tim.orlin=
g@konsulko.com>"
+RECIPE_MAINTAINER:pn-python3-spdx-tools =3D "Marta Rybczynska <mrybczyns=
ka@syslinbit.com>"
 RECIPE_MAINTAINER:pn-python3-sphinx =3D "Tim Orling <tim.orling@konsulko=
.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-qthelp =3D "Tim Orling <tim.o=
rling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-sphinxcontrib-devhelp =3D "Tim Orling <tim.=
orling@konsulko.com>"
@@ -706,11 +713,13 @@ RECIPE_MAINTAINER:pn-python3-trove-classifiers =3D =
"Trevor Gamblin <tgamblin@bayli
 RECIPE_MAINTAINER:pn-python3-typing-extensions =3D "Tim Orling <tim.orli=
ng@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-typogrify =3D "Alexander Kanavin <alex.kana=
vin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-unittest-automake-output =3D "Ross Burton <=
ross.burton@arm.com>"
+RECIPE_MAINTAINER:pn-python3-uritools =3D "Marta Rybczynska <mrybczynska=
@syslinbit.com>"
 RECIPE_MAINTAINER:pn-python3-urllib3 =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-vcversioner =3D "Bruce Ashfield <bruce.ashf=
ield@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wcwidth =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-python3-webcolors =3D "Bruce Ashfield <bruce.ashfie=
ld@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-wheel =3D "Tim Orling <tim.orling@konsulko.=
com>"
+RECIPE_MAINTAINER:pn-python3-xmltodict =3D "Leon Anavi <leon.anavi@konsu=
lko.com>"
 RECIPE_MAINTAINER:pn-python3-zipp =3D "Tim Orling <tim.orling@konsulko.c=
om>"
 RECIPE_MAINTAINER:pn-qemu =3D "Richard Purdie <richard.purdie@linuxfound=
ation.org>"
 RECIPE_MAINTAINER:pn-qemu-helper-native =3D "Richard Purdie <richard.pur=
die@linuxfoundation.org>"
--=20
2.34.1


