Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0135.outbound.protection.outlook.com [65.55.169.135])
	by mail.openembedded.org (Postfix) with ESMTP id 0101C7681B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:58 +0000 (UTC)
Received: from BY2PR03CA004.namprd03.prod.outlook.com (10.255.93.21) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:57 +0000
Received: from BY2FFO11FD028.protection.gbl (10.255.93.4) by
	BY2PR03CA004.outlook.office365.com (10.255.93.21) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:57 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD028.mail.protection.outlook.com (10.1.15.217) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:57 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQc000825;
	Sun, 9 Aug 2015 20:41:56 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:42 +0800
Message-ID: <1439178103-17813-11-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD028;
	1:JIuPtzGS6wmuACLns0joLXWuBqMrmUE1yCqTcnytQ62VCWsFQh9km2UeEMDXq5d/4QXT9Su7PQVXXHulxnz3S0zg7Epr3NJ0NzW+uF3FKQgcWELDThdVVKAQzUqZFa75iCCkNh6581kYt9aaQoUoEcUJgmIrnUMfSD/miXMWm4xWqf6oZAos+D4UOtkYPLB7PuwO4yL5XzJ06iWFI88bEkkHq3O7hxO6cnk7JupFNa1Zuy7akLi6zjL2vhjMjND1hHZcWfNwmZ4HgDk/Jtneg9FfpnqrhZidq6OKRjuNnNXkWMMBF5KWgWc/4Ukw9wbRFDOg80u7TMDUey2Sqh845w==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(107886002)(97736004)(2351001)(19580395003)(86362001)(106466001)(46102003)(230783001)(47776003)(19580405001)(575784001)(85426001)(76176999)(33646002)(105606002)(64706001)(229853001)(5001830100001)(15975445007)(36756003)(5001960100002)(4001540100001)(68736005)(110136002)(6806004)(5001920100001)(450100001)(5001860100001)(2950100001)(5003940100001)(50466002)(69596002)(50226001)(104016003)(77096005)(87936001)(48376002)(62966003)(50986999)(189998001)(92566002)(81156007)(77156002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:E5jewotv95Ex4/Rs+A7djuvrYHqVjWm78X+lPD4uA9mJeSWJ09VnDdR0xk5KxITH07rsnjby6LWjKs6/dmMx6wMQSJ/LWA9hpZFHHCVi7UGfq4Vc0YBuIbNTJc+lfrIMIO3rzxhwXWaUNPH/vFIgT7mxjgk2/Co9dU3yzK2hKKw=;
	3:bjQ+afaZut6b8tTvg9PwcSrNUvJS7doRaOowWh3aYvghVu+OLZS8mj8qRQZbb33tKBrQ1pAWrL1Vmp9QREV4BC2sgmqfq8vtBsBwQDxRDkQE8klwu0eOwAW7LtVXb2LzAFvpy2oxiXz1cQU3xpEOy0+dM29umMUqqWzKQ9mT7/sL+2DPpOYv6C4sQwoRLbSV1+mEN4XLAo09YZrUGCCGyn+o0yoHDQD+/LBBzy2JXks=;
	25:wg5+/3G62UWBGofnySQ5+fER+KoH0SpoH/LT9AXN/AxoqAQfJfjty5acuKniXQM3CvhJWbjw06061Ir7bBcBtR7wuV3wFWVWr8toRYksIix/8HLb70s0/Jf9a/vliI5PkVYWWiGmVtjKBCGe9VnAwvO6Z8iRqZ4qPdth9dD59V2LnzgfukvklbK0+NsXnezsDQBENgZrwdhNoKnYNvJkfPzL4GKKVzTHQ8eT7ZKpSyiNxAFLUleSdTwSpAasidsp
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:jLYZkyCS7Sf+w6DpyJNtj/FLflViLaaFccX+Mlw9M8MG8bCfddts6u++HPujYUZxhXGxUC8eLhh0F67SsY3fuNtz+LC/tWgkZWFoyCqrEoB/EHtQHG5nPTfqXgmSTPH1yR5Xd7EXqZlS3TkabIDLkrczptqF3BLT5yKrmegv+cYRefkD5hpXxWopz3fJgMJ1uNO6sU/MZrFYYo3gJ3PJ1UGAGHKXcmpFA3aytBHM0F+v47adtkB8qMfntOzKjYBka/1J+dBaLP23PgQn0E0SrDIDytzk8k5MkyXaEai9Qk0uEy6eR807Vlrz1H0kBUOt1PiYET9sa9QIC6/SQ3CHHqacmhtV3yVoDrcynoZWiQQ=;
	4:HNqv7SNIeOQ48opZHqwi+cFNHNkN2L2Ykfd96l08h2B8auAWgft9WvZhwXKZrmA5JlbSkA71XSWLp0WPM6ELckVS9E8y5HLt2kMaf5CJM4t8TFkgzMWwpbLMbZM3RO06mKtrxxu5/zsYXopayl0eGSqeToEplRtOcK72OD7Lrwmwz7BwEtLuypOQuXRtMWSUELvgzfN/y9vyEmOXGJ9g8ZSfQ68kKtV4QnZ8FY6UjHJJShBpwkngp5FfWz/WZPp1HFuARRt0+iRNIr78SRugk9i2fU1iJG+7K3iH2zVrkRY=
X-Microsoft-Antispam-PRVS: <BN3PR0301MB1171081AE69D955B32CD75B486700@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:jyijjMGqt4xlulGu4VzHriUQmeLYIFjlmvL1WNd?=
	=?us-ascii?Q?zacoQ8luj9jgBvVMWZ4enRF5zfKR8nwv7wq3r4xtr5YGQJtoKI07+SUBnDBj?=
	=?us-ascii?Q?QFbDRjxoDvui7IicuqaKnrDB8GMufmjWl3gfc8HFCDuHbOr1l1+wiaSdKySW?=
	=?us-ascii?Q?QEt9EB414J7knoiUMbbATuz55ft3teaVYa/lqgUhjilrxkqoEQJ8o6hW8v6I?=
	=?us-ascii?Q?Mt4B9jux/6wBw2Qgw1nFLhxze0ynktdnKMKBfQZ0mCpFFJzgD0eeVHZJcGmN?=
	=?us-ascii?Q?teM+bBUYmW036CV92IU+PLGc5nd2b4fGUfhrzFwlJ6BoT25hOwp39FXpWs7w?=
	=?us-ascii?Q?WTbO77qfKyqF/I3PEpvYdoP6WlGnP7ldap5BQVLrMO6NUc77fIOBC/rlD2Q5?=
	=?us-ascii?Q?eMnDgaFsIrN3tzO9zOP+j21NhlO4czxgRr8ytZ6U5uTPzYWgdrc5D3thF8BR?=
	=?us-ascii?Q?QOjXcvH0q9kxSdBO6Ly15wMp60KKOtbnB5ULEWZUw+Y50GAkUWqAek1UBMJC?=
	=?us-ascii?Q?0aHk/F4vWdl2th9eilDn3OE4e/4Y5SHjlXSWU1vnIN0zNtftQBuYEL/Tgrf6?=
	=?us-ascii?Q?APj5BhfDwtfE8q5zxEe7ELkFBQUETFGUpCJcOQJeR67eajFyJxLik84/nc5q?=
	=?us-ascii?Q?VqdB8VOR7uYCFLrIaN/hMXVVKxJw9OWaXn7NP8ZvGBpOrB4TUOYZ+QJi2S6K?=
	=?us-ascii?Q?0KelffxhgCzQWKRaZ+XYGvQI8AAwGkbZ2z8JnnTXULag2wTL63kxi8SxbzU0?=
	=?us-ascii?Q?P/bdVPHTT3ahhUGq6yN7h2c9wuVZp/CmF9NrblTFWQ8gb+ylgvnstubztwt+?=
	=?us-ascii?Q?UlxUXG+2256VQ8OI3mIyBSeaM26APyVt+/oqwCovn9SmEkjY1V9rGFG51Kjg?=
	=?us-ascii?Q?+ZNgfB8R9rEM6hLVmiaXfy49LIMlQO99aWzlyw0dPcUxtp//vr6lpC2In1Yf?=
	=?us-ascii?Q?dXqEor2kNYMsENpdSRe7s0jOyjM+CBfe0TpbCGOfcurUgfsHRkjJOoMsvypn?=
	=?us-ascii?Q?UxNQlzAO/EuKYPQ4SBfXu5c2wuUQPKDdtkE2iTbPfMfpschi7O4GTR831O2W?=
	=?us-ascii?Q?hykyEiNaNS0xxYsOA/DsBAiWupAa3TbVGQYBkDX5EaaX+F8vz0RSw2G0sOMm?=
	=?us-ascii?Q?kfhs7U6pWhU4ELcakHjQzqhEXFSErB9FvYGNGcCXQnBjWGpzBDh292Jot9wj?=
	=?us-ascii?Q?xFuSFfs1YmrjfmJwAO1PqWWDdoEkd/ktGfLdcv9emlmeCzt0YVUb52o95fWp?=
	=?us-ascii?Q?xt1Wf3GpQ5skQOH+/lSka3lKWDM86+rdxWkXBOUcvKSFgy29+v3eyvPjqsR3?=
	=?us-ascii?Q?vmg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:oW3keeoStBuA01WUp13ucmISWt/y1ehKW82pLh0DnPXHaqIVVG/h7zmbemvcVw2qO91ZNByOZ8zKlI3iVNG7TLjz3IYzXshiy0vfLCc9hVgFUD6cWLvzxE7NkYefoJXA9ohdZppaCWShbzUNnR0YFw==;
	24:pombhIVhsSqv97U1Rtiy+cZ0S+IgmN28GzMM7fef0IeapYCeEn3qhlpaSDj9lDc3fL9t/dQY8KsrRy5IimNxxQswD9Jg5nSaH5UJtf6C6zo=;
	20:n52qvEYKSNk5suNGlZr941vKYHA9r0WUEFM2YP8p7qe064a0ge7IDxX4MKC1urQ4ojyp7gmC1vMg60hms7eHaA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:57.1925 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH v8 10/11] gstreamer1.0-plugins-base: Set need_segment after sink pad receive GST_EVENT_SEGMENT
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
X-List-Received-Date: Mon, 10 Aug 2015 03:41:59 -0000
Content-Type: text/plain

Subparse works in push mode, chain funciton will be called once
up stream element finished the seeking and flushing.

If set need_segment flag in src pad event handler, the segment
event will be pushed earlier, result in the subtitle text will
be send out to down stream from the beginning.

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


