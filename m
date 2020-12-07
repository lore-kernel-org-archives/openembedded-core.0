Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.72])
 by mx.groups.io with SMTP id smtpd.web10.3836.1607332553179898739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 01:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=X7V5uPS1;
 spf=pass (domain: windriver.com, ip: 40.107.76.72, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Km7BNWc2/CpIaDkRaHnvsW1C97o6lG6OAiWElpQLr4pULZkuPjOY82Vic4FoB8VIvdMELWBInNiUTS8i+I0Lob2ka7rVRvumz5ODYkDge6SvgraCEwi7zo37Ou61a2g8EoxdCbska47hOt3NSMHmemBJ5B/rqkLW+yOSmxSTMhWwpzQxsIDG4ptfJfo5Xj1MIXeSJ0gfvNkFWfwh/4GwHbjj7KGjxkDjcHyqaoG/RqIV3S7k+ttnz4GFnY/eTnPfPBvF/exKaxd6QTylQEK8ovX+dtG+30FZgvYqH1n3vBTeH9Nlasvw1c/hdnaXFn97z7MHVCTF7JXTr0gYV7DX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOKEaq90rKUwiP4R1Em77Ak3eq+fM6XRekWEsfxdaA4=;
 b=VM8agWls2iq00fM96SxAdfY4dU/1HAW1rOaRVCCJmEeLcFrYekoywv7t8h1ZSY3CGhsCGTyqgJMNXZlfzr1/46G/f+IKybjVF5J83rZK8XbSbndLLzdlLhAyOKYSGDubJnJvyL4mATh0rMJlweSBYEowHlQp6DX7hKfcYQwEyizQfcMgpbBJXziB0xOPOm/VOLmsgm6DL+ZH2Z1tYSosxP0Eq96Vq+jBvns48pFx2JMSrBV074SdRD0EIpZptCTXJwcELEcIZ2VGtzfWQalAh26almMNP5Ck8Jck+gLT+qqEGmNYl4PzO3Ym8cFPw7kN1v9a+qlXEtjIq1pccYfO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOKEaq90rKUwiP4R1Em77Ak3eq+fM6XRekWEsfxdaA4=;
 b=X7V5uPS1NcmDKp1KEt6BP+vbqn6UF+WcaWdUfmkIQmlRBZbnP62SRVnUNqSY73QPcjNonKmV6yKyv3W79IaYuppRVH92VCbnvBAKoB8Lrm67oIvm0aSCUL9hdictpxVe+Cs4hsICf5plLHHgR+SDQ/h0GoeadYc+szPs4FwkBhA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4314.namprd11.prod.outlook.com (2603:10b6:5:1de::32)
 by DM6PR11MB3257.namprd11.prod.outlook.com (2603:10b6:5:5c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Mon, 7 Dec
 2020 09:15:51 +0000
Received: from DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::3d5e:ce55:f91:da0e]) by DM6PR11MB4314.namprd11.prod.outlook.com
 ([fe80::3d5e:ce55:f91:da0e%3]) with mapi id 15.20.3632.021; Mon, 7 Dec 2020
 09:15:51 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tune-octeontx2.inc: Add tune for Marvell OCTEON TX2 core
Date: Mon,  7 Dec 2020 17:09:05 +0800
Message-ID: <20201207090905.17706-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To DM6PR11MB4314.namprd11.prod.outlook.com
 (2603:10b6:5:1de::32)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK2PR04CA0059.apcprd04.prod.outlook.com (2603:1096:202:14::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 09:15:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97e7195a-e34d-4254-aa98-08d89a90b159
X-MS-TrafficTypeDiagnostic: DM6PR11MB3257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32575DA8093783E032F4EA7EE2CE0@DM6PR11MB3257.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:363;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FEwKUyvxs46F3fUHCd9LRQQEx8tek31vEpmkpvBlBAz/wdrIpIXlWuRwbv9BhMnNNpSIxOOAyAKZ5Un57LCPfr5sOjYFApffOKWRz0RYZ5EYszf/YsmwygUFOVjCKWoTNM7yzbCmD23MLgY+9yGb3fUz1grXsuUT+ogn41GOy4igp74ae7MGsmjov5zdw1h2lKmWrRpDXo01dOYDisx1XlShlDIgdXvehkJ0/4JZZZO7JDpGULTj98f8hMt4sywRf4eDQJXJfzhLLhaS/xcMyr8oeiWYCk4KvLDRmY9Di7Zt8/RaFK6JjWIJgLEhwVuE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4314.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39840400004)(186003)(36756003)(6916009)(956004)(16526019)(66556008)(66476007)(6512007)(66946007)(6506007)(316002)(8936002)(86362001)(478600001)(8676002)(26005)(52116002)(6486002)(2906002)(5660300002)(6666004)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	jDuASG8thYUN8RtWe+cb7KJh4X0WDits6w6wGpfch7lq6//aqfXS8GkW//h3Ijw0cbbjhxRptvMtgM4tJQJgau/0trVZ4KZyUffY6jaJHqqsosL/JO6NqQPg/ZK0pgQnIhPUKia5367aCIgYEiTmF+FrBNL3RGkNS9EL16pXw0o5X20GTxSDry1EBORrLqErdCKsO4mfFc62E9roJmr4X59rC2XoaIRpYCxeonDwCxRDHUz0/KauqzkZunuwfBfr7vt6hXC8M/LRIkku9UH9iGGE7xGegi7ebeCCDXDPtGbsCipM34owv04ItpZsWUE9LOIutn+kFd2hZo/EfRCYrYQBXJFm14LtfAh3IMpHWGP3gtO8B+5F1TnPwK0BrtaWlwcc/8T/gg7lopmfmia+4WyXV0piHxjHxFBrHE6DomkVehzRVC3cwV1kmVv2Ome6PkPNVknMs8+p8Pw0Og+W8YeSTYKBace8MKcgNnJrEJ9DCQEt6SzWRRAeDeQ2VEiq15PvOy94J1by8IYZHoy+cbonjJofeURzCcu2Sy/jlFQk7qj5BhWtuUWsZK9MzZtsa33AboIHjxsjiK4sUdr8bLYSww10iSKQWTogTWwjsX3X3ZYGnChIp1Y+hkV3z7tdQoYYW9LFxPWffSACCfAnThogCyCykEcuPC9ji0dTlQdDj7TCQ2gnpfMOnDCpJ85gpeVTk1PLkPUNdZbawKJuuKlDAOJQEHruad5Bpkn938slPPF5Gbjm1e7ZyBcntWRk
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4314.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 09:15:51.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e7195a-e34d-4254-aa98-08d89a90b159
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co8aSFA64oCPH/rb397iYZ51ignIX4BHY4RUeGdtrNepVz1wfCVXMyTbR/Z0I93hkemt8vwCvfWEClBmVJ1S7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3257
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The OCTEON TX2 core is custom designed by Marvell and is compliant
with Arm V8.2 architecture.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../machine/include/arm/armv8-2a/tune-octeontx2.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.i=
nc

diff --git a/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc b/me=
ta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
new file mode 100644
index 000000000000..f873b9517e23
--- /dev/null
+++ b/meta/conf/machine/include/arm/armv8-2a/tune-octeontx2.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?=3D "octeontx2"
+
+TUNEVALID[octeontx2] =3D "Enable Marvell octeontx2 specific processor opti=
mizations"
+TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'octeontx2', ' -mc=
pu=3Docteontx2', '', d)}"
+
+require conf/machine/include/arm/arch-armv8-2a.inc
+
+# Little Endian base configs
+AVAILTUNES +=3D "octeontx2"
+ARMPKGARCH_tune-octeontx2             =3D "octeontx2"
+TUNE_FEATURES_tune-octeontx2          =3D "${TUNE_FEATURES_tune-armv8-2a-c=
rypto} octeontx2"
+PACKAGE_EXTRA_ARCHS_tune-octeontx2    =3D "${PACKAGE_EXTRA_ARCHS_tune-armv=
8-2a-crypto} octeontx2"
+BASE_LIB_tune-octeontx2               =3D "lib64"
--=20
2.26.2

