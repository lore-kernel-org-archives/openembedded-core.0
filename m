Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61BFA60667
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:05:53 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l68so144807399wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=U7NVK61TotJCM+blh3VheajrKdmXZrBWggbT3ZMI0dI=;
	b=A9ejlfIHJ3fA9DefEg0C6s8o4E4/wjh2SX9WQOE8CH8L1Vo+fBGC6RNNu8KI2eP1+S
	LLdW5NWvFTbzCg3ap3XvPDBCaWpQVf+h9cytGKw+8IzWNHifOd87PDL1yohOmxxboSZz
	DoCNGAmbvIr2XB5OZYgrZtnPeRGcr9qqOrznXTPWOQRS2zHhjhoT5WxjbCroLhwVyQh4
	xOMOfI7ucEewLO2H8Nqe7HgeNgIHBgDNugvfwaO5GFbJOhQG+xUADvbmJPWfiPT58Leg
	++C58fkfJGEYeAlrcpH0UzRiMeQdL+bAvqlQraI0EFrOBAHEGfDYm9HDgbwk932WJAMz
	DTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U7NVK61TotJCM+blh3VheajrKdmXZrBWggbT3ZMI0dI=;
	b=ctzu8wk5ygjjYGUba+8lbLhDF5r9vl8i8VF02rIJBTrumWa6uOs5ng4gbRbxakmXNk
	QAZ1rwEWKV4cnVnuWJ6Qa83Q9fw2EfDdApvLDfIpbR5RJWKnWaKc1Ag96/aLAFIjHOxW
	DYaQPngPGlVUKA5Lp0255zNQnkaxPXB/TbNcyN9HNv0KtWwaGOqgAM/mDBXSMEBPJy0r
	Iiv/mAbObzpYxxjfEtNb/nqke47wZJKS/+e4/aJPV41hkLjJJ2q7g3n6dfzDonmijXpk
	BZzebqx6sbje2RIaMT/LUaretvtnNJ/KRwFXYT7WV/IQWjvEdQL+V8WR2Q0T5bG5Pp+D
	hAMQ==
X-Gm-Message-State: AD7BkJKQnNFOH1wkIUTdqf+Wowy09qnYO9DVYyd5VTRs43PDsGGDHwZmIuLrvLmbTzviZExt
X-Received: by 10.28.172.132 with SMTP id v126mr18894688wme.28.1457435153492; 
	Tue, 08 Mar 2016 03:05:53 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	ka4sm2359920wjc.47.2016.03.08.03.05.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Mar 2016 03:05:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 11:05:48 +0000
Message-Id: <1457435149-14411-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] avahi: add missing intltool-native build dependency
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
X-List-Received-Date: Tue, 08 Mar 2016 11:05:55 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index a054c24..81aad79 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-DEPENDS = "expat libcap libdaemon glib-2.0"
+DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
 SRC_URI = "https://github.com/lathiat/avahi/releases/download/v${PV}/avahi-${PV}.tar.gz \
           file://00avahi-autoipd \
-- 
2.7.0


