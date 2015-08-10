Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0112.outbound.protection.outlook.com [207.46.100.112])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7F0767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:42:01 +0000 (UTC)
Received: from BN3PR0301CA0038.namprd03.prod.outlook.com (10.160.180.176) by
	BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:42:00 +0000
Received: from BL2FFO11FD046.protection.gbl (2a01:111:f400:7c09::142) by
	BN3PR0301CA0038.outlook.office365.com (2a01:111:e400:4000::48) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:42:00 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD046.mail.protection.outlook.com (10.173.161.208) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Mon, 10 Aug 2015
	03:41:59 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQd000825;
	Sun, 9 Aug 2015 20:41:57 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:43 +0800
Message-ID: <1439178103-17813-12-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD046;
	1:BOz+jJoEbyovAfWkzFwl9JYXgphW7fV3L6+CERfTxeiLbm1TYiO4XXuPMUMZ5pkQlvmd1ss1YYFlHd55G4k2yLIdJKxVMOf/BWeHAvqm9JAAqoicSSvLdOmaVC2jV42lezcbDnmQXrYgd/sfGgBxbYq1QHRsnjhbB/sQX3+LkXYPwpMLamgeYlxzxl+dq6ZtKU6vrh3YNDi/WHa3hdOiG5h0KDZ2MxsyeSWEOEcazQJJ5dkHgclbyBG2sTvL3s7U/JLdwILU4s788TzBh809x+KMdK7U1B8dURXaxZ8HRb+db3WLKFIVDy4wHmk+pj8J7JIvoLrqW7dZQx5wg4b+9Q==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(450100001)(48376002)(107886002)(36756003)(4001540100001)(50466002)(230783001)(64706001)(77156002)(97736004)(106466001)(104016003)(105606002)(110136002)(33646002)(189998001)(62966003)(2351001)(575784001)(5001960100002)(76176999)(81156007)(5001830100001)(5001860100001)(47776003)(19580405001)(50226001)(87936001)(77096005)(86362001)(2950100001)(69596002)(46102003)(50986999)(92566002)(6806004)(15975445007)(19580395003)(85426001)(68736005)(5003940100001)(229853001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1172;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	2:S3T08BSZJKCtBneopEPIKOuGgRmTFdmMBBnz6GCjbkiAzrTnx6SJ4ACcMDe1ovo7tqjqqRXtN+NjoCuPbqhzcRtVyGDBAk0kPYdS9zPDGVoirzvu+M5WA12xWCsXrH3ILISsHK2fDTMtrW9kVo79y3KLez4pMf/2MvRhNeRJc6A=;
	3:rCIg6XNL1T1YqLDdo8CXappq7xqvzn77dwZNHJSCUXjiQPPScBxTHt95gIbSC55TJzqsXHReGnCPKF+3cpW3pnpFtcYf/tsj5GFot3wpjPvh2sGrDpW/dF67iDUhJNb8FdfKpoUpvREBjeI6iYGL3GT7taW6sAEQxsIV2/4xd1YSSw1ppi0eWVIUGLkox0dBGo48lA8td+l8zukQ1jZiT5dVSjqp4A9yv4NjSKgZEdE=;
	25:pOyzV4Hfi822s7Dj8wRe7vL83HgHZ04OWCiPE+LCNt4qm3q4mx5NTTblRJP8tbTlgGGoGXjP3MVpXjrhnl8ehkU0xhlSJrZcMGOyWGHYbv+kswzUU23dpiMd+654BhfCGbKR9DtW/GedlKXZRLes+qcRJPR1xr40iejhjnObUoyapAD9FKYHS8CKKKrFPye/nNsSrR1CbsBzyIoo9lRzriv+Fj8qZq9OVnMrDKGJayzFW86H8q6GUxwZjYCzgqgtdjYgX1RMuGX9mB9ZHWx3ug==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1172;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	20:33+MALYZDEWTLJI60GTND2lEqxpu9V2IMmm8ONOiYQIm1xSkbWIZM8g2UL/lUBF0u3+7TkZ/6K2fELfvxxx3ZHHROyCZ3rdsZ43sMOueUda5KlJWS7HYBdOjHKzcWty2wvP3wmCDRK1IvZBbtMz/qZqytm+sREER9+a2nWkvvnF2UNfehM4yLlClxpTnIQitIRSiq14I8Bey9sZv6BdEz6Oue0w3SMSnLWkt5O/eaDTDc+V0zwdEEoSBLRjxSjyTH5kwVXJ8h46bDliXe8lpQYOEZj9GGNcjAayycTPN7GUnLXNndJFXoN+JYPtqDbHlH5rA+bHq22uUepb7FfeRD1E9cQ7FiXWDnKBAuupdNxw=;
	4:qXx1+6+yJBMXNv5whR/9xzLDawPr8oNIkER44PXojvab5RQYELbfYPwj8LZP+CixSFwT6Wo12G3CSo57FlMAFdfflKlB7k6EBWF4fRRVmCc8M2Sdey90sPxq2B1ON95li1sgUlKC6ZvMMkwEmaWFUDAaHgGzHWLDjY+ABspxz/l10pRW9c7+VjKpixBZGzfAPNdST005BkNHbTC9dVPxruAVVDyneqo+A2sstzhr7Mu86q1JJEAbs9+e3YBs/fBbOuMNGQ4JnvIRV1QA6WLNVNe0RtLQSX/hiqFxO/ULjh0=
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1172AE01BE9202D1C6F6D8B186700@BN3PR0301MB1172.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1172; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1172; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1172;
	23:8InX5mJdYv2H10bOcj+5QDz8HXNbfL0o6lhgPDp?=
	=?us-ascii?Q?5fuZ8cHZQTMdXJY5Z/j54wZtglzHe8DUubJw27libHclMgM2IWHd0MVWeoJF?=
	=?us-ascii?Q?PmHiVtH8kT0NAFl6TXo6mWPMcmlTI8SikMhn3RyuurR1GBni0W2gHVqOxH3w?=
	=?us-ascii?Q?6fZiON6ePqgpenp992PfUhkYfbAOdA64v/KX+K21xNZEIAfwKwCQkF6UE2Ew?=
	=?us-ascii?Q?KDmz+CZYRl5FZlGi9tR7MNdWj3Tf4ROQoIpR2ce2YNtzWEmKIdxc4fS3BZRF?=
	=?us-ascii?Q?yW6hYJhN6kGzEMl2t3lAAjL10vl5I0mPIb2qDqLhSlSaNEGIybPQJQpeDNkn?=
	=?us-ascii?Q?EpMs2Dx6O5QMt8MsXq61+XFwNGi23iQ+uXbxWqvWq/Do2O3QeIu5YgfnxDrj?=
	=?us-ascii?Q?DwNCQYEEUolltayGbqhCxWWlPkzbCu4OM5kCCgFKF/ohO1QGlsP7dGyAM0+2?=
	=?us-ascii?Q?jCcWC2GIllSxfiZvCsfM10XJ2Ha/RBjFQOrL2uho9oiFpfuCGON0+XJ3Tw8v?=
	=?us-ascii?Q?dc48XQbxa5OBpaNJsm6eGaqJ05V6CxlmB/j1+Ox7UtgsMV6eD8i0Ngn01SQo?=
	=?us-ascii?Q?o6wDgQxEZOFiLuqt3jQMW2wSP84TZy27iW6EcAhrMmQbj/6GSkJkyJKIG6Fj?=
	=?us-ascii?Q?ib518bOGib66BprYSThLt+cTr2ImTwsC8/jba4Rw7vMThtLWs+VhKpiIV71f?=
	=?us-ascii?Q?tpswpcIgVeXEGKCwtIPbd2P1KKmwSgGv96hb/vGcjpU+kJexRaEJ9vMlwrgp?=
	=?us-ascii?Q?vpU+EBlLmq/pn4LU/ucNyIwaZkK65BlcHbqoTwOp9iDLxnblBTD7zz5RVfvM?=
	=?us-ascii?Q?rSkYuw8vE/Ss25v11v+6N6hfrWWDy+kCH1qiBMwR2T+DejdzXfAinDRfWdsS?=
	=?us-ascii?Q?7+eZClkQ+RwGmoDQdlog6Audlo0wKgxrZOWAgX6xzth2ph20sGoQEICa78hd?=
	=?us-ascii?Q?gW2+ILrUxAjlwsIS/7pB8xKA9JkE7PVsROlrlC2WDHc8i8ZFSxukcJb2TqRk?=
	=?us-ascii?Q?1GLaEH5SeabSLEW4vEHurQbtTB528dVvqAwEliEjCakAefu9iIeSG3r1RN7v?=
	=?us-ascii?Q?dgfSLHI7P07oM90cba1Z9nLd/8wyCkKV6/br/Uw+gLVZhADgCr1D1eFLq+O9?=
	=?us-ascii?Q?sjWqSdFX1xFDguVxycCavq19o+Jr9OQiYYuC9Xv3l4/6HbgIcp91flQp6E3a?=
	=?us-ascii?Q?IWxuByQ0ZEYFVZ9Jek9wFS7b4Qsd4+JGIdY1/WwQn1c1CczC0MBK0Ig4j8Fm?=
	=?us-ascii?Q?wT2MgWqQ4K+8ixcryPwLlRRFCu+B+pRav24hqt+9Z?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1172;
	5:BLUDEs26neFFUobgGKw4SKaq4VC6rHp/mrGE5WkHIAX/Aw2z2M5ja81aKBLC4xJRh3XpeMBqRGWuZheEYH8bpEQKZooxXmYnk/d47JGKd88tmYt5ynxAIR+cv93NxGVz8HT0/UEwTpqxoDpHkUw+BA==;
	24:dKqFYqa6qfqjybVV5DR8PIu3ZhjwbWUf8586D5bF11Xto4RYV1xJnFedKWBLns+W0zYpKWpBWjBcge+TNqUe3LLOVZDOs4xpVNhha9XMPYo=;
	20:hfZFUnR49H7jobxQ2A/lt7jJVY+Tn7NrNvZLDFv/luJX9we2dYMkjsMQq2qLW5X1oEyMohORNc6zUAHLcdephQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:59.5248 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1172
Subject: [poky][PATCH v8 11/11] gstreamer1.0-plugins-base: Need more buffers in output queue for better performance
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
X-List-Received-Date: Mon, 10 Aug 2015 03:42:01 -0000
Content-Type: text/plain

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


