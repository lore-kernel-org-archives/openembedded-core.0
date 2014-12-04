Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 89E3F65E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 14:21:46 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id z12so22957914wgg.15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 06:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=98g5Bun5+kK3Ou4gX3W/1F1GhErUU5oOfsWQbVDrFKo=;
	b=Gyooaky7PixlFgquWJ1OaSxdf5+Fn5rAdoRSsbRiaLaDoR3BWeJDosexoo04cSpoNW
	POguvk1Hda7GwdZJIkLUZzcdwQhIMKliNd8utTplwusFkizPkqMzj4vdabaf0ml1Xled
	UTrL8cRcGjLzDCgUmr2DQqJicImTyzWqOGUZnz8fXo4pT3xHbp1YRsZLleJ6q06N3Mqz
	3aedh5tT5Sl7VFQEhiOeOmAKV95UyOzmBeXGAN+uoGxdoa8CIbYwgTPLsOQbOEz11j6c
	zqpF1FcF5QFy/4DW2jANQaXujEAutNSdDlAPPNc52OrdCcMdlw6PnWGqx8+4JmGh7s1u
	sP0g==
X-Gm-Message-State: ALoCoQnDpVytX7OyUyCuQORVIhdZYr0y+Ix5jqhm3iw/05cRYrxk8l/1iMgiIDNy55+l3Jw3N5Hz
X-Received: by 10.180.11.97 with SMTP id p1mr22237675wib.22.1417702906504;
	Thu, 04 Dec 2014 06:21:46 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	pl1sm25499820wic.16.2014.12.04.06.21.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Dec 2014 06:21:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 14:21:10 +0000
Message-Id: <1417702870-27012-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
References: <1417702870-27012-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] cwautomacros: stub do_configure to avoid cleaning
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
X-List-Received-Date: Thu, 04 Dec 2014 14:21:50 -0000

cwuatomacros's build system doesn't have a clean target, so stub out
do_configure to a no-op.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index ee4b890..4e12169 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -5,11 +5,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "http://download.berlios.de/cwautomacros/cwautomacros-${PV}.tar.bz2"
-
-
 SRC_URI[md5sum] = "074afcb50d0a8bff10786a2954b2b02d"
 SRC_URI[sha256sum] = "3115603b891f3a163c0bbb5fea2f3742113a183fa6745ee5e89e5f6d0e9f6121"
 
+do_configure() {
+	:
+}
+
 do_install() {
 	oe_runmake CWAUTOMACROSPREFIX=${D}${prefix} install
 }
-- 
1.7.10.4


