Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F73FD3B7F3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:41:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4973.1765276886804686052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sLcnKVwc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438aff1f5=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9ARQ6L2368380
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 10:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lbHakWQSJ0cqNhCQzm4pj/UU9K7tiXKNvA3wDadvhp4=; b=sLcnKVwcZ+WV
	PXxHs/8Y8m0W9J7I0pJD7xqzDIWrPNHTWNied90gHhy/htJIG7gwhS+p/BXlZpun
	cyFKQmtt55O4OaH5sHNIQcValgMPQUMZh9C6sUj7MDIdmCcOLxCvZGVXjL613L6l
	GAUFQRsBgQzAjfMwiWWNpFUyE+Mbjvh0gAfMQ9ASRW5YfiigXRrbDi29mz+VU72C
	j5NbFsrOV2SXsjZ/4TQSYBwu582pDZFNOtGnZlCSldgRwUVrGPdtfiDtV6uBgYuX
	l6f0HbwBNkxC3Q3togPYmTj5gvq2Y2+fASMLV8HB0yWyQPJ52KpsJ5NtwEguxOS/
	ykf/EOLBFw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742vby-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:41:25 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 9 Dec 2025 02:41:24 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 9 Dec 2025 02:41:23 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2 2/2] go.bbclass: set buildid to empty string to improve reproducibility
Date: Tue, 9 Dec 2025 18:41:22 +0800
Message-ID: <20251209104122.369943-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209104122.369943-1-changqing.li@windriver.com>
References: <20251209104122.369943-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: u7hHtsW8vXLDsR9VUGPq6CRW4I2Poyj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA3NCBTYWx0ZWRfX4RDei+cCgSdp
 uZF7S9qTPJ5iihEivU+F8jOgmg+y76yQdWaWCd+A12w/JGJP3U5eOLeGVAf/lTC90EbIIt6wmpi
 1mWsnPhitqZfuHdGlfLLdIrk056t76boRJ0WOt9L5/F6ktHEhYpqrkF0AewShNYbxIc4z57yIvv
 ELxmOfx1Gm99Phk3UjFrhf8qsyEBtCSuL7sb3lu6B7ZVJNva0dP3alnJagzWo6iuqdjTDhy0JnW
 LW3QMyQSy4lkf5GJqpGB2UdAKkvLi2KU2WXAXApUOtgEvHIEY90CLeRI8QoYEkcKaNqtqd7gEYF
 ewYB+NB0rHdCvniUWZwY+adCGBrhMLpATSkiL1NfKxhltG3eK5Oeh/eWI76ykz0axAG3B+LeYMg
 XKZlGfsTBRbFOrkhuB8d1q2WYM1ZsA==
X-Proofpoint-ORIG-GUID: u7hHtsW8vXLDsR9VUGPq6CRW4I2Poyj1
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=6937fcd5 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=R1OzaoAnAblAilSmCX4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227424

From: Changqing Li <changqing.li@windriver.com>

Seems there are other things making Go BuildID not reproducible, set
buildid to empty string to improve reproducibility, open a new issue
[1], and refer an old issue [2].

Refer:
[1] https://github.com/golang/go/issues/76743
[2] https://github.com/golang/go/issues/34186

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index c323d4c9c9..3f2bd4d04a 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -50,11 +50,12 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
 GO_RPATH_LINK:class-native = "${@'-Wl,-rpath-link=${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE}_dynlink' if d.getVar('GO_DYNLINK') else ''}"
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${GO_RPATH_LINK} ${LDFLAGS}"
 GO_LINKMODE ?= ""
+GO_BUILDID ?= "-buildid="
 GO_EXTRA_LDFLAGS ?= ""
 GO_LINUXLOADER ?= "-I ${@get_linuxloader(d)}"
 # Use system loader. If uninative is used, the uninative loader will be patched automatically
 GO_LINUXLOADER:class-native = ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_LINUXLOADER} ${GO_EXTRA_LDFLAGS} ${GO_BUILDID} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.34.1


