Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52078CAC587
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:10:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11616.1757995847783289257
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tE20F2rY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13540941b7=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3Fxv01248862
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 21:10:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+McIaSi4DTvFY7qg9fb5mG4fzzSHsjE6eMNVj/YntxY=; b=tE20F2rYtFLi
	MHuW2X+iOWC4vvSQlFMAMTQIPq9HmfRlfn7mwitjQmwYmQALF5Qdolm9GT86Kl+B
	uA52lptdw+JLqoHlyPSdyjoiaQaY1j6VENzQZMyuoBuSTIgCdeoKQZinxrR+Z6fJ
	8tBnxvkTfnCmZ7wCjTH/zVb/xN8uO7z3HEMA4bU6i3WIMOxDnc7YMfysyhoI5k/H
	qhDsuv5cIu+EIdBpsiRm8B+/ySF3XbYCuNSsic6ScB3RoHB6OhYfjHw172aws9kT
	WutWOy8q0ZuOzN/dBM3uQ14UNKmZrKm+cwfh2OdPPRzb7QUYtWUWq8nOUBqYWl4d
	rfIPnf7exA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49584hjjj8-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 21:10:47 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:10:46 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:10:46 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] ccache: 4.11.3 -> 4.12
Date: Mon, 15 Sep 2025 21:10:57 -0700
Message-ID: <abcf2ed6ced0d22b89e840ac7962db477a52fdb6.1757995760.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1757995760.git.liezhi.yang@windriver.com>
References: <cover.1757995760.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Pbj/hjhd c=1 sm=1 tr=0 ts=68c8e347 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=QZgxOXQoyHKojalQbBUA:9
 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX5R7kq2VKPh3R
 4CHbr+oNCElkubFVNZ6kE+yUJz/zbci7t2+0KAMt2X0LN/jvy1iz4k0OGzPx1eb7uo/3hB4Qdv1
 KlJybY1WBJuHH5SPBygtJF0mYjsCA6nN9ECOaZB9voBo4hf2tAXoDpfvWJu6f0bmDV2QceKVUaj
 04UpnWu6BBXnWIk3KWRi7A0Wq6s4OrrCvKBZAIEUNJNQgW3OjmJn+zWANILQpU90DecyhxjAjfG
 IfvjZvn0EqOBC/eija0c0zovRt+/sPkWMoLU1GuCOonw9FpHfd5ikOXicciTL8532l7Bt8r/1q9
 GoKq5eIwQagTvJbj57msxmuQ6xMuGssjxsNwTvuRL2Qsun/se3ZfLruWbx++J8=
X-Proofpoint-GUID: xYgNajDuRvjhL9GxS8oua6aEkkYfc1ab
X-Proofpoint-ORIG-GUID: xYgNajDuRvjhL9GxS8oua6aEkkYfc1ab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:10:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223526

From: Robert Yang <liezhi.yang@windriver.com>

License-Update: Third party packages' versions updated

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ccache/{ccache_4.11.3.bb => ccache_4.12.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.11.3.bb => ccache_4.12.bb} (88%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.11.3.bb b/meta/recipes-devtools/ccache/ccache_4.12.bb
similarity index 88%
rename from meta/recipes-devtools/ccache/ccache_4.11.3.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.bb
index 83374fa44c..52643c4bff 100644
--- a/meta/recipes-devtools/ccache/ccache_4.11.3.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPL-3.0-or-later & MIT & BSL-1.0 & ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=b98c3470e22877fefa43a01a2dd0669c \
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=5633f18ca110f0d4cb907eba07c920ef \
                     file://src/third_party/cpp-httplib/httplib.h;endline=6;md5=663aca6f84e7d67ade228aad32afc0ea \
                     file://src/third_party/nonstd-span/nonstd/span.hpp;endline=9;md5=b4af92a7f068b38c5b3410dceb30c186 \
                     file://src/third_party/win32-compat/win32/mktemp.c;endline=17;md5=d287e9c1f1cd2bb2bd164490e1cf449a \
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "28a407314f03a7bd7a008038dbaffa83448bc670e2fc119609b1d99fb33bb600"
+SRC_URI[sha256sum] = "e884c62cbacae2e9488b8641a671a79fb7a1221db01310dacef61c9e55c2e55b"
 
 inherit cmake github-releases
 
-- 
2.49.0


