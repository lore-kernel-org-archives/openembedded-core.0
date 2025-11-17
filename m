Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA011CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 06:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3722.1763361431485352064
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 22:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fnXXjVjh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34165bd6f8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH3xCAp1234247
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+BcKW0yu0psdZf4/l/E+
	H59Bc1EZDqFuL8VVo0BJt7k=; b=fnXXjVjhstGkyALZ5kQqKbcyHiyTD/sG9E3+
	vSlm7crHnKxFL9odfR9UUG2mnf07/WQW19vXq03C6c1mqPpCTvkuUyYincycakMi
	vIIOpYshA7DbJjKMYFo929/0BP9K2qArvWAWCxby8lOi9fIa08Uw+QpRT9q2jcbq
	YUrS7E7I5em0ruKhzu/sRDk/aEEBzvIHwkVValRLTH+Sb5V62bNpMzzqX18NqU72
	r4W3Zcb/x/fmXIpnl1a2Fy4sxb6l/qrrTMTG/HslGkBQdjkeccNcz/A/OQNo9Dnp
	eamp7GooQbTznkcZzNMjqgJO5OxRWxgodzdqNniSoZP2wwSyiw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2sewm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 22:37:10 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 22:37:10 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 22:37:10 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/4] Upgrade 4 recipes
Date: Sun, 16 Nov 2025 22:37:06 -0800
Message-ID: <cover.1763361341.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDA1NCBTYWx0ZWRfX5f2AGeTFmGdU
 LEC/91R2uGUfiOtTJbtmqCGCvSFIRIJuDEh6iJCHy04pUjyQxqZUjExhxya/frlwwsgbChbVTcv
 KvuJsbFW+SuOWxAxPh030azcOELHfS9eDIMjx5UtKua6pSekKtfZdWiutaxu+Q2TCWvMWprituw
 jTl2hkyedmh/CSTLpy4CRw9hVff4L2yXzKjXhCKqIkMvQyuDSktE6koASaQPRam78WL0EaBhoum
 dzBFO6sTBjztnTzSDBAMcTomkwlp76h1SR3zaPlJji3PEvXosuoJ7sbZOnW2hVOhbWyYoq4bGcv
 ydbJMk0cBVXVFNsAT9LMzFm5BzeC0LpKW9B9HwEbX803Z0jl3Qpi7Ze1X2iO1iQIDGfxQ0awOEm
 oKv6GwWMIW92wFio6lOd1Mih/1xqQQ==
X-Proofpoint-ORIG-GUID: NRLyVLq8J1H0iYoejXEkVz0DkvwMWnMV
X-Proofpoint-GUID: NRLyVLq8J1H0iYoejXEkVz0DkvwMWnMV
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ac296 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=oudqQOCI-spMJKepTLwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511170054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 06:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226484

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit e7dc42e30c76bf0fbb4d3cc019bbec675bac55fa:

  oe-build-perf-report: relax metadata matching rules (2025-11-16 23:44:30 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/pu
  https://github.com/robertlinux/yocto/tree/rbt/pu

Robert Yang (4):
  squashfs-tools: 4.7.2 -> 4.7.4
  fmt: 11.2.0 -> 12.1.0
  git: 2.51.0 -> 2.51.2
  ccache: 4.12 -> 4.12.1

 .../{ccache_4.12.bb => ccache_4.12.1.bb}      |  2 +-
 ...compilation-on-clang-21-libc-21-4477.patch | 46 -------------------
 ...01-Workaround-an-ABI-issue-in-spdlog.patch |  8 ++--
 .../fmt/{fmt_11.2.0.bb => fmt_12.1.0.bb}      |  5 +-
 ...-do-not-force-RHEL-7-specific-build-.patch |  4 +-
 meta/recipes-devtools/git/git/fixsort.patch   |  2 +-
 .../git/{git_2.51.0.bb => git_2.51.2.bb}      |  2 +-
 ...tools_4.7.2.bb => squashfs-tools_4.7.4.bb} |  2 +-
 8 files changed, 12 insertions(+), 59 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.bb => ccache_4.12.1.bb} (93%)
 delete mode 100644 meta/recipes-devtools/fmt/fmt/0001-Fix-compilation-on-clang-21-libc-21-4477.patch
 rename meta/recipes-devtools/fmt/{fmt_11.2.0.bb => fmt_12.1.0.bb} (84%)
 rename meta/recipes-devtools/git/{git_2.51.0.bb => git_2.51.2.bb} (98%)
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.7.2.bb => squashfs-tools_4.7.4.bb} (96%)

-- 
2.49.0


