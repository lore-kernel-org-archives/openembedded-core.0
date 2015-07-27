Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0102.outbound.protection.outlook.com [65.55.169.102])
	by mail.openembedded.org (Postfix) with ESMTP id CB73A762D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:30:01 +0000 (UTC)
Received: from CH1PR03CA009.namprd03.prod.outlook.com (10.255.156.154) by
	CY1PR0301MB1180.namprd03.prod.outlook.com (10.160.165.23) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Mon, 27 Jul 2015 03:29:59 +0000
Received: from BN1AFFO11FD013.protection.gbl (10.255.156.132) by
	CH1PR03CA009.outlook.office365.com (10.255.156.154) with Microsoft SMTP
	Server (TLS) id 15.1.201.16 via Frontend Transport;
	Mon, 27 Jul 2015 03:29:58 +0000
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
	Mon, 27 Jul 2015 03:29:58 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3TniP011958; Sun, 26 Jul 2015 20:29:56 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:29:35 +0800
Message-ID: <1437996575-29558-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996575-29558-1-git-send-email-b54851@freescale.com>
References: <1437996575-29558-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD013;
	1:uBI1/hsZ28J8PD/JfVd6TfBvcQtR6jkO1qBjNoVRcv5Zl1HGE74Vx7MCvwt7GTL9Mv2m2kjfhY+MA3Oj1rEw10wDuokKO2gHpZhbSwwxOSowIA6hMINnD3eIq63+k5L4FBxaHnz7UPgAeIan+LL9xq3j/dr8JrUoQ5izfkHzqzGjuJNX4iRm5e9z6hLTE9pInhzTTFzaChiZHHut/tyC/+OSfo5rbkvv6LZlHcbMVn29HAJNpzxHQXLWyznn0Zu4NFoMp6+5kZCjXamTBi7kSUnNVmWIFH1vox2uontqMznGpRjlzSokZBiVXHhJEFagBJbW+NaGmtEebBZ4A24Qzg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(50226001)(189998001)(19580405001)(87936001)(47776003)(92566002)(5001960100002)(6806004)(19580395003)(50466002)(46102003)(76176999)(15975445007)(33646002)(2950100001)(36756003)(50986999)(86362001)(105606002)(77096005)(107886002)(104016003)(110136002)(23676002)(85426001)(575784001)(229853001)(5820100001)(77156002)(62966003)(2351001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1180;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	2:+3abcB9qxzAjPlaxXUMX+zqvA3q5fFRY/P8sTCTQL6fgIS9H6QFneHQEHhHgaZ8uKH1BVc36Gt6vkrGtATRZyDO5qRa+qAkP9Eux3loXd9ce3vs+K/qYsft4qLBlfx+ElGMQFe4VhzBcZl3MJOQHku+XRbAhgX+N4/biJHBoxWY=;
	3:9/nMEBrAae5uKe9muIlKxw9sA46AfkFmyqKEawpVOhyg9eRmlout4vy7B4wmydd1OuDVzKZjuvaDKe+tlXLjOmIfWv1q6L99+LILfgZ9/7+33ysQAdi4ukRmBK0BY1lh0bGU94Pe6psfEPXWBYka/lwb0Vrj3cAq6TY90UFdWnR63nnX/I/fpok5EVGsbUKD0ZOEL3HZqw+LmTqAiuH9Ezj7YrkAGO4Yb0+erd6nils=;
	25:DPAQeBvfUa4x8O3D35zLr62sABE6ZfmltT/Kz9uqdbGnPwqwmgSWH/3yAXZRn599X7CDYhIdAg4P9zSmbsRp7ZNqfNqPpbdOMSc177rZBBg8upK52CaU7U8nvbetjXw/V9OwSqvrZ0sw6Na0DKUwWDgkzjwYvT7lKiyPqWMumsr2NDTPs29vdOYYRKxZMtN3V52UVpt1GQZOtSiSQND0b0oBxHu10CdMJkawpEleeOGO33gxbmuS4LC9aym1bJ8tqau296yWE1EmJHE4jayr4Q==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1180;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	20:BWs36qoYMYUOs7QBKifUARiBZlBj1MXWjNGmJ27xbubF0w8K9wQprK8+hEgwAnjKNFPHhqLLOm462oXAl30LNk93UDHsBzc9Bwt120IRtcaZZ2DzskzfsVEUfzuaX1J+Vt8Bu063dIbZV00DKfSrxlVJQiiZRiriA6+yRwPGSZ9BoR2QG8qpsA3xRl1ZRZXknqn04XsYZvLGLV8ikPkn3vMvqXIqnZ9QIrHeYfQ4cCM09GtxCrLn0WA5X9jFw/yv/apdix2nnPlgqe7TtlzwJ9Sztfl4Gf310NEy/wfKomwl3akkyz++N0no8LDRVNtFYy7sVYG09eBN911Wuy5HGHv2sM66uOX4gyvXjQndXl4=;
	4:7cc3SDO8thpiHB+gOHkKmMVwOka6Y4CW/Xtg6cS+rPnsX7XNoySey0TkmgnctGf9FRm9vJ5l0Yb3TQv4zJRmhT12JD5hV0jiDkn8nE/QyTQwH00DbH3wlX9/ETRbIcNCuCSYCfWMPTiN1dQpcAq/niUaa5c+zv7xGY6rH/USQpLi5HHO+T5S9wzxe2Tsd+A91uKTetjO2EWFgWxQDWIhCTg1K21B4n8oIxJwILn7H+LEPCHNFf55c4pDZhNdwF12VMJpLWUIQ7+BS5pMnw4n/HnCmDjmhqDKG2+Pab+eV+Y=
CY1PR0301MB1180: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1180EAED54189BCBB93AAAFC868E0@CY1PR0301MB1180.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1180; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1180; 
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtDWTFQUjAzMDFNQjExODA7MjM6SWxoZ01CL1Zrei9rZ2k0Yyt3SWpOdzZz?=
	=?utf-8?B?aTU0akhiVEVlL04rOE9zWXc3bHZZeUdPYmkwYVNQendpci9iTzc2R0RTWGNT?=
	=?utf-8?B?bjR1elg3Q3RFckdXeThQWmlUS0tRN1h0YVJ3SDlrK3dydHRiQ016dXlJeVhD?=
	=?utf-8?B?L1BsOUVsTkx3RkwrR3JRYmZzb2xUZnNwaVRBajluNllaY3ZsaFFzelZwVWF5?=
	=?utf-8?B?ZUF4bUxNV3RLY3BRVjVDOWpTbmxITGQ3TGNWUTlpMVdmV2traXpTam9zZEhY?=
	=?utf-8?B?dHVsbHFqMXk1UldwczBWelZua0J1aU1rb1JES2Eya01lcnd0U2NlZURNZHZ0?=
	=?utf-8?B?bHRkT1Jjcm45YUFCWTdDRjZXY3JCS2ovekxaV08xcStQZC9qazRLbVNKeVlJ?=
	=?utf-8?B?dFpyWjlWUmNVTm14amhUMWFVZVVieC83ODJQOTYzQnh2OVNYQVplYnJ0U3Zz?=
	=?utf-8?B?aHFrRE1ZWUFuSzMvT0pXSSsxaVRrZVJ0Um9DRUFnbU1ybXZEenpaNi9VbnFE?=
	=?utf-8?B?NGVFTEg0R2pVU2s4UWFVSnJocW1BYm5QTERzaC92UCtnZ21hOXpPSHpuVm1n?=
	=?utf-8?B?V3IzQm5MTTNiaFExODVsL0N6SENTMWlpaTRyRzRUbFI5ZFJ1WUxlZmhVbyt3?=
	=?utf-8?B?cE9neDZGVzVQbEZTYjdObE1ZNlZhcXpWL2tMSldZNk5TeXloV1k4NDBLUjNr?=
	=?utf-8?B?Y2pvR1pJZmgramZydmVnMWxEMzl4dUJoa1JTenJoTkJEMXo5OVAwbnBOdTNa?=
	=?utf-8?B?Z0ptSTEvRk1KU0p3akZvYTJmQXppWHAxMVpjTjF5TkV4dUpOT012bVVZOGg3?=
	=?utf-8?B?U0laNlNJa2FHL0FzZ1Zha1RObEw2YzVBQlVaTkF4Z0h0Z3lTeEU5d2dPUXlE?=
	=?utf-8?B?Nzl3YXMzbVY1c1RoQm15bW5UT0FrcHJzVzhIM1cwOWZUV21XVjVxTlZxM2Jl?=
	=?utf-8?B?MlZ6cXQzN3FqbVZscHM4bDhuU1BkZEtQY2V4bGwvZ0x1cUh1VUkxVzBQRCtI?=
	=?utf-8?B?MVNFbjVPRnVSQWNrT2lQdmxDRk9Za0FmUjE5MWx2SXVERkZNc1Z4UXk4VzJv?=
	=?utf-8?B?b3lNRzdhN3lsbXVJQ21GN3JuK3EyRjJCRW10WHZLOSs1dEcwTHdZOW5xSmJs?=
	=?utf-8?B?YmxqWmpybmcyWFQxWEVXSXl2UVVHQW83Y2VyQ1lic1lFYnVrYkh1NkJneHJ1?=
	=?utf-8?B?Z3lnaExxWlI5cEhFblA2aWIvemxGMmR6ZkJTZWFlNW5VaWRWeUxtcjZUTkFL?=
	=?utf-8?B?cWNQR1U4Y1VLYnFGNUEwbVFRWGJYV2xZVmI2NXVSalZtNkE3cFVYZjhaYWJO?=
	=?utf-8?Q?r6QIZtdJZrxEcMcbnhW8joumOzuMdMRxp8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	5:G3ng9B1xG843j1XWGdHrvyBa9SijKrvkVDq8HpYaxsq9lh/Zj0Oy6vViH9WqttozhxwZUJBzDleQtar4OvBwFW7qrYk3bN50lR2GTY8wz+/S0ndaFTXGW27WjrztmcSDCFTuKWKF3ndzXi9LjMHRbQ==;
	24:asMBH+W4RlCwW13WLZ/5Az7vc5izIpviY2NopsTfIORkkXYGebb8ItOkbJlwbN8qPSchrzC4f0395KLEE4kEgc9DgxX3CnKm6+pQtnqkwCI=;
	20:jk0Zp+g/6EakZM2vCZgMh25YLoSLuZ7XIeRe5xLpyZz9NWlazeom5Ey65KWCUgCs52VGfAIUiyA8PgT6usODWA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:29:58.5713 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1180
Subject: [poky][PATCH v2 2/2] gstreamer1.0: Add basesink related patch
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
X-List-Received-Date: Mon, 27 Jul 2015 03:30:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix QoS/lateness checking if subclass implements
prepare/prepare_list vfuncs

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...x-QoS-lateness-checking-if-subclass-imple.patch | 70 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
new file mode 100644
index 0000000..2adfadc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
@@ -0,0 +1,70 @@
+From 6914566ed6a89c96973a578aa5ecd01ee68cdcfd Mon Sep 17 00:00:00 2001
+From: Jian <Jian.Li@freescale.com>
+Date: Thu, 14 May 2015 15:49:43 +0800
+Subject: [PATCH] basesink: Fix QoS/lateness checking if subclass implements
+ prepare/prepare_list vfuncs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In basesink functions gst_base_sink_chain_unlocked(), below code is used to
+checking if buffer is late before doing prepare call to save some effort:
+    if (syncable && do_sync)
+      late =
+          gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
+          GST_CLOCK_EARLY, 0, FALSE);
+
+    if (G_UNLIKELY (late))
+      goto dropped;
+
+But this code has problem, it should calculate jitter based on current media
+clock, rather than just passing 0. I found it will drop all the frames when
+rewind in slow speed, such as -2X.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=749258
+
+Upstream Status: Backport-GST 1.5.1
+---
+ libs/gst/base/gstbasesink.c |   26 ++++++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/libs/gst/base/gstbasesink.c b/libs/gst/base/gstbasesink.c
+index a505695..5fb2d6a 100644
+--- a/libs/gst/base/gstbasesink.c
++++ b/libs/gst/base/gstbasesink.c
+@@ -3369,10 +3369,28 @@ gst_base_sink_chain_unlocked (GstBaseSink * basesink, GstPad * pad,
+     if (G_UNLIKELY (stepped))
+       goto dropped;
+ 
+-    if (syncable && do_sync)
+-      late =
+-          gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
+-          GST_CLOCK_EARLY, 0, FALSE);
++    if (syncable && do_sync) {
++      GstClock *clock;
++
++      GST_OBJECT_LOCK (basesink);
++      clock = GST_ELEMENT_CLOCK (basesink);
++      if (clock && GST_STATE (basesink) == GST_STATE_PLAYING) {
++        GstClockTime base_time;
++        GstClockTime stime;
++        GstClockTime now;
++
++        base_time = GST_ELEMENT_CAST (basesink)->base_time;
++        stime = base_time + gst_base_sink_adjust_time (basesink, rstart);
++        now = gst_clock_get_time (clock);
++        GST_OBJECT_UNLOCK (basesink);
++
++        late =
++            gst_base_sink_is_too_late (basesink, obj, rstart, rstop,
++            GST_CLOCK_EARLY, GST_CLOCK_DIFF (stime, now), FALSE);
++      } else {
++        GST_OBJECT_UNLOCK (basesink);
++      }
++    }
+ 
+     if (G_UNLIKELY (late))
+       goto dropped;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
index 902f79d..db58754 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
@@ -8,6 +8,7 @@ SRC_URI = " \
     file://0001-Fix-crash-with-gst-inspect.patch \
     file://0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch \
     file://inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch \
+    file://0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch \
 "
 SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
 SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
-- 
1.9.1


