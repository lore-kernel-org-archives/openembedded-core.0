Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 429567317C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:39 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id x5so1828169obg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WlEkkt6ma32fbzPVWt4APUoWufYv8TEHrM0mtrgUpNw=;
	b=zLUzGPCQxc0vMatfj06BnN0gy1+G1IBH8l12aOIP7tqI2d/5+t7MfGQJ3Eai0fHlpn
	WtgXv1w24y1ySrTwOBnGOW4zLl8JRP1XlWDFfDgh8Whx0IGK2u9qv0adkNF7/Na9tWJS
	MgLRkCD1LBjAl/qioR7+akTBCTGOUCCnTyrNiniFbXCoRoKQVVXavN+so77oMER1QMil
	mOZ4ug0tYieg5r+2F5SCHveX1T/fpqB+2shnqVNEzXeOFa10l5w2Ve7cT1PsFVgu0YEx
	jDKIX7n0Fgy2t4lQ+6RFMzG6AsO77gkKif5c+XlxPfhAuTFsJGHYw5fy+Suokc+1xWlE
	jV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WlEkkt6ma32fbzPVWt4APUoWufYv8TEHrM0mtrgUpNw=;
	b=JHAEUxJ5br2V4z475+Bnu/HFLZ5yS2LsPks7fm8yEqzw0+0MnEPu50pGlV742jEMqg
	aPLOBUDOiLN4G5jyHyA1sd9ekUyVV7cGVwKbNOZlXUuLxh/U0byIoXiGkxD7ecF93Pus
	2IChxuu/iGE2yD4md9UQz4CRqn+uvDx7QsQ43Xl301DVMcOwoFesHmH7zvxSF99zOB73
	aOMtIAfMCID6KSLwLgRWyKNel7iQgjE8mXGbU0xWWBUPjHMV+iJynMSQj43zwzCAxa73
	79soQfd2rSbcFCbpazIqXNqu0dotUDtl65xvSBMBhQK1AH3P002kUwmg+QGZUU8pyZKz
	W+XQ==
X-Gm-Message-State: AG10YOT8Kx3JdX2v4DlTwaGSbL0bxQ8P6VVdVpDf21g4WCIbcEBE/DlAhzjLp0CRIO028w==
X-Received: by 10.182.91.38 with SMTP id cb6mr11042440obb.27.1453344220578;
	Wed, 20 Jan 2016 18:43:40 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:39 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:02 -0800
Message-Id: <1453344203-7118-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 04/25] gstreamer1.0-plugins.inc: minor formatting improvements
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:40 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 58c0bbb..568d51f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -2,12 +2,12 @@ SUMMARY = "Plugins for the GStreamer multimedia framework 1.x"
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
 SECTION = "multimedia"
+
 DEPENDS = "gstreamer1.0"
 
 inherit autotools pkgconfig upstream-version-is-even
 
 GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-GSTREAMER_1_0_GIT_BRANCH ?= "master"
 EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
@@ -32,6 +32,8 @@ oe_runconf_prepend() {
 
 SRC_URI = "${@get_gst_srcuri(d)}"
 
+GSTREAMER_1_0_GIT_BRANCH ?= "master"
+
 def get_gst_srcuri(d):
     # check if expected prefix is present
     prefix = "gstreamer1.0-"
@@ -56,4 +58,3 @@ delete_liblink_m4_file() {
 }
 
 do_configure[prefuncs] += " delete_liblink_m4_file "
-
-- 
1.9.1


