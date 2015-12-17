Return-Path: <Tom.Hochstein@freescale.com>
X-Greylist: delayed 860 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 17 Dec 2015 22:19:21 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0148.outbound.protection.outlook.com [157.56.110.148])
	by mail.openembedded.org (Postfix) with ESMTP id 2096D731A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:19:21 +0000 (UTC)
Received: from CH1PR03CA006.namprd03.prod.outlook.com (10.255.156.151) by
	BN3PR03MB1416.namprd03.prod.outlook.com (10.163.34.23) with Microsoft
	SMTP Server (TLS) id 15.1.355.16; Thu, 17 Dec 2015 22:05:01 +0000
Received: from BY2FFO11FD013.protection.gbl (10.255.156.132) by
	CH1PR03CA006.outlook.office365.com (10.255.156.151) with Microsoft SMTP
	Server (TLS) id 15.1.355.16 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:01 +0000
Authentication-Results: spf=permerror (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none; freescale.mail.onmicrosoft.com;
	dmarc=none action=none header.from=freescale.com;
Received-SPF: PermError (protection.outlook.com: domain of freescale.com used
	an invalid SPF mechanism)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD013.mail.protection.outlook.com (10.1.14.75) with Microsoft
	SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Thu, 17 Dec 2015 22:05:01 +0000
Received: from paisano.freescale.net (paisano.am.freescale.net [10.81.19.190])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	tBHM50Th006842; Thu, 17 Dec 2015 15:05:00 -0700
From: Tom Hochstein <tom.hochstein@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Dec 2015 16:04:48 -0600
Message-ID: <1450389888-24760-4-git-send-email-tom.hochstein@freescale.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD013;
	1:UNkNSvuB6coSpA6jTV7x/X2Vhz8wszANN2gRHAhK7sXdRxNhKLVbKc5EHzNWZDT5e4KVrhRyB9GT4jq5C+mmt7Q9Jiboov3A6FztXVzKtQVOT5AZwRNDdci1aUzqqqQJ4rNI2YJG30t5T+f1lB7w0MPndMIqCU+dP8votvQU64WmdLOwTIqrKuSufoa5CqI0M3f9scUNMXE98aElzGOUT6c+wURoW63+zCQVPmWDBMlK73akxTutUu+SfohJPBskJl5NOJUhkNJPTK0VlrLhpLi8NJPqZy6rr90j9pdyPmLHetRwN5ksxHP0aQiFLo30TKHnf3h9fdWLwX2gR3vOYRU52AKL1kztO3uE2kXyt873rEhBXrjYfqldh9a1tuTGdM1BpEFzbwVf8YVhjE9U1/zI62m67wwTGTbJXYiV4tB58xPrYHQjrb3mV2dUKD8u
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(448002)(3190300001)(199003)(189002)(11100500001)(104016004)(97736004)(81156007)(53416004)(107886002)(2950100001)(87936001)(110136002)(5001960100002)(189998001)(1220700001)(85326001)(92566002)(36756003)(50466002)(47776003)(76176999)(48376002)(4001430100002)(5008740100001)(229853001)(230783001)(50986999)(77096005)(106466001)(1096002)(5003940100001)(50226001)(33646002)(6806005)(19580395003)(2351001)(586003)(450100001)(19580405001)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1416;
	H:tx30smr01.am.freescale.net; FPR:; SPF:PermError;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	2:kgLe8fW1YLNGilOsO797gNuh+qo73PlBLKGxaBKl0A1Uuo5NYuAPHKSwRFdhsvYYB84Tjp5KodUCPPiMCAHlvNRwrk9QNqU/m5DROaXYD1rXlD1xczZ9IHACu/ulUqUh2mMBNrWbrGtkIKHAAEXmdg==;
	3:yzYFFZxAc2ZGgV/Ai+xHaYrJY1armg2YD4nUOOO+w2sbHzg/8qZI+2a4/cmUTJmB2LXQ+n377R8Y8ZFAn8AanotVWUMla1tjjq5nt09epgSgjZK8NEjSQEPMB/tsOp6voHRBIUR4WRtgFeupxQ1RibIyKnH8+DFCCigW/0CUrxBhOQYV6oTe2yOTT/NdpOHAyfh5it/7HrIZwGv7sbIAYdHLuFcOOsz5ElJUPdskRaU=;
	25:q5I1MYQUcKK9huXwQ2EvXywGRXYJnTcgSiWphcVi5bVP+3Bbw8A6AcDasVmgWtGR4X3nf9H0YZhoA+dOvUo64LiPMqmRm5lt3B/B7+/3PeNyJU5t4+NIWOin0/2HNyXG40rtEwbqcfn8rfeCsjcF9fuyt9rm4gPX/eopXPtzx+dcURK4ccagcSjeEfaJgB9CYhqVRS7x/hPQBXBrXQofmhX/DIXVYhoZX+QY6XAr8BOuC2jKE3rSaLXx29tQq5u7ZsErmsT5saf6yiCyoO/LUA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1416;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	20:aABqo0ycfrQVfIoIxrE+R/njhFKii7QIo6lX63L06FJj+Vt3UHomuBCMXAofwgbUv8f6yYa1YMb0m9LT//t8MOOWHk9xK9P6HBnAbXNgzkKovBlbABBUZCGd0raGVRTIYoXYDZtMwxbvolOOJ34UVkuiROrIXnM4FMbkqG9jcKItlGTYj3z+qhcF1BZ+8c2SGQz80TOqnu3BFDbGb2ueD8Gp3m4R3RyI0pLX54s6NmzrgA/UMLXuGwOGDx7p2XxnGkp32ErXzD0O/ICpOYsdq7X6PtHF8DvdQYJTD6/+NcFA17evOyypPbaUmCx5HtG1LFT+G51CKuYP5aesGg5UzClH8BXzFoZUDYj3NqCiZNA=;
	4:MYyJGXv+AyzmgjJ7Wwg8YCZtSDSLZaO/iz3IS08Yenfq3xvDZ87GpjmMMopwDxGNAwAQ8R9S40Xy3sD4iUaAdq2KxAee+8N26CP+9Y4/EL0jwRnEtaMjlRizhafp7jSZgcUBykH8/FUYTkXtrUpX0JYTeWOnr3apNQLUo4h0d8ScsIkwXhambI033Z/A6cXZEvUXafayCa8M+arn9ARgmNE+6AAsbcpJU3ss95IL3pwWxQHVe3FQSH7M+n6YvjwYuIbHMUgd8WZj8Q7eg+Ka7gbBPX4w9Xx8dAm34CNgXLThYngvnKcQx4vfQomIq2SomdWbGvUR8weSg5Bzz7UDbpD+EcK0VbMLbVKGV1cGJLXW47yc8kbkyoqMW2ESBElxtaiklLmG6HUgUQV/Rr7Gag+t8WVoD6CPdxPwOrf6wRGVRg0Wlrv30a2hxCSrTq39
X-Microsoft-Antispam-PRVS: <BN3PR03MB1416494AD354432417AC9314E8E00@BN3PR03MB1416.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(10201501046)(3002001);
	SRVR:BN3PR03MB1416; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1416; 
X-Forefront-PRVS: 07935ACF08
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR03MB1416;
	23:q1Vk9dcHcEYTpaKf44iKFXdJG2qJP2Nu7vKYNwWBO?=
	=?us-ascii?Q?tuVWkupjCeLakbTLxBprrXtFqDgkAuaBaTWoLu27p4czwDHhVWf2zSxL+CT6?=
	=?us-ascii?Q?aVOQXhA8gfRWjRQ3P57E7wKed1TJHFRO4JF1OGMcyMMPQ7qPeyHKdrNBkeSe?=
	=?us-ascii?Q?GqtzOSJkLkF3SBx9aGSMxVsZCXXv/7M/Pp9gAoKrUdVmQa/gTZcu25BgisJy?=
	=?us-ascii?Q?jw/FstD/qSW1I+lBR/Lfr9WI8VymLsDpY3NtLNn4S5WDCaH/7IYsKmHVg9mM?=
	=?us-ascii?Q?gorZKdPaximpQZEVfUdrPEP50HbGzCGXgDWSp/H8YKbSQv7+DMUwFGJWG9RR?=
	=?us-ascii?Q?4J6qwOtxL0PYXTlR3tQwtsSgrnnhV/n7jD30PrFZ7/JIIDFNf2+S/UyOsjh8?=
	=?us-ascii?Q?GRWlvJRu6HCvSEab5hzngAKU/q9VNtHArv0YmMl3CM6w/GYkdWJhawXEA3Lt?=
	=?us-ascii?Q?KJnKQatLWMPXz8qgwvIwWDXOHDNJplq+sfLwjiMr223zmQFI+LbjU8keRBie?=
	=?us-ascii?Q?YtXitXb6pbwTxWo9ZqZrjNqA3oxJnwGhnssdyi6zv74DKTVoDXrO2lJVXpVu?=
	=?us-ascii?Q?pgcPaKZUNSrllw5ty5PIc4o8qOBmN6ezG4FqS8qS+glcm0CS16R+ceVfEO2Z?=
	=?us-ascii?Q?QuxLslQVOe43Pe42ZJLXn/YRcLUgfeJrQMF/IRrU+hQ8Co+oTdMxcvMpYXOR?=
	=?us-ascii?Q?iCmAN1LW1W1QEpJIdzR7B4lOT4Ww/CPSEzVyhHF7SkqV++mEYwEQs+s/ipCM?=
	=?us-ascii?Q?wlIcav5rFob56hWf8WcDGqAlTAkQEHPceKfMyNdR15UZwNqbcZqYKUNnO+NO?=
	=?us-ascii?Q?jn4wS+leghrcUmQ39Cub4OAwdA5FQ5Ob//JedcyIBJ9qFrMjUq5s/20oCTFu?=
	=?us-ascii?Q?Q4bcoEZNv6f4V+9K9WqYqR6Jc+8XTdQDj4j+8Ev5ueNgI1MBMv3ZY6jnH7cG?=
	=?us-ascii?Q?wo8knj7NYzrS+flgdPe9VoZQu7VBGUZsGWhwwbViR5xd5pmQ1wAZkXhPTXkD?=
	=?us-ascii?Q?Hggp3HTX13AHQH0+XYSrtpcfA26LfgAxpBwywqm7iqdAhEwxK6+wZ6Sbreg0?=
	=?us-ascii?Q?TtekKA4j9udQ3sTMP7AqM2xLnikICh0cZyv+ZXIjQAG6mU3N7SKfiFpCWHDS?=
	=?us-ascii?Q?/GsrbvJ5p59rNHSIvsEsXTVGchx6nqd?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR03MB1416;
	5:HVp6Ql5I2woNvjqxiO7USU20VkTuhXqKVvmGcQeOly/MkB9+ppzGTYPckV2Xd38Wk3WtPwwj2fTZHT9s++n6muRrJgbcOBPo3Y6qdIbLy5L+8wAow46Pw4gy+eeMazqE9iaBWPOsGcdLziT2BawU1Q==;
	24:2GQLCVZ3kmOT37AcxZ66aXj541MDdCDP50RRXDxS5Bk2LerlHcnoFcUqU/ifEcWxXA01GKDMRTk9vJw1idivcipsunrMKddxXIEqQgyXNaU=
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2015 22:05:01.1169 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1416
Subject: [<OE-core][PATCH v2 4/4] packagegroup-core-x11-sato: Remove matchbox for XWayland case.
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
X-List-Received-Date: Thu, 17 Dec 2015 22:19:22 -0000
Content-Type: text/plain

Matchbox is redundant when Weston is run.

Signed-off-by: Tom Hochstein <tom.hochstein@freescale.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 6679db8..4fe21d1 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -25,12 +25,7 @@ NETWORK_MANAGER_libc-uclibc = ""
 
 SUMMARY_${PN}-base = "Sato desktop - base packages"
 RDEPENDS_${PN}-base = "\
-    matchbox-desktop \
-    matchbox-session-sato \
-    matchbox-keyboard \
-    matchbox-keyboard-applet \
-    matchbox-keyboard-im \
-    matchbox-config-gtk \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'matchbox-desktop matchbox-session-sato matchbox-keyboard matchbox-keyboard-applet matchbox-keyboard-im matchbox-config-gtk', d)} \
     xcursor-transparent-theme \
     sato-icon-theme \
     settings-daemon \
@@ -54,7 +49,7 @@ RDEPENDS_${PN}-apps = "\
     leafpad \
     gst-player-bin \
     x11vnc \
-    matchbox-terminal \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'matchbox-terminal', d)} \
     sato-screenshot \
     ${FILEMANAGER} \
     ${WEB} \
-- 
2.1.4


