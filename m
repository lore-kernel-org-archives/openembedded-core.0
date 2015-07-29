Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0140.outbound.protection.outlook.com [65.55.169.140])
	by mail.openembedded.org (Postfix) with ESMTP id CD6A6601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:26:03 +0000 (UTC)
Received: from DM2PR03CA0051.namprd03.prod.outlook.com (10.141.96.50) by
	BN3PR0301MB1171.namprd03.prod.outlook.com (10.160.156.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Wed, 29 Jul 2015 10:26:02 +0000
Received: from BY2FFO11FD050.protection.gbl (2a01:111:f400:7c0c::173) by
	DM2PR03CA0051.outlook.office365.com (2a01:111:e400:2428::50) with
	Microsoft SMTP Server (TLS) id 15.1.225.19 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:01 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD050.mail.protection.outlook.com (10.1.15.187) with Microsoft
	SMTP Server (TLS) id 15.1.231.11 via Frontend Transport;
	Wed, 29 Jul 2015 10:26:01 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t6TAPtZL004765; Wed, 29 Jul 2015 03:25:59 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Jul 2015 02:25:35 +0800
Message-ID: <1438194339-13618-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438194339-13618-1-git-send-email-b54851@freescale.com>
References: <1438194339-13618-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BY2FFO11FD050;
	1:kldZVnq/d5ZOuYX79QlUZblBJ2U047sLm3mJ/AJlsVxf+8nsjHqn197YTECpelJryUA75jhKlncPBwG+sCa5SRh9kmzUJWpc15wLgoIqFhplfa3gcQM3EWs4G6E2Aq1jlKi1mEvdHFnbRormUsmh1z7Lxu/zeriol2AlnXAYdP/WOtQt+p83BwjyutLpVKTTFWG8d3a7UIB8pfoxrOk8h6KJ7/DoTqeYVz4UuSG9D1Hgtto+2VrNHJUHXC5nlF1L0S5Ac1abJK3ei4rBFxwRvGhVj7EC+I+960RHDRo5vHb6EDclnu/XY9wktAzos6tud3z5RMhM7Psi04LkbLkxKA==
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(189002)(199003)(2950100001)(48376002)(5001960100002)(110136002)(19580405001)(85426001)(229853001)(77156002)(230783001)(33646002)(87936001)(2351001)(104016003)(50466002)(76176999)(105606002)(47776003)(107886002)(62966003)(189998001)(92566002)(5001920100001)(50226001)(6806004)(77096005)(575784001)(19580395003)(86362001)(15975445007)(50986999)(36756003)(46102003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1171;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	2:WF6JPeyhBHnj1DsfI+9Rd68gu/WTsmt05WtrUk+9bNUGY1A7k12+Wyx9d7ChUVO1kloYGPipti0LvwQrFnAjW224YZU7bm57hfbvhaWwQ4JzMcl85i2NmdVr5LWo1RfkJMgxP8iwUgOYrRbThx5GxktEiYK7fh6O79AL4uf4F5Y=;
	3:Cr+ABMEelr4Cpr6kD85iW0XdNXXQvxyXGtwufQuBxrcectivnzxlVBePCLr/S1IFOjdjr4rr2QxIuTqCZ3kmVsw0Z2M8NFac3/v/SCn+QyBVic6z14th97O39BzpG1wNiMpBc3w6HoedRelLNGULp4WAPNhIhZfyz5ud/+3aEcQqwd34ZyJAW+HWNOHJVE2RwUXViCyvCFsoW2h3n1JzwbycK8kLQlW35ghOAZ3anBU=;
	25:pGG1YfHmPfHuRfW2aSjkhtifhKG1axA87y2F6T9TBvbY7wW8zHvsPknLjM3gYVR1KyN8i9pCcqgEbI9dPeP88mzjSywmpYa6/DkOIL4h1F+UA/sk8gWtBaOqD9j+VrR+LM8+7h93IBYR4DuhuZxwMRf82knwNLdEUuEf/eDTxDuYRazktuRUEyuosUZRCv42+AQmusLDVIDpQEvgWxW6fYCg9GnOz9hFZcZMA2mNWl3i4YCHU2vD4JSR98QgErQ7z4KnwQ3+n0xFgKtj0ELSLg==
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1171;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	20:yvTtRdKoOIuHWz500TlHex+ZJY99fW3zHiAXd1JFk+uNfIQcxIT5CtlNOOJZB0F6DH2dBLs1s3YBGvA0Iew+8IBflCCD+ZKQMU6KRQiMB8iUfNF7veilKCzmiKWOf7RA5+NNX4wkMNKYAHJgnLf6zrvWTJKtrcoICybK2DDrsSXMcEUuesPJKpNpuf3Oc40VtvY8A0JsghucoOhxHSWgW0uAalloh3Spqy2qDN7aQ4Y0Wwe9sbY9txNNTKC1qYk6OVmVm3JWGlqi9LfhWR4Fc0yRx0vHReGSSI5GKEtsgRJgc7dEaczi02WnAcGSvbPEiRLqNF3FJwajBBTqdG818h1nGtpLCqOro7fsWPOP2dY=;
	4:xcEUfVvaMQwIsEAqLBWll68E9UpkERy2WRDZ0xoQgwdF4fx8MO6cVffRk/eAE6XTEzX6uHSIT1/cUqfhFsK7whX1XYGQuRFqfWiwbMJQZ3mOFxMZcpnB5ddw14DlqzhKtiwIV1Z8zGgv1yaHz5lGqi/n9aglj/FA3JWoG2ZzNvlKu6t8IT2jvCAgRG2fEWJNoKo5DHjZbrxi7C1jRpxQ5MuGGtez5zheKsoHw6MdcRvtmaH6x5aW5/j+t+0yjfd2HTRELhKK1Axe7XlRaaBBCbU5zQ53LZBSiP3q4cCkWwM=
BN3PR0301MB1171: X-MS-Exchange-Organization-RulesExecuted
X-Microsoft-Antispam-PRVS: <BN3PR0301MB11713619F65279F167E9496A868C0@BN3PR0301MB1171.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR0301MB1171; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0301MB1171; 
X-Forefront-PRVS: 0652EA5565
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0301MB1171;
	23:UTnEKSm7p8kCgA5FHU0ZkyH6WodSJRqOPaFQKKy?=
	=?us-ascii?Q?Q4HB5zM0UgkSxivScErI5H3xjNplGBPB1QK5ZZyXo71RjyVmJFbPvRdX7EPD?=
	=?us-ascii?Q?aQ/MfZ9DRbc82ZYMG/jkGviq/fYtW4GhqZZ1TSWFYe7Ys1bGPqGQ6AmjcGe6?=
	=?us-ascii?Q?edYWa+00bNhmQzFhwQvlUdrQmQZVpPNuynbTVV1xPaurr50jXGrCXJk/JcXw?=
	=?us-ascii?Q?y5Q12nfLhmmS6rHAekgHY2+B7RZzQR9KSN6VQ1f1ow/k6UCKpBU4/m0c3OgQ?=
	=?us-ascii?Q?Im0vzBWf8Cm7hNCm1yEiLgyPwc18hj2KofRX9R+TDP9SlUl+opLPtoDyFW3b?=
	=?us-ascii?Q?1z/rwJAbZzpXd8GeVPCErjTMs5D9OPV3Q2jRk6tSlZkQxZwwgW1Fne/Z2anL?=
	=?us-ascii?Q?E61+5rtFcL0TsWN9vC12JnM7cOZSb78QggS3kMvnAzPi85274TVFIOeKRuGc?=
	=?us-ascii?Q?1WceBQitxP3KXD8XPYJPALKOmpW7h4sTE2evqLhRWa8T/ovnvqNTdXpTir9w?=
	=?us-ascii?Q?Yrt7gHHM//UyEWZnObcTdhec+uh4M9m38Q/leRon+AHyakgySK+oH+daQcAi?=
	=?us-ascii?Q?J1x1RR/+4qcYWYXFxJz9YXBwxoH+6WCjK09EjY1eeWjvxbhvMmGEfGd8OWXA?=
	=?us-ascii?Q?1RHtRz7Xf9+NRPQ0RlrQwwGQfi4cnfkjldwWk+Vhquwi+r5Fj8NOUWFk650/?=
	=?us-ascii?Q?lmYBmvOg6R9HPnyZAGLWYgfiQXpH7Z7dz8KqxIf9Uc6aEngrD9PFw2MEqxqB?=
	=?us-ascii?Q?MF+DTCu7CkhKlngnPw5IF44WRW5jgt9usAHq0CXBQy22pCKuvEd3FsA9xcHO?=
	=?us-ascii?Q?T/ATtke4rgcbp2XuP3ZlHvnrrnlAOO7IFN3WX8jy6A6w9CIHatZiiF78WL4x?=
	=?us-ascii?Q?TuBVCWtOKHhgMyznJUnglN01EanEzbmc+0hI5abqmuC2amZl93zpRf1uKwUf?=
	=?us-ascii?Q?1OJSZXlkE8nEFKqlmQlophkfnjKmmw2eMlg9ubj4G2oPUJ7oOypm2QsqMFvt?=
	=?us-ascii?Q?YwKAM6CGM2iArzMLjVLCZ+i+5?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0301MB1171;
	5:+s5dpyrN4HNt5w+a4LyJrhZ7+6D3R7Iv+vFeyf6TBV8z3oOhFNxCLY7PS4fG5x6iy4i1U+73Ctq7uxD2g/xylFvfNzT1CBg4lwhLPrZdeU7fRhpcl1PSBJo4DJAErWyxTkAD/JNmHSD3ZPQQTYHX+A==;
	24:HsfEbuCaKOkTtwsza3DBz46Kcma0LJRLGPaU1rcwof3x/Jk+dXPE8gBkeER0Hxy20hbbOzPKU/T2A5wdhsXEO9kP+O48pPhARhP+9X1cuoM=;
	20:RtUgTfMy0yk7uAb8z9wkpqNXzZ4tnmof32DwBqvN8uIWeVy8mbSJDFBFxqvd1ysPLKTxz9t6vlIMo7+dwCTCyQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2015 10:26:01.7389 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1171
Subject: [poky][PATCH v4 1/5] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Wed, 29 Jul 2015 10:26:04 -0000
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
index 0000000..ef3f75f
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
+Upstream-Status: Backport [1.5.1]
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


