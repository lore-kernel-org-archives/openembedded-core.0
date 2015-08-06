Return-Path: <B54851@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0108.outbound.protection.outlook.com [207.46.100.108])
	by mail.openembedded.org (Postfix) with ESMTP id A8CC475BC6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 10:29:22 +0000 (UTC)
Received: from BY2PR03CA069.namprd03.prod.outlook.com (10.141.249.42) by
	BY1PR0301MB1173.namprd03.prod.outlook.com (10.160.195.144) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Thu, 6 Aug 2015 10:29:20 +0000
Received: from BN1BFFO11FD024.protection.gbl (2a01:111:f400:7c10::1:131) by
	BY2PR03CA069.outlook.office365.com (2a01:111:e400:2c5d::42) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Thu, 6 Aug 2015
	10:29:20 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD024.mail.protection.outlook.com (10.58.144.87) with
	Microsoft SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Thu, 6 Aug 2015 10:29:19 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t76ATEAY027298;
	Thu, 6 Aug 2015 03:29:17 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Aug 2015 18:29:26 +0800
Message-ID: <1438856968-9564-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438856968-9564-1-git-send-email-b54851@freescale.com>
References: <1438856968-9564-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD024;
	1:NYfDHRsfP62SpQHEHVEJ45SEBk7G2ruGcQcOwJCqlDHE/GzXRVLDTZhLQ1XEEXGHa4bLpC28k8juufcUe5+18Q6BWUMKhrtDB6+CaeEPgU7dowdG/8mSeaW+d3yy8D4pbt1o4swAn0e/bhCcTvI0kWq18XEjyVOGDEmCq9uq/gxa9Kb0BvIzwbREHt5uDb02A8Ii9ZDDvw2dZ9OoqfZNX31lPC0YGlFgvUxdhlqkAdGh0R5ZIhc68VO/jlNKFFaDxIl1/MAtDqJbZD3yG1mbV8Ccf6TdkO/vUAClPHqb/ndO2t/rB3pGdwUdYyQx18s/nNVyrgvKHJvfLvXkpum9Rw==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(104016003)(2351001)(229853001)(33646002)(64706001)(47776003)(48376002)(50466002)(46102003)(230783001)(5003940100001)(50226001)(36756003)(97736004)(4001540100001)(81156007)(87936001)(107886002)(77156002)(5001960100002)(62966003)(189998001)(575784001)(92566002)(86362001)(85426001)(110136002)(19580405001)(105606002)(106466001)(77096005)(69596002)(76176999)(19580395003)(6806004)(50986999)(15975445007)(5001920100001)(68736005)(5001860100001)(2950100001)(5001830100001)(21314002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1173;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	2:8W7LoroLhVm4+nOSdHljDr11M3fOKUCGwWEprxGyhyMoJ+sfBzONYYdMqjercK+zvKynCMKYk5flGSbMPE+bxuY3gHm5Ei0PunkqClYHiyzaM23+0lXroDShSpfAzdeS0Cna+S09T0QGCwwNh/GZpkKspwTgwMRMVL3n3fWj6no=;
	3:CCk+sExTTP6s8SnWB486bOXeGpvWyMihSRpVciFyABCjszlSJvnwrdK2Mek0dVxkld9Djbo/1ua0bYdz2kDC0+8iUBvW1CWNgkvFno9sJ/5VgHT8JTLhoIzv2Aw410aa8Vn6gXfJwIBHr++rfLzHQbJrHYf7dt0BxX3g3YH3kzH6kyvBb26CvFwrG/dE7YdkZVdmcXPS5JVMlEcDT1OAgg0m94yvpLBpePk0/n/MRCw=;
	25:rLOkkcsULLOh+rxZqbIc7sTQROfxwkWIN8Sidt4BZNpytm6qEhZstr+KZ1YQC3J6trLJtP7mhAonPHPZ0VPyRO0qner18tYIvPDEaPxbxoA5fST2Q/zRAjTf3T6ZsEwIYzNtHsbq6BVVHwRft/vc0A6uZ4CSjrDFyD1h2VDSAAyoWZ/8dAUx6C9lM0YeDZiS8N3tN62zEgAg7SpA6qGFtWqSCKDiG4iMdpoYRBrA1GxtQ0DmXJG8oYpwjxVfow1M8PO+8HufuyzaQ6xsH0dkmA==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1173;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	20:lfwjtGGOdUR1WhtibGfLeV6rokmhwsJCkwL+7D5neejFUkTG9VkdKQbaGvg/1xl/Lp7wlyCs323SyIYhnvLNBY9++WLqJyCeZuF7d8OzCy73fiLCg5c2FlcdIpmVkXfry85twpjg9+mvoYDbQcEkGW6pAbnOj8kDYxD4u1ITW9iO8MWGGb48fk0GuG8D47LozyLssvCHwa5s3H5TepstSfxWE1ww97AneS9mPX2EHrDVFLnOW17JlAkkvtbf28qPsRkrTcNUnUI2iH57GH3cztWX6Fx0rQ+kj3B9Scfwsqzw+d70eZRJROnrxfUgoGlo32P8ohZopWOKHgY+jKmLjXdBmu/Yft0IXykmunV5WKs=;
	4:A/QMZ7lzZdGWn30lRQDBfZunCbUiEbgg68KXTOVbSYkby7YjULFQLbKMU8lSIp4MUZAnagZalcL0Bog0Dv4C4LcvkMtJHUQ+BySADgEeszFWYMckxT1shcqrNktEDEzZTL2DQy1OyuQUUVu69PSJI7bua0lkrrunxQANcJu4lbjNR3Qenr1Pje/7mNDdRJbWTlXa7CmE6HrjDgOj+gjn3ccqDoDanZPhsTpoX9CRHr89D87VQRlAKP9mIM2MWVC/g62svwlroFDLswFOgBI3zQ8XYWomAxg0/29eE39pYx8=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1173EEB93F694789C6A676A686740@BY1PR0301MB1173.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1173; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1173; 
X-Forefront-PRVS: 06607E485E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1173;
	23:rrsDH6XbON6M0Skx+icgsuR47lXcQIbeddQ1vct?=
	=?us-ascii?Q?TmctwE9jGiXzBRg6W6TrL4mJGg+j67drDBpwGOwAKNDIN6jyOFYR/Q6GU/WO?=
	=?us-ascii?Q?DiWvCRUArvDSwRAW8+1+iu0js6LzsettbaRe23tRTXZFek2RpXAv7yCDev8Z?=
	=?us-ascii?Q?Sg3zCGumjQiqJJK8nPpbvoex7ik0PN4Er3nRt0AyHkvFf56plqX5wIsLYD58?=
	=?us-ascii?Q?T+pF4ZHUhHMPMyOh8EE+46KRohQ0+2a2poXOrYAUwM9cWBJnKdNW4iQS2P6G?=
	=?us-ascii?Q?03X3rO+SpaFCa8zeXZgLfM6EBWz34iUwZZWPMU+0E0KJuf9WxiquT17FlWGf?=
	=?us-ascii?Q?6TqvSKARW/A+ZClycT4lbv7oXGVFFqxSq9oCmyJ51kSuazD63J2UeXoAEebe?=
	=?us-ascii?Q?PEO4SYcJmMhSmIzSd80yf7k7RzCiM+rpkRsdpwHLi2GMaMj4bEjfO7G0L+vr?=
	=?us-ascii?Q?3UFGP+1zZx0jZpJp4Fr+RnuRnYUlvL9lpfD9IiCZ1axY0xU7oRYH2lEpTEfX?=
	=?us-ascii?Q?lUS8Lph/kZBN3cCIYM2prsomzCklsKvjykBgtoEU+I9i2KTOajyUcpuxnn2t?=
	=?us-ascii?Q?pE5m/JxslztscYJqbOqNjtwIkk2wGecMFTD+4udRBSdJcI3nWNhJ7bXIP/hp?=
	=?us-ascii?Q?VznQxaPDV+DMRvv+Z+AujMMA1beHHZbpp1qSmNjkwVzgvwu/5hWUSbaw4wc0?=
	=?us-ascii?Q?OwoIPcHLWXu9blGskEul3utaN9p8RhtNOFgHzazKVpY0KCoz+hMPmBBcYG8P?=
	=?us-ascii?Q?v90IAPu8CoSW6/y4ou3waqCVeRDmUjTYpHFdMrgiTJZqWPbRERQT6CZGxG60?=
	=?us-ascii?Q?aIHuLsC6ll74eYoj/XL29RcLZEmWfW7L5lfGwBm9GwVJRNpM9GSDXzgpcVbd?=
	=?us-ascii?Q?/qYSvjGW/7d7vJmf6njI4XKHp51d9fRLBKHwRiRa1L5wKHJxQH0FGnp/Q2kS?=
	=?us-ascii?Q?t2i+cEEHcY16Bp717sZjXgfBsntkxItWA5dyRz52fYBJM26tSy+Dip8uFHwv?=
	=?us-ascii?Q?zT7dSoyw3dsaYdNiUfeCLHigbXi4it1AFpQ6zTs2ulR2itvcHJyCXVdwfqno?=
	=?us-ascii?Q?nQl867IVWAUq2xkeVwZNdgqDgRANSgK/xRPELW84kblpkctpBKdCQWxaMJWw?=
	=?us-ascii?Q?grZn47OJqsWQM5hdXqKoa+HFvRd2RVr0twhE014KsBRwnyx4dfXs/z4D471z?=
	=?us-ascii?Q?wXTS0k1PYWc6NWoTFCXue3tMEdZfXa3zLsDgFoqCfqmFQPSHobIJM4ed36/6?=
	=?us-ascii?Q?wQUeoFivNLgeJoRmKvg0SniGiFn21jasp/7nfSlfz4OnDBBXS1DF0LD+YSNi?=
	=?us-ascii?Q?+aw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1173;
	5:nRS3VDfna3JFi4Ee59Ym+UjfaFbNjI9aJq/I9odsa8uJFFapkpqQ0zw8KjEgbzIuUnygRebO6urIiVhDg8SDqerZ5l0d5ttjY2Ld/WuEM3trEyIMzVkG90Q2uzhULsClEWSlJ/P9bSNlrvMV4S5gyg==;
	24:ydzKpDkxQbs4Ph0xrpwYgi+HyD2nM6wCu6r0eQxRwVVeDkpW8oyoWKd5ZtbxiA5Mhzmk3CdCYcNLDicuiBLoaa7dTE5y+FSEqyQCvJ1fC8o=;
	20:jQgEHA5gfyUilN+QUXA/5EajEpOADdQD88+YhakRx9FOzyyXr7RcN3RPisTJfdL72gIwEfUOhJWbCK/fd637ig==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2015 10:29:19.8016 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1173
Subject: [poky][PATCH v6 1/3] gstreamer1.0-plugins-base: Add ssaparse related patch
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

Enhance SSA text lines parsing.

Signed-off-by: Yuqing Zhu <b54851@freescale.com>
---
 ...3-ssaparse-enhance-SSA-text-lines-parsing.patch | 225 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.4.5.bb   |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
new file mode 100644
index 0000000..9fbebd5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -0,0 +1,225 @@
+From be6163cfa3a255493f9d75bad9541cbfe1723fee Mon Sep 17 00:00:00 2001
+From: Mingke Wang <mingke.wang@freescale.com>
+Date: Thu, 19 Mar 2015 14:17:10 +0800
+Subject: [PATCH 3/4] ssaparse: enhance SSA text lines parsing.
+
+some parser will pass in the original ssa text line which starts with "Dialog:"
+and there's are maybe multiple Dialog lines in one input buffer.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747496]
+
+Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
+diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
+old mode 100644
+new mode 100755
+index 06ecef9..0ab5dce
+--- a/gst/subparse/gstssaparse.c
++++ b/gst/subparse/gstssaparse.c
+@@ -260,6 +260,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+  * gst_ssa_parse_push_line:
+  * @parse: caller element
+  * @txt: text to push
++ * @size: text size need to be parse
+  * @start: timestamp for the buffer
+  * @duration: duration for the buffer
+  *
+@@ -269,27 +270,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+  * Returns: result of the push of the created buffer
+  */
+ static GstFlowReturn
+-gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
++gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt, gint size,
+     GstClockTime start, GstClockTime duration)
+ {
+   GstFlowReturn ret;
+   GstBuffer *buf;
+-  gchar *t, *escaped;
++  gchar *t, *text, *p, *escaped, *p_start, *p_end;
+   gint num, i, len;
++  GstClockTime start_time = G_MAXUINT64, end_time = 0;
+ 
+-  num = atoi (txt);
+-  GST_LOG_OBJECT (parse, "Parsing line #%d at %" GST_TIME_FORMAT,
+-      num, GST_TIME_ARGS (start));
+-
+-  /* skip all non-text fields before the actual text */
++  p = text = g_malloc(size + 1);
++  *p = '\0';
+   t = txt;
+-  for (i = 0; i < 8; ++i) {
+-    t = strchr (t, ',');
++
++  /* there are may have multiple dialogue lines at a time */
++  while (*t) {
++    /* ignore leading white space characters */
++    while (isspace(*t))
++      t++;
++
++    /* ignore Format: and Style: lines */
++    if (strncmp(t, "Format:", 7) == 0 || strncmp(t, "Style:", 6) == 0) {
++      while (*t != '\0' && *t != '\n') {
++        t++;
++      }
++    }
++
++    if (*t == '\0')
++      break;
++
++    /* continue with next line */
++    if (*t == '\n') {
++      t++;
++      continue;
++    }
++
++    if(strncmp(t, "Dialogue:", 9) != 0) {
++      /* not started with "Dialogue:", it must be a line trimmed by demuxer */
++      num = atoi (t);
++      GST_LOG_OBJECT (parse, "Parsing line #%d at %" GST_TIME_FORMAT,
++          num, GST_TIME_ARGS (start));
++
++      /* skip all non-text fields before the actual text */
++      for (i = 0; i < 8; ++i) {
++        t = strchr (t, ',');
++        if (t == NULL)
++          break;
++        ++t;
++      }
++    } else {
++      /* started with "Dialogue:", update timestamp and duration */
++      /* time format are like Dialog:Mark,0:00:01.02,0:00:03.04,xx,xxx,... */
++      guint hour, min, sec, msec, len;
++      GstClockTime tmp;
++      gchar t_str[12] = {0};
++
++      /* find the first ',' */
++      p_start = strchr (t, ',');
++      if (p_start)
++        p_end = strchr (++p_start, ',');
++
++      if (p_start && p_end) {
++        /* copy text between first ',' and second ',' */
++        strncpy(t_str, p_start, p_end - p_start);
++        if (sscanf (t_str, "%u:%u:%u.%u", &hour, &min, &sec, &msec) == 4) {
++          tmp = ((hour*3600) + (min*60) + sec) * GST_SECOND + msec*GST_MSECOND;
++          GST_DEBUG_OBJECT (parse, "Get start time:%02d:%02d:%02d:%03d\n",
++              hour, min, sec, msec);
++          if (start_time > tmp)
++            start_time = tmp;
++        } else {
++          GST_WARNING_OBJECT (parse,
++              "failed to parse ssa start timestamp string :%s", t_str);
++        }
++
++        p_start = p_end;
++        p_end = strchr (++p_start, ',');
++        if (p_end) {
++          /* copy text between second ',' and third ',' */
++          strncpy(t_str, p_start, p_end - p_start);
++          if (sscanf (t_str, "%u:%u:%u.%u", &hour, &min, &sec, &msec) == 4) {
++            tmp = ((hour*3600) + (min*60) + sec)*GST_SECOND + msec*GST_MSECOND;
++            GST_DEBUG_OBJECT(parse, "Get end time:%02d:%02d:%02d:%03d\n",
++                hour, min, sec, msec);
++            if (end_time < tmp)
++              end_time = tmp;
++          } else {
++            GST_WARNING_OBJECT (parse,
++                "failed to parse ssa end timestamp string :%s", t_str);
++          }
++        }
++      }
++
++      /* now skip all non-text fields before the actual text */
++      for (i = 0; i <= 8; ++i) {
++        t = strchr (t, ',');
++        if (t == NULL)
++          break;
++        ++t;
++      }
++    }
++
++    /* line end before expected number of ',', not a Dialogue line */
+     if (t == NULL)
+-      return GST_FLOW_ERROR;
+-    ++t;
++      break;
++
++    /* if not the first line, and the last character of previous line is '\0',
++     * then replace it with '\N' */
++    if (p != text && *p == '\0') {
++      *p++ = '\\';
++      *p++ = 'N';
++    }
++
++    /* copy all actual text of this line */
++    while ((*t != '\0') && (*t != '\n'))
++      *p++ = *t++;
++
++    /* add a terminator at the end */
++    *p = '\0';
++  }
++
++  /* not valid text found in this buffer return OK to let caller unref buffer */
++  if (strlen(text) <= 0) {
++    GST_WARNING_OBJECT (parse, "Not valid text found in this buffer\n");
++    return GST_FLOW_ERROR;
+   }
+ 
++  t = text;
+   GST_LOG_OBJECT (parse, "Text : %s", t);
+ 
+   if (gst_ssa_parse_remove_override_codes (parse, t)) {
+@@ -307,13 +414,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
+   gst_buffer_fill (buf, 0, escaped, len + 1);
+   gst_buffer_set_size (buf, len);
+   g_free (escaped);
++  g_free(t);
++
++  if (start_time != G_MAXUINT64)
++    GST_BUFFER_TIMESTAMP (buf) = start_time;
++  else
++    GST_BUFFER_TIMESTAMP (buf) = start;
+ 
+-  GST_BUFFER_TIMESTAMP (buf) = start;
+-  GST_BUFFER_DURATION (buf) = duration;
++  if (end_time > start_time)
++    GST_BUFFER_DURATION (buf) = end_time - start_time;
++  else
++    GST_BUFFER_DURATION (buf) = duration;
+ 
+   GST_LOG_OBJECT (parse, "Pushing buffer with timestamp %" GST_TIME_FORMAT
+-      " and duration %" GST_TIME_FORMAT, GST_TIME_ARGS (start),
+-      GST_TIME_ARGS (duration));
++      " and duration %" GST_TIME_FORMAT,
++      GST_TIME_ARGS (GST_BUFFER_TIMESTAMP (buf)),
++      GST_TIME_ARGS (GST_BUFFER_DURATION (buf)));
+ 
+   ret = gst_pad_push (parse->srcpad, buf);
+ 
+@@ -333,6 +449,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+   GstClockTime ts;
+   gchar *txt;
+   GstMapInfo map;
++  gint size;
+ 
+   if (G_UNLIKELY (!parse->framed))
+     goto not_framed;
+@@ -350,13 +467,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+   /* make double-sure it's 0-terminated and all */
+   gst_buffer_map (buf, &map, GST_MAP_READ);
+   txt = g_strndup ((gchar *) map.data, map.size);
++  size = map.size;
+   gst_buffer_unmap (buf, &map);
+ 
+   if (txt == NULL)
+     goto empty_text;
+ 
+   ts = GST_BUFFER_TIMESTAMP (buf);
+-  ret = gst_ssa_parse_push_line (parse, txt, ts, GST_BUFFER_DURATION (buf));
++  ret = gst_ssa_parse_push_line (parse, txt, size, ts, GST_BUFFER_DURATION (buf));
+ 
+   if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
+     GstSegment segment;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 8d926f3..85e2ad6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -19,6 +19,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://do-not-change-eos-event-to-gap-event3.patch \
             file://0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch \
             file://0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch \
+            file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
 "
 
 SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
-- 
1.9.1


