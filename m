Return-Path: <B54851@freescale.com>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Jul 2015 03:42:24 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0110.outbound.protection.outlook.com [157.56.111.110])
	by mail.openembedded.org (Postfix) with ESMTP id E116C605D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 03:42:24 +0000 (UTC)
Received: from BY2PR03CA038.namprd03.prod.outlook.com (10.141.249.11) by
	BN3PR0301MB1170.namprd03.prod.outlook.com (10.160.156.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.219.17; Mon, 27 Jul 2015 03:27:15 +0000
Received: from BL2FFO11FD048.protection.gbl (2a01:111:f400:7c09::163) by
	BY2PR03CA038.outlook.office365.com (2a01:111:e400:2c5d::11) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:14 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD048.mail.protection.outlook.com (10.173.161.210) with
	Microsoft SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Mon, 27 Jul 2015 03:27:13 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6R3R3Qf011344; Sun, 26 Jul 2015 20:27:12 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jul 2015 19:26:42 +0800
Message-ID: <1437996407-29463-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437996407-29463-1-git-send-email-b54851@freescale.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD048;
	1:ZDdmkY768xH0Dq/kvl0jPsR4GBloxH8q3+l3H2bJeCebTL4kmlu2BSEiG+3KsIIbqbB/z4Kufl+jjRo2yylqfLE95DJdVYxeB4Oav1OrHaCgoLvGg93chJu/2WU9yUvhvhhcKlqIu5YQlhEg5vNo7vhHln2caycFr70MUawUlhPt1VRX/lcGs1vmeIIOy/QE86YUs7sz2NF+pLhSfIH1bFBln4f0Pjovq8wmDJMf/S6Hch3z6FrX61rvUA3Blrun6ilF6RoTF9EGO+83DFuWwoKRMgt/aCr7kEZ51SU/HVBEpXauZAch+ARSHQy3wjl59BsjeDa1F5vno0UPfLNqeA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(2950100001)(6806004)(50226001)(50986999)(105606002)(85426001)(62966003)(5001960100002)(87936001)(50466002)(77096005)(19580395003)(230783001)(107886002)(189998001)(76176999)(77156002)(36756003)(2351001)(5003940100001)(47776003)(46102003)(110136002)(104016003)(48376002)(33646002)(575784001)(15975445007)(86362001)(229853001)(19580405001)(92566002)(106466001)(42413003)(32563001)(4001430100001)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1170;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:nov; A:1; MX:1;
	PTR:InfoDomainNonexistent; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	2:9ot1ADVG4P+cNt+D8/rrIoSf2rJVdBPa6vgzrWl2ciOpCFVvtru4oSStaMhOe1aV;
	3:LmS7k56ikd0n09Ji6iXJagqnOFKj454RN4O2ekY62mk5WuhaNBNSGtzLNkUNEJoxja1G+yz69vqSE4WszTVkHh6aKVeDJPtFrbYtHLMjuDHzouWP+1Gxs/zTW0MsJLS7ozFTxagAzqXP7vMmoYi1y9+NAwiFmRcESUe0B971ee1psvvA4fKoaddmL5azz0WBtiGOCW/TB+31ClUeePbfz6Ns/c54dESCKfeHg/3Auo8=;
	25:4/OMK8ScGeKXAXZC8rXcFDXN5uhqQ8sf+DQzva+PNW7uuKpKxiviLhGoZYap6uB9sn2jcdTXutjgFNfUBSdbApRrE/1oeEG2Or41pQqy7lpmoTiOvBfHzodo5rJ9GsEyooaRYZOjHdDi1rHMmatpm4qMCEqk4bj+CVH/iMKOVd3r0Xk3RXWqBml1fb6E6UHiNw0S///dIpXlSjvXCt5Ne/pi7Q3ptU/Vt+tFztJTgSIHDboOe2AhQCBNwTR0fTQYoXMg7KQY47am9+cBOip0zg==;
	20:+C1/hWZdaDj93+vn2+VM/wlCBB2gOYxiFxobuLr6EhFg7m9bvTfCk4MzC46BwF58kFP4p1cmG/qQL1pw5aCRglmx43SbU5gVDoZ2in0/bWDSKyEd1G4APwFu3ATe8A4oOn9BH8ZRm11PaZXWD2fkQ3jTKT76SRw9yyLX0LTiyqCG7BeQih8RE4261P/25P3udbe/7q4LwweMRG6cP4IKKvqYsU2/CAYjQIBdjlKaV+oU1mNRJTBh0vIfWWyvq7JbhqMju9yv7PKLu6LJOp+EguX3SU8dRpGR9LahuA85wFKOhiwywKrbnsTCviRew+fe0efdDHrzt+vBYiIluwkQsj2ubwC7eA71gSujmAodOb4=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1170;
BN3PR0301MB1170: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1170BCFC2E3B1FC0E76F1ED0868E0@BN3PR0301MB1170.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1170; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1170; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	4:O0yOsEixs3tGTZHpGZGhHy92WCkdqda0g47o1MmpWab7ZzFplMZClCisbApRG2r+3rbNXM28t8NyW7SyaMI1Rnk2QFqd8eefrhh18yvw3ed1Q5yhX+A2s4qR7Etk5nd2kQkBbpkJgfSpgVQG3+zoJZtWYuUWFuo0psXo8uVF08ejzp8Ol0lpVDJFNrUt4GUzojLxvQWtmtA+24DtMKBpXW+57nYzm2G777g4C6qTfmcxSha3tnYuK4+7s9C5tSvLil5dcVXslW6m1FasVQQKzG+TLUH040DhE2lb/5HAlzU=
X-Forefront-PRVS: 0650714AAA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1170;
	23:su3W4PyMsWgJTjgPa7xHYizdfPC2DJibgg2kZ5b?=
	=?us-ascii?Q?PGf2hsS3KelEJu3dnAbrGnDudU1z3Ub9DDN/0hKqVXaI8OhkVDg65GgbX7PA?=
	=?us-ascii?Q?BxQkRSmfX1lgyfAQXMjpphbXs8vDBQ+nsG5HP2b+7jk8MUwObQo/WXwM6afL?=
	=?us-ascii?Q?ePJwLZRv2jVAgZZ+aqHDUWo/APAez/X4sdeL49axhoM561e0VPcV+ezfDjSn?=
	=?us-ascii?Q?wfxuHhY/RZCcSXo41PNOm5jPV5B4vTUcd737p8kwWoPpbHXa4jJCBf5bhwFl?=
	=?us-ascii?Q?5wbahzOgQSn3GYrbSbJ9bscYYTjkKxBlrXdG+OAwc/bFrgzQ6vcaNVdTVkqv?=
	=?us-ascii?Q?jKeg1CmAqF8TOOof6s6o1rLuaCtHPLMWk95WFi1u/h5e6G9frLqibH1lpi/J?=
	=?us-ascii?Q?EqU+XNEHaPPPRcvDxQ16zGMb2Ev45+uEEPqnJ58XfuhJAX3iWp4l15vyQ1bQ?=
	=?us-ascii?Q?a6QaCd4Ke5KSH98LoxwM8ZYpoDm3Vr62xBKHFY0qoejl4jrHKr3wq33JPufX?=
	=?us-ascii?Q?NRuFusd1LO4/9UXIADf2RHuRCJUSTGR+v5axbMUBjWLhL/CRfDcAD3XeX4IP?=
	=?us-ascii?Q?sWQ8EMG6BvUPJvnysN9ylO0ndnT7VcUXc1NV/pYeyIBfbjhIRE2m23bGGo5v?=
	=?us-ascii?Q?sBk3BS64reQyFuMh/JnXSaQ4hkFpSiD6wXck+0Vn9WTmycsEl/Glcn7CUYbv?=
	=?us-ascii?Q?rXt+1jkKFSQ/chsl7inHN63VELTgW12f5VenoF+/HCxx+FNW1NGcfEnyDjM9?=
	=?us-ascii?Q?/QupClGXEBx8UqYMwPZpQHAdXbH1qZoVLK8qM7vvgdb602HY6ceLPZ7nIJJ8?=
	=?us-ascii?Q?Le2lizT6zxwwmL7e1FjRxqawBYTabSwjj4F5Y88CyeYh6iQWU/nUlidx9D5z?=
	=?us-ascii?Q?WLfHjsxIC8+5HypKgWWnyKRtjURBAcT9zXVr5e2TS0Ft1D+qIsUxu6wce3U5?=
	=?us-ascii?Q?7ocb+9NdIlT95fh5eIgK7lSNtNBU6iWmRzBuRTCTTLVZaWqJzHu5+gHWkk9R?=
	=?us-ascii?Q?7LZzBG7ksILL9j9D0ckBa6DzbbkRwMyqZRSC/kSkDHEw677zo7O26JPyuXSV?=
	=?us-ascii?Q?S5xp9SNpm/+4+G2mAGTqKTPpS+T08wqsAs/yZFuIVuLqOSfg5MQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1170;
	5:4oEPBUawBjmMsOXcE2LMecYTf9UCR/rESOii30PRtEJedsgwFLLsfGDJ3FHz/OTvYhe+15OxOH2uXqc7Z6XtePOZwme5rMz4gf0foQAgjX901+vpdeh7iblMZqW73S+rVI3IWrsNy0TXZ7YqUfnA1w==;
	24:Tdpjm1wIMOH0w/K3CnEJBQ1bbxHql0cp2AZud+UZhgQDS+oR7/T1JbT/BpAtyStfkIyXv9dM9k9HmPtwyDrGvm4rz6LRZYhULXLlKO6jmaw=;
	20:+rsSMZFvrcft9N1pUKA/OLom+VA4fbviXWJKQID/hCtw2jVd0Q+y72r9DhFk3UzGDJLcH0mWQT405nWiVFmcpw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2015 03:27:13.9199 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1170
Subject: [poky][PATCH v2 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Mon, 27 Jul 2015 03:42:26 -0000
Content-Type: text/plain

Use g_utf16_to_utf8() instead of g_convert to fix the issue that
id3 tags utf16 charaters cannot be extreacted in id3demux when try
to get the id3v2 tag such as TIT2, TALB etc.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 .../fix-id3demux-utf16-to-utf8-issue.patch         | 54 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 55 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
new file mode 100755
index 0000000..458d153
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/fix-id3demux-utf16-to-utf8-issue.patch
@@ -0,0 +1,54 @@
+Author: Lyon Wang <b12696@freescale.com>
+Date:   Thu Oct 9 17:37:43 2014 +0800
+
+[id3v2frames] Bug fix for id3demux issue
+
+Fix the issue that id3 tags utf16 charaters cannot be extreacted in id3demux
+when I tried to get the id3v2 tag such as TIT2, TALB etc. it will return extrac
+failed.
+
+Checked in id3v2frame.c,  When parse the UTF-16 streams, it used g_convert() to
+convert the buffer from UTF-16 to UTF-8, however it will return err that this
+conversion is not supported which cause the extraction failed with these UTF-16
+characters.
+
+In the patch, use g_utf16_to_utf8() instead of g_convert, which can convert the
+character format successfully.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=741144
+
+Upstream Status: Pending
+
+Signed-off-by: Lyon Wang <b12696@freescale.com>
+
+diff --git a/gst-libs/gst/tag/id3v2frames.c b/gst-libs/gst/tag/id3v2frames.c
+old mode 100644
+new mode 100755
+index 3785c2a..7b9d8ac
+--- a/gst-libs/gst/tag/id3v2frames.c
++++ b/gst-libs/gst/tag/id3v2frames.c
+@@ -1057,14 +1057,17 @@ parse_insert_string_field (guint8 encoding, gchar * data, gint data_size,
+         data_size -= 2;
+       }
+ 
+-      field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
+-
+-      if (field == NULL || g_utf8_validate (field, -1, NULL) == FALSE) {
+-        /* As a fallback, try interpreting UTF-16 in the other endianness */
+-        if (in_encode == utf16beenc)
+-          field = g_convert (data, data_size, "UTF-8", utf16leenc,
+-              NULL, NULL, NULL);
++      if (in_encode == utf16beenc) {
++           gunichar2 *data_utf16;
++           guint i;
++           data_utf16 =  (gunichar2 *) data;
++          for (i=0; i<(data_size>>1); i++) {
++            data_utf16[i] = GUINT16_TO_LE (data_utf16[i]);
++          }
+       }
++      //field = g_convert (data, data_size, "UTF-8", in_encode, NULL, NULL, NULL);
++       field = g_utf16_to_utf8((gunichar2 *)data, (glong)(data_size>>1), NULL, NULL, NULL);
++
+     }
+ 
+       break;
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 11cf8b4..aaa1ecb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
 SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://get-caps-from-src-pad-when-query-caps.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
+            file://fix-id3demux-utf16-to-utf8-issue.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


