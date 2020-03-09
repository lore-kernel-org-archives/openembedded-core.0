Return-Path: <Codrin.Ciubotariu@microchip.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2020 16:06:09 UTC
Received: from esa5.microchip.iphmx.com (esa5.microchip.iphmx.com
	[216.71.150.166])
	by mail.openembedded.org (Postfix) with ESMTP id 9601D60CC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 16:06:09 +0000 (UTC)
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
	Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
	permitted sender) identity=mailfrom;
	client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
	envelope-from="Codrin.Ciubotariu@microchip.com";
	x-sender="Codrin.Ciubotariu@microchip.com";
	x-conformance=spf_only; x-record-type="v=spf1";
	x-record-text="v=spf1 mx a:ushub1.microchip.com
	a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
	include:servers.mcsv.net include:mktomail.com
	include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@email.microchip.com) identity=helo;
	client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
	envelope-from="Codrin.Ciubotariu@microchip.com";
	x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
	spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
	spf=None smtp.helo=postmaster@email.microchip.com;
	dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 60uawNls+tBtEM7vgDAEvKlRPCuec+c1mVKDSVQzT7/RBuKqgT7DMPRIB8h2Bd1RvSyiJz+jMB
	zuCNxrZrJsKyd5HLE6OEzaIiV9zgTRgWlSK8bpDtcm7762ToRCq9A6O8R+UomLP/UrfP5HCeaI
	/rlvOo/decSM4Z4B7zrpkU/zcXEX7veeXaopVRYe4igOnav9k6C/GK2qMzmX+b9ijFf+1DYfh6
	CYNFGGEY4x8k696Wv8DhwpRIMQUChbtTap9X6r8e3WGcwrt58keoCqD87G3IbbBTCyPD0Mbabv
	8BE=
X-IronPort-AV: E=Sophos;i="5.70,533,1574146800"; d="scan'208";a="68154151"
Received: from smtpout.microchip.com (HELO email.microchip.com)
	([198.175.253.82])
	by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
	09 Mar 2020 08:58:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
	chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Mon, 9 Mar 2020 08:58:49 -0700
Received: from rob-dk-mpu02.microchip.com (10.10.115.15) by
	chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
	15.1.1713.5 via Frontend Transport; Mon, 9 Mar 2020 08:58:51 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2020 17:58:36 +0200
Message-ID: <20200309155836.30846-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] p11-kit: Add nativesdk variant
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Mar 2020 16:06:09 -0000
Content-Type: text/plain

The nativesdk variant is needed by the buildtools-tarball, when
p11-kit feature is enabled for gnutls. The error message is:

Missing or unbuildable dependency chain was: ['buildtools-tarball', 'nativesdk-wget', 'nativesdk-gnutls', 'nativesdk-p11-kit']

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
index 54455da1bb..995df29947 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.16.1.bb
@@ -44,3 +44,5 @@ FILES_${PN} += " \
 
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP_${PN} = "dev-so"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.17.1


