Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2E745770A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 16:44:57 +0000 (UTC)
Received: by wicge5 with SMTP id ge5so38570559wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 09:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=u2J8Ap0l10LXYOiDHLQrhZ5ZVpc1gBwMWUXkrVU/p3E=;
	b=LupNvdmAw8yn7py/LhZvBYl5Pcd0M7acu4j+QNzgbvjfzIFpyDEJkQ+tfGNZ8A27HC
	8XQz8UHsM3b55ynrV6IZ4DhmTyJOBfiU8g1tQ9I3p49gsOSfIb6cnvbRhRexfWJ84HQz
	MPRTbInEwuvqn6LwAuXnscpUFimRX47cDzYlZN8OTcVghRZ2RnVcCCE6e6ICsFuHyFqf
	E9FxkdHKbqn41/3Fnmnytsk/QaWMz4ludYzFwhJ+Wlu2/ozIIPMTOivU14GfZ83T9OY4
	sNvPzttBogYzl6zDRQYvwhjD/HYNQuQDMn1lqz2YPApfHOHH/SxE4Nv7QTTJcW0f3vVO
	Zm8w==
X-Gm-Message-State: ALoCoQnY1tQ+i9sCYWtcQlhdR9u65+eLw4inxRMXteldH4nfoQl9ds3mrht1Y0Ew0XkmADrOJ4mN
X-Received: by 10.180.74.175 with SMTP id u15mr4097357wiv.66.1443717897050;
	Thu, 01 Oct 2015 09:44:57 -0700 (PDT)
Received: from flashheart.burtonini.com ([81.2.106.35])
	by smtp.gmail.com with ESMTPSA id fz1sm4044460wic.8.2015.10.01.09.44.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Oct 2015 09:44:56 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 17:37:41 +0100
Message-Id: <1443717461-25147-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] systemd: remove glib-2.0 build dependency
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
X-List-Received-Date: Thu, 01 Oct 2015 16:44:58 -0000

This dependency isn't required now that systemd doesn't include gudev, so remove
it.

[ YOCTO #8398 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 30eb6cc..c2dad58 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -18,7 +18,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup qemu-native util-linux"
 
 SECTION = "base/shell"
 
-- 
2.1.4


