Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.65])
 by mx.groups.io with SMTP id smtpd.web12.5262.1605602008323083492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 00:33:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=VNSB1UGn;
 spf=pass (domain: windriver.com, ip: 40.107.237.65, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2JidB3XygjbxE6VwpsjLm9ylfQ6W4CGvoP3s3qG1wCYMLfMcB5zKingO+9Wux7hWUxa3WVaVorWXDy5WALqsnX52noStcSJ58klLBkyVFENZkNkqZV5M903kGRKTVrm/0hoqR8vzaNh8pqyE3jMfJy1NZuI58sDNSwRw/WgiZypOXSG2+7vlQThqmuKHGVUogKA2mYmaD67TSGe5Rn6crUIYCuS8gqT/aCIeph3Lk/mQ3KjgFlmRBD2idJjcI9iIzmucxB7eVNvx9F815bRRhihYQeWI8ibjxQAnCoQmc1Z9v+GceXN4wSkga+38+LpaU5k69lq5IxmRUahEvlTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3qik9+THUH8Kfu1fl2hUS+fb7YzWyN/Lv6+d5+B9G8=;
 b=g9o8ESVf58k1peOCXzIM8StYxh+LcDgWR9hX8yRtyj6Kgh7NcMbzjwElcJ3ZIbpb82ZaiyQ6+7omhUQ+hQ+Z1UxIQ1VIZnVRJT2hHfu0vGX7gaTXVgJSRSffsOoZxB0Cet2P4lzZW10pzmLka+Du7iApsHrlm3EvMjAGJ0j/R9ssOxE9r87Qdx3n6WT93PhsuZCRVfWw6nDyAgGvuVcDVX2tFpahvhdEYnhnS/m7EwviP6zWiBYylLctH9bzTh68KIBhzq00CLG8VskvSUMpB9hfP3G7SKeMDuYSkqyS4K+MWeSWGwJhGneoZkNCQsJaUou2T6AsvTX8UWGGNtxhfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3qik9+THUH8Kfu1fl2hUS+fb7YzWyN/Lv6+d5+B9G8=;
 b=VNSB1UGnDsFnvrMn1QzDVXIu2mDO1xSPU3CEW1QtU+ZlXdXnSSFDV3brtmADXQkW8I3Rr1RIxs+btd9I/vHYdud/ZuIkhZmF3/tH3+yE1TyyA/1wYRp6F4gsffa9OMx8lVDFMjRhN1+jHKVMgsaLzc9muMg+jNNV+h5dxElZ/5M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 08:33:26 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b49d:2c09:ddcc:f5e2%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 08:33:26 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] toolchain-scripts: set PS1
Date: Tue, 17 Nov 2020 16:33:09 +0800
Message-Id: <20201117083309.20327-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:203:c8::23) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HKAPR03CA0018.apcprd03.prod.outlook.com (2603:1096:203:c8::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend Transport; Tue, 17 Nov 2020 08:33:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9400060-0a79-4e5f-de78-08d88ad373db
X-MS-TrafficTypeDiagnostic: SA0PR11MB4718:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4718EC314EED88AD6A081E5795E20@SA0PR11MB4718.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LUuMuYAI7B2E83GjRTkBUkusSPWK3EX0muBvHONAQRGRmbjZHkUzXpyHitol8s3xkFgetXg8C6kLcuOrbwVoRUt8DZY2EwQXFMzWO98qAmVFxJTBKfoEXCWUE9nBtBnUtSGsh9i2fYYOvr2fzeMY9o1avCN8Y3709ic/UIbdz3YcFmwDTAjZGJ5OvTy8LrgFtdGF6DFcuFS8/WdjES+VhY4ZiK6zmBNemfKBE++Y3VzqHQb/uxJabJZ1RfAiBoC73Kvbl+J0vv30nV3Hr45Hfaera3xn9QPxqsyMgENhRzlvmyLcswqRLHd7vfiB5hXh/tCbufsqz7I4lHwVpg205w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39850400004)(376002)(346002)(186003)(86362001)(26005)(2616005)(9686003)(52116002)(956004)(16526019)(6506007)(6512007)(8676002)(8936002)(2906002)(6486002)(6916009)(316002)(6666004)(36756003)(5660300002)(1076003)(66556008)(66476007)(66946007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rI2jJ0OAvfyOcDO7jkBRaQgDAkWBw/3doqmqTB7OWKtoOpkPgO+Cp10VCnvMr32ZqWpEkoyEbAqi/T6DQcp5s8JIcUXz+1HE7y+KFnIr57ivBNb4lYDW6EqoI93fIfZ2yhvU/s7eJjKgcTieksC1rKFbzH2PXFp3dPoGMjxaZcL1TjSxvxwChqzbSlXQsY8lkJVv+1WpQgRZI0CcAia38mzNsDGG9Kk98nL6klKQM590Y15a5CaSFATjEJD3JhwOc42fhTRExNyEMVJA+a7sHtCRvalwvconQ2ysTt5x6Wnd9afWcaTuRWBqHjgMM8C+0xeUg32n5hXAHZUlHvBq8FgjLr+h1l6Gibd0Se7S2nuDFzJE9hEthizFpqTVw6zXkjNf9mJPRE/4KgcFKEg0mawucGlPOMWwxKinFnDoxLfUzT/PUDadMxk703tsBu1N/WQuhHmtmVYhHD93z0FtZyq6tpk3gFd/6fdetvh5lYu/YhCPUJmMcg8BfrVvYbWhckJLutxM/zlxhiGKgrHep81+TMRonfpYdnhjH0sbXtDI7Gqf+4X6kGm1Oro0e2+5+eCsBQUTRBU4+hfLYJYTUUEPikGKLCaYjLEv7uQDwLjgbjwlBSxmPwFzvQPW+WMmjlpBZ2Az22zG+y3eUO6fwg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9400060-0a79-4e5f-de78-08d88ad373db
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 08:33:26.1825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w0MwHxCUUCMpTHTE5tAz6GbcUCsBOOL9um3M+P1stFYMejPFO+CcehfXEqWbKlhkIM9uaw26EQWIdT3CJm1M3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a variable SDK_PS1 to configure PS1 after source
environment-setup-script. The prompt string by default looks like:

SDK-poky-glibc-x86_64--cortexa57-qemuarm64$

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..274dfcf7e2 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -8,6 +8,9 @@ TARGET_CC_ARCH_append_libc-musl = " -mmusl"
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = ""
 
+# PS1 setting after source the environment-setup-script
+SDK_PS1 ?= "SDK-${SDK_NAME}$ "
+
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script.  Remember that $SDKTARGETSYSROOT should
@@ -45,6 +48,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
+	echo 'export PS1="${SDK_PS1}"' >>$script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
-- 
2.17.1

