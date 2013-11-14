Return-Path: <dominik.holland@pelagicore.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id CAEEC6D308
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 11:09:15 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id i19so2193776wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 03:09:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FnkGh1elQe4VA4U2hOs2Cz5GLfesk/Z9o1VUHESnu4s=;
	b=MmpP4iJwS5mEzjJDnACC+HqayM8LUWGIt+oumHARSfbULR6oZxnMhm0e7sIaB4vzbT
	Y8YJJLy1VR5CAAYRm7f0+E/kEkbBtkgjVGrk2hMxZuP4HVUafloRMEF2zFFf6rWv92CS
	CrN1iVTe3kqyshTDNIDFjXnX/du9SJVqu8M403jH6XXNsQA5yYuQULZXhu6aGwI0hbQf
	scxOKtjD9Wt0TnRCI0vCptXUhjzlTXezEwV6Xr8AsAqgM9ZccgrgD0tL5PxsNZkijuLc
	MIBrtgbS63Lq3DrbCUuZpQhdSGwGfJKuep/hnJLQomKpx+c8uo8f9V/feUrwo6+ghcfC
	L53w==
X-Gm-Message-State: ALoCoQlr7lFjFhoQSJZnHqAMCyeLow0ryKEax0KutQgVxYo56ce70pu7gZ0wss+T643h8/OBPKxV
X-Received: by 10.180.182.198 with SMTP id eg6mr1825339wic.21.1384427356327;
	Thu, 14 Nov 2013 03:09:16 -0800 (PST)
Received: from magrathea.pelagicore.de
	(ppp-82-135-65-185.dynamic.mnet-online.de. [82.135.65.185])
	by mx.google.com with ESMTPSA id ey4sm5604970wic.11.2013.11.14.03.09.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2013 03:09:15 -0800 (PST)
From: Dominik Holland <dominik.holland@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2013 12:09:08 +0100
Message-Id: <1384427348-13508-1-git-send-email-dominik.holland@pelagicore.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [PATCH] dbus: Don't depend on dbus-ptest-ptest for the nativesdk-dbus package
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
X-List-Received-Date: Thu, 14 Nov 2013 11:09:17 -0000

---
 meta/recipes-core/dbus/dbus.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 5864643..0609d23 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -11,6 +11,7 @@ DEPENDS_class-native = "expat-native virtual/libintl-native"
 DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest-ptest', '', d)}"
 RDEPENDS_class-native = ""
+RDEPENDS_dbus_class-nativesdk = ""
 
 INC_PR = "r6"
 
-- 
1.8.4.3


