Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.58975.1622560180472184762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 08:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Of2GZI+c;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17867c9906=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 151EwdEA007267
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jun 2021 15:09:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 38wptu00x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 15:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNiBkpE5YRr2975hC6cTjkdjR2RhQwT7GIELdeMyulis4yuSACHZqc50vEEGtkp7VoyH2zhxDPsEUDmRBWq6SsT97ELnizeYR2UbgQ05sO7kwWFc5J87+YTgo3BfHQOoAe6h85KwhiHyOdiz1SdoJG8HHtW8C1BRHjfKhhFo/+nh82yF6cZe2VAxvKkY8k+kAHqO/5c3jg98smMSllFNBI14GSL0gqtfrvptubagt5sBLoIKRYVZxg0vU9BtjDwMjT87jBuqBhmh/wz99gk7eTYbcVQXwc0XcTCqD7vqU+7WRJ6+IeLskyQLPP/sTHAWWOqYuvDWw/p04lzBu1wdog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vy8bS/i6tH8Wy7UXqkKhPw0R7tQKiZXE54fUYMxYEG8=;
 b=fSZs6gtxlxque8/aavvU5WhM1Y+DAdx7iT2NBgrq6bwoBIL5z1Pwklvu6GoOMjDOl+OhubLUb1HIYLiWPProXUl5ASfhCiCyiHRhKcYMB7pV+lC8UNJ58StJr9dzZDauFuhzWo8KxPN7M2iQseBn8/OOY4BSG2NCWxXrKJVPtwEzV0Y6XG5ZnthM2CB0nAE6y2smZQJ02f3krPQeyeOGK9iw/Qjl3wCeN+p/cTPPSvz+7CdYYWLZphbf1HKmpaj0Oc5o5Rhx2XqmxMz13zVv7zX/IElgS5W5Pk1a0HNOd9xnsd3Xla2Dv+0uFyKvZNHo7J55nzEgE6+pbl0mhIh1hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vy8bS/i6tH8Wy7UXqkKhPw0R7tQKiZXE54fUYMxYEG8=;
 b=Of2GZI+cVJJBFK1ejRPZIHpnmzAQyf3HXnbCL77GkjxBL/Nl2wCdw9F6djDwDL7NuWkGcONvgw8/V7NcEj1X4njZHUBbOQDWj5svCPoLHiGVgvRNdHBfJ855VqDOMWRacgc+ZtKKUOIrPF9Ewahp4MrMYDHZYdKE/ETDnDRg73o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4816.namprd11.prod.outlook.com (2603:10b6:a03:2ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Tue, 1 Jun
 2021 15:09:36 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 15:09:36 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH 2/2] curl: fix CVE-2021-22876
Date: Tue,  1 Jun 2021 11:09:28 -0400
Message-Id: <20210601150928.1851569-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601150928.1851569-1-trevor.gamblin@windriver.com>
References: <20210601150928.1851569-1-trevor.gamblin@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY3PR05CA0013.namprd05.prod.outlook.com (2603:10b6:a03:254::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.9 via Frontend Transport; Tue, 1 Jun 2021 15:09:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d044f89-4f33-4572-ed4f-08d9250f4508
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4816:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB481668B4E1B3DDF62B49954A9F3E9@SJ0PR11MB4816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V3007exhVeMXQrNrWk+pFDKmbGdg/G9weLRqYXe/KVZbOFA9DV/77ziKIrThuIDGc8A0uklIHDnrnLE7cAi7yn1DNR2uLv3E8xqhxtB+Ycjdp7JqsFHM0+91SLBf6L9sLTKKERYx66doGgu3vvqLr0i4wfqu3KMxFCcG8a4UEzahLUvvX9jcPtF1EzIMfu4WkkxLSID3VWInFY1GxG3kXkrBx6eaGYCZAgxPT10DcumBn16psjXKdkmsDC3PsulvFHbCWTpHj2q7K6RFgKw8kCdZU1QjgO4h00Gmqe5bCfsJFc0YN4Lr7+veLjBD9QbUBqNCCOiCLtVc3NSTl5BJ3HidsQzr1+kuHMNluCvoDX2pHWdKPqTbIK/6LeJ4XtD92g8qjzgpQbIVs3W9JgdO9Neu49liC7yDUI2YScpkzQsoZJpmyuZ74ShPG3CwBoNQ1wTxh/q0rGOz4zSXZe+XWGtbn3AryB37rKuoY+CTjhs81Npoo3by8upywxv4i2NCAI86/IGvgyJcYhX9nnCqUXm+bFK0Crzkh7R/bKk+AU3x51AB1arW4at2iMK337rrOX8PF07mWf8JbZswWfnxiMssnKNGsDJNCF8mY42XNuqN3Q2XGtBu1TLtLZ9hSbOpP6s4awsHidb4pRUXrZLAEFEuMrkNfKblluU1NYtxzYFwOKSItpp2j6sUJ/UkUOs4gQJQtznYAE7wsOszzQE2m5AM8vtY3EkjOD1IgCNQKQWwxHGs48OhuzpQL5SKw/CIknvyR5MMFu5nEEmInM6vEZhFxxpp0bu5FJS9U6Ek4QaC22qeCTzI+EHLgza3R8EKjYNq2OHqKI5hrBLDjMEEW4/0N0X+rRAC4+P8pn5tqRE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(366004)(396003)(376002)(346002)(44832011)(66476007)(66556008)(966005)(478600001)(8936002)(2906002)(38350700002)(316002)(26005)(5660300002)(38100700002)(8676002)(1076003)(86362001)(36756003)(186003)(6486002)(6916009)(16526019)(6506007)(52116002)(2616005)(956004)(6512007)(83380400001)(6666004)(66946007)(11965001)(134885004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DfOZNN5Eoe138XCXXcpFH/XUATb0Vmzc6k1/OvHgzYGtw0SLo8K4jdIQIliw?=
 =?us-ascii?Q?Wz8gZEOY2W9ALnDJbjvgJpq1SAUJAQuiWSkTBGPRYa6jGvRhxh7sXjeRIncD?=
 =?us-ascii?Q?JGj3UQ4H2vfL7BPonM+GpZ0/7ZEimCwypE53vmnLT5djzc8Fu2h1gKL+//sY?=
 =?us-ascii?Q?3iqxzLG9t0bDybBv1Y0cpn1B5K2hX5s590CDQQZQk5ow0MeA6c1Lz4DL7Rps?=
 =?us-ascii?Q?p2V/nP+sIW5PNJCNBK6+CP7OLCXA+cTGdoKc4qVCBRyfQcnmOIEwGJXaAz7Y?=
 =?us-ascii?Q?I1rBDOnmYgFqKl6kV/4a85pzNwgQwKSHXbG6n93qtc8BP1qdC6Fo/h9bbutq?=
 =?us-ascii?Q?dCqiFYurpg+UN05DzkqZwaMeCqmv9uOQ48Ag4wF8P7rfd5jhn+xwhex4Vjtd?=
 =?us-ascii?Q?2mUldpQXMm8cfxL+EXe5o0A8Lfmk+Ha3xFP205St7h9U0vEmUKLVthfc+Dym?=
 =?us-ascii?Q?3beJF/Z85Pjr+T1WfydwOQ5KYKN8IbqwlI3vkO0U3x0OIlpZXPsAie25kpIz?=
 =?us-ascii?Q?ADl0ems/7fsK4SWiWZ9m+eTTda8rgUpdl8m/sjJkjEzoTsRJDKV/Eh4Ary+7?=
 =?us-ascii?Q?5wzIaw7NuLXpIWOC8bKiKL6q0SbhVsDuOh5OXd59fs1MkZ1EfpMZbacEE/pL?=
 =?us-ascii?Q?+cT7NSO9jnBh7Fe/IIGQkRy5OZfcb0/ZlXrtYtmYF2+6hgFDeez15us4g5SL?=
 =?us-ascii?Q?2Ne8XD0ShcMisXVz/0obRAkOP/KOKADn9d4ESARWWThq0Q+0Xu2hYCd9D1Bc?=
 =?us-ascii?Q?YgT766t2L4KVPYzOoBkjzIU8vTSAI+NRbyPSFogi8VLAajsETWTUhPXOZcZ1?=
 =?us-ascii?Q?NigBDZbkEGwubdggviacxz5cJf4yC3ytIEP14MNWUZMqT0zFH6tlPQSXwY6/?=
 =?us-ascii?Q?hAeO1Gp1fJrfTx+TozpJlEOSklyzFip4zV1qBotKCeO0qmRCu1sa0x0WEuVu?=
 =?us-ascii?Q?mHo+2HWkqmKxdMgV6Hn7RTonHcwZFPlh/rS4p+D9vEWMFidinSBcG4TqxP79?=
 =?us-ascii?Q?YihLsCeRz2/15JQYlL27bBBjz424uZ61IpsdvGr0+BukErhrrl0W0DthDUyL?=
 =?us-ascii?Q?TIQ7hcrge7b+C3nu/ksN52sxDldo5ZTFKW3EwcpIifMLazoihiXJkhMUzpwY?=
 =?us-ascii?Q?AngUaHajmvOXBw0XrAJnS9cboLFiJp3uasqPB6GOpvdbTua/gkYShxjpPWhs?=
 =?us-ascii?Q?spJ/novUUyYKNudkP4VKS0YGcOGwSVZXEA+s66Ll5M+tikbtf94bg2bBbDQF?=
 =?us-ascii?Q?vwPdhCK9ZRGnukvuN8KwjFDP/AgsT86hDBu+v3yBC90EO7yL2fM+sO0ILJlv?=
 =?us-ascii?Q?5b0erY0DsoTx+p5j+2ZfWinb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d044f89-4f33-4572-ed4f-08d9250f4508
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2021 15:09:36.4824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyoXkB1KBNGG0My5qvSBMcsgfcVOn1yk0AMw5+xRv/74imcq8KuQPaP6EH0XfjbruKpacoZv9ehU7EleWlQyNE88Jgk9nEPxhkItlEjOTRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4816
X-Proofpoint-ORIG-GUID: 1tat2-McOGwWoKwGDqPJWq2posOSwVdu
X-Proofpoint-GUID: 1tat2-McOGwWoKwGDqPJWq2posOSwVdu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-01_07:2021-06-01,2021-06-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxlogscore=749 mlxscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106010102
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport and modify the patch for CVE-2021-22876 from curl 7.76 to
make it apply cleanly on 7.75.

CVE: CVE-2021-22876

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...redentials-from-the-auto-referer-hea.patch | 152 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.75.0.bb      |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch

diff --git a/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
new file mode 100644
index 0000000000..6c4f6f2f48
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
@@ -0,0 +1,152 @@
+From 21f6cf63939111d8d76d3a4c07f2cd2fe6cb78f8 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 1 Jun 2021 09:59:20 -0400
+Subject: [PATCH 2/2] transfer: strip credentials from the auto-referer header
+ field
+
+Added test 2081 to verify.
+
+CVE-2021-22876
+
+Bug: https://curl.se/docs/CVE-2021-22876.html
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ lib/transfer.c          | 25 ++++++++++++++--
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test2081     | 66 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 90 insertions(+), 3 deletions(-)
+ create mode 100644 tests/data/test2081
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 2f29b29d8..c641a1d47 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -1565,6 +1565,9 @@ CURLcode Curl_follow(struct Curl_easy *data,
+       data->set.followlocation++; /* count location-followers */
+ 
+       if(data->set.http_auto_referer) {
++        CURLU *u;
++        char *referer;
++
+         /* We are asked to automatically set the previous URL as the referer
+            when we get the next URL. We pick the ->url field, which may or may
+            not be 100% correct */
+@@ -1574,9 +1577,27 @@ CURLcode Curl_follow(struct Curl_easy *data,
+           data->change.referer_alloc = FALSE;
+         }
+ 
+-        data->change.referer = strdup(data->change.url);
+-        if(!data->change.referer)
++        /* Make a copy of the URL without crenditals and fragment */
++        u = curl_url();
++        if(!u)
++          return CURLE_OUT_OF_MEMORY;
++
++        uc = curl_url_set(u, CURLUPART_URL, data->change.url, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_FRAGMENT, NULL, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_USER, NULL, 0);
++        if(!uc)
++          uc = curl_url_set(u, CURLUPART_PASSWORD, NULL, 0);
++        if(!uc)
++          uc = curl_url_get(u, CURLUPART_URL, &referer, 0);
++
++        curl_url_cleanup(u);
++
++        if(uc || referer == NULL)
+           return CURLE_OUT_OF_MEMORY;
++
++        data->change.referer = referer;
+         data->change.referer_alloc = TRUE; /* yes, free this later */
+       }
+     }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 5ebf049b8..e08cfc7ee 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -223,7 +223,7 @@ test2064 test2065 test2066 test2067 test2068 test2069 \
+ test2064 test2065 test2066 test2067 test2068 test2069 test2070 \
+          test2071 test2072 test2073 test2074 test2075 test2076 test2077 \
+ test2078 \
+-test2080 \
++test2080 test2081\
+ test2100 \
+ \
+ test3000 test3001 test3002 test3003 test3004 test3005 test3006 test3007 \
+diff --git a/tests/data/test2081 b/tests/data/test2081
+new file mode 100644
+index 000000000..7e74f5766
+--- /dev/null
++++ b/tests/data/test2081
+@@ -0,0 +1,66 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++referer
++followlocation
++--write-out
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 301 This is a weirdo text message swsclose
++Location: data/%TESTNUMBER0002.txt?coolsite=yes
++Content-Length: 62
++Connection: close
++
++This server reply is for testing a simple Location: following
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++ <name>
++Automatic referrer credential and anchor stripping check
++ </name>
++ <command>
++http://user:pass@%HOSTIP:%HTTPPORT/we/want/our/%TESTNUMBER#anchor --location --referer ';auto' --write-out '%{referer}\n'
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<errorcode>
++52
++</errorcode>
++<protocol>
++GET /we/want/our/%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic dXNlcjpwYXNz
++User-Agent: curl/%VERSION
++Accept: */*
++
++GET /we/want/our/data/%TESTNUMBER0002.txt?coolsite=yes HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++Authorization: Basic dXNlcjpwYXNz
++User-Agent: curl/%VERSION
++Accept: */*
++Referer: http://%HOSTIP:%HTTPPORT/we/want/our/%TESTNUMBER
++
++</protocol>
++<stdout>
++HTTP/1.1 301 This is a weirdo text message swsclose
++Location: data/%TESTNUMBER0002.txt?coolsite=yes
++Content-Length: 62
++Connection: close
++
++http://%HOSTIP:%HTTPPORT/we/want/our/%TESTNUMBER
++</stdout>
++</verify>
++</testcase>
+-- 
+2.31.1
+
diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.75.0.bb
index 428b8cd9e3..7c7b363ae3 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.75.0.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch \
+           file://0002-transfer-strip-credentials-from-the-auto-referer-hea.patch \
 "
 
 SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
-- 
2.31.1

