Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11653.1795762052732859407
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 22:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DqLFsdv3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=57914e973c=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR2nJml119412
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=124Tw+SZ1y0dLcAvvENHcsC1l/E843/lrjOIT8nF1bc=; b=DqLFsdv3nXNN
	Vh/GXOb6q15F1YFObXv4aCgtbY/1fPynha/5UgdgDWkMXGrsSml86TE02WwQzg3T
	uNUrv352w8CZpyX7kFJl+Gx9tVtm3HOOvBjyMITuG57hpiR7doFcq7tavwKsLeeM
	vRoD2NeFV2pf4VG0LO5YtTVVMslZeRltUU0E0idSMc5jF4FCyeK5lotWB07xELJe
	8ksHMr2Rtv/Bbmnfaa/mb4UBJuI21CYoXIR49hSeeDwe0d/z/RT+iZVGLASw0IjI
	l8hPuKDL+RjOKE1cRlJL2YWhdWByo6T9NNwadGPY8DFhUfy+T/Njf8uzr1flvxD7
	JpLGOBsp6Q==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023115.outbound.protection.outlook.com [40.93.201.115])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4j516wym5q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 22:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNiEJvevEECixPNhsg28W/PWSo4UcJ++X6hINO7es+rz79auJBh4NZyORTSRN9rcEt1M5W94dOo03cCwk3Y+M+7CwgRxMx0vu1aejapSICeJ0h7aFv0j1R27k/FmEs83RM3cJVdfO+we+J9yELKuiFMPk09RwSwrHpSyTghOXgdIkRfTm6TfgJtInQvQz3SufXmO5NBhySpRadR4AXJFcIUy6OApsbvJ/GBkwTRMa8ZWajGTstNc+vaUGXbXr8YPEW6ltpbq12POU31rbnH9J1Nw3filQPVj0Q/L5t9T9DzRufFs3bAEgtHRAYH5mbfBh3Lkj7dirYX9f76BIa7Opg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=124Tw+SZ1y0dLcAvvENHcsC1l/E843/lrjOIT8nF1bc=;
 b=SxGiUjuA+fq2ipl2evJDui/v3x84E3ZxH1ifaGwJ1l+LUr4U7p+cUnGX5oUD7qoVsxxQKg2gQ+pLk9swrH7RqoOfVhJx+bfeJNC9Kx2aJX5fCkrpn9+3T3VdF+n/qyGBLvTapNftPgzl9mWLnYeCsIvZX4O5Juq6zBEod/A9qR61fgHYYg1wdYqBunP0C5F6I6HccXEmVDrRSPA2TaHIlYVXq1EF4ni5N/jiqMr46ISMZtKWpnEazJNfqpE1sftjcrz5F/+zHeHY2V4BOlJDAG/XHV2Vt7TXE/c/LlekqS4obgHPH46Fh7ZHcxVgkEuF9osF1ceUL34KjsR4Ynkc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3243.namprd11.prod.outlook.com (2603:10b6:5:e::19) by
 FT1PR11MB780136.namprd11.prod.outlook.com (2603:10b6:170:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 06:47:30 +0000
Received: from DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1]) by DM6PR11MB3243.namprd11.prod.outlook.com
 ([fe80::6c83:d3c:7952:3ee1%4]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:47:30 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 5/8] libconvert-asn1-perl: fix CVE-2026-126819
Date: Fri, 27 Nov 2026 12:16:56 +0530
Message-Id: <20261127064659.2169695-6-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
References: <20261127064659.2169695-1-OmkarAbaji.Patil@windriver.com>
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SL2P216CA0194.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::19) To DM6PR11MB3243.namprd11.prod.outlook.com
 (2603:10b6:5:e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3243:EE_|FT1PR11MB780136:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e138a8-de96-41fb-0d14-08df4c524ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|38350700014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|22082099003|18002099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: iowvsoltZfjvg7M/MQs/OJhbszqaU1sxJ+vLgmOJ9J+lIiXqZaBvXr4ulUP9nxwAjMcQkq4X0zo48ZXyxNkVecHUl1dIpPCKnfJBsw/5XUe0J3cISPvxro/G/669NpnqHAX4rI9vP7fktpPIPLff44E4MlWzNYNF73tkLyjnkfhKDMGaX3DyLtquOVFcdIQSzboKghsQosIxm5lrJ5ff3jAL5G2MV3dvCC6ZI9trmpA15WvwhIGDfppTlpXk/94Iqjw+kH4mn1W3dH7/cRmTWa+t5agr1v5dbY64/5bnu9TT7VACVyU54vhCO6zlL9VlbWcDMB/vsgFAIONttx+lsdDB3hlQkbR++R7Yvy0yN+caN4f4zmZaMPjpKqaS92ZrrmzcLyNOnfaK5uXPJFXk5PgWkvf5Blzic4P7f7Jj44HVv+nAETXjEjv5NauxNLT2HSKAV6sdW0XX5atcUE+Xj6m+35r12YexlWGS+btFacWfggubv8r23syTa3KdvtPijur17XLpAw7fFV0kw7nKsC3MVW/3x5jxfSfrC4Lq/0hVqDak47DG6ImkxfL/uz7QZ3R8aVdqvhJdJwnzDX161p/fllMtalJP3IXBcrO+GaW/A16Xn5pZWmPkWINSTXot5yL4gUrEpA4jZI3Qrg3tt/diqTKolgD2CcjCv4MqmaOMdTgQQFpN11L8HnPLFRASf3z4WQf7Hd1NwIYhhqax/uYHJBAbgVEOSxOIsYk5HK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3243.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(38350700014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(11063799006)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNiHpcXGpLU2bdZwlHlG387oN/qcm2fgMV346XB+JT4MhF2HVbN1AQCYO1Rr?=
 =?us-ascii?Q?sHBa6DmqJycexdJDuwMp6EL6wJeDqEvzl1APN1LfLnLnOsMd9oc3QRNerIHg?=
 =?us-ascii?Q?rlCS3EpsFKAD9CjCwMio9lWQVRsh3gA+1ebw527rjPr1NEXzv8YRVVTK0Jxq?=
 =?us-ascii?Q?N3urrhViF8rlG4gRImInb+EKTE/sot6TB871VEGBbDjJWuD6CuadGX73ZOGp?=
 =?us-ascii?Q?Tt4MbgcZjAzMY0O/+tr2pB+rrKicTML5Q2UOtxOkphpl0TiiIWkf9Pmw+nZf?=
 =?us-ascii?Q?1LDEXVTJ/LQQQmbVrxhP1jiLfVSPupLlIKA+CEHCqRCs0raCblFcU7sVAls/?=
 =?us-ascii?Q?f7JyzIxyJSVNHNnWC5VKRJZDEAAOC5mMt9aY+GSUUF/Mew+yVQrmLaKwK7rz?=
 =?us-ascii?Q?7pEtm+86jo1tW38lE++a4fzrymt0ydPl7/Zik9gfRPTW+GjTUkx7gXPpGNFd?=
 =?us-ascii?Q?kkeXBWMXSMIH4vQOTv6xs9mdTZn9J+roltO2MBqvra1nqsV/3CyUEed7PU/d?=
 =?us-ascii?Q?3eLXXZjZPFFvawU/01BJFSpcqBDO1jIc5MS1tPvwH5JCMCnb28EBQTME60Jw?=
 =?us-ascii?Q?y63t0U/C7fgOb3f5eU0vODoRO5QSPOvw6SzQe73mW4cVp62BKs5pteWlTrAg?=
 =?us-ascii?Q?R+ZirKWZHhyqcQxKXLbKKrEvZg52qjYROBdEqcAfCBIaeQZjR/294weL+c/M?=
 =?us-ascii?Q?FmYzEWq2NDNOWZrUzUVJvPVlGCtzR9Lztz/QlimQd7aH5urYC5EbrYsQFaHj?=
 =?us-ascii?Q?42rrSo72B6ItPios2/r01KMYfwKAaz/5X8xNd7PB6VTrpTPSmT5Xk67SsmtT?=
 =?us-ascii?Q?PWTDhTaQOQl/bzfj+rDKOgrdvtwUpavuCvQgSnzzoJTCQs1X7X4Ni3obTnj8?=
 =?us-ascii?Q?LrZp3dXPHWz22MnPbP+E5UpRYWXhmFqxHR9qAMtjy3+IvaJ26emhh+X+9Vfk?=
 =?us-ascii?Q?YT8wQ0HYaKpwVa/iNB6weKRI1XgPIium1i71as62AMfqAwQ+lLNBP9yvd19W?=
 =?us-ascii?Q?o/RRigfhltIp5zPEuOmAh43ZTopojXFhzp/x3aJTG3nGxu6LKSIk3kUERsng?=
 =?us-ascii?Q?xkvUqVcwxZHbIIgkUM+y+GyWvAOlfZCpdkbK/gO8ITW9WTjYJUkiex7xTkT1?=
 =?us-ascii?Q?oy3EJ7R1s/vQbtbx793ZZUJ95hT4OOQX+cZiEFjgUudh6WsgWOI+omGt3ZeR?=
 =?us-ascii?Q?TPWOZwoBPF/zl36Cxfb4VRUngiSsTlYtd5P6z+pxQRbn+Ur0QYqIouAR8eH5?=
 =?us-ascii?Q?RVcLv9XpbTEM1dbpPqKmOXvM35dFMAVM0QUeiTsh3WzR34voV65Jb4PtT2yb?=
 =?us-ascii?Q?Zgkxp+5CRkzXEP03ocpd6TyVRedY+lxjg7IRo7NQbjUdg6l55hojQwmuSYMp?=
 =?us-ascii?Q?yHk6phasawiitQUKAiRcC9bBsYQSNwtI4S8XArjCiYSZnQGw6qKhrxJLqAZw?=
 =?us-ascii?Q?LzJ4K3X6oGEgdaNOPgIZCdPPT2Pk+JKWIMMFErXH101uSw0Ug2NB+WJOK2Vm?=
 =?us-ascii?Q?gN7HiNfSDZ1Km396YeGk8ILqQvwnVWgGXSlfQXwv9NpoOSm+z1y8vvM8U2JZ?=
 =?us-ascii?Q?e6X0qe6fU7wvPH57uJEXAfcvSjE2k0ZMagWB9cb7CVdmiVPVbOhhUL5R9crR?=
 =?us-ascii?Q?27kdQ4B1sd9h99Ra9k7VR80ORiNjDl/aPcy67vUfSCSGQqT/2voHKvO0Yk+l?=
 =?us-ascii?Q?mmJrCzsBQjl0E/2zf8Pvn7JvWQ3sLjvTc1AqTNSsfG30o0aJrBqABugEzrFw?=
 =?us-ascii?Q?fqV37UHkvBrzVK/7AULM4t1pg6FobSA=3D?=
X-Exchange-RoutingPolicyChecked: b5QOln+tN8E7KWmhlyFZ3nyNhk4NTLARKxLqT1gBaE9n+R8IG8aVszhpA8b2rOG9u8w7CeGOtcH3PAJ42+e8P0AxZxK46NRjXhkM8mJqsy7KG3l7bEKLfggfSbUx+xlv8TPEp6ePqLmiqbkIpnqMVn40Yxenm9vvu5Qn2mh4MUyUwRYvokk1Sj0PfMC9W7SIom8eURE32EBIQRvzGYYo8o00nSqmisZ4Kk89PCJ7NJ54HPXgFzptWdCzot5mdPLTQlfRe690yodL70TOAU2304QbkIZXQve0gajRTonzoDJG3oSId9kj6XkPBl/UWRoL6ff0iHivIcc8CvctEJ/4gw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e138a8-de96-41fb-0d14-08df4c524ef9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:47:30.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0YwNkzUYEivaXv01z7GUxe64pu+/7/dEmNVTe4A6FkxerA8HkSsEwiG7Wd/zb4hhvShnrcldZKhnkjXbml7ko3JgpOen0V0Y4BGyGrqrkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB780136
X-Proofpoint-ORIG-GUID: pGYlkxE7BrZ8uxevBKgtkkKu3w2IrJSR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX5kRnNzArMhCi
 mNXZy/aFcU17LlsvHVcDhUauepaZyU0neNO6GC+dN+20IPURsekSGNDBtSdHKBLvaWCGkkIPvC3
 0fp9v6bBMQtKOloc94EMLQ6ZyUjq2AkRc41b7A0UEuLbB2mH0L6i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfX8SkmxL7fTGUV
 njhYsYrEQw9iB1M7sdjU8rB00eo1kya2Gm0p3Moj1EOOdDdCFV58bipStmSgwh7J81uH+GfWlSW
 FiI4pNRJZk5Fh3XT43lgZnSsP1qcvVofrUOIgCu9kjkdyIJwwGAC+jycVWCoYXOZ31i25g6aYk6
 LL63B8tLBA/5hdSye5lzWDnUM2+JVZxejPCuiAM/EWKlBG7Z0xabBB8ec+jXIYWce5v50DeN7mo
 RQBWqwaHsE39DZ8Xwcm5GtFyyWkNiTLef1BH/7JSKkZoLp4CpyJSz71buWHfzs3Y4osKlZ2PIlm
 724UjrRNPOCk/Iot2XG3DQu8ffbmwyR3GJANtlnwLp1JhOT6JTCcA0KasbD1wN/fGPzvDUE7LKB
 L+pj3fz6+nDJWVlq5UItNWLXLwj3R2NS5/E/ZbfHUh8wwXMGPEtFF8AI/sPe6Z6TOZ1tWbGnADh
 D/AYq/tIUkdpKWTiEXw==
X-Authority-Analysis: v=2.4 cv=bofZl0ai c=1 sm=1 tr=0 ts=6b092784 cx=c_pps
 a=y6Sm6l44Xb9uyrH0UefkHw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=Aszx6E9rKxf-qG8e45gA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pGYlkxE7BrZ8uxevBKgtkkKu3w2IrJSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 06:47:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251348
Content-Type: text/plain; charset="utf-8"

Convert::ASN1 versions before 0.37 contain a flaw in BIT
STRING decoding that can lead to memory exhaustion (DoS).
A specially crafted zero-length BIT STRING can cause the
decoder to copy large portions of input repeatedly, resulting
in excessive memory consumption and potentially crashing the
application.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-126819]

Upstream patch:
[https://github.com/cpan-authors/perl-Convert-ASN1/commit/a369bb1c39061d67454216a6a1d0eae11932806e]

Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 .../CVE-2026-126819.patch                     | 90 +++++++++++++++++++
 .../perl/libconvert-asn1-perl_0.34.bb         |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126819.patch

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126819.patch b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126819.patch
new file mode 100644
index 0000000000..58d2f2c324
--- /dev/null
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl/CVE-2026-126819.patch
@@ -0,0 +1,90 @@
+From 51c154f2922c268bae7498016607776c8b5333bf Mon Sep 17 00:00:00 2001
+From: Timothy Legge <timlegge@gmail.com>
+Date: Wed, 11 Nov 2026 20:42:29 +0000
+Subject: [PATCH 5/8] Fix CVE-2026-126819: zero-length BIT STRING decodes to
+ rest of input buffer
+
+A zero-length content field caused _dec_bitstring to compute a negative
+substr length, returning the remainder of the input buffer as the bit
+string value. Add an early return of ["", 0] for zero-length content, and
+reject unused-bits values greater than 7 (invalid per DER/BER). Add tests
+covering both cases including a 500-fragment constructed BIT STRING PoC.
+
+CVE: CVE-2026-126819
+Upstream-Status: Backport [https://github.com/cpan-authors/perl-Convert-ASN1/commit/a369bb1c39061d67454216a6a1d0eae11932806e]
+Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
+---
+ lib/Convert/ASN1/_decode.pm  |  5 ++++
+ t/25dec_bitstring_zero_len.t | 44 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+)
+ create mode 100644 t/25dec_bitstring_zero_len.t
+
+diff --git a/lib/Convert/ASN1/_decode.pm b/lib/Convert/ASN1/_decode.pm
+index 72db28e..3e1978d 100644
+--- a/lib/Convert/ASN1/_decode.pm
++++ b/lib/Convert/ASN1/_decode.pm
+@@ -300,6 +300,11 @@ sub _dec_bitstring {
+ # 0      1    2       3     4     5     6
+ # $optn, $op, $stash, $var, $buf, $pos, $len
+ 
++  if ($_[6] < 1) {
++    $_[3] = ["", 0];
++    return 1;
++  }
++  die "BIT STRING decode error\n" if unpack("C", substr($_[4],$_[5],1)) > 7;
+   $_[3] = [ substr($_[4],$_[5]+1,$_[6]-1), ($_[6]-1)*8-unpack("C",substr($_[4],$_[5],1)) ];
+   1;
+ }
+diff --git a/t/25dec_bitstring_zero_len.t b/t/25dec_bitstring_zero_len.t
+new file mode 100644
+index 0000000..c8ae4d1
+--- /dev/null
++++ b/t/25dec_bitstring_zero_len.t
+@@ -0,0 +1,44 @@
++#!/usr/bin/perl
++# Tests for _dec_bitstring zero-length content guard (F6).
++
++use strict;
++use warnings;
++use lib 'lib';
++use Convert::ASN1 qw(asn_encode_length);
++BEGIN { require './t/funcs.pl' }
++
++print "1..10\n";
++
++sub make_bitstring {
++    my $content = shift;
++    return pack("C", 0x03) . asn_encode_length(length $content) . $content;
++}
++
++my ($asn, $ret);
++btest 1, $asn = Convert::ASN1->new;
++btest 2, $asn->prepare('b BIT STRING') or warn $asn->error;
++
++# --- 3-4: zero-length BIT STRING decodes to empty string with 0 bits ---
++my $zero = make_bitstring('');
++btest 3, $ret = $asn->decode($zero) or warn $asn->error;
++btest 4, defined($ret) && $ret->{b}[0] eq '' && $ret->{b}[1] == 0;
++
++# --- 5-6: a valid non-empty BIT STRING still decodes correctly ---
++# content: 0x00 (0 unused bits) + 0xA0 (data byte)
++my $valid = make_bitstring("\x00\xA0");
++btest 5, $ret = $asn->decode($valid) or warn $asn->error;
++btest 6, defined($ret) && $ret->{b}[0] eq "\xA0" && $ret->{b}[1] == 8;
++
++# --- 7-8: constructed BIT STRING (tag 0x23) with 500 zero-length fragments
++# doesn't cause quadratic memory (mini-PoC scenario) ---
++btest 7, $asn->prepare('x BIT STRING') or warn $asn->error;
++my $frags = make_bitstring('') x 500;
++my $cbs = pack("C", 0x23) . asn_encode_length(length $frags) . $frags;
++my $t = time;
++$ret = $asn->decode($cbs);
++btest 8, time - $t < 5;
++
++# --- 9-10: unused-bits byte > 7 is rejected ---
++my $bad_unused = make_bitstring("\x08\xFF");   # 8 unused bits = invalid
++btest 9, !defined($asn->decode($bad_unused));
++btest 10, ($asn->error || '') =~ /BIT STRING decode error/;
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
index 40bb779c03..4615a1a90e 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.34.bb
@@ -10,6 +10,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz \
 	   file://CVE-2026-126568.patch \
 	   file://CVE-2026-126576.patch \
 	   file://CVE-2026-126682.patch \
+	   file://CVE-2026-126819.patch \
 	   "
 
 SRC_URI[sha256sum] = "a628d7c9d390568fb76359975fa03f626ce57f10dc17980e8e3587d7713e4ee7"
-- 
2.40.0

