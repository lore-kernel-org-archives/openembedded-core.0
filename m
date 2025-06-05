Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DFFC5B549
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 03:02:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35026.1749092549622329386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 20:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8251f2c3bd=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5552qN6u019453
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Jun 2025 03:02:28 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9q3dc8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:02:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 20:02:26 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 20:02:26 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/2] Upgrade automake and rpm
Date: Wed, 4 Jun 2025 20:02:30 -0700
Message-ID: <cover.1749092509.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7W6cJXWB5H2sQZj6sIyKqgX5Hdd7NVJA
X-Authority-Analysis: v=2.4 cv=X8RSKHTe c=1 sm=1 tr=0 ts=684108c4 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=9DBtgEZv9evgCPYdaCkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDAyMyBTYWx0ZWRfX4JVb5+lmy4b9 wGZDu3nGGloVcroJd9E+yBERnvbdx8Ju8/QSUgXQmiGhAEeuKoWThPVjCYr581J0e3M9OuMHbQS CAD30lxo+qT50xZ6fh48t+h0VtXMIMlgMbRwMamMQC0wN/2xZwSh9PAvvgm/b9LfAb4r7UvR5VQ
 ndG+6VWgw2iggIaM41goNqy2EuNadZOqKu75OkX4f3f5o+9B1PevuiWyvT9WTm25jIpTDU+JN5s qaBZT6hVvFHSmG54YlwvCYIJ/M3DCrrSJ1NfXDYe0sgjSZ54BQxlW6CLisSfnD+CQI/RwNMoI8S 26OJzXvnGB8SniIr5tH8ftDJtp7/QrZcDltyewBefv9jlLfHeTR+WWCTlz3paTfLWmzCtfq4Ll8
 jKle+QrGBtHpnJoWn+edaCQU/N1/mrXgauYtJIGcOwO9PBwm8XP0vou0lYZ5eWsL8TlJXnEK
X-Proofpoint-ORIG-GUID: 7W6cJXWB5H2sQZj6sIyKqgX5Hdd7NVJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxlogscore=881 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 03:02:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217974

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 2e817e6e4d53543766b935479b148a1950cc37c8:

  oeqa/maturin/guessing-game: Bump dependencies to avoid security warning (2025-06-04 08:08:28 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade2
  https://github.com/robertlinux/yocto/tree/rbt/upgrade2

Robert Yang (2):
  automake: 1.17 -> 1.18
  rpm: 4.20.0 -> 4.20.1

 ...report-error-when-the-path-of-Perl-c.patch | 27 +++++----
 .../{automake_1.17.bb => automake_1.18.bb}    |  2 +-
 ...LUGINDIR-in-top-level-CMakeLists.txt.patch | 57 -------------------
 ...lling-execute-package-scriptlets-wit.patch | 24 ++++----
 ...ge-logging-level-around-scriptlets-t.patch | 27 +++++----
 .../rpm/{rpm_4.20.0.bb => rpm_4.20.1.bb}      |  5 +-
 6 files changed, 47 insertions(+), 95 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.17.bb => automake_1.18.bb} (92%)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.0.bb => rpm_4.20.1.bb} (97%)

-- 
2.49.0


