Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83639C83F22
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 14:10:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23284.1752675050812497629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 07:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=929279f93c=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G76PIK2063573
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:10:50 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdsysv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 07:10:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 16 Jul 2025 07:10:49 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 16 Jul 2025 07:10:48 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][master][walnascar][PATCH  1/1] gnutls: upgrade 3.8.9 -> 3.8.10
Date: Wed, 16 Jul 2025 19:40:44 +0530
Message-ID: <20250716141044.1733137-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: IyrINT_SgWFqqQ-1qCO6zizuDbl-51d9
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=6877b2ea cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=_gujzhlsYxkA:10 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8
 a=btUJG6xmG7mrEtYodUsA:9 a=VO3SqhUBEN0A:10 a=r0dl5i_q2XGqDZkti5dn:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IyrINT_SgWFqqQ-1qCO6zizuDbl-51d9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX41atLpZqe7Ch
 ENrz8rj7hhvvAJq18lxxNOAVvDBMBUnfHEPNhw8BPoxCNP8ZMNcksD7sHZKb6ayiV70TZmdoFfb
 6eqS8ik6zKjsLdQqK1utJ8GpfNy8jQmJqKVcvYKRJt8VGuA/9AfitOlSZaKzUGn8ANpAjaxLiiB
 6y5BaM8iWTNdiR/f+FCcO1HUkvrVzDIK99tOOtX1mrEuJTXM44kzOmVqLntaqGoNXlEcIOCVHH+
 W+nOKKpst6ThotudnYOevELQ4++l1C7qKoXpztVhhiEKzYQS8TUuQ+VhNN+1Z+6Fet8M0smbrMk
 nUNdxOw/K+FdC4B81qrbWJ09akCXTfqJY3yG02EhGZqRgt/2jZz/ROgv+EW2YRsx+uxV7PIQROA
 p50l2aOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 14:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220462

From: Archana Polampalli <archana.polampalli@windriver.com>

Changelog:
https://lists.gnupg.org/pipermail/gnutls-help/2025-July/004883.html

Includes security fix for:
CVE-2025-6395
CVE-2025-32989
CVE-2025-32988
CVE-2025-32990

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.8.9.bb => gnutls_3.8.10.bb} (97%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.9.bb b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
similarity index 97%
rename from meta/recipes-support/gnutls/gnutls_3.8.9.bb
rename to meta/recipes-support/gnutls/gnutls_3.8.10.bb
index f2b7ac7bb8..600f23683e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.9.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.10.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://Add-ptest-support.patch \
            "
 
-SRC_URI[sha256sum] = "69e113d802d1670c4d5ac1b99040b1f2d5c7c05daec5003813c049b5184820ed"
+SRC_URI[sha256sum] = "db7fab7cce791e7727ebbef2334301c821d79a550ec55c9ef096b610b03eb6b7"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
 
-- 
2.40.0


