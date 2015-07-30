Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0109.outbound.protection.outlook.com [65.55.169.109])
	by mail.openembedded.org (Postfix) with ESMTP id 4CEFB73237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:06:26 +0000 (UTC)
Received: from DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) by
	DM2PR0301MB0733.namprd03.prod.outlook.com (10.160.97.141) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 11:06:26 +0000
Received: from BLUPR0301CA0028.namprd03.prod.outlook.com (10.162.113.166) by
	DM2PR0301MB1181.namprd03.prod.outlook.com (10.160.217.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 30 Jul 2015 11:06:25 +0000
Received: from BN1AFFO11FD013.protection.gbl (2a01:111:f400:7c10::133) by
	BLUPR0301CA0028.outlook.office365.com (2a01:111:e400:5259::38) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 30 Jul 2015 11:06:24 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD013.mail.protection.outlook.com (10.58.52.73) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Thu, 30 Jul 2015 11:06:24 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6UB6JZc026460; Thu, 30 Jul 2015 04:06:23 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 03:06:02 +0800
Message-ID: <1438283162-12897-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438283162-12897-1-git-send-email-b54851@freescale.com>
References: <1438283162-12897-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD013;
	1:Nl0ZBxLlEz9mDMtCVhjqtDUEwSiov5RdQPAVyFL+itJ2MZJ0KfX/4z31VLcsWl01hw19PKeat70Lfc6ZgZxIKiKUJ0XbznncxSQt5sdLhFVyu9Tf7MteVIzJbkAmmGEDkb1598KlTrxxD6V4Dk1OchHDvkGz/lSeWz3se/92fpNA1FYbokwtJqv5LqPficdtP2XbFbUJxjtq6o/pFJNw05uJ2YkN38W1QpMZoG7ddWd4CCbPP/l8+rjeGN/vkei+M2TOgKddNV99DsSTSeBYPr3Dl1J8oK1aeSZ21pz1U+RzhTIucH6XNos3FphdrT7w7KhhPI8cWPLJ7042tD6VvQ==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(15975445007)(189998001)(2351001)(105606002)(19580395003)(106466001)(15395725005)(33646002)(229853001)(19580405001)(77096005)(104016003)(76176999)(87936001)(450100001)(48376002)(77156002)(575784001)(62966003)(50986999)(50466002)(110136002)(107886002)(46102003)(86362001)(6806004)(47776003)(5001960100002)(2950100001)(92566002)(36756003)(50226001)(85426001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1181;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	2:MBQRRsSxMyA+Ih8MRiO4Mwqb/7PmbYj6d5fDkUSyFw+HcyFtcSJ0z/6nqrT414NhmQiSbkJiuJbI6JyIY3cYaGKJTJGrxsGEDhMXdso7BgdYHzhwRQvDDVT3yqprwkGBWVYWM9In+8vxV1tpd/d/cnzqfRGPPN+tp7bTrHvGuUM=;
	3:R7VsxAV1LbgAF9k1TDHgI29/efVrUA/zPouTt6mu6ZrLDhyFYmxOxDfGLescCyxvnWtE8Wk+PnnxpbATklZAR3Il8QiFaIxQRjzS9EF2PdGYMuLmQGYrlOS6duyquKwXi9sZtKfNTQ6/QySllpBeXQbD6TLfSGAIPS9WTUifRizlJig1HduZdZd6N/b6htEcNALChmTgWN5rpuGMqLDC/WexXV2Ix25/f0pAYJ1VBWQ=;
	25:S8bGfSnsYD0U/nWa+4f3rrEtLnFvocfqN2lVOSKdHZ2fSLKV59EjIsF/hK/cUHtrYQ1R9VevOuiPgMd7+OWHZk9kaOAhPVW7MjCHdgzhvuNxvH7ZG3HeJBSzf7imaDrhrUElLJGbpbYHWwDuQng6BFRKDMuk3fxC52kwdZHyPi92jDfDiRKK8ihN5/kUqvKOnfPsoHue2Ly9LW1EiDhIBi/kkvaYB4Ag94qBZJKya9E9dGB5KQLXoqNg74dzNjsp0gk3S9wFg3D47KeXdQ59TA==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1181;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0733; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	20:f5fcCoHdtPaB+bHEm3a6Bg1/4oiHbbWkGdLg06R+bQMH17geu34yGW0jLVJVNrk3MwlxIVGCfIcrhfwgPysBYxxo81TwGTlkhK7CiOdOXJFi7hq01MlcdQmjYL0WcxYFeSZVWgY5YmsRvRGE8jDlM1fwUAFBifOSp+8kgT7kgEeQhFRyYnM054Xn0ZK1QNYdRjrCudQ+v4Cp8ApVUFbpExonbabb078sipLRQffqMPsowSRzl4O/mgLzRjwQCFP1weYOnEUlNz7mabri392wQLI2+OOPFuIWiJzJAfHJX3zE3vGhdfrjZv41pZ2N2EeOzvpaMGnuhE8oFn8aBzpjsl4a0yd2r8xhtDWlAnh1OnY=;
	4:hKkoEEIKi577pc/rItVBidrkMhkI8C4WTYTYp9HaKz1uYDA6q86ccW/ORSVLPBxNyq0Fpi9H1rE/toCxS2Llm3rRu/0KcHfHeXCdxlsmowi5UxPmVj8oA5g2AO0KbdMXiK6uC63LAio9qkmhScYU0FGjmpTel9LMSkIKSX9iNPIu8EF6OI7jAIgvwfGPhgQ9qhl8GIaZAvfUb+NKokv7QUaOG13jP/NgwiVnunFor7gC7hCNClm4hqdXz5AAE75p5hcC3WMBLhTbC+iCp+n0IKwug/vwWJkkJRI4JZCVrkw=
DM2PR0301MB1181: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1181FDB1B9AF2D535BE1C854868B0@DM2PR0301MB1181.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1181; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1181; 
X-Forefront-PRVS: 06530126A4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1181;
	23:pqDmV0sTG1eOSC8MgMHCjTWWoUlWoLatxJNfeuo?=
	=?us-ascii?Q?q8C//7hfTIV/TYGzxXeBmSrVoIJGwwcIXVvcFvp7/GNxAnmRcMvKk7bMHUse?=
	=?us-ascii?Q?cla0Lei5FhQT4uuntafAnLp8m1u9QpcH28ZHTWa79iDbZuf0biSp9I3ShUn3?=
	=?us-ascii?Q?nBeKJzF/aDGi3XM5gy8xPHEvvKiP1I92Ubxtb4debXoiMdUL3h8HF2gM4LaL?=
	=?us-ascii?Q?T7ZakhbYf+7WHxtwLzXLsveCBsOLBphKt1mI+R3+53mVYfXKTam6GV9VUFcD?=
	=?us-ascii?Q?EtMDpeSXgaeeva9m1Ow5TeCWaYCJcIUpZKSdk1O+NyE0lEgazv5fUkPkCgwc?=
	=?us-ascii?Q?kgADFOtknMemHzp0PS22VuQ/uiIJRRUV3ffFAo/vSXMjRz8MBz8SGL9SwGjk?=
	=?us-ascii?Q?d7BohmzcexrVlu3LJR9OqEkN2VInPzkgl4qZ9OdkHTlz9sCIC0Wl8jSMOOD+?=
	=?us-ascii?Q?Dt+dS8C9NiD+GCbP5tsglOeOMkLsk9osbJzp80mYuho7Y9IZ5K8A9DPPU8ew?=
	=?us-ascii?Q?We/e3g4ECMwDjAyfs23SSLWnDBHYjqjMQrQDfXpPjTL4j/V2hUvGhKCM8yqO?=
	=?us-ascii?Q?UeWzWIIesKVXb1Yn+Xf5hkBWUXbkli2jm8GISCLQ0aQoIG9gEukObc+NIPGF?=
	=?us-ascii?Q?JN5X5Qg2HHdkM3N4ZLVem9Gr+Nub9UVbGU87nPWfmgXQi4OC8o3arMdTV1n2?=
	=?us-ascii?Q?71Oo+A5BQOcQBvHZWfrucbaqp5EEewXfP2Yd+kDBDkNkTMWM7suTfxkV3l1c?=
	=?us-ascii?Q?TKHKMfOGrz9KdlXK/GYdobgG/ynna+97EjXpgLZfR9e+yaj+JavwnKetFpaP?=
	=?us-ascii?Q?9OzfibQq7hIrQC+Uy5IeLIxoE1Zmy6hnL6w2vYgC3pyfyeEVFRjDnMdDew+E?=
	=?us-ascii?Q?KrzrM2iN6qaFetR/lr9Mpd6XslVGSwUneoxGKpBlqxBt6JBJ1Qwy8TGDJyde?=
	=?us-ascii?Q?Q7ty+lY5HkJWxORohY5Yvwvx/3aU+bi7VN+EemtJR5KnpLL9SHt5vxwEMG+w?=
	=?us-ascii?Q?HoAuiMSCs5b7RmaTYO6yd/tlvziBTJKltWnbI/S40ChmYAw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1181;
	5:pDy4Le+fGzyws6vWA3/Qcu09HwTMNlvtZgyd5fbAG3qNJ4p3t/asf3DlC4IhCx9QJR5rNO9vGze1/y1HFaAsYGJJlOG+bbOLQ6576YBsgXD0s/yew18BLmRvP7TY3ffXIKgSdkE4gGbIy2HgPgdh/w==;
	24:DMSE47vXEze4LB+bbuBBtwgS44fwB/YNKaIrkH7sjmkb46Pv9fxGu0N5b8BN+T0aJLTvBTbEQMYfZdjZ1JU0taMeOWZi+i0dBeIsN3xChu8=;
	20:2gzNK+SkUKC1Zi6Ue6xu/EP6EDfh6DB7r9o2VRz9KsVPvrdO//7LS/EWGQEehYjcrluHQBw3QqvUXtm4evdsGA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2015 11:06:24.4168 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1181
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0733;
	2:KkfQSHncw3x3OcLFHO1jcbisnA/PmXHzY3+wnxPM3O09f4abQcm3ZT24yaYZuJbQbuZ3eMuE8dUZ6iu3kPaL7XGykyDo2D/6W9M9KTm99+6eS62caavEGQtFpmv9C437mWFmt7tWmn+KdhGkRF32BxWoq0DjqpVJ5oMWxXAx4cw=;
	3:dUcHi5RYIKNU5R/WVNJxuwKGsEqFrSyFPqRP3z9zwdmA0gz/WolzP/+KYUuvO7qHwuUFEWew4k9FdqFBE0XimpPRzJf1scORLD9/9sErum//lAMiG/L/62hRBO2q4YVAMuwZarsXEu0gd3S2bVy2oMmlwTcWrcTOZAHDP6vF1Zf1wc+ZL/YhiqTlcKM54Y2Q1iagos9EopUbE68H7Rdo50OZX9pBK2p0KcaH8T90HC8=;
	25:2TGmybhDtcjDLfrB94H/0L/nL/DZO56TX3tOJQwkHvFppIztcQFm87xM5ZAobn5vD3gBhvE0+SKgVEspqn/HiSBOyq16emQMLktFh99joJ6pf/uPFOeekp/aPq6TgWxSNjzgsNtFyyVnC10NaAidty1o+233PKMGvOvK8F8RDNjpAcQjrFHr+1G+i0SFgoh5TEPrQCyjL8/Hf7ytSI21RnnUAL9rao+foiWfP1YE2ejQpU5i4C2YUN67eu8BO5Qg1CjhCZZU+wr/h5tdUij84g==;
	23:pFjHIFouNnZSzyRgaOyiIxCMX+CmFgpZ1qqIpQzPQlwZG0WRLXG5QGNdZFIOycBD5WwbVUdHf2/u3paUVftjiqTNiX5CR+bAUFOiJY1TCcrK6TGe7qUBES/iu0oWBBmayuJHwdyYaf0poVHCRVSA47CnJ0ACNZmiE6XlUX7mc2f9AhLlOYgY+ibjGnO01nOcIYX40PZE4qEiWe9JXjADtys5gWAtTAONaCnOS/26jqyJ/clsVibjNqDA9UbAZG0v
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v5] pulseaudio: Revert "launch: Avoid specifically starting PA and rely on autospawn/socket activation"
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
X-List-Received-Date: Thu, 30 Jul 2015 11:06:29 -0000
Content-Type: text/plain

Pulseaudio is always started by autospawn, which is there is default process in system,
it will start the pulseaudio daemon and the session is always exist, so pulseaudio daemon will be closed.

But in yocto, pulseaudio only can be started by boot up script, there is no process to start the pulseaudio daemon.
But this patch remove the starting PA in script, then pulseaudio will be started in yocto.

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


