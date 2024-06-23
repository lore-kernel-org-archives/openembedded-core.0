Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C33C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 15:37:15 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.119908.1719157032600843723
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 08:37:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=ElyZP1vN;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 575E4240105
	for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 17:37:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1719157030; bh=V45g5Amc5myDltEGabPVDn/cOOHVNxo9ccPhZtzrEX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ElyZP1vNFXxfJIi7ckwy1FbzJzqbQI54M9gAbpBIh3a6wOqwfX313ODnn+BkFx/dI
	 ojD0aHh6EVc33IZ2J4poeXfYWlTCg7CZy+Aj+UaRruGzgEeHW/SFJK1fs5XcYUSN/1
	 2abWAPYDz6fog5z6bQ2+SU3tfkr8XPHAGiob8+HsPpTzqhHiF9upVfZHXgIxD+JgFf
	 HQNMCJF55Tv4wcx5CKjx0NpO77qTL84m4cFxOs5eiaNgNGXkOgSv7zeTKvRCQEjLk5
	 WcOjjHTg7tGeITXuwjrmmqOEdXUbsmmAYVCHJ2IwLUGzndzmJdjtmRnT7SZWDhP+tv
	 dJwkyjtPVfA9w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4W6Zw53rrWz9rxM;
	Sun, 23 Jun 2024 17:37:09 +0200 (CEST)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] go: upgrade 1.22.3 -> 1.22.4
Date: Sun, 23 Jun 2024 15:36:58 +0000
Message-Id: <20240623153658.1085605-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 15:37:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201054

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Upgrade to latest 1.22.x release [1]:

Doneto address CVE-2024-24789 and CVE-2024-24790
From the changelog:

Includes security fixes to the archive/zip and net/netip packages,
as well as bug fixes to the compiler,
the go command, the linker, the runtime, and the os package

[1] https://github.com/golang/go/compare/go1.22.3...go1.22.4

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-devtools/go/{go-1.22.3.inc =3D> go-1.22.4.inc}   | 2 +-
 ...o-binary-native_1.22.3.bb =3D> go-binary-native_1.22.4.bb} | 6 +++---
 ...cross-canadian_1.22.3.bb =3D> go-cross-canadian_1.22.4.bb} | 0
 .../go/{go-cross_1.22.3.bb =3D> go-cross_1.22.4.bb}           | 0
 .../go/{go-crosssdk_1.22.3.bb =3D> go-crosssdk_1.22.4.bb}     | 0
 .../go/{go-native_1.22.3.bb =3D> go-native_1.22.4.bb}         | 0
 .../go/{go-runtime_1.22.3.bb =3D> go-runtime_1.22.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.3.bb =3D> go_1.22.4.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.3.inc =3D> go-1.22.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.3.bb =3D> go-bina=
ry-native_1.22.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.3.bb =3D> go-cro=
ss-canadian_1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.3.bb =3D> go-cross_1.22.4=
.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.3.bb =3D> go-crosssdk_=
1.22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.22.3.bb =3D> go-native_1.22=
.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.3.bb =3D> go-runtime_1.=
22.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.3.bb =3D> go_1.22.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.3.inc b/meta/recipes-devtoo=
ls/go/go-1.22.4.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.3.inc
rename to meta/recipes-devtools/go/go-1.22.4.inc
index 34703bc1fa..44897daba4 100644
--- a/meta/recipes-devtools/go/go-1.22.3.inc
+++ b/meta/recipes-devtools/go/go-1.22.4.inc
@@ -15,4 +15,4 @@ SRC_URI +=3D "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.pat=
ch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] =3D "80648ef34f903193d72a59c0dff019f5f98ae0c9aa1=
3ade0b0ecbff991a76f68"
+SRC_URI[main.sha256sum] =3D "fed720678e728a7ca30ba8d1ded1caafe27d16028fa=
b0232b8ba8e22008fb784"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.3.bb b/meta/r=
ecipes-devtools/go/go-binary-native_1.22.4.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.4.bb
index b67d97608d..2179b8714d 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
@@ -9,9 +9,9 @@ PROVIDES =3D "go-native"
=20
 # Checksums available at https://go.dev/dl/
 SRC_URI =3D "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOAR=
CH}.tar.gz;name=3Dgo_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] =3D "8920ea521bad8f6b7bc377b4824982e01=
1c19af27df88a815e3586ea895f1b36"
-SRC_URI[go_linux_arm64.sha256sum] =3D "6c33e52a5b26e7aa021b94475587fce80=
043a727a54ceb0eee2f9fc160646434"
-SRC_URI[go_linux_ppc64le.sha256sum] =3D "04b7b05283de30dd2da20bf3114b2e2=
2cc727938aed3148babaf35cc951051ac"
+SRC_URI[go_linux_amd64.sha256sum] =3D "ba79d4526102575196273416239cca418=
a651e049c2b099f3159db85e7bade7d"
+SRC_URI[go_linux_arm64.sha256sum] =3D "a8e177c354d2e4a1b61020aca3562e27e=
a3e8f8247eca3170e3fa1e0c2f9e771"
+SRC_URI[go_linux_ppc64le.sha256sum] =3D "dd238847e65bc3e2745caca475a5db6=
522a2fcf85cf6c38fc36a06642b19efd7"
=20
 UPSTREAM_CHECK_URI =3D "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX =3D "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.3.bb b/meta/=
recipes-devtools/go/go-cross-canadian_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.3.bb b/meta/recipes-d=
evtools/go/go-cross_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.3.bb
rename to meta/recipes-devtools/go/go-cross_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.3.bb b/meta/recipe=
s-devtools/go/go-crosssdk_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.22.3.bb b/meta/recipes-=
devtools/go/go-native_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.22.3.bb
rename to meta/recipes-devtools/go/go-native_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.3.bb b/meta/recipes=
-devtools/go/go-runtime_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.4.bb
diff --git a/meta/recipes-devtools/go/go_1.22.3.bb b/meta/recipes-devtool=
s/go/go_1.22.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.3.bb
rename to meta/recipes-devtools/go/go_1.22.4.bb
--=20
2.39.2


