Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0110.outbound.protection.outlook.com [65.55.169.110])
	by mail.openembedded.org (Postfix) with ESMTP id E6415767D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:41:58 +0000 (UTC)
Received: from DM2PR03CA0034.namprd03.prod.outlook.com (10.141.96.33) by
	BY1PR0301MB1174.namprd03.prod.outlook.com (10.160.195.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Mon, 10 Aug 2015 03:41:56 +0000
Received: from BN1BFFO11FD002.protection.gbl (2a01:111:f400:7c10::1:118) by
	DM2PR03CA0034.outlook.office365.com (2a01:111:e400:2428::33) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:56 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD002.mail.protection.outlook.com (10.58.144.65) with
	Microsoft SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Mon, 10 Aug 2015 03:41:55 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t7A3faQb000825;
	Sun, 9 Aug 2015 20:41:54 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:41:41 +0800
Message-ID: <1439178103-17813-10-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1439178103-17813-1-git-send-email-b54851@freescale.com>
References: <1439178103-17813-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD002;
	1:kIQcCZQAc6fyegAkrKdzZMLjDswE/exvS9JhTak3+hHi7y4/mPFgbVeU1buodKJ2gjM9CiXohu7wiq2nhfxfMQIbFSAM32NN1E8I7PFujrvFsDT+16DThAQTZniarNs1aw0kKiYqnMHIcDOoV+H44qKKW9u/fqEHPjXbHgYck5n/DLHWXakQwz+8auqhxLaZEIdJm/Q/56xj6xKG6al8R8CG5bXIiDu6cQClKI8ig4HQBqdH8ZVZfDN4S+PE0m+l5jtVHpn9wrQJexUK4wkc9G+A+B6a0pp99aHtSwebKGQriJM9Tu7XVzUYhfh7Y1aGba/mP+CfDjrWsKMd61qDcg==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(77096005)(85426001)(4001540100001)(5001960100002)(50466002)(2351001)(107886002)(5001860100001)(5003940100001)(5001830100001)(36756003)(68736005)(110136002)(15975445007)(2950100001)(97736004)(81156007)(450100001)(105606002)(87936001)(6806004)(69596002)(62966003)(50226001)(77156002)(189998001)(106466001)(50986999)(19580405001)(76176999)(104016003)(48376002)(46102003)(86362001)(47776003)(229853001)(92566002)(230783001)(575784001)(33646002)(64706001)(19580395003)(21314002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY1PR0301MB1174;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	2:FXkTgdSE9xpbQIkvVSu2i4SU4pmPnJ1PbmZz313z9RPpXsMY0oBoR6a/YUBV5mSuWOS5eoflHuTgBwxHKk6qKxdKQu+g1ijOQ1eUb7hL/L5Z5YZN3VB5c/zezxM78FJTC6jYqbO3syPNNCDds1fkWwdCMSQIrdplhNiOz+nrDsY=;
	3:MEtHv5bBZVmXHH0gVxZi0LbfS5sz1Yb+8BB5bSWxoykqX9dDY9jPOcKKU7csOFLaLQiWXptrZ96MkpioQ795fZxPj4t8avGKXUaT0Vhh51Z6XJsV6NR5aadWjedcd7epeSvXasMnBFzMPhQ6nr1ejZqlZ/gH1c4Lamqz3W3ffgInTdDmGvyfxWhbKQHfLIJir+O/X1SLeMxaOgZi67YELr+HMnX04U9F1XKqcmX/U4o=;
	25:FTNOgobk93jM7pQ7LcRUxT2Ow39+Sm6ylDNGMvZjtbbs6RcAX0I5T9ng5rLsOVze8VkpvcWb9zIalVoW1G5SejugZDm8IKRSvDtCYQ52K4aT/Dg5OmkeNtcU8E1ToXAQLUS3i2Xu2Qw2Ic2PkbX7ZzBFMj5JD12dT+rnH6pH47l5yIkeVh6YySDdqKiCQ+y6MQHIWICw7Wh3JKXL2tLgLeqMx6/NLNtDutMs0+9CbfrfIUtnKHK7s9H5AQQQ7aOKYd59aOn4avoYHOrbjQU6mQ==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0301MB1174;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	20:AtOsIB+14k+pNIr7aZrD6+JuSAaHBrm6MeRX9+TKJS1cqyPrtsA5tBVPNCPtSz5evLuRFjZaaWZ+OCP3Kx8OYU42dMIEszqrYL1c4BrCgKoNNrheU9WFxQArhdRQSRRiEgTL9n7V+kPuZYXVmnWYaeh0U7dBoJsJcpHCnIcDZiLIrqlHCd8LvKtv+2PNUg5KAQPLsBxY6ZoPVkird6Nqe0euEvzesBTBcUV8+DaB9B87GoDpWWgn0WwAMIZfDgo2sf9WHIL6jJM4d/wQk6k2iA2atCMyML53Ii0HqsAl8IjUJkvH2mOIYNvW39lzy5p+Mvpjlkj6OsBQlOLuQvzTSL3JDqF6jKIYjzP1BMYDD+Y=;
	4:p1cc+OKl5l0xUeI+K8JA/DxVvvIZbF6f6ncuMrMZ7bYTankuOY967dzEqGEwRF90GG29I8tneFTxmbSBurXLSt2gGv38PKH8Oy2CviI0bqdleGPC5lcSrELqha4RH1MFMSySK8j9ghxuYToKFR5IhDPbZqaqFYAyZ/BOMAAQVqS7LGzfK9S2V/J4u9EIN5RKQbCQCqDd7EHZeb8CM2VSJ0Sara0pSwFTB1r+asVYcB2XIRqz8foLsyZ6TvfNaWJIB0gSQ1FvlwXnB928l2SCHRfdzrXeSg4Z0crWyRWXI7E=
X-Microsoft-Antispam-PRVS: <BY1PR0301MB1174EA7B6CC4C3631BFD41C286700@BY1PR0301MB1174.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY1PR0301MB1174; BCL:0;
	PCL:0; RULEID:; SRVR:BY1PR0301MB1174; 
X-Forefront-PRVS: 06640999CA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0301MB1174;
	23:qajoG0vphc6a0kzogSZ/3AdyKJ4w15uSHkibaoA?=
	=?us-ascii?Q?jp77cLSnWq7ATVZrxxkN4rjb+W9NzIDJSMtlizpZQ667x+AGurl36d6SIr7+?=
	=?us-ascii?Q?NkNcMwQdDWbLbwgFJwqeXzZL8vHDvNL1gpk/u/zR8uzPPbF9yrn89ZAeNnKy?=
	=?us-ascii?Q?/oSPagd185nhc60MLpXx9Go9sFhlwIfk7IycrO3/JyOXQulm8flvaALVyRAr?=
	=?us-ascii?Q?crU0qHdR33ikvAUPRg6EieT0ntnue4epFFyRxtIHfYiEF8xrEsevrzP0R+X0?=
	=?us-ascii?Q?5ydj9qd69Yl5QWuRO9ZhM7zKEuulH+2pIyTt3rR8gLREmHTrcudHb3zlTpki?=
	=?us-ascii?Q?XMBOLZzFVO0NnDBiPmVuztyav/UHWuHFhlOObVipfASzB2zRYP3Z/4wCetUQ?=
	=?us-ascii?Q?ClkU2UEZc45ln1z+qLkPbdW5EX5YFZ+0kItFapZ/arMQYga4P0l9TlMfHhHq?=
	=?us-ascii?Q?swST6RLFB+bI9vxhA3c06qLElDYWm2euTzcKHE2UNmbCGUP9mxK9b7ihDRsG?=
	=?us-ascii?Q?eqZ5Ct0zRH4fA1vFTsvP0oYPoWIdp9TzyKCLQZnNi/0wjwcswsneGp2dz+As?=
	=?us-ascii?Q?hkKP6AnjhsEZGw9ApPM3u6b5wkG7usJ8WWc/eSREMkt4QqqG9S3frVyWxUhJ?=
	=?us-ascii?Q?guB0+ZxQZjZQgudmXuy14F0RZBScQN7Yv64cDPTUnlsk+Z0FPTaxu1LPqiCi?=
	=?us-ascii?Q?MJdZTtoADBspDRCTx+GS3vlJIZBqOcWM8IHjJofB5si+gglPI4H1NFCyW8ZK?=
	=?us-ascii?Q?DlhvdghhD0l1AWgJuxPAwxYnHMJH+q8lQzPabgdrg2HFfqJS2qg0RrCNaBm9?=
	=?us-ascii?Q?N07rANtA/bGdvXc/JCDJGWbqoSjfY84OoVKSa9VRljfluQ3rCrzbCdvTGam/?=
	=?us-ascii?Q?vaCg08BynIpK7+b4bcsfy8gCRJmhYZuIcNGQawrCLL7XRz83n8QizlyFnrkZ?=
	=?us-ascii?Q?nOY/oRQhIGOx4rhacjwWQZ3lBpcz19wfgiOnQ7Lns1zd1CUMlalGSdUWFTln?=
	=?us-ascii?Q?j/EDDxY5/9qISM6B1F7J7ksbME7LqzaeQCEXyHzpBN1Mo3IwZQB+FOxDLV/j?=
	=?us-ascii?Q?lh1VAkKNdJod0/JwAQWLypOjm9lfpPWM9Y6P9Nmee9EoELeFdeq4v2NbYG+q?=
	=?us-ascii?Q?+Kq3tbAOHvHCt4BHAKuNj0kMa/6uYHvuPNOqU44yXIinQGWWDPdBhEJC+upA?=
	=?us-ascii?Q?//MvTPGUhFas64Sy4cXuF49a1w7Ct8gzPE67a7pkV/QhhR6LKk/P8vflnAe6?=
	=?us-ascii?Q?MendfrLunDIu2OYxM0GgPDOoVSnyNOP27Kz9eglMT6V5ycqdWcUWLlviknmq?=
	=?us-ascii?Q?Bkg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0301MB1174;
	5:4SzzGqXJhNb7vMDwjhhs5G9KW2ysyQbbWTHleOyFrmU21N+6D+CaFCQBWRHv0XwcfJFfKLarklwFPMDvs2hDHY2p139RO8G2V/WE3nOK4F536sJWGjBwI5mv7DLXZ96vk+EYuE3AwZtGw26CKL1eDg==;
	24:MqIeP4X2W5R3WJIlxEvPb+TUsP/VZfhakcExdZTXzrOv/lFDK/+Lk0Ld19X0RrY9LgeJu5XBxOANvRBq8rtB4trVdor/KFsBvCCaG2s8zGk=;
	20:D99Ll69kHxE67tAWFa49GNoTItFbtGQFRrLi4vnCByZMsfcyY2GVtvRWL92Z4kPgz1OUw/CNShMZKy5AMDoQtw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2015 03:41:55.8164 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0301MB1174
Subject: [poky][PATCH v8 09/11] gstreamer1.0-plugins-base: Enhance SSA text lines parsing
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

Some parser will pass in the original ssa text line which starts with "Dialog:"
and there's are maybe multiple Dialog lines in one input buffer.

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


