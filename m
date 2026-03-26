Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBD9106F31D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:22:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44849.1774520514697333483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YS1LE385;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7545a6f598=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q5Pv50298206
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7jsLdEDGx9o9Ds1m+WML
	Fa2wsgee1P7qjHwFJGTQIRA=; b=YS1LE385E6AeZ3tn3uOASx2augyBbg7CxPEq
	9cwFA6sdqhc7d77f7QiMrp0lzYAqXqgO5wQsJQPr1hoNc3jKCDAA9PUAtOi/51jw
	Pv9FSD4sluhQI0VtKmAH5S0CYiwD9RjobncC1L+eoNkozLmT965fhPI7XlLkw2HA
	pDO+fjYKccu1PXlu0PFPEKuiSCL2TJs4Q3VDFfqeh6bfFdQ3Z7LEVlO3YgnTYkjH
	FXs8ett4hrNDrLAT0rnvbsRiY1U/ZyuayhfigJtbg0Qx7jZOk2L86MbXVbquNg3a
	d+zlnZJSMkp7FbHzVjLYM6UwnR//lnsmfPS6QFTKKbw3h5EaVQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6xaua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:21:53 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 26 Mar 2026 03:21:52 -0700
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 26 Mar 2026 03:21:51 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <kai.kang@windriver.com>
Subject: [RR][LTS25][0/2] gtkmm3/gtkmm4: not set BPN [LIN1025-8580]
Date: Thu, 26 Mar 2026 18:21:48 +0800
Message-ID: <20260326102150.1059814-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3MSBTYWx0ZWRfX9oNv/zWx7eXM
 W/0eSnga45HcLq9ZYXqkdq9XohcjqyW9dwKNlr5Tmmn0mVNGaaCebDq2RyyLoujVfzCia8UrG//
 WIW/0bOtJCFgUvnRKHutl94i+fqR0hUoNekSuW9nYOI20lOMvgdzLm9pbUYWOsv3FdJhFGZiVJU
 WII01rrRF3IgAFVMltkK4gAWG5TrI9h/Ggml0GoS7Ad2sq2RYjdFf9dd8uAnJgkCsUKV71fFZYp
 qWQlaTjwmNxRBV1mwGD01mVFDOd8GUlKSwxgDrZHcf9JuQeviiHqJG/jHks4cPQJ6eH6NWrYQfW
 YfRUiF2ok1SLh5OQd3tdaXnF/W7zld8HV6u1BzBbGlTb/Ht5nFxFBCMxJQwSmWtUOzBt3UdAaOR
 kk/XR7gVDcLHGNX3e/9WkxOyRVZkEyIcSJS3iNOyHexOrZ1+9/8NrjgW8uQEQSzVKl47GLm86ip
 GSLGjESAO2UGInEgqtw==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c508c1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=bLZqKDXHAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=CxU6fe72ZU_ufL9K5cgA:9 a=SM0NOtVXJcAQk9PFKD3C:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mG2NwphaWUyhya3K0qnnD3BwCTR5T-zH
X-Proofpoint-GUID: mG2NwphaWUyhya3K0qnnD3BwCTR5T-zH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233964

From: liezhi.yang@windriver.com Mon Sep 17 00:00:00 2001

Summary: gtkmm3/gtkmm4: not set BPN
Tech Review: Kai
Gatekeeper: Hongxu
Lockdown Approval (if needed): 
Branch Tag: WRLINUX_10_25_LTS

====== Sanity Issues: (DO NOT EDIT this section) ======



====== Impacted area             Impact y/n ======
docs/tech-pubs                      n
tests                               n
build system                        n
host dependencies                   n
RPM/packaging                       n
toolchain                           n
kernel code                         n
user code                           n
configuration files                 n
target configuration                n
Applicable to Yocto/upstream        n
New Kernel Warnings                 n
Other                               n


====== Comments (indicate scope for each "y" above) ======
* Conditions of submission

* Documentation Changes/Release Notes
  = Doc changes

  = Release notes

* Git logs
[meta-openembedded]
commit e8ab7f1c4dd8358c5aec784b28afc6b5b6c8580d
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Fri Mar 20 14:59:08 2026 +0800

    gtkmm3/gtkmm4: Set S to fix patch failure after BPN -> GNOMEBN change
    
    Issue: LIN1025-8580
    
    Commit 8e038dee175eeaaa4bb0835b935ef7a2a72fa7e0 replaced BPN with GNOMEBN, with
    to avoid the confusing BPN override. However, this change makes the default
    doesn't work, this patch fixes teh problem.
    
    (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance,
                                 master branch doesn't need it
    
    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

commit 8e038dee175eeaaa4bb0835b935ef7a2a72fa7e0
Author: Kai Kang <kai.kang@windriver.com>
Date:   Wed Jan 21 14:46:14 2026 +0800

    gtkmm3/gtkmm4: not set BPN
    
    Issue: LIN1025-8580
    
    Set BPN in gtkmm3 and gtkmm4 recipes is to inherit gnomebase.bbclass
    properly. But it uses variable GNOMEBN rather than BPN for SRC_URI and
    S in gnomebase.bbclass now, update in the recipes accordingly.
    
    (master rev: 96a6c18a8cc6551a1aa6acc9644177b4218cb3fb)
    
    Signed-off-by: Kai Kang <kai.kang@windriver.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>
    Signed-off-by: Robert Yang <liezhi.yang@windriver.com>



====== Testing ======
* Commands
$ bitbake gktmm3 gtkmm4 lib32-gtkmm3 lib32-gtkmm4 -cpatch

* Expected Results
Works well

* Applicable to

* Tested configurations

  Arch    built      boot     boardname
  -------------------------------------
  ARM32     n         n
  ARM64     n         n
  MIPS      n         n
  MIPS64    n         n
  MIPS64n32 n         n
  PPC       n         n
  PPC64     n         n
  RISCV64   n         n
  x86       n         n
  x86_64    n         n


====== Reviewer Checklist ======
[Submitters: make sure that your review doesn't trigger any checkmarks!]
http://lxgit.wrs.com/cgit/bin.git/tree/etc/review.txt


====== PULLs ======
* PULLs


* WRH-PULLs ("wrh -m" can merge it):


