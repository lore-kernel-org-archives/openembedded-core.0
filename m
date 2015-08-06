Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0105.outbound.protection.outlook.com [157.56.110.105])
	by mail.openembedded.org (Postfix) with ESMTP id 0EA2475BC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:29:23 +0000 (UTC)
Received: from CH1PR03CA008.namprd03.prod.outlook.com (10.255.156.153) by
	CY1PR0301MB1178.namprd03.prod.outlook.com (10.160.165.21) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Thu, 6 Aug 2015 10:29:22 +0000
Received: from BL2FFO11OLC013.protection.gbl (10.255.156.132) by
	CH1PR03CA008.outlook.office365.com (10.255.156.153) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Thu, 6 Aug 2015 10:29:21 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11OLC013.mail.protection.outlook.com (10.173.160.161) with
	Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport; Thu, 6 Aug 2015
	10:29:21 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t76ATEAZ027298;
	Thu, 6 Aug 2015 03:29:19 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Aug 2015 18:29:27 +0800
Message-ID: <1438856968-9564-3-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438856968-9564-1-git-send-email-b54851@freescale.com>
References: <1438856968-9564-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC013;
	1:B1wiUi9jJ7amVHaiu0fK+3yhDGnh2l67M8X9rtlKc/D39T/6tVxhqpokosR+cgtjRJbx0lOxQZMbJk3ZhAKBJUbnqE/JoGdK25FsIOtbz13FR00MLBVr+SoctHA4YEIWCP5FLOFaN9Q4KNgbCASdB0GlunVExqQILVTyQfr9iKmCSgqF0egswdA7yHB8j/qq4tBhHX/oelxTMqud+kPf7Hdm2HiV/AA+8NwKVzPZ0y0cEqwclpSc1FyGDD+33s4h/Q8TZJghQ2QLPpdvMtuDJO4i1jr2TRIeVNwbchDjtBVA2HNn0tgKNLu2+eFFIRzVFsWqT//176akhYxfTeDQtg==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(46102003)(33646002)(229853001)(230783001)(5001960100002)(5001860100001)(81156007)(4001540100001)(5001830100001)(97736004)(36756003)(64706001)(110136002)(47776003)(2351001)(189998001)(107886002)(104016003)(5003940100001)(575784001)(86362001)(77156002)(62966003)(69596002)(87936001)(85426001)(6806004)(19580395003)(19580405001)(50466002)(15975445007)(77096005)(106466001)(48376002)(50226001)(76176999)(50986999)(68736005)(92566002)(105606002)(2950100001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1178;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	2:826G5plj3SjOd5kDgcXJV+DAbTaA4+7QQ4OL3bsNQS6UK9j5wcVNQGUHMqDso0zr6qwy4BxkLCqIDt7FKoQezfOFLW1olLF6eiDCD3vt34/0x2Qd8tB4qCzEee9DNG7SHOXwcf65vVq7Mi3XxRh0uuoZHYVlwlHqsJeBwA5fZAo=;
	3:lop0uEABHbGHJD0bx3i6jry6Lg/aQaDFoExJLXwMfEWBpSQVZH9coVyN6MbEN1vk7kPEoUTUbb7u7QXoIFc5zE6ERxTjXPvctuqDtcI7GRL7m5DC30xcNd/9UnFrci5rneHJCz0sKQyTGQS+ObmXLTj2ocD3MKLS5rfAOlcy18hERi6hNcE3SJkJW6YK8BHx+WO6kHtVHqDWyvUvykBlSEvKV8kpubQQog++AI5SLKg=;
	25:5B4ObhzuHKNUPIApvWkKzU+1tKlDTw4YAnA+xLLyuXGIc5nmvcvJ0ckbkyT9z0mdaYv+bMx+N/h72tM0psX+lvcAfF4tGpmxVZ/vRO5+jzpkhye/68m4h5kzDpydf6+ZnOZJ9dKfTzLPFxICgQmqfW1KL2FaV8QCdRnkQsCxaLch3ukWeSybColzldlzC9hgeLPTwzhPIcG01R0pNjcV9EfEqGhM3kjPYtVJBR0md0ZpKkzWcn0ViKl6I/J389QT
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1178;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	20:sLl0dGI31OOOT1js+w3uhwEwp+Jh8C4Bqw2tj8mDRLTz/7FAoSxh+YbmIHNDWGmuyccULiy6TkFp6QbSGzIwzjweRqrVppFT3g8w+ttgsABXs0EXyw8DE/22o9KpjJPAXulRadwmjVldks84eLm02bD0EejhP+zsSvF9dWa3sGj0qhhrxzp9s1efSCweHE0BXfkCoNCtMF54YXYrzZZU1ZaUXdFf3p2PFHVzX/sFa6oTb2G8NR3fD1I6lNag6/fm6LCNrpQykxWSeP9nL51JjlAyMBOyueVdCjUwjCXHSpIyz3NyO5hy1JS9FzCgA8C8iMXzfQvO3IZ+Xein14xF3D+WEwHIbFRwBUJ4kTahO24=;
	4:0jrdB3+tXdjsAOUDMlsQWcpo4ZVw0oZCkOQ+KS3Tj3MjqnUnseq/IF5Ru6eAeyCAkQXqD0kOcT2HkcC7Fjpm0RYwMUWRwv3mo9k8bC9onoxbed96G/PEIOZnZN01t+JjCN/rIm2BoGPpQayCDFU9oWz3IumP+Qm7SGZ4P2vJuHnFGNHa9gAhaUtr9U3/pSSuL4/zQqCOrM56jSnj/wgORABnUuENmlKY7Nu5x8qH+O9Qbt7YvH9cEDjgkTgxhkf0mzO6R8gxJBF2xSWDQtMqPYHAMdCpdCAEgGWUh3xmdBo=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB11781E4D39F99993A73CDDAF86740@CY1PR0301MB1178.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1178; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1178; 
X-Forefront-PRVS: 06607E485E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1178;
	23:GhZF1TDAO8+XCgWWy4X4u+W+7S5TMf8rl7EFJBQ?=
	=?us-ascii?Q?jU+IexZUE7fBU8F9lG1nhRG1dr2dredStZqJ+risszbYDq+d8K76SaMozSEP?=
	=?us-ascii?Q?WMEcTp/GjrKveNLIgyDDXDHAfwl2LEy+hKL6QwwGyqg9/Jj5ftQ8eY7pdeVE?=
	=?us-ascii?Q?raHxbOC7HRtrg6c/OPTCiClhdLY+T/mPFzt4hLozj6M0MR2P9Hjf0j7A31Ny?=
	=?us-ascii?Q?4C/rxUsMmPdPxltkj/JWlt5XGhDYNjT+Ov8NILw5e0pczAlp1E3XLjBEbpH0?=
	=?us-ascii?Q?FolcjGY2ljMVDlB/M1dQ1OCSbUuK6fxM1qCJiwzm3Nug20//VOa/nQdzJ6x3?=
	=?us-ascii?Q?9gFKACnBP1XFu+uO6Jh8Qv6yz90y74wn45OTo1d50anYVH3vJP7hILyr37GG?=
	=?us-ascii?Q?i8AlU0xHmJLFtu9Puk9CxoTaZ6V+L9TLvPRZ5We75cPQ2QgvOu/J+ao6yZI3?=
	=?us-ascii?Q?N32w/LtnJ7bhjTlNBDBISI7kjbIHXE+KF96GbM3o2UczcpOx+uZ0sAs09OH1?=
	=?us-ascii?Q?lcDj0gn7MfyUlTmVPgIYAC1467moS1HHE/De1TQQdrOTeXZnYh/cTaNllnWT?=
	=?us-ascii?Q?ghA+4jwDBylRPjRtm2NDfZ2IKdMWnPRWOj/e/zDe9dF1UQqZy9qbQjAx5nQp?=
	=?us-ascii?Q?zGXH6/bQ2SbHpktI7aBgJHJONEMNlev6zKk2NJE7fNmK2wVL4pl+IFqWNVq3?=
	=?us-ascii?Q?I/a5XT0z+A1524069crhZT+oP0ioIjtmkKnWpmsuyQ/2Vni0+cCxzsJKDUAL?=
	=?us-ascii?Q?4rwh724kgIaK0Wb5ENGqZurqDqTlICFlnNXPboTCLTSMYG6Ltz01PBAWVpCi?=
	=?us-ascii?Q?fPl+AYzBX/IWwLYNvv73an/PLwW2zawF4eKMk1JwbDo6WtOP4lCjAzRkfVzv?=
	=?us-ascii?Q?NKjojU2sAN5dq0DiPKKQmiRJwfQbr6TNZzKeMt2BUPstIKgC2ddTurDxOJwE?=
	=?us-ascii?Q?IlqGXao4JZKObcKp12t9Sb/0/hqeFQCvZVHTJ61W4WfpU0IWmndkMsx4UFNb?=
	=?us-ascii?Q?JZ/6cUBWKMPi8iy5TiinmO3ilQS+aZkfxOqsKcbJZYhO6mFaitoyoCaHZU1g?=
	=?us-ascii?Q?kOcnb9pQT8wd6wT5iSso1GJHKpJW7CPCzQh2dkBn0ledzXZjpOlIeVHjIWJs?=
	=?us-ascii?Q?t59mx1rpUJzF8MqYR7EumZqWiCKS1LJ3bndJaoIoyox+1kS5Hql0Buv5p1k7?=
	=?us-ascii?Q?9jfKI4qRA/ThjmVjtab7si94jIGs7unkN8y9RRklHZVysNppkxNeAavbNoFT?=
	=?us-ascii?Q?8J9uJgREijGajjai4PQ4=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1178;
	5:S5tb2P3lSXmdTtdQVzbUjAEctnd09Y0xcC9DshfvAa76aVzV7iO8XPemd9/YCqmXttkw57NRdufx4vwrX1XFvYEGx0VENws14wKPZbXJ8mvIOtx5YeDLASLoyR9i/eiTDEACqnirOvwxZHHdPSn+uw==;
	24:GFC54/NzW8BtyLDkUnvWOe69o3JluA3nnn2LTwXamOX5YDQAdsb2cEA/Go2bbwy7BVVMAJVyzM3AhBJzR81Yx+IfXB4HgGZFeWdC1JwnFjw=;
	20:vdSWGc/DOKlhDtHV2pD+PxtITptB3z6HKiOxhlwTDI3CBeYHLFPS5zWf+Lae3won/dvi410xH46V3uNXO11mSQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2015 10:29:21.6732 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1178
Subject: [poky][PATCH v6 2/3] gstreamer1.0-plugins-base: Add subparse related patch
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
X-List-Received-Date: Thu, 06 Aug 2015 10:29:27 -0000
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


