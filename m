Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 795C96EFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 17:17:52 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id t61so580656wes.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=mjlDLXutDYQQf7hFHXM9Ia9N/jztcOni9G8qVLCY0UI=;
	b=Cf9eEQxUShKdisuTurdshuiTvm0OK51maPApKMQv0HxQYXGQtu243YgBqyNrKps4PL
	BslEySPS+MJU0hVzR9H67Fkp13WIMQeYnDiSg/DqOyFF8WOdOaMLtjR/FsVyPVFShwpW
	QgnAe0alv/FMEnp2pMHqAs3CGQ/bXiiRTGQRCJKMTJhXuh6KygfMSA22UiZ7ag/qy2du
	elWLCx40d9Bx+03a0ccm14p1M+WD/b9WIP5CK5uzR2fo74za4gRVF4sgXPn7EW4ice+r
	Yu6hTYo+aG3sJaVZ6mtSP62yqjPw0zcI5IP4L1MBM6dii41X0sEpXogtTHhsaHfERu5Q
	rc4w==
X-Received: by 10.194.61.210 with SMTP id s18mr29633903wjr.10.1392830273389;
	Wed, 19 Feb 2014 09:17:53 -0800 (PST)
Received: from desktop.lan (2e4099b1.skybroadband.com. [46.64.153.177])
	by mx.google.com with ESMTPSA id jd2sm3399403wic.9.2014.02.19.09.17.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Feb 2014 09:17:52 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 17:17:43 +0000
Message-Id: <1392830263-24046-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] opkg: Upgrade to v0.2.1
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
X-List-Received-Date: Wed, 19 Feb 2014 17:17:53 -0000

v0.2.1 of opkg is a minor bugfix release.

Tested on qemux86 to ensure opkg-native can build an image and opkg can update,
remove and install packages.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg_0.2.0.bb | 12 ------------
 meta/recipes-devtools/opkg/opkg_0.2.1.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg_0.2.0.bb
 create mode 100644 meta/recipes-devtools/opkg/opkg_0.2.1.bb

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.0.bb b/meta/recipes-devtools/opkg/opkg_0.2.0.bb
deleted file mode 100644
index 630be47..0000000
--- a/meta/recipes-devtools/opkg/opkg_0.2.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require opkg.inc
-
-SRC_URI = "https://opkg.googlecode.com/files/${BPN}-${PV}.tar.gz \
-           file://no-install-recommends.patch \
-           file://add-exclude.patch \
-           file://opkg-configure.service \
-"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-SRC_URI[md5sum] = "e8a6fd34fb2529191fe09dc14c934cc3"
-SRC_URI[sha256sum] = "81b7055eb4c12c5e5652339305c9236cf357890717d4bea063963f3f434d966f"
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.1.bb b/meta/recipes-devtools/opkg/opkg_0.2.1.bb
new file mode 100644
index 0000000..09c0cca
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg_0.2.1.bb
@@ -0,0 +1,12 @@
+require opkg.inc
+
+SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+           file://no-install-recommends.patch \
+           file://add-exclude.patch \
+           file://opkg-configure.service \
+"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+SRC_URI[md5sum] = "1881d170b9dfbd7ecf0aa468cb9779c0"
+SRC_URI[sha256sum] = "43c2d95e4cd3ef5e341e233e63de78698ec7522bca446972963160bb0f1e62db"
-- 
1.9.0


