Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.67])
 by mx.groups.io with SMTP id smtpd.web11.6106.1602816080776801506
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 19:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Im0ixZ4L;
 spf=pass (domain: windriver.com, ip: 40.107.70.67, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liWXMKOtllBWyrMRQwZziY7EZil5AWc9NYCViKf3arEFy+nDec4EejSvmMq0pf+HQU6nAHyU9OEMumgep9WCpxcc1yqIb3qFnrswr2ZRJqiC871QyuOgsB8PLLEUqbP40xJfdbm6zjO5VoQtNLdH6lo1OD0ZymE2XPPGf5DS5OGcck+Y9JFo/tfpZ16mm6wcvQXpjd2DYFhhcmHx0JxDMPKzX6D5EjH6sIC5O8LEHyvan/nvj3DbMpZ3XH+dvSoU3fG3JOFyN4vumZ4zGAkeOmKpz9Bfya13i2tEfQHG6kt+OmXCBxyc09FjUePlzzsOBlnYUrqwmf5G2P4BT+7cYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SilhxjGsya4sbburYckDlvTAmB+p4HGwlEqVKCjY+2o=;
 b=IpgloZxt6SVtGvICc3MGImir9N3GF71scrfAp52Me7oJmIulY+uY+OfTY7+a7BGL0Lqfkuh4eGp2yxfQOM7pN3LymGGQyTPZaA3d4yrAPHRG2ne1g02qEFudB6cFuL/CFpjHPA/koewco68nNqkozGCNcN6KaanOC52UBind/Qw3Z6d6nowK8ZcSasQ4HkRVuVE2xxyok2aYFlJZAlf6rgogYiKzyifUhHGZuXdtL4u4bYxmMIKUvcyk0zTAh9mh7zl13n6anaGviu1hIC8RfliBagHAJOOKlaZ1PFydQvB9z1i405PxjmU8shHnBzJcHlnHGbAa6wyx91lhMr3mSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SilhxjGsya4sbburYckDlvTAmB+p4HGwlEqVKCjY+2o=;
 b=Im0ixZ4Lvj/O5zKLgMg1mbIynuMoomZH4fqgi8eshwj+o7dafVs+5U8WPA7Ej3ElIyaeGEKYeqZ4qWoXnft2bGPGyYKzHI8iaBrlbt31zthv/Il30/DF4R6xKtFztYsRZljiNd5fdkU7DHRkt2KepjylJA+3dhTJyyXP8w0gd2w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.29; Fri, 16 Oct
 2020 02:41:19 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::2d48:250:daff:8270%5]) with mapi id 15.20.3477.021; Fri, 16 Oct 2020
 02:41:18 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>
Subject: [PATCH] toolchain-shar-extract.sh: don't print useless info
Date: Fri, 16 Oct 2020 10:40:25 +0800
Message-Id: <20201016024025.28326-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BY5PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::39) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by BY5PR20CA0026.namprd20.prod.outlook.com (2603:10b6:a03:1f4::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend Transport; Fri, 16 Oct 2020 02:41:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f7ba946-4617-4ef3-dc40-08d8717cf5a5
X-MS-TrafficTypeDiagnostic: SA2PR11MB5036:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5036399A74503EFFB6B67BD082030@SA2PR11MB5036.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:31;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IQcUhQCBw9M1qV8DAVLEQN4EnzKpJbGRHX5Ulo8UOacQrxAAP1tEwt9owPtSszPWrRYTg897DIuUk5fAjzEXYK7qeDrX4CpvZezuV6PUx39wMpO+amQO9AvVNMpsMKV5A1fQ2E/L0kyX0sOTL7YSEemrRHgEIhqMb6kmbK8Z2GYGZO2mOpYxl1aiQhz15qGpjG68BwHXQiwRKc0gkfnlH062ad6H8KvaDUZva/XMcVTanD1GeeRi7GsN0fxnu/9ItiElUlEK4/5ksAPjNusjMOP5i5Uox67jC3yLXKThpGHXjydaO1BcJ3hlPSEzBCrAWT2anQS/2scJGiPFudtyEM1Voa3jTGnJC1bxR/e5Zg6LLFnJ7rpWQt9xrXRODXh4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(346002)(376002)(66556008)(1076003)(4744005)(26005)(5660300002)(6666004)(6512007)(186003)(66476007)(16526019)(6486002)(8936002)(36756003)(6506007)(86362001)(2906002)(34490700002)(956004)(44832011)(107886003)(4326008)(66946007)(83380400001)(316002)(6916009)(2616005)(478600001)(8676002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CEHRjTu5ohfVujq2+knGQVVBfRqex3vGX3IGx5dbOqZufxoxXWsOmPBigtAkZ/2oCqSDL/7HH3XlGS4rGloffa72lAjmeZL7L9aSCo3a4LsrJXCpIyyuXO7PzK1jNhPRFypBBHlYEfuUiDOExsa4wG9Wv20zopzLiBa+LeDPaaXX7sjRw2nLRBi6NPvsqN9PpAmR9lWI5Uk17yKPxEshaTum94PphWsOCbnTwnx9z6CeN8e9rIQxSH9IQW8/SvMOgEzwoPwA6sDNeefHcr0Y2V0gpYmQ+xeFw9b1F83LN2xX+bq77c7PhU5Dz3qk7xqtJXeb8r9wSOUkVod7hLvAmcUX8SZPIMCgkpQUK5UoF2PLhu5MoTgY9C0aJmXtM4V7cD2XcHnldEbHffOwT6misi564/pPk122N4HYkr0H3OH3RjWIRgsF0ZAQON4FU5bzT9jjsX5L6RigpO7jCTsTi2RrNpUN1eb8yhdanrASghf09NADURIofT8PaPsFJq/2mSRtDM/b8EdZNZoHIXklxPsOqjZcABudz3dO8Ez8NyBmUV9ug11esR8EhgaUvEBym193PkgvsIXw7Z0dE3fSbnHIzYxJKfAP8EPTB7RWiDaXUIRqRfE0zrXiCa/pkgB1Eo5WI/Bn5AtKVcrW9M+8Dw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7ba946-4617-4ef3-dc40-08d8717cf5a5
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2020 02:41:18.8433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13iLGIhYxhlg3442oy7iHT1RDsABOokxl7vpQEo8MxM6p84ptjK20O7xLJ2ohHpgaBnyDCL/3wbHpoRgQVi0Z+P4DF9IQj2TUlW/JIoEXfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
Content-Type: text/plain

useless info "gcc: command not found" is printed when run
buildtools-extended on system without gcc.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/files/toolchain-shar-extract.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 04527f891f..bea6d4189a 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -26,7 +26,7 @@ tweakpath /sbin
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 
-INST_GCC_VER=$(gcc --version | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
+INST_GCC_VER=$(gcc --version 2>/dev/null | sed -ne 's/.* \([0-9]\+\.[0-9]\+\)\.[0-9]\+.*/\1/p')
 SDK_GCC_VER='@SDK_GCC_VER@'
 
 verlte () {
-- 
2.17.1

