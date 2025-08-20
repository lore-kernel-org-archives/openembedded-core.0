Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311F8CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:16:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16468.1755684994256472929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ayflMvua;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03275178e8=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K5tbN43161164;
	Wed, 20 Aug 2025 03:16:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pM5l3KNXiAabJoGKksdkLBe0n3KTwcyIKoaNPNworBM=; b=
	ayflMvuaiFdtfZSY/HGqNhlTGdChhoaBrGRCG8TMiWq+SubXEvQVEot8nUH/ghwq
	V0oPJIr0U1aQiIc3jNCJ6IA2H0mU1A3urww5V10xpoba/pmSuEWllN1YcDZf+XkS
	XKeGU2kZOvODBu2xnkpMOj29YLUVN7vkWLaPv/8nZJwOGulzvjZT4LvBE9urkRUs
	bzJs9ezvEm3VhDxC9zRJ+OhhesNdywwZmyIHhQ+EbKXDuA6Yb0cLbvsIU0GjLK1e
	3N3lpv1eRHmGuNlJ84rScslYERENpHktCbVMRMsbflq0Hv5LHEHJtnfdC9OvLYD/
	iqeBO9u6Z226GvrKaPgRBw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydq8nfs-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Aug 2025 03:16:33 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 20 Aug 2025 03:16:03 -0700
Received: from ala-lpggp7.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 20 Aug 2025 03:16:03 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>, <patryk.seregiet@gmail.com>
Subject: [walnascar][PATCH 1/1] linux-firmware: fix FILES to drop RDEPENDS on full package
Date: Wed, 20 Aug 2025 03:16:16 -0700
Message-ID: <739b4fe9243833d23f76440d9ce21f852ecdab11.1755684475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755684475.git.liezhi.yang@windriver.com>
References: <cover.1755684475.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDA5MCBTYWx0ZWRfXxVRG9sVmUm4h
 1UHsPrQuunayuhsK/oRRpN1D+cd0ruNDauLfZ+kYPQkmOf5yfyOOywq0TTseIGm1EJvQjWv2ZH2
 +34MOEdATc+j54jb00V39JZvJnoQCNX9HAEalI0uIxFk5YLC4Rch+6Dsa+w5cRCkuvyMumASZmS
 XK4oQv/Ta7c/gvx+4dkNMvGOgJ8oLPI1DlCP8YFCL+ML8Pu/xDmE/3jcrmgUkvVVH6jLqMooJ3a
 yXwuiRrsL5Hqi0CFiw0TXW/+6tic5OAHwFODC4gFP69QD3lXCM7kIp/vPb0bFhLAiQD7V7ncEz9
 UptdTA2tJfXRByWa388hBhxmB1jNq4mF8ZhmAhJlpWq1iYZM9vYLW4C+knNl4uF2zXYgzER09ru
 R8s0CId1TPSSf5Atm5W0cEEi3ly+IQ==
X-Proofpoint-GUID: LwYL8oSsb0xkk7CeYvj4bDNFPBZncnIz
X-Authority-Analysis: v=2.4 cv=aKupab9m c=1 sm=1 tr=0 ts=68a5a081 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=cU7-F6uJuo88Qk9bEfcA:9 a=d3PnA9EDa4IxuAV0gXij:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: LwYL8oSsb0xkk7CeYvj4bDNFPBZncnIz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222166

From: Patryk Seregiet <patryk.seregiet@gmail.com>

linux-firmware-rtl8723 and linux-firmware-adsp-sst
contain symlinks to files that were previously
packaged only in the main linux-firmware package.
This caused both subpackages to inherit an unintended
RDEPENDS on the full package. This change resolves the
issue by ensuring all required files are correctly
included in their respective subpackages.

Thanks to Peter Kjellerstedt for figuring out the rootcause.

(From OE-Core rev: cf27c7d040e7a5f1bbc60fb36c98686704bd7dc5)

Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: cf27c7d040e7a5f1bbc60fb36c98686704bd7dc5)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../linux-firmware/linux-firmware_20250311.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 675d378376..a4814d80d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -1253,6 +1253,7 @@ FILES:${PN}-rtl8723 = " \
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
@@ -1756,7 +1757,10 @@ RDEPENDS:${PN}-ice      = "${PN}-ice-license"
 FILES:${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE:${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE:${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES:${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
+FILES:${PN}-adsp-sst              = "\
+    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
+    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
+"
 RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For QAT
-- 
2.49.0


