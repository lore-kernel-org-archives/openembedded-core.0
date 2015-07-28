Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0117.outbound.protection.outlook.com [65.55.169.117])
	by mail.openembedded.org (Postfix) with ESMTP id B1428763DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:58:31 +0000 (UTC)
Received: from BY2PR03CA006.namprd03.prod.outlook.com (10.255.93.23) by
	CY1PR0301MB1179.namprd03.prod.outlook.com (10.160.165.22) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Tue, 28 Jul 2015 09:58:31 +0000
Received: from BY2FFO11FD028.protection.gbl (10.255.93.4) by
	BY2PR03CA006.outlook.office365.com (10.255.93.23) with Microsoft SMTP
	Server (TLS) id 15.1.225.19 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD028.mail.protection.outlook.com (10.1.15.217) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Tue, 28 Jul 2015 09:58:30 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6S9wPeh017590; Tue, 28 Jul 2015 02:58:29 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 01:58:06 +0800
Message-ID: <1438106291-14986-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438106291-14986-1-git-send-email-b54851@freescale.com>
References: <1438106291-14986-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD028;
	1:+kTtUMfJLzyH1Hj6BJcIX/kkO9O01zXcQ+DEdzMSwTLfn1kKgCA+lKelyUIXwZ00FHjFhWaYc50bTzKlKlaxHF76xGdu6UYne7pfCj3AMVDLtPxXYhlo2GAXBbw95ux5jpgzoH1+Y7PFpcsFNyo+mVj4bS8UlRzxoQXmMyMgFlwkx94MOasMlvMd+LqNJs+bardmyysLgoJ/RrvH3izedojKhqaZxtSShW2ustP68uN1i4EkPc9rgPu+Nvvaj4adQgVn2ca9dPL+RsfiBXTLETUQ+oPYN7nIFzhae2V443lBSbSPFk81XQGcZSzhU3QiVx6nWlqtnCcNEIaLcgWEsg==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(230783001)(2351001)(33646002)(110136002)(62966003)(77156002)(85426001)(46102003)(87936001)(229853001)(575784001)(107886002)(77096005)(92566002)(6806004)(36756003)(50226001)(19580405001)(104016003)(47776003)(2950100001)(86362001)(76176999)(189998001)(19580395003)(48376002)(50466002)(106466001)(5001960100002)(5001920100001)(50986999)(15975445007)(42413003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB1179;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	2:J1DcSDRO9mv8YQq9azwqsyLG9IbR9cJLAlmiTyxJCsxD7q8PiDau+boOwklM5ox/LsoafX/atjqQH681D7RY5oF49Elqg2Mfj6sDXrtRonDctC7wVo9Xij/CAvJwjvzFfIItSJuVW00hDA2QO2Zc4AI3JKIDGTiqRkmFEk/Pnzs=;
	3:7sZ2rT2LkaHvj2vdi8Wu1jVjT0sYNu4HSquWGNElZ7jy6oVbLYxh8LJr+K9VYXmDzdRSOHS5mPuqQ34MCJlR+zTSgyhWUGyUP1oIxknRygHvadp/arZ4ynjKIHDTXyT1IfefGQNeO/MRQY5BOGT1yIMvGR5NAS0QBsytrKJvvLgVdhDEXIjR4iKKb5tSI2fDI5gdgNG033yYadn2oy7aoiBeUiwamK4Ymfkswvpfo4Q=;
	25:suAwE0N+T7NWES/Zs6BsqLjESL1apT53sJpkTqxjmhBhnDSl+LYBZCZxlytlqpjgniaPLGpTv2270mgRpzcuts0PyDd3NrOUQcNL26MsiOJ08etvuG3In9JmTR/yn+ilWgsoziMZ+rMwoBtXu41zft8tTp5YOPAQ7o46g7T2HYHOwlrIdfZBYFIi0uCOzqubr6mC9Qfq5L6GkT0kiOXJyjCLKw+Ggt943AJCB++7/AkIs3TZYmyK6ury+8K83ve6ibf7NcOKT86Psrh6pSZrpg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB1179;
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	20:DULnomBwgl7bTGcuQvAj+Q2VtJTZ+fv3Y8Mmw5ex5UuD/1TmQ5holPz6RO8X1Wfr2Lwl3v2vM6WaCM65WekKiyOcLQfkH6crzWML85Yqfea3v3rAv6wCCODMYqQR3QHVaaRDm1u2ZraCCGsjRxsBfF6SPwXVJxNAGrrU406lBZ1Wrnr4/P4qDbXOx0i+sLW2Ozg3LEJY9XHcoq5WnTs9ZyrIOpkNU5AJfOvgLFic7nQh3kvc73eaOfYR6x9hZguxmTt5DxaJMxc0hcbRrNBojuntXGvrpdOR700KJADVt4eMJWYcUwW5kY4apURewE4iuWfsRFGAVxScE4yh5711v46678jG8E0jGGgXLgk2etw=;
	4:7rnNDigZR+pA1e7ggOtuuJ7MT/YXX9pUBRkdyR3wrP4HzSnjQ2DWzqCdhnpbsj8JJyzuPjC4z9UiEr6LvC1KQXQ10Py4OfGli86TF/+63fLNd7FhHih9FVatzZ8Bk7GEKzIN5EM8uSfDSCBwaKBtwxWd9OTu9IMX+WKMpS6Or1IxYX/vO2MxNXG0AcRV9cjIv7zZuab+BDpoTmwxOFPnQnlwLSaLcH5DeIOcrhdRgUd4ZWDD80T1dEks8lpjU7gSMlJ+nOTFsz+gUc6/O8wNBRJMM/dWc/u3L5ls97gP+J4=
CY1PR0301MB1179: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <CY1PR0301MB117976C99427908FC56E87FD868D0@CY1PR0301MB1179.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:CY1PR0301MB1179; BCL:0;
	PCL:0; RULEID:; SRVR:CY1PR0301MB1179; 
X-Forefront-PRVS: 06515DA04B
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB1179;
	23:pOVxAylAz517luCqwADgVX+BDMiutyQSYqHBS5p?=
	=?us-ascii?Q?c/fZcrMID1UOVji4GUNChFT0T5I31hC58VabjicZ5L/aKxRFBz42lnJ7ZWC6?=
	=?us-ascii?Q?3HcwWn8RPTJBzMP2Pc0SeReitk91XzZ1B3Iapg6B8OyZLuj4QwfJ8lH0513f?=
	=?us-ascii?Q?zT/E1w8/2Hv/7ZAqKWrPlZc6mJibrZRe+8Sa7eFNgLqMQCrliIwSQQ6QmSdX?=
	=?us-ascii?Q?UmSxxwChlnfqhjLvH4SxhbOZaUJHf0YxpXTW9Po54+P8WkOzM1FotV5dZqAO?=
	=?us-ascii?Q?I600ZyXL1K0PwEoFk/Mqdh0W35J+xpd/4bHG5BZGjmCmn58tcawVqxdEY+Fm?=
	=?us-ascii?Q?FuFbrwD62IJmHtleWv6PqHBzyYWCpQzWI/hkkWG/2FFnzGoKR8wSXG1Xz+Hn?=
	=?us-ascii?Q?6ceBRvrIHGO5F6oCk/IJcYa7Edl2NJYwnjamET7tLd2BF6DOabMRLdILjote?=
	=?us-ascii?Q?adaVSy+EmdSkW1oBlDpWWOzyuAWMsicjna+hD0EqTvzlGw+jjBXIDYv+kYLP?=
	=?us-ascii?Q?2SMrfeb4BTsPXBb6C3a+7QUi0CXCFhFBu5KszKasBYnSNy4k5NVz/qfVVBoU?=
	=?us-ascii?Q?0WqDGaRCMEGn6f8/AcJl0v1DhEY83kMvpR5BEeF1y35M32nrXoOzTQf8o1A6?=
	=?us-ascii?Q?npRLwFVh3rVg0a0csqhyi+4vQxDeY/AaZUQlkYlsXFEKJ1yVp13IkjN9e/4/?=
	=?us-ascii?Q?YliICfaWMBIkZrnSBk414YeQSLceRfagslt3qeFtus4hfLAWtcVuHU5cb+Ak?=
	=?us-ascii?Q?3si4GNniBZfznFT2sX1m8XHwqAdZL8PXyDuQ8SbdHVqsMnY+k2LvPl1NWZJM?=
	=?us-ascii?Q?dQLefhjZgVyI+q2EYiE2WWncS2BSqLbFMTq88h3xUNDHDuOhkyA44Z1yuqGo?=
	=?us-ascii?Q?ZBv6FNcC2azODzK8Ly+mh+4NvwJpVEdW7Krmb60COyQNtWcKGY5vqUYYKcrW?=
	=?us-ascii?Q?DP4V1HCqe6oMM6YkQhkizJZTcVbM0HiuxPf11HBRrZSM6BDLELpPl+tb0tug?=
	=?us-ascii?Q?SfOr5IwUFvPe0TlazreKla5uRvnEJT0YJfMIxcNLxeagJIw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB1179;
	5:k+NivIXG5A9CpqkaGXyDN9c+bYFQXfTO8BomH1d6BcQZmFAng0X5RKSCq3FnH0/2A1fZ1OU+RRNCrW/9XDujdRPt7ZvUZu6YXQwnNh2EZ+Vvpek/LTPJFkLk7dna3G4WgMiSgzx2uycwZ1rKxUJsPA==;
	24:1rYjqgQ886Qe4P7ofkT9ugO1g6goJ2UmU6hVvmiMNrmi4fZgeOUriG2IoXYlxgFoG21ImMxb5QLFz9K3dqzZeLG0ESbfWGKMC/lXyNi0+EU=;
	20:LqKveZnNEEDVgX4MYZB/m5DfEjHsqdCQXaQb0lovMGdQn31xyn3GXJbjFnXY7SC02B8Y4LVjfGz8OpGF2mWfsg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2015 09:58:30.7705 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB1179
Subject: [poky v3][PATCH 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Tue, 28 Jul 2015 09:58:33 -0000
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
index 0000000..a74c197
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
+Upstream-Status: Pending
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


