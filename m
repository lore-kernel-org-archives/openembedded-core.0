Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1315.1793981153055287181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 08:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lESwdKfA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=577071825f=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F1cRG3287221
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 08:05:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=vZZFJ+iQP
	D+R8p6KBTQviFThQraJUGRUfHnM+vV7s9Q=; b=lESwdKfApDkKiMIbuhljuHsjY
	y7A6ooHGGnhGNYP/Zkk3FGZ6l5rKRDq6qEk+DKhb6k2iP1LkzLjROBiGLhDHqrf1
	Kl2lNGSSDZpa5aKE/FqaL9+RxACHMMReE/AOeGM/DcW6Pn27iFgD5YA/MJCdBmdi
	N8tq2F4TJp14EA0466m1ZBfPCUmPaGwg7Vu7LH2sbgRfod8gouK9ZZn0zYgteo8G
	OGjWHF+2zWa6icXFSZbxFnjLEKR7JrNsHpLZsnhtLfcig8fdHXpaT0fSfNZ7bafk
	pMTmEXiXUvdkPcdmFPkinUGml96rgz1qqwZIDX/fNQigThF6KAiTeLbliy1mQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11023120.outbound.protection.outlook.com [40.93.196.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hs3pr9aes-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fivwoNsvmpltHGK9qv1HHgL93F5w/TArYqj70rDLdnYpJk4UM4KDLDura1+e3hE9hVXBGefG4HMz5YFfFaxeGXyMn3tMpLe/4goiTMo0pgqDevFomi0lTyxDqBchs6V0xFoluT4vep4ep2kURuUFl7+0MO7LgNQnjpDUgivbT6rcXQyrjUjgdH0TCYQcyYKIdWrxmjX/3S0IjCkvY/hmYnsnab+ITyRG5B5Hj+iJEdF4zR3zXW1S8p6gkpgGkCfhsDOsyz6XazBGwnBQAEEvFtNEzL/dqAsLk5G4gY/VHqvcGcwOpIBH6Zf9tfbK58fo+3yB0Qdauw2iToT7BPqybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZZFJ+iQPD+R8p6KBTQviFThQraJUGRUfHnM+vV7s9Q=;
 b=QI8xdnxnSk/hhhXLWexJLQY2WZZfLNwfDQnIUBWaNeRx788Dw6bA2oGQdKAepyPkEh1bTWu/zVCT+bgkMV+nluA/YCoAtDh46Cda6QuP8Pmuc5ql8BMm5wY9Cam3AqV+xXEMqtQQRQfGW4+ubOc+XEQdXiopYmR2eQ+Q0lL6uMTN+mm+j/QFKSZepUq1tRanm+mM0Z+1q969iTmpaaLZC0ESkTstuHlcWGYqVBh0qAdqHWTV8CLKhLf/3KN3qBukEC2GUO5OHmUJ8/yi0SocIZjN5ZfyGfX4W+9c88YzeEhW4vwMoC5FiDcwg+zQoktshyngXYgVAWbgc3q+9QFyyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by BL4PR11MB8847.namprd11.prod.outlook.com (2603:10b6:208:5a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 16:03:41 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 16:03:41 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [wrynose][PATCH] libsoup: fix CVE-2026-0719
Date: Fri,  6 Nov 2026 10:03:29 -0600
Message-ID: <20261106160329.86073-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0160.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::18) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|BL4PR11MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: eebee056-62ce-49db-100e-08df3c1f86c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|52116014|1800799024|10070799003|10067099003|18002099003|13003099007|261022075727099003|56012099006|261026121527099003|11063799006|261026135527099003|261022115727099003|261026140227099003|261022105027099003|261102123227099003|261026130827099003|261028144727099003|261021133027099003|261022113327099003|261009223027099003|261013131602099003|261021121427099003|261021130227099003|261021123027099003|261021135927099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: 6BxozFJnJVyY82jheW51xScxIN3Q9fb7IxxF1jTjWDCLGPe8QowrUzmMLYvz5bB0Xvt43oyXnGaF8znFMIIIaghmaa8FjpOXjSUI/FwbX7n3JOL8lIMMZzRPQ4aOtgyPX5VuJtd3ic/pYK/mraNMthGpDTpIHowDP1g5YZkcN6CB+dI3wQlm8i45Am49kRbnUmElrERLR5Ny5nSiSoErDgTyzN6sU6aWEa78qJ8dZ7mS1PQSDTw3RNl2zI8s1evcOf4vdC2qUHr9odk7IxNFnj2qsHcxYRT0ZfAaM6zvvufDbtgsOe24qPR2Yu3rlcPwengFqvnofOvufyoGHqpxMmp4OWJCLQwKKi1D50Nu16lPJ43CqaSvW6MG+p6Ku3rgiPqPfji7nWP8DCgGwjD7nMHgtmdhyQYJ6xcI280C+ApshwUWpEkrG0G74lCUsFrGPfJS3jZ3RrVTJ1NmUSzR/AscxsUICgyIol2GG7IaJpdXbQjM59RAxkuMnlsZgKD0hwML5mu88t+8/kDMTh9/ZywM2Zqhz221qcBPLBP4SWyIo0t6OJGY6mRlJf4BHM1R5FHxyaw1tQgjTJnkphjtfdx2qD1Y/KTb9eldrfDW9z4wM9jNNz9x0xa8Mdg46zhI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(52116014)(1800799024)(10070799003)(10067099003)(18002099003)(13003099007)(261022075727099003)(56012099006)(261026121527099003)(11063799006)(261026135527099003)(261022115727099003)(261026140227099003)(261022105027099003)(261102123227099003)(261026130827099003)(261028144727099003)(261021133027099003)(261022113327099003)(261009223027099003)(261013131602099003)(261021121427099003)(261021130227099003)(261021123027099003)(261021135927099003)(260925021911599003)(260925021311599003)(260925022911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/SpotHSKauHblu639U+///WCSc+CxPQRmSa9A8ifWJKs2xj2/+dt2NwlL2LR?=
 =?us-ascii?Q?Cg2lFdAkqI0j5JyaZzBtTKH2i0xQzkSP+ee76ta6Bcd2FqvQBXMiZne4YL5Y?=
 =?us-ascii?Q?sWqQAeA7/ouAb60nJhGCS1Ei1VNtf6NHE2JlX81c212vSEWTFOB+FFg0OA1o?=
 =?us-ascii?Q?UXum9R/j5tWIp6nGuLJ+12tD/wtXSvF8dpKkBPwA/2dBCrdSeOdQTmXZAEBV?=
 =?us-ascii?Q?8HkUtvykSz1HTCJqIdMSViAckQYCVJpJE/E/SdDgR0vvVsiMXYvXIsR2oDS8?=
 =?us-ascii?Q?0nxk4ZMisfZ95p5Fk7UCsXLgc0hdd20MSc4c+Wn/M7gpuNcl2ERaJoITQFU1?=
 =?us-ascii?Q?goL4nEktG/+HHaTBmkCOKYZ63a1WAal5D032fr9njg/IsgXT/INhuOmoib6o?=
 =?us-ascii?Q?asSrhau6sjEFDIHurfSpCgJIefqZHRjCVh1tR/hklFeRTjhXAnqhBklkSpSW?=
 =?us-ascii?Q?LXpoionUX+nFSrelaupJBTm30S0RIERAxryoet7tN2X99SBRfrfsyotqD86D?=
 =?us-ascii?Q?9lcpa0sPIHmxt6B1oQ+I7XBM3Wd4DoEDlUZ/3g815T/jIQv8P+13o3EllHem?=
 =?us-ascii?Q?fpn/3PHTsr1GWaikd3MmEb2NqAb8l3n6BM8pq8TCLnqXrDastQN7bv8KewIu?=
 =?us-ascii?Q?ZIOVlJx47Y3dRiAMgkMxzFsVHqlOxIBtT8OKfe5EiWigkeFy6aK+F/u3ye3L?=
 =?us-ascii?Q?eR163kv1+91FhTlo2FO47MKdiE1yAnUgJfGGDKAtv7s+25pFG1YDOL14Ni/V?=
 =?us-ascii?Q?F1zVWeFKQcykKboPnyDySeByiupXS4X+IeffLNvIbSBVENsj4mduf32qcStU?=
 =?us-ascii?Q?8hCnb9KtqgzPs/mhWfezeF9fvbHe+ItgY3eVkt6OyNQZtaZkC85AQPMeNZz/?=
 =?us-ascii?Q?J2j4K5+bO0rNRkJuNCm9U5VBdbZF+7+fIvMjiuWFT51YrjfR60DF9dvVCXmw?=
 =?us-ascii?Q?Lcnpue2guK7O6FPFQjnLmFpxp09dCrqBI1IwqQWJ5s4pzAD9ChNdWjuvxpkx?=
 =?us-ascii?Q?Er4ho3jmbeWVWE4AnqdBoLM74hUdbNpLDA4GXlU+Kz+ZS1x9xMBYXOg6IZ/v?=
 =?us-ascii?Q?BU6bq2djbDX1wKEd3VGtLkGmRxkxDK1we3/IdYnTV7uLdBWrPOFuArE2HFtK?=
 =?us-ascii?Q?gqoEzDcSheR/Yv17/gZIFtY+wqpb648r6gMSlAKe4BCkWSUnvS9iVUqKyyDF?=
 =?us-ascii?Q?s/HEv2PlYvBcf7tMCOWZ6Yar7p/NTwpyFQ1EJMIODaIDZbURqYtLcj5t2lIO?=
 =?us-ascii?Q?DXJ9jbj6bXyfxXJfWjgvONfHfxBkiyYdABuTacPmCIRCLap4IcSJPgKy3yV9?=
 =?us-ascii?Q?8Yv7hqndVjoRt46Ipgv2MqODM/SxTKb5BxEUSmZHtsm6foU4fLxDBXQi30qb?=
 =?us-ascii?Q?qyOsHTucftgD2Ru5Y/0KhRKFwlayNEU2IwBviBSwGs8JZQIk9Q4D0Qh28tKf?=
 =?us-ascii?Q?hZy90QWA2THbum5JVj0FUCcScHfh1Wz8uw8QXJGa8E2vtxId8JsdhZhQoybN?=
 =?us-ascii?Q?Y8mOE7y+YkEWMggGU8zkCGpX59DlKTqrc+jLhWkw7erY0D/pCG4aRyxEMCai?=
 =?us-ascii?Q?gFk65utWrWRuCfpAkgbYNdqtgDXovaXRXiE8hch2f4r7U5nfWpcxk0RB2dw+?=
 =?us-ascii?Q?+Zhxs59+ewwtpN0pPjNbHdGFHYkKQVWNb3OYb7F2oLLP7OovMvenO4ukpcXA?=
 =?us-ascii?Q?UjVCFDAZisuMznlHx0fsaoqvHWGheFaBJtGojNpps858sSuZWKf0ez62lTHJ?=
 =?us-ascii?Q?/jTA3y6JlgvM3WwaHFlrqHP6e2/9D+yX4rdNlA8AhyIcJewO0UAQuiSWb001?=
X-MS-Exchange-AntiSpam-MessageData-1: 2dmnNFTt16oOjNjDoeHyahuZg0pq4/lU44o=
X-Exchange-RoutingPolicyChecked: ee6JQ+wvmPF+CqfVSgr3CAA3/Sknyczv1D49EaZ/ObnUwCohfLmPGVG9qxrFVqVS8wApKF5Ie+tAAqNdFSo7gHSeTSUErW6OJmFAQMGpS9hQKiCGEe+Yf0RiWctt4wptfiPc5ieTFRcs5QixsySNp2C7EtrcBz0M6rTjPcTh1qH4HM22yFsvsPjucW4AtRwRubYo7ApRJ5Zh+yK7RgqQd6b9mKtzO3nX1BYmdxt97StGDYHKEm6qIbg995PrBj4yI1R0VSGr2JAyLkbdxHqK2GL0dBMpORB5Cx5pyQbh7lI2VMALJNcXLgCbMhVXhKuCp9IYwHrJoZO6VzATfxozPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebee056-62ce-49db-100e-08df3c1f86c9
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 16:03:41.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHf6KhknDyEnDvDy/FX9b0q45ypgOS++C2+PoBgZMTPwyldKxCDM3TA1XlxhZdFcgAuBSswkTjVhTABFwxSEgSPrrd6nyx0zKPx/+kaetb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8847
X-Proofpoint-GUID: 3_Iyf22IUHW9Ked9lp2uKQ07E5N7W4Wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MyBTYWx0ZWRfX8xRaE0JMY/1r
 TJakFobHkm/YVOK9LxvQCVGUixs810V2otCpwTfBKzCwXRrKFLMQO5iffbtbUTYO1hNWQm8X17F
 4tyYMBYzCG+qPxEvCqYCH1HgU4e9zU+AMq5E8cgM3NRc4JKnRXb7Y/C3aGormYRlAPSL9FRgNP7
 XhDbeMvGbcg2QT3eZBvwvRu2jxpxrW/cA0y/2nsKWj4b1ynXDuMLUj9vcE4RQlldcERjCFVslcG
 roec2AonWShAJ3FvdWyK53Q3nVRzM1jA9aIYm1qm0jQlQ+CfWlgBYyKncA3LFm+vvJbo+1ApPvX
 6FqFSLcny8yo25LkmIWzXx+rIP8uvTNJTkuyiUk3cfZy8g8kwmOVzVVt/owNWa9AVgN+0COLkUa
 WjHeRZLBl+tOdtaIDqhl5Lc/fOy6GIRbCYsvFi8k9kVI0KnlpIjlFYbR4JPdOUKTBYmqCB7Gvve
 VDZcase+EvOU6Wfth8Q==
X-Authority-Analysis: v=2.4 cv=Iq6L47/g c=1 sm=1 tr=0 ts=6aedfae0 cx=c_pps
 a=obCHicajeL4Z6yanQ/wdqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=yMhMjlubAAAA:8 a=t7CeM3EgAAAA:8 a=iox4zFpeAAAA:8 a=fjap6yag92prjKDRmHcA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-ORIG-GUID: 3_Iyf22IUHW9Ked9lp2uKQ07E5N7W4Wf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MyBTYWx0ZWRfXw8BPb29BZ4ix
 qTBca7fIrS//URtcsTXDhZvkvuQ+dsVVj4EBNfJeLaICUYj+1dTov0ycZR6OxbB2Kbk6mTVp6Xv
 /yFUaNNqSNRpeMSEEx1eGadfheOgMzh9D56BuHjbvGE19AVr5RjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 16:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249699
Content-Type: text/plain; charset="utf-8"

Stack-based buffer overflow in the NTLM authentication module when
handling excessively long passwords.

Backport from [1].

[1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 .../libsoup/libsoup/CVE-2026-0719.patch       | 191 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch
new file mode 100644
index 0000000000..73e8121de2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-0719.patch
@@ -0,0 +1,191 @@
+From 835d887ec7b37c45bda55df2cf575de5bcdcb652 Mon Sep 17 00:00:00 2001
+From: Mike Gorse <mgorse@suse.com>
+Date: Thu, 8 Jan 2026 16:19:37 -0600
+Subject: [PATCH] soup-auth-ntlm: Reject excessively long passwords
+
+According to
+https://learn.microsoft.com/en-us/troubleshoot/windows-server/windows-security/ntlm-user-authentication,
+the practical limit for a NTLM password is 128 Unicode characters, so it
+should be safe to reject passwords longer than 256 bytes. Previously,
+md4sum could overflow and cause an out-of-bounds memory access if an
+extremely long password was provided. Also update md4sum to use unsigned
+variables for size-related calculations, as a precaution.
+
+This is CVE-2026-0719.
+
+Closes #477.
+CVE: CVE-2026-0719
+Upstream-Status: Backport [https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513]
+Signed-off-by: SaiSireesha T <saisireesha.t@windriver.com>
+---
+ libsoup/auth/soup-auth-ntlm.c | 28 ++++++++++++-----
+ tests/ntlm-test.c             | 59 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 80 insertions(+), 7 deletions(-)
+
+diff --git a/libsoup/auth/soup-auth-ntlm.c b/libsoup/auth/soup-auth-ntlm.c
+index af416fd2..0b8accd9 100644
+--- a/libsoup/auth/soup-auth-ntlm.c
++++ b/libsoup/auth/soup-auth-ntlm.c
+@@ -309,6 +309,7 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
+ 	gboolean success = TRUE;
+ 	GUri *uri;
+ 	char *authority;
++	static const guchar zero_hash[21] = { 0 };
+ 
+ 	/* Note that we only return FALSE if some sort of parsing error
+ 	 * occurs. Otherwise, the SoupAuth is still reusable (though it may
+@@ -355,6 +356,14 @@ soup_auth_ntlm_update_connection (SoupConnectionAuth *auth, SoupMessage *msg,
+ 		return FALSE;
+ 	}
+ 
++	if (priv->password_state == SOUP_NTLM_PASSWORD_PROVIDED && !memcmp(priv->nt_hash, zero_hash, sizeof(zero_hash))) {
++		/* This can happen if an excessively long password was
++		 * provided, in which case we don't try to hash */
++		conn->state = SOUP_NTLM_FAILED;
++		priv->password_state = SOUP_NTLM_PASSWORD_REJECTED;
++		return TRUE;
++	}
++
+ 	if (!soup_ntlm_parse_challenge (auth_header + 5, &conn->nonce,
+ 					priv->domain ? NULL : &priv->domain,
+ 					&conn->ntlmv2_session, &conn->negotiate_target,
+@@ -449,8 +458,10 @@ soup_auth_ntlm_authenticate (SoupAuth *auth, const char *username,
+ 		priv->username = g_strdup (username);
+ 	}
+ 
+-	soup_ntlm_nt_hash (password, priv->nt_hash);
+-	soup_ntlm_lanmanager_hash (password, priv->lm_hash);
++	if (strlen (password) < 256) {
++		soup_ntlm_nt_hash (password, priv->nt_hash);
++		soup_ntlm_lanmanager_hash (password, priv->lm_hash);
++	}
+ 
+ 	priv->password_state = SOUP_NTLM_PASSWORD_PROVIDED;
+ }
+@@ -604,7 +615,7 @@ soup_auth_ntlm_class_init (SoupAuthNTLMClass *auth_ntlm_class)
+ }
+ 
+ static void md4sum                (const unsigned char *in, 
+-				   int                  nbytes, 
++				   size_t               nbytes, 
+ 				   unsigned char        digest[16]);
+ 
+ typedef guint32 DES_KS[16][2]; /* Single-key DES key schedule */
+@@ -650,7 +661,7 @@ soup_ntlm_nt_hash (const char *password, guchar hash[21])
+ {
+ 	unsigned char *buf, *p;
+ 
+-	p = buf = g_malloc (strlen (password) * 2);
++	p = buf = g_malloc_n (strlen (password), 2);
+ 
+ 	while (*password) {
+ 		*p++ = *password++;
+@@ -1092,15 +1103,16 @@ calc_response (const guchar *key, const guchar *plaintext, guchar *results)
+ #define ROT(val, n) ( ((val) << (n)) | ((val) >> (32 - (n))) )
+ 
+ static void
+-md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
++md4sum (const unsigned char *in, size_t nbytes, unsigned char digest[16])
+ {
+ 	unsigned char *M;
+ 	guint32 A, B, C, D, AA, BB, CC, DD, X[16];
+-	int pbytes, nbits = nbytes * 8, i, j;
++	size_t pbytes, nbits = nbytes * 8;
++	int i, j;
+ 
+ 	/* There is *always* padding of at least one bit. */
+ 	pbytes = ((119 - (nbytes % 64)) % 64) + 1;
+-	M = alloca (nbytes + pbytes + 8);
++	M = g_malloc (nbytes + pbytes + 8);
+ 	memcpy (M, in, nbytes);
+ 	memset (M + nbytes, 0, pbytes + 8);
+ 	M[nbytes] = 0x80;
+@@ -1200,6 +1212,8 @@ md4sum (const unsigned char *in, int nbytes, unsigned char digest[16])
+ 	digest[13] = (D >>  8) & 0xFF;
+ 	digest[14] = (D >> 16) & 0xFF;
+ 	digest[15] = (D >> 24) & 0xFF;
++
++	g_free (M);
+ }
+ 
+ 
+diff --git a/tests/ntlm-test.c b/tests/ntlm-test.c
+index a92a21c8..4670532a 100644
+--- a/tests/ntlm-test.c
++++ b/tests/ntlm-test.c
+@@ -714,6 +714,62 @@ do_retrying_test (TestServer *ts,
+ 	soup_test_session_abort_unref (session);
+ }
+ 
++static gboolean
++long_password_test_authenticate (SoupMessage *msg,
++			         SoupAuth    *auth,
++			         gboolean     retrying,
++			         gpointer user)
++{
++	size_t l = 65536;
++	char *password;
++	char tmp[10000];
++	size_t i;
++
++	password = (char *)g_malloc (l);
++
++	for (i = 0; i < 10000; i++) {
++		tmp[i] = 'A';
++	}
++	for (i = 0; i < l/10000; i++) {
++		memcpy (password + i * 10000, tmp, 10000);
++	}
++	memcpy (password + l - 1 - 10000, tmp, 10000);
++        
++	soup_auth_authenticate (auth, "alice", password);
++
++	g_free (password);
++	return TRUE;
++}
++
++static void
++do_long_password_test (TestServer *ts,
++		  gconstpointer data)
++{
++	SoupSession *session;
++	SoupMessage *msg;
++	GUri *uri;
++	GBytes *body;
++
++	session = soup_test_session_new (NULL);
++        soup_session_add_feature_by_type (session, SOUP_TYPE_AUTH_NTLM);
++        soup_session_set_proxy_resolver(session, NULL);
++
++	uri = g_uri_parse_relative (ts->uri, "/alice", SOUP_HTTP_URI_FLAGS, NULL);
++	msg = soup_message_new_from_uri ("GET", uri);
++	g_signal_connect (msg, "authenticate",
++			  G_CALLBACK (long_password_test_authenticate), NULL);
++	g_uri_unref (uri);
++
++	body = soup_session_send_and_read (session, msg, NULL, NULL);
++
++	soup_test_assert_message_status (msg, SOUP_STATUS_UNAUTHORIZED);
++
++	g_bytes_unref (body);
++	g_object_unref (msg);
++
++	soup_test_session_abort_unref (session);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -737,6 +793,9 @@ main (int argc, char **argv)
+ 	g_test_add ("/ntlm/retry", TestServer, NULL,
+ 		    setup_server, do_retrying_test, teardown_server);
+ 
++	g_test_add ("/ntlm/long-password", TestServer, NULL,
++		    setup_server, do_long_password_test, teardown_server);
++
+ 	ret = g_test_run ();
+ 
+ 	test_cleanup ();
+-- 
+2.54.0
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index e5c2d18ded..c5805dd22f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-2.patch \
             file://CVE-2025-32049-3.patch \
             file://CVE-2025-32049-4.patch \
+            file://CVE-2026-0719.patch \
             file://CVE-2026-1539.patch \
             file://CVE-2026-5119.patch \
             file://CVE-2026-2708.patch \
-- 
2.43.0

