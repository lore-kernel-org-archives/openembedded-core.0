Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0141.outbound.protection.outlook.com [157.56.110.141])
	by mail.openembedded.org (Postfix) with ESMTP id E7EB676780
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:57 +0000 (UTC)
Received: from BY2PR03CA039.namprd03.prod.outlook.com (10.141.249.12) by
	BY1PR0301MB1176.namprd03.prod.outlook.com (10.160.195.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:56 +0000
Received: from BY2FFO11OLC014.protection.gbl (2a01:111:f400:7c0c::107) by
	BY2PR03CA039.outlook.office365.com (2a01:111:e400:2c5d::12) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11OLC014.mail.protection.outlook.com (10.1.15.48) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:56 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN7028512;
	Thu, 6 Aug 2015 23:16:54 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:43 +0800
Message-ID: <1438928203-12256-12-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11OLC014;
	1:cAEWcBC3FVu7xmKiH1Fs/IJiQIFRY/uk/QEHufeWxkspZtIWDMr7Vufj9BlKf8OXPtGKdzWkNIctWoZdil0xu8rsSjoNVKx2zI+VSsQ93ukofqyTPTacpqpx/cXKBBJMOrgfthC4IdBNfYIV9On4q+9ZyNnc0zLsr1FmXUFG9AK+Cm3SdHuAWp+ouWE86ql1h96jY89ewb5qfXWA6Qu964/OLIXPkjqTfPYnpKwvtrMhHzdv6XkWCayn3cqvhXqsYfMOs+VJgQwDGqI1TOJhRQjkS40EGrVAwjEK2CRssd53reKDhLqr57oZZ91Gfw12OTWkWZkTcco3iQfRdidUgQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(86362001)(50986999)(76176999)(33646002)(50466002)(48376002)(104016003)(69596002)(85426001)(87936001)(50226001)(47776003)(64706001)(46102003)(230783001)(2351001)(77096005)(105606002)(575784001)(19580395003)(2950100001)(106466001)(68736005)(19580405001)(15975445007)(6806004)(62966003)(77156002)(36756003)(5001830100001)(110136002)(189998001)(107886002)(5001860100001)(5001960100002)(92566002)(97736004)(81156007)(4001540100001)(5003940100001)(229853001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1176;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	2:3it9JiLM8FUPsxDwRMF8YJDnei/CSCfxHGmGR+lT/Jq6PXaKFuPCE+IV3At+6m0Wg7L57xRqwt+C64z+C/Lqz2Nuy5GtfnRva06weBI0/2CddRG4thA+nxiW1pOhJTFnsw2VevwjT+iTvMzv1cQwQukOQ4qbP1oXcoMBFwZ/YYE=;
	3:aVVqUzDjYOE+W7Fhdz2QRSzNm9eP1PvoGayGcqHvGIJXAh2UfZMaepC1RWSWKIcaUDNieIYFNoPI992778uWW/GsM0J18Vs9khv4PVa03L/UaiBeVN7RqyV0yeBE4QnlTmsnDrMGUBlotaD2amaJY9Ye058L+irrEIoKvcXcPU4ni06OpZZsv/l/SBm+I5OhNa9TJ4mSfXKHxJB7yT4lPqGs0ipB7uuCV1sE3Acpbr0=;
	25:SVWM3jnN0wg9ZAIjXzbZ3F8KjTIDGsFp2hty8NNj5w8gGU0N397DgLjl7CQd/ksZxn8FVK8YK3I1k8Aymcsp2lAvZ3gn4hji9uEPFPlwW9uMnyS0xdrkKGFajMMVHwpTpqJsjaCfF+d/0N7qp/wo9CfXa2JCu5CcxNrarNCIROLaw5g84KRt6nWfiqUX8Bi4yR2g5Oep4K56YCGiFrbLYfiMkL3fMReKYF71COy+OIXd3Uy/Cb68o0EOfmFaTBBEEHspBu3F8rr44PNsTDcvZQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1176;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	20:jJjVsjHP9M/L3ZcQQzofhmHcU59YkU72KP0M6e8I7DP/HllUXjf4Z7AJuQ45tGN3G7fFzUV65Wns0CmsTLkDyvQR03Xd1XYjXdxmQZz/aPa7yPYiPis9PvxE+HWDHUtBkJ74bFPAXXi6EwtF7BMQ2ClKnPwWEETwWVWgk3D1byIcacmGmNuSDKBrf9fSxVt/8JcVxKXV3/dtONB5nbd9om2zE3qLHm3mQwTDTb3QmVIg/qy5RWs1iwRPs3Llk52pmKJ+y82T+31cprJiGCoHqyMx3cue9O/aT4gGOTeFDWxGBYwASLOLcw4YCDkpaGB99KtB86XgxOja6mvEomlVwYpD+8awLTCSDzdCo7I3OiI=;
	4:V6woPbFyxkQOPmIgt6DGgfCsBoULobbDDspMNRxxHZpoBi+3098fMC/g2S/B8XvSLdhzwNy+5DlpAMAg3nqgNx/8m7iVShGNjp2lp95jIepzriwVowHpmPQrBProM7psbDOzpQZ7q07PoyPDYdMiXUB3cDOzgOCPbiWLzfYmcMZFTtXPfGIS9BwBMxNRkRpvdLNwPACn18FWGSXFvMhtw8THI+21Gs5DNghWZBjEtya4qKdYsY7yn55kQ8XPFDMhEOKrZ0NapeqDRMJssIU07q+btVXzebAjbfJGFKMTQlU=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB117662EFF223A95F3DE1B1F986730@BY1PR0301MB1176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1176; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1176; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1176;
	23:K9JE/jz4rki9vh+rqPzfPhy5KpPSz0NTm+Ir59T?=
	=?us-ascii?Q?Y69v+mLkj54RShBXUjeDOadX7AAwkS+Bsb+2aG1WgFlYQi2ywqRErnM95HAt?=
	=?us-ascii?Q?j0S5WghVO7UD1428iRW9sRQe0h3bttgl1nLo9NhCqm4ZymjpmgyuDQj/YEMe?=
	=?us-ascii?Q?C/XPXVoRG5dXOiMXNSrFflgHuguq013xmxYhOlQ4ACxJ5AXbtSPz+1dfM361?=
	=?us-ascii?Q?AMrSpXwFLUC1I+rqJrWResy89JRwnkNlGkcUvYd/7OrZ6BzYFQ3ONGSSLkT4?=
	=?us-ascii?Q?CyBYlIh8/JFwHCsOCyGSGehom5rEboyVTVk++nRU5SCMb/3zV8AY0TXGq4kp?=
	=?us-ascii?Q?EPwRI00QlKDw7EuI3+mRV/jmLQdoIbPZPzR/AOuEfAPqtBL4xMAvc8z6dawX?=
	=?us-ascii?Q?UaDA/18iuE/iRoA+zSFNmc+mACKxZbcRyqbxgdhdrROZwT6ekCoevtoxuTC3?=
	=?us-ascii?Q?DxzXAZIonFcGZ44V7I+zoGPB+8PY+Q1ubDA7vNwONdsUPI2lsTzElV9GCB6N?=
	=?us-ascii?Q?Xica8cTE0NTMSoLY0s5IgO9VavOE9rHEApsvkhOMEEbt+wDZFvRzrr1YPs0O?=
	=?us-ascii?Q?dFqgruu+DOenM3+ZpWlHDbQF8fD+ivcU1Po/JicBqhk3G1x3fhChdBrYuBqb?=
	=?us-ascii?Q?rw3Sva5iWLkEyhOlGOyULK4d9LMiWYSzfqOcKCwj9UAWl03/lQ+eeoyqtKVI?=
	=?us-ascii?Q?0pXgZVJ428uzAz5+cokCSuonl1VAMA/0Gb4nLVZiPGblog1WS8UUZbcDdMWg?=
	=?us-ascii?Q?ET1iBPiD8vlixIaXxBUSTczRG9SAFIJoL7Zl54hikBcEUke1smt45Gmej95Q?=
	=?us-ascii?Q?XD2WrNadYyFH5+hI9Zg8o/O6WzHdnYXDNEQuxGvapqZcP4aaJp2LOIwPtj+L?=
	=?us-ascii?Q?2go67L+7EvKa/1AccIiq/c2p7Simeus1Vp7wSBSH7PnnPL79ujNmqsDQkWQh?=
	=?us-ascii?Q?+GOYoOL6b9utgzmGwG8EQF9cQZW5SCE3Ho4lpYIFE9FCgHCydNLpRoGhIy+P?=
	=?us-ascii?Q?iPls7J2OPmUVdpodXpMF8i6LTIz1PfypELQ2GXWwQPPVWaOkDvWZa9fTZ9pl?=
	=?us-ascii?Q?00oWJavacVUubwNgZ/fyi5+UGuc27UZZLaadoPUaiXEBl/PsQXTT0FblETvk?=
	=?us-ascii?Q?EfjcwOU7Sw66v6P8fLa0Rh2JZhXxLnMeM76/uyyY8txXYpXzGQImvSND9IlN?=
	=?us-ascii?Q?W5GpEVCzV8FSXT3bf31tHsQoQ7QH3KM7hauxIyosP3jVcSi92h7W0kVOcVxr?=
	=?us-ascii?Q?/lq5aZ6ynGEX/7G6eK58=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	5:FPD3U2xbp63MHSja6xvn3KZUpKSbrBbZ/410HrI0v8JVvGRsH8fQrEI/4b8JsbyAJrmgaaDTZfgI8hDApAD9nnMtbXgl61NignexDsbnU7fP/B9B6iQuEJb2z8IRHeAraiIA6RMuz8p/tI6UuLWNTg==;
	24:YBSve91gamvoXtSfRHHsFBlk0sn7KbMKwGPkbXDa2HKxGEH0IdhMmFWgUgsAb2LA5qS2uw12RN8ggBTbuBqtaOoirZYWzVRaTEE1Iy25hsg=;
	20:KeFO+zMyDF2BoLuOJ8j2orzrOuNYMFjTY4KP5P7U4Q3EbfTeLTdaMBFAUuCxxfePb7qnMZ25kHyWAT6zevMhQg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:56.3497 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1176
Subject: [poky][PATCH v7 11/11] gstreamer1.0-plugins-base: Add encodebin related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:58 -0000
Content-Type: text/plain

Need more buffers in output queue for better performance.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...eed-more-buffers-in-output-queue-for-bett.patch | 32 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
new file mode 100644
index 0000000..3256717
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
@@ -0,0 +1,32 @@
+From 540e02c92c75e08b90326863dc787fa5cadf9da6 Mon Sep 17 00:00:00 2001
+From: Song Bing <b06498@freescale.com>
+Date: Fri, 13 Mar 2015 18:04:31 +0800
+Subject: [PATCH] encodebin: Need more buffers in output queue for better
+ performance
+
+Need more buffers in output queue for better performance
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=744191]
+
+Signed-off-by: Song Bing <b06498@freescale.com>
+---
+ gst/encoding/gstencodebin.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gst/encoding/gstencodebin.c b/gst/encoding/gstencodebin.c
+index 6728e58..32daae4 100644
+--- a/gst/encoding/gstencodebin.c
++++ b/gst/encoding/gstencodebin.c
+@@ -1138,8 +1138,7 @@ _create_stream_group (GstEncodeBin * ebin, GstEncodingProfile * sprof,
+    * We only use a 1buffer long queue here, the actual queueing will be done
+    * in the input queue */
+   last = sgroup->outqueue = gst_element_factory_make ("queue", NULL);
+-  g_object_set (sgroup->outqueue, "max-size-buffers", (guint32) 1,
+-      "max-size-bytes", (guint32) 0, "max-size-time", (guint64) 0,
++  g_object_set (sgroup->outqueue, "max-size-time", (guint64) 0,
+       "silent", TRUE, NULL);
+ 
+   gst_bin_add (GST_BIN (ebin), sgroup->outqueue);
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index ba76bdd..b09c2cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -21,6 +21,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
+            file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


