Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF1F9C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 10:43:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35433.1749379398348961972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 03:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82543c27de=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558AaXsE011162
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 10:43:17 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2gx4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 10:43:17 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 8 Jun 2025 03:43:16 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 8 Jun 2025 03:43:16 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/1] rpm: 4.20.0 -> 4.20.1
Date: Sun, 8 Jun 2025 03:43:09 -0700
Message-ID: <cover.1749379320.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA4MiBTYWx0ZWRfX9laOANvhyB4j MrU1cBfraYy+0RO0AaH2cmVbtlI3ezKVzHqG+m3UI0S9eT+pc5/IOmtiA2W6A+DhAL1a7nIeZgt 3u3+wkcZW8FXbZtZjsVkueNneiSuWjmqlr7liQ5hbdPxCGyAuOHpfQFF3w8epQrtcLFhK0Btsqf
 Y0endV4BgXCY8BngV3EB7y52rINkefMHEvCccIGxRmJDSHPpFih4RnB8MdqFcvPVWWLECOpNDa/ rxq6gFgXoVPERf3GacOy4xsP2rs/bFPi7I0aZoM4OQyZ1HN05lXgg69Z8Dgh2780/xPeNqHC9fM 5o0kI7era8GuR0hhfg71Qi7hs85dV2doG979dPEa8jmSowMqTLzi/mV9nXI5E7Ga92XgD+UR3X4
 Muf7GH49RqjcX4W+z+ou3XxHHwJAeUKo16Os+L+L4rv2UkSQktFOeLUfOiR/4i7sp5MwlUJ2
X-Proofpoint-GUID: iZaVKVDJKqzz3e03WeCbrL5dJxyUMgq1
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=68456945 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=r_H-ovHVlQOYUWP9-XoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iZaVKVDJKqzz3e03WeCbrL5dJxyUMgq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506080082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 10:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218209

From: Robert Yang <liezhi.yang@windriver.com>

* V2:
Fix rpm-native build error:
gcc: error: unrecognized command-line option -fhardened

* V1
Initial version

// Robert


The following changes since commit bd8fc4c59a137a37bd7a54f398949617982d447e:

  update-alternatives: Simplfy variable dependency logic (2025-06-05 21:19:08 +0100)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/rpm
  https://github.com/robertlinux/yocto/tree/rbt/rpm

Robert Yang (1):
  rpm: 4.20.0 -> 4.20.1

 ...akeLists.txt-Fix-checking-for-CFLAGS.patch | 58 +++++++++++++++++++
 ...LUGINDIR-in-top-level-CMakeLists.txt.patch | 57 ------------------
 ...lling-execute-package-scriptlets-wit.patch | 24 ++++----
 ...ge-logging-level-around-scriptlets-t.patch | 27 +++++----
 .../rpm/{rpm_4.20.0.bb => rpm_4.20.1.bb}      |  6 +-
 5 files changed, 89 insertions(+), 83 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Set-RPM_PLUGINDIR-in-top-level-CMakeLists.txt.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.0.bb => rpm_4.20.1.bb} (97%)

-- 
2.49.0


