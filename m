Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B1EC71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 12:43:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6272.1750250617833788261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 05:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ad95c1=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I5Z25E018311;
	Wed, 18 Jun 2025 05:43:33 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkm981-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 18 Jun 2025 05:43:32 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Jun 2025 05:43:32 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 18 Jun 2025 05:43:28 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Niko Mauno <niko.mauno@vaisala.com>, Ross Burton <ross.burton@arm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 5/7] recipes-connectivity: Drop dbus from RDEPENDS:${PN}
Date: Wed, 18 Jun 2025 18:12:54 +0530
Message-ID: <20250618124256.3261625-5-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250618124256.3261625-1-praveen.kumar@windriver.com>
References: <20250618124256.3261625-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ENSI-2ktHr3uyEhgqKR0omAa-LEAPsiw
X-Proofpoint-ORIG-GUID: ENSI-2ktHr3uyEhgqKR0omAa-LEAPsiw
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=6852b474 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=eWRtdWc1AAAA:8 a=7CQSdrXTAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=W9CGRsNraq-MJdedUCQA:9
 a=fQEa9puXOWAy-YWvlEz7:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDEwNyBTYWx0ZWRfX+DLBIsrGtcYH hgz59V/fjxeKlr0kyTmBTaAdShOAFluaPErie3zr0NZHEu14G2qzLksllr+YYsc8f5l0WpS/EP1 NcuaejDMwlBUV88eILlNG+jIs66KKgGrMDV/0wk30GuN2+myyeLvyivDFv4iwOb7STm5qWar1q2
 4X+K/FRhJkM7v2Lun/nZm2t8mC9rUhrjxMvIyU6M6WOZtuBvwx2u1nfsSUJ0mgWK36LLgiBCKkR SJbxnDhAUZmWZ1FvoEbm83P30xoyIYBTsScQEgUyG4E5BCO5DXdHXUXXLqQo+MPYbelbaIPF/R+ aJuSmTNdgaRKJSOAVwasHJCC+jJ2COr/zZm2UutnNZgW87w2qNp4pAnr3VwAQUzBCKh5i7e8Hs0
 llKXfutC4oWf34uuNoFA9m70UsROIKbT49j4JHlT93PENVZkxjoKqpsrO/6WyaMq1Otr37pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=984 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 12:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219004

From: Niko Mauno <niko.mauno@vaisala.com>

Since each of these recipes already have 'dbus' in their DEPENDS,
explicit runtime dependency declaration to dbus is not stricly
necessary, because dbus-lib has runtime recommendation for
${VIRTUAL-RUNTIME_dbus} which in turn induces pulling also the
preferred runtime D-Bus package to rootfs.

Suggested-by: Ross Burton <ross.burton@arm.com>
(From OE-Core rev: cf5b48d03f290a6bde94ee7a5c1aaee4d1a7793c)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   | 1 -
 meta/recipes-connectivity/connman/connman.inc | 4 ----
 meta/recipes-connectivity/neard/neard_0.19.bb | 2 --
 meta/recipes-connectivity/ofono/ofono_2.15.bb | 1 -
 4 files changed, 8 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d626872103..c1f52c5f1b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
                     file://src/main.c;beginline=1;endline=24;md5=0ad83ca0dc37ab08af448777c581e7ac"
 DEPENDS = "dbus glib-2.0"
-RDEPENDS:${PN} += "dbus"
 PROVIDES += "bluez-hcidump"
 RPROVIDES:${PN} += "bluez-hcidump"
 
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 133e8616da..804c2db9a7 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -118,10 +118,6 @@ RPROVIDES:${PN} = "\
 	${@bb.utils.contains('PACKAGECONFIG', '3g','connman-plugin-ofono', '', d)} \
 	"
 
-RDEPENDS:${PN} = "\
-	dbus \
-	"
-
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
 def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_skip):
diff --git a/meta/recipes-connectivity/neard/neard_0.19.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
index b04187bcc5..9e0ac6aa69 100644
--- a/meta/recipes-connectivity/neard/neard_0.19.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -37,8 +37,6 @@ do_install:append() {
 	fi
 }
 
-RDEPENDS:${PN} = "dbus"
-
 # Bluez & Wifi are not mandatory except for handover
 WIRELESS_DAEMON ??= "wpa-supplicant"
 RRECOMMENDS:${PN} = "\
diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-connectivity/ofono/ofono_2.15.bb
index 07d7ac6095..3094183577 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -38,7 +38,6 @@ PACKAGES =+ "${PN}-tests"
 FILES:${PN} += "${systemd_unitdir}"
 FILES:${PN}-tests = "${libdir}/${BPN}/test"
 
-RDEPENDS:${PN} += "dbus"
 RDEPENDS:${PN}-tests = "\
     python3-core \
     python3-dbus \
-- 
2.40.0


