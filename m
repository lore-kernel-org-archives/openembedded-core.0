Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4D6C46CC5
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:41:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5608.1702291263205817872
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nCMRzF9O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07098ab644=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB8O4UU016433
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 02:41:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=wvTzr
	yUn3WsAzdEsOJZX1pwz+drAPXDOU1Nk1tSb+po=; b=nCMRzF9OUF/q0hgv2ll9+
	fMa1UEIAMq0q0eZF9f54S2YqCdyTVVJwpdr6jHwdNFmFs6aoUo43Q9iPc0amqOl5
	vPwxORb9u0RtAY57IdabK/uaryGMhSgTX/KC7Xl7c6N2LrjDZQqCziFwBP47IHhh
	KNxCgrYTKGxdp1Jrm0La2JNMgMypzYpDyAkLeGkjlpcMWKhOtDa8OePC0ohWX1Jb
	eICsxCleEE4Fqr+aay9GNIgUCmEbxsBo+YKu9rgU2uak8MKT6ID3RnPOcV2Hdthi
	Nhpf4n3O0UffYbM4hB/PrpVWkWm+x0zUs6mNFxqFNLjBfIeSRhPRLE2nUT8/SItd
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd49cne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 02:41:02 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 02:41:06 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 02:41:06 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/1] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Date: Mon, 11 Dec 2023 02:41:01 -0800
Message-ID: <cover.1702291194.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: TsCeERH3ZrXUkWoFECa_1OU8O__TqkMU
X-Proofpoint-ORIG-GUID: TsCeERH3ZrXUkWoFECa_1OU8O__TqkMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=639 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192159

From: Robert Yang <liezhi.yang@windriver.com>

* V2:
  Fix build error with musl

* V1:
  Initial version

The following changes since commit 564339afb73fc52a66c1a08437587cad1c4d46e7:

  useradd: Fix useradd do_populate_sysroot dependency bug (2023-12-10 09:23:58 +0000)

are available in the Git repository at:

  https://github.com/robertlinux/yocto rbt/upgrade
  https://github.com/robertlinux/yocto/tree/rbt/upgrade

Robert Yang (1):
  nfs-utils: Upgrade 2.6.3 -> 2.6.4

 ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 82 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (97%)

-- 
2.42.0


