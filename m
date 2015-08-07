Return-Path: <B54851@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0141.outbound.protection.outlook.com [65.55.169.141])
	by mail.openembedded.org (Postfix) with ESMTP id C6ED076724
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 06:16:38 +0000 (UTC)
Received: from DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) by
	DM2PR0301MB0864.namprd03.prod.outlook.com (10.160.215.15) with
	Microsoft SMTP
	Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:37 +0000
Received: from BLUPR0301CA0025.namprd03.prod.outlook.com (10.162.113.163) by
	DM2PR0301MB1183.namprd03.prod.outlook.com (10.160.217.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19; Fri, 7 Aug 2015 06:16:36 +0000
Received: from BN1BFFO11FD034.protection.gbl (2a01:111:f400:7c10::1:185) by
	BLUPR0301CA0025.outlook.office365.com (2a01:111:e400:5259::35) with
	Microsoft
	SMTP Server (TLS) id 15.1.225.19 via Frontend Transport; Fri, 7 Aug 2015
	06:16:36 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD034.mail.protection.outlook.com (10.58.144.97) with
	Microsoft SMTP Server (TLS) id 15.1.243.9 via Frontend Transport;
	Fri, 7 Aug 2015 06:16:36 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t776GVMv028512;
	Thu, 6 Aug 2015 23:16:34 -0700
From: Yuqing Zhu <b54851@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Aug 2015 14:16:33 +0800
Message-ID: <1438928203-12256-2-git-send-email-b54851@freescale.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1438928203-12256-1-git-send-email-b54851@freescale.com>
References: <1438928203-12256-1-git-send-email-b54851@freescale.com>
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD034;
	1:VkGyTyW3Se2IYr7WYXqYArkpnis+/XY2gByeR11cmoqBn7sebujtiyS7JGlj7hVtKump9K8evDNwWiRC11gJ7mRnM3AGFIE6opsbeb9/WJvFgiMporx+Z+/wgF/3d/nDgDJJ1/tNOzhCQS58ffp7SIOtPBpn5Ez9ywRxETvD/zVx3CPr8wJsSrrUNTzWn90x2r6Za9GX9WWa1VYTf6lwQoFzbkWt6kpwPNbjH1uSIbryh7/viQYjHdkHMkrfCu5QWnCEoLbUG5iQobX+HD7nLVfmBzZjZ/8IM5U4G4HBR8D19YLt0fkHPQ6xMKKwNVXuvpRhdWy00M16kEoOmo8O6g==
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(2980300002)(339900001)(199003)(189002)(81156007)(86362001)(575784001)(50226001)(2351001)(5001860100001)(5001830100001)(97736004)(229853001)(4001540100001)(33646002)(46102003)(87936001)(6806004)(19580395003)(19580405001)(104016003)(76176999)(50986999)(77096005)(68736005)(15975445007)(110136002)(92566002)(2950100001)(189998001)(85426001)(5001960100002)(107886002)(36756003)(5003940100001)(50466002)(69596002)(48376002)(47776003)(230783001)(64706001)(77156002)(62966003)(105606002)(106466001)(42413003)(32563001)(4001430100001)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1183;
	H:az84smr01.freescale.net; FPR:; SPF:Fail;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	2:NruscTGbIO/cxTA/mfjF4jto0/pcgGgUAd9TkUwuxW2ED+wNRui1yk5Be2P1UYuUnG+hz3mwBBeLauOHaPZoAuMRKrPd3dvlV9r0GRIageaz6JNd9Q0520+YJzeQT+7DJhQMP7z4dnSfKuQkRSq//IzB5lSm1MnERhdpcNT971U=;
	3:SYWZ2zNBThs0E7Xp3COYJGdH0svwi6GJ5+qt/aXmhNBRESaoW3uEUCbB5oBuKk6gHbIPCP7Rl1eZ8DFNqdncQ8lTh7cN30g1Ar9rW5OsMDj3d6R6PwdY9DjiacESuTed7+uHqasUzFXbowSO9JsFpdpB0Wn1juEX2CsUjk+L/OTFyXo2POGeuDXXMMFW7xaCLl9vDvudHMmmSEvdPRlWsDaSOoAg7ixO2g0G5mZIIZY=;
	25:iwf4PmimA8q/kRfzHwV8tEA+Uxd/nFAL9KqhMCERqkSt0RsDuHSMp4SSHo2bx2tNO2JOtGbbIieJFa9SP9vBsm5VL61eK/OWfVJvuVmoA6gxAisPEOEDaEnsxAMGa7GA56QJ6UbFkbOtKtD81jjBqwvLyNmexqx0b+uhYtRQGZFqOVYqfQelpv4LAU0Ul1P8oDQxXP3bJ4lbc6oxsVT148cCyBwrdEfJWY22RqtNa6t5Utmjaut29KygnxmTlLDMCFW39BaCf7tA/qJbAy96Jw==
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB1183;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:DM2PR0301MB0864; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	20:rBDRmyJSzs0AmlOXXXAzqsNuRxL4BL13bfZx4EBec9+4hG5CwitrvcByV0ZpPKOPRPLDJzR7xc7witj1vlbDR89goO4bBcOmyKWhx2QuTKNxbKqLG2wZ+UuOFO13IYmjdtM03Uvk8qMEF9m1+GPhG1VfYvYWLnjOA4EQt609esq484oOL6wnjWaaKtl7J4YJyoFIyOGtW8WnrvsdUhHDSosC+TwaNedU3cI0zXju3LAVB0ZW9CJNZ7jLArgLj6oGGTPXWaqj5deQwlFffsYgyd2E3xQ16/3EXB0zMFvy9uCG0o18A1LMa3lIIkZOezcGDMznlwFiER7fSKCFHGvF4aGqIjUjlCGttMr3HdoPZvA=;
	4:2NsxjjhBD11C/uNje1coqF8ED5uiwj2oqO+X+8ScbpC9PfKlaTtF9BHgcygHJEmpgosWphJJNN3E/L/d5aMkyCqYU0h1DXSlmxutQRqaON2jRpWAJJPJWedscMY8i/8Oqy/8lY/r8T22pHEBvj29JZkhP0ProUrU6+YffGsXQLJK4nAO5TfGwO9E7FS4JPV0n8SEAaVjm8EH2uf1DJMzk1WX3voXP5VAyJ+bQNrab2LG06GxiaDvRLpJp5A7KnTIsKpslWZANINYeyJqqTfG1NwVzD+l30a2hSuBk0qzZHc=
X-Microsoft-Antispam-PRVS: <DM2PR0301MB1183ED778999B8A6D1FB9EA386730@DM2PR0301MB1183.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR0301MB1183; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR0301MB1183; 
X-Forefront-PRVS: 066153096A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR0301MB1183;
	23:3VVz2hbzPF33T739pnOsOXI2QeL/TN4ueGdvBJV?=
	=?us-ascii?Q?m+brmQkisduuh+leDxYvfgTfvUvm4H+Ty/R+ahldLq8LjayRbECuFfXW2yg4?=
	=?us-ascii?Q?lxxWFYdddG7mAMVHtv9gu9nrwhAMwUzHRRrUKyK2MO8RvGJczPcfWohuS3tN?=
	=?us-ascii?Q?SthfbqDWMJVxFiF9WZIVdoiUGMpmC+y1q6wq4QWSNAmJIly5NqxdL0NH71c7?=
	=?us-ascii?Q?Y/FohWflsRqlgRLK2q7TJnIEIVMl9THDaPusuhTuoTHTfVUHf7kQj6ie+Zna?=
	=?us-ascii?Q?SxTZQKKv/0ekLJuCLKOKURWHbwVj6akn6M4erqkmFMPihzBMQn98HVReoIPs?=
	=?us-ascii?Q?L4Cf8VpZti0wilPxHgB34HiGHKymrhGC17zT2qdeQ3KVxKZZ2A/EFRkHhEtV?=
	=?us-ascii?Q?htyQtY9k3zxUUVPSuYG/yr9MXwcPSDxs8vqZ9HOxGGrGaRMe1g2CBLf9NYxV?=
	=?us-ascii?Q?YI0JpopeZOrjYOScFFP4drZTP9PSVznzhXa+NJz2EdasmFfCxuHTpPnbS+mA?=
	=?us-ascii?Q?9Bgv8nifEA9QWysekNj1XVQnwch6rpJxB4PrewlqMWe+zxhUz7ghh89mdnp7?=
	=?us-ascii?Q?hJtVbQUY3S+xUbuiaOREyIH8hptmDGk2H4DSDT5oLj4B1JPM9Sf9HoDIVgY7?=
	=?us-ascii?Q?CnrkCcncVDnpuLTx6xrJHQ8LZ5OrEzVwrVi+NqNXoEx+SEKJRsYVAJcesrlk?=
	=?us-ascii?Q?9aKdrsUSjrFkxDzZq7aItnpE8wF/yirWKMQextaQdTM1tDkNJJz0OmxwFQ4C?=
	=?us-ascii?Q?wOd4tRpdnxSc9+gOMem85bLnerapyRtWh+E4ljwgjv+QlB/SuEFofgUWffdx?=
	=?us-ascii?Q?HKco6UBEIouJkkELSaw+AgLKf1Uif+guxHZVJzFpdgHozjJo6eGev4LsTG65?=
	=?us-ascii?Q?fzb2bOHB+pgZjCFxmLSsrnCMuqJXZJ8987mJoQ2KEWeXCbxE9GnirQDVUezz?=
	=?us-ascii?Q?1NaUZ3rGJJv2UMzTV7AxHXMGXx8RRgPYkB3PwQIh3FSDK4C5x9ilU4DwhDiC?=
	=?us-ascii?Q?vcFji+4QWV0e5t4eG1g6cgR6DL1loKJIMawzvL+OsXO7/9VX5leNrREE9H6e?=
	=?us-ascii?Q?DhLL15C+493aq7PJIVXDBQsRJFlLkJJtlVV4+NUSw8I1jZHT069r638xmLTN?=
	=?us-ascii?Q?yObvFac8cQ7TWrgJPmSMAIJkMGZUnK7lOv6wymaNFS3vaaqdjAh7AFSXZfzb?=
	=?us-ascii?Q?nUxZi4TUJDLsymekbgkpqjFbiI4Ssat9N+b9rfnvxiE4aRgn1YQwXJsr+P4x?=
	=?us-ascii?Q?7pmGNQaRbQKMHQeXosrGkCq4tyJxRC6Oap77tB+8JIy20ecMH8FWX+3YQHrT?=
	=?us-ascii?Q?j9sCTCItC5xUB+XooqR08a5Q=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB1183;
	5:qZft+Re29FutrmmeXqZRmfHFjcV0aM1bk8F2/nmXumqp69b1TzIrgY/KLTVsig9yJ8lHAgE6Tli/WnyTJMvVOj9ZrWLY0M+0DgvZqdDNyFSTvehWjFrrFKH7X5svtRIAgw7KbgmcS+7EzUstywvVFg==;
	24:aiug47au9bs6FTirGu61vcyadUpwL1cFCvNNBJPQ8qxQDQc/L6OXIkUEZ2DpE43mkkhY5EwagrbwJeS8OS9dB+t1Pqb+k/QVja36gmC1o7c=;
	20:fFqIX/w9xcHetdnJswD44zdIuciS5vVsQS30nLY/4FSi2rm1cI/PLRUTjgXAOS7OgJwMu+vpOBk3s6w7NdcerQ==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2015 06:16:36.0904 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1183
X-Microsoft-Exchange-Diagnostics: 1; DM2PR0301MB0864;
	2:Q6ThTLyeE3Ry8yzZbYd24MEtQScHUsZbpt+Sq3tncMkjc44iUypBn9J+uwokF2sK8e8+5dBDtVU24WZ1t6t0Y+jkb4yDv73xuEidAmYJ9VUNHKhohCxtI8oOzhTTKmD1KeipRKm9nG/NVgR0fCJhoRV0SP2X6iiI/3q9p3/VX30=;
	3:Q+57V+cb09pngBwm/33JXk6faH+FgeUQzWxC1AubRZHOZ2rLrebiRWSPIvx5Wf6pTXsbYlqykxyd8KCDV12FcrVz+hphjJ5Qob5KJMcyCM2fIITnJpwmycE3QoF/tqP+7G0JtlgnKNzx210Cm+TqWoasvDl8kzLotQNl9QntVGa8181QkHvzH7oJMZDYJyvVLxsWtOrmQbho1lulwLi9Q8sH7jGKokxF2TTtn5rqg3A=;
	25:WliaVm0/AlgvBynCe2PQzZScN1omanNEuFPPbUREQ2nKFnnTIG80BdXz3U6o9+BipTBDy/laQCyNsW36nFa0aCE1x7FF5HsaOSm07yfUQRxRsQ7mOfH1I6QXO6IRp3yVESY61XZ1xzx7eY4V1YrSHd40g2qL95LM2dTcPjyq+f1J0Ac8ivDOyd4YXgz2lbObFAStak8pAQRsKr1JhzJgRXgXjBtSmNdSC56RLrYcSaPwsfAH10c43I6vGg+4w0qb+MEEzOq63+q0zwl7aIABFw==;
	23:AGT02mtnxSNp43TLIihdrrPGlBNcuj+O07l4DGlg0sQ6+uofuN0B3D2/SiiJUjsSPO6S0v/0LHz3FuCiK+D66/MPXVOmPBbDa1r74ESsm6fFtBDzzLUudQAKcXK4fSzl+M3rih5FtsHw/yVIg0BQB0hF109D4XS/P3231tahdl7K5UOV5/kUo40xMzMA0uFmRbelVPasBdl5M4ti7uFa3iQeQI0PEZArf7vzBR+uVS8fGgEyG9d1+aKhcYitoaHC
X-OriginatorOrg: freescale.com
Subject: [poky][PATCH v7 01/11] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Fri, 07 Aug 2015 06:16:41 -0000
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


