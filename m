Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.75])
 by mx.groups.io with SMTP id smtpd.web08.6491.1604631293936099309
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 18:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HipvH73b;
 spf=pass (domain: windriver.com, ip: 40.107.223.75, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=muqBzWmnyll7nmTYS/uLGdBAlKmUZpsmGuls0oB22JtYUGrtywFsCibf5ZQqWzo91E94dsbgKzo3L3P9vKz7dWyTcQ72dIzKWeA9B/hEsNPBLxorvrBv8EN20r13NJVZKd0U1dGC/4h0LQlFYToey0LdUMdMYXrA5FKIl6mgxKYYXTSL48RzGRbyECIslkFsK30APg03eGq6oEMVluAA6thn6LVc5uPsfnvWOrTYPuh77swbUSBsolq/MGaqRQ5mYLZsc3LsKy0qWnh4nJ5ME7JzLxGghMEgXFg+ct6Qze8JeLW5ygaSRSDAUhK2fMQB0JU1ukDbkpIvF7yCp0vZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZcZWA3HFBXJQsPTjl8CLKHKzuTOgFod39ra6YYl3CA=;
 b=QCkEJi8en6dYlglcjZu16dIWOCbUfPhubw6fxZEwyp+tL5oHZWmPI9iIVMa4DKDz+3i+CT1m4d90ihlPd4AMyZHGh0YRyO6Uh36pWsGkSxhM+zM5T7yqpoOr7+F1ZhBpO59ypIhtXmolc51g1AElXwAf231O/rEdjgRvR/ckPmG3kyXalj/hzH2Rh5tcpphEU27OqAFxUTKsS6GYe4FZgV2FdPQPDp4EfztbDA7Ll4OI+u1V1WqRK0Z1So5AIHbl7OuGnU8Nh5WBFDutNxX6IkgOAhXRv8H334Qrsde2eU44CRDzkP1ql3/f5F0bOD0y0vhiZooZIRKrbfAkClEIsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZcZWA3HFBXJQsPTjl8CLKHKzuTOgFod39ra6YYl3CA=;
 b=HipvH73bnnywFDV43ajGolRhNoZOAUQlmH8iHNsW6VtDBON4vqQAShEwpp68GgxcFDgY/q7v9dlfVv0Qw3ZeprLFH3WyQNCJfJGORR78NGxg1r9n3F45k7ytol/1He52y+buVY4XGh9hsrXej7xFqmDvtOI8sUM1NPCqo3JY9Cc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB0047.namprd11.prod.outlook.com (2603:10b6:301:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.30; Fri, 6 Nov
 2020 02:54:53 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::d844:ac89:6b05:ed98%6]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 02:54:53 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] dhcpcd: upgrade 9.3.1 -> 9.3.2
Date: Fri,  6 Nov 2020 10:54:27 +0800
Message-Id: <20201106025427.7269-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201106025427.7269-1-yi.zhao@windriver.com>
References: <20201106025427.7269-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Fri, 6 Nov 2020 02:54:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b6e56c2-26b5-4bbe-3141-08d881ff55ae
X-MS-TrafficTypeDiagnostic: MWHPR11MB0047:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB0047A07B407287A0C001176EF9ED0@MWHPR11MB0047.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cgcNzZeOIzHon0JvNO7TGItxSBIkrg4Ar8fCMIv8N5ZD2GsZ4F25uUl4VZxOA1N5SguANbtM+eZHqutGReh7aWQsoMWJocZP8Otdr+KTSSHERNYWcDmcOWIpbgRKd6SWTIuR+mcSZqSO64+Jb1vcv3XJ5SvDEYIMQ17FP/kFkp2enCv9PVq1Qav85ve656+jad0F9nz2cR+HeABT1d9gmp1YQtz55BtZxkS4RiSrpQ1UsdV1g81CEw+a64FFMcQZUZ8MXQR/BgKgocSeNL8+/NLxTqGNU76Ryd2NEBF+9IMXOOf5Tuw9Sj+5e9gVSXL1Y0SdZzEFhZGeKvEhq24P0BBW8BH3FWMcdYcjUmxkKeckn1h5U6JnQh5GSriQzGuDbRfKyVgFc3gTgRjxHrv+lg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(39850400004)(376002)(8676002)(186003)(6666004)(6916009)(6506007)(83380400001)(86362001)(16526019)(478600001)(2906002)(52116002)(2616005)(956004)(6486002)(44832011)(4744005)(8936002)(1076003)(66476007)(5660300002)(66556008)(316002)(6512007)(26005)(36756003)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	tcrOJsjkaxM7y6PYXvrJQuc0U0Jub6iaLf8GcZvDcBfaRd2l4R4M5NzFXmpEx7wgTlihThxPVWGXnR0ullOpN2cYx+rLmZkvFUXKFZHKyFGMaHc+fdO624DG/Be+b++j/2UoliTLhPC8dw6lWL7KLdcAZ28UQaT6//L0RuQxmwh7er4KOSjpH1mKhhGUGLmCJuPNKUIutFZprh7+jBCYc+64yHx2fP19xA+I2VwMxweKnQA/1tQlXZpgRmewxEW4bZszf+kKR7ke7vYClg49SkKVwXWnRAiVbpPL+3AiSm8TAtfL86Nv4CSCSHFXA4TZSyWRm/v1L2YWjpRY4mLWL403/iIeytO6mwpz1tUuwhOb5CBvgHyo0aJ4wKYX9Y4oXceaGj4ZzM/6V3b7Egax/XbZ5AxeA2UitkSZezF7mshSOB0t0vCMW7NlAl81AbFhxg4OjPpZwjxajWsQVPJ1uLPLSR7bGr4GLGQkCMloN1b8eddp/hk57nGjC6cVy98CTPA0515PbPIbKQ0cd5+0MObiMOcjsj6KcGzTlE2GXhXjBRM5Ingtwu71TjCUsaT2OyClrQwydhe2CZTpQETA4zY8tL5qVCvB1Oqp0NDEsFKCLwakFPvqBMMBk0WhAKoR3SHdWsRXstUfnJzkHRU7SQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6e56c2-26b5-4bbe-3141-08d881ff55ae
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2020 02:54:52.9606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bd6eQhxEzagoB1Kq/zcdlIGcIOIahSq8Wo4gZI8/5595SHZwdPqmQxIpmZ4nFUgrpW41SOtc6oii6ZUKT7kLlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0047
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcpcd/{dhcpcd_9.3.1.bb => dhcpcd_9.3.2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.3.1.bb => dhcpcd_9.3.2.bb} (95%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
similarity index 95%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
index c572868c7e..cca60ddae2 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://dhcpcd@.service \
            "
 
-SRC_URI[sha256sum] = "a0843233fdaecee971c38ceda53ad1450bb7b83aefbf1fa9642213224a9c415e"
+SRC_URI[sha256sum] = "6d49af5e766a2515e6366e4f669663df04ecdf90a1a60ddb1d7a2feb4b5d2566"
 
 inherit pkgconfig autotools-brokensep systemd useradd
 
-- 
2.17.1

