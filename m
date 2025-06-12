Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA8FC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 06:43:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6652.1749710620690720868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 23:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8258799e8c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C5QPe0025058
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 23:43:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm50fe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 23:43:40 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 11 Jun 2025 23:43:37 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] curl: upgrade 8.12.1 -> 8.14.1
Date: Thu, 12 Jun 2025 12:13:17 +0530
Message-ID: <20250612064317.3489718-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 2mMa3CVPITILOvl7T4HcCyJSjLD_9gu_
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=684a771c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=a_U1oVfrAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=EE4uNjuX2kGsox9ohfcA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA1MCBTYWx0ZWRfXw8Ses1aDKg4F sy8mv8YQ8l2Ur5AXJIxnO2ZU1qgzkKwgplqpYKIf4Y3Szuk+944KjwHQPUmRUmfexk5rQBX+Hbu uJFiD65YRzc4fdH22DYXILcNs7s+/xi7LcKGEle0C6GseEwajrRW/QKOPmxIb1U3Q9dDayef1pc
 rVBxikOmEY6JVisHWY9sVhxq5qCRUW9np9qGBRcJgDpZPewQLbjhXI7SQUvIutSkckKBt64SxIA Uy3dwgkgsXSf8TeoheVk6Uzk1+82YnTbYb82ySgypVhLTh2kkAcdIYR/gAGzHxhv1GHio6ojWUt 30vJ1mPtw3xgbXl7qT5hhRznbMpLKtWgW9SaMLrJMMrmq4ZGSfK4l1dMziCvDIwHvHF0IS4Ji+i
 CyP+3H9khkToM9+1Je3urYi+ArJQFnFnHWw9WdySf+mJbYDps+twDOc+D5CxmbzutZ994XDj
X-Proofpoint-ORIG-GUID: 2mMa3CVPITILOvl7T4HcCyJSjLD_9gu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 06:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218483

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-4947 and CVE-2025-5025.

CVE-2025-5399 fixed in 8.14.1 was introduced only in 8.13.0, so Yocto
never had version vulnerable to it.

Rebase patches.

Add openssl-native dependency fo ptest to fix following error:

    Missing or broken 'openssl' tool. openssl 1.0.2+ is required.
    Without it, this script cannot generate the necessary certificates
    the curl test suite needs for all its TLS related tests. at
    ../../../curl-8.14.0/tests/certs/genserv.pl line 33.

Install curlinfo for tests required since 8.14.0
https://github.com/curl/curl/commit/7a1211d474afd4e36bfb39f2b870a418bce42138

(From OE-Core rev: d990ee6c49e3fcf969e54688397d47f0d0892ba1)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-support/curl/curl/no-test-timeout.patch       | 2 +-
 .../curl/{curl_8.12.1.bb => curl_8.14.1.bb}                | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-support/curl/{curl_8.12.1.bb => curl_8.14.1.bb} (95%)

diff --git a/meta/recipes-support/curl/curl/no-test-timeout.patch b/meta/recipes-support/curl/curl/no-test-timeout.patch
index 677d177302..5b901a6fe9 100644
--- a/meta/recipes-support/curl/curl/no-test-timeout.patch
+++ b/meta/recipes-support/curl/curl/no-test-timeout.patch
@@ -14,7 +14,7 @@ diff --git a/tests/servers.pm b/tests/servers.pm
 index d4472d5..9999938 100644
 --- a/tests/servers.pm
 +++ b/tests/servers.pm
-@@ -123,7 +123,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
+@@ -124,7 +124,7 @@ my $sshdverstr;  # for socks server, ssh daemon version string
  my $sshderror;   # for socks server, ssh daemon version error
  my %doesntrun;    # servers that don't work, identified by pidfile
  my %PORT = (nolisten => 47); # port we use for a local non-listening service
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.14.1.bb
similarity index 95%
rename from meta/recipes-support/curl/curl_8.12.1.bb
rename to meta/recipes-support/curl/curl_8.14.1.bb
index 4192693da8..08ad9cdb17 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.14.1.bb
@@ -20,7 +20,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-curl.sh \
 "
 
-SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
+SRC_URI[sha256sum] = "f4619a1e2474c4bbfedc88a7c2191209c8334b48fa1f4e53fd584cc12e9120dd"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
@@ -126,12 +126,17 @@ do_install_ptest() {
 		${B}/libtool --mode=install install ${B}/tests/server/$name ${D}${PTEST_PATH}/tests/server
 	done
 
+	install -d ${D}${PTEST_PATH}/src
+	install -m 755 ${B}/src/curlinfo ${D}${PTEST_PATH}/src
+
 	cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
 
 	# More tests that we disable for automated QA as they're not reliable
 	cat ${UNPACKDIR}/disable-tests >>${D}${PTEST_PATH}/tests/data/DISABLED
 }
 
+DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' openssl-native', '', d)}"
+
 RDEPENDS:${PN}-ptest += " \
 	locale-base-en-us \
 	perl-module-b \
-- 
2.40.0


