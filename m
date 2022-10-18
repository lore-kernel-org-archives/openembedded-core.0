Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BBEC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 00:14:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1257.1666052061762930732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 17:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Uky+Gtr7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7290531206=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29HNqtxO001017
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 00:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=rZawRdk367kgCw2oUipmRe+D28Y42/iDYYg4/wh0ltg=;
 b=Uky+Gtr7qap4OH/KK2TuuOoYajIqOoHf5iNfy6HoTHuebKZqvKENESD7Tp1trQ8ou039
 2nxG0FmGdNSiiVHTZuhNckW7LzJ5BQeTJupMBwcjQMVC/5RwrBY3aYDlWlqn41Tjk0OC
 pgITYKoN6keKu3hobdDteFuc31VDJ/V8hEStC79FQEzU0zODwlVCddrz0fWPWjSrNDJb
 wf5RScLhgVZfFmI2dKAD/eF9XHDJsdD6yr0Zs7lmKcXUNlBHvmlTyqLcfcYrYuvtwHbq
 2XJ3E2ntWvQG2eUOpLPrOZRo/d3unDD3gqjwnTGiIyEpP8/0JAxMGa7j+P3LbF4CP8v1 gA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k7ku9a395-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 00:14:20 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 17 Oct 2022 17:14:19 -0700
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Mon, 17 Oct 2022 17:14:18 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kbd: package some fonts as restricted
Date: Mon, 17 Oct 2022 20:14:15 -0400
Message-ID: <20221018001415.76680-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: A8KOAlqSmsbd4fbxtc4IMGqBbu8w2Vbc
X-Proofpoint-ORIG-GUID: A8KOAlqSmsbd4fbxtc4IMGqBbu8w2Vbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxlogscore=799 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 00:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171932

The distribution terms of the Agafari fonts as described in
data/consolefonts/README.Ethiopic is:

Agafari:
  Donated by the Ethiopian Science and Technology Commission
  <ncic@padis.gn.apc.org> or <ncic@telecom.net.et> and may be redistributed
  for non-commercial use under Unix environments only.

so package them seperately to make it easier for affected users
to avoid installing the fonts.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-core/kbd/kbd_2.5.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
index aa3ab6e121..8822cdbef4 100644
--- a/meta/recipes-core/kbd/kbd_2.5.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
@@ -23,9 +23,11 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
 
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
 
-PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
+PACKAGES += "${PN}-consolefonts ${PN}-consolefonts-restricted ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
 
-FILES:${PN}-consolefonts = "${datadir}/consolefonts"
+# Package some fonts as restricted, see README.Ethiopic
+FILES:${PN}-consolefonts = "${datadir}/consolefonts/[a-zB-Z0-9]*"
+FILES:${PN}-consolefonts-restricted = "${datadir}/consolefonts/Agafari*"
 FILES:${PN}-consoletrans = "${datadir}/consoletrans"
 FILES:${PN}-keymaps = "${datadir}/keymaps"
 FILES:${PN}-unimaps = "${datadir}/unimaps"
-- 
2.34.1


