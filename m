Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24077C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 06:14:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53546.1751868840525023943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 23:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9283af41ed=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675lrsA002767
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Jul 2025 23:14:00 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5h76r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 23:13:59 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sun, 6 Jul 2025 23:14:01 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sun, 6 Jul 2025 23:14:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] libsoup-2.4: refresh CVE-2025-4969.patch
Date: Mon, 7 Jul 2025 14:13:59 +0800
Message-ID: <20250707061359.3096936-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAzNCBTYWx0ZWRfX2O/SLT3/gt8s 9T6blkj4fmQz7TD4p/luguTiBYHZl0KMrZdGSeAIS+kJ+8P0JmuIQZEWW4C/9muuVN/s5gZZQza m/sfccSZz6MHqJQ2WxOB4Q8l56VqOUo6e7S5Fl7GxNvgEC2qmaJGFCxYGcsWCSCDE89MoQU3H28
 lrs3P6v3tzBJmMSMwCeakUBdYyFaNEH/8rgj2e6BiVZpkG5dBOKbnQvF5dma4WieQMp6xvuZA6c K/b7OD+mHUkerEM1rhHA1bBZdPWEVRnfaEhF2s3Snb/FYEogXdoE00CQ8BdZ0C2eB6sehCE4PWz poc7tO+WGGj7LIEgtEdbozR3It9IvpSQMg5PIwkzB1ffn7/tSGr8qp8DSxeqYROCPobjuRZ2bA7
 xRPFxXv5YbopcTr0UlCh9t8oZFq52JTsXWbIZ51M7NaYzb3BirG2TMF0RfRaDOtqtTUxWS1V
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686b65a7 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=fk1lIlRQAAAA:8 a=uGLmXhzKvzRAjFe3jQQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-ORIG-GUID: 3VbJWk9-hm8JFh-QIjB6nO-yRRVjUn6z
X-Proofpoint-GUID: 3VbJWk9-hm8JFh-QIjB6nO-yRRVjUn6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=813
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070034
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5675lrsA002767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 06:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219973

From: Changqing Li <changqing.li@windriver.com>

refresh CVE-2025-4969.patch to fix the following build failure for
libsoup-2.4-native on fedora40/41:

../libsoup-2.74.3/tests/multipart-test.c:578:63: error: passing argument =
2 of =E2=80=98soup_multipart_new_from_message=E2=80=99 from incompatible =
pointer type [-Wincompatible-pointer-types]
  578 |         multipart =3D soup_multipart_new_from_message (headers, b=
ytes);
      |                                                               ^~~=
~~
      |                                                               |
      |                                                               GBy=
tes * {aka struct _GBytes *}

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 54 +++++--------------
 1 file changed, 12 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch=
 b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
index d45b2a2cb0..c1936b0b0c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
@@ -13,10 +13,20 @@ Closes https://gitlab.gnome.org/GNOME/libsoup/-/issue=
s/447
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/comm=
it/07b94e27afafebf31ef3cd868866a1e383750086]
 CVE: CVE-2025-4969
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+Refresh the patch, remove the test part, following commit in libsoup3 ha=
s a
+type refactor, which make the test is not suitable for libsoup2
+[0d7e672e forms: Use GBytes instead of SoupMessageBody]
+The test part will cause libsoup-2.3-native build failed on fedora40/41:
+../libsoup-2.74.3/tests/multipart-test.c:578:63: error: passing argument=
 2 of =E2=80=98soup_multipart_new_from_message=E2=80=99 from incompatible=
 pointer type [-Wincompatible-pointer-types]
+  578 |         multipart =3D soup_multipart_new_from_message (headers, =
bytes);
+      |                                                               ^~=
~~~
+      |                                                               |
+      |                                                               GB=
ytes * {aka struct _GBytes *}
+
 ---
  libsoup/soup-multipart.c |  2 +-
- tests/multipart-test.c   | 22 ++++++++++++++++++++++
- 2 files changed, 23 insertions(+), 1 deletion(-)
+ 1 files changed, 1 insertions(+), 1 deletion(-)
=20
 diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
 index dd93973..b3611db 100644
@@ -31,46 +41,6 @@ index dd93973..b3611db 100644
  			continue;
 =20
  		/* Check for "--" or "\r\n" after boundary */
-diff --git a/tests/multipart-test.c b/tests/multipart-test.c
-index 834b181..980eb68 100644
---- a/tests/multipart-test.c
-+++ b/tests/multipart-test.c
-@@ -562,6 +562,27 @@ test_multipart_bounds_bad (void)
- 	g_bytes_unref (bytes);
- }
-=20
-+static void
-+test_multipart_bounds_bad_2 (void)
-+{
-+	SoupMultipart *multipart;
-+	SoupMessageHeaders *headers;
-+	GBytes *bytes;
-+	const char *raw_data =3D "\n--123\r\nline\r\n--123--\r";
-+
-+	headers =3D soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
-+	soup_message_headers_append (headers, "Content-Type", "multipart/mixed=
; boundary=3D\"123\"");
-+
-+	bytes =3D g_bytes_new (raw_data, strlen (raw_data));
-+
-+	multipart =3D soup_multipart_new_from_message (headers, bytes);
-+	g_assert_nonnull (multipart);
-+
-+	soup_multipart_free (multipart);
-+	soup_message_headers_free (headers);
-+	g_bytes_unref (bytes);
-+}
-+
- int
- main (int argc, char **argv)
- {
-@@ -593,6 +614,7 @@ main (int argc, char **argv)
- 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER =
(ASYNC_MULTIPART_SMALL_READS), test_multipart);
- 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good)=
;
- 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
-+	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_=
2);
-=20
- 	ret =3D g_test_run ();
-=20
 --=20
 2.49.0
=20
--=20
2.34.1


