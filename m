Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F891C433FE
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 15:38:51 +0000 (UTC)
Received: from forward107o.mail.yandex.net (forward107o.mail.yandex.net
 [37.140.190.210])
 by mx.groups.io with SMTP id smtpd.web10.12945.1637681928803977585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 07:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@zhukoff.net
 header.s=mail header.b=EgP7X038;
 spf=pass (domain: zhukoff.net, ip: 37.140.190.210,
 mailfrom: pavel@zhukoff.net)
Received: from myt6-b09ee00227f3.qloud-c.yandex.net
 (myt6-b09ee00227f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3713:0:640:b09e:e002])
	by forward107o.mail.yandex.net (Yandex) with ESMTP id 4643B6AFA3F6;
	Tue, 23 Nov 2021 18:38:45 +0300 (MSK)
Received: from myt6-016ca1315a73.qloud-c.yandex.net
 (myt6-016ca1315a73.qloud-c.yandex.net [2a02:6b8:c12:4e0e:0:640:16c:a131])
	by myt6-b09ee00227f3.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 EQgUuzrKwG-ciDeSUHU;
	Tue, 23 Nov 2021 18:38:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; s=mail;
 t=1637681925;
	bh=RcR+yImugqX9/C2UenLQCmsVlb8uMzXePS8yO12nRGE=;
	h=Date:Subject:To:From:Message-Id:Cc;
	b=EgP7X038j2NrNiStxm2MUi86afxaUkFryBQt8QUqLTv2zxOLJe5tdciome7Fus/Fa
	 KKiUc6kZTst6WEReRq2i6faRHRlH/Fcw3eOhJZJHehcCiZP6b/OQHMtvZmyrFJYegY
	 iGepYTILFhp+bRb+Grhb9Zsi9ABK0aa2HlA28Jxg=
Authentication-Results: myt6-b09ee00227f3.qloud-c.yandex.net;
 dkim=pass header.i=@zhukoff.net
Received: by myt6-016ca1315a73.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id pshcSwY72f-chx8thsc;
	Tue, 23 Nov 2021 18:38:43 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 2
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [PATCH] go: upgrade 1.16.8 -> 1.16.10
Date: Tue, 23 Nov 2021 16:38:42 +0100
Message-Id: <20211123153842.26246-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 15:38:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158609

From: Pavel Zhukov <pavel.zhukov@huawei.com>

The release includes fixes for CVE-2021-41771 and CVE-2021-41772

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/recipes-devtools/go/{go-1.16.8.inc =3D> go-1.16.10.inc}    | 4 ++--
 ...go-binary-native_1.16.8.bb =3D> go-binary-native_1.16.10.bb} | 4 ++--
 ...-cross-canadian_1.16.8.bb =3D> go-cross-canadian_1.16.10.bb} | 0
 .../go/{go-cross_1.16.8.bb =3D> go-cross_1.16.10.bb}            | 0
 .../go/{go-crosssdk_1.16.8.bb =3D> go-crosssdk_1.16.10.bb}      | 0
 .../go/{go-native_1.16.8.bb =3D> go-native_1.16.10.bb}          | 0
 .../go/{go-runtime_1.16.8.bb =3D> go-runtime_1.16.10.bb}        | 0
 meta/recipes-devtools/go/{go_1.16.8.bb =3D> go_1.16.10.bb}      | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.8.inc =3D> go-1.16.10.inc} (90%=
)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.8.bb =3D> go-bina=
ry-native_1.16.10.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.8.bb =3D> go-cro=
ss-canadian_1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.8.bb =3D> go-cross_1.16.1=
0.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.8.bb =3D> go-crosssdk_=
1.16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.8.bb =3D> go-native_1.16=
.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.8.bb =3D> go-runtime_1.=
16.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.8.bb =3D> go_1.16.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.16.8.inc b/meta/recipes-devtoo=
ls/go/go-1.16.10.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.16.8.inc
rename to meta/recipes-devtools/go/go-1.16.10.inc
index 925bf46965..7549ffc211 100644
--- a/meta/recipes-devtools/go/go-1.16.8.inc
+++ b/meta/recipes-devtools/go/go-1.16.10.inc
@@ -1,7 +1,7 @@
 require go-common.inc
=20
 GO_BASEVERSION =3D "1.16"
-PV =3D "1.16.8"
+PV =3D "1.16.10"
 FILESEXTRAPATHS:prepend :=3D "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d2c5e4e7b4e0dd74=
707"
@@ -17,7 +17,7 @@ SRC_URI +=3D "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] =3D "8f2a8c24b793375b3243df82fdb0c8387486dcc8a89=
2ca1c991aa99ace086b98"
+SRC_URI[main.sha256sum] =3D "a905472011585e403d00d2a41de7ced29b8884309d7=
3482a307f689fd0f320b5"
=20
 # Upstream don't believe it is a signifiant real world issue and will on=
ly
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.16.8.bb b/meta/r=
ecipes-devtools/go/go-binary-native_1.16.10.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.16.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.10.bb
index 926222089d..4866c9f847 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.16.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.10.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5d4950ecb7b26d=
2c5e4e7b4e0dd74707"
 PROVIDES =3D "go-native"
=20
 SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOAR=
CH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] =3D "f32501aeb8b7b723bc7215f6c373abb69=
81bbc7e1c7b44e9f07317e1a300dce2"
-SRC_URI[go_linux_arm64.sha256sum] =3D "430dbe185417204f6788913197ab3b189=
b6deae9c9b524f262858e53dab239c2"
+SRC_URI[go_linux_amd64.sha256sum] =3D "414cd18ce1d193769b9e97d2401ad7187=
55ab47816e13b2a1cde203d263b55cf"
+SRC_URI[go_linux_arm64.sha256sum] =3D "bfe1d4b82626c742b4690a832ca59a21e=
3d702161556f3c0ed26dffb368927e9"
=20
 UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb b/meta/=
recipes-devtools/go/go-cross-canadian_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.16.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.16.8.bb b/meta/recipes-d=
evtools/go/go-cross_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.16.8.bb
rename to meta/recipes-devtools/go/go-cross_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.16.8.bb b/meta/recipe=
s-devtools/go/go-crosssdk_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.16.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-native_1.16.8.bb b/meta/recipes-=
devtools/go/go-native_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.16.8.bb
rename to meta/recipes-devtools/go/go-native_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.8.bb b/meta/recipes=
-devtools/go/go-runtime_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.16.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.10.bb
diff --git a/meta/recipes-devtools/go/go_1.16.8.bb b/meta/recipes-devtool=
s/go/go_1.16.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.16.8.bb
rename to meta/recipes-devtools/go/go_1.16.10.bb
--=20
2.32.0


