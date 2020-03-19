Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
	by mail.openembedded.org (Postfix) with ESMTP id E33E360F9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 18:34:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Gq3FmSWHw9K4J9j1lX6eKXLpC0hVj3hijATEMah2ARLEy6URghvzMitq7yKLtP582GoH0tBwqx81JETc5tg4TkroyJ74FcdIL6lNPVbHWYBAcv1tal4qoE8heJAYaOlEAXa4/B+gz2HSVK7YDR/0f8D3KDXE+CJmTev3Oid1ynpr4P4M0hXy5y75cWlxWiRihPjTHCzBTsSxq2kqogDcTjdeADCeGXpIrGFowBl93z1oghcPxgLjNoJVcPfqL2t/VS9T3qBsSFmZNjcxkFzjqgk5AI4uNlum2RcgTQTmVQv9IQIKP1EM8I5xltuNbotVxeHE93Dzp6MVTrFQ5Z1b2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RxHMuIkUtOkYicP55H0Y623E2m6WMzb7re7QzBBnnC4=;
	b=e3QNPzRWUSHQ/X+b6sWVK3WQe7vdxtdumuGCcoa/s6Vl/sU3fbQOcYRqZ6NZgoJdbDHR0N+XvoAXW4tjH4AMpOWZHzozaXqI3rRfhkaDdpMuMaKVGJgMF5SmjKUodwuRpmHQzsHQQZEaI8qozs6TRhZ4Ae1+eG8QtFyDAc6kp3bCYR7LEJ1w+KAB7uypetQ9gejjSXSoS7xo5AOBxmwayiaIg/+M5DoTYzWtH07ufSe+wNUIJGwvDFxMiH45ca8fmFuYOYfVXvsJI2U/gg9OEkd/CLnbimXzO9XGzRuCNiy/oytb5Mg2kFJor+frPnADVUVt9KbmXhOSoQEStTFw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RxHMuIkUtOkYicP55H0Y623E2m6WMzb7re7QzBBnnC4=;
	b=U0UzH+ep21gseHCovCBMK7IvLV/1fGiHtV3aJ8Xqir0HsxVcrzdOsth0SOr94Xk8BXP9HNf1qJ1D64x0RunMHgEjmJ+pLSmUZcimFkCn25wQPBd0RMPdBoea47B3UFhHRhqUkJf1bnBnTDCHIonCYv7bk/NiV4lc+sEwmxUcfQI=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com (20.179.234.213) by
	VE1PR04MB6542.eurprd04.prod.outlook.com (20.179.234.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2835.20; Thu, 19 Mar 2020 18:34:53 +0000
Received: from VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a]) by
	VE1PR04MB6621.eurprd04.prod.outlook.com
	([fe80::71aa:4c20:47c4:759a%7]) with mapi id 15.20.2835.017;
	Thu, 19 Mar 2020 18:34:53 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 13:34:24 -0500
Message-Id: <20200319183425.12294-1-tom.hochstein@nxp.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BYAPR07CA0047.namprd07.prod.outlook.com
	(2603:10b6:a03:60::24) To VE1PR04MB6621.eurprd04.prod.outlook.com
	(2603:10a6:803:124::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from tx30imx-01.am.freescale.net (64.157.242.222) by
	BYAPR07CA0047.namprd07.prod.outlook.com (2603:10b6:a03:60::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15
	via Frontend Transport; Thu, 19 Mar 2020 18:34:51 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [64.157.242.222]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa2b5e54-239f-416c-eb83-08d7cc3436bc
X-MS-TrafficTypeDiagnostic: VE1PR04MB6542:|VE1PR04MB6542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6542E373C49A6506BF9A651BE2F40@VE1PR04MB6542.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(199004)(26005)(2906002)(2616005)(956004)(6512007)(4326008)(186003)(478600001)(16526019)(1076003)(6506007)(44832011)(66946007)(8936002)(81166006)(66476007)(66556008)(8676002)(81156014)(6916009)(52116002)(6486002)(86362001)(6666004)(4744005)(5660300002)(36756003)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6542;
	H:VE1PR04MB6621.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ksX6ZsjZ4ZKKKDm9Fdf9mvaYF84rm8BFts2AiAene8bQSyfT1XkTzGkTMfO7pH+XamlTg2rzJZK5kTFjQCro5bJuP67uDFMeIFFummf5KY9j2z4C3NtuESD4RMxjuY18MfPA/bf4YjcXqqWGrR7lyltKQR30UA1udClIOLd/ZhlXVGKorFaC51OMdtHZuZtcjA7pgsSmuU6dGytE7oxjUw3/u7h+Mfiuehy7fThkQSFEFDJj+j8/wYtq6ga2umU93QkICTs0agjGLuN+LeJybE3xaROviD6c8aR94J/dkLD3gILnSEf4vu4ij0qknJqhd5d2KC/0PbUQyYoq03O8OFFE/zaux7zPTEJo3TB2bGP0DHkTAtQU8uHRVpTDIMrezINsVvUmH1nzi+b6wNyjBtZjjYeBEu0SoFpbXzsdNjq1U4Vd8FpsXr+xfCTikjRo
X-MS-Exchange-AntiSpam-MessageData: SOPYnl7r/TiVz7Hd4t07vTJSV569B4Y7uGlktWqqzUlEW5ejZzdLu3VzGY2kSuJdyoOnC9BGd1AI2f+zDqUoyXzK5eF34ZHNvinKf/qrtaDF+rqCa2cy+Py8xfKlc3DsUPvxR2TTolOimMH6VsLJFA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa2b5e54-239f-416c-eb83-08d7cc3436bc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2020 18:34:53.1797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBZm0VQnaC4XmAekUP18Zyp43w98bwXfaOPB3UsyOxKIPd3Pyiu0kABUtd8wGQYRqnpF2SF5fqBTjGWsc0Qmfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6542
Subject: [PATCH 1/2] bitbake.conf: Fix nativesdk-wayland missing from SDK
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
X-List-Received-Date: Thu, 19 Mar 2020 18:34:54 -0000
Content-Type: text/plain

nativesdk-wayland was not being added to the SDK because it
relies on checking the distro feature. This fixes that by
filtering the wayland feature to the SDK build.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4b544a22cd..e44de34a00 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -830,7 +830,7 @@ DISTRO_FEATURES_NATIVESDK ?= "x11"
 # Normally target distro features will not be applied to native builds:
 # Native distro features on this list will use the target feature value
 DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
-DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation wayland"
 
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
-- 
2.17.1


