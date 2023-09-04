Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CD6C71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 02:09:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40483.1693793389966079955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Sep 2023 19:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VxJq7SbK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=761197589b=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3841Nh9X001096
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Sep 2023 19:09:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=y3Uvr
	u6q4KRzjbLW8Yvc5lA32JaqRdHTbakWz7e6ioc=; b=VxJq7SbKnEzY9Q2QIosqx
	h9B6xQHCHcbDcJ75ARyT5ifHInNJvJCXEkeC5j67pPByH2pUqu6PU3xN2IxbKpMv
	/3bUNpbJgmnU4OjQV0ViEdzA8V8yJ1vfMuq8yHR7u3Nb6UtVCznqWTDkSSJP+hfU
	t4IXRujgZSxcpm0hHhdv5fazhwlEiqdOzvNu6KglqzwFI3BrQmdj2AHoztpn6V74
	v5ZpcxqGDO5nDxi2W3T9tGqK3FqEUn7v+MLPsjrnQM8i38+GFuWTKn+wY+nolONn
	TZMioaIMdW9MMn65ctDlAGpmIDIAPrP9ODsMQfyXeOcWPsFYcHOBt8n9Ol/QS0OJ
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sv4jg0wyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Sep 2023 19:09:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 19:09:45 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Sun, 3 Sep 2023 19:09:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] sqlite3: set CVE_STATUS for CVE-2023-36191
Date: Mon, 4 Sep 2023 10:09:47 +0800
Message-ID: <20230904020947.3514353-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2xc4R0BbkhKoxJfMrnO4VCot5h14Gp3e
X-Proofpoint-GUID: 2xc4R0BbkhKoxJfMrnO4VCot5h14Gp3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-03_21,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=676 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309040018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 02:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187159

From: Changqing Li <changqing.li@windriver.com>

The error is a bug. It has been fixed upstream. But it is not a
vulnerability. You may safely ignore the CVE.

Refer:
[1] https://www.sqlite.org/forum/forumpost/19f55ef73b

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/sqlite/sqlite3_3.42.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
index 8783f620f4..0ad406209b 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
@@ -6,3 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
 SRC_URI[sha256sum] = "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6"
 
+CVE_STATUS[CVE-2023-36191] = "disputed: The error is a bug. It has been fixed upstream. But it is not a vulnerability"
+
-- 
2.25.1


