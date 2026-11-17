Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18819.1794924811826227229
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 06:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OPvGo/4m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5781a53026=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHBx3441075809
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 06:13:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XMZqDz/CV8GY7XHslV4ndKX8Py+WKDbpOmFPyqCS1bU=; b=
	OPvGo/4mBBaGYBHBHgI7fqSTzUlv/jhluNPqe46ZA87GV1oFOuY8sx32JjD8sXzX
	sXPn70q7AKcsOSo8JMJAExHnobeBovfZdNKzHa/7T9vUS5vuOsKd2ubtb2325HTZ
	vtIbFf/afLPHfdMnBGbKi/WeN/TFAw3vElqzEay3SwhGV2kAMW++S1fpNN7id2YJ
	Z0UZlIIUFm6Ni0djATzZpk//Q3FuW6Y3u3E9EeErXA/S4iUjNYHGxrP1LT5P8lmc
	AUpzKobV/+2pJdx/ZXmRmvT4IzOXshhMhcxvl+LbqG1F9kTb1yCfbi2lXWY4kaeU
	SWle4v9t4hsrA0cLQwFlwA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022077.outbound.protection.outlook.com [52.101.43.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxr1h4mbn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 06:13:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pm2kYh24f4Lp6sII0unx15pQcU/E1jxxKD0yT8jtih2Qm2Yrf9rZRYzGrYB+DftGjJVUXul8RwWaisuM3cVHaDrtThhSpvULu9OfjbUlQLMBw30Y5RHWQ+DDU815kDRG5sWuija2UaR5CNHUF95ykmwjOJI8KzPA9fIMwM/g0OwOhUbp9NzP6+GT3MVQf1NpH/pZZUxL8k9Z/WxpI41/H8tGDa/4L8tl0mmvauwtAYmVlzNKY/CMrPLFNm5uIxAkF/OJTYudH4+taDlX8hNXfEwJnHywEbqrFpJSl6FBjDLVYj5AbpgGtgKzcnyJgeRK3guDRC4tb/LU5QYCKKMgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMZqDz/CV8GY7XHslV4ndKX8Py+WKDbpOmFPyqCS1bU=;
 b=YmgtHb0EHSilCiQLc0IsRaewcFUlO3V4gTM2WIbylYBOrZQMll8rJOcLi6NqjJ+kpgOzdJoyCQAI1nSPlRIdLzYk7hdVDLIr/AEY+jaf8H7fhCF+RimpZXRy/ACXHpcULpQZy26QZmJf69BeloERSgONx3RQURm5L+qi0RZcyKk5g0dnOUtp64zaYTy8JmYRZscW4BTweM0b+xAcTG6ZxE59tL2/lbD8URFXR3m5vhTyYg3ojhyW4sAGseONVnbLZkNcCJH2U8PplRq/kitiKe0ZssEoChdIAuFhBDKISV+oXsOjt3UJWwVfW1I2xTng0ViUvZ+p9t34EsBn+kk9sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 14:13:28 +0000
Received: from MW3PR11MB4571.namprd11.prod.outlook.com
 ([fe80::3fec:2722:27b1:67f9]) by MW3PR11MB4571.namprd11.prod.outlook.com
 ([fe80::3fec:2722:27b1:67f9%5]) with mapi id 15.21.0615.009; Tue, 17 Nov 2026
 14:13:28 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [PATCH 2/2] rust: drop native libLLVM path for non-host architectures
Date: Tue, 17 Nov 2026 06:12:55 -0800
Message-ID: <20261117141300.2193043-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261117141300.2193043-1-Hemanth.KumarMD@windriver.com>
References: <20261117141300.2193043-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To MW3PR11MB4571.namprd11.prod.outlook.com
 (2603:10b6:303:59::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4571:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: bd1d0510-9f28-474a-8cb0-08df44b4f2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|52116014|366016|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003|38350700014|11063799006|10067099003|260925021911599003|260925022911599003|260925021311599003|56012099006|18002099003|22082099003|261009223027099003|261009221727099003|261009223327099003|261009220027099003|29003799003|6133799003|12006099003|25016099003|261009221227099003|13003099007;
X-Microsoft-Antispam-Message-Info: CvRldHLOcw/t1mGS0TGKQfQp0eO1+Di8d3lti7Ij+UiRQyUWkeHZDYV8pgU4aVrCKVpZXrb4DG2jlmtXgpFvNAkY9fxx+SIKmA+DFEkeCnxZLkyfRey/VhCfOLSJI3Bj9jso8WTurGlY9Z78j2uqJbYvObmGe2XyX3UXxF3lsZDSD5hijE8hThjid+MMXL1WppA6rOGi+t+/GIzIrNtv4CoGTgirAEtiPsNJ0ghz+zy9KsWge/HoJZVVj97FpPFAAR7g/MLcc7NRjHrvKZixbIoAS8DYLK+CW73sThg5kMuCDTcJQQtLEHeSlSM1bA4qJY8R+60RVgwr3A7pEMWsQFA3CheQR1wJ2UcQUHKeyHDVSCpghckx+RPMGMWzejyWi7RqMc/c3G+VMpR8cvpLGWh58owExF98N5GiZqEXVFr+9X9gFlXP+aBn7tghEO6g2FpZMG+hEO2fD6w089ERAL0ByBXNvY3heolAqmadJ8WrlSALwV/VWF99/KC1TZYDbGarRe7cqms2K3ww2Q9HtG3UGS7CCtwiXmdfSoLeRKF23BNPVihhs1U1/XjdPEL9TnvvUc2tg6e3/BdWjOutUbt+svYfBtTHLDz+4iW0Fw5aqAZMUaI70UxW+TQ4FoChiccYArTriZPkORiryTqi0y27K07bf9cBl5glAtlutNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4571.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(52116014)(366016)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003)(38350700014)(11063799006)(10067099003)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(18002099003)(22082099003)(261009223027099003)(261009221727099003)(261009223327099003)(261009220027099003)(29003799003)(6133799003)(12006099003)(25016099003)(261009221227099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?atEm1EtZ0/dlD6epE1yMsygO6L9O7Mme8QX8VtUtOlazOJwv5TB9Dg9R3fS9?=
 =?us-ascii?Q?uOhOALe+giBBvBNG6EZWXLqdk+43V6RbSy+LlUQupJHPh4stjJE1mm5OHXaz?=
 =?us-ascii?Q?CbbBS9v1UvTe+r22GEu41e40NljNcwlyyvwMPrXfh727840wUOVZWq0XNUPj?=
 =?us-ascii?Q?7f3nZq3vCpmPUQcaxFGdtSjV7Ru6OYSzvIts8xKhUODQFyKRbiuQxSozdg2J?=
 =?us-ascii?Q?nbyO3IeFzuF+9SjmWDRt+mxesA+ZDNkKcfh3QixPFHIHByzcVy3AGIoq8e6/?=
 =?us-ascii?Q?jyu++PYBgzA7IWw5pDE0Xbkk21FN99ku3nBatIvvHZruywNzx6uabVaC7YKB?=
 =?us-ascii?Q?2NdntlO31jZ5JyUQbG6lfmzvH127p8fV4TvvlkyhIgHtBh3SHeGsKU0e0bb3?=
 =?us-ascii?Q?Y/ey/TmocPKb8Unz+slAi4gHbQWkpktNM3G5ktwEu5OOlgxmfQ+VKPAqmVwU?=
 =?us-ascii?Q?LMKHwYCkoD8y2GBX8b8aqXjULvX/bWkZGhzE7HHYfJb2BXzGgT1r+uMU9Fhk?=
 =?us-ascii?Q?3MNyOXAKmcz9HZjL2yDZ1o2uDAJwJODvZkW93WqkYPCbn0cHgV1+s6aHGiKO?=
 =?us-ascii?Q?IfP2MkUFr/kvCZVBtLYOpFIPf+TgBuvTPVwYtK9riDozoaj9Y3Mkt9Io/XQw?=
 =?us-ascii?Q?T8lDJj0N7YQBbMJpJt7OjqHeBupLHcRpuepUg9tnLSemaWqIh1h8/M230HrY?=
 =?us-ascii?Q?q9G4GZ0IGj87Fu9vfTt6Kbe2SRat2y7Uv9TaavEw+hKe4Swlt6eEfWdMAWtY?=
 =?us-ascii?Q?xagTbajJKpRhhNeouABlvK0l9BcUHeHdKmm4E64/YTYg6mMOc9tr6JDJj7+c?=
 =?us-ascii?Q?2UtaTKCabX7G3A4QZirHTWPD23Sxws/Q27grq0vR29xqa9BnWb4qrUqignWC?=
 =?us-ascii?Q?rNNm77xaljNb2YlTbg3UWlL/ZWwaLTekLVjqCr6u/ar4oHjT/XYJJPGhwOtK?=
 =?us-ascii?Q?m6zPM2w0M708ipF4ZglEKohUYTOQHzowruQE/VSfoAUobNfgiwDMQ72tBumw?=
 =?us-ascii?Q?Ryl6qut8z+Hi7hAR0ik87gSPxdGBdkNc6Bizbaj4sRTCPvjEqPo58s30Alpe?=
 =?us-ascii?Q?qI4u0l6MU0EmME0qz40BcHxHuLhZh8M/62GYLzfwBlz40mbhZyF1eEBU2P13?=
 =?us-ascii?Q?ykBe8Imwf6rqv2vxsWRX3GoWpvL23BFO6R3ERFjQ68ajkcA7Fyn3Q/cQehSG?=
 =?us-ascii?Q?ZwccmG8sIfrQ+Ykw7sGu9Ky/JwTW/+qp9o1StyraA27rMwUMIKYWZ5SQWb4f?=
 =?us-ascii?Q?YzBGMRzIBL0nm1ar9a3DXTNeV/Maax57Ra/HZqv+2UWNTxdSAPANwD+qBJpb?=
 =?us-ascii?Q?7LIOwZQsdRne2XxDsXohD9zpWxPsLq/h8radtcxCH/Yg9jfjwf6UWTIHjf5p?=
 =?us-ascii?Q?vjBx6OJ/qOg4F9Kf6PHuvRYwjyoDFkTErgIij1xgHvaarDgikUkfaWvbch0n?=
 =?us-ascii?Q?d8DCger3O08j/5v8H35UHgdF9Hv+CX7x5sw/NIdPN8dry+qDdNdUuMKlUPB1?=
 =?us-ascii?Q?ZenaDWre37mqEKrL6vUvwv4vLHkfzpAO2rPGpk7BjA1lnEqsWuDXEHE7HAW2?=
 =?us-ascii?Q?ia7FUmtItW6OJnL3bbDO1Z7c9H1uSCSzK/yUdgHqkYBe1gc17v3MsGtsHmwO?=
 =?us-ascii?Q?VxVhKnLCyZQnKQkmftTlQ285ujdLgtTy+5zk1EBO9ZtOEHSK/fymjBhcrbeP?=
 =?us-ascii?Q?pAbrSDCZ5xuuJpjBpXpcJs4mS8lhwCQ0f92Q1iWVNrFWIVIrZ7JwBjolAqAJ?=
 =?us-ascii?Q?BTqa/C6o1tK3LfI0s00yzOm7MpO/JtM=3D?=
X-Exchange-RoutingPolicyChecked: jeChyaI/iiOQVyd7YX4UvtbdlX4uQ9uuCMm40mK5S6gAnFb3FFAKAj4Pa8dpBxkMTmxfJAXqXx4JW+gZXwuVQu4lIK6f4calc8ZrrN8Mx/HuFlGtlg9N4bDTfbCv12wAX0G/dW3xB/0XzID6m8CxA/+kpucAIJovFHaw5UT3uDejdLhgbFO5Mmrzj2Dj+vPPV9Q1RtggLK1EVKw890ugdrTD2A/mF+m8KjQFfqH2sBOW9h9sKFTVzYzFeSdUtc3rh2U359kzNtpmVedrivO/tYXmQGaeJrsMpieEihuZCBi/+dfxlvTxJxA/wWcpGK5z8AVpgMWfafTpGQ1PLDbSCg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd1d0510-9f28-474a-8cb0-08df44b4f2fe
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4571.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 14:13:27.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14E0uzaMe5zUxJmUWv/XeHwWQUIIYOJ3xPYjjS4WsxQ8OZ97pCZvTAX4xtQAfj+IxvyGzr4lJ96H8mxb3vl2J5yJk3getbUvylwLFbYYQQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfXzMxH0LVpPNrt
 9rDUlM9uhb+alqX0T5ik/lwujZLj+6WdmnQPlWhcmnqiGWQPkHxsKrwRJjg7B7kuZwx1+Ej5Yb3
 b3sUTxj7+DUB9s399/Ns8uEMvhNMUuS4/V+1XDMnKkPvyfueSGDKkPqo47WhwDrf4H4bQFW6emz
 0nPJmybYEK6+lAOUs2d/pW2lJa6RpbtqaQK5N/Qbn+ZTfDsNkjq7ljDGK0Vj+psg/UE5n+YVtST
 wsz8EarFIxyODNwKkX+vEM1ReBJ8oH8o/zvFFDjQk2NaHB9Uf6AAbvVlJWMQ2KSaCAE+Ibcv4yn
 VZ8cwzf4fvxkM1/LBMgawkXaU22zungLer0t+/jsd1ShF7lc+MPnaE7u86OEekEiOd7GPSnI9Wq
 q4HtYAlFGMXwFyEZrm5g+UdC8skoBI8jmPcSxe0moOUKB4xS+fegrBsD/5V7HRh/ZCe74v7Jrnl
 d/mzOEblLJ3BUUmYi+w==
X-Proofpoint-ORIG-GUID: tflswQx38MxQqsUKr3jFBvwm5moDCpr9
X-Proofpoint-GUID: tflswQx38MxQqsUKr3jFBvwm5moDCpr9
X-Authority-Analysis: v=2.4 cv=WcmZ+EhX c=1 sm=1 tr=0 ts=6afc610b cx=c_pps
 a=7Kp79o39qosEjZWU4lqIzQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=XkzZ2HEcXFz5VrAklxcA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NiBTYWx0ZWRfX00e3kB9PLQPu
 MtamXg4gHPbyC5qhofkOuYG5pfW2nuDlQJSnNN6T4NHzVKZpWNz8tyqCWAXJcJbBklU+cOx46bi
 vWctdcYIueftL92Gbcu14k0L8Wldxu3blu9VHVXlv+HC6RGO83TO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 14:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250455
Content-Type: text/plain; charset="utf-8"

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the recent refactoring of the LLVM handling in rust bootstrap [1],
the library search path of the native LLVM
(recipe-sysroot-native/usr/lib) is added to the link of the target
rustc_llvm when rustc is cross-built.

rustc_llvm/build.rs only adjusts these -L paths by replacing the host
triple with the target triple. In OE the native and target sysroot
paths do not contain a triple, so the native path is kept and the
linker finds the native libLLVM before the target one. A linker that
cannot read the native library fails with:

  libLLVM-23.so: file not recognized: file format not recognized

Add a patch to drop -L paths that point into recipe-sysroot-native when
cross-building. The target libLLVM is still found through the target
--sysroot.

This is a workaround. The issue has been reported upstream [2] and the
patch can be dropped once it is fixed there.

[1] https://github.com/rust-lang/rust/pull/161247
[2] https://github.com/rust-lang/rust/issues/165385

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...native-sysroot-L-when-cross-building.patch | 49 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0005-rustc_llvm-drop-native-sysroot-L-when-cross-building.patch

diff --git a/meta/recipes-devtools/rust/files/0005-rustc_llvm-drop-native-sysroot-L-when-cross-building.patch b/meta/recipes-devtools/rust/files/0005-rustc_llvm-drop-native-sysroot-L-when-cross-building.patch
new file mode 100644
index 0000000000..8fd17c18f4
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0005-rustc_llvm-drop-native-sysroot-L-when-cross-building.patch
@@ -0,0 +1,49 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Mon, 16 Nov 2026 03:14:17 -0800
+Subject: [PATCH] rustc_llvm: drop native sysroot -L when cross-building
+
+With the recent refactoring of the LLVM handling in rust bootstrap [1],
+the library search path of the native LLVM
+(recipe-sysroot-native/usr/lib) is added to the link of the target
+rustc_llvm when rustc is cross-built.
+
+rustc_llvm/build.rs only adjusts these -L paths by replacing the host
+triple with the target triple. In OE the native and target sysroot
+paths do not contain a triple, so the native path is kept and the
+linker finds the native libLLVM before the target one. A linker that
+cannot read the native library fails with:
+
+  libLLVM-23.so: file not recognized: file format not recognized
+
+Drop -L paths that point into recipe-sysroot-native when
+cross-building. The target libLLVM is still found through the target
+--sysroot.
+
+Upstream-Status: Inappropriate [https://github.com/rust-lang/rust/issues/165385]
+
+[1] https://github.com/rust-lang/rust/pull/161247
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ compiler/rustc_llvm/build.rs | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/compiler/rustc_llvm/build.rs b/compiler/rustc_llvm/build.rs
+index 450b98f..05ff9dc 100644
+--- a/compiler/rustc_llvm/build.rs
++++ b/compiler/rustc_llvm/build.rs
+@@ -452,7 +452,12 @@ fn main() {
+             if let Some(stripped) = lib.strip_prefix("-LIBPATH:") {
+                 println!("cargo:rustc-link-search=native={}", stripped.replace(&host, &target));
+             } else if let Some(stripped) = lib.strip_prefix("-L") {
+-                println!("cargo:rustc-link-search=native={}", stripped.replace(&host, &target));
++                // OE: the build-machine llvm-config reports a libdir in the
++                // native sysroot, which holds a wrong-arch libLLVM.
++                let rewritten = stripped.replace(&host, &target);
++                if !rewritten.contains("recipe-sysroot-native") {
++                    println!("cargo:rustc-link-search=native={rewritten}");
++                }
+             }
+         } else if let Some(stripped) = lib.strip_prefix("-LIBPATH:") {
+             println!("cargo:rustc-link-search=native={stripped}");
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 8b5b59bfa8..ed779f3478 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
             file://0003-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
             file://0004-Re-bless-tests-adjust-for-new-Cargo-lints.patch;patchdir=${RUSTSRC} \
+            file://0005-rustc_llvm-drop-native-sysroot-L-when-cross-building.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "90dab90b8084eb57c35ae2b1d0b70c8e5138ace6023b22c60a5a400f586f63b2"
 
-- 
2.49.0

