Return-Path: <Codrin.Ciubotariu@microchip.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Mar 2020 18:03:04 UTC
Received: from esa3.microchip.iphmx.com (esa3.microchip.iphmx.com
	[68.232.153.233])
	by mail.openembedded.org (Postfix) with ESMTP id D196160F57
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 18:03:04 +0000 (UTC)
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
	Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
	permitted sender) identity=mailfrom;
	client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
	envelope-from="Codrin.Ciubotariu@microchip.com";
	x-sender="Codrin.Ciubotariu@microchip.com";
	x-conformance=spf_only; x-record-type="v=spf1";
	x-record-text="v=spf1 mx a:ushub1.microchip.com
	a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
	include:servers.mcsv.net include:mktomail.com
	include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@email.microchip.com) identity=helo;
	client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
	envelope-from="Codrin.Ciubotariu@microchip.com";
	x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
	spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
	spf=None smtp.helo=postmaster@email.microchip.com;
	dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: q+SegIFwgi2Q/ZJtTxw/Ctfper4olZJktd4TZgosjOR3dNQ6MpGvsK09O79m1Ocrm6kUsncmpX
	ZbmObvxmnFyENFMcGPvoujT4VfXyukcKciWpOhlBonCNseSlIkGI2dBLpzPFbiGdTC8N+Uq/BN
	I4tSghPoHfOkvNdMsftWwDxIw1EcGIWUd2G51VykMXpbJWv32AbjXIt1/vkB2Tek7igpIaSRVf
	sKZ4thr34iHlI0o1zNKycHFPSBI1QjdXeaF+Qd4ZXrP7nl1ZNMdEZzr46Z6q99aGGHGO6fMkCQ
	ZtI=
X-IronPort-AV: E=Sophos;i="5.70,534,1574146800"; d="scan'208";a="69378522"
Received: from smtpout.microchip.com (HELO email.microchip.com)
	([198.175.253.82])
	by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
	09 Mar 2020 10:55:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
	chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Mon, 9 Mar 2020 10:55:55 -0700
Received: from rob-dk-mpu02.microchip.com (10.10.115.15) by
	chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
	15.1.1713.5 via Frontend Transport; Mon, 9 Mar 2020 10:55:54 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Mar 2020 19:55:35 +0200
Message-ID: <20200309175535.349-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH v2] p11-kit: Add nativesdk variant
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
X-List-Received-Date: Mon, 09 Mar 2020 18:03:05 -0000
Content-Type: text/plain

The nativesdk variant is needed by the buildtools-tarball, when
p11-kit feature is enabled for gnutls. The error message is:

Missing or unbuildable dependency chain was: ['buildtools-tarball', 'nativesdk-wget', 'nativesdk-gnutls', 'nativesdk-p11-kit']

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---

Changes in v2:
 - rebased on top of master branch

 meta/recipes-support/p11-kit/p11-kit_0.23.20.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
index 54b8cc6a70..4ba93f998a 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.20.bb
@@ -25,3 +25,5 @@ FILES_${PN} += " \
 
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
 INSANE_SKIP_${PN} = "dev-so"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.17.1


