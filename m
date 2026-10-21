Received: from mx-relay128-hz1-if1.hornetsecurity.com (mx-relay128-hz1-if1.hornetsecurity.com [94.100.128.138])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9368.1792582585634721619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 04:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=ezLs+97l;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.138, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate128-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=52.101.66.120, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=duzpr83cu001.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=CjibF0truoPJoxuoMTfsYCqw7DBfU7hnloDFq5zdSkw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1792582580;
 b=A/dC75eu7b+jblspkG9xC2Cfg8yxLlrbmrdmOCOsHdiBaou1chFL01tm5mccv/OOmySxcZLJ
 QE7yPrb5gGYOptvPbOKx1wiA1sAG5sGjIA8csW3m/yCppgRnWJnm3o6a8r5K/WQUmYQTZYw591s
 ExGnOV6nTfV3jZgpMNobOYkGwXAGEHk36iCc//9CYU7RP9Iy4vqN5PrlIlTq2qkZlTQis0bKmsG
 23+1QXO8GWQQOgb7kPTyZvWSPrp7mpycuQv2wf52rERwT0T+go/FMfeuqU9hWTNuYURfgJ8gZx8
 eUbB5x1cH2I9wRw4YzRrr3f3135tIaRIccimE87pb1s1Q==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1792582580;
 b=F4fmII97d/2cCvsjBkFHcvU5CA5R0ZR/MaVh828ticZYCa/CU3stP7NbSv73DxCfD955rFSJ
 QI4kpGJPLNRwZC1KBoy347lM2u0e+bA1b3mBfkYnlyy6CSFd3rQy5xgE1IqBQgS1MKH+MQ3CPTL
 /l7iYRrAKxuRTfiHF+C56ee230j6ieM1UK/5AAluqaXkXD4zWXOu/3T2WpfqshN1gUdnH7QdiXZ
 Izu+N8JnDspKnweDlC/PTHUnkjnsJIG0ehyug0oqjCMFIA/N1eohgRu2+2AQIYeMEnoJcEooe5T
 8I+G8KA+YbdiCBAopPRVDie7D1LoxaftsctnaAu8Du32g==
Return-Path: <tgaige@witekio.com>
Received: from mail-northeuropeazon11022120.outbound.protection.outlook.com ([52.101.66.120]) by mx-gate128-hz1;
 Wed, 21 Oct 2026 13:36:20 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXmbwW+V/3dD1PPSMa/d0TTSJnhdCc4rwyO/z5tfWxPa6Y/YQVMoSNmGjsJzulOb49F5loOzl/mJjeGJCNvzz++dRxkmMLpSLWA+fEAMxd4rA+VnpQqfXQvUo3obPonaht+CcojWAk/UzS6C+raWcY+sp5puzidiC40xuZTswAWE/sa9lg5kx1T3CQS/lfE+D06bzCiPyY/MqExL85p7cCLfUONXutkRNvecBQAhj5eBaFwduJOjmYnWQYkrzccYXJOPA+ft+zZ3cgXYFWK/ByQS116z3C2ufFs/1Y7TJ5+xVvr5G0pY+6gClTTfcIJPpBFDo43cCoPz/wvsftwAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjibF0truoPJoxuoMTfsYCqw7DBfU7hnloDFq5zdSkw=;
 b=T7gAlpBLNCPIOzmHszeyFTC2ICOU/I+mcX7KFZupZkvSknC9u8O5ZiTVLpbmf/NDesMusyiXAr9bQ9+5JK7cJX/rpE8E6K1L4XQKcA2RjW8jRYAw8GyJJm23j/AcFOH7erembm2MgA6o2l9sY1jzaTHL1EtroEWEC8lbuXDuM8CPFmgzg5lg2Ib6vZIG6FSAptsIH7Hcz/RGZeWAnYPY29G6U3Eu4nzBrr2FzE8a0tyLmck5IWj02Xq4xI9ySkuZ5Hlcoig4qlTKr5IH3PjF0dVtfeVJJcJHskVibUtfrQYnHYCrE85TFM9YXSXm8j0u12koNhdwt7FlXKcOlvMAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjibF0truoPJoxuoMTfsYCqw7DBfU7hnloDFq5zdSkw=;
 b=ezLs+97lG4jmXsz11jK6yV3K+7SVYnTrQpnGVpY2yMTNdlLQdEFurWvrSRSQtNd67NMfdSNtV3uRAvxEoTmqtE0UjuXcdOd3dzfNMHMVZYsamf5BgezWw4N1R+Gy4w+S2b81wvoKNqxvKHde7nHIrUZBRSE8maq9FhawKSDIepfdwLKI4EIGve6yhxhpYKyLLF58s0sgJBjj5VNkZxwbAe/VC9O2XJqYFUf82gB3MME1Xx7YuIqGgdq5uWbd3zA1LpyX6V6eMbm2nm8deRkGENjr9zYA0OPBCuOKuSbyUh9uLzcz9ol76OTum7aZd8o8Ttwyd+9lvg9d+2fymBF5wQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:51d::6)
 by GV1P192MB2811.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:291::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 11:36:11 +0000
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58]) by AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 11:36:10 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>,
	Hugo SIMELIERE <hsimeliere.opensource@witekio.com>,
	Wahid ESSID <wahid.essid@se.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH] python3-pyelftools: add missing runtime dependencies
Date: Wed, 21 Oct 2026 13:35:56 +0200
Message-ID: <20261021113556.1544248-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0099.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:348::16) To AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:51d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P192MB1862:EE_|GV1P192MB2811:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d674bd5-ccd0-4920-0226-08df2f678149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: jsu8W96kfRrgroXLeC/msOTOCrAhArstd0XgFgV7q5Kx9WgSWjbQ+q19p9BB8+v/gidJpYfM7tKspv3Nus/JBAkowZ1MPMg39+z+7k69STzgcXd6VV7EKdjH/wrxDQ+I/EM0DIN9B2DnpjB9MGRvSoCAc9M+VUh0PAf0J9ipakufJRnYq+AbqYuKaMuUsLEMk6ZS9Dvljkc6ChqmTXLi+o4rLw1IqcSbW7lrTfr77WJYX7FOINzlF+0pzHaoIjpJtLUww+/Ah/0wiNcwv9jaGbOGK8rGCaSXXWMfmVW94EbU8MMcjUnuEUrhCgZsP3q1KfKHWl04FQwbv+/UIZU2iZiREtN5nixKJ8vP93h+qtaUK86BlWNEECziHhFWnlvv+WJ/NpdMnw80qnT0aGiddDDOETVEN2GtLHv0gP46IaEku+PdRqlrpBMhd4lsbNE9ONh0Ys7e+lSBACui+n0XP7XmOnDCn1x5/LNGYojzaSL1JtpnR79Lm3hW4PicX59pJ4NalQtoQXO53PLCgJ5JMEMDEJjyCA5OmmEsgJ8K3fdwChWbd06fmw7lIedUIhKtXdX2F1Txz9ZZkaqCyYwH7Y1LRJmLR+OF88fekW8m9lRBLrB3KCrMU3P4MbEOmmJ49z80TwX+iVJqWoVCLEii0GEMEc1V1S/z9qPsR0EG/EAmEHUMvvpshQqrbcXT3IC/Xp5Dqg3l46B+tjisqPOgRT+5jLyOXpEgdxelcQ6uwBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P192MB1862.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kpLiohl501/OA7V0wYq/T4YZpygyUX2yHuY7Tlt2BtmVQ/lWq73BEqVhspi5?=
 =?us-ascii?Q?ymydE07qs3QbYJFLK83U/84VVxCZOHSf8TVoz63DLwre4Xgg3b0KUkDU8mxz?=
 =?us-ascii?Q?vX3TOmMbTjb1PAZe6BdSl/shevwEeeSn18HlagcsXnJjyWupvN0Jf0JzdCQU?=
 =?us-ascii?Q?zB2kf74PhK49JHzZ4/QFLQEnBIKAiXjIPaTzEhnRBso6ec9hO4Jp3kQpjwKc?=
 =?us-ascii?Q?pw8gZ7DaLqqAVcyam9Z9sNHK/CFgnO1z+sOUERY7nW+hF5Fs/JYqlVASSmBF?=
 =?us-ascii?Q?Y63+a7S3Dv2mqdjDliurwmw2QCZktZyTi14WHdVEhn1QQnH3Bg9MSUweFWLc?=
 =?us-ascii?Q?WK4G1hXaxskWLzqoG+NP5d8BY1+nga5LdLyKsBuf0VY4MuZaC0ishbzUf+qL?=
 =?us-ascii?Q?fOAzJjstDvrC9eJuBlrKnwsufMHd6/C7gR6t+f/lLLMn014vRMSENeOPoKAv?=
 =?us-ascii?Q?SE+kZvn81w8NP8OslWDXKlXNpTNyZjhk3AlX6m9GScryWb33std0R3i975q/?=
 =?us-ascii?Q?HVFKlSXHqXEVllu/CwUE3AcpZypvDAWFf9vqwgF7t/4FZHrhcv4bbd47yCxE?=
 =?us-ascii?Q?FJS6QCzRy+3q06GPsQQJyNsvaa6as3QNCYcmtWoJdvWM+aFK9jLTbbhuwW61?=
 =?us-ascii?Q?Hisg56syet8AdOMmbs5DvNh68iJHWmb1NJTbuYGvHoDoaEGkaXo6VZYzfUYS?=
 =?us-ascii?Q?o+YjxnJ9e01oPulE60A+S0cDWtTjQGzBnKGaovygQNfQYfVjcnbmTpWzf1ft?=
 =?us-ascii?Q?H1TmgeSGZ1TDLzW16NhO3VVCLrE5hwOOR7BWw0WNSMBQY6/1K2oZWez23+Ve?=
 =?us-ascii?Q?8uGDrSq7tiuPiL5xNONa7X5Xm63/ahGufmRBujElA7k/9eFJn11xXZ/IhMy0?=
 =?us-ascii?Q?7GNRnyOTAPUJTV3dnAIau/YHUluMltvfEvm199TlHojqcuZ/lUTUXWoFVYmu?=
 =?us-ascii?Q?nNcxLaJ1Jo5xYQjpy5VmAh9akPylFe0Fy5zpT5Q4u6fM4KEghsVhM4hPx7fJ?=
 =?us-ascii?Q?buL8i5I4mFMnJAKx3p6G6j5wEfSi71kXoft71GGgJ++Xs+wIVcm+rxj/9rRQ?=
 =?us-ascii?Q?JOjLU340PyplrRdfRv5YajuaUqbR58Cj5jvkZ7NiR4Fa9ON1S6is47eRsUy8?=
 =?us-ascii?Q?AdiEEa5UMs/YN0mj1NXsDyLnM9MEFYKl1DLSDs9B61VYzMteFa+Az4cMLBDH?=
 =?us-ascii?Q?EY6TUI5DoKGR1AyeiJ7FNiOLX6Jdp9hx1w1HbGpPJ9Q1rRHtsO5/Ws2HORW/?=
 =?us-ascii?Q?lCsyXvvpCILniH3F46Ylw2JR/ddUAgQfLm30jA+JAnHt2WVxGwJS7hNkDhnk?=
 =?us-ascii?Q?/UzdTUZN+ZTL26rc+DcXsKYkvypPp827kuP7u+JxKFHNnA2FsW24zt9aWsHe?=
 =?us-ascii?Q?kSuI1jwm8LU7SIpUdmLyokH5Yx5JlnrOdUGH3GScvgEzrr9giGMHDDMV33Lc?=
 =?us-ascii?Q?80Wpgyrbur261nyinVGhm7SnO1jrBlAEvsE7kWegJitTHGANadFJFrlr2LDu?=
 =?us-ascii?Q?sGLbSEwvcHLYeJaXsSmRB1a40U7WRqOKOWmY7iDkVLDcbgIclferVnuxnHq6?=
 =?us-ascii?Q?WHNsT1FT22VzGBxUOvzSSgMDCztVxQcJfrLNXFON8zNe5ujXN5dVxDUixYEy?=
 =?us-ascii?Q?mnSUjZKjMcXeUiUMVbZRfUOQHVwanbgxreXnh+rdmVdGDYusZotLHecTx5Su?=
 =?us-ascii?Q?bC6S4pm4K2JZa0S4ZDfwuKmb0B9F6B9ixmPKMbdKWTMj9oKBLwSpCwv+w12V?=
 =?us-ascii?Q?ExP7hPgyig=3D=3D?=
X-Exchange-RoutingPolicyChecked: qhUOhjMcX7LP/Pi/xbMieqNa8wI8gA8+WA0M9jQKjj15P2VBlpg3B5Smic0qoTQ4NpxbW7lKC9ZWo0SLzXGektfwu/gFxhnjsl1+475O+YV8WGeBmrcpdvOarw2pWUYi7CI9ah/D9exmmattYsQqadk91/cd9Dr6ul6aTP/8ONrTejKM3qc62jdxMGOahMW7I3QXNaIAc6du3dRoruIBtEcyrP44aAQ7Uj8Ue8fOmAfwxRf9bVt7zn+ZNsYAbjbydxbiWxGjqE7nFw+kdPMlVZpcSPXBbzhS6mDf5K3wObOsBPe2DtLDOs7PSvod0WHssuble/wfcSGe1vSROJw+gg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: CRoMKdwb9VNvPevdpoufvDXw4kFiheV+0ImvcZkyN5J+16xyQWL3cIq3PPsFhG3m5WKV4fq40+L4QcbVpQz++wzFHSjeILDGWhtDbod+C2q5ZfWr+GlrHe/6CeWI1hmj+XsTZFXbPltH11CyssHpFbtGwTlcEFIoqCjiF0XAUxWtgogoACmq2U+lV/deZ8jo055pC5peOcTdZfGGnym11dZec+l7AHePyToXokzQLfMecPVORtFPCusZyQodmcIyraveUE3MR3NeqAq/XJubT5AIgxdoMM5oc91pSf078tJuzXx4uB/PEosQZtncS8g8utXKw4W26tTGNdx/mOAwyvSoenHvuJlhhSS/GXN1yGq4z10wWR5vcFshjK7oKAFmwcpOpi1riyhcDGippXNp/iXnj3Nku9z4DlSJQJY5O/CZrybhmohe8qH1aZX2te1ziF236JR/g4KmAyX0raOQsH1merazFp6H3ukJTTPzvFeVIMv/hnDZKsfokui2dWON7kZg2sBPiHL0u4olJx0xuPBXNmVPMfTmdFb4/ORkHgSpT1TWR9HwPDB6l1aDCqm+7KpT2hno+Mu+VzlHwQ1wQCCNVtnQFh0SIFXbDgMTCI/UFM2PU4qO/WKM/qbWegzI
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d674bd5-ccd0-4920-0226-08df2f678149
X-MS-Exchange-CrossTenant-AuthSource: AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 11:36:10.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzqvaacwjaIPXIv7zEJTXPQmKbPSIOipJWfyMBtT/KWYbWdyLchMVsP/o7JD033zR+M7UFIDykILs8My4ZltHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2811
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate128-hz1 with 4j8nKp43MyzvQ5C
X-cloud-security-connect: mail-northeuropeazon11022120.outbound.protection.outlook.com[52.101.66.120], TLS=1, IP=52.101.66.120
X-cloud-security-Digest: 95350dda34de56c8821437568d000c4c
X-cloud-security: scantime:1.810
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 11:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248392
Content-Type: text/plain; charset="utf-8"

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

python3-asyncio and python3-json are needed as runtime dependencies of
python3-pyelftools else the readelf.py script run into the following errors :

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 87, in <module>
    import asyncio
ModuleNotFoundError: No module named 'asyncio'
```

```
Traceback (most recent call last):
  File "/bin/readelf.py", line 30, in <module>
    from elftools.common.utils import bytes2str, iterbytes
  File "/usr/lib/python3.14/site-packages/elftools/common/utils.py", line 11, in <module>
    from ..construct import ConstructError, ULInt8
  File "/usr/lib/python3.14/site-packages/elftools/construct/__init__.py", line 36, in <module>
    from .debug import Probe, Debugger
  File "/usr/lib/python3.14/site-packages/elftools/construct/debug.py", line 7, in <module>
    import pdb
  File "/usr/lib/python3.14/pdb.py", line 77, in <module>
    import json
ModuleNotFoundError: No module named 'json'
```

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Wahid ESSID <wahid.essid@se.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0dc1a2f9df58cf2dd1418426e38e95372aecdcde)
Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 7e50cef248..76cf22266b 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -12,4 +12,10 @@ inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
+RDEPENDS:${PN} += " \
+    python3-debugger \
+    python3-pprint \
+    python3-logging \
+    python3-asyncio \
+    python3-json \
+"
-- 
2.43.0

