Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0135.outbound.protection.outlook.com [157.56.110.135])
	by mail.openembedded.org (Postfix) with ESMTP id 508A4767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:57 +0000 (UTC)
Received: from BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) by
	BN3PR0301MB1251.namprd03.prod.outlook.com (10.161.207.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:57 +0000
Received: from CO2PR03CA0044.namprd03.prod.outlook.com (10.141.194.171) by
	BN3PR0301MB1169.namprd03.prod.outlook.com (10.160.156.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:55 +0000
Received: from BL2FFO11OLC009.protection.gbl (2a01:111:f400:7c09::160) by
	CO2PR03CA0044.outlook.office365.com (2a01:111:e400:1414::43) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:54 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC009.mail.protection.outlook.com (10.173.160.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Mon, 10 Aug 2015
	03:41:54 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQa000825;
	Sun, 9 Aug 2015 20:41:52 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:40 +0800
Message-ID: <1439178103-17813-9-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC009;
	1:qKh24h7+T3NbtCggcbc3rWXr3amuXUGJhRxZG1tUqmBoMZoa2aelXGf2QD4Bjf/sje6qbdJbE+hMaQG2Tg4bDmgq8WOKA7gsqzFKi1okscQ35W2onNP/Yat55Az6I+GaaRiQDpWZb4MOIVDXiVXdZ6OBIaS+qz8gTSvhGf5YHeK9cldBAJ9XqvVARG4woJhXK8OQItBOEm6s6qkmsjSNIPr2grEGkYQzRr84IsX83ojeIo2Rt90G1f4TLMpxdo+wXIlnFbByFUlsGk6/c7pUmYC1nDYpB3aYr2ReRZdkMiYqgK3gbaqHbYRnaBhmI07OUZFJJyWrT9tFXIcDDpAS5A==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(450100001)(97736004)(2351001)(62966003)(77156002)(229853001)(5001860100001)(81156007)(4001540100001)(48376002)(104016003)(36756003)(230783001)(107886002)(33646002)(50226001)(5001830100001)(46102003)(47776003)(87936001)(575784001)(77096005)(50466002)(5003940100001)(2950100001)(5001960100002)(189998001)(5001920100001)(106466001)(86362001)(68736005)(69596002)(19580395003)(92566002)(50986999)(110136002)(76176999)(15975445007)(64706001)(85426001)(6806004)(105606002)(19580405001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1169;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	2:lejhYOa0UgOZHRkpJEl1V0u16f4sD5qLcKVXVcQFFosSsDN+9Er+ik1b1BTH22qV1sYhhVephscmrTFVJckOc9y9Prtnto8HpWTQQr9k9osxeK8h/sH6AvWyJWV9ttInqlNELbYvCVjGjQ604FIoZsLYFcS4GNpzhLbcoT3s0ok=;
	3:92/nAFzRuEGOnYVIKJq9K+B6K7PHZ1uku3X99tGstTvg7mCTlKIQChuGmcEEVeCaNP2XBo99Bp7P01y/wa5eD8rKLjPamxTzdK3pbKjGaoaXdzSn+fz2DP6v3FGnFEDtLSr06h/UAMB55kI+r0Rp4DGKr0HFzvbeFcUkoBK13gmQLVW0Ar0BKD0Xf8IUB21WENgUvwRpwCfk2XHCSaBGXqqCvjJxm3pKdRC7uki1pc4=;
	25:zSJphcQ9rMOTc5wlnbyL/IBv2PNi18nnMFgvODuBU9Q68Xc1knOsF/pFXOhtxeyPb4f1hXX4X41tHi7nwtRIIaLN4/XdWsa70StOiFPnnr23k0/93T8z0Xs4l3tfRxycJ3ONYtLy/tI/1XSrQ2iVB50uuUF1as10ubaqovo7y6aQaK+bqeHOdNQVYNiVdMJp1bayTlJ0l3I4GNSBJpLDC/ej9QFB7Oe0Ip4e3BZ8KB/wg8S6EN2G7/cHWVwpu1llv0/rcJsQrmR9vWkvw1oGFg==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1169;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0301MB1251; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	20:16FElSKePlr+htNv3YK1o0yjF8K2PG6yG3DSU1srk8lyCvpHZgiy4kXl+/FewGc01FhUah6fqOLRE3LRYozReUVbW7aBG1kKC7iWClcLT4r6JxIlvJc5dqNtAxmbwVi+tr0HiBL76FtjrqheZicI9xlWiKZGxdWtMShb2FhbsGkrTamSxWyiFdnMBAX1i+IeyOc9B9E5uM6qz2G45EIZm2L83TNJ0eTRtftf5hS/s99qfbRt1ow4kGzbr1ul8F9IrsIdSMfJ35PkEO2Nh35/6ESiTCBoqRHPCaiA+FfwZg8C+/rlaZPuSMbWQMBYpUz4g0EvrI4DtyE6SdI6L2ByE/rZ070sFW7gYPSTKuYqkag=;
	4:hU3UrpOfAQK1GpumJpwBrj8BLlLYPcNX3+lvKokLq0SJqP6WfUcvgVR/8CALBBAsOEfzW077+tgOUge2UJxYLoYS1qDqebbN9CpAW7fhQnNWvgSQRXsqVDY1+Hx5wjGQMCEEvJczgd3vE5PU4r3sboO4x8hMjtYee2Z13HY6sQN26v7yRfdMnQVGz+5tVHlZJlMERB1iO218nppBfK6Sg2D9PbDgFbtKtrhQxm/KcoruaNhTo0Nk4PsgsrwP3qaf7GM0wUgAKyLjTuasURxeMyd11tNoGENhZyN2lB6bPVs=
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1169CFD0BA5B34E000D9570986700@BN3PR0301MB1169.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1169; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1169; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1169;
	23:ceTjERFV6nB17+MmIihW92vTh6UtUE/WjrIEZgJ?=
	=?us-ascii?Q?u7INCaD75r9QNA+b+tPZKHUCHAuqXwGQp57/55rip27Jz4Um2TMYdVIO+H36?=
	=?us-ascii?Q?2rdfJ4Xl1xIc7f1ck29AYq/HhYnbr4nFN8NnVTvBaCuweRrDvatLtUCab9CS?=
	=?us-ascii?Q?gSh4LqupY6JpsgN4ibmwsivYW7vGr39x1vEyQ3eotTwxC6aBzOf18NHeeuQF?=
	=?us-ascii?Q?X8L+RA5HEg1wLTqWXUDBYkYDa44983vcT/ohfG3bkJcw8FlnymnzsS9X3Iyo?=
	=?us-ascii?Q?aS+oIOgKeCr1v/FS/MCBc2m7hbmhSusBNgLiKHIJlgbvlXKBkYXzyrOAUTI1?=
	=?us-ascii?Q?Mhio7e6Vt+tDXInPkWdfFBO65ncr6fx92S+yEfwZPsn0hJ27gfrRHKd6lrdd?=
	=?us-ascii?Q?E9U0PK3/ddBcaNO42WjrGZfN8SpwZ2onbQ79A3glG/FC93Xg+9t3o9cSMxJV?=
	=?us-ascii?Q?FulqGsfqXEYbGXDOYo9zUeWp7P04TX3mHxRn6zRjgp1/7Gv5TxXGocevEVQE?=
	=?us-ascii?Q?PqeQIDDxW71b7TRl/EVisGPb8eYnC/ZuBcQohG8aiUcFcQYlOXycbaguY8K8?=
	=?us-ascii?Q?LLLjiKem8ZcPqe4pCJsatymfGN7IwYkezNT1C8kQBryfmVWBAIhMMIJ5Pa1s?=
	=?us-ascii?Q?2RkJZjoZxWI+ntFmjdHTyOwLOKu91+xjLnBx2vML2aAOg4JcQFChEeRLCtIe?=
	=?us-ascii?Q?hm3KZ6gk5xY6Bu6KBKpdiwK+agwhhUgij8CkjEZwioW7HQONoJYlyX5m3aHZ?=
	=?us-ascii?Q?1WaMBBatZCOhAtSXe37Nvsp6QWhnodg0HZ65Qp0F4twKKcVI/58hg7TO6W3k?=
	=?us-ascii?Q?b5eYNw4SDb6CuBwCoaT4ai30ZXZPHMpH9quy2AKE449kcvipAYzphN1hgMzp?=
	=?us-ascii?Q?VPfjkR+lErFg1ado2t601bT8ec17lBlhTbJ3DbFwrP5em+gcHkpBHSAqHr4N?=
	=?us-ascii?Q?zEEryqRCzapgjm7/+jft2jKsOxUGtjlcUOhBVG+/9f1TLwOU+Z9KestWzCcx?=
	=?us-ascii?Q?poMT8cgDdn0AYtZ83sMCgZ7LFf+7PyiezUT7khxcesRKOm/M+1Uyjrjp1wL6?=
	=?us-ascii?Q?NdN6q2iePDEixnIf3RI5p0JKtNh7dCGK3il29f/pAO7ivTCedRS2CKBdimWJ?=
	=?us-ascii?Q?uybhsEUNN+nDD9+krRVpJzaNc+cvj6pRegsQPImMv9FQ5pxEE+HqBYcl2LIx?=
	=?us-ascii?Q?Hsa8UdYWidykrVno5SOToswDlbpZRtCf0AB4bpP8HJ/nWRfwp0NbbQZkv0fK?=
	=?us-ascii?Q?sR9XWsrYFUGsTt+e6eNGPJGMTGrQM4lDf8HnqqvY6n9quE/47jVMf9n7Nw7Y?=
	=?us-ascii?Q?3Bg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1169;
	5:iMNy83tWmZXl2z1lnz39UG0cYvDMfyeu4AoCVF5ehQrUWzn2YSH6ZiVLnlz1lG9a+5QolBCVUkc3lEUIixm9dizmSSqpg9gZLAnPm1dG8+q/VhufInAqRuXM31zx0fE5HpLl/zoj+cG7QOQ3iCVnIg==;
	24:aSGDShr3o2WLQ2YqKIeGShLCjKiHNG9tFdBtfiY/6X4p+noboBbBg3M/qEgnzzEaiWIKkqolcjc/90MEjuwDsV1UY3G/PsigSL9TlnINGQo=;
	20:y1XCHHtOWz0Rztds7DgWBf8RqhosuPcWrmDtZzODsvpspCLNmyVmKF3NPqTYu0i5VuJGExkTXM3WaoNp8FmoLA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:54.0794 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1169
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1251;
	2:VYz0nQ1qv3DSPH27hENALqdDyZmCYegg97g5+JRJ2CLhpEfuyea0FnblQ+7Lk2Q/OJT/mvFntvyVFI7U0rvdA78DtVvomIDmZWYIG1c7SlvDFzt3eWyKVkBU50rJrYuFF2e0CV4Uo38B5PmuT0cPSBQImsgoVPJ5BIqXwiIUFG0=;
	3:n7y1YSY/PdCvVEPv14IQeTXn/8HqoniIhWX+4gs7WCAkXuTKLOasU6ta8d0/Jro7kItkKpTpRxocT1dop9LGQGncurKJZ68XjQe2Nut+qXY2dQnHJRPLlClS2zr1FXoVgawX7h3pM/+pfjzDBMIan1mXpSiqKqmSo0qNyWi7A+3WFBDAbMnmicatURK6hht9PNV+Y+ZGgc+AxK6qZMpDL7dNZXE5Sobwzi822chJ79c=;
	25:RIJSWtixYUBXNKVjTuH68a/ZtoOTmZRYTMZ3aCT+p9RIm1SNB0aWRlvRr6s1t7kDNp/mYJ4/3ucvTMoCdLR8ss6p7T0IVPtHImj13EV1coIN3AvKNtQZdVYkPg8Dy137taEOnAIdoZdQd/39gnu1ebwAo4yYeVGgWARAvjiITDKdVuUHCQXoX2c6eNT48j9zOfiwHJjS6tUI3DmP8tKhh/lvyNXczaSrTBsDBEbL8nuvEQ6XWZ0jwoPgGzZ+DvS+zY5TTipHlyNHK10UVdqXdw==;
	23:p0O5wFhJiQ5HRpip/TP2zu/oxWGH+51GV7Y9wMy2Qt9fqh0ei10LRqAMwuI6f3ZiCdr+K+Ji1yj0PZPqrCu2nZcfoUQhSo5fFRCqj40PzhIv8sxGfhsgVf09/dLZQ2NqR4m6F3dq3oMj6CirnUnyhYzLfsZwewGOngOAbnJdmBWNIPbJsc/moAipGwVrxfFJYSzIcs94k54ibd4aMHqoELu8ZTV4bpR5jgeZUY5OMrDhnXdA8yb5CgOCF4dOVhIH
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v8 08/11] gstreamer1.0-plugins-base: Don't set async of custom text-sink to false
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:58 -0000
Content-Type: text/plain

Setting async to false will lead A/V sync problem when seeking.
The preroll need to use GAP event instead of setting async to false.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...-don-t-set-async-of-custom-text-sink-to-f.patch | 31 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
new file mode 100644
index 0000000..39c146a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch
@@ -0,0 +1,31 @@
+From 0a78555ea6c8c2f1ee27ee4707e8d7aa00ab7a66 Mon Sep 17 00:00:00 2001
+From: Mingke Wang <mingke.wang@freescale.com>
+Date: Thu, 19 Mar 2015 14:15:25 +0800
+Subject: [PATCH 2/4] gstplaysink: don't set async of custom text-sink to
+ false
+
+set async to false lead to A/V sync problem when seeking.
+the preroll need use GAP event instead of set async to false.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747499]
+
+Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
+diff --git a/gst/playback/gstplaysink.c b/gst/playback/gstplaysink.c
+old mode 100644
+new mode 100755
+index f5a2d42..fba0172
+--- a/gst/playback/gstplaysink.c
++++ b/gst/playback/gstplaysink.c
+@@ -2408,7 +2408,7 @@ gen_text_chain (GstPlaySink * playsink)
+           G_TYPE_BOOLEAN);
+       if (elem) {
+         /* make sure the sparse subtitles don't participate in the preroll */
+-        g_object_set (elem, "async", FALSE, NULL);
++        //g_object_set (elem, "async", FALSE, NULL);
+         GST_DEBUG_OBJECT (playsink, "adding custom text sink");
+         gst_bin_add (bin, chain->sink);
+         /* NOTE streamsynchronizer needs streams decoupled */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 7aba40d..8d926f3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://do-not-change-eos-event-to-gap-event2.patch \
             file://do-not-change-eos-event-to-gap-event3.patch \
             file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
+            file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


