Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE22CC3DA6D
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:58:05 +0000 (UTC)
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com [148.163.146.64])
 by mx.groups.io with SMTP id smtpd.web10.17777.1747328276277975759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=CH3pnxq2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.146.64, mailfrom: prvs=4230c9aaef=rajendra.desai@emerson.com)
Received: from pps.filterd (m0142705.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGkq6i037654
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=email; bh=LW7V
	pnRhdQfndmDHEqUej2oGp1epVMHvqibObybzoj8=; b=CH3pnxq2sOmYjrW/dOLh
	J3Fm8+wHa3tZfKhrjP2qHyJTtzMZ3O/KbdmNoJ9zcOq1BdswzAo0LhUc6jajZtR1
	Z2+y5dy43aosSFCtXQulxwNitu3DQscSJfLDzUdbVCbOEUwsM0bJ59vFfF6ci1s2
	TnZknGyjmyhSdkHKKFJI7gGq0y5asR6aOdkWNDUSFeR+2XRHqDb9NEr+p1/p9czE
	+0I8V+Rq5yn2LkHBK9TPiXEiPSHJEIhM7xcuKjksv0NtqUVnqqzylIt/gcGU2Quq
	VZxp8fvDylan9p9gTYttKLr3vAIHka0WIh5ZossGAC1ZCfd5cuvej+DEp+VNqe8W
	yA==
Received: from us-aus-excas-p2.ni.corp.natinst.com ([130.164.94.74])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46nm3406tm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:55 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 15 May 2025 11:57:53 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 15 May 2025 11:57:52
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH 4/5] perl-ptest: include make as a recommended package
Date: Thu, 15 May 2025 22:20:08 +0530
Message-ID: <20250515165010.242349-5-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515165010.242349-1-rajendra.desai@emerson.com>
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HnA1QI9yqYeZWkjMmi2Ryg6YYpu6PE6S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2OSBTYWx0ZWRfX//LrXL1ZA5E9 PuKOhRVlFOnduHqJlcCmbBuIDlTGADLHXzPUPapG0bb90V0EDPQDPA7uu3vxxCobNjUUryPW8Rm 7Z8AOlvD4LvvrvCreiBbaBewKJNE2fkvqlZt6/vnOeuWupj2fJ2Jj2XBmVUzLRsRsRtZFOLvo8M
 a28GQMsEj+KqmyDzeNbGIGqE7q1oUAJ3EuCzlnL6yAmHNkd8Ejs1mro4hkMqDcfLAntthfK3GXT ugmzkru4dJiQx7DbbU64waeOFMQBNqyVpBxiZUjmEJioOd8OhO2Sp6PYw0QDgVhp2IRShm9evo/ ED3g5bd+diHFz2xdwouJgGqEqvrA5sUpc4xOMI7dQ09jsFrzG4eSveoTK9BiPIMKHjBfq2i7YBV
 hgRDlTq/YWj91W/4iDf3FP7ApoyMG2e7DwNCcQOmqxwTcMN3NBIiWE1031itSH3VK960nv5A
X-Authority-Analysis: v=2.4 cv=H/rbw/Yi c=1 sm=1 tr=0 ts=68261d13 cx=c_pps a=VUOoxcgKHUMpfFMIT0tLvw==:117 a=VUOoxcgKHUMpfFMIT0tLvw==:17 a=dt9VzEwgFbYA:10 a=geDs06hvAAAA:8 a=oLMx_og6YXf7H0T5OWQA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-ORIG-GUID: HnA1QI9yqYeZWkjMmi2Ryg6YYpu6PE6S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 mlxlogscore=901 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216696

The following perl ptest:

cpan/ExtUtils-MakeMaker/t/02-xsdynamic

is failing with below error:
 Failed test '"make" exited normally'
 at lib/MakeMaker/Test/Setup/XS.pm line 448.
	got: '32512'
   expected: '0'
sh: make: not found

This is mainly due to a missing make dependency which is needed by
the above test. Hence, adding the package under RRECOMMENDS.

Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index e14f0d0403..df6db7def9 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -60,7 +60,7 @@ python populate_packages:prepend() {
 }
 
 RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps"
-RRECOMMENDS:${PN}-ptest += "gcc libxcrypt-dev g++"
+RRECOMMENDS:${PN}-ptest += "gcc libxcrypt-dev g++ make"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
-- 
2.34.1


