Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32378.1794847191865415089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M0zcw4VO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=57804575e2=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGGgII3080171
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=7oRuMKoAl
	TNCXk4m/EV59alKlxnJAQoWkI7AltJ45hA=; b=M0zcw4VOpCSTahREbnRZtMpir
	6lyszS3DPS/bksH8OPKTQH81vc5xYb5iGYdPHTX2/DlHbPQ8iClsogKMglPT7kCC
	sRguhV3FyTI8QrmQO7vGfTCzBaQ7f1BmyHjzYU1EyNHW7NrCRSiuBPEOmIt3rRhC
	i+ybL8LSP4v4DQNxrbU22sWwrp2RBs/lTn+vht5GCD2RKJwCAr2ltNaJP5s9d98B
	m/Lle6LYSiYlMllcAs34EUts3eO2B5GB1bJT3qrrAB0jxQWGIH5gek2xsrqyIIt+
	NERjLGDJ8xxeD8YDi9JFcgdJKvx02Pj0WUBJaeZSALky1IBs+3JOD5TJs7ZRA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021084.outbound.protection.outlook.com [40.107.208.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgy7k172-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:39:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYVbnlCAphH/l0asXF9LTVchX0r5Fi0C0nTko7rCt21NpCPwslseMRCvmlfYqTyQU9SBVDkx4DWYnWT2wensgUiTtsdkS+9tXgKFdXDNR0dl0BNz7i+nPN9D71+1tQjgnQzs1d/ZIo4wFNn6ECuLbAr86X2x0RqTAukuomrtx1EIS6vFS802yaRRBblZebXy72hU/BO9xhqTZS6VKGyKWl3gWkgxig7T0r+U7/XIHexiJD9xvp4VWM0vY3PJlWzDywgtDyTCjWZvZdvRWRPq7XuNmjETZePr0r6jOBkevMKh4mYI6WgGiVeASybSiYqih8FYHt0j4tePx2Hf/VFA1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oRuMKoAlTNCXk4m/EV59alKlxnJAQoWkI7AltJ45hA=;
 b=f5+HGqH4jV86tTK+vzLPE/a8lfk/Igk5TeTZ9WUHxg8hzPfxzu8oIi45QnN+fM522BFlX8Knaruj1bD2hDoPJApCPfVpfR2D9T1fHmCznujH48oekvV0/eNdmqUlL4pgTwDmbRk7qWL0HcrCp3+IKUjZp1Bxl8muYoaqs6B5nIQX0CMkyph8dSx0QLJP3/eS8hr6HmOPbaBpyPhWswSxOZgf/LkfFdJVIWSlCCoW30SKVGT04gp72cM3nrY1WZ0twIsBtu3u/JtpdYxKp+ue2HfowmXcEdSldkGjC7axQbRWM0DJFF9W+aQtC5LcQp/VD6w0vAdUW2IwN8roJWn3Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by DS6PR11MB9894.namprd11.prod.outlook.com (2603:10b6:8:464::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 16:39:46 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:39:45 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, Randy.MacLeod@windriver.com
Subject: [blacksail][PATCH] libarchive: set status for CVE-2026-4111
Date: Mon, 16 Nov 2026 10:39:35 -0600
Message-ID: <20261116163935.6933-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:510:174::27) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|DS6PR11MB9894:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f976a62-584c-4ad9-7a57-08df44003911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|10070799003|366016|18002099003|261009223027099003|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: YGNsGF8zw+vKl4teDYcjD0jBrWA1jGJYzN5fG4S3RidAwlas//qcu0h1sLohVswkWi/5/W/luR5Cd7yyqcYHSwZU5sZDB+QHXBE6PThsBlLWSR3X2tv0QAadYqHp/YYwuRbSGzBO/V/fCWzVb0EnR6Y9VhP/n3FP7AW9o2PND4L5D52QaeYwdqGTPtb+HmKazBfoJCiFruKl4nGMS3iR4azXQdLnUdmbnkUy5SbjMC95h4+A1cFQJi2qOteN4q82a2BUjSwiebC8MTFfblbwfDZgIY9GhL/C09+iZ+Qg3Trmh2HCAZkVEJG0a4Xo5DLx2TT4FUFMp82V067vm5daERCUJ6M5AdGNXwIAnGPLyDRaeFPJ+9Bk8l4wnhIn632T6NCMJ7UoqJvBxlDy3LAVlxeArEN6Q0tBBR89JMkGTIhQyGLzdUtM9cZCMg27QuETcJG94zhcrXetSOv3Y+A+sYKNIHAWTk28eyJSRJyTee+CdVZTGwcQTR6fZKTeYffEtMEBGWc027CXuEwAdYRx62Ka/VbA17XYdBzfWCVWuXqBO3Uvp0wettOBpCwIQrlCue/wnfbe8AvB527zmvcpGr+mocaAeHfAoiSbGb3u41pAqQqBcsq9USV9B+00CaK3INBWkFMLx+aPyVMTuJV60WLN1zZnej/eL18zEcaMKeI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(10070799003)(366016)(18002099003)(261009223027099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DpRMLijIJfecwYbAevCIEBk+Z9eGSZOCJasClvyGutMraoFFwXmkemoH21oA?=
 =?us-ascii?Q?IoIgWLYUCovwa5usuRBgbtuvdjD0jmW0Juy5f9ldeTMnZjP/AwxbDySYDplf?=
 =?us-ascii?Q?qhWb3p65U/Iludw57Q77/zLhxIf5c4lwrFa7cWR82rzDZlv98pKm/Duc1jYc?=
 =?us-ascii?Q?3g1PbRSjoVnl00qNIDc4o/PqEma1LQeDSxVCpvoomY4mPYSfERrj6a3Hg7B4?=
 =?us-ascii?Q?ACJU6GZ+zoYMtEESItQePT448PYV9xaPwJZnxiFpyzLMg7FhmyXvjlFXji0t?=
 =?us-ascii?Q?75YFIFNP91cjRbRhCkye9GIVZRKhEcLw9FATtvMBqXD/9StIIAThCZyRM6El?=
 =?us-ascii?Q?VVZAl2k/OEreb6E1GUlksT82UA9IqdMohqJG1VU4n6ITxD1VJNB2v6+O8WNb?=
 =?us-ascii?Q?nabGjiFF2EbYzEJg08qlEiJzfztvP6+NjUj8PiK5BQjpM71KLyfBnNxSZrHl?=
 =?us-ascii?Q?fYyNhIup7YDpn9sDD5U6riPqxgKb4Wd5okU+kT+3y9tmmhkUFMCoSeVvvMI/?=
 =?us-ascii?Q?lB/tmqghM02Oj7m0uPW/qdPdeeNHGPY8Q6Y8MXvKC3SVHTOHChVEMlYjURcI?=
 =?us-ascii?Q?uvJjPlyH36OskPSnD/M0Zy1bFVL4Vr5MoSTIBqEkJ/KiUFE+917kNUjBr4Rz?=
 =?us-ascii?Q?vzEYLEJYnloeL6xXeiEcKk6bd7jfn1FGB7opVcQyHUSFveBr2k/EeMDEUmiR?=
 =?us-ascii?Q?3SaoLDH/tY8CaPy8D0S3zRxRiR8SDq/qsb42LOLNVfWBm/C4tHJHh03afml9?=
 =?us-ascii?Q?aThzjcrROCb38kkUgi/auNYSNzo2yJQCyzeFohxdJ4R/mW0zsdmgh2m0rFXK?=
 =?us-ascii?Q?+yi7AsaJtoERqxrc6GTdkGJ8uunQcsJwG5gFinEGQXISLmjF3cH8ilKLJnIh?=
 =?us-ascii?Q?PtXcORyGjgJxwxwA/nQyAEQUCpv61K1mY2sm/eX3BwkbzkUnUtgb3ukgwsWg?=
 =?us-ascii?Q?gxBk2jRS8UOqSttxmQyvOWY7XKdCqrH/oXeNLyLakXq+7ctN7H4FCU0aqx/K?=
 =?us-ascii?Q?LwNkBKtk7YMs5ApHmHI7QD9HIFuEIki/OnZCzjIfBtdZ6WM2rlgFShB5+GuR?=
 =?us-ascii?Q?hvlq6KM+g6BzX1SpxS3u4Y8ITnSO4laowmkfv0GO2FNYSz2A/JefSFV7auBS?=
 =?us-ascii?Q?HPjFT0tlG3KNbe1+sdEB5uJ1KjuPTybYtEFZQeYgPmABwLio7mMv74HTTObH?=
 =?us-ascii?Q?0/sJKwOFJOikGdZZnaFpXBQwQU8H2oP3MB8+NOLul8IKlW+/kGfr1UEmZotg?=
 =?us-ascii?Q?3dsCioRkiImZCcTSHDDeo7lY9lkDTWSItzb7av2rErU0UXzb+Bm65OMzEliA?=
 =?us-ascii?Q?bktmVubQtEnjvLvDb1L0cbye0WuYujRSEh+bSKUeqMDlHaJy/DGKGhyiU9I7?=
 =?us-ascii?Q?1EYMwulgZhSPJDvrKOMxyBrTW74JQeOVXE931xTHui1DXJEpT5dzF1G8jgCS?=
 =?us-ascii?Q?EwQ+Mt+UdPGO46OLsf/Qsap4Kc3S0bfdULKMW02Zb6vAJb+Ssvl9IETtoAus?=
 =?us-ascii?Q?crDwpF/3mSkuP38HQCyzCJoqjdeHuQtwIlIqYp8YGSPRvUct+jvX4IEE8HEu?=
 =?us-ascii?Q?EVfl4wiONYiwQFJgmPnozi/Gfl1kkiCwKgwMidZGpXpYo0d0phycvifA7cJd?=
 =?us-ascii?Q?TvQLXYXM9tD0pE/AE2fg7IN9iliFBv94U6BUsJpvNFEp46lC+mPPhHlxFYe6?=
 =?us-ascii?Q?D+4b8IgehJ1jGTWBogBm+1c0kk/1DFcEaJCGVFgBiNrMojX1ANMmp7oPYzk0?=
 =?us-ascii?Q?75k6mu6OOE8WeFcBqbUBqBAJcWEAKMb6tfFw35MFIDdxhi0NXCLCM0f5uUS6?=
X-MS-Exchange-AntiSpam-MessageData-1: rBno0ydqbG4D2uc+/CVTDOyLy7MAzwJmUWs=
X-Exchange-RoutingPolicyChecked: g7XiqVOKWO1l2OF9Nm6Arvvseq7nS0HiVu/CEy3YU3bDfg2fi8joV29HfHu1iHEGYGkFzcSLLAww35YHeSRrluzfqevtOkKaDfB5Dn6+5NYpSVAqYSnRzjP+zwW/ROFhcjr7iw8wMusONyoH5qADHa5tJmdmRRqrIRPsuorBXbZW/CAAUUh8otgB29swxUaiiRCelBMqik8gtPDzvK4oadH6a5e5TbtWPldyTIdXrILh4sDn/lVwgBqLC7RwF7TEP0yRHarK9tWPDT6yttaHLOvAUlJPWqk5EToeUuZtb7Wm/t+o2pQ41VqFvN191FWwYe35guTuPxLIBeEnjD/3rQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f976a62-584c-4ad9-7a57-08df44003911
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:39:45.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8G+Jmiq6m2nd9Tw8uq/9oAunFMGduG7+XBRpt5joZo+F/eXltIq8jeZczGmkklYXWe27z5qtlN2lpWGcoXm2o5Wzd/xZeOk6iV/hUAxD8Gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB9894
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX+Gyghr3txhvk
 EjxgeQdQrTRszhY+gFDBkjb8/MFK4JRMU+p4tt+hMhtaNpBhtfCf83cQZ/1Y1aqgZbEhRpA8vV/
 2+Xzz1tsC4t1mjaoD0igh/ueA2k4VNO0AtrNrlgMxwtbOu5QuzKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX4GMj7nxUojMH
 2vaYpCabx6v4urtbSNe0JkvX4XMgaf/pLli6anApq1FdbeznRobj22zQGuej54IpTFaxEUSFqyZ
 hBSQHpF/moWk25leyecU59tRTuwwZBwmg7g9OWA0DeOribPcxsw/0hjjI7Mgla4EGG65+g1d0QQ
 MvBGvy2wX/TodKnRrI+t3Pw4jQaN1aeWxDkMfbmD7JgHm28J40JVIto+xmZ0cWRF1zLvcNQqzTJ
 04qlkLsq8Kl1+UbLgy/FPnIPCERAk5+s2d+BqD8Pnr4gvI0NvIZCgPUtBF+E18z56IYhkPDExKy
 tLitsqU0+YI/T6RY1X7dymjWxrAQm6dDjiM9fIe6SDeFUC8qK7R2E8u9/OCm8ay0LqqSK+Gryw9
 2z4LhCdGQjHdoo9YaqAwZnPwQU2xQSLfm9EL4iAUPE9Fe3Ohv0xSXj7OkoAs9nn9G8ydepogT2K
 53JEAVFtqIpfE8RPECA==
X-Proofpoint-ORIG-GUID: tr3btIGpBRBafkYs9sG5W7oXiRChhwgr
X-Authority-Analysis: v=2.4 cv=c9g+0h9l c=1 sm=1 tr=0 ts=6afb31d6 cx=c_pps
 a=0iCLHuH1wF6tAjvkAzcOzg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=qhOjpNPHAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=hfuzTlcyH_PZg8tbnwEA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: tr3btIGpBRBafkYs9sG5W7oXiRChhwgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250365
Content-Type: text/plain; charset="utf-8"

CVE-2026-4111 describes an infinite loop in the RAR5 decompressor
(archive_read_support_format_rar5.c) caused by missing block_length
validation in parse_filter().

The fix first shipped in libarchive 3.8.6 (PR #2877). NVD has no
CPE/version data for this CVE (Red Hat CNA filed it without version
ranges), so sbom-cve-check reports it as unpatched on 3.8.9. Adding
CVE_STATUS to record the fixed version.

Both the fix and its test are present in the 3.8.9 tarball we build from:
- archive_read_support_format_rar5.c (bounds check in parse_filter)
- test/test_read_format_rar5_loop_bug.c

References:
https://nvd.nist.gov/vuln/detail/CVE-2026-4111
https://github.com/libarchive/libarchive/releases/tag/v3.8.6
https://github.com/libarchive/libarchive/pull/2877
https://github.com/libarchive/libarchive/commit/7273d04803a1e5a482f26d8d0fbaf2b204a72168
https://github.com/libarchive/libarchive/commit/ef53e2023d75a205cf7cbddb5d01c4cc592e9ce4
Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 meta/recipes-extended/libarchive/libarchive_3.8.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 2eefa28532..b38f76bc8e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -95,6 +95,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4111] = "fixed-version: fixed since 3.8.6"
 CVE_STATUS[CVE-2026-4424] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
-- 
2.43.0

