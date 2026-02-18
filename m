Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83161E9A04F
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:23:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10830.1771417376240330449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:22:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jDpvEuHA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6509523d13=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9FlvJ1377447
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=EtKKnj+opgtF1YadmW4oPgS5RVPsWNMfNZb3OF+o4Es=; b=jDpvEuHACtNE
	0qrBkQbRCo7H++qQWxsgtZyTgMquGPC/mhJvF7SRyfZgOQlj4Al01iNwu0LaMaAq
	7TDABOu6kzRXwpJVZ7dhLgG5g3y1vcwJyMJp79KwS68pUseJmg2tWOJ8B033J/h4
	X0lTTBrQibEIbE28Kxv6Usyqk9f8RkqntOQ/IzxVN8OMwtm9yYQIMrjdO/ovQD/J
	UaHH04n94axiogSEnL1kIO4jFSMpoCMHJMc+yFCn8stPhgNsqr83r9PdkOoDsbM4
	2CwHckeuD3MgMJXOnV3h7Gmfd7JJi1Bf8nFvzB334RZSwCgGIzmLr0XKD0d77SIa
	zdvt/g06pQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ccbamt6sg-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:22:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 18 Feb 2026 04:22:54 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 18 Feb 2026 04:22:54 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v6 4/7] glib/python3/acl: Add pkgconfig to RDEPENDS
Date: Wed, 18 Feb 2026 04:22:50 -0800
Message-ID: <3077c391cc2897447756acb84233574bef6c3d4a.1771409846.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <cover.1771409846.git.liezhi.yang@windriver.com>
References: <cover.1771409846.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=SsCdKfO0 c=1 sm=1 tr=0 ts=6995af1f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8 a=cQkoBJ3bwYSCJnzXndgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEwOSBTYWx0ZWRfX3dilhnEPBUO0
 NKH1wuZm49ED4+KgOxObz2GHZuiWkD+fwo+tY+9gKQPlVeDfpf/zXNDXzKgPoKagzTC9pFIKys8
 8thre/zkr3q8ulwexZaRGN9EUIffv7qm73nhD1tS9ZZS3/SvaQLJ1VOJ5vunVb/M4T4vlOeNAtr
 KT05dNtubUpZHxdlwrQgKkMw4BgXYCtmiNl6yXcX32XODVmM9AKJFJ8u23K0K5bZzprBcTV8mOi
 4rJ1FNkg5T24UqgWom6iHHVL9uoprgM40DVzMOetqEYf53gp3CbnWYVVy4f8eA+zm2reUruUhUX
 yztkEHdnvEOHRf/+1foOLDhlQ6NxFm7shiELAmA/w66aIftu2Ow0OZo+rMlDMjjox2E/TMSw100
 dd4qQyNfJAknXFgVrEbhy+LuLX2Vo5bZRyk6uhTz54PnxVm7UQ90kFMjdQbmJ/UWgD8i7ouYW8D
 pBB9o2pXTnsFdLYdScA==
X-Proofpoint-ORIG-GUID: 8A5hUXVJrrfIRvnNvql0nSyPyLt5G583
X-Proofpoint-GUID: 8A5hUXVJrrfIRvnNvql0nSyPyLt5G583
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602180109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231301

From: Robert Yang <liezhi.yang@windriver.com>

Fixed issues like::
Error:
 Problem 1: package python3-ptest-3.14.2-r0.cortexa15t2hf_neon from oe-repo requires python3-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by python3-dev-3.14.2-r0.cortexa15t2hf_neon from oe-repo
 Problem 2: package libglib-2.0-ptest-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo requires glib-2.0-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by libglib-2.0-dev-1:2.86.3-r0.cortexa15t2hf_neon from oe-repo
(try to add '--skip-broken' to skip uninstallable packages or '--setopt=optional_metadata_types=filelists' to load additional filelists metadata)

This is because the rpm 6.0.1 can find the pkg-config files (.pc)
provides/requires correctly now, the rpm 4.20.1 couldn't find that.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc            | 2 +-
 meta/recipes-devtools/python/python3_3.14.2.bb | 2 ++
 meta/recipes-support/attr/acl_2.3.2.bb         | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2e15cc7675..3d733e21ae 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -159,7 +159,7 @@ CODEGEN_PYTHON_RDEPENDS:mingw32 = ""
 
 RDEPENDS:${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"
 
-RDEPENDS:${PN}-dev += "${PN}-utils"
+RDEPENDS:${PN}-dev += "${PN}-utils pkgconfig"
 
 RDEPENDS:${PN}-ptest += "\
             coreutils \
diff --git a/meta/recipes-devtools/python/python3_3.14.2.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
index 7481e70e13..7af828684e 100644
--- a/meta/recipes-devtools/python/python3_3.14.2.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -493,6 +493,8 @@ RDEPENDS:${PN}-pydoc += "${PN}-io"
 RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
 RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 
+RDEPENDS:{PN}-dev += "pkgconfig"
+
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index a405cc2692..1a6c9136e9 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -67,4 +67,6 @@ RDEPENDS:${PN}-ptest = "acl \
                         perl-module-posix \
                        "
 
+RDEPENDS:${PN}-dev = "pkgconfig"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.49.1


