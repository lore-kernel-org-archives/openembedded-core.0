Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web08.1809.1610067882624910756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 17:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EfeL6FH3;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZoJWXMMMtLffohXWqCIlHlaG9KVVLQJSzGjG3YYx7Qztd7MFHdqISL3SpN8y2aKUCDKExXQMZ3Ck2O/3b1BQrymGuA1x0sYjKUhIHvKX8LRzZkJnBbv5CMVQCoSpjFnCuxkQ5Xy6J6WzW7Q2r/tRksji1JwMtreWxKnjbRpl7OiucN0JY8YgiTcEPRq0vrqXdCJj9dwpuCy+UHsLkXFLkef2MRz8WgohixIEr3RWBAcURyvFc8fwWM3KqcORcHaqemceaB/DFxiEsg7r+wqA96vu0z9wmoKXeDpDiN4foKS5CRkQVKcjSiK2nj2RQYPblJDFg1OZc0InybRECcowhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11R5iB+5RiMAliwPZZ2TvcM0tBCXYjUpDNucYnbx1Jc=;
 b=clkB0Ej4MTF8vxlvo8e4yUlV1VzGrzE+SMaF2uVM59siU69YhpauVOlikMJGBCcZ3FJ7z8iHC2M95/WT/T5pZQXJjqdEdG9HtXRRUC4J6wJjitZH4VRmZo2WsKKxWZ9h+rxbrXhTKM0A1TWQAQs/mb+XWu7g0KS8og0tDwUw+IqIdbLesdkRII34wiKIr4FyRINGYgbLGGMnD4e5MsMK9jAN3j2MH++3aIijFYDvWOKzQarAvkyTtwEGVwfR7rljPyKnuFEz1qbI2rtb+ieoLXDGzxheZd9CcNTEAztOamPt/gjcfqGJlnIqI6hELo4hbUocAP/1McNrkqW4fYdqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11R5iB+5RiMAliwPZZ2TvcM0tBCXYjUpDNucYnbx1Jc=;
 b=EfeL6FH3eBGwhJqVkaPqvMKoa5OrP7KnsII2ESKddtoGasGR9kIx1pL0igA0V91EZS1mtDlGmY/wRS3xzc2QwzxvuUJ49F5yDkhb9fDBw8MT1cNucCu8nSj0N71F0cHkqXT0VhtjLTIkeTsGBi6qTaYT9Egc6F4/fJX/QaHaiOY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB3294.namprd11.prod.outlook.com (2603:10b6:805:c4::33)
 by SN6PR11MB2573.namprd11.prod.outlook.com (2603:10b6:805:53::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 01:04:41 +0000
Received: from SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4]) by SN6PR11MB3294.namprd11.prod.outlook.com
 ([fe80::b4b5:fc79:127b:66f4%6]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 01:04:41 +0000
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/1] Customize prompt string for SDKs
Date: Fri,  8 Jan 2021 09:02:59 +0800
Message-Id: <20210108010259.25628-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210108010259.25628-1-kai.kang@windriver.com>
References: <20210108010259.25628-1-kai.kang@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:203:b0::13) To SN6PR11MB3294.namprd11.prod.outlook.com
 (2603:10b6:805:c4::33)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0097.apcprd03.prod.outlook.com (2603:1096:203:b0::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 01:04:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d77269a-2a22-4078-59fc-08d8b37160ec
X-MS-TrafficTypeDiagnostic: SN6PR11MB2573:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2573F78F8E81EBA654E9FB5695AE0@SN6PR11MB2573.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F5fBCEsyEXFSoarLJJQTvRfPLYevYRHJix5BkhKd67CRKmSKarjppD3ZTOhukHocK9JsiTjC5oOw+gJA/KmvUqW7d+XPqJVmUGeAGU8kAI/2CXf64ttEjGguwsGGbQaga7LSbay2vYzKOH5OOJI7MOmTtRUZkiZJ3qyJ4FCEqCjAk3Yy7o/V27WJ/UxtjjSAMLTgErsVUKHbHaxrp50l6YbxqLXXmMQxr0buTxbD/u84aSTQvMDdU7uQW3EXRAmOJijwh1C0ywXEhzM7TCK090z2MJOpVCEjyycTDAH0AMibFVAp55Vbj64o/VWwaK3SJnEPIbFJjb5MQ1viwjnd4sujdn4k1Kitg72gKiylWAhPri3KAh5gNxFkflYXH73kIHgoPAzxTugSBUDMc5XqZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(396003)(136003)(366004)(478600001)(316002)(6666004)(6506007)(8936002)(956004)(66556008)(16526019)(186003)(66946007)(66476007)(1076003)(2616005)(26005)(6486002)(86362001)(8676002)(6512007)(5660300002)(9686003)(52116002)(36756003)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?kLFfKn0rHASmbJKs9CBsJn9q1IzmN50L9NKnrYELtMYbUqcpNkPYN8caTf1y?=
 =?us-ascii?Q?trsQUSYkuyn4XDpJXsu3D3EYXYuWMbqYkQeceAk3lonaaD1grBPPgUM0OTM+?=
 =?us-ascii?Q?NX/PU0EOn7RMZYEflkewzp1bygfDbDjgtSJVH19AuJBoZCWBJo3UFMgOlpaQ?=
 =?us-ascii?Q?9spDjNOX+NqP35QBerAv+z7GeqcUQ8KdDPcwsUDe5iJCc2nH0I3OK060WflQ?=
 =?us-ascii?Q?byWcQ5mbzdwsUZDrgDZPqMREvPEqpWFE1uw4+n3qQ8Wm6r4j917/aDu1Xl+V?=
 =?us-ascii?Q?MzxE7ZHXC8UJDqGYhF1cprwxgPZL99j9K99Kk9/rYrUmAQRpXDk8Ack6x11H?=
 =?us-ascii?Q?4VGksVEZH9fz/5LAU0TS0A0iLwHm+s+WRDLD9Gm7ZXoj+o0zoi/mylTjhofo?=
 =?us-ascii?Q?P36TrPsXDr3JxHxb9Zqo1N+ZvaYh6hjMrvqQqxBUcDUTuSa51wADsm8JqBnp?=
 =?us-ascii?Q?EPjAbHlIKJPsGDSPPzuTjyZ3JxgryYQcb2WeElGksfsgufVSbhenDIcikGI4?=
 =?us-ascii?Q?EyHOyg5OJ3sMNU8HGTrP3fSoOfJxpyKOWmXSWIU8n+Z79VOlbsFCRmSqO5ry?=
 =?us-ascii?Q?6tiymQA8zg/cTLwhxPbesYMEH9S/Xx2UpTdlf8n8qVfMpWWSAHBf+APpenhD?=
 =?us-ascii?Q?x9gB3+jq26vTU6zPVG7CDEKjVJZlMlIgI/c0KNHoLGM5yVqMgBAwRnLCGZCn?=
 =?us-ascii?Q?syLT+34XdHMfPmwLlOLfcJmHKdHOPa7fZftCben4kH3UVbHP/IsHT2db88Aw?=
 =?us-ascii?Q?NdNiJ9m1/2ZEAaWK5duc3TWT3uo7e8+K5DC5CsuEx8WylMOo8vuWFVPpvYO2?=
 =?us-ascii?Q?cyDYIz2fjPmMORKe3pF2TX2y+E/X+OyLqOlfrWYxsY0kHchY+zvIG+Kkhl9J?=
 =?us-ascii?Q?hTPotnGD54ogs3UfqbcSvpaC1Oo4pFVd5keBL3T3RkTW3oK2i3+uRmGK15TU?=
 =?us-ascii?Q?8NwIxSXSNX9jIblD3UkowDR/EKi5X8UA/b5DZ6k/J28=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 01:04:41.0664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d77269a-2a22-4078-59fc-08d8b37160ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2HzK7NZB/xhLtlQ0IRvXHoqZraIsSj3ELCchBtycl7FpQQjQIGxKApA9QUqwYLpXVS5uHzXhppYtotEdvN99bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2573
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a new variable SDK_PS1 to customize prompt string for SDKs
when source script environment-setup-script. The prompt string of SDKs
is set by default with something looks like:

SDK-poky-glibc-x86_64--cortexa57-qemuarm64$

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass       | 1 +
 meta/conf/bitbake.conf                       | 1 +
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..88df373d0b 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
+	echo 'export PS1="${SDK_PS1}"' >>$script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a04005b0f5..93687f9950 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -424,6 +424,7 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
 SDK_NAME_PREFIX ?= "oecore"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
+SDK_PS1 ?= "SDK-${SDK_NAME}:\\\\$ "
 SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 9da81d5523..59cfc64ce8 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -71,6 +71,7 @@ create_sdk_files_append () {
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
+	echo 'export PS1="${SDK_PS1}"' >>$script
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
-- 
2.17.1

