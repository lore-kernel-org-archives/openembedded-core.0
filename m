Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0142.outbound.protection.outlook.com [65.55.169.142])
	by mail.openembedded.org (Postfix) with ESMTP id 66DF5734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 06:02:40 +0000 (UTC)
Received: from BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) by
	BY1PR0301MB1224.namprd03.prod.outlook.com (10.161.203.20) with
	Microsoft SMTP
	Server (TLS) id 15.1.219.17; Thu, 23 Jul 2015 05:30:06 +0000
Received: from CO2PR03CA0024.namprd03.prod.outlook.com (10.141.194.151) by
	BY1PR0301MB1175.namprd03.prod.outlook.com (10.160.195.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.213.14; Thu, 23 Jul 2015 05:30:05 +0000
Received: from BY2FFO11FD021.protection.gbl (2a01:111:f400:7c0c::164) by
	CO2PR03CA0024.outlook.office365.com (2a01:111:e400:1414::23) with
	Microsoft SMTP Server (TLS) id 15.1.207.19 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:04 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD021.mail.protection.outlook.com (10.1.15.210) with Microsoft
	SMTP Server (TLS) id 15.1.225.13 via Frontend Transport;
	Thu, 23 Jul 2015 05:30:04 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t6N5Twkg012178;
	Wed, 22 Jul 2015 22:30:02 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 21:29:50 +0800
Message-ID: <1437658192-8322-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437658192-8322-1-git-send-email-b54851@freescale.com>
References: <1437658192-8322-1-git-send-email-b54851@freescale.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD021;
	1:M/op5Mk3UCSPH0cUVJMzUuDplrYX6KtrgDcQnVK5WHNhbXHMEtR7t7llxkucBmAaV3pk65ZsOFMG1kZcMxuphrqtTcLm9MsKHcdFIkArbdG9dxfGSW4PxXmM1L9AWugUXJBxjnPPmSnAEVq0P7iGZ1IzkIK/GRZHbX7K2TX55NbZPjtEnr3h89mV/oOqsYdxhzkw0GCVtsTlTogMOnyEOsu6tTpiPspKMUf77j0IsvBTus8VJjw1+M0fHPZT8cnbz/UUTXKStGuzLz6n3MA9hmKhBXmwzDgqnL+aZ1IkwWLy9ixx6/iIs0yycPXefktMR4k5JkhOasH9WpA/6mxZgw==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(5820100001)(450100001)(33646002)(50986999)(92566002)(104016003)(36756003)(6806004)(76176999)(77156002)(62966003)(47776003)(15975445007)(23676002)(105606002)(19580395003)(5001960100002)(86362001)(19580405001)(229853001)(50226001)(2950100001)(110136002)(106466001)(77096005)(189998001)(50466002)(46102003)(2351001)(107886002)(87936001)(575784001)(85426001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1175;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	2:CPy9dxbSt3DYBCjnpDtFwjmyQ7UnE+90EwiUlOuG2ZABapy0c6mNnGdulQnXEkNB;
	3:ZBHgX9/t3NQT5Y0+2QR9Rpc5PKuo6OzUSwer3l//hTjRfiNJvOJ9Wf5xpsLAla6l3IG24mjHAGxbMTfTpugzuRUBl/accHBbDZ8N0UMB/RDqkx46bGeS8laKvwSBM+KVJXPYl9wkqoEQq+b+gcGOV3c4+H4o7mclPpdNQL5PBSvUZ8dOMfRBxT+hC7PtAKauLRuQQh/7sCKGybfff15cl6mi2fe0vvep11/hL9KiCEM=;
	25:ONMCoBHzzPTi2D8s84EkUeLD4cgVhAOtQwK23GL3fLghydMByIQyCiCOBAynrHWZYRgzkNcJ/dD6prxdgjnf5QPB5DwsaM2GI4ZM6O3VO3b32AAOIu2A3paAbzapIEwMoBTyAOlvASiONC6Mj0Dihk+WBNedUX9r2kG5Py0aI4jaJTX4eIQgr7By5HDn23awkpshuZjfkEJdTWWmp0A/H5ID4RcrB0zvo05XrPzXkjDtWPxsye4iTu8CkjXeH7DStBf3hVR8ghl7xpUuxcBJdw==;
	20:Zic3mHTeM0SsgMXLV9RbPiNln5omTyZEZXYGE3mCPDIU9ilQ6fhQJA5qbHpzvqgDodchFafIVtOtAG3+4EL9ULxMip7gU0b5V8v7FVkFluxGwCG3uZc9hSqZLoQk6yTDOfNtMuScGYSRqSOBdg1WCKRMj7GMM+N6zIfUEfLceyHubs75O4OJGOj69NaXQsQ7bxCId14YND7JofG4JYJ2vl4Stz+yKO8/z3ykvURvu5rRXf1yc1bsnTjsCW/9rWqM06aPpXFYzVhSjSFlVA/Qy1nzdMcf/g/mighbdN95iRW258uQzK7bPgBVPDOSsuVlJDL1YSNx3FMgRzO4hEEwjEMOLH6RAZFvK2+O4DuxoJ4=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY1PR0301MB1175;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BY1PR0301MB1224; 
BY1PR0301MB1175: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1175864DEDE2D4A45466015D86820@BY1PR0301MB1175.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1175; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1175; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	4:gURL6ux2c6q03Khxvt1vJNqgwsrFHGtWa5/0Cim3TR/fIOpuNZx2gi4/jcc+q0b5xIO5gf+NwQ+oi43/5FXHNo18dhn0yNxQ9Qzps7pZhDQsEZ0hE21lBcckIBIfpUsJv7WE/Q76T48Shk57JYjaVThP7sDATMndxG86wy4KlFKzH/IAxqJrcUqaQQWsAJ22DMVvh5mDRGL815xXdx22aVLI3nYWIj74X3/hHyd8lbpfYTwcYlR2taFALArmyJGvwtwU9p+5JQN/9q/M8pHjsQenmaq/02dpchKCJibxtjM=
X-Forefront-PRVS: 06469BCC91
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTFQUjAzMDFNQjExNzU7MjM6RmYrWXdkaGlpRW1YN0FRRkJucm1GRStZ?=
	=?utf-8?B?ZCswMmRMdWM0a1p1MGtnK1ppWHhobElFdWZscXhKVmZyOWU5Q0s1ZE9VcGh6?=
	=?utf-8?B?SmNaZVROaVRvaW1KNk1vU3cyZ2FkOVRwcjFSdmpROU5YT3k1TUthYUQ1RUdw?=
	=?utf-8?B?OCsrM0kweUJwakpPOHp1dElCbkZJc2JpUEIrT2RPeXJENGo0N0lxbjFUQVdE?=
	=?utf-8?B?MFM4T3FGMERiNTZNbWJKZ1dFdmVBTDBSR3JOdHNPckdUeW5RVWpsdWZjRjQr?=
	=?utf-8?B?L3pKTmtlMnFXKzJWSjk2SW11ZGc5dzB2UVViSGExYm8vQnFCSzU4TE01N2cy?=
	=?utf-8?B?Tm90U3pWckswbklJWnFQM0g4M3hWbFBrWnpWbUFuUUo0TVlHVVJOYTVVTytx?=
	=?utf-8?B?dG84OXlXVzRyaW04cHFacjZ2dkhnMnkrSWRZMy94UUV6OG5HN1FLdGIyVGtk?=
	=?utf-8?B?V0ZpTXM4NTFraG5UaGo5a1ErTkVxWXA4aHc3cHFFc1RreWxnUDhPbEU3UDlC?=
	=?utf-8?B?WDkrUitFdzV1V3RoNi80MXdPZ01FNFRuaFJES09tYTFId0ptQkc2a3c2UnFT?=
	=?utf-8?B?RzYyWlRpcXRLOUxsQzdtU1ErRjd2ZFpPR25VSDI0V3VCc0plY0k0MHJBRVpF?=
	=?utf-8?B?a3pxVjlBOUFvLy84UnFDejN3VUdwd1hrK2plemdYeFkzclNXWFpkSk5Nak5E?=
	=?utf-8?B?dU5QU1FaZXp3UzJkV21pdC9IN01pZlY2aXFFSVNVM0VrSWVUanZzNEVxOVRO?=
	=?utf-8?B?RG03YlhLZ3g5ejE5WkJ2Z2ZnS0gyYW1XVFpmamYvbnV4bnJlc2RuRlRya0ZE?=
	=?utf-8?B?aFcrNGlMTGJ1dTZDNmlIM0NpYWhBQU53Ky9xWUtQTVRUaklGbGczZFZJTEo1?=
	=?utf-8?B?WnNRVXlxaG0zZ0R2bWN4NlN5d1Y5NVMxYVByak1WNHc2R0pnSUZpcDB1VnlS?=
	=?utf-8?B?NzBiUDZLcWdsNHZmMDhnTDYrbk1mN1JUYUdJTm9LOE8xM0ZuMHliSHVnRkRG?=
	=?utf-8?B?TEwwL3pXblVIRUlsdGxrNXIwbFdhUExPaDA3TVhkeExlanRFZ08vMi9ZcUtC?=
	=?utf-8?B?U2I3NFdpZmtiQ2FwUk1YbVVTVXdFVjExaTk4dXo5T3JOL09UQ0ZZalBPb0cz?=
	=?utf-8?B?M1JZUG1Zd2UzMkFmbUtBSUVBTXpaZXdEc1ZqckppL2FnQ1pMalNybytLWGtn?=
	=?utf-8?B?ZEhxWVdZWG85R0Y3NzFBYThWYkZPdFoyNVQrcWFPUEJBU0dldjZOT2NqeVlk?=
	=?utf-8?B?UkxEMjRZQmNvVG8wT1V1NXl0L3pLRlBxcGdPMzJCZjB3cVlNNnMyQXN2b3o0?=
	=?utf-8?B?VE1qdmd1OUQxYlA3alRwNmVWbDNzNkZaOTE1NGh4L1hJNkFTMm9wQlp6bmMv?=
	=?utf-8?B?THlRZitWUDY0cEkxbmpDL2N4MHNtUzRnMldUWUJRS3c9PQ==?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1175;
	5:nDrOLxKe8D0kLPfcU9ZFmdwqRBDpBqfWYYkodrD1moEcJCmZvqAz8XWYtAB4ZMxIAS1R91bXN+oHM/bI+eyt6qVFtrOJ6UI1Tl14ngpf5UFPMyMpKmfhDa2xJsR+usa4KJpa69pTx5j2+NTy+ny9hA==;
	24:NVSqHFkgEEHU6LpwmbfsOrdWuJdrzyr2NAhdl42RknbJq4m/Kcdi1sILMI4IE5ZShprYd2mQRcCKHB6/Wwkf3UfVK1MPqxgp57q1ZIptam8=;
	20:dsGNhV2yHlKsLrmQCYjh0pNe6UWmzOzdJwaycPNQZRRNfM8LcPdQOYdJIYSYzMqkkGbrNXgY9FCpxlcZGC2Mng==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2015 05:30:04.0467 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1175
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1224;
	2:OOHLWL/FTapbQD91ldWO2cfSxXU+LzlvgQ4+UGmy9kVagAhXtAmaAozFnscPMXSb;
	3:nvoxYN7Ip0lGZ4SG/LIO056tKZ2CnQ4xBmoUQN79yPmjuH8FJlfFtmrKdtYNdBAs5dyDF1JplMrTTxkK308pDD3t7vi2goqatBljBaQYr+ERWwDQe+buzcW5eaZRz/cdYLpRwVENeYZcmiC3JawRFm8p9Q+gdVWU8UMCuWYbG4H2rB3LB5GDjeW0bhY58oBkZDWXbCdKXFs2UPTxq7E9x0GaIuqyKPB6a8P7yyFe7B4=;
	25:1td+KS5X4nyqlk5yrjZNV6h0BP2nQC/Zsjy+vMGenZyQ96gK9rGwoRQMIXN5+A/Wd6cIgucnQPYwtf8bV/JtjohpqTJV9gqGvkv5D0PXp70GN7F+O5FrMi1B0LAMvEsYxjlHY6Jl57eV5WDlHHrnvnstPqo5TctThiCT6UkkL1Mt8KtGKSPhURhWS6vV+BByaqxHuOQu5YhNmjNyiPWiV4jRcJjBfiDcG4gSQpiCRdLXrFgSowEUZK+7d96ksbt+gQWX2wvBLIj2QHJ7P0wkfw==;
	23:rha93tMI/cMTiAonXFIvY4csA2DwsUkJDW1knA3zh4V00d/JiwL4Y6F/koxK8h3U9XohinmSExmLAl804CC9ju8k8ukJW/KG7gGKjEbRbsMUbu3RChOU4b5YBizhBZqg1V2i+6skkiwORXeqMAvA7XNb2swkB8OlALoR426M3FsM7D/swovduZk0U70cEw8RFEw0MX9mMuvQjyKxXZfXd7ZhwTIDMOh6Lzob29gLvdueILszYayg861qkrd5wLME
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH 1/3] gstreamer1.0: Add patch for Gstreamer 1.4.5 including baseparse, basesink, inputselector
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
X-List-Received-Date: Thu, 23 Jul 2015 06:02:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Bug fix

-[baseparse] Handle base parse error

-[basesink] Fix QoS/lateness checking if subclass implements prepare/prepare_list
vfuncs

-[inputselector] Block EOS event of inactive pad, send the event after the pad actived

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../0001-baseparse-handle-base-parse-error.patch   |  37 +++++
 ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 +++++++++
 ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |   3 +
 4 files changed, 277 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-baseparse-handle-base-parse-error.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-baseparse-handle-base-parse-error.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-baseparse-handle-base-parse-error.patch
new file mode 100644
index 0000000..28728d8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-baseparse-handle-base-parse-error.patch
@@ -0,0 +1,37 @@
+From 430bbeee450e3fd4fc4d0ccb627de7d3f05a9736 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@freescale.com>
+Date: Thu, 23 Apr 2015 14:11:11 +0800
+Subject: [PATCH] [baseparse] handle base parse error
+
+There is no need to send GST_ELEMENT_ERROR
+becuase ohter tracks may still good to play.
+no need to end the element, just print error message is enough
+
+Bugzilla https://bugzilla.gnome.org/show_bug.cgi?id=741542
+Upstream Status: submitted
+
+Signed-off-by: Lyon Wang <lyon.wang@freescale.com>
+---
+ libs/gst/base/gstbaseparse.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
+index 57e78bb..31bf0c0 100644
+--- a/libs/gst/base/gstbaseparse.c
++++ b/libs/gst/base/gstbaseparse.c
+@@ -1151,8 +1151,10 @@ gst_base_parse_sink_event_default (GstBaseParse * parse, GstEvent * event)
+ 
+       /* If we STILL have zero frames processed, fire an error */
+       if (parse->priv->framecount == 0) {
+-        GST_ELEMENT_ERROR (parse, STREAM, WRONG_TYPE,
+-            ("No valid frames found before end of stream"), (NULL));
++      /*  GST_ELEMENT_ERROR (parse, STREAM, WRONG_TYPE,
++            ("No valid frames found before end of stream"), (NULL));*/
++        GST_ERROR_OBJECT(parse, "No valid frames decoded before end of stream");
++
+       }
+       /* newsegment and other serialized events before eos */
+       gst_base_parse_push_pending_events (parse);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
new file mode 100644
index 0000000..9cb1764
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
+Upstream Status: Backport
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
new file mode 100755
index 0000000..ba26c8c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch
@@ -0,0 +1,167 @@
+From 83bed90c306ed3185d48febf6441177d638f7341 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Wed, 24 Dec 2014 10:13:51 +0800
+Subject: [PATCH] inputselector: sticky events haven't send out when active
+ track reach EOS
+
+EOS event hasn't been send to down-element. The resolution is block EOS event
+of inactive pad, send the event after the pad actived.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=740949
+
+Upstream Status: Backport
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+---
+ plugins/elements/gstinputselector.c |   58 ++++++++++++++++++++++++++---------
+ plugins/elements/gstinputselector.h |    1 +
+ 2 files changed, 45 insertions(+), 14 deletions(-)
+
+diff --git a/plugins/elements/gstinputselector.c b/plugins/elements/gstinputselector.c
+index fb50802..4461f7c 100644
+--- a/plugins/elements/gstinputselector.c
++++ b/plugins/elements/gstinputselector.c
+@@ -440,6 +440,17 @@ gst_selector_pad_iterate_linked_pads (GstPad * pad, GstObject * parent)
+ }
+ 
+ static gboolean
++gst_input_selector_eos_wait (GstInputSelector * self, GstSelectorPad * pad)
++{
++  while (!self->eos && !self->flushing && !pad->flushing) {
++    /* we can be unlocked here when we are shutting down (flushing) or when we
++     * get unblocked */
++    GST_INPUT_SELECTOR_WAIT (self);
++  }
++  return self->flushing;
++}
++
++static gboolean
+ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
+ {
+   gboolean res = TRUE;
+@@ -486,6 +497,7 @@ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
+     case GST_EVENT_FLUSH_START:
+       /* Unblock the pad if it's waiting */
+       selpad->flushing = TRUE;
++      sel->eos = FALSE;
+       GST_INPUT_SELECTOR_BROADCAST (sel);
+       break;
+     case GST_EVENT_FLUSH_STOP:
+@@ -523,21 +535,12 @@ gst_selector_pad_event (GstPad * pad, GstObject * parent, GstEvent * event)
+     case GST_EVENT_EOS:
+       selpad->eos = TRUE;
+ 
+-      if (forward) {
+-        selpad->eos_sent = TRUE;
+-      } else {
+-        GstSelectorPad *active_selpad;
+-
+-        /* If the active sinkpad is in EOS state but EOS
+-         * was not sent downstream this means that the pad
+-         * got EOS before it was set as active pad and that
+-         * the previously active pad got EOS after it was
+-         * active
+-         */
+-        active_selpad = GST_SELECTOR_PAD (active_sinkpad);
+-        forward = (active_selpad->eos && !active_selpad->eos_sent);
+-        active_selpad->eos_sent = TRUE;
++      if (!forward) {
++        /* blocked until active the sind pad or flush */
++        gst_input_selector_eos_wait (sel, selpad);
++        forward = TRUE;
+       }
++      selpad->eos_sent = TRUE;
+       GST_DEBUG_OBJECT (pad, "received EOS");
+       break;
+     case GST_EVENT_GAP:{
+@@ -676,6 +679,12 @@ gst_input_selector_wait_running_time (GstInputSelector * sel,
+         gst_input_selector_activate_sinkpad (sel, GST_PAD_CAST (selpad));
+     active_selpad = GST_SELECTOR_PAD_CAST (active_sinkpad);
+ 
++    if (sel->eos) {
++      GST_DEBUG_OBJECT (sel, "Not waiting because inputselector reach EOS.");
++      GST_INPUT_SELECTOR_UNLOCK (sel);
++      return FALSE;
++    }
++
+     if (seg->format != GST_FORMAT_TIME) {
+       GST_DEBUG_OBJECT (selpad,
+           "Not waiting because we don't have a TIME segment");
+@@ -971,6 +980,12 @@ gst_selector_pad_chain (GstPad * pad, GstObject * parent, GstBuffer * buf)
+       GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (buf)));
+ 
+   GST_INPUT_SELECTOR_LOCK (sel);
++  if (sel->eos) {
++    GST_DEBUG_OBJECT (pad, "inputselector eos.");
++    GST_INPUT_SELECTOR_UNLOCK (sel);
++    goto eos;
++  }
++
+   /* wait or check for flushing */
+   if (gst_input_selector_wait (sel, selpad)) {
+     GST_INPUT_SELECTOR_UNLOCK (sel);
+@@ -1151,6 +1166,13 @@ flushing:
+     res = GST_FLOW_FLUSHING;
+     goto done;
+   }
++eos:
++  {
++    GST_DEBUG_OBJECT (pad, "We are eos, discard buffer %p", buf);
++    gst_buffer_unref (buf);
++    res = GST_FLOW_EOS;
++    goto done;
++  }
+ }
+ 
+ static void gst_input_selector_dispose (GObject * object);
+@@ -1309,6 +1331,7 @@ gst_input_selector_init (GstInputSelector * sel)
+   g_mutex_init (&sel->lock);
+   g_cond_init (&sel->cond);
+   sel->blocked = FALSE;
++  sel->eos = FALSE;
+ 
+   /* lets give a change for downstream to do something on
+    * active-pad change before we start pushing new buffers */
+@@ -1377,6 +1400,11 @@ gst_input_selector_set_active_pad (GstInputSelector * self, GstPad * pad)
+   GST_DEBUG_OBJECT (self, "New active pad is %" GST_PTR_FORMAT,
+       self->active_sinkpad);
+ 
++  if (old != new && new->eos && !new->eos_sent) {
++    self->eos = TRUE;
++    GST_INPUT_SELECTOR_BROADCAST (self);
++  }
++
+   return TRUE;
+ }
+ 
+@@ -1771,6 +1799,7 @@ gst_input_selector_change_state (GstElement * element,
+   switch (transition) {
+     case GST_STATE_CHANGE_READY_TO_PAUSED:
+       GST_INPUT_SELECTOR_LOCK (self);
++      self->eos = FALSE;
+       self->blocked = FALSE;
+       self->flushing = FALSE;
+       GST_INPUT_SELECTOR_UNLOCK (self);
+@@ -1779,6 +1808,7 @@ gst_input_selector_change_state (GstElement * element,
+       /* first unlock before we call the parent state change function, which
+        * tries to acquire the stream lock when going to ready. */
+       GST_INPUT_SELECTOR_LOCK (self);
++      self->eos = TRUE;
+       self->blocked = FALSE;
+       self->flushing = TRUE;
+       GST_INPUT_SELECTOR_BROADCAST (self);
+diff --git a/plugins/elements/gstinputselector.h b/plugins/elements/gstinputselector.h
+index 96c680f..9bf924f 100644
+--- a/plugins/elements/gstinputselector.h
++++ b/plugins/elements/gstinputselector.h
+@@ -77,6 +77,7 @@ struct _GstInputSelector {
+   GMutex lock;
+   GCond cond;
+   gboolean blocked;
++  gboolean eos;
+   gboolean flushing;
+ };
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
index 0a2ce86..12006aa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
@@ -7,6 +7,9 @@ SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
     file://0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch \
+    file://inputselector-sticky-events-haven-t-send-out-when-ac-1-4-1.patch \
+    file://0001-baseparse-handle-base-parse-error.patch \
+    file://0002-basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch \
 "
 SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
 SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
-- 
1.9.1


