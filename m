Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD541C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:57:55 +0000 (UTC)
Received: from mx0a-00300601.pphosted.com (mx0a-00300601.pphosted.com [148.163.146.64])
 by mx.groups.io with SMTP id smtpd.web10.17776.1747328266298183653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=Fq/Dfql0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.146.64, mailfrom: prvs=4230c9aaef=rajendra.desai@emerson.com)
Received: from pps.filterd (m0142705.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGkokX037458
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=email; bh=Gvio
	qPi+R/dR5h4hoc3DaFZGrBjWP1CK5ToHZ8hXvbw=; b=Fq/Dfql0f1aFWgmR/7mK
	NqcJ/qdjYJi6M4iSY0srjKWe+9O34B2Xvh+K4Xd67Us4dPuDuZjlfDxShRy8ftFO
	kXJhFK68Vy7vdjfRDkDefXEGWkRUQfr7iwAPOR+iDEM60a+Non7BWmY5AdNeT1/5
	IkFNy25FRugpNvBYt6gLRWf3w/d1wlSEG6WJyioJ+t8obPwxzxXUoPpl5pSkpdA0
	8O6V18l+XzRteZQ1gArDFhQ8mazDpEg+nzKBe+pSOo4frmGn+AJtQodSHEkf8WO8
	2BjWJH0VNMVGB56xJtVG4m0EAZYJHpB3ditlSrDbPvKIZ5OYxYHBp+WUiw132c/P
	xA==
Received: from us-aus-excas-p1.ni.corp.natinst.com ([130.164.94.73])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46nm3406q8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:45 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 15 May 2025 11:57:43 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 15 May 2025 11:57:42
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH 2/5] perl-ptest: include libxcrypt-dev as recommended
Date: Thu, 15 May 2025 22:20:06 +0530
Message-ID: <20250515165010.242349-3-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515165010.242349-1-rajendra.desai@emerson.com>
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _hZvtw2TmQzWmiPkEwMj3YzG4_T6-g7G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2OSBTYWx0ZWRfX+e2D2c51JW8w xvgS+ReNE2zKN9Sv4Zl4uyVIItNhsBccuIPc3+42+st061L/maWdvKBZuNMJovoO+ZDYzUMxXPT 2TxMcvAKaZNvTcCKDFZukV9GqepuP9KP2XtZDczQRIj3AZIVdEo4QbeYFpaVyLAYEYGLnInPV/y
 u+O5RKFftSU0InW5SKh9mOp/D5rgURi8WfFtdUKd2dfLRRh9IZfyZCt7QouPICJRlr80Et9XHVa LWr9wRdPgJOV2d+PDCjpHzyec97xrm2UEoqrqieKzusVCi/9gcPeGX/ByrdpVq0KyXpb66NlZnJ uATlU9WGHXudJbS5rrqC8Pjl1XioaHmwjYKKOa8tv5418JjrSmYsIkP2G2p0AKbPEyUPJVQRJD6
 SAiIDQhQqCKcf6JeCcmEvlORDfvoW9pDVVd7OJbQsc5nH9rRu5TUdZCYFmD3C1u6LpNWe0Z2
X-Authority-Analysis: v=2.4 cv=H/rbw/Yi c=1 sm=1 tr=0 ts=68261d09 cx=c_pps a=cVKeW2pxJVqlUTLH3Z+MUA==:117 a=cVKeW2pxJVqlUTLH3Z+MUA==:17 a=dt9VzEwgFbYA:10 a=geDs06hvAAAA:8 a=oLMx_og6YXf7H0T5OWQA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-ORIG-GUID: _hZvtw2TmQzWmiPkEwMj3YzG4_T6-g7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 mlxlogscore=947 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216695

The following perl ptests:

dist/ExtUtils-ParseXS/t/001-basic
dist/ExtUtils-ParseXS/t/002-more
dist/ExtUtils-ParseXS/t/003-usage
cpan/ExtUtils-Constant/t/Constant
cpan/ExtUtils-MakeMaker/t/02-xsdynamic

are erroring out with:
In file included from /usr/lib/perl/ptest/op.h:700,
                 from /usr/lib/perl/ptest/perl.h:4553,
                 from XSUsage.xs:2:
/usr/lib/perl/ptest/reentr.h:126:16: fatal error: crypt.h: No such file or directory
 126 | #	include <crypt.h>
     |			^~~~~~~~~
compilation terminated.
error building XSUsage.o from 'XSUsage.c' at /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Base.pm line 185.

This is because the tests require crypt.h file which is provided
by the libxcrypt-dev package. Hence, adding the package under
RRECOMMENDS to make sure the tests are able to find the required
header file and not fail with the above error.

Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 817ad401f4..3eab5e25e9 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -60,7 +60,7 @@ python populate_packages:prepend() {
 }
 
 RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps"
-RRECOMMENDS:${PN}-ptest += "gcc"
+RRECOMMENDS:${PN}-ptest += "gcc libxcrypt-dev"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
-- 
2.34.1


