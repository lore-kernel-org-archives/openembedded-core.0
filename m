Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37542CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 11:31:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11527.1727177457057570929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 04:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=999746e38d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48O5A319003750
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:30:56 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um6hgg6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:30:56 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 04:30:53 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] ruby: upgrade 3.3.4 -> 3.3.5
Date: Tue, 24 Sep 2024 11:30:31 +0000
Message-ID: <20240924113031.2229409-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 3nloNYs69Pj4Vwg5leFF7kdVmhN-Cn5F
X-Authority-Analysis: v=2.4 cv=bas5U/PB c=1 sm=1 tr=0 ts=66f2a2f0 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=EaEq8P2WXUwA:10 a=t7CeM3EgAAAA:8 a=hTYxuiHq812G3__dMOUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3nloNYs69Pj4Vwg5leFF7kdVmhN-Cn5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409240081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 11:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204846

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-41123 & CVE-2024-41946

Changelog
=========
d3ab7be8ca merge revision(s) 657f4b99f61: [Backport #20667]
c69d59e9b2 Sync tool/lib/core_assertions.rb from master
cf9a6c2b63 merge revision(s) a3562c2a0abf1c2bdd1d50377b4f929580782594: [Backport #20701]
d83b5633b1 merge revision(s) 992596fb7af18a7f472589a607d0eb3fbb03b49a: [Backport #20344]
b210c86a02 merge revision(s) 97449338d6cb42d9dd7c9ca61550616e7e6b6ef6: [Backport #20649]
6a4e79533b merge revision(s) 1870505f478cc75993b296b7144a45137ace6937: [Backport #20651]
e0e23e7d5e merge revision(s) 29500e30346: [Backport #20667]
7b954e7bc6 Allow failures in Travis ppc64le and s390x
937964f346 Merge URI-0.13.1 for Ruby 3.3 (#11466)
ac8d50e52e [Backport 3.3] [Bug #20691] Fix use-after-free in WeakKeyMap#clear (#11443)
8657de70aa [Backport 3.3] [Bug #20688] Fix use-after-free for WeakMap and WeakKeyMap (#11439)
9ae91eb2aa Backport warning feature for bundled gems from master (#11420)
66312ad913 Re-initialize vm->ractor.sched.lock after fork (#11372)
4d11a0960d Added bootstrap job for release workflow
65cca99b30 parse.y: const_decl_path don't replace destination node by a literal (#11314)
f85c7deacc Update RubyGems 3.5.16 and Bundler 2.5.16 for Ruby 3.3 (#11252)
0922afa95b [Bug #20654] Fix floor and ceil when ndigits is large (#11277)
ce565cd4b8 [Bug #20653] Fix memory leak in String#start_with? when regexp times out (#11255)
6d744837ab [Bug #20088] Fix ARCH_FLAG for cross compiling
7571ad42f4 [Bug #20650] Fix memory leak in Regexp capture group when timeout (#11244)
4667f8ec10 bundled_gems.rb: Add a fast path (#11221)
425e468d25 [Backport #20633] Fix the condition for `atomic_signal_fence` (#11166)
3427a1679a retry on cancelling of `getaddrinfo` (#11131)

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/ruby/{ruby_3.3.4.bb => ruby_3.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_3.3.4.bb => ruby_3.3.5.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_3.3.4.bb b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_3.3.4.bb
rename to meta/recipes-devtools/ruby/ruby_3.3.5.bb
index ebff4136c9..7b531e2b10 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.5.bb
@@ -47,7 +47,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "fe6a30f97d54e029768f2ddf4923699c416cdbc3a6e96db3e2d5716c7db96a34"
+SRC_URI[sha256sum] = "3781a3504222c2f26cb4b9eb9c1a12dbf4944d366ce24a9ff8cf99ecbce75196"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.40.0


