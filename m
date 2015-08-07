Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0114.outbound.protection.outlook.com [157.56.110.114])
	by mail.openembedded.org (Postfix) with ESMTP id 1754F76758
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:55 +0000 (UTC)
Received: from BN3PR0301CA0026.namprd03.prod.outlook.com (10.160.180.164) by
	BY1PR0301MB1176.namprd03.prod.outlook.com (10.160.195.147) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:53 +0000
Received: from BL2FFO11FD008.protection.gbl (2a01:111:f400:7c09::112) by
	BN3PR0301CA0026.outlook.office365.com (2a01:111:e400:4000::36) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:52 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD008.mail.protection.outlook.com (10.173.161.4) with Microsoft
	SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:52 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVN5028512;
	Thu, 6 Aug 2015 23:16:50 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:41 +0800
Message-ID: <1438928203-12256-10-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD008;
	1:1ZwqvTKkqPK7t36z5s2I9jQOd9sM7BmF59IrrneB4/Nd4Ufi/MXbDZe/9jGOkB/HLSCzaAiRNnAoVb9y8vVZ0w68OxuakEZioswA/EXsdNq35w3TUg3AFcKAEjGcv1i7eqXi+wTRga2Jqunkh8Ui44ItpFjtPVUrhFQtImYGxB6UQAHrfgAhsyjp9CLLSFcAhsoYnv0mNVa9Pb2wsk8a3/jdZjTW8KuHjw6pv7llwulfjsvpgiNjb71uy5NPPgQ8rUzPCms/chLa5rsCjLCIghUU9LPfcWqBbEfJxwSPa+PMC83EUiA4vrEO4iEx9FXckCiYtafrbw7pQC286MPJZQ==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(86362001)(50986999)(76176999)(33646002)(50466002)(48376002)(104016003)(69596002)(85426001)(87936001)(50226001)(47776003)(64706001)(46102003)(230783001)(2351001)(77096005)(105606002)(575784001)(19580395003)(2950100001)(106466001)(68736005)(19580405001)(15975445007)(6806004)(62966003)(77156002)(36756003)(5001830100001)(110136002)(189998001)(107886002)(5001860100001)(5001960100002)(92566002)(97736004)(81156007)(4001540100001)(5003940100001)(229853001)(21314002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1176;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	2:zouHnnhPaeAzgcI6SfgEIXl3sP7nw4RpRv8dURa3sLLkMVI1sc3etNIx8I8tPd6Re2E/L+wdW/i7xUDrFI5nEZotNCDINh7Y2MPE0v3ChCQ42Z80hyqE86wdmIkYA0qh4ukf6OoqpUJQ2mzS8Gyed5yIz5G3jROmWGRXCnWNkso=;
	3:9qNaxFq0YsEb9JJB/SytWSu9EpYxERQr+SLv1o2druTZXGP3S7ZDQACHDP5kL7CUa+joqZMO4iWhlhAQSk1FQ/0K1ZOqHExoMX8NmEzu9fa9X2DwoeGM9T/CECjxqSuYfHwciXs8LcP521zNfW69E1PrHh6jJp+JVRGJglQrUy7Xogmf/PZgx8lxrEcFlIntWHhGegrOuab2fhG1ct0swGEI8f0mr5fv0AZqRKVoDCM=;
	25:TKKnwtX/dUjOe6GrT0Fc/BdzRKB5SXobnAO2WYvCyyJ4UrFmlpvu38sUOWlXdK2spMfNvvbAveQLYq1Zdtz7WWHB6QKsc9H5RyY+bFUKsVInwQIWBUIxXBCgUcaFa3cp+wryCU/LL4kdmSsOQICk+JW3hJR3zGoOX/ZOBIQsd6LcUj+pj0UUhquBA2LEOEN7IH4fhctEdtjUeTr5mm9s64t6vJrogYDb8VrukdwSUlWzHGHyh8Y6v22XSx4CPB6cNDCEGa1K99eAQ7IWlNeQHg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1176;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	20:klw31gH0aUUu4obnX9JSlDnsSCFsxE+j/ssyrz/fAw9XaNh90yvVieFmWraHnN1PNKZTFAEgF7Ot2QHcFAyH9a8B4HwczydXHNjKTj5UvURkE5E8fsHdXcum9ohXICtN3Ai6LTNhOBXeJTGkpiUJNDm+0xU7FaErly1z4GYRPKofoxq9uFR235UWrjTJYFoq2M1rkc8HYf+ZLJ9GzXbljhLO5UO+BpH2UfcgSMP8bYLIrCIwesj9+MwTK5/fI6Fq9PzlC8FnGzqzcR3Dnhjc9Vbay6gXetrofWBuAXimpO8qvzOdDS3aYU+rqc47u2VxPa5HvyqQeJV5QJm/D8EDqO7VmGW331sXY/c0lA/dO4E=;
	4:Lk8SE4uLIhtXbEG4zp41vnRUhEKQHSRWIqeY+ibV1pP4wu4Hqzk9MSEl5TbrGUikdzVyVh7P+lyQgBzdZaum00dVX8/VSYHEDu29b7/GiEuV58RTI2InAjGb0V137vI0iriXDeEh/ImLF+BEv2DGlyAFH8QTyZo57NMKgcum0ZD5mSIEj6LgENpEiXIfY89DcmT4bziteAPO3p2/7xlyDMVm1ETrhu4kjZKkRdzr75MXFcnyo7Uqhhp6p6uKHngtMLId5Zv4uFUCfBTcuPg/jDAjuD6nm69/b7M031lO/zY=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB11760C2ADE96067764258EB186730@BY1PR0301MB1176.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1176; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1176; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1176;
	23:EqaG05PnvSvePn6JeMuOnzWgDno/KaixgbcwY3O?=
	=?us-ascii?Q?7xpYQiSvTrBXRLfheyy/O7LrFbgk+CNkRd1WITyFrHR1IJhkPd8ssw5RD5kP?=
	=?us-ascii?Q?dJnM5l49qhRI0AbiSiFPPwuH3v0kigNVwDAIe6TpM92xibMFHx2cXJBnhh0u?=
	=?us-ascii?Q?9SJ+XIXoT7QaHnnz3a8rSIoh+d6mJ6ya/wSDu254zdSz0C+EaInb64gTFMmc?=
	=?us-ascii?Q?kJHcSGJdsXMbrwhIhXNMepgb++AlA0yt0RWy+DlfjenfkDvOIEZn+Q4wqRD7?=
	=?us-ascii?Q?upsVpkEEBkEP6nud//hJCqL2HYgryOwT+jfxd9DbbvSpyw7IMRuDS3YL3D8J?=
	=?us-ascii?Q?0ZO/JjMIWzQGWTXkDKc9ArWnghX3uPywbO+E10gcmnIzAc6Afbu+x/+SSdL1?=
	=?us-ascii?Q?0J5O2tankTO7oeyvb5XF3gQ2joXXZIHrufyoRiBgT+tSU/FkcDpP5SWUMYrz?=
	=?us-ascii?Q?sjeQ9v3obt/NhGyBvblo1wEjCdkmgKwqpgV0lHVXeB08AiLTfzNr61HeDuc9?=
	=?us-ascii?Q?Y5nnVrV4LPvSfV/R5PpjIH36G7w2UN9qA816SYTZKkPPx+g2uaOXPZeaS401?=
	=?us-ascii?Q?B6n2LXHaOZ8Rp2Fbd+e7j35els+VF34D/SFedlKO2LN74UXoTwwks2e1YysS?=
	=?us-ascii?Q?Ctod+82Cc7fm8mJJpJma9bcDkdM1ktTb8e2NF4gjGnj22PU9AZhZjLrbNVux?=
	=?us-ascii?Q?vE/l4J1+FTr3ytwRWq28UDInIoooeBOA3LaETDua91s2y2bkymiPJ47tZUru?=
	=?us-ascii?Q?ao1kytqxNCrblnPYxOF9P/cGQDXbCikzVz+L5WKeCPOnFL6JzVtTYa83Ob/D?=
	=?us-ascii?Q?JRBJqAqEWSX2tkqlLsXu/AU48K6/6a5pfCQ2Wj2KbaomZkzOV2gj/1+LnOs3?=
	=?us-ascii?Q?xwpm6eWijWtcl7Jt0znAiXD7vmXDD2oDXiK4xt1COAHy2r3TN0kcGpt09VGX?=
	=?us-ascii?Q?Mpry3DRb90VarVYlrwdkDIzEiLaCrb/4Lo/VDTU9gKdpUHX8IsqzgcHUDIHt?=
	=?us-ascii?Q?fyCmCToRH5kz/Nt0i/qLjTmr2LPbgNu6RhnvGpsd+oq6n27aH8socvR0KDus?=
	=?us-ascii?Q?Iv5ZfMr/QE8fs/Iq4/lt92mz6bd2qGEeD36Uj+fX+o7bXGt0aOCrnvAQGyy1?=
	=?us-ascii?Q?Kr6qd2EjPF4HOlPp/0w+MT4G8DKhqEPlmwsZAIlRH7buarFhgF3RwkxkAkDX?=
	=?us-ascii?Q?SJ/WHh50+extfImVvDwFIa2q/8r0qFXTbxOq1psCxtNdlldVP6UbtyP+JYPP?=
	=?us-ascii?Q?5UH1+4p2BEKNVSNT9n4Lj4Hmvu6E1M6egvTi3KkNS?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1176;
	5:TpprGXgcyDxpxTTiUZtx8qxFbEXuzOSbEmaDPZQrdFYqtdY2qXJVtwvojIeLsvkekBRatfMR/lsIoFLJ1q484LfkYKWBrhl0XImGoT4wHjTq378ldB4ODT1lnDJxj1e6r2DQpfVCxtyxVJyS1rj8ag==;
	24:T3b0bI7AYP0rhj3UNw6LuX26IiSWinpRtBQ2ekyoL19IH6hYW/MW7L2ViMq6IBDeHg14Umh2LNoYnnFwsQnZh05yktYunHzhWIMzuokmOxI=;
	20:JDvsfudDMBJJAEfLjOGJkR2z0a133kqj35CXUqf9kElmTQdrZ7WW91GuH9LmVlG/N98qi2acNyYQPrtBy1tvPQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:52.4039 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1176
Subject: [poky][PATCH v7 09/11] gstreamer1.0-plugins-base: Add ssaparse related patch
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


