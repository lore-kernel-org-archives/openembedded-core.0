Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0119.outbound.protection.outlook.com [65.55.169.119])
	by mail.openembedded.org (Postfix) with ESMTP id B4DD6763E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 10:01:05 +0000 (UTC)
Received: from CO2PR03CA0051.namprd03.prod.outlook.com (10.141.194.178) by
	DM2PR0301MB1182.namprd03.prod.outlook.com (10.160.217.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 10:01:04 +0000
Received: from BN1AFFO11FD005.protection.gbl (2a01:111:f400:7c10::123) by
	CO2PR03CA0051.outlook.office365.com (2a01:111:e400:1414::50) with
	Microsoft SMTP Server (TLS) id 15.1.207.19 via Frontend Transport;
	Tue, 28 Jul 2015 10:01:04 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD005.mail.protection.outlook.com (10.58.52.65) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 10:01:03 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6SA0uLt020751; Tue, 28 Jul 2015 03:01:02 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 02:00:42 +0800
Message-ID: <1438106442-15071-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106442-15071-1-git-send-email-b54851@freescale.com>
References: <1438106442-15071-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD005;
	1:cCMRJ2QdDjo9MpNFD9ttQu74pOWK0yj23Vc7PRHYHl9E7B06p/1yIwJT0nLZXr97AEAa+0V8LoIIoEyk3etKIesFGcFFVnpgAGiHFPv7gJG5gXECuBG5FbYaCseR4OvqcuD5jxyG5WMB+clEK87ioL5T88lgEE0DA1qEkyGcvLoUQh5pWUHdlvJCBituXKtrat8O4YvM9IUaecX4B0T7ye9WhNYTzER7ed1RGCdYLhZi6gALvD/MAG4xWCRiLW5jMF5fpwojmuiYMVOkfhs73KpYiEpDucrKNQpsAJ30smcpJ7V2xmgbEG2H1Qng0Lj5FT8kcMze32+Cdhxx9YIfuA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(76176999)(87936001)(62966003)(189998001)(2950100001)(575784001)(92566002)(2351001)(106466001)(19580395003)(107886002)(5001960100002)(46102003)(77096005)(15975445007)(33646002)(6806004)(19580405001)(110136002)(229853001)(86362001)(5820100001)(50466002)(36756003)(23676002)(50986999)(77156002)(104016003)(47776003)(50226001)(85426001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1182;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	2:0cCx5AXIL1aOGrH1xZZ4cIFIG+xhYyrpbQJmy2GHCQsXv3mn8/8EmVuzPeudOFIijzizd6xy9YtrR03cWWmqKtD7y9OKO3xvxGFTWlkbMjcs4eDHwwDs7JDXGV6vpT7WtExlxigDSA29G4A03Abka68E2uVWNHNJSc+TrP3z3WU=;
	3:bfNFl1e9hKwVKUDBkG0E3hlZZE0q8lRf/48WMlG1VLVNRUcWlRd/vcc1SW/8I9uA9aH0tXslJAm2lvIFigaOhQp1tVMTxI7gUWc2jzkbixPijV3yWhkEIfXc4bw+v0gRjkzum6SMdfcnV2nQAsg/308pArTsoN8gKeEGKMd9Z5+cSZ7AZOajsCLz6MNBK6LseicO4FyKKzQ2oW00Pjaxjy55IKHXlVwyyWRrD0b8CLg=;
	25:uDHotSXA2l0ubNbziBhqlQyl2RoDNFWFzPq59Y6lMV6aGKov4wkCD+ERkhVfJAIy/Q2GaLi186hqVVz5B6bYmmX655BMWoBDzVcXTKOy8wBKUsrFVJmSneit0h9togn+Te2yDNu+y0WRFxWj8ceF7bAihX6PdRLZmD4nmVIfffwwit+c6q2lvQ5o90pPnZ//4qwzivOtP37CshSUVP7F2/ywj6LGt5H8AKOJBbTAt2MFFhmbGD8cHyVIcwBUOYYR7ct26vhec1KZW4B0miBDgg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR0301MB1182;
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	20:LkH+Tu2OGR0DeBR1xNpLx2ITPR6hF+K751+U5L6Yh/5Atq1glWxej+Uscp64B7OPQHBuvxuVMbdIl6u9W/VEQQs7YGuXlLrytN1KjCA/Jthg6Kx+w/5slGSJtMTHA9gkDhPuLVLRTJwXXXRku8UwPi5AbAnW93bLG19XOx+zX0DhlzcA0586mfJEQtV/qVmzJ9j00HfFddWtFRbS6o5+G9eCux58TgYUN7Xj7rf1CSIRZeqiwEw9b4JPlDYjDU5O3GCUrr96TjoHramKZgvrIGzy7LoX3ieBGEprfgEopsPf1VHqKIXAZcMQHE5fAu0urQ7MM4DkSQc2gtso/liJctk8X4ANBnX5wSMWOrX7D8I=;
	4:/z4yLUfz7RNP2SB5JuL54qmOuymrk/PMqV8pzdpkz6xGW6pe1Z+I+GKQsdP0rXPCgRsuOhDm8nMvWOYZCl7ockTU9Ealp2IZNU7WRVFBd9rfzZ438AoekjjYE1uDSlLKQeUWR3aYY+s8kgjN54Jtf5Z8IT/dc6hgzM0IVsb67VzPdUNqhQHIy2WMA48xsb3DpA953UTlQsGdrN0IBBHxKcU1n8AshsyY+hCf136+B2/6ht9n0EYDiQfYAfTHOFafjvIutoR2wCyTxYPa68jFdoPcxhtlD1MCxB2BpRA/CXQ=
DM2PR0301MB1182: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <DM2PR0301MB11828B8052AB57976357A2A9868D0@DM2PR0301MB1182.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1182; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1182; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTJQUjAzMDFNQjExODI7MjM6d0xKSHdnNDJKSEJTcWVpeURMa2NhVzli?=
	=?utf-8?B?MVRRTDN6K1E0QjdOTXoya2tzRGkySldoOXZwd1d1RFI0b21WbXFiQUFiNUJk?=
	=?utf-8?B?NERkRTNXazFhWjJLQjVzc0wrYTRIajAycXVhYXh4QUZFbWtCdGl1UHh1N0pV?=
	=?utf-8?B?elNwbkFUdTEyYlQ0UTVSWUJMOXBUdWVYMW9xbEZDdE85NnhzemNhL0s2TDg0?=
	=?utf-8?B?bzFZTlUxaFhMNGo5OGFTOStSWDNubnJJV2pUdGdLWXNydDBhTmVSeXgyNExs?=
	=?utf-8?B?UGRZdWlYcHIycFlqVkdNSHQ1VVl6Nmt6ZnEyTGp3TThHajZRV0g3Nk1Cd1BX?=
	=?utf-8?B?SmNNTXVyaCsrV3dGNGlGdDgyZnU1ZVFHNjk1UTA2U2k0dVR2SlVpSEFVT2Nq?=
	=?utf-8?B?K1NNSWdxQW0rYlZhd1V1UTZVZnhTVHl3Skg0NElBL2p1bS9mYkNGMnRmSVFQ?=
	=?utf-8?B?MUJFS2Rld1hTZnJodE5aWTJ0OGlaTy9uMWtWYzBLdXdHbTlaRTZOVDUydUVL?=
	=?utf-8?B?bmRiMEhITGRNdVRjNzN5UDN5TUhkcmlOZ1JMQUdUU2lnREFQdmhuS0NrbW1t?=
	=?utf-8?B?akpUZlhuS2pVNGxaUldXWHhZUTBUT2ZtN1gwUHlXMy9vY29vZDlTdDdUWWtY?=
	=?utf-8?B?MkN3STJrazlzaXFjRGxqb3N6UmE4b0hyTXpWcGwxUGIwT0t4aHo2d29TSm1t?=
	=?utf-8?B?OCtxNTE3VmQ4VkxNMEljZ2lVTmFtbHMzUy95Q0czQzA4SzFGM1YrWUxKbDg4?=
	=?utf-8?B?dXNzTHhzcmdRcFdXTEdsY3JXZ09vNTdQSVY1dllzSXEvdXRMbUJEV1BBZU5N?=
	=?utf-8?B?ZGNKOHJlRThlK29Jc2RQTnhTZkQ3cG1rSEJRS3ZvWTNIMWJtRTN6eFBqZWZm?=
	=?utf-8?B?bGxPZDNFMWVURURmK1ltMmEzSDlWM1J0bEd5cjd0VFB5bnJmQVUxM1NBOEdz?=
	=?utf-8?B?WjUzQXU0MThLYlBrTkJCSTVGZ3pRZFpoTGlvZzNrWmFRN2k1ZU9vV2VFNko5?=
	=?utf-8?B?dWFsYkJQUG45R1FwWWp6Y0NxMTl4ZVVyYnBOay9WR3YremY1SzVvdStPM05x?=
	=?utf-8?B?cTNTdHVJbFFGdFVoWjZLMGk4Z1B0TjNsazl2alNhbTN5S1k2ZURZK3RjU0o1?=
	=?utf-8?B?N0svTFRrV0NZNHVaR3Q5K296Y1RqbG10NFJtK3JxMzlZRWNIZkQ2R0pjb3VQ?=
	=?utf-8?B?ZzFtbFV3REQ5Z3Y4dUlwaFF2MnJDY2FrWVp1cUIxYnBHd2cvd0VUeEg5UkFQ?=
	=?utf-8?B?WFdrL1RITWM0TGRvWExOT1FqYWNWOXBkdFIxQnJXMS9oMUFTMUcycXQ1MUZ6?=
	=?utf-8?Q?wLu8k2E35Wr0oxTpvSlhTMWEEIVM3GdGck=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1182;
	5:p7KD1awcBr0WdQ9t9wkPJSUFbzBGMKoPl8OFvXO55vUkphCpBoOuL3B6RG5sWEOa5Z+OF99fplIpdqp98T7J6BJ5dOeXXv9sDegsK20K6XRY38iorWbWPlx7dhdfaovNIQPjcG8qBixQU9mFZCAaVA==;
	24:Mhyg2Uj/j/ITtFxuV87nOOprIg9DeZaJBLRs8JqCTgcdFiyLtbHcK4+0M0jTb5yp+0U3c+j81oV8diDrwpkvcE3nwpiZENHMZKOdCkzAhlM=;
	20:D6cMWIRKFzMdGOKUvubEEcPhEFfkyounW0iXg+mr6QoVs9B7IGS68n/hlxGeQkrQTqoXszEcgn2ffwhVSRotAw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 10:01:03.7981 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1182
Subject: [poky][PATCH v3 2/2] gstreamer1.0: Add basesink related patch
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
X-List-Received-Date: Tue, 28 Jul 2015 10:01:08 -0000
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
index 0000000..b6edda1
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
+Upstream-Status: Backport [1.5.1]
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


