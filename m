Return-Path: <rajendra.desai@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9734C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 16:58:05 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web10.17778.1747328277954649482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emerson.com header.s=email header.b=UfzK3DU0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=4230c9aaef=rajendra.desai@emerson.com)
Received: from pps.filterd (m0144091.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEZJt5021756
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=email; bh=pFnl
	a/Tp+Q3qWB4kml5D91rQwBKUpt7C5noV4sdSGnc=; b=UfzK3DU0dU5AxyXb1m5k
	fx+W981dHZVVHl0GH8p3ykgRxzYfSIY68xFSGkQ1bZey/NUAtUktax5q3NmOkQU+
	SK60BScqRAKGwjcLfuOXfgEtvaHJxNp2pK/V3w8C70fAHY7XZTo8FGNHbuCv8p7J
	etQVSwD4rGV89b1izKi5fxuRRRnVT2Kyo9TlZbF4SnLyamSYxGzYpqXoPPaJV59l
	XX5HzDLyFJ7pMYTpWrXwIpq2OYlK5X9St/CIZimthnaKwsGxId0/0pJaUa0XGsrj
	1Q3T4dCu+bwJcSRchW5GW2VVo5kdfOmn1qfPhyqxjkDJV7nFvtPFgAfiKDcbXCfA
	UQ==
Received: from us-aus-excas-p1.ni.corp.natinst.com ([130.164.94.73])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 46nj5mjqk6-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:57:56 +0000 (GMT)
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 15 May 2025 11:57:48 -0500
Received: from sombRayRo.ni.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.28 via Frontend Transport; Thu, 15 May 2025 11:57:47
 -0500
From: Rajendra Desai <rajendra.desai@emerson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rajendra Desai <rajendra.desai@emerson.com>
Subject: [PATCH 3/5] perl-ptest: include g++ as a recommended package
Date: Thu, 15 May 2025 22:20:07 +0530
Message-ID: <20250515165010.242349-4-rajendra.desai@emerson.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515165010.242349-1-rajendra.desai@emerson.com>
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: U0hw3336SUIPkblkoqdBNx774BmVJwja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2OSBTYWx0ZWRfX++p55OnZ9HyY hwe5Jkx8B/dAPSqjW99xGFpcpBpmRBcIqpriUPvozHYBIkMDRfJASuyy44kS0kA9/hm7mFf3FmT bR29tuFreDmO2Nz6/zYiMTf/dXmX4VOLs7rUOZQWjTSBIl/wOnikcHNky+JlgdXr1RW4VepYUwG
 dQ1K0cYbuKlJK7BVrFiuBUkHS3LHKH2m9VhcRP0VuZYSr9uw1fV7vI6wHva8vtQeCScLv/U3N8y odoyCPX+MIBj/BNv1oqO0BcSqNuOa/wPhAy/ZeYbBY7GkOKr1wExWSp1yDatCdlTi+IsjhbOx37 /cuRyddeg3U4yy9OgGW+Okc1e5G68JrA2LqgvuIGXxDxFnK7HKc7p3HoXE9hwMP+uKspxurZgxj
 VV/RttmsYExVfhklRECIqwIwclIyI53RlzkK2PxOB2G7SclKbvlRoHGn+/A4cXF0rF+L7x2z
X-Authority-Analysis: v=2.4 cv=dKummPZb c=1 sm=1 tr=0 ts=68261d15 cx=c_pps a=cVKeW2pxJVqlUTLH3Z+MUA==:117 a=cVKeW2pxJVqlUTLH3Z+MUA==:17 a=dt9VzEwgFbYA:10 a=geDs06hvAAAA:8 a=e3XReqEdg1xMzR6-cUEA:9 a=7yvi0DHx91fDKfvzWsLo:22
X-Proofpoint-GUID: U0hw3336SUIPkblkoqdBNx774BmVJwja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=878 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 16:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216697

The following perl ptests:

dist/ExtUtils-ParseXS/t/001-basic
dist/ExtUtils-ParseXS/t/002-more
dist/ExtUtils-ParseXS/t/003-usage

are giving out below warning while running on the yocto CI build:
/usr/lib/gcc/x86_64-poky-linux/14.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtbeginS.o: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/14.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/14.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc_s: No such file or directory
collect2: error: ld returned 1 exit status

additionally, 2 of the tests are skipping out:
SKIP: cpan/ExtUtils-Constant/t/Constant
/usr/lib/gcc/x86_64-poky-linux/14.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtbeginS.o: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/14.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc: No such file or directory
/usr/lib/gcc/x86_64-poky-linux/14.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc_s: No such file or directory
collect2: error: ld returned 1 exit status
SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic

This is mainly due to a missing g++ dependency which is needed by
the above tests. Hence, adding the package under RRECOMMENDS to
make sure the tests are able to find the compiler and that the
tests do not skip or output the missing file or directory warning.

Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 3eab5e25e9..e14f0d0403 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -60,7 +60,7 @@ python populate_packages:prepend() {
 }
 
 RDEPENDS:${PN}-ptest += "${PN}-modules ${PN}-doc sed procps-ps"
-RRECOMMENDS:${PN}-ptest += "gcc libxcrypt-dev"
+RRECOMMENDS:${PN}-ptest += "gcc libxcrypt-dev g++"
 
 # The perl-ptest package contains Perl internal modules and generating file
 # dependencies for it causes problems.
-- 
2.34.1


