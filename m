Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0110.outbound.protection.outlook.com [157.56.111.110])
	by mail.openembedded.org (Postfix) with ESMTP id 46B5876771
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:56 +0000 (UTC)
Received: from BN3PR0301CA0029.namprd03.prod.outlook.com (10.160.180.167) by
	CY1PR0301MB1180.namprd03.prod.outlook.com (10.160.165.23) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:55 +0000
Received: from BN1AFFO11FD017.protection.gbl (2a01:111:f400:7c10::116) by
	BN3PR0301CA0029.outlook.office365.com (2a01:111:e400:4000::39) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:55 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD017.mail.protection.outlook.com (10.58.52.77) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:54 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN6028512;
	Thu, 6 Aug 2015 23:16:52 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:42 +0800
Message-ID: <1438928203-12256-11-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD017;
	1:glOmpzqNZU/Y3vDjdI8mJV4PxWEWExdPAy//Rz2b8xLQuggjWH8dq+JtOLmMosSx8lx657YbTiUrHXCTnI19NiBodKzghajJBxUAJQAxcq/IWWUw78YMkITi+PBN3uHJXou9hhIUbFxhHf2p9Gas9tecaiC1XGlnNLv4FYVBAXtdZxJjUrx+nNl8YPf6mCZppxAbVGz3c2WTeaKaKppny2cs+rNF7mM2vy/CzIQ2lAJ1HoPfMW11sSm902Ofp8I7IH6w9QUWplXgZN8BoXCshXwLusPp7vNKR2RPFwforkWhi9SrQ1jQ9HGxchGIuvZ1G1Uoz2w+MdJZTKNb1+eYxQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(76176999)(230783001)(5003940100001)(77096005)(36756003)(575784001)(107886002)(5001830100001)(86362001)(5001860100001)(68736005)(110136002)(15975445007)(19580405001)(189998001)(50466002)(48376002)(97736004)(92566002)(229853001)(77156002)(2351001)(62966003)(46102003)(19580395003)(6806004)(33646002)(50986999)(69596002)(47776003)(64706001)(50226001)(105606002)(85426001)(87936001)(5001960100002)(4001540100001)(2950100001)(81156007)(104016003)(106466001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1180;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	2:90whQkyAANaht+IMJqivvaguVg9g9hxN0amhyH8ArziWTIFolIspRtQq8v/2FyWzD03KLuS/3P00N6zymRN7wfQ3qFIkTu5w3bwewJCEsvmzA7X5JF9S51rIIQkW3OICmlhj+dcFUSvqOe6oUi5epGQfVP9iggcNKQGQo9N7FUs=;
	3:lzhKX2z909VNEjv0mrp2JeftHFCnF6UUMj82pAHmGzAUt8jnoJ9/uXSGj4m06WBTyrOZw8pRp/tavZKwldA2djJ8PqTFSy23eywh6rxFeMHjOLIkU0bAr80WMQLdVzFw8iX/NKqPSCrevzI27briy9A9SxWLe8qUObefytF1e6UNZbXJE1k5fOl/ToVY6nQ1TS/X1tHNPY0UDPiccnXb7pwfb6/Le3gjmsbzkK4H2+s=;
	25:LOvfzCnLX3VyaXQrCmbTIINbKYm9UvUBZYEMlCHv13KclmA9LvMmn2qi0LJ34SV9KASSjd1WWJpcGWzfso6eb3NbSnPcFKqv0R271W4rk40r0/QP6idhPNO/c8Tz7VUq3QxsK6stSVb3wV1uHKoYjuF9L3XnsgcfwPgFDgPNxkqQk/9UIZ93YWgC4nxWQsGzqoHPOyeHFqA0yrfTfUEQWt0on8E8oPuvNtxN4YTAW7tM+udyfRpcPHUcQywwtb5w
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1180;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	20:FKTVniQKz7rWAYPJDs7Gk0yqu83nQjln4yOY75k5YCdiE8GQwCbpn3TlvQLCnYrvS1+Xydm7JAz1J/ZBxwzk3YOZX0cx2e8b97o+PyoEAW79cSacUKFbHzmlVTeLb76r9OhAHyOQhfBSh33SEvJG6UTPeJabs4iY6YpT7BFBBjriJiWIK8k3y4WwRNewHEr9/PG8fxGCSNqD0Ovx+cPWt910tYr0jC6XxVO4Wmy9CQkpAEPf92rYJ7QaY2S5WUKLgTSLEYpHotdkLIE/lhiAs7eWvSWKbYRIhQoXvu74balBXcrBeuvHgP9J7nuiB4MJFHpumtSBk+B5OBpmajsTuvKsfNZc5WzguWjeFDdopYc=;
	4:j2yTAg5mCkJ+TyxlMBlXUULqj8CQyIZqL7Muj7c93SoadgYffPYxbXGzcQ1vcUl4zRzT+Nhhwp18N5eSaB3fu+JBKsQ7QODHYMADYQTrl4Wus4O7pcSBnVlhqRl0dnUhjmHKomiSTyvomMhZ4A9Nzuf/0UP0CRY5hH89+Jn8IhLFBjV6mhYYKMCcfcOeKsxRwSSZmo5V8KHpR7tZcT5dTX+4T1xLs4hOvFQB+iiBqvL79BXoNBMQRFJEj1CAzyxN0tiCZirSzmx87tIM7mynDa8UMjrbKfd6J3tL6V2cWoo=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB1180441CC1D453305EBCF3AD86730@CY1PR0301MB1180.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1180; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1180; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1180;
	23:JZggxpSyNTgUukII0exBA9UtRQGVDf5+IT5esqW?=
	=?us-ascii?Q?k081l3seiKzLoW2jUIYqWkUKFeKYwMqlvzi+OcZB+oM+kUg2F9DWFy2aSWNE?=
	=?us-ascii?Q?Ft+O5dkcUhMS5Ptsnvk09TCotmVL//LIJSd8GkPgNhNMPEVW1u525W0+tL1j?=
	=?us-ascii?Q?qOdsx0GEgfTWI+AxXAHowKbkhKaR5xT6cfLXcbqdV3SDae6pnA9BdE7NGheO?=
	=?us-ascii?Q?btL18Jx8nw5uX1VMzmh5riMqtAgRoXmiuIRap8wpVf4U/gw8jjpgS2xd7rln?=
	=?us-ascii?Q?3YUQGwj3iqt+NK5qGx1MsvHTmp0HqCzRzYf/MU8s1403yWR2H0eFAKGpFgYw?=
	=?us-ascii?Q?OHRhPiTlhwIg0JIscPVTuggW0E2hIncxpc/XNREDgKiE1rdalfleFTQIKv6r?=
	=?us-ascii?Q?SgVw0ofoR41fyo9Gur3N7TidL+nmRqPDZQYcTOBhuoJ7eQXX8byLQXdNdD3P?=
	=?us-ascii?Q?7VR/QQI77tmQX6rsRsaUkH1jTjF2/vyRxTuXiP/3pHeGI33yKEps1KfwSpbS?=
	=?us-ascii?Q?P3qg/af/+iwVcxkZBS6knC4E3vMZUmonyZqCiXpBeTfk6MkDBQ591aYwTMEu?=
	=?us-ascii?Q?JbcTYGqC/uEKgs3JV9ZByC6SYSshVrE7t/LS4edaiMpG8r4uVAN1TTYVosVM?=
	=?us-ascii?Q?Bd5fUuIF0GXuE2+P3/YRCYG9cDCOcEhDlOFi0NUjI1Ua8XWq7ehYzwIbWZOy?=
	=?us-ascii?Q?NpEUpTgmgMErea9Vly/mP51GzUKazDchMgSfPMPgxZeZ64ieYRp2OLvve3XX?=
	=?us-ascii?Q?YLXu4Aw1FaOzty6qS2cb8fh5NUGnLfEC5OaUnK5lzmzjGA1v6EwOBGiLCLaM?=
	=?us-ascii?Q?W7UIJg0Vk4t0HdOrO9V+OVsJOhhXN1o4ZlNETDOsuOiKWR0Ziw5sped2TTFX?=
	=?us-ascii?Q?8vghK11U1l8ahsQw0TklkJjMhU5JGYWyNkX0UnGK4UVv/wm810/GADobR4qu?=
	=?us-ascii?Q?+yhy/bU9cqYEmP2y02knrsX/Tyw8kPUtYifP1n6rV79FHAAkyoTjEsAN8bdd?=
	=?us-ascii?Q?rrCya9lSzrUkaftsa5w2W0TovTZEIQLxRcJHSIRBVOFAE/h6MzGwetOozAEI?=
	=?us-ascii?Q?WrzBkULGatAy3j4NdZUgur/Yr0RQ193+BmDeiuR6QL3LMW3xm8CAo89E7F05?=
	=?us-ascii?Q?H/wLcHYkyNSdyPR1wjGCmXnBuSgJy2dvSID82lLZEFa4vGl1wN5UhnQ7fNjm?=
	=?us-ascii?Q?KoANhVy/MHEknyCPwuA5oRWSbUofGshp8MnSPNCn+dhK74GETLNRQLMvDjfx?=
	=?us-ascii?Q?twAmSRvcb8dU9qVxvxnQ=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1180;
	5:F1eICQj3KvOOpPG8Ihw0WcKcbi/+lrkl63tg2hVr7UVEuuPWNuBRhqtbo3wy9zVvl2CgjkXo6PLVAlX5/CMFKmuaPCD7lImosNJcZvcIJnJty0+jUpSkd/RG3wgxWfbW4OxRL40OFQgoLHMAGM3c4w==;
	24:rpbCuVT6jZHFuRHRt54wbqvX3m0Lb4nDWjD8bnzpu2TB+E3vJBd+JOht6Q2NYqrVm5vLLOm2AULFLJoBOv7mqugePTYRXBSVA/IcGu97AtM=;
	20:xBDJbtiJeoCLD6thbe52x/69qKh3b3zyY5lzNmBTqYpMzy+hIRQ/x+p0+dev8/IMYK6b2W3eMbfJLEC1DBO4+Q==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:54.4128 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1180
Subject: [poky][PATCH v7 10/11] gstreamer1.0-plugins-base: Add subparse related patch
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:56 -0000
Content-Type: text/plain

Set need_segment after sink pad receive GST_EVENT_SEGMENT.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...t-need_segment-after-sink-pad-received-GS.patch | 69 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
new file mode 100644
index 0000000..7813915
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
@@ -0,0 +1,69 @@
+From ed09c8fd2c9c2b5384b72cc70af3728be6694e64 Mon Sep 17 00:00:00 2001
+From: Mingke Wang <mingke.wang@freescale.com>
+Date: Thu, 19 Mar 2015 14:20:26 +0800
+Subject: [PATCH 4/4] subparse: set need_segment after sink pad received
+ GST_EVENT_SEGMENT
+
+subparse works in push mode, chain funciton will be called once
+up stream element finished the seeking and flushing.
+if set need_segment flag in src pad event handler, the segment
+event will be pushed earlier, result in the subtitle text will
+be send out to down stream from the beginning.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747498]
+
+Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
+diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
+old mode 100644
+new mode 100755
+index b565e93..7741ccc
+--- a/gst/subparse/gstsubparse.c
++++ b/gst/subparse/gstsubparse.c
+@@ -266,22 +266,20 @@ gst_sub_parse_src_event (GstPad * pad, GstObject * parent, GstEvent * event)
+         goto beach;
+       }
+ 
++      /* Apply the seek to our segment */
++      gst_segment_do_seek (&self->segment, rate, format, flags,
++          start_type, start, stop_type, stop, &update);
++
++      GST_DEBUG_OBJECT (self, "segment after seek: %" GST_SEGMENT_FORMAT,
++          &self->segment);
++
+       /* Convert that seek to a seeking in bytes at position 0,
+          FIXME: could use an index */
+       ret = gst_pad_push_event (self->sinkpad,
+           gst_event_new_seek (rate, GST_FORMAT_BYTES, flags,
+               GST_SEEK_TYPE_SET, 0, GST_SEEK_TYPE_NONE, 0));
+ 
+-      if (ret) {
+-        /* Apply the seek to our segment */
+-        gst_segment_do_seek (&self->segment, rate, format, flags,
+-            start_type, start, stop_type, stop, &update);
+-
+-        GST_DEBUG_OBJECT (self, "segment after seek: %" GST_SEGMENT_FORMAT,
+-            &self->segment);
+-
+-        self->need_segment = TRUE;
+-      } else {
++      if (!ret) {
+         GST_WARNING_OBJECT (self, "seek to 0 bytes failed");
+       }
+ 
+@@ -1632,8 +1630,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+       gst_event_parse_segment (event, &s);
+       if (s->format == GST_FORMAT_TIME)
+         gst_event_copy_segment (event, &self->segment);
+-      GST_DEBUG_OBJECT (self, "newsegment (%s)",
+-          gst_format_get_name (self->segment.format));
++      GST_DEBUG_OBJECT (self, "newsegment (%s) %" GST_SEGMENT_FORMAT,
++          gst_format_get_name (self->segment.format), &self->segment);
++
++      self->need_segment = TRUE;
+ 
+       /* if not time format, we'll either start with a 0 timestamp anyway or
+        * it's following a seek in which case we'll have saved the requested
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 85e2ad6..ba76bdd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -20,6 +20,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
             file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
+            file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


