Return-Path: <rruslich@cisco.com>
X-Greylist: delayed 566 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Dec 2017 14:00:39 UTC
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6E86FFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=925; q=dns/txt; s=iport;
	t=1513605641; x=1514815241;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=0cvGxK+cs2jyt8pxW1/xKfPQBBQt9lcJ+szQQpr8nO8=;
	b=dHKV+zvUSIywW7hhFrHTm4R89JoO7E8aECNNoZ53Z3A1PI71L9a75Lfc
	5AiRUdxz7z+R6Z399qDoTwc/X2dUQ+vhGBuax2BZnV3kpstbaOg4XmD4/
	0GsVzxVJmRz7Fon7/qSWjIjH5cYw5vHTY4bH6Xc2OXw4M5MU8QUjB/L3R 4=;
X-IronPort-AV: E=Sophos;i="5.45,422,1508803200"; d="scan'208";a="46256696"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
	by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 13:51:21 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (sjc-vpn7-128.cisco.com
	[10.21.144.128])
	by rcdn-core-10.cisco.com (8.14.5/8.14.5) with ESMTP id vBIDpBQx009937
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 18 Dec 2017 13:51:20 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:50:47 +0200
Message-Id: <1513605052-9357-2-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
References: <1513605052-9357-1-git-send-email-rruslich@cisco.com>
Subject: [morty][PATCH 2/7] bluez5.inc: set CVE_PRODUCT to bluez
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
X-List-Received-Date: Mon, 18 Dec 2017 14:00:39 -0000

From: Mikko Rapeli <mikko.rapeli@bmw.de>

bluez is the product name in NVD database for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-7837

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit aade84aa54bb2f958572623ed6464184efd19862)
Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 3421c38..a61d6f6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -27,6 +27,8 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/bluez-${PV}"
 
+CVE_PRODUCT = "bluez"
+
 inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
 
 EXTRA_OECONF = "\
-- 
1.9.1


