Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5611C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 06:33:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.70567.1705300404432004650
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 22:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=d9jeS350;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1744171146=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40F5QTpP008454
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:33:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=BE/FR
	wZGf0eUdfmWL0exVYcdSDuQcc2OijrLRgAqN1s=; b=d9jeS3501imcJEAE70hww
	6/326cQC9MM8AjliXrUpTjOH5ipgnqSsb+5Pz7JzeBAGdt2SNyzGNIp+KqoilbT3
	U0oac3Js2sk8F1W5G14U1pTcDyzswU0MXM0CpdxIV7I455lVFmcO8LVZnU+biEiO
	DAjv8gVYFris6wLIv7kwfBJSCDpyVimsBmfzID6/fTMX1CJpHOfgfQHmU+UgG8dd
	CJOL0vG4uL6MyZIjczKRqVdg6MaltPZIckwaXsto10xJtTCiW/DDijuYOr9ctdyz
	N97P6WsIpGQIlpWq7NyloWHe+iMcJ4M/1FNxru2vDVkkAi/OLa28Co8Ox45EUnGk
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp41g4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 14 Jan 2024 22:33:24 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Jan 2024 22:33:40 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sun, 14 Jan 2024 22:33:40 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] autoconf: 2.72d -> 2.72e
Date: Sun, 14 Jan 2024 22:33:22 -0800
Message-ID: <cover.1705300374.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: woP1Q3dB_edSa0eV32KX0wxvsZPyNNw8
X-Proofpoint-ORIG-GUID: woP1Q3dB_edSa0eV32KX0wxvsZPyNNw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=508 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401150046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193632

From: Robert Yang <liezhi.yang@windriver.com>

The following changes since commit 38a5fc5dbb33fd3314f0a98c861a842342add064:

  xmlcatalog: limit to native recipes only (2024-01-12 11:51:18 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (1):
  autoconf: 2.72d -> 2.72e

 .../autoconf/autoreconf-exclude.patch         | 26 +++++++++----------
 .../autotest-automake-result-format.patch     | 22 +++++++---------
 .../autoconf/autoconf/man-host-perl.patch     | 13 +++++++---
 .../autoconf/autoconf/no-man.patch            | 19 ++++++++++++--
 .../autoconf/autoconf/preferbash.patch        | 12 ++++-----
 .../autoconf/autoconf/program_prefix.patch    | 12 ++++-----
 .../remove-usr-local-lib-from-m4.patch        | 12 ++++-----
 .../{autoconf_2.72d.bb => autoconf_2.72e.bb}  |  2 +-
 8 files changed, 65 insertions(+), 53 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf_2.72d.bb => autoconf_2.72e.bb} (96%)

-- 
2.43.0


