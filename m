Return-Path: <kbaker@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id E14C26B6C7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2014 04:46:09 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id wm4so16273303obc.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2014 20:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=BldCcikUj3wvHu31mJj6wUDHnQQKAosVEhCSagVqhz4=;
	b=YbqXSRh6vXt9GB3w8LqXjaunssfGasbvUZuOUToWVldVyvKFD/zGHb83tyx4qOWRJG
	jaA70mZV1N28k8npf/Ol3kNqBi23vxh2F9os9+t6jq5PNYkVi/5+q5Y2MgVlPVjDZVkZ
	Mu9ApYC6y9xuoUw+7QmtT+O4D05tBVDYrZEd2Sqq4RQiwVhhLmhBs5dLXiEi3ktB7ref
	Prg2joZwzSPy2HSO4OxPOVogj82WSYC5N9QjE+qIZQfqw+AFJIPH2wAKpGGqfxYk/ABk
	2epYI1usqzmQvpZzonlA5v6U82BcNPaC8liNkZlgB32SvhOe+Mv+2AkMq1MQweWu5cWz
	eiLg==
X-Received: by 10.60.16.201 with SMTP id i9mr61160690oed.14.1388810770713;
	Fri, 03 Jan 2014 20:46:10 -0800 (PST)
Received: from embedded-dev.crm.ventureresearch.com
	(209-253-130-3.ip.mcleodusa.net. [209.253.130.3])
	by mx.google.com with ESMTPSA id
	tz10sm74790769obc.10.2014.01.03.20.46.09 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 03 Jan 2014 20:46:10 -0800 (PST)
From: Kevin Baker <kbaker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2014 22:46:05 -0600
Message-Id: <1388810765-9560-1-git-send-email-kbaker@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] screen: update debian patchset to version 4.0.3-14
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
X-List-Received-Date: Sat, 04 Jan 2014 04:46:11 -0000

This recipe used an old version of the debian update patchset from Lenny which
does not exist anymore on Debian's FTP servers. Update to the latest set
version 4.0.3-14 which also includes some minor bug fixes and security updates.

Cleanly builds and runs in our armv7a-vfp-neon environment.

Signed-off-by: Kevin Baker <kbaker@gmail.com>
---
 meta/recipes-extended/screen/screen_4.0.3.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/screen/screen_4.0.3.bb b/meta/recipes-extended/screen/screen_4.0.3.bb
index b79b573..edbf4f2 100644
--- a/meta/recipes-extended/screen/screen_4.0.3.bb
+++ b/meta/recipes-extended/screen/screen_4.0.3.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN} = "base-files"
 PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-11+lenny1.diff.gz;name=patch \
+           ${DEBIAN_MIRROR}/main/s/screen/screen_4.0.3-14.diff.gz;name=patch \
            file://configure.patch \
            file://fix-parallel-make.patch \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
@@ -27,8 +27,8 @@ PAM_SRC_URI = "file://screen.pam"
 SRC_URI[tarball.md5sum] = "8506fd205028a96c741e4037de6e3c42"
 SRC_URI[tarball.sha256sum] = "78f0d5b1496084a5902586304d4a73954b2bfe33ea13edceecf21615c39e6c77"
 
-SRC_URI[patch.md5sum] = "9bacd9be1d9c57e2e0381df2775b33e0"
-SRC_URI[patch.sha256sum] = "19130d097e9ed897c84a2c640634dd36ee3233c17b0bf5d18549ed1e064b3073"
+SRC_URI[patch.md5sum] = "5960bdae6782ee9356b7e0e0a1fa7c19"
+SRC_URI[patch.sha256sum] = "10acb274b2fb0bb7137a0d66e52fa0f18125bc5198c7a8d5af381b4b30636316"
 
 inherit autotools
 
-- 
1.8.3.4


