Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23908.1794818937790433767
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 00:48:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ULCcbGcj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5780073afa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7fg952176434
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=mxOQKNSPwmwMwDsZDer3ov9/grU/LC3rn2eLByADmss=; b=
	ULCcbGcjgf0XvTANx9pXR3rIrXXmuLOwkMR3u6mullU60vZ+L1/tS4Ydo6QG80Yx
	hkGt5N4a1fwsTaj0ruusESvUvK6iD2sFb9kmB+wLLHjQGxUPfnCGArOP0NlPiyEb
	5qgt5xwhXSouv13/OVnmdtIzQcCt2kef4rjs4CHxP4duzA6AwC66n7pnRWxIMQlb
	rqxmDvmIeo/HP+rUJo7zi5Qrs+3Bg/lM0Kwi99+wv0o8jHT7HJ0QaI+LtbCKM8S8
	i+ukTRtWWx0htJOj1l3Jb0DfCeKa6py/uVyQFw59ab2+Vyp/L3gtFInBEfj8Rnr3
	U71LjvEmX16V/GJYsZxgNg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021107.outbound.protection.outlook.com [40.93.194.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgy7jb5d-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:48:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVUJjdbUwe4FOOx1rxtDh0HYm2IXTWgbtJjww6yC4XpBMdfGkteioaTetnd81j2C0PE2SeIcRxi/KeJHM2sMMWYM+3CrNUsmGyY+rGWtMBpIdBkiYGlalbxha5XjaJLTUgX9VcZZiQIql+yNaX+HS43IupEcz/G1KFNFNLzvym7J6hgAEDMWrMSI60u1Hwj01cGV/KYRCqpPGrZS49kte+1J6PDjHIKK47+sPnLwQNoN41e5spclsAIizJRmrobNkiPCuD4PJzrmVkvehFW8x+Z95Edy1aUlbXosVvD7pVS05mttou8vvy6piCRAd15oBWsYP1ZHqpHcg7djJgFRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxOQKNSPwmwMwDsZDer3ov9/grU/LC3rn2eLByADmss=;
 b=bvyvZTmAOYXjCfqn57Tdjvpc1sGM6+CQUFffJBsTVhYXUGa50fT8+DJE0MGlYNOlJ3enyGqCA9P7TyeYxpfvH1aDAgV7hfjY4r97SzPPbrjIwgk/h5SqBmiuspexe3Ii4cVUgVZHcHHqhvcyyzGZKc4HEorLbSrzV8vBQIGY2oii/k3D6z+u1lQANbPE7PoOYpWVk+385gzRGofSCrf/+PvoanNcUF/qUbDGBFuytiFytwPKS23kQngz9DZkW1b2xFLKiO0hZEitr0DEL5GI13UT9QluL9pfQKJkApkOTPdD48jpMNfI3kHIy/BL8MxKWbJqekMP6AJV2hKGgB+weA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14) by DS6PR11MB622039.namprd11.prod.outlook.com
 (2603:10b6:8:52b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 08:48:55 +0000
Received: from SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080]) by SA3PR11MB346485.namprd11.prod.outlook.com
 ([fe80::7e79:2dbb:6903:6080%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 08:48:55 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [wrynose][PATCH 2/4] toolchain-scripts: source target-specific environment setup scripts
Date: Mon, 16 Nov 2026 00:48:33 -0800
Message-ID: <20261116084836.2336870-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
References: <20261116084836.2336870-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::21) To SA3PR11MB346485.namprd11.prod.outlook.com
 (2603:10b6:806:5a4::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB346485:EE_|DS6PR11MB622039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a604909-2740-413d-b22a-08df43be727d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261022075727099003|38350700014;
X-Microsoft-Antispam-Message-Info: ATMBXqTqZmkfaeXTjKOPsaGYXJVR278v2qLIpQTe42VDLGKVZmEhSYJfcmhMQSWMI2jQ6ALviuGafyXS8hoo3s1yQ2I6spS90Ugi4fOjx2W7Jlae+4PUBO2KiNh+T/2CCExVE/nTH4BAz9TceXaCrx+8k0guBBOywxE/LXUNbw3xdxkTtF887RNsTfylaz0iFo7Bb9LWkSvaMXmKVo7Zj+kJCbJWrEjSH9ETs5tgA1W7JHqegBrlRLGWy8ltKaF2ElDKtkgOM8QpwLWHQFWAHDCfBpGOzKeMfR+0+vWHXlo8p1MJvu9FefGKfrz0itNEpqy8wqeNnM5yVUCxvrHDDKgYAhWucIjoOm0ncPxBcA8qjxWFsVIOrkv5TE9gpovH0tHkzJY/fY7XaAYP3ng84YHkXePe84r4avaW1ES8w+PmMng7lVdBHO1gX0wwubhWaSEnQDSVbwTdhPopZ3eo/kDkN3OvI/gpvEveOAQ/6IgKfYmCAji5k3MXdkSkNiAwtdeP1+6jY5l4m2Ll+ybn8neKJPGzPDQKRZGj4cHMgiYX9ipUYpRYs9O4bfy2WRDVQcwRbZ/XIEjjdh1Bsgnts++qBoXAS1bb9XsMYhbnCGeO/I3RSWSYgJQ90jh7wfPNZVc2JX8o+/06ndC0XbAOc/W1MXAKpgJreGu6RK4axnXrm3UOyRgP6l3oD7hbiDYS0o7f9tI7vBA0yXfJUJj86MuhG84Yb8JHfSsFwyRb5SY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB346485.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261022075727099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGm7cfHogU+NVaPi/zrrAr6Fs6Hz3b4bY/cn338sNqzllznl9MwuUaXgJ3EG?=
 =?us-ascii?Q?X+r+N8G22ywcQNNp3o4bjPo7Mxfg4t9/0jdtFoQvCxsHxCNk5Mvy/Yjqokk3?=
 =?us-ascii?Q?hzwnOs/SD9o1y+LkoVfQDleZtDdegtbBwvn/b6bWBQ+7GXCCJKpLhKd+G/FH?=
 =?us-ascii?Q?MKIUwPJXyB4YDhAP8r9ZjamcUV378EU0XNhI8fzXu0oeqMFfASb7uKfTfO0E?=
 =?us-ascii?Q?5QYAe1/+TpF2kEuqHoaJByLFhRiRLK2PxiPlVtTNIK6H0W2rhvxpw+vSz4nz?=
 =?us-ascii?Q?zBNVIjBQ0HSMBY+mkDm7RyFvCN/xnk+LuyNhQC5+pDAGfvqGq6+QEaJ1qWUg?=
 =?us-ascii?Q?LvsUIOKwrh4eh4KTvSrf3DZhfyZCcnEEtMlRbQBY4cpRBrpCQ1XzIGTLr4qo?=
 =?us-ascii?Q?8D02tQJj0vZ9iK0nJozqfMZHNp7uru57q0HXBFpt5Hk1E7SHCthKTseQRZ9R?=
 =?us-ascii?Q?WtvcH+yB1BQqsW0/23r3NRzJ9EFDkC41fsQZo+fBnA9gkX5ltf74B4EUgZvR?=
 =?us-ascii?Q?xXYkVKyCK6G8coEuKIILiry6QomOHIq7IZXyUrlBIURF5aolXi93MAlrMMb4?=
 =?us-ascii?Q?IvUd9M0w5lRczBBdJm1lcejIqGrP8dEd815oCX9DQbNRua0wvQrLbqkOwe3J?=
 =?us-ascii?Q?G9fhwgi3GsQEJqI25CduJX7o7bX3bC4Rx0ilkxIKObUeNA2JiydUGdNJj9Fh?=
 =?us-ascii?Q?WFqLdKbq9yWHC85sBw/UHzw2spkvpQ/eKM8tgVYYhL0ICT+d+Kl6HFbah/Ie?=
 =?us-ascii?Q?eVgv8Srru1wjj1boRwpl+TEjJS/UMOKllPwF/kwQU71W+bxcL7tgzHoxu8YP?=
 =?us-ascii?Q?xUpJ68aax3UNri5N1ssZ4LeSdOsz1WLTC1UlKHsNYTAZI4463JWNlsqxuUvs?=
 =?us-ascii?Q?P08zH2lYPrdHoS967ytuRm9rHAuhgQ/KRHGJ9RUhhUFW8snjmq4jBW7MJt1g?=
 =?us-ascii?Q?iUFcokfeOVQA4QbpuEwhOwShUdmypThqu0xzzmx/RFj3v0fY05+3E7ohF2ME?=
 =?us-ascii?Q?Weyz2AFtPZSilly9UwVGx91wWBAIUhMBoc1R+HufCmKf9MdK/wWZ7TyginNE?=
 =?us-ascii?Q?yezCLat2TZuRtwFj2U3llMYWufRQBwxbHmp7Bln0vD5nCEVff/3fDuurK4nD?=
 =?us-ascii?Q?+2k5dDYfRvzB6jjxT/q2Rm96io9Nt7DCNjDrh0BbdOi7cOukhMFx8K8FgrXT?=
 =?us-ascii?Q?s8EMwi1jLsBN0tz75eWZZ0NekGYlWtvjZXmHmh5q2vKe9QCmOcE2a7izOKLw?=
 =?us-ascii?Q?0/8XxIrjcDy6H4u/BteBHQtwpGVAm067LtdBja+G18xW6ulbv/WLaEnRgik8?=
 =?us-ascii?Q?CzefWUPLFFGXpDQzwspS3cFRhZeaxZwHcfaI23IpV3LaCg4ZHBP/9TWXO9hw?=
 =?us-ascii?Q?JVQhWag7ULFiLjaCjVvgYWX4xea2KHJkZXgycEvSOV9RJOHxx0iDxYORgCs1?=
 =?us-ascii?Q?HWZncBX6n/SkCFWY4Fi5ashnOElYkJ9eWvTb531hKGjAHP00uC8PjIu+zzS/?=
 =?us-ascii?Q?MTaS3FDoV5ozhSls+xrdzzLuwH0KSNr2GgTkfFmwy/sunHZfmPYrX3LjWKAk?=
 =?us-ascii?Q?JDv2H96D2YehW3EfAxo6s4B1woH0O2cQkt46Za1qPLz7ZCJsKhuha67RJXcE?=
 =?us-ascii?Q?fUXJJ/oAFqMeGof2PkSSfXhMl4w/tzYYyb9W+x4pVazmonDUeDsB7RbYCDhh?=
 =?us-ascii?Q?kD4Sz3gJDXQjzOEmNRmSk/SY/vFs210K6fEhdVsVfyAVXnmB1QOYr4L3xxs5?=
 =?us-ascii?Q?MMGSl3mmp9HWVi8O//iaD50tZQ4143E=3D?=
X-Exchange-RoutingPolicyChecked: x14C3js+BUQrdllaK0l2vgVjCXy6T6Ug8dwLJnNEqPx9+Pb5/H7xoM9NDSZ4yYlEWKw4/GEslMl8Tr/YMvJDmdRBHPRGXxpEaCPlTX4JDbqIF0SVixjDQGxZiNfSithhbpvHGdg/yhKcbzJZv3xbYbLb7SfzMu9zh5uTZDOFoHrWgRNlnZ2GMHXMRZdS9kPRbltY53inSSZd3DB4Rdwl2pF19ESVE3t8/TZ0u2Ck3iP2s9M3VTySfC/eznehu4ZUjsm2k9cH37EgpwjhcF2ZBZkcKHw7Rd6aNMmxt98i+Ro3xaPvT6dolSEhUHZ+F3zekOXxFo3zNzUXXqJaixYTDA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a604909-2740-413d-b22a-08df43be727d
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB346485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 08:48:55.4086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdRd7wmmzTxvTGrn9sI97qp4XynjvskpVuSQdzurHqC1flTKhsDNe7OukhrsCtrDJrhEKnm6O+TEcqhKx0jGxyw1vqgL59Z2721CfSeCFYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB622039
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfXy4RpH+3gJGEf
 3ULT0M7dNkttzP1bVwCnxK720jBpBot5Np9HH4SRmeOsko3B7R4ycGZTfJkETYWyPcZsQvAceSI
 6dsJ+/vW8AIHauaX0Z0q3cfDPnnWDnoUvxLQf9cPOTsTXFfIwCjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNCBTYWx0ZWRfX68OewIkHmYsh
 5tamOktUzTLBKcWkb1V/w3VDqkU0rHujaUmpqZK/I3/OSpvDg7QFMu3BV7UQQOCAbvd5O9qEEy0
 HvPbENgLRHE7S9L1IPp8kKdkUlU+ZfhZB8SA7d5cAHdcJ23HD7kFbWG6La3NDmTuA84PCsRLG6K
 GkBJiJh7SPsOHfJproHcRnncEF1/RyHjP3rCEZ2j+VOs5yOYJh0bY3X0z/W05HHZGYgtFAOzL+p
 nPSSrQvS7BUQWft4Sed83KNplFDeKQQ0TRfWg8IWomXJpjsow2toDsac6Az3fpePRkZ/Z2u6NT/
 tZs5Ffwzjq2VE90aKPhEc9F2/YlC5BUZCgSiCiypQsm6Tzve/9Ce5mmiGFo5O8L7zDsqNXKeft8
 9SENli+9eYYXlv1DDjNyg/DKhTCXuAdZIWwzhsOU2crBy0yiStGv9KmGMn/3Pxc06QQJWL6UZYU
 Qhqj+vz0vp2M6BbwJkA==
X-Proofpoint-ORIG-GUID: 1xdmrmsUh1w0--7GEhAuyxNLAai23kHn
X-Authority-Analysis: v=2.4 cv=c9g+0h9l c=1 sm=1 tr=0 ts=6afac378 cx=c_pps
 a=xmT5btM1tXsMPZo7WXzprQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=I1MNBZYcU8ziaYEQT4EA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 1xdmrmsUh1w0--7GEhAuyxNLAai23kHn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 08:49:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250321
Content-Type: text/plain; charset="utf-8"

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Source any *.sh files from environment-setup.d/${TARGET_ARCH} in
addition to the existing environment-setup.d directory in the generated
SDK and tree environment setup scripts.

This complements the rust-cross-canadian changes, where Rust
environment setup scripts are installed under a target-specific
directory. By sourcing only the scripts that match the active target,
the SDK avoids loading environment settings for other target variants,
such as mixing 32-bit and 64-bit configurations in multilib SDKs.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4d39fede00aba9210f38fd780b7fdaee99fa33c)
---
 meta/classes-recipe/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 8cab82ec03..18882e561b 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -169,6 +169,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	    . \$envfile
     done
 fi
+if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_ARCH" ]; then
+    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_ARCH/*.sh; do
+            . \$envfile
+    done
+fi
 EOF
 }
 
-- 
2.51.0

