Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3916C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 08:12:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.81804.1749543155866429486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 01:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82563faf14=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A5oAC8030880
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:12:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2043.outbound.protection.outlook.com [40.107.237.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2jrfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:12:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvCNy9OiddTXFCGD7La2CJ+AQBAG7CI5dbvgmJ4/i6bgQYv4ZOk7i2erm3SjL1mzjdfxCfETLNkEZfSrSzcL5Zsik4PfSZ+RFl6p/tDvpbwn5r1IAOcDirVQF/ncayk2y1WMPSJ6lHi0C5pHa6SkVt+UKOfRgtIP1G+bGPvp082yWmufGRZFR1P3ox/51CylozkLJX+/AYeFwQnN8Ug98XJIvOHX2904DaN1t+33uEd+elfXyVH3I67FGAkxpPezN4CxH+8Y2SLl7GBgQI7tnKSfB8vZprk2je/Pt5xb3518TbVu8k6RS78rYWxR6iPyHorflR/VUk6xzPAcVl5StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBeK7CjVKFuHx5J/w+MSc9zEb+aUufGtqdu7esapn14=;
 b=rxXymPCQBq31+RSmKi62WuU/hnQ8/otEADmd/xURwk4ZNZhQ8V13gD8Bh7DF8o4Fa7pigKwd/05fIR8tj2Y2iTT9wXSfiHBKC0FGck4O5QMOEYDA68r4nZspOmF7bGRBy7WiU31wBDaNr5Z8nIsXUng1BE8OcZQAQpBuCataGy2+LlWPeeiQc81HF8JTxTp7oCc9SFITsxBxLyhmrhgjdSjpxLgZWMXKeUz0q4ApTpB0Rpz9zQJ+N22bY5VGcQRfHq6YiBjd7vMLkWQuOQJajQyJ48iL0U3nyGoL58Rf/iaq8+kD1z0sJgr72BQ1IySX9N6PQLQO/E7BYej/tPt7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:10b6:806:2a0::14) by
 SN7PR11MB7137.namprd11.prod.outlook.com with HTTP via
 BN9PR03CA0420.NAMPRD03.PROD.OUTLOOK.COM; Tue, 10 Jun 2025 08:12:32 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
Date: Tue, 10 Jun 2025 08:12:32 +0000
Subject: Recall: [PATCH] rust: Upgrade 1.85.1->1.86.0
Message-Id: <L8UCEC5XDQU4.HOARE44QD4QH1@ph8pr11mb7144>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        SunilKumar.Dora@windriver.com, Yash.Shinde@windriver.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 04350ae7-98c2-adbf-0b17-6132ae6df4ef
request-id: 04350ae7-98c2-adbf-0b17-6132ae6df4ef
X-MS-TrafficTypeDiagnostic: SN7PR11MB7137:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?amRla1pKS2UyNWl4ekVBWGJEajlZUVhJazBYdm0xc0wvd0IyZ3RlT0dhT25o?=
 =?utf-8?B?S2xUc3h5Z21TMVBGZFFWQkFSNzRrT29WS1JhVDRLZ09CM1UvNFp4Y0hmWDdp?=
 =?utf-8?B?M0lKa3VOVVEvM1VkMWNQZjh4bmIyenZIVXAvK1hTam5iU0wyd25XTC9qbWFn?=
 =?utf-8?B?WVBkNUJVc3p4TStweEpYL1ZlYnB1OXZqQWRCQlhEYlU2ZDNGR2lZeVdLajJU?=
 =?utf-8?B?UHNIcEZvT2NGQ21ET1RQVmkvSnV3clE3R2JPY0hkSTNBWjBydENSWHFVR0lv?=
 =?utf-8?B?VFhoY0V1ZlpRUEY4Z2FVNWxmWkVodmlVd3cvbHVzZFpHRG1HdTBsUFRvdWlq?=
 =?utf-8?B?Q1BOZ2xLcTg4a0d2TnQ5R0JXRHQ5aG9GNDVuYnNxU2ZHeVlSTWN0c2paQVJY?=
 =?utf-8?B?R3QrWEpaRExhWEhkUVRzdHQybXNSM2lSUGczdmdvUVNqc2JzV0hKSURITmlw?=
 =?utf-8?B?ckoyRnc3YUFjRFB4RWVWVTg2MFJhc3BxYy9zZmdsdk0wQ3N3WmoxaU4veG1r?=
 =?utf-8?B?bEZXK05IbnQ2RnNsVUNxRWVBbFJEamVYWFJxSFJqVjZYL3lnUzYrTDlJOS9a?=
 =?utf-8?B?YmdxRGdHOWpWOEluY2lvZzA3K21pWndHS3BJV3VYQmNTU3BGRHdrQlFJcmh2?=
 =?utf-8?B?R0ZkbkFpVTBFS3JMbmJyN3NxdWhUZFNpUVVsbk1LN3VibnN2cnR5NlJCK2x3?=
 =?utf-8?B?R1g5dlQrUXVMMFJYc3E0QTRJZTdwd3RzSCt1MWgyZUpDN29NLzY2R0JLSmJW?=
 =?utf-8?B?T05icVJaeUhtYVNLTmQ4dGg0ZERqRFZiejhGQnBqaFdQTld3ZCtTbzQ2bEky?=
 =?utf-8?B?RGRJeDVrVktRdGtvemdZeEdjRGRmZmZ1UyswcURFcVZueE12elU3Zldjbm14?=
 =?utf-8?B?M2loSHFsdURlUCthN3NBSnQ4QnRwQUg5eWlmWEJObFNUdEJXMUwxWUdNOHJZ?=
 =?utf-8?B?UDRrNTM5TWFVRXFWNVdSdzJtQzErVFNxR0RhcXR6WVhtMFM2QXB2c0ZuYkp6?=
 =?utf-8?B?OEIwdU1ZbkpGc1NXUUI3aFpFY0dvZ0EyZ1JlczBxSlV3V1h0cnJxUlArUThX?=
 =?utf-8?B?UCtuTzhiZzg3YjU5THNES0t3eXMya2RoVUIyVi9zL2I1WnBDU2E2c2JRSnVa?=
 =?utf-8?B?bElZMTh1RHlDZFM1cnFLdUZuOUpDWjVHTkM0MXVwc0p3RXJqdUF2aFlVZ3o3?=
 =?utf-8?B?L2podzkzTGhneHV2U3NFUkxYMDMxakd5OFovSFA0RFdjSk55RkJGdmh1VENJ?=
 =?utf-8?B?MzVLaU1OejJpREhlaVRORFphNUhYWFhOeWZ2cmk0Q0ZqSUxBZ3Qyb2UzcXFJ?=
 =?utf-8?B?a0tURUhaYlpzWG80RFk2Q0l1RFUyOFNWdnY0K2NJdGNTUDVERzhNdEpTNnVj?=
 =?utf-8?B?MENydldtTDJGelBaQlBLblcwUW5sc1BjNjhtZjNOWjBaM3RnRWlCOEhTSWd3?=
 =?utf-8?B?Wm1kR2c4SWpveUFUejJ4L3pUanZtS29raExwOThoMWV4UldtdTVQM0hRbEpC?=
 =?utf-8?B?bHhLZEdKbVB5ODRzRk5EcnBtWTdZZVlSV1p4bm9CN1YyTDY2K1RWdWNpeVh4?=
 =?utf-8?B?VE0zWVArYUlncFNCNG9LMEtFSUFxZ2k4TkJJSEU3ak5NeUt1YWtURDFtRkxt?=
 =?utf-8?B?SUpSaFVEVkxycW5SN015WjBJdzJhNVJJNUxvQnh1ODdrK1UvTG11SDg2Y0hR?=
 =?utf-8?B?LytqRGRybEU5V1c5MWpFdnVyQ0pOWUsyRzdDRVhEcnpUWDFOc3NjU1hiTTk1?=
 =?utf-8?B?a3RvaDdXVEhobjhCOGxJNkFkQ3BBLzVsYTVOWHpvUS9ndWRFb25yRnY3RjJu?=
 =?utf-8?B?MUg3ME1yeVh5WlpkTDJxN2pWbG9odU0zYXdmU3lXakJqOXJIVDU1UWdpM3hY?=
 =?utf-8?B?cGM0L2Z6c1pLc1lReG9oR3M1YVA3dUlLSGJRbklTZW1GQ2FmVWZqNG50UXBw?=
 =?utf-8?Q?PiGHstopg7I=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	swXtGHApwwCTzRyNjrFWdHhNspqQs+1NsplGmeQBZeHMP2GeHEUlwt3s6d6ooq2CVbwrQhUPTeOn18GEsoJHEyMBttNf3c4MaHe7X7kFVNg5zRGbFyaD4m6ryySu7WAVfrZYprD9c53luL7BwxwtKt6hJssp8Jxdg3Dh7+MHcSsWZbcPE7DNUIHSdU6ruhmjHFerUYSnvx3iR9DC7tOoUxdi3VCfXmeV23KXMeYBpgDhbBDPYCcUaiRne3HcmpIry/uKE7VnpX786iiyXkDF/dFw6yuD8oqYzBammxt8EmWLTvR3Q4BUxr94afkdIzmPAAUso8jREH2Wv0LPikwMEosuRiXc+2eEzcb1kLHR5+oYqrYzh3OAMMvLsI6Ohd8D9GcPgd44E6OVMkXOxRf9B3RjRtggarLN3I9gUIZa2yw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-SN7PR11MB7137
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 08:12:32.4652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
	0e83c24b-3982-44e3-cd0c-08dda7f68d05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA2MiBTYWx0ZWRfX6o5f6lFMoMe7 TW0m8FYLpyhSIxx7+SGaCLAghsF9scb0o00QeUNhkWFFSAfl5nHLkG0PwVvyecYvPMo86+dxQcf 4b/rzuajaMf3Xa8Du0OcWUs1TAT4D+nkp7l5wfCF17MCaabmz9dRDTqIhz50+Q4bmDd9EU8pFhi
 h3d9DrVVV711W/FR2qnBKVra/V5TgdBewO3ut3n6LI5caPcH7xW88LjO/2XZ//uwhT0b9ROSCbv 3yHaPjXC+uOLrl5QodInltxBGEjGgdWeoO6ubaUc980q4wrpo40s7ceA5AOd3v0NUiDmUXb+yzG oo2ki5vwuSEODzj/vbaE9XO2Egy9L/EZLgxiEb/ygxfq1YN+SF1bvvVhIlTXbtCUms8+wv3Zx4o
 Y01H1fPkytTnA/4Exa+BZVgcNRLmdgTuFCHPgNg0C6dzSsknDLI4fmJj+06VIFzuXgSH0n1O
X-Proofpoint-GUID: e4bsab9ZpqImyTDirkyYYzky2Zf8JJN4
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6847e8f2 cx=c_pps a=OB/IWIoS0tBQx+prqTOidQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=trrqtOXSGte2uW4muHsA:9 a=QEXdDO2ut3YA:10 a=lBs019b3hKwA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: e4bsab9ZpqImyTDirkyYYzky2Zf8JJN4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=262
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 08:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218319

Yash.Shinde@windriver.com would like to recall the message, "[PATCH] rust: Upgrade 1.85.1->1.86.0".

