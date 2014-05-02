Return-Path: <paul.betafive@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 36C4A601A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 15:46:35 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d49so544733eek.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=SN80768KpfH3bdXvxbUCmNVfHLSuVZFX3pLB7ysduWg=;
	b=vB4SzArqhBdG+dqE8flRxUBoF+/vPBtQuXQ58ry8IQ8sXmTXA+0OLMAPyKbRQ3dey/
	a+QGXLsgZEN9+RVaAPAYmNww6Pw4bMq9CgrsOSa3tq4dkmfEcGbe5c+q+8D5JpnogCK1
	a56bcOs3Hps9b7sXEos78xrYnNJf8vubIkWYyPSZH3Ha0lJHlt4SD1cDC/9eNR9fuIkz
	H3ZccgWFqp2AI94oNdAq8YgT61LL6f3MCh7/t9TkgwYJgBoiLERWCsZP4L4BKdgkQXcs
	Df0/BTqvnCd2oWnU0UWf3jiYaanJmWKTJdfkKwsNUXRbPxwVrZVfYgLn+Cs5eLrLsHVh
	JmdA==
X-Received: by 10.15.90.201 with SMTP id q49mr15800516eez.65.1399045596463;
	Fri, 02 May 2014 08:46:36 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id w1sm5483707eel.16.2014.05.02.08.46.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 May 2014 08:46:35 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 May 2014 15:46:25 +0000
Message-Id: <1399045585-8415-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] PR bumps to remove PRINC usage from meta-raspberrypi
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
X-List-Received-Date: Fri, 02 May 2014 15:46:40 -0000

This allows us to remove the following uses of PRINC in meta-raspberrypi:

recipes-bsp/formfactor/formfactor_0.0.bbappend:
    PRINC = "1"

recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend:
    PRINC := "${@int(PRINC) + 5}"

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-bsp/formfactor/formfactor_0.0.bb                 | 2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/formfactor/formfactor_0.0.bb b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
index 29d1435..d1ae2a2 100644
--- a/meta/recipes-bsp/formfactor/formfactor_0.0.bb
+++ b/meta/recipes-bsp/formfactor/formfactor_0.0.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r44"
+PR = "r45"
 
 SRC_URI = "file://config file://machconfig"
 S = "${WORKDIR}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 54b0885..549c7c8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r28"
+PR = "r33"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.9.2


