Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web12.43246.1609142351588228187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 23:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NtZANaLl;
 spf=pass (domain: windriver.com, ip: 40.107.237.41, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sd8Rjz1DENf1DnK8/TaV3qVjLdoRnzTbtK5xgfxAGJb9BY8R89aGpgQ8Ax01Hj4kVkgV1dy+BzpS5S0XPMMG/6IgsA2Rys/HCxm6Qp/NXOdzRTT9hE1WSb30KLUL7ZkBF16wgP7kxpnRFZmKKTOst/li2klaAJJjxvIR8+8NqWUjbfI6CI6rBomd6rQjMSTlooak5joTVpJbIXNiNc9aJFobW4SeVtVo2B/MGOuUdTf640earEmYpK2bDJJ47uxKGVCmgmZL+ZBkQxXjB3zJ4xwdRcoAlr6uOSC/mX5np7ebSayQ3lgKtwxW7GeNEvU0xmeSdIGcRonWSqR01706hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVUGhOU2qrzgFoCLfZmDpbt/MioaPpPD15BmGA2Jn0Q=;
 b=IhrAItTxzacNq3MCfZ7pC1XKI3N4YMs9oA1SmEDvFNbbXIokRUeirhrF2KMQDM0xhGGXQNoS3xC6CqWPJFixM1DzA4ND+jyymQHFEm1q1QMCPffYOPcJgRPMoXM96OoofCrX/OPJhUCNbduoQp2cd7/bkYO6Osvz5O5dg7ajOMd/j/+ruDOk8rQDaUjKL7jhDgaFJVby7yDECQ5+rUKFipT9XvdtF5e+lFdlEpx9aMDo7aqNHbBX4B9x5Ilvsoag8iKiYVZZXPyvealsvnQ9FoGOxghPsNnfNaN8f5xbbEUxgCUE7bKs3nICk/F+51vam04d+aXSqGtQ2IpZy+IWNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVUGhOU2qrzgFoCLfZmDpbt/MioaPpPD15BmGA2Jn0Q=;
 b=NtZANaLlIqcmJRnkCioJ+Fuy32/IR1WbNQOzw5xBDOnoV69cHqbedxquDE4dnZ5LVBxMNwnOm/7XUJV1TsOQxU/KO+uNt5uaxgCZuAObT9bfbUePyUY3gfAEG038FtpauWqP2Yx3z9roNw2qnOoeBO4KzwrC7simguX+Wfnxj6U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by BL0PR11MB3252.namprd11.prod.outlook.com (2603:10b6:208:6e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.31; Mon, 28 Dec
 2020 07:59:08 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%6]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 07:59:08 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] timezone: upgrade to 2020e
Date: Mon, 28 Dec 2020 09:57:45 +0200
Message-Id: <20201228075745.28276-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR0501CA0004.eurprd05.prod.outlook.com
 (2603:10a6:800:92::14) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR0501CA0004.eurprd05.prod.outlook.com (2603:10a6:800:92::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Mon, 28 Dec 2020 07:59:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcdd1c05-8d09-4d10-d70c-08d8ab06742f
X-MS-TrafficTypeDiagnostic: BL0PR11MB3252:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB32527F84534AA08AB34624A1FED90@BL0PR11MB3252.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lCpMWTH+2XPlnOyGx3cpc0ETzx3ENjgOcnDIz3mWBYDR504/jY2QZLTUpyx8Ti/5vN1kKFa43Lo7Ykox97f6YOJo7hv5Tz5eYo0uVerY9MEcTQ4on0xQXV/MjUmwKGWIFnHwfISKuK1JuyFX6eFjL+Xd2OLLq+rWhGScPyYb+wpvrJF6mWqfu5f3nycjI3rG8tDSZeeiVsPlMVo+OEfftFxW+8X6Z/lbXugUGeLwjAJ0SR66XvpLumGpJDCCKzmT05g3xLreYM1d1rD2uilX0H5kP8Pc87Ikz33oTad2TRR9WawC+K1XcnEt+eraRBEo9eL0Iu24modEKxjYZJBqym+rzMn/XZBFzycEYzEhyGI77IttJaOuNxnZpr08a361SlzjnupaFofS5w9K11CpuL4EOrGHAFLm4Qjq5cei2uN3+Ot4y4ZAUGmwE/nmPR99htfrjIRwS+EPdUXqjeYiaA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39840400004)(396003)(366004)(2616005)(316002)(956004)(6916009)(966005)(2906002)(44832011)(8676002)(5660300002)(8936002)(26005)(6512007)(52116002)(478600001)(86362001)(6506007)(186003)(6486002)(16526019)(6666004)(66556008)(66946007)(66476007)(83380400001)(36756003)(4001150100001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?9HMzwyUkpQknDhazd0CTJt0msfJmBb3MMYTVIH091J3EFnXzL8NBk1lhBsBT?=
 =?us-ascii?Q?RQr05y4PnC2Q3WtTgN7YCMSaXrzTtQQPj9i2apaN3wxPcjHwyXAJXlGy8ZY8?=
 =?us-ascii?Q?MVKJi6sm3XXwXxmhyUxYzNfRORBiguutsyCmGByVtvJPo2DOpXxBVxgXZ6Cj?=
 =?us-ascii?Q?+a1rb6N8iBdNrshjgabnUtk7ubIWLbFORjMFEbO6hTpTEWob27Xd/CI3pzRN?=
 =?us-ascii?Q?qmalUPE0cfd1S7VBRWyNlTfODpd3JGYQFEfrDnDhIekX4SRbejLYg72nLwIL?=
 =?us-ascii?Q?oeWNVzeTnQgZoAWbsDFrBQ8gL8LJ1HoKIPrtVPcNTkqr9WNRqEIDMae6W/9J?=
 =?us-ascii?Q?TiGb0JhrXNKLG/lLA6HAypP7FvqUvjnQiPMPFcwqUJXNlx1t29odmGEAzcjP?=
 =?us-ascii?Q?juSNZzfabgDTlHrtbP+sxVnQsSeojg/blDhPl0oj08HR9zGoOEk2BzAtxKZP?=
 =?us-ascii?Q?z1vKdRWUWfcJCIL0+rtNUy6LePel1yHVZjGdLHVCR2MFc4UNX8aIW33jvSmm?=
 =?us-ascii?Q?andvcqSBimf6THwHpfFaV63ad6hXycij0V8Z7t9fJpTGBAJvOXQskn/BbCMP?=
 =?us-ascii?Q?hul8TAiFIprIdXTyc2MVjEbeuzE2ocr/wJgoAK3ifQ5o6MwMYcco8TyZaaVt?=
 =?us-ascii?Q?zfV93OG2tDFiFU6fWU5er83caiLsZ/tzTuqWQAAxSjnO5PAXi53hYpJuwAMM?=
 =?us-ascii?Q?IDCF1FgCm4IPDt8tD38IH2KXu4TD7FWkkBBuif7ULBPMmDcbez+EqbTr7HFL?=
 =?us-ascii?Q?4cSfVFGRkAI4s6dVZ6Qmk+fIMEcuf3y/HZecydj0p063KO4vZwnDFyu7dlEK?=
 =?us-ascii?Q?ZjUiHeq5MSgXspDWSzpmHLj8ohubHvRZWwFDunI/DdszCuKXTOtNKMfAAujc?=
 =?us-ascii?Q?yLqq83kggXsBYDYgz9FKhutXdVG51NIOeOEXRaShoBQEb0CSS72buWyOk3KE?=
 =?us-ascii?Q?q5Dl0HcVUjFLNTAw6qa+kFjlrgx8HqgbpJ4KcxqzQCe7f7xcPI1cNHS0grqo?=
 =?us-ascii?Q?gdGY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2020 07:59:07.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: fcdd1c05-8d09-4d10-d70c-08d8ab06742f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbDxR08HKA8PtCRkThGRrMHZXWIBR6tNhVvYOTUuzYE3RU7/pyj7xWVmAX8UTv61brl4vQb8tl+Azx3eqvZN28PVmm2G5JWgBwj2MjlMO0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3252
Content-Type: text/plain

Briefly:
  Volgograd switches to Moscow time on 2020-12-27 at 02:00.

Changes to future timestamps

  Volgograd changes time zone from +04 to +03 on 2020-12-27 at 02:00.
  (Thanks to Alexander Krivenyshev and Stepan Golosunov.)

Changes to past timestamps

  Correct many pre-1986 transitions, fixing entries originally
  derived from Shanks.  The fixes include:
    - Australia: several 1917 through 1971 transitions
    - Bahamas: several 1941 through 1945 transitions
    - Bermuda: several 1917 through 1956 transitions
    - Belize: several 1942 through 1968 transitions
    - Ghana: several 1915 through 1956 transitions
    - Israel and Palestine: several 1940 through 1985 transitions
    - Kenya and adjacent: several 1908 through 1960 transitions
    - Nigeria and adjacent: correcting LMT in Lagos, and several 1905
      through 1919 transitions
    - Seychelles: the introduction of standard time in 1907, not 1906
    - Vanuatu: DST in 1973-1974, and a corrected 1984 transition
  (Thanks to P Chan.)

  Because of the Australia change, Australia/Currie (King Island) is
  no longer needed, as it is identical to Australia/Hobart for all
  timestamps since 1970 and was therefore created by mistake.
  Australia/Currie has been moved to the 'backward' file and its
  corrected data moved to the 'backzone' file.

Changes to past time zone abbreviations and DST flags

  To better match legislation in Turks and Caicos, the 2015 shift to
  year-round observance of -04 is now modeled as AST throughout before
  returning to Eastern Time with US DST in 2018, rather than as
  maintaining EDT until 2015-11-01.  (Thanks to P Chan.)

Changes to documentation

  The zic man page now documents zic's coalescing of transitions
  when a zone falls back just before DST springs forward.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 5368464f30..d175f0d4a0 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020d"
+PV = "2020e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "6cf050ba28e8053029d3f32d71341d11a794c6b5dd51a77fc769d6dae364fad5"
-SRC_URI[tzdata.sha256sum] = "8d813957de363387696f05af8a8889afa282ab5016a764c701a20758d39cbaf3"
+SRC_URI[tzcode.sha256sum] = "3e10308976b09305d15cb4a32ff75483421f2063bfa24a9be366a027e7cd2902"
+SRC_URI[tzdata.sha256sum] = "0be1ba329eae29ae1b54057c3547b3e672f73b3ae7643aa87dac85122bec037e"
-- 
2.17.1

