Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0135.outbound.protection.outlook.com [157.56.111.135])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADBA65C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 02:40:07 +0000 (UTC)
Received: from DM2PR03CA0050.namprd03.prod.outlook.com (10.141.96.49) by
	BY1PR0301MB1192.namprd03.prod.outlook.com (25.160.195.150) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Thu, 22 Jan 2015 02:40:05 +0000
Received: from BY2FFO11FD047.protection.gbl (2a01:111:f400:7c0c::158) by
	DM2PR03CA0050.outlook.office365.com (2a01:111:e400:2428::49) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Thu, 22 Jan 2015
	02:40:04 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD047.mail.protection.outlook.com (10.1.15.175) with Microsoft
	SMTP Server (TLS) id 15.1.59.14 via Frontend Transport;
	Thu, 22 Jan 2015 02:40:04 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0M2e0lp007678; Wed, 21 Jan 2015 19:40:01 -0700
From: <ting.liu@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 10:39:59 +0800
Message-ID: <1421894399-13940-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(106466001)(77096005)(68736005)(36756003)(19580395003)(6806004)(2351001)(77156002)(19580405001)(229853001)(450100001)(97736003)(50466002)(46102003)(48376002)(50226001)(87936001)(104016003)(110136001)(86152002)(85426001)(50986999)(92566002)(105606002)(64706001)(47776003)(33646002)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1192;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BY1PR0301MB1192;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY1PR0301MB1192; 
X-Forefront-PRVS: 0464DBBBC4
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0301MB1192; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2015 02:40:04.2787 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1192
Subject: [PATCH] bind: fix typo chown->chmod
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
X-List-Received-Date: Thu, 22 Jan 2015 02:40:10 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta/recipes-connectivity/bind/bind/conf.patch           | 2 +-
 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index e8c24cd..10d617f 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -277,7 +277,7 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +	modprobe capability >/dev/null 2>&1 || true
 +	if [ ! -f /etc/bind/rndc.key ]; then
 +	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-+	    chown 0640 /etc/bind/rndc.key
++	    chmod 0640 /etc/bind/rndc.key
 +	fi
 +	if [ -f /var/run/named/named.pid ]; then
 +	    ps `cat /var/run/named/named.pid` > /dev/null && exit 1
diff --git a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
index c2e88bf..db20127 100644
--- a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
+++ b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
@@ -3,5 +3,5 @@
 if [ ! -s /etc/bind/rndc.key ]; then
     echo -n "Generating /etc/bind/rndc.key:"
     /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-    chown 0640 /etc/bind/rndc.key
+    chmod 0640 /etc/bind/rndc.key
 fi
-- 
1.9.1


