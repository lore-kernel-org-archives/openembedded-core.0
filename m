Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0108.outbound.protection.outlook.com [207.46.100.108])
	by mail.openembedded.org (Postfix) with ESMTP id C2FB7763F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:30:13 +0000 (UTC)
Received: from DM2PR03CA0052.namprd03.prod.outlook.com (10.141.96.51) by
	BN3PR0301MB1170.namprd03.prod.outlook.com (10.160.156.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.23; Fri, 21 Aug 2015 14:30:13 +0000
Received: from BY2FFO11FD001.protection.gbl (2a01:111:f400:7c0c::175) by
	DM2PR03CA0052.outlook.office365.com (2a01:111:e400:2428::51) with
	Microsoft SMTP Server (TLS) id 15.1.243.23 via Frontend Transport;
	Fri, 21 Aug 2015 14:30:13 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD001.mail.protection.outlook.com (10.1.14.123) with Microsoft
	SMTP Server (TLS) id 15.1.249.14 via Frontend Transport;
	Fri, 21 Aug 2015 14:30:12 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7LEU6Mu014027;
	Fri, 21 Aug 2015 07:30:11 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 22:29:54 +0800
Message-ID: <1440167394-20065-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1440167394-20065-1-git-send-email-b54851@freescale.com>
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD001;
	1:P0dCYI9qa78Ickro+ml78EwBR1rz8ooACrzGASXZoq+dl89Lmlw+c6pB2pmlgKaMww0Duqh19xzUAVJzjTuluyuC/EknbnGOPS/uE3xQan8wL8aVVHjd+nrbViDSxg/GCtzm7FKhKweeUeV0Q0cefAcU85hUE3vCRsQ7rcBZrggWxdqN7vPfFNjnMAGn0z1AGNwrW/FEZOxMW8Hx7fGYLAK6FyK25B/1+HSS/KSxSzNnORhMF4VLPPLY9WGtdE25jZdxzkHxt3td/A38sBWAeJGJgTjb+csJiHHqU3rxUOft9c1Fs66F/9C2cJl/n2EF/S15iUZkBiIcvCXeXi6V6TNKZm3DAw9D084YoUu9kc97waUW4jVvfhsfYqDh2s/GD9LE67DKWMow5rn6u3YKkA==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(3050300001)(199003)(189002)(19580405001)(47776003)(77156002)(64706001)(50466002)(5001830100001)(2950100001)(77096005)(81156007)(97736004)(4001540100001)(5001860100001)(68736005)(5007970100001)(92566002)(110136002)(5001960100002)(189998001)(107886002)(6806004)(15975445007)(87936001)(23676002)(36756003)(106466001)(76176999)(69596002)(86362001)(50986999)(575784001)(50226001)(62966003)(5820100001)(46102003)(450100001)(19580395003)(105606002)(229853001)(104016003)(2351001)(85426001)(33646002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1170;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	2:jseHVdTYP+sWsnA1tvXxM41VtoZNmx8PLzxajqhowME/K4JHKhNVqzg9N4MDlyllbwpgohgmQoWJGPmFkwAbSEWg5LQFQs7K2U0IqBaDfynW5tywemzZ+J6Qr0uLfy3RUyJM5/2IjHC5fnleu3MQp7smLym2Hyzp09iCBVFUZVk=;
	3:fGh+P5bABP493dwBVRiMjd0+ye420xWKJTISgYLOH0YmRIDisaEyAKw9hVOfOf8ZsDF6XfeEL2jrCkI9bNHHdln6n+cwQL244TWtUOy6GobF7vU8ieeC8wM8gCSjFqE19tAtExZH/XQIVKKVlaVb/zWP+fErTn59q1H/Izy0KYiC5UMfTjnMlgY1LsPHcZPK05/I/8nrOn8Gy4L6wgfyf+nkZu72rZi+5dTNnHHKLms=;
	25:ksv71e5TKJKb1IJGppu2TF2e+EC4MK0D3DP7RkbdsN5+V880iRPlI+3CoU0hfgH1ZK6gvzN76TLSaR5lgcBpBIqvRC7wMQjyswoEPQQ+6udQsYEuwPXuTfcwfVVLVvhmT5zLexkNSAQSBYc84i2Q2Nk8v4uGVKG2uV2PUA2NajYYvn5osPscIAFV85pTEpaZO4OJ+N3z9cNCpwYsmKyTqcoWii03Kc6agFSyoTHpjsXxRvAKUh5t9+onqfp7wJ4g1ozNcKDd5REyEGhWAEYEiA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1170;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	20:rzeHOkhf4/WRfCas3hpDmFAF9i8+6s3cOYAltGHb/tf7+sa6S7DWk5JMwj6LdshZZ2YMFrXhtsQJGg5aYw7GgywRv0y8kS5gjqFIsWUddq/jGn5/0y60F2zxdPDYLE20lfqMkjLmmGmzvMvQYZncZFE3cJ6dd4vkryqWQHzp+6fF3FEz+94aJqrxwTNZjzUxbQBO90GVGjCxvcfrDjHAsMRV8sJWG1jtJVxPuPOnaIAHKVq/ouQNkpQUJp8G53A/VZZgixJM8BzCFhcTMDiA7qwwKyLWv8kTPFoFljZ7rIvAqFUvZ7YUw4ABqPwHM+7c3JcXNg80bUXhVXTwwAgkGq8C2Y0v1qQJexYwdgW1GsQ=;
	4:X4B+hUy07YbPmOFlh0M6aeefuxoPKTuWS63TFfaSyw/rQ0/mfwzij0oSHyRG/h0YCTdY1g9FChvHL5Q1aQCCqngXglddx/wcQMXsL/0VRaO1DnHLVJVc1Z2kh16dlE0PNieyEO+wINiHX1gE7oOzvE4dwXcxb7pPErHosvDiwAfDXNJw70Se9WdhVtSsDdDP5d60QnI3OXZLr5URK7FuhesKw2/iqgV0IJ5zwmcn239zPKWsHKYEPbtbS8ndtRBFZLFO8x7dxrasAoWksfRwRUwQaA5aTglINMgOdeUW70YycwLkTIxh1EYgZGAbdY41
X-Microsoft-Antispam-PRVS: <BN3PR0301MB11706D5620FAC13166D782BB86650@BN3PR0301MB1170.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:BN3PR0301MB1170; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1170; 
X-Forefront-PRVS: 067553F396
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjNQUjAzMDFNQjExNzA7MjM6aHZOU1MyM0kvdkdDdjhoRFFMeFJxZ1M0?=
	=?utf-8?B?Y2NXTVJTN2xhVzZZTk1MZklsaVhEUDRtZ0R2ZHI1NzRJU2xwTkppV1F5TkNW?=
	=?utf-8?B?RDg5VGI0VndUR293TDRYNjF6czlWdnY5QmhXRmZzQjFja2FvRmN2TjdEQ1lN?=
	=?utf-8?B?eXp5VXhwaENrZ2lPZEcyM2pySmVkYXZFeHAveFczb0tDcUZ2bE16WWVmY2k2?=
	=?utf-8?B?T0FRREM2em5keXl6WWhpNjhldmM2TGlwc0JmQklCM29Tem5GaWt6Nk96UEt6?=
	=?utf-8?B?V004VDFHc3dkYmdGWDVVaEZiZHY4NkMzZ2ttR2FVMWVRUGI1QllDYWx1Zjdz?=
	=?utf-8?B?WVZ3YzdCVEhHM1h1L2gvRW4wRnpFWUh4U1RkK2tIOEpYRUpxN1psdWNJN1B1?=
	=?utf-8?B?TUJPSGxGTDdsdXJzZDFkVUFleW1OT2w2UWNVbGNxUWt5K01oSWFSWU1BRnpk?=
	=?utf-8?B?ZWhqYWxlU0xBSXIvdGd0MUJkZjhKd0xhVDVka1czL2JLNWxCL2dFWkgvZDdu?=
	=?utf-8?B?a2twM2U2bDdwOWtCNGxWTUVIWnlwY1p6NlUrWEUwdVhsNy9QN3kxK25CSjJJ?=
	=?utf-8?B?VGs3RFAvalh4TW56dGk1RG9NZ3pmcURKNmd2ZjREMVZrNjlCYUpiTFcyemxv?=
	=?utf-8?B?eUZwTXFoUGNRZ0cybE1HTHpaT1cyY1ZmR0ZERTRRampONVhXbjdEOUU0RTVB?=
	=?utf-8?B?NFdZRC9JQlY0bFNIWWVlYWdZeG05bFJZLzl0akdlT0V4ZU5SU3pRY1ZXTTFx?=
	=?utf-8?B?OVJjZW1hQjNTRVE4dEhSUVFQcTl5WXZWNDQvaUVyZHlPbXphMWFNNVlBUFpy?=
	=?utf-8?B?V3dXTDdaekxXa08xd3hnbmx4OG82OWV4NTlpaXIvaUU2ek5MTHcrUCtoWFdG?=
	=?utf-8?B?RFdTNnF4eDRKOEN3SldhSll5ZGJqWHpua0o0VnFMMG1ranAxeGFBZTF3R3NN?=
	=?utf-8?B?anUzYnNFWkRBVlFoUE9HZlBZclZLNjErS3AwWitkMVRUZ1NtbTdGL0hHbHhG?=
	=?utf-8?B?TUlRcEZ5ZENtSEFrS2Z0VkVIc3VkQU1JdnBwVFFzcXY1U1NoVUpyd2EwZ0g3?=
	=?utf-8?B?eFhEOENLU2JlVGFWbm1rQTA0aEtUNmhaU3lmNWFQelJUVVllamhDOXpnaGdB?=
	=?utf-8?B?RDlVaG9CZDBVTEdxd0g1SkpBUXlaS0JKUHlRakhCYnBkL1k2M05vTGhzNm91?=
	=?utf-8?B?czR4alJQUUNxVFJwcUZHZDVzeVU3aklDNmo0cWNtWVFMdjFFRG95MWloaWtJ?=
	=?utf-8?B?QjRxUFZtOUpMQnVWR1ZwZDdncFZJYnRTY2RKWVQ1cDRabHk0ZkRNVWtnWXFt?=
	=?utf-8?B?dktYWER6ZzZmWTNNS0tCYjJxWTl5R08wVnhuZE1qbzZ3ZlpWSnZlSXUrTmd1?=
	=?utf-8?B?M0dmZVQvUHp6WE1YNjVORjVVRkIwWlBBSHFaTjh1TWZIR0JVSzhVajdHdUto?=
	=?utf-8?B?NzBoU2JZcm5EL25OdVZKV0dMYzFYcHR5ZEcyTHkyYlAzZlluQ09OVUVWVGdy?=
	=?utf-8?B?VlROUWxzQmZaejZFUlN1aWlDL1M3Mitta3JoYWRaSjdTUHgvTWxaQXJCTjlS?=
	=?utf-8?B?dE1Kb3J2Q094emZKNld4azMzOTBFcTRJR2MzbFEwVkdwUk5ERG5ueURPSXMr?=
	=?utf-8?B?TTdsWHNtTDdCWjVhYitYNnQ2bGhBcXlZenVSZmZ5QmRka01Nak1YMHA3ZHRm?=
	=?utf-8?B?dVlJZ285ZVMyZ3JLYjVqbVFXbU9FUFgvZ0VINGUyMml1YXA4bHFsbmJnNkdk?=
	=?utf-8?Q?C7yqH0o7nphC3mXR+M4bUlKeh1OqJRBPRvDaWfI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	5:QVegeqDQlSML/CzvoK4cHEmP9nH9hHq1Dtj9wSe445agzFhqBBnwZvN46LVmQvy6RuQ3Xt9/xkl1stZMihnB/a+bKAEiF7/kVRqd6jX8v+48PXOSVf99RqirUrK+twnOcJnKkwJEnK4/GBaUkWp3Kg==;
	24:hARRwMwHAsaGNSZXBwapVHfDuWXWFLbcOksx639u5l8iYOYyFg79qEl2W2PMbhp8IXDxsA8Plp2S6PeWQE1KBYZeBvlj1OwZVw/BFsEF680=;
	20:5N3zOOWeWvqPm2qE/gcse/BZ484iraNLyMXuRqG4IZklZXTD1HBvm2uOxHrP1wCarYCmZHMpHwxMOF1fiS0uFQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2015 14:30:12.7815 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1170
Subject: [poky][PATCH v4 2/2] gstreamer1.0: Fix QoS/lateness checking if subclass implements prepare/prepare_list vfuncs
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
X-List-Received-Date: Fri, 21 Aug 2015 14:30:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In function gst_base_sink_chain_unlocked(), it should calculate jitter based
on current media clock, rather than just passing 0.
Or it will drop all the frames when rewind in slow speed, such as -2X.

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


