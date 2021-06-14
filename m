Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web12.29314.1623674501912690202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 05:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=neutral (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: sekine.shigeki@fujitsu.com)
IronPort-SDR: MbV3FrxewFZD6ACjkbd7WkYfQ/tn7BZLy5qXS9ItC3GAD2CnmRAgi6ouj+aHvIUCLy/B0Wjwr5
 NVVPY50xJ7/zkroNvLJUJnzB+4BJfiRr9K0HmEI2+AHdpSnRrRVzLBh7r4i9hAlsqgGkSSFu++
 DXdT5ZRDnyislHDaU927RzbKew12aO2OaEBjrb5J+j+dfCS0FjHkPKw6kqrNF8h+r5S/lHbswv
 oCN9WDdYWxKwkMe1eKygZhB5LwhVjOioiwLoOwO/XurBIBpdYNCE8TIxjoDswhBiRP0csBFt3Y
 YfU=
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="21014380"
X-IronPort-AV: E=Sophos;i="5.83,273,1616425200"; 
   d="scan'208";a="21014380"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP; 14 Jun 2021 21:41:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A02EEEC7E5
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 21:41:38 +0900 (JST)
Received: from yto-om4.fujitsu.com (yto-om4.o.css.fujitsu.com [10.128.89.165])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D58F9C9CC8
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 21:41:37 +0900 (JST)
Received: from 7d162709cefb.openstacklocal (bakeccha.fct.css.fujitsu.com [10.126.195.136])
	by yto-om4.fujitsu.com (Postfix) with ESMTP id BFFAD4007AF21;
	Mon, 14 Jun 2021 21:41:37 +0900 (JST)
From: "Sekine Shigeki" <sekine.shigeki@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: sekine.shigeki@fujitsu.com
Subject: [meta-oe][dunfell][PATCH] ntp: add CVE-2016-9312 to allowlist
Date: Mon, 14 Jun 2021 21:40:44 +0900
Message-Id: <20210614124044.3746-1-sekine.shigeki@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit

CVE-2016-9312 is only for windows.
Signed-off-by: Sekine Shigeki <sekine.shigeki@fujitsu.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 7e168825e..e668113c5 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -26,6 +26,9 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
 
 SRC_URI[sha256sum] = "f65840deab68614d5d7ceb2d0bb9304ff70dcdedd09abb79754a87536b849c19"
 
+# CVE-2016-9312 is only for windows.
+CVE_CHECK_WHITELIST += "CVE-2016-9312"
+
 inherit autotools update-rc.d useradd systemd pkgconfig
 
 # The ac_cv_header_readline_history is to stop ntpdc depending on either
-- 
2.25.1

