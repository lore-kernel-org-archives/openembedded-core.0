Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id EAC2E61957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:41:33 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id ca18so903776wib.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 08:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IefoCd5aqmCihi57xZwP4fGe2DxtG3aaJvBqCRhpGTE=;
	b=xZ44VwWjj0edALcxFWK4NyfwLP4ijMDFnm3rImtE3aKZTFiSmr+QUML99eRZwZw/S6
	dDNZGhLtz9GOYXox31idtV5CnTv2TNNqbMkbr5tuBh92u/6r3Xxknwo63m9w6Neg5OWK
	LL81kcGTSnW6+qILVG1H93LSpqKvIQP1l2c8zuJHpMMkK3OZ4faHnsORNQOcc403C3+U
	v94MkUO2xfzez46loUHdx4/ixkHqd9nyIWcZgUsz8VqdNon5ivz7cBNqmunG72Ol7N8i
	4XCgB9qWT2W25ZwYNNYLCh8xmCHcBUCQlWKMnqGE7pJXzMqaIU/qRvg2QXaMJe6ayjYY
	cWuA==
X-Received: by 10.195.13.45 with SMTP id ev13mr1574746wjd.20.1384965695250;
	Wed, 20 Nov 2013 08:41:35 -0800 (PST)
Received: from turn.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id w20sm9706956wia.5.2013.11.20.08.41.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Nov 2013 08:41:34 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2013 16:41:08 +0000
Message-Id: <1384965670-23435-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
References: <1384965670-23435-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH RFC 1/3] opkg: Update to version 0.2.0
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
X-List-Received-Date: Wed, 20 Nov 2013 16:41:34 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg/opkg_0.2.0.bb | 14 ++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb   | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg_0.2.0.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg_svn.bb

diff --git a/meta/recipes-devtools/opkg/opkg_0.2.0.bb b/meta/recipes-devtools/opkg/opkg_0.2.0.bb
new file mode 100644
index 0000000..7affbff
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg_0.2.0.bb
@@ -0,0 +1,14 @@
+require opkg.inc
+
+SRC_URI = "https://opkg.googlecode.com/files/${BPN}-${PV}.tar.gz \
+           file://no-install-recommends.patch \
+           file://add-exclude.patch \
+           file://opkg-configure.service \
+"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+SRC_URI[md5sum] = "e8a6fd34fb2529191fe09dc14c934cc3"
+SRC_URI[sha256sum] = "81b7055eb4c12c5e5652339305c9236cf357890717d4bea063963f3f434d966f"
+
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
deleted file mode 100644
index cd0485f..0000000
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require opkg.inc
-
-SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
-           file://no-install-recommends.patch \
-           file://add-exclude.patch \
-           file://opkg-configure.service \
-"
-
-S = "${WORKDIR}/trunk"
-
-SRCREV = "653"
-PV = "0.1.8+svnr${SRCPV}"
-
-PR = "${INC_PR}.0"
-- 
1.8.4.2


