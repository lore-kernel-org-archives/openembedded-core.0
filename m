Return-Path: <saravanan.kadambathursubramaniyam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1C9CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:14:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9799.1760624055698557056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:14:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BxwT0Lwf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23844c9b6c=saravanan.kadambathursubramaniyam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G5hXTP3924565
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:14:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=79Rq4+ScOFa9hubDi51m
	PL9hnrQuH30FQ2P83jTQU7U=; b=BxwT0Lwfw4BVeb/aMduni7T+P68IWB9EBaoM
	nuT9ocmMX2Msq7FVhcRV9Tk5qWStUAxxikvqRRoeF6MyDWFaMOB/BKrx4eFmm16J
	jwW8EFCTTDlxxBSoZkj9X2K+NS3orEYmKoYN16HSxZ5qJOgV+V1u65ENhUcWPW0I
	FfGiHrP9WTJTKv3QILo2ACPyCsIhExpSsIN/MSpNJgd8zqzV0hA5lEjtjGUXERGX
	QFH1VgS82Tpm2aruwm7pab23RfMXpu07FofS2XqqRTAbbluWr9GkbymbTS5X1cp2
	Gi9ptQcpYLzlzrnedsUnUEcEBjQm9ddZdqYLhddbW29g8TU+6A==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qjh1p5cq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 07:14:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 16 Oct 2025 07:14:14 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 16 Oct 2025 07:14:13 -0700
From: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][walnascar][PATCH 1/1] cmake: fix CVE-2025-9301
Date: Thu, 16 Oct 2025 19:44:12 +0530
Message-ID: <20251016141412.2267180-1-saravanan.kadambathursubramaniyam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDEwNCBTYWx0ZWRfX9Mx0jm4Dfdy7
 oo7QT8VCzIJVIh3epfoPVPz0Dxv63eEExYqXIu4K2S7hlx/3sJKNgZ4Gfpw2C9wdsTCiwbLkF6B
 jcr+tOuGlIQr5qIf7FbX5nw7a7hX1mGwN5UuolrLL2lEAN/IS7/ZaJziuxIfe70ynSAct1Wdbbn
 OTM2tbl1nMa6wQ0f31WdfnvB1r1WquZQ/VFYWt2My6+sBrVEvqxiDjCq9IMfAzpJ0ZlLRMFtHjJ
 k9zGkl4hFHrwBquD0wwDRWavXbJ0TRRsVSPuQbAroFwtbCvPxIQk2Z5DMmEcKlbjwevxw0kQteo
 BPUd4WBUDPY6DCz3qmgVTQnGJmhmuYHQv35gWy6e/ugMca/zxVfhkEqsTif15BegUtUMhB4UFMZ
 kcZH2MepoVqs4SJ+AwFelAp3YN+2Ug==
X-Proofpoint-GUID: -4u19BkaXy7HUXoBfIrYWURjR8R8Tgg4
X-Proofpoint-ORIG-GUID: -4u19BkaXy7HUXoBfIrYWURjR8R8Tgg4
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=68f0fdb7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=Ud-fGmwBAAAA:8
 a=t7CeM3EgAAAA:8 a=qzKz8tMykHLvCfsI9dIA:9 a=H0_BfbLtyfsadj6IJfz3:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 14:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224967

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-9301
https://gitlab.kitware.com/cmake/cmake/-/issues/27135

Upstream-patch:
https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8

Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
---
 .../cmake/cmake/CVE-2025-9301.patch           | 71 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.31.6.bb   |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch

diff --git a/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
new file mode 100644
index 0000000000..a5bb2b5f92
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/CVE-2025-9301.patch
@@ -0,0 +1,71 @@
+From 37e27f71bc356d880c908040cd0cb68fa2c371b8 Mon Sep 17 00:00:00 2001
+From: Tyler Yankee <tyler.yankee@kitware.com>
+Date: Wed, 13 Aug 2025 15:22:28 -0400
+Subject: [PATCH] foreach: Explicitly skip replay without iterations
+
+As written, foreach loops with a trailing `IN` (i.e., no loop
+variable(s) given) lead to an assertion error. Handle this case by
+exiting early when we know the loop won't execute anything.
+
+Fixes: #27135
+
+CVE: CVE-2025-9301
+
+Upstream-Status: Backport
+https://gitlab.kitware.com/cmake/cmake/-/commit/37e27f71bc356d880c908040cd0cb68fa2c371b8
+
+Signed-off-by: Tyler Yankee <tyler.yankee@kitware.com>
+Signed-off-by: Saravanan <saravanan.kadambathursubramaniyam@windriver.com>
+---
+ Source/cmForEachCommand.cxx                  | 3 +++
+ Tests/RunCMake/foreach/RunCMakeTest.cmake    | 1 +
+ Tests/RunCMake/foreach/TrailingIn-result.txt | 1 +
+ Tests/RunCMake/foreach/TrailingIn.cmake      | 5 +++++
+ 4 files changed, 10 insertions(+)
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn-result.txt
+ create mode 100644 Tests/RunCMake/foreach/TrailingIn.cmake
+
+diff --git a/Source/cmForEachCommand.cxx b/Source/cmForEachCommand.cxx
+index 33dae79f..9b9a60b3 100644
+--- a/Source/cmForEachCommand.cxx
++++ b/Source/cmForEachCommand.cxx
+@@ -101,6 +101,9 @@ bool cmForEachFunctionBlocker::ArgumentsMatch(cmListFileFunction const& lff,
+ bool cmForEachFunctionBlocker::Replay(
+   std::vector<cmListFileFunction> functions, cmExecutionStatus& inStatus)
+ {
++  if (this->Args.size() == this->IterationVarsCount) {
++    return true;
++  }
+   return this->ZipLists ? this->ReplayZipLists(functions, inStatus)
+                         : this->ReplayItems(functions, inStatus);
+ }
+diff --git a/Tests/RunCMake/foreach/RunCMakeTest.cmake b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+index 15ca4770..acfc742e 100644
+--- a/Tests/RunCMake/foreach/RunCMakeTest.cmake
++++ b/Tests/RunCMake/foreach/RunCMakeTest.cmake
+@@ -22,3 +22,4 @@ run_cmake(foreach-RANGE-invalid-test)
+ run_cmake(foreach-RANGE-out-of-range-test)
+ run_cmake(foreach-var-scope-CMP0124-OLD)
+ run_cmake(foreach-var-scope-CMP0124-NEW)
++run_cmake(TrailingIn)
+diff --git a/Tests/RunCMake/foreach/TrailingIn-result.txt b/Tests/RunCMake/foreach/TrailingIn-result.txt
+new file mode 100644
+index 00000000..573541ac
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn-result.txt
+@@ -0,0 +1 @@
++0
+diff --git a/Tests/RunCMake/foreach/TrailingIn.cmake b/Tests/RunCMake/foreach/TrailingIn.cmake
+new file mode 100644
+index 00000000..e2b5b2f2
+--- /dev/null
++++ b/Tests/RunCMake/foreach/TrailingIn.cmake
+@@ -0,0 +1,5 @@
++foreach(v IN)
++endforeach()
++
++foreach(v1 v2 IN)
++endforeach()
+-- 
+2.49.1
+
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
index 2d343d6f52..a71928ea9c 100644
--- a/meta/recipes-devtools/cmake/cmake_3.31.6.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
@@ -11,6 +11,7 @@ SRC_URI:append:class-nativesdk = " \
     file://cmake-setup.py \
     file://environment.d-cmake.sh \
 "
+SRC_URI += "file://CVE-2025-9301.patch"
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \
-- 
2.49.1


