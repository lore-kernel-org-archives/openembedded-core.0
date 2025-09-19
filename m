Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D2ECAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:22:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16466.1758288130526738243
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=eyvQ5FSN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13574f9d0b=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58JAHREc1618561
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=UCsOzlPVppLt3w2b3DkP
	2MrzRRGNc6DRbT0yfjPZT7c=; b=eyvQ5FSNvJ9ZJugAQC4Hy9jDEovRDmTl6jL6
	qM23BwdTSDwv2c1X7NUJTllnCOghgdsOdSbrOGl2eycn/498V9PexNcnWu1v19KS
	2hg7jkPPHdscNnqgnuDClKUNaSnl32oBbn/DQo9LDkUC0tsfhNi7xnMP8Dhk1OJS
	tuc09ztxpUol26IdnA5gGtMQ+JXo+Rb1CNYhuidOUsTUOSnzkRUYcP9+5B0cRRrB
	gm8fb7yDkTrRAzLISvnx+Ot/N1cp77NFC/vQN4Q8VAm8V4xKdKt6bYTvtOEGi3YL
	s/24onDK0S9PztCr1XBWUfUWuWXQCqxoTX5T61wc4hAdG6LrTQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vmrgj3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:22:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 19 Sep 2025 06:22:07 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 19 Sep 2025 06:22:06 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-jinja2: upgrade 3.1.4 -> 3.1.6
Date: Fri, 19 Sep 2025 18:51:49 +0530
Message-ID: <20250919132149.2733084-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZP7XmW7b c=1 sm=1 tr=0 ts=68cd5901 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=CckQENj0AAAA:8 a=t7CeM3EgAAAA:8
 a=_enOPnqeAAAA:8 a=E70WwTUBkx_XJtlqCzoA:9 a=ZvtgTIOhhnMA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=XAbD3I9PDrnSMThV5XoS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDEyNCBTYWx0ZWRfXy0b8EjRAfC/Q
 P30S5SHSFdRhrPO1uXzliYVR21PWeZ9bP0F9VZEfocTN9hjhQ10/tb8+TWlAqxROaOAvzx+RErz
 BhANVYmDMZU5Prv1BlU1p3gIv/gRPaLb8LzGy4GMYJT6Fg3R9FEbJqZjmt33HjN8Fetuehk489S
 C/4HHbCzjcuNMyF5euN/c9Iy40a1ezQUnDKo7ng+uMqjx+HSsRMEAGd+zHXfCvWjR/FgbNA3Q/M
 crvoykHBQgl32DE5WfuThPo1QZin8uEQDxY9Q6wo2o1OGKj2V7U1FCUvIPm9D8SUoMhqfVHE2Ug
 akjGBMkj1mmtEESU/1z72Y8ghfbd71OuX9h5kxph04aOYTt1IPNoRxvZmsHeHg=
X-Proofpoint-GUID: hg8oHZx_BryTsCY8GiDDM634k7zQisZj
X-Proofpoint-ORIG-GUID: hg8oHZx_BryTsCY8GiDDM634k7zQisZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223749

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for - CVE-2024-56326, CVE-2025-27516, CVE-2024-56201

Changelog:
https://github.com/pallets/jinja/blob/3.1.6/CHANGES.rst
https://github.com/pallets/jinja/blob/3.1.5/CHANGES.rst

(From OE-Core rev: a935ef8f205c9510ebc5539c133960bc72504902)

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb}     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
index 3fe82d5e4e..d4f61cad26 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -22,6 +22,9 @@ SRC_URI += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+    # test_async items require trio module
+    rm -f ${D}${PTEST_PATH}/tests/test_async.py ${D}${PTEST_PATH}/tests/test_async_filters.py
 }
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.40.0


