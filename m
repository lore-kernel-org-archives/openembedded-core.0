Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037BAC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 08:09:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6057.1747814981021549684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 01:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7236463a26=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L4oRia013631;
	Wed, 21 May 2025 01:09:38 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfs90xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 21 May 2025 01:09:37 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 21 May 2025 01:09:19 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 21 May 2025 01:09:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <Peter.Marko@siemens.com>, <mathieu.dubois-briand@bootlin.com>,
        <alex.kanavin@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/5] lttng-tools: fix compile failed with libxml2 2.14.0+
Date: Wed, 21 May 2025 16:09:25 +0800
Message-ID: <20250521080925.815334-5-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521080925.815334-1-hongxu.jia@windriver.com>
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MrFvoY48-vOsjKYdgOb6Zxds8FfY0wN_
X-Proofpoint-ORIG-GUID: MrFvoY48-vOsjKYdgOb6Zxds8FfY0wN_
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682d8a41 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=GHR8O2WEAAAA:20 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=I7dUZXBNjMwmdyNAN9cA:9 a=m9p5bXcFLgAA:10 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA3OSBTYWx0ZWRfX1nw/cGi1EIUd CGqo5i31SbdaVW8Fc5Ovct516sY9Afd4ClUc6yKdbVTMYC9YVAq5e1KlnAzejJkWJJ5gkDqLMqL 0Lnl2m8ZW79qNg/DOLXPt8N3mHpK/CHy1uuod9aw4daLZI8aG/XVARkHcdo9v0hSBcAGH9NJbRW
 UqHuitEEjgC/TLMsm6C+kdfmsr0Iis3wTNYLA2dHqEHTap69edrIhHx+Gjga9vnQQe1Ovu5Sdlj IxMqiC4FKPxsGpjNzqzKLDrO5ObDiolEmLc0Ox2RRysoxkM2fiw6hUhBhGo1/f3UibhL0dgtBJU Bt5GU3JlG12fkap/qcfWyNThvhyE+fzIcU54Txm9fAk7s7yCPSI/qQR8inTWSa9a6uK6c7Biisv
 433J25LW81pNutBPuvcR1O1GjXS28sklrrnwxQyB0UUH5zuWrnpKt0RmviPQ3m3YMIi1427r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505210079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 08:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217004

Description:
| In file included from /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
|                  from ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:29:
| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/encoding.h:173:7: note: declared here
|   173 |     } input XML_DEPRECATED_MEMBER;
|       |       ^~~~~
| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15: error: called object is not a function or function pointer
|   432 |         ret = handler->input(out_str, &out_len, (const xmlChar *) in_str, &in_len);
|       |               ^~~~~~~
| At top level:
| cc1: note: unrecognized command-line option '-Wno-incomplete-setjmp-declaration' may have been intended to silence earlier diagnostics

According to [1][2], the UTF-8 handler is
```
static xmlCharEncError
UTF8ToUTF8(void *vctxt ATTRIBUTE_UNUSED,
           unsigned char* out, int *outlen,
           const unsigned char* in, int *inlen,
           int flush ATTRIBUTE_UNUSED)
```

Update input.func with setting ATTRIBUTE_UNUSED params with NULL and 0

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/38f475072aefe032fff1dc058df3e56c1e7062fa
[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/69b83bb68e2a8ed0013f80c51b9a358714b00c9a#478024cc18a2cc8dbaed34076e9775f6827f413d_2188_2201

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...fails-to-compile-with-libxml2-2.14.0.patch | 55 +++++++++++++++++++
 .../lttng/lttng-tools_2.13.15.bb              |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
new file mode 100644
index 00000000000..7c2b8937313
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
@@ -0,0 +1,55 @@
+From 0b19e10a8a52fab0bfadbac5ce70f1b2d185a1d1 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 21 May 2025 13:09:25 +0800
+Subject: [PATCH] fix lttng-tools fails to compile with libxml2 2.14.0+
+
+Description:
+| In file included from /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/parser.h:25,
+|                  from ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:29:
+| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/encoding.h:173:7: note: declared here
+|   173 |     } input XML_DEPRECATED_MEMBER;
+|       |       ^~~~~
+| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432:15: error: called object is not a function or function pointer
+|   432 |         ret = handler->input(out_str, &out_len, (const xmlChar *) in_str, &in_len);
+|       |               ^~~~~~~
+| At top level:
+| cc1: note: unrecognized command-line option '-Wno-incomplete-setjmp-declaration' may have been intended to silence earlier diagnostics
+
+
+According to [1][2], the UTF-8 handler is
+```
+static xmlCharEncError
+UTF8ToUTF8(void *vctxt ATTRIBUTE_UNUSED,
+           unsigned char* out, int *outlen,
+           const unsigned char* in, int *inlen,
+           int flush ATTRIBUTE_UNUSED)
+```
+
+Update input.func with setting ATTRIBUTE_UNUSED params with NULL and 0
+
+[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/38f475072aefe032fff1dc058df3e56c1e7062fa
+[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/69b83bb68e2a8ed0013f80c51b9a358714b00c9a#478024cc18a2cc8dbaed34076e9775f6827f413d_2188_2201
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/170]
+Signed-off-by: Marko, Peter <Peter.Marko@siemens.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/common/config/session-config.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/config/session-config.c b/src/common/config/session-config.c
+index bb4e9fe..4042d34 100644
+--- a/src/common/config/session-config.c
++++ b/src/common/config/session-config.c
+@@ -429,7 +429,7 @@ static xmlChar *encode_string(const char *in_str)
+ 		goto end;
+ 	}
+ 
+-	ret = handler->input(out_str, &out_len, (const xmlChar *) in_str, &in_len);
++	ret = handler->input.func(NULL, out_str, &out_len, (const xmlChar *) in_str, &in_len, 0);
+ 	if (ret < 0) {
+ 		xmlFree(out_str);
+ 		out_str = NULL;
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
index 762d4e5c2fe..f39404afa0f 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            file://0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch \
            file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch \
+           file://0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch \
            "
 
 SRC_URI[sha256sum] = "96ea42351ee112c19dad9fdc7aae93b583d9f1722b2175664a381d2d337703c4"
-- 
2.34.1


