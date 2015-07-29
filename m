Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0102.outbound.protection.outlook.com [207.46.100.102])
	by mail.openembedded.org (Postfix) with ESMTP id E015E76455
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 15:50:16 +0000 (UTC)
Received: from BN3PR0301CA0028.namprd03.prod.outlook.com (10.160.180.166) by
	CY1PR0301MB1178.namprd03.prod.outlook.com (10.160.165.21) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 15:50:15 +0000
Received: from BL2FFO11FD051.protection.gbl (2a01:111:f400:7c09::157) by
	BN3PR0301CA0028.outlook.office365.com (2a01:111:e400:4000::38) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Wed, 29 Jul 2015 15:50:15 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD051.mail.protection.outlook.com (10.173.161.213) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 15:50:14 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TFo41v032166; Wed, 29 Jul 2015 08:50:13 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 07:49:47 +0800
Message-ID: <1438213787-19374-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438213787-19374-1-git-send-email-b54851@freescale.com>
References: <1438213787-19374-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD051;
	1:t4WUn6M/25du6yZ4nWcGeKomqMVoJAkLM2ubfV3MURHWIiZTNNYZNvzU5M/U7ulkAVhJAQy8732uibrxR+vTJAhKbw/9NgynyrBAbTlMSbhVlSbSm0CENYnEvQCgJKsyFdrzjYWBwfXS0IA8+ENUewyG9FyGoVW8nsYDC31H+pNeWoX2seLihlSR8vN9QTFAIl5mgFdeHi5Qh4Y+nUAlsLrTEsLMlYQ+CJS9quY+n0ko0o5l7McfC7HQWzuqa1NMTq6UfQeSWm2tWfSZrjwIr/oOj64/5uEPuLAGTONZqcMUqgib0JgO8/l2rOQh339uhV2PqiMvXsgf8i7/gK0nkg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(5001960100002)(105606002)(106466001)(19580405001)(87936001)(6806004)(19580395003)(48376002)(189998001)(110136002)(50466002)(85426001)(36756003)(107886002)(92566002)(47776003)(50226001)(76176999)(15395725005)(2950100001)(104016003)(50986999)(33646002)(229853001)(2351001)(15975445007)(450100001)(77096005)(86362001)(77156002)(575784001)(46102003)(62966003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1178;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	2:7W19/x7BcydmKk3womCSGUUKQ27KXBOj01XnsAWbht/ZDBq4n3UDge2RdYG/ZWvuICHuijXWmuQTmQ1QMubhVyCv66puDHEELel6j0jPuAM507vNAh/9eE26ExpqjRBMTQRgLJP99TRKKS7ZXoOTxtQOIM7/dItFXU+EggIFkxY=;
	3:HSH7fZmDZJTEMqpqUcauksx1KgRUBEHqkATZLlfQqlUAPtdzVTbD6gIrsxxKh6KzrgmsvnyhbQZdlzh5cxneDYt5xZJ1rLW4VsIpnN7Q5M1dlc7dUNItaR6t7OtvN8NH+UeP5kKz9qQXqSKUq9o2UYU3a5WPVflWdIPDHDUTErvC+IdTtPqOzvOuJRyLMFj5q41GgHcRXtqsQHr+hdU5+92v6cPkqyYY+iZ1iuU0xxo=;
	25:aCyg0Cn5l8f+Am+2QLvx0US2xArBmWtOJszR42Hd4urUHFpFUW0tDrwxSUMdomxPZzERIVX6/DMmewzfKudaUDltD70VTFiJVithPvshIHP4vFDOsGkZlsVzcCSdK3e0YKYWFoAYxjErIyl8WNxDF5jMMf3HoOqHNlG/eprIYJ8re+WueiH8VHHStjjotRADLNusj+OmIwl/oEBPTQIle1hP4yYxw23+T8JBd7BFWmFUP3/j1HaUVl/oedZzz8apNr8KaHDJlO4lJsL24H4g2A==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1178;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	20:hi9Y4ScZY0pvjuJgLtd9uUBgr0MrcyU9gtvOYK0tv5hAF3rHdlmR/PdyiEjT/e1kOXJYv2jN0r790ZJbylFk/sP5P5rV9UNx+N/M3CeWk1+q11qxvwqhxsFIMnslbl24xWX+I4IWUFYafbB4k285tt8Qej+b7wb+cN61ODNzQbR1wlBlhEVS/8yxRdCPFTA0UiThRpWE3wA7W+oz6VH5LJPthHqUVvUxmGVHrN/4oY6Rp84ay87/81VXW9EEu+h4rUogueha+xzLaSCnDTES5DxIgiznLgJMlovlqkH83y3jgXggeiniCgojgtTstWSntaCf1KSv30PafXFZMrW6qh8uVOdcms8qFHzTRokCKTM=;
	4:4+tSsosLBhVEnqdxaM5L1s5+wpkgEAcWu3lhbQDN8uO4AodO9rKdkk5yyeBCibPurFNFxyueoBjaAHcafrIPqpRCZ9qnZK5+QafIS9+8UUbT4N21+qv2i8lG05b0nC2DzKEG0mz7lposfvyR5eZf3F7pDSeOKCIulLT2cAoBU761oEr+pWyQeruCvgGEhjb9JLzqQwzqIBBZPNKYT4clyIKLmuQeNuuD2UbknBPJrijvIga2D0tn3vTizbjxe1jD1dBXEa5Cr6cGHltYEY9aAIU3wF084bohOsuqvsE6MV4=
CY1PR0301MB1178: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11789545B68E2F711ACF2CBE868C0@CY1PR0301MB1178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1178; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1178; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1178;
	23:kE8PwZPffw+VrvScFRk0M+j9gMIAWDAFIhEX4ST?=
	=?us-ascii?Q?S6SgtoRWOZ57QCs1LCniHSiq9As/LaAlA8+cDjqISWcN0QdgN/seesGBkltK?=
	=?us-ascii?Q?8ndZ6NDaAtEIe9J/fggTIvCJpt3AWPAZDiwjJ0k23NtW1414nz5TZ+BZ9x7m?=
	=?us-ascii?Q?dnbq4EOJtJCosSKYr3noeHu+L9DRB2psP8s72Y9rxEX/fn7NSLycGqInNXSf?=
	=?us-ascii?Q?133HZDZj/YxOd5sHTqI3ropVP9HuobIvgWuf1wiKqKUqvuw0aimyC6gjtJfN?=
	=?us-ascii?Q?l6TAVokHfq7vjuq6ccp/7MozZlD9vBSQB+oe47IDs244fh0jFpyffjylxVfk?=
	=?us-ascii?Q?+eNlcUd142/AVKCglWokABnPjzx2skjlN8mkUNnViEroV3RTrx1k/56OR73S?=
	=?us-ascii?Q?JUk5F2NMYjcZgEceEP6nnyzFZ3NkBKor3uaMTBMZdG6VsNUD1PS7ubdin/b3?=
	=?us-ascii?Q?Eol0iqYG0Kw8Amt1nhHJBjsM4UAqZ652HlkM/MRb/2YiGcdBoW5OTWZBOr0R?=
	=?us-ascii?Q?0SFxjFJSoOvgJ7GApz4p4z0RT5nDETjEq0oywjUc97fDyWm7vT8LY6A0V3yF?=
	=?us-ascii?Q?WT6onoNjtMzcnuKjNoKGQA3hlIcTcmBsG5VxhrDcxqofYnp7pFM8mdy/W6fJ?=
	=?us-ascii?Q?Bj5Xvwbpbn+AvvLlKPK47kT2NeAsKL40CpHfwUCRORsqgOjmyr5NvkTXfA/Q?=
	=?us-ascii?Q?WMJ8RtGNNlec1cRLn9nrmxDPiqt8qHnVrop+vtCMLwAQjvlE2w6klOF8Z6/r?=
	=?us-ascii?Q?jLg0JehCGExELpvTlJIFlZNV6LpmSTGSxYtsr8vPpGCY7Re9+1i0gXq4MK7E?=
	=?us-ascii?Q?+4TKYtAZlbgpQDK1AG5ZjsBvUnQs1zgnLhWLWnE27nUogWoih16zhxSSVYQS?=
	=?us-ascii?Q?Bou89i8ksMMk6IyEOF2kcdrzD382eCfWvUntiL0jZwoueVskGft7t+Bp/sqj?=
	=?us-ascii?Q?OpI8Iw5kWR5xeXDbf6rg4XPAxMo2pQ3TsbvtWk1Ixkc4UNTOjojFtkaH9zxN?=
	=?us-ascii?Q?R0lWPykl3z/numXDWW4FL4pl+EdwOPaxLGadJM2jM9mu3ew=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	5:l/aIWK1KUW8sdWD0HvQjeYa3lKr6Bnw90+GHBC5oAKssxKz6KNUcw5gPCGKfk6fJ97J+DYq0XDyjk3LEq7Tv9qa4tN00gZ973a/iFwzwr7vz2esz2f7qCOnPzGXGGvkWsR1o70wksjPFg90wzgDvBA==;
	24:fGahMGH+3zs83ZTxwQv/8LKy+ICYM/lL3TKXGoIA0UMVlYe4D16jG8+OJGQC1Y/kHBBfy/pOdQoZuHjodhk80pj7zynRoIMBguqacub1y9Q=;
	20:4Ba8vwX/dvDNX8iBJ4yrzX6ZAVC41zzrE1msXDCvfxN5QUR+79DP61HOPB+PfW0Vcj0tU8wJFCi/v/ctddHoPw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 15:50:14.8730 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1178
Subject: [poky][PATCH v4] pulseaudio: revert commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7
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
X-List-Received-Date: Wed, 29 Jul 2015 15:50:18 -0000
Content-Type: text/plain

Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
or the pulseaudio can't be opened in yocto.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...ch-Avoid-specifically-starting-PA-and-rel.patch | 31 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch
new file mode 100644
index 0000000..669c355
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch
@@ -0,0 +1,31 @@
+From 5760c6b1a3c9b6dd8e70c9d1ea78fcf192250b4a Mon Sep 17 00:00:00 2001
+From: Shengjiu Wang <shengjiu.wang@freescale.com>
+Date: Mon, 16 Mar 2015 15:30:11 +0800
+Subject: [PATCH] Revert "launch: Avoid specifically starting PA and rely on
+ autospawn/socket activation"
+
+This reverts commit 42156d2b5ac797e5f28f8d0d38b691053f3f6fc7.
+
+Upstream-Status: Pending 
+
+Signed-off-by: shengjiu.wang <b02247@freescale.com>
+---
+ src/daemon/start-pulseaudio-x11.in |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/daemon/start-pulseaudio-x11.in b/src/daemon/start-pulseaudio-x11.in
+index 16e46b1..e108645 100755
+--- a/src/daemon/start-pulseaudio-x11.in
++++ b/src/daemon/start-pulseaudio-x11.in
+@@ -17,6 +17,8 @@
+ 
+ set -e
+ 
++@PA_BINARY@ --start "$@"
++
+ if [ x"$DISPLAY" != x ] ; then
+ 
+     @PACTL_BINARY@ load-module module-x11-publish "display=$DISPLAY" > /dev/null
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
index 31e9096..10c3d7a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_6.0.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-conf-parser-add-support-for-.d-directories.patch \
            file://fix-git-version-gen.patch \
            file://volatiles.04_pulse \
+           file://0002-Revert-launch-Avoid-specifically-starting-PA-and-rel.patch \
 "
 SRC_URI[md5sum] = "b691e83b7434c678dffacfa3a027750e"
 SRC_URI[sha256sum] = "b50640e0b80b1607600accfad2e45aabb79d379bf6354c9671efa2065477f6f6"
-- 
1.9.1


