Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55AE2CF58CB
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 18:55:12 +0000 (UTC)
Received: from mx0a-00015a02.pphosted.com (mx0a-00015a02.pphosted.com [205.220.166.249])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4441.1763551647120518768
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 03:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@belden.com header.s=podpps1 header.b=2IELB4k4;
 spf=temperror, err=temporary DNS error (domain: belden.com, ip: 205.220.166.249, mailfrom: prvs=541809f34d=diego.delossantos@belden.com)
Received: from pps.filterd (m0382794.ppops.net [127.0.0.1])
	by mx0a-00015a02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ8btZS2205547
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 06:11:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=belden.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=podpps1; bh=a3Tcm8TK5YwxGH9CznZICTDG
	FDC0mGCMedbxxpo6lOw=; b=2IELB4k4TSZ0zlgoUtdTE+wDU0OhIcvsF6r6i1gW
	wfK1fD7FPTSl8WQSvwrmTclDnpX0iR7kyiCd6B7/zMbt0pWnidJEb51t8Sjuj8/x
	3HwsBgGfX5ia/YuPNRB1wHMo/9KtVvhEyg1N9Gz/bXkrafDAb5/OOqju4LudJ45a
	wRAxyuyU6K18eFVDVMe3W77cDa/AmzC/2MawmaIKMhDkeXdvgToce/XcJ9Y/5s8k
	d9Bq1m57kJ0+sDQocliReB/Hp8YXFhV8vMZMMj1Rkuh0dZNMl8ODw+Dmge75ATlf
	8hPnbt8Iagmj1MIlWQUHVD7iYq5fd6GlCSfsXOSoAuUEuQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012048.outbound.protection.outlook.com [40.107.200.48])
	by mx0a-00015a02.pphosted.com (PPS) with ESMTPS id 4agm04u1aw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 06:11:32 -0500 (EST)
Received: from SJ4PPF978963F72.namprd18.prod.outlook.com
 (2603:10b6:a0f:fc02::f30) by MW3PR18MB3482.namprd18.prod.outlook.com
 (2603:10b6:303:5b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 11:11:30 +0000
Received: from SJ4PPF978963F72.namprd18.prod.outlook.com
 ([fe80::7420:6428:2c9d:246d]) by SJ4PPF978963F72.namprd18.prod.outlook.com
 ([fe80::7420:6428:2c9d:246d%5]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 11:11:30 +0000
From: Diego de los Santos <Diego.DeLosSantos@belden.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] patch.py: disable gpg signing
Thread-Topic: [PATCH] patch.py: disable gpg signing
Thread-Index: AQHcWUUXchSl2w+BoU+bq8AY/58TdQ==
Date: Wed, 19 Nov 2025 11:11:30 +0000
Message-ID: 
 <SJ4PPF978963F72ADD7F28E59F5FF60FAEB9AD7A@SJ4PPF978963F72.namprd18.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ4PPF978963F72:EE_|MW3PR18MB3482:EE_
x-ms-office365-filtering-correlation-id: 26c5b29f-7760-4dda-55e9-08de275c6407
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?Xi3NJdNT3l7fDybl1dNvoc/dA3BIWXzwVTjLfw4NTsOj3xD/bedsUjfO0F?=
 =?iso-8859-1?Q?CrOoVEF88mnJ4108n/HFKQ11Matc61yQezh8KdXWe+Y6T+IMgQ9OJqKf8U?=
 =?iso-8859-1?Q?FN1Mo1be5QC3psc6y+Qp5tl5Bn/sNRFPEsz5Y5Ig+BECYvPSBAl6amvsOY?=
 =?iso-8859-1?Q?XUTPLFalnl7931Y0XXvBjhZx41BjhU8oHaDWTuFKV2hLZahQArsVBNHi3Q?=
 =?iso-8859-1?Q?ecE2XtERE78Wlqfj+sZdDScBOOKsiRamY032A1Fc0yQmGYktZ+qCqCXej0?=
 =?iso-8859-1?Q?dhovgtlzG/QwxLr0Rkc7MrdC8BcUSW4SbBb/MWLrKzfN4AZiy3lraSXgah?=
 =?iso-8859-1?Q?rhsk4hBqVWhHI0T5RAzlpqD9LF0VdJSqhZLXoYxyuAGhLAvSvRVvxOKt6y?=
 =?iso-8859-1?Q?lvhu2TxgTGIblz8HE+eyC5F2jivWRGqeYR3XO/IdqF1pOyWMFb/2NuRmAT?=
 =?iso-8859-1?Q?fO138g+LYGFAE9LZcxofkhlIkemPYFk2UGRAjcff4NDKNfd9uuT5OlgAJX?=
 =?iso-8859-1?Q?eMMbbt4WGE1720rwTqGRvGQuqxC3zSziDMhsTMLriUz5t6n229zT5CyxxN?=
 =?iso-8859-1?Q?A9P9qc1aqOP/0eLcgcjRiqo2QNb4k4Ny4byFMOEaTKGPAe1Na/zDtskXpN?=
 =?iso-8859-1?Q?seDdJ+yg4gIp7+xoei+sXpCTLxroyistQEPJJtl7+ed6lPczI5E9+Pe0Oy?=
 =?iso-8859-1?Q?jzaMKGV/Ki9Fr+Jv9akjSjGsZPoLZGjp4Qd3/k5CpEsVSONU8f7EkfSO1c?=
 =?iso-8859-1?Q?MQ36k2uj6leWw/koRwJnpg4ykKn7gt2AlcxM6hDkLRcBuJDvZRpi+KwCJC?=
 =?iso-8859-1?Q?OagEIMwoSp3DKV7cvnXWxLS6/MN8YtYMuuIqDWZjyljlq2RIea8OXqYot8?=
 =?iso-8859-1?Q?xY6SupYj53KnmzMgWjjVsDSJMbDqhYaMP4Ck+GGHpoO6FSgOVRDzUgtUsm?=
 =?iso-8859-1?Q?GK9joTk+u3Y5/LQaXIMtdfIo2ULkDznv/70PYEP4unC2OBH1OobTHmV/v1?=
 =?iso-8859-1?Q?2OYh/ZHEyx5uixdmVEMr0Ihy9v+e5sfSZ/N3NQUFItQshqZqbgpHUWX6Kw?=
 =?iso-8859-1?Q?gngPJQxjUHtORk/EzAEN9Py3LS/EpFqJY8XrTfvuk2zaY6hXkYDgz/EKn1?=
 =?iso-8859-1?Q?/RxjjYG4I9wvd3/uSh+oMiHI1qtoSifvOyCLqhywab1MqlvRTL2woiKLqb?=
 =?iso-8859-1?Q?cN9kUWL1IUipQY3fM3ag/aaPpW1C29tg0B5D9EN3pS0j21q0r51Wa78keS?=
 =?iso-8859-1?Q?OL9FYjF0c4LLpSDKB7lAE6ksfV8Nw7KNVyrXF7PZ5Z18i4kmkEd/4YE/j4?=
 =?iso-8859-1?Q?w3fIDDbDiE2HLQ4lDCAd5Y5jWtoewwB4UBIAbR23fZ+Bnnxnn6FTglklV6?=
 =?iso-8859-1?Q?GLVHDmb995weoGiVh4z5LNacuGRtvBwZPkjjWLy/UlUzk0851UGlnxDMbw?=
 =?iso-8859-1?Q?7lNIUThE6J3tX0umSqo7Ez8nGEt22dkaf51FRNxw+djyGLLZmVzLKjMLm6?=
 =?iso-8859-1?Q?WJ9bfTpVo4Mwef/wa9ZWY4750VUTkVKTRIOUZ5eqmKS/nHzxpH2fPVvjVl?=
 =?iso-8859-1?Q?hvTFO2iNp7W2XxuxQGP4bRju1/hF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ4PPF978963F72.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?cGdsZ4dARtvDJa48q/5L6Qg6UzkRXUFfI28IAKYaGAXjoHdR7Dc2+O2Jve?=
 =?iso-8859-1?Q?83VrnVOJwIht+6sjRLZIvrS7wGDtW6pA/pSiU0Mk7Yxnp8DsFoO/L3EL7S?=
 =?iso-8859-1?Q?OtEYNzZTzooWeYerGPGu/O+UF37/CaNnyLmSgOxfiZu8YQjF/BpVSFk7nK?=
 =?iso-8859-1?Q?2WANGVZKAWGCpcVtFWdBYKn/ET4vbn567NmRS03AQfDj72yn6jwUtrdfaP?=
 =?iso-8859-1?Q?Kc1dZEOLdSh/oSFWK/PlN6vEvW3juVIurY7uZsGOzU1bvvy7zZUCeiV8Gj?=
 =?iso-8859-1?Q?lMdn2YdlCXLDc5Q/BdT8Jelu8Kx7kjCVhvXQ1vi7oYDQOQD+VjtU1aRD8Z?=
 =?iso-8859-1?Q?tP1nFZCdpr4UKwha7U2L7Gwwr5Nh95r2zndD7PPgk12++egPTZA/8AK52V?=
 =?iso-8859-1?Q?w4nZqlV/NJhzz6KvJb6zi3XnyXWFEK7UU7IzsLya4xUElj/yL51CEXnL4A?=
 =?iso-8859-1?Q?hkAD/CqiQ7vwYjArG4IMZ2jtxA8IQakGeXfg9MWWX88mbTNRqx4uaFIFKn?=
 =?iso-8859-1?Q?26V9LhqFuenGV5uFh0qaRPw62tQAEsuCnVkUs7Jn9Be052tIf0a2eWOlqX?=
 =?iso-8859-1?Q?zHSzNxxQJ/So/yQkL0H2G4NWSB+EurOVYa8D1+GWljVSyWJye3Us3TbGKb?=
 =?iso-8859-1?Q?VpxG9X2wqQYYScJ7Ys3k1Le7IZrw/SgrrZ6gZSrXXF1NtFmDKtzJ73lNF7?=
 =?iso-8859-1?Q?uWfyNv6DGcc8LxhcM8NMPkRyOQOEQ8VMgtZWHc6wyoz0xcd/V5+7izoyqS?=
 =?iso-8859-1?Q?wYSYGpzm0UpwMBqYWw5WZeQcAECi49pv1n5jJNK1mldYIS61rxqI8DzjMJ?=
 =?iso-8859-1?Q?vOxsuEonrsg607iyz6byhoidAsHYwBesYGRc3Nv7AB/2I6qq1I0acw/5DQ?=
 =?iso-8859-1?Q?n1RoRw+VXB+vjaVakE/xYLpFzgjjD2e3yc0W1BZRjF4nZpAkjLXiXaxPMy?=
 =?iso-8859-1?Q?IXMScNzVAutfZCiKDLW9VY6dmiOc3ct/lr+YkXUZXMzIijnY0YCiEAs4hk?=
 =?iso-8859-1?Q?1k6QZXrhay5dTlm1Nfrf0qMi1OJgklJm/Q2vqNeGRvzS9jlOlekGKNAJ4J?=
 =?iso-8859-1?Q?8hT7c2b89Bu/8pYPREid6mv8NBW7rzqnT0nThuLDojg9pgdV3laaB9iTDv?=
 =?iso-8859-1?Q?W7ySRRXkVt92Qkp1lEGGto2S13LvvfFhDad63gxi6+tYS/oaxJLPtNRFI+?=
 =?iso-8859-1?Q?0zhYsIiZhYpC4wNzi4nt6Y0aiU7cc8Em1xlgFbcggN2GrOr8ryMusTwHxf?=
 =?iso-8859-1?Q?zZ1Ba8wFH4XRIratSEzApUSdRHEc0kLEFzoaQePrqxQs/wucsA0ibAYkab?=
 =?iso-8859-1?Q?zfEDSi/aINoviNsJ8ykFkt1EKFqOkvIjFCEtnFohFVkQlXg1X1s4hWdxVL?=
 =?iso-8859-1?Q?CfUJY4IV4eMLlLfTH57IgD3x9N1vCnvJqXeS9FuIljpGk0+UiwS8cHP5/6?=
 =?iso-8859-1?Q?q8KhOfHXsF82xX5st1SIUb+MxR7geDpbWcL/B7pQMuLidZoWYj12PmzXMx?=
 =?iso-8859-1?Q?elpaNm5cTV9chiZnvQk8BBZp5e6MpCTbjWXsQhccWRal9C59WD1gWkIMJS?=
 =?iso-8859-1?Q?2zzrOWFTRaSn7DGg476D5RNc2cC8v7jX+cMINMX8Upp8PImUYtNT1qrzve?=
 =?iso-8859-1?Q?Ndg5+bshiaLUk1W9o47FI07P5zFWGHAKQa6iXC1Q5t9eF2MRIqprM+FQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	L0pvXZtQ3XP135SvLKks0+6E3P7tYXedhlfo5MsHCcjpDhx8kUWRfTDWSd88gya5RLjuArtNyxHrT1gW60/zt4qV0Q77614USx1v3Z3c0ZO/RM4kP8Djyd/c5ESCTAvsT70adnAOBOXnHeYW4XRonlHt1Jjh7fwlhDI7IznTLjS+Y1y2IrUE6CPZRZs9OXXAPdwPwBIExZle1OBu5DRWKwBNf4IGCf4kAyYUCf2nktMXnjLOvFwjhMI8xnUdUW5+SLs/IBI6WfOGpX0gupO5WoBhJOO/kJ8j1ez71kETNP6Lm2w8jeD+ViYI6mE2kJDIM7G4odrxDYrD4CTILYBbOLY43A8Au72nHLuVmpAHDanWnHN5Z2DALHPMm7pNFBT47s4/wPRswp6EE9IeaX9dem5gZOfCnIM+poQYNpYEUaVCENwRG5TTfyk/T+SL8z16BfuKaqOqcLQ0oEu/j9zgeiNjVXskYOeSE+ZicQ+UBbdjxITLoIBwmIJi05zZxOiCG1L2NKWh4th03S88mmvyS+FjnZxy9FWnTWT/YQoE1V4zJlSLJljYgxYi82sMwT3oTo+DZlkDzike0O0ToG1dkMzE30CBAPlrh2KGtiN8mhUx7/tBH13pZXEsk7GF84bwYbgTQ+IttuO98XjntSmzXQ==
X-OriginatorOrg: belden.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ4PPF978963F72.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c5b29f-7760-4dda-55e9-08de275c6407
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 11:11:30.1521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0f7367b1-44f7-45a7-bb10-563965c5f2e5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fyyUpXrbAiWtYm46aPaZv7uTBYbKO1PFG/GozuoZHBKbhSepAeAVUQvmd1bDTxeXfQnelgtRt4at2QJa8kUsyrgTxASw8H+N9cZ0eHu9/PA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR18MB3482
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA4OCBTYWx0ZWRfX+rRSDu4fgSee
 n56EOQ9M5N1Q+3drZ95bzlzUdfo4nmj4glcTihE1W1Yn8lCMIt4fLwBtbwLctT4TI3hK7Xviztj
 yALxmDmSzm1mN9G++OSf27onfVuqvXTT1D7S61G3vGpmIHdxfeYL7q9/84Bc/nYUXQ2GqhXm7TY
 T7qH94ip/1hnfKpPJZwTdC9SureAJ8F4lCvgq3mqeusNPTS+nThzFah3DquGFIvyvqqm/f8vrzH
 WWruSlMgGVMCnYqg7mNi0/pXRNXZP0rk4rnqFgF8vB3BNU/9BqSx5BE5P3on6Dk56FPEsdOg39V
 EE52u4svw6loUQvMu1XLolBBJWgbc0ufWXvNqWZFSojJUXxoA5+utQtuHCPmiDQma1puzLxRHu7
 5t56yC1rI7oW+YGvUVGQixhxmQLIhg==
X-Proofpoint-ORIG-GUID: xFPcEhvXKAOdu2Yb7MEZmZ7XYVQLUHhf
X-Authority-Analysis: v=2.4 cv=AKgGEGth c=1 sm=1 tr=0 ts=691da5e4 cx=c_pps
 a=JJStoDgKLvGmSPu1zToK9A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6UeiqGixMTsA:10 a=mCf63rc527wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WDlp8lUfAAAA:8 a=LuHtozezo9jFqcHdNfEA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: xFPcEhvXKAOdu2Yb7MEZmZ7XYVQLUHhf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190088
X-Proofpoint-TriggeredRule: module.spam.rule.outbound_notspam
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 18:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226578

This fixes patching failing when git is configured to automatically sign
commits.

Signed-off-by: Diego de los Santos <diego.delossantos@belden.com>
---
 meta/lib/oe/patch.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 417333e431..5500d8f46f 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -453,7 +453,7 @@ class GitApplyTree(PatchTree):
         # Prepare git command
         cmd =3D ["git"]
         GitApplyTree.gitCommandUserOptions(cmd, commituser, commitemail)
-        cmd +=3D ["commit", "-F", tmpfile, "--no-verify"]
+        cmd +=3D ["commit", "-F", tmpfile, "--no-verify", "--no-gpg-sign"]
         # git doesn't like plain email addresses as authors
         if author and '<' in author:
             cmd.append('--author=3D"%s"' % author)
@@ -507,7 +507,7 @@ class GitApplyTree(PatchTree):
             runcmd(['git', 'add'] + files, dir)
         cmd =3D ["git"]
         GitApplyTree.gitCommandUserOptions(cmd, d=3Dd)
-        cmd +=3D ["commit", "-m", subject, "--no-verify"]
+        cmd +=3D ["commit", "-m", subject, "--no-verify", "--no-gpg-sign"]
         runcmd(cmd, dir)
         GitApplyTree.addNote(dir, "HEAD", GitApplyTree.ignore_commit, d.ge=
tVar('PATCH_GIT_USER_NAME'), d.getVar('PATCH_GIT_USER_EMAIL'))
=20
--=20
2.34.1

**********************************************************************
DISCLAIMER:
Privileged and/or Confidential information may be contained in this message=
. If you are not the addressee of this message, you may not copy, use or de=
liver this message to anyone. In such event, you should destroy the message=
 and kindly notify the sender by reply e-mail. It is understood that opinio=
ns or conclusions that do not relate to the official business of the compan=
y are neither given nor endorsed by the company. Thank You.

