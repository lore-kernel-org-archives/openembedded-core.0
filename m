Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C3CD148AA
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 06:08:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.804.1767852525627450049
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 22:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OKnhyfce;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54685ebb30=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6085UDNs3892466
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jan 2026 22:08:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=APxIU0uD01rMJrJq7Ufg
	6Y0lQfL+tiUGMmh4cXNimkw=; b=OKnhyfceZ2Od4Pv8k91HLTsMDFJaaV0A6DAy
	coZj6K2HXAIOzmwJ55DtGTRDDyn49VlxtwNpIARm4GToTAxZ6c96fpJpXrYtaFXr
	Gi9hlQkOgGd2Q9U4t7g0lQcwcGus+Be+troaJ2feSCXJhhIqQ54exCnWk5j5GEHT
	d3vEzwJfCEu9aBxJ1mfkRz4Sdc95q1tNqBAkNutpRovz7lIbF0iS9bUZOZui0WaS
	OoS8vReWBXEDlKNRtB6Txs81yRmvw1F5+TYKgsXJXt+AOyryVZVRlZZpgLXa8f5l
	iU/fiTX13EqfW39zG1UnIHdSZcFwgx8XSsuNBvPF2R/DmFbnJg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bey924ueb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 22:08:45 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 7 Jan 2026 22:08:44 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 7 Jan 2026 22:08:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V3] go.bbclass: set buildid to empty string to improve reproducibility
Date: Thu, 8 Jan 2026 14:08:42 +0800
Message-ID: <20260108060842.3340603-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 8eDzqIJU3crFI_L_KzMLSm897daZaSI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzNyBTYWx0ZWRfX1U9h/7k9CIMh
 uiNxrbBAPMLUCHkupiQgCzXebRvp8qaWEFeTjYIpotGXCTevNr99Ms4O2TEDXCXMd6ubeeUwrMJ
 J1L/wkAzVmIfR3+poP2TL839oZuXx2pwmMmWR1Jpo2d3YwZRrAAMm8DIs+UO1CEpXWb8XUTvauk
 8lkEakM4o3c6GF2+mv5kcpsrglT0ImhnxQ7hqIrFy0wfTUz5AYMyjQxMgEh4RFR/OEjy29V10L4
 SNOR7vKo9C/sFgbGWiWqweMYb/nWYrO133vWJOzn1u3tG6tmKhi6uA5cFKcfnmRET2HzknpnUft
 wDG3v0HXU3UnNY9iVCSXVPmaUXNnyDOQpd/8TtcLQIOXDnzCdNQvxB28to8sm8v1qDSNygjXiCR
 zK2Eli1i3WgydZQb69LwFwmMom1nsq+QTkQnOyoc1/zF/Q2oFW1GA24pxoZJjs1hHvKRQntyIHn
 zxJGk/oh6dPmIyB8WBg==
X-Authority-Analysis: v=2.4 cv=HtZ72kTS c=1 sm=1 tr=0 ts=695f49ed cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=UGXAvUmdAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=biSirK55LH2f843hcx4A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 8eDzqIJU3crFI_L_KzMLSm897daZaSI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 06:08:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229038

From: Changqing Li <changqing.li@windriver.com>

Go packages and binaries are stamped with build IDs that record both the
action ID, which is a hash of the inputs to the action that produced the
packages or binary, and the content ID, which is a hash of the action
output, namely the archive or binary itself, Refer [1].

And action ID include hash of modroot, which will include build path,
so this make go package not reproducible.
Refer [2], keying off module path instead of module root directory is a TODO.

[snip of log]
HASH[moduleIndex]: "go1.25.3"
HASH[moduleIndex]: "modroot /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd\n"
HASH[moduleIndex]: "package go1.25.3 go index v2 /build-a/tmp/work/x86-64-v3-wrs-linux/buildah/1.41.5/recipe-sysroot-native/usr/lib/go/src/cmd/buildid\n"
HASH[moduleIndex]: "file buildid.go 2025-10-13 16:08:43 +0000 UTC 1704\n"
HASH[moduleIndex]: "file doc.go 2025-10-13 16:08:43 +0000 UTC 558\n"
HASH[moduleIndex]: 007b9fe2edd5b3232f5c98ae6c46e80a435141cb627ba5418c5314c0cbf4df7b

Report this issue to upstream, refer [3]
Workaround the reproducible by setting buildid to empty, refer [4]

Refer:
[1] https://github.com/golang/go/blob/master/src/cmd/go/internal/work/buildid.go#L26
[2] https://github.com/golang/go/blob/master/src/cmd/go/internal/modindex/read.go#L70
[1] https://github.com/golang/go/issues/77086
[2] https://github.com/golang/go/issues/34186

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/classes-recipe/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index b540471ba2..1c43b36fc0 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -51,11 +51,12 @@ GO_RPATH:class-native = "${@'-r ${STAGING_LIBDIR_NATIVE}/go/pkg/${TARGET_GOTUPLE
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


