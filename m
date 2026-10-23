Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.854.1792792999159352519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 15:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B06nJjAk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=475647c899=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLuj8W2615251
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 15:03:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MoWKTMq5Q
	3e+0XJWrWtNf5XvfexWgZekz2aIfuDi8+I=; b=B06nJjAkiiFO7WO+xqEPN2EvF
	7IaeO1RWplsEVMag8nULrbK9i+jrvmfKAZG1V2rdKofnembZ2wxOFyDFXKz+Obvg
	Z08aXy5M1dr5ChrefXvqyQWOJiQHSHCcJTnh1br8Zz3+xb87Yn5xVErxedKVOFIq
	69Mkv+z0NAW0oBQqH7wAbK9extSv5dDWiMWjeS3K/0RCepC2BH7ijSZ6V1AfBVT/
	ZXxV5/YDZDD1n4uRcC06AarTpLXJAHwwjTYauujjzQvvbzY+6gQeKkomOFKW4AIc
	rHnirU0nGV3p5qR0Woqt18UoHzyQubBKyqDBjRP4w4vJByNh4WxWXbzIfE2+w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11022113.outbound.protection.outlook.com [52.101.53.113])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h13nj8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 15:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=izsIrUYvkVisY9NAXCOcmC1ZjH/+bmM6DAZiIn0v5yGHBDe6+6K2Ol6pMiG+HS13hCSaT8tYyu40Deyeh3We6Z5M9Zb3gRuIyXnKw7/vx/V9aSC0+Gf3c+QuEcVXQd18RHRvMSpGdNmvwKZ1MzJB1A0LgRR8hVX9lnoRwf58KM5VYyAkfoKcHby7LsNzdWxstvck6/w5sMAYAvQ+B2+MkdWptWkt6/p/GdvrIcUTtYXPoslK+Om2MsI9KfcL3kBnbc4cpriqZr3NBwAP846oojH2QvVI2pCYqgvS7VigYDKqvkALFIXfJ5qSQ0vpqfyIDjh2mLlFIclHp/FPmNyT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MoWKTMq5Q3e+0XJWrWtNf5XvfexWgZekz2aIfuDi8+I=;
 b=AYpiNSp1c9H+VLY23Rp5E1ejLUibmQvtsJDJRc0bEyTzde906J08UDWp+n9IRTmBPyK08xVAMeKLtorsEOKaf9/9KO5iYjXzazdENTylg2izWCjAri8mvOWojGa6/Ps3QcQs68zEALqkjuwPZZVZ/LtHZ+1PkogLJbVqM+WLnpW0VEyPkWl2BfAVmeukytH3AYCFP2qlrZuZn1GaoWnGORnlzRnNsVHLs3EL2jz1vbjBSfTs8dMm90b9JhnKkzv2us97CQBgT2J/bqK+CVxOF8C7eQ3MyxHernkX78A70+ZaQgwzAEexH+IW31DHPB3rx1r7o3X3KCd7JXyGkiXIbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22) by PH0PR11MB9727.namprd11.prod.outlook.com
 (2603:10b6:510:399::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 22:03:15 +0000
Received: from SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1]) by SA3PR11MB894536.namprd11.prod.outlook.com
 ([fe80::2af0:9d0a:b8a2:bcf1%3]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 22:03:15 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, randy.macleod@windriver.com
Subject: [PATCH] man-pages: upgrade 6.19 -> 6.20
Date: Fri, 23 Oct 2026 15:03:02 -0700
Message-ID: <20261023220302.1356785-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To SA3PR11MB894536.namprd11.prod.outlook.com
 (2603:10b6:806:532::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB894536:EE_|PH0PR11MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: ed319e90-3ae0-4d85-f0a3-08df3151700e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|18002099003|38350700014|261021123027099003|261009223027099003|261022105027099003|261022075727099003|56012099006|11063799006|10067099003|3023799007|261021121427099003;
X-Microsoft-Antispam-Message-Info: fIFWTwxFRc4a2s+YFHTCm9hWBDuyOxx54eKYR+B6N3MYu2ahutZHavfZW/1INyBEQAQpUk+qA8ixIFd/xGk9OuMwjUle/7to+JrBmkkpAJ7MMEDT0IMGi9iivvgPTzvfebSOzRU6akZGr44PssTtbVRsmSwllGNEuYxlzYFSS6colAoL94BLv1l4WgO3CAnaSkOtGIQ9Q4P09zEhuax1x75EU8p5Fq9BLnAX8iHXxk7qoawNmUL0YXf91boNBuH9JC985ZuFbDXu6wMSp7mBrz2ptD2zku8CTlryzx4Ev4bAwlyO9fkaQ4AauzBE7HLzVOozxvSrVdtIiw0oFAF4CXVziA3NQSS83NH1J+ZL8nxdcb0EJUFcILpcWlur1/3GruQir5gMp6i9F8iwsA09ObKJsUWLaKR0DZlYfu8NnmX5UmpahxmuHS6/n/mQtkV0W81tHLRONgoHZdzVPNReEI84XHXAzxDsLYfwNtw9s7GppmCRLv0ZzbEao0nk030bkZYWPm4UWYcUvMXQCgES89o6MwWVKBe2cOCm8Itm1tne32J+DPxArvKVH+jeOvg/eCcapKUZbRa8KNux+LHNxsf47/MqWAjE4UMEcT8EwvDQ1sQ55xV3DIT9BTlLOoKO92xZQESpykjreNCJp3DyK8sD/iNPSTYqLbOLBK64BAtQO10DnbU6aIH+Eh+1SBGVHUkl7Iq/SgEEc5eeeLb72tlnaa28Yr+jtk9hGhGFvGQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR11MB894536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(18002099003)(38350700014)(261021123027099003)(261009223027099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(10067099003)(3023799007)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RIrJTD472e3CqdgVjlh6Vdyvp4eCd2v2DePZW+nBod9n0qd/yazILiEAnPMA?=
 =?us-ascii?Q?H+pY3grXKaa1LiTuYbC5CtWCRPbyYFxY7t/oZPseynKzeNFW+irO+CqWTc7E?=
 =?us-ascii?Q?LD0/V9TXIJaWWN91vJt8sOKHe08u+FhYoILIAWnGrrwu87FoYYj4JBI/Xlmo?=
 =?us-ascii?Q?wD63CDrtOK4ijPFpJbKh1kKwy4LlAvIA5hVsyKQYTR1gEFGbRV3lb+C9nQA3?=
 =?us-ascii?Q?PqUPQrOohNaUEtToP1IGy+DAN8OArzS0EB9km8gegxwC6qeHeeKK88DGpwab?=
 =?us-ascii?Q?JsaXXxajN2j1qJ2PAlkT9KyIXBmKoNir3DdigkPTK7ZO5IkZHHJjTdS0tdBe?=
 =?us-ascii?Q?DeiXykCuwWD5otWJb3xb3cdA/pfYnWvybtWLpG39o3ZD+zuYgLrRUi6Bnlyw?=
 =?us-ascii?Q?vNmFOsbRqvlU3C0modhaskYOonfREjB12fhrZAIHQZh1X5EY/QfPO8uVwZ46?=
 =?us-ascii?Q?xdxYDuvvqsYqUJRyLmJorCGu9jTw4dTpoaefkDu30gATnRnWjGP50UJfsGl0?=
 =?us-ascii?Q?LpFVW71kwI3RqISjP/R195nAUibrylXywt8y1Y8+4s6TKCJylnbXQhZTmIdW?=
 =?us-ascii?Q?qILKoRtR8bF5yqszj1+zUPtOP2sVKLz/ONH+jusMiMjeDPcbJ2vPErXeEkkG?=
 =?us-ascii?Q?eLUHYPQZuotmJocLngn0PLENDrlxhYYJK31c9YapE8lhajagnGcN85XGTef6?=
 =?us-ascii?Q?TWEsSRInDI3K9eHaGbNM5+/dAB767Whw1bRhX9RICGZCx4A9Kzk+XZaypEWN?=
 =?us-ascii?Q?3SQjBcC/rox4xYnSAXaAwAC1s2kgmGEPf8zvY2ewXE9MPK4PBnqv+EElDlfE?=
 =?us-ascii?Q?mPHB74/LdDr1XNHr1iBzikjlVgCzxrwthNRdg6m9tUoSScqFGaQm6qX4a4i/?=
 =?us-ascii?Q?wmxlxP5wNnvwmCfYSNJPwNF2l+8t8QI9G+mIjR0+rY3NUJ4oiudpoiLrgbLn?=
 =?us-ascii?Q?ncX86BIhNm2tdwVPWp9gYZChq1ddSzGCjG5NJt7NnC4wRjyaBfWuUCZPm/5n?=
 =?us-ascii?Q?+ajHPSy6FjuMUR326wMNJkIIoui9X5AMxnAS/b5nrbtxYmNXQt5XkJkaIvje?=
 =?us-ascii?Q?Kjx/oYqMCvJVqdhC3G7e8I/f0YxUXvcHk5pAIWcs3uQnXVrMSo6G25Q1SqyR?=
 =?us-ascii?Q?RN8313gsq8Q0UQO5O1v1i0+vj2UKu7ttRu7/UJN5ia6ts0l4xhawyq+8ri3F?=
 =?us-ascii?Q?3UrdUAmvwy6z6/ydBls1SBA/uoqNmzBvt0FYUiZHCMegIvjOVVDxGIWFWHBZ?=
 =?us-ascii?Q?eIq8K9pLyr6Ll42USWgCp+Kpu3v4WbMHxOllNzdxRCRDWt4sYI1A5W1GlP54?=
 =?us-ascii?Q?a6KjQwJtqMiZUELdFtpe7gfGvmflMy4kCs7GIGEY9sD+3y6DQrlbeCfZMYw7?=
 =?us-ascii?Q?kY133iIYmU0VERY9tvM30o71utRTN02NmBIbN7FlfODIkEokVZf+iiKA0OZ7?=
 =?us-ascii?Q?NFmrZfGj6m5CU44ZXFLTy7Nce9PbNEqav5rF51Cv1+BLmAvyMWsdRRIyDZ5+?=
 =?us-ascii?Q?VMBxKZqasO2qGKwDwR7nUukm6sk5YfQaxpyF0APrBLhplv4uy0XW1COo7q3L?=
 =?us-ascii?Q?D2m46kx7uGqinLLOvVqbCkDNiH5/v6xLNHxf4eiluzvVvLoO+pSKLz83MEl2?=
 =?us-ascii?Q?sGJkTXGhdvo+XhGZHWlhZFMX3Q7buZSK9rlviyMYMBHT02dGgqFlnOInHytY?=
 =?us-ascii?Q?ttaGZ2KljjqglcWh3hKuLj9Xc9426rp83dk9ttAyt/cRqjUs4gvOsNiK1l5b?=
 =?us-ascii?Q?GVBANhvDK4wBYT8VMCVD3CQ+eWbvT0I=3D?=
X-Exchange-RoutingPolicyChecked: 126fhPKY5/YNvxlvWMgkvHYJbonoqrLBeFygKfstdJGGPJFQlhQj7mFcl8vUd/Nwo+aTCW2qFYPCo8yRW+7j7c0qoNsbAZt4XBIzEB39Kk6WGjoreHdHPlgnlDw1xbz7UZueHzJzC55A1s3hlQt9EkTV/wCagy51AiWKJrqsCDHL/lq7CH9/rXrCBhMxn2CVdnevCtVPBz0Y9n6dvKvGM2F3ruN92Amygn3kwq/CPtWYOK1RH7Zzlxbn21/qU+oG9rE35og0MaY1XMdYmNNsu1PkgR3/e4PdfirjdRk9iShGv7kC/6QT/+mfwkRKn4a+R0WvEumTnZTT9AzpC7bNwQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed319e90-3ae0-4d85-f0a3-08df3151700e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB894536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 22:03:15.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXEpve9Kxppp88jabIwA76U3fffB3MB1H3IdCMBGLM3H5Fir8HHadAk4YhP1tTd3G6LSMTw9sByhbeRRqrTKoGtEVCZDijv79XQnYhJof+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9727
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA4NiBTYWx0ZWRfXyL+KPMpib59M
 B7btWB7oz18kl7FAF6DC/8TmyfKaQxWUl34aTNKdIdHSDwELI5AZZYklfQT6+xSNwe+XeTCEnkl
 p+2rpqWL+eIph8Yyh8AdPzysuS/PWAItj8pFNLqvIvivP979BlZCGw0niaXh/zsQTTEZ2663sAK
 4iXlaWXfqU+LNYxiw1N/84qyzu1FVR9/JmwRK4r21RsJV4VHNAsi28QC4wsmLRVr6cTTdAHjf03
 r2GHNbGoKwKzUh4mDsC2KKN77k2CDLU+2QpVBhm9ricD/wHptEK8/qxlyD3F68UYdi/hVhj/8pv
 7JKIOPzl9D/0xjR4AJqzM/ru15+Co1fUYLMXfWSBaG+uhEemTDgmAV7aoVLzsjJrCdyzuPlj4XQ
 am2cY0MGBdDEhW8TMgy/iW8yPjmvpbdupeOIHIbdPQrsw9kyJvwH+tuO/SKHk2sRUiacKGnjf1I
 9RY+DaUgYRMvdxXkUMg==
X-Authority-Analysis: v=2.4 cv=Eu9HPicA c=1 sm=1 tr=0 ts=6adbd9a6 cx=c_pps
 a=opNks6lJvPUjoR/Ci7CsCA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=qK0xRds6SMeuMA_n5LQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: dFYiXfys-OO86oJyMZfLUyfH5UmXzsMM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA4NiBTYWx0ZWRfX8OvveshE6i5V
 pIadfF5uzZ7V2BJ0E0gVv35wcuY6YUnw7QaYW8ZuuQtzPT2UwXj6CumCnulmrGvhU9drS835j64
 fVWYAj17EIaU4BIEalUli1KqOrOAhHNi8Z4W6pwge4XPc5nfW2IK
X-Proofpoint-ORIG-GUID: dFYiXfys-OO86oJyMZfLUyfH5UmXzsMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 22:03:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248570
Content-Type: text/plain; charset="utf-8"

==================== Changes in man-pages-6.20 ====================
Released: 2026-10-21, Dongo
git-bisect-rebase.1
file_attr.2type
proc_sys_fs_inotify.5(split from proc_sys_fs(5))
sys_block.5(previously, sysfs(5))
sys_bus.5(previously, sysfs(5))
sys_class.5(previously, sysfs(5))
sys_class_net.5(previously, sysfs(5))
sys_dev.5(previously, sysfs(5))
sys_devices.5(previously, sysfs(5))
sys_firmware.5(previously, sysfs(5))
sys_fs.5(previously, sysfs(5))
sys_fs_cgroup.5(previously, sysfs(5))
sys_fs_smackfs.5(previously, sysfs(5))
sys_hypervisor.5(previously, sysfs(5))
sys_kernel.5(previously, sysfs(5))
sys_kernel_cgroup.5(previously, sysfs(5))
sys_kernel_debug.5(previously, sysfs(5))
sys_kernel_mm.5(previously, sysfs(5))
sys_module.5(previously, sysfs(5))
sys_power.5(previously, sysfs(5))
sysfs.5(split into many pages)
man1/
diffman-git.1
--
man2/
fallocate.2
FALLOC_FL_WRITE_ZEROES
man*/
landlock*.?
LANDLOCK_ADD_RULE_QUIET
man5/
proc_pid_smaps_rollup.5(proc_pid_smaps(5))
   -  Improve portability to systems without gcc(1).
   -  Allow printing the commands with make(1)'s --no-silent.
-  src/bin/
   -  git-bisect-rebase: Add program.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 .../man-pages/{man-pages_6.19.bb => man-pages_6.20.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.19.bb => man-pages_6.20.bb} (96%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.19.bb b/meta/recipes-extended/man-pages/man-pages_6.20.bb
similarity index 96%
rename from meta/recipes-extended/man-pages/man-pages_6.19.bb
rename to meta/recipes-extended/man-pages/man-pages_6.20.bb
index 8aaf5271e1..a3ac2f5380 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.19.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.20.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "file://README;md5=494f3aa5d486baf2068b41eb1eec4570 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "fc0c620f07b4eba8ede128fbc267db5ebb4a67bab1aca3b01e5734956baf5572"
+SRC_URI[sha256sum] = "46f325713f2fd75c8d1f4fa42748153526a44846806d37028fab85cd0143de46"
 
 inherit manpages lib_package
 
-- 
2.49.0

