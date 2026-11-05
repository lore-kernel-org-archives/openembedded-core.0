Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6098.1793911868608615827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 12:51:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kJadaJes;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5769d39ba1=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HgQST2001773
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 20:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=kswsCcIE1
	5R6qXiUeo5QsUOfvDYt+w3AUbBkDx2vGLQ=; b=kJadaJesp8W+8j1ZJGmzG6Sok
	8eDrwDNVtcZgDcUOiorSZYQsEzaioOOdES5ooaWT1Bx+qBulTu/i5q9sUV3PThWl
	8DSpQPTLTHj70DhbkTKOHQT5nJ2aH9NcAunYH65CP5LbohUFxcJgequ3Z0AXNQoI
	Uu/oXZT1xzlyOq0ugPyV02ob33emdKQR8cJMVwPSydf5xjBxjK0C1RUbpX+KorWb
	k/gSrQap1W12dlM7lESkB6KIWCjS2LNfLxkIhRg3OHbwJuIuTR3Foc5SUqaRf/El
	l1nqHqSJDXdDgdPKNbNMAb/oCCgFsb4A10E6TfHfcQJyeOsCE7IYLulUPNzoQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020076.outbound.protection.outlook.com [52.101.201.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4jpfj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 20:51:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvi3cCG4xtUiv0DQb1yYGqbyeG0+4wCk/NlQeEqxuhJt1eFoL+koU6C5e+dknn0l6ucKTSmvkhE1tKe+HaF6qUrAdLikmanDb6nV75V88GMUJ4mVYKgA49ZcSBxrIaooOj4IewIyQMc0y3KX8Tj3Ba+UZ/5vfvByOeUHtN0xBbsYSZ+9EiyvOE6aY/ReEow4LaBfNTLUr8Y+4t0YkxQgbxmbhs1odKGLl/JGtOyZ7JyBQIH9X+57bsyfVo47+rUTHiuffZXdiOLFIjg9AO/rpUlIksvvU63kYDRDq5wzw1OpKWFLYhoR/RpvnCg/tg8WhoY7BKBr3ZldeNqMDUAE5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kswsCcIE15R6qXiUeo5QsUOfvDYt+w3AUbBkDx2vGLQ=;
 b=KfkcquiosPg2+VT451AzXva8rzWC+82GLzy2A+7HeSgPjgsxzv5FAb+8sMNej2jVprVoXY6mAqqhDPZettTpN4CQAK2Ruycfhxz9RdJjf3LaU+L6r6tFtS5vjH2VH3WrwssUlyoK8zmmE1SI1AkexuPx3MqpwrJzdGTb4qVzoK4HcfOtwLs6zk4p08RLaxlXWqEBf+gJZG9aqNfrlqVUCVWNZ45mE4H5s/pFAmnK28zFXKh76s6jNLTs3fMGuFnyo/rMOMCzm01j2fyWn7ADGI1PkBNaBCsdrTUE3IrZZJxmvFF4TTh/MhDgN251UAvnqGfn6EdfJ3rXQ5XbRA31Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 20:51:05 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 20:51:04 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH upstream/master] libarchive: set status for CVE-2026-4111
Date: Thu,  5 Nov 2026 14:50:51 -0600
Message-ID: <20261105205051.61939-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0052.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::16) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: b63ef09f-0704-4980-8c4a-08df3b7e81dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|376014|52116014|11063799006|261102123227099003|261009223027099003|261021121427099003|261026140227099003|261028144727099003|261026121527099003|56012099006|261022105027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: zx3IUbRuEm7twiJNJ1pCPqNKaruCfyTzHtFbZl3R2YvkJtOvDiAZnpBNLMjpHpHp2jdp2GAodufIw//qcjzE4WPZG3h1HDi8Vt0IyEvBqAD34Dh9XJJ9rfAkFaLS8cI5v2wpo8qv/OLMM+v5NOUbRN3HsDK9r7+ZlAZmztwNhvEM8hhY5Ml2mcWXwu1B/7kpy44oRCPK0OTVDrpogWnubrCEgQyw/Re+exTwmD7VpRZkoO3GuYwa0/mCXA+v54gcIpDTw8dP6xqqJXmnI6S/51IDABc2gvt1+lPZV3Zd4/PX8BfDStbWByXpOqVPk5J0/yxVwojn/Mc4tj5bwJRaP9Mg2GSWIYzT6qSIiwAE5VJtxLGGYz4kuXLkQBfXrsiPaAR10qwC3xkrT0jRI7VW/gwNaE/g/UizPSePbi2vq6niQyhyUF1lct9NO3B7M3XtgXIvw+G3DP/4bjtaR1cx3TZdqd4Th4GyFeQgIO1+kEfA/x4eL5tz6dmxMJdA5dw88Y07fMkeoMLPVLWhlHLCiSId+wu1N8XMhezFaLEI0fHfHGErDoCsdrX27siH8rCsU+k/zfq4OouXQOe2UcX9s26po9ZB9StFTKz9p3r4AtE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(52116014)(11063799006)(261102123227099003)(261009223027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261026121527099003)(56012099006)(261022105027099003)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4YP7adcF6vKS9GvWivIGuZqDGeMaaQGtqS9K4ekTLvJI+WiwGo0Hv0j/Jp2g?=
 =?us-ascii?Q?HUXTi3RmVBcRGqiJSxD1AQTH18bJCjcNBeiF9f5x+b8TbFo4rpIjgbC5GyJM?=
 =?us-ascii?Q?TaXbq/shYmqudEzlNfPsLdTT6FkA9ixbdmzsNOmm+0fSyufXqmFzRD/UXeFe?=
 =?us-ascii?Q?psB9AACKWGsT06ov61Q2CHCNn30TOnWipVjC2K7KzgPYnaf26q77wz6kzQ1r?=
 =?us-ascii?Q?3AdV63a/oFtjW+PqfUHu6aDAuIpcEeSetFEdZlvxGUQycxu3add7Ueop13Ds?=
 =?us-ascii?Q?kX/SmUWr3BPFgq3O9pQju+xVe/tcRwInvHQb+SZB2bZ4gWLWxskuA4751eXg?=
 =?us-ascii?Q?WyMJdLYz1U65B6pmto+j2CwREwtY4SWIqPfqE7qqqSaUqu3WU/YdMTUAPSIq?=
 =?us-ascii?Q?RknZchX1S9hOHs6yOZN6be5Oltnp1RkO3nroxp3wQx+b9XHhFvWBhDdXdSlw?=
 =?us-ascii?Q?AfIHnnN3EgXzptJvJ2p6WBZGE3xPo9Pqaf6Bt4A0i1RyBA7mqdEF5e5POYwE?=
 =?us-ascii?Q?XrzC6vfZK8/DpaRqG3+IdUL8dHLKt7EnR2K/taFJxusIjP7oRmXJDAmCInd3?=
 =?us-ascii?Q?wydiG0EpI728ycfsc7IvlD2Mfe9zg50dZKsY/T5ZJ0slTJGkl57wWV5ejyiz?=
 =?us-ascii?Q?/Y8DoMdHTgBKsekKQgqnmEfkTJCpl7OJ2twWflWw0+SH3B3VX1tgD23Pk4aL?=
 =?us-ascii?Q?JKAj2bWeGU513r8l0o4D5mMGKSoMjo1q+bvraSmPHcIsnt8ZQm1zp1dVeSmK?=
 =?us-ascii?Q?/+ege4oZfIdm1lk3ZGHO2EuOYLYlQhXHX3sGfWSD25k/6bfvxTGQRKOcMGCk?=
 =?us-ascii?Q?KPAS3Fiz/oLNeifB7R8ewrApnZntyZHs1Iu/rke/Y5VLCw/qk9RCQp6GjOEz?=
 =?us-ascii?Q?7H87B2p83U+OwLAWk14cbRVYGvPug8WZPr+DymFQmpCH9aj0zqakisNAsKo4?=
 =?us-ascii?Q?mGEaciNEwqP3IO3xLlno0Yw8RB+PTJZfsMQI0CZGEsy1/zDxrPQPS4ycz6/h?=
 =?us-ascii?Q?qjydw9xYMQLomLHt5bPVwJ9lsbxeDp4TGCc/GD7Lzt4NFk26fLtZaPLYnp81?=
 =?us-ascii?Q?yTQc1uKxxxd0ykLpYPmj0oq01aLPljoe9r/3jKFxmqSN62PXHqWgbGIQokKY?=
 =?us-ascii?Q?+KUdLmL0SxrqSabWUQifQErnJhXONjdQUA0xMi7KYDlX8WBx46Noepm0p6ro?=
 =?us-ascii?Q?BDEjJ/izhpApgdMLilQsazvUVyGG8im6VMgL0uVDXN+Sm6fenQwaeHaFJ7Mr?=
 =?us-ascii?Q?locdU5TM1NzUJ2U95RaSmWRP+gee6FALi/PJit+0EWCKcuC19EOKF4EFj0dp?=
 =?us-ascii?Q?xtD1SU7YRxDJ9SbPrEAiPyWvwfd5qtoQan/QHYNzQit202nh/DG3jFLApVne?=
 =?us-ascii?Q?H/saNO7/pT1fCahUhyT6NM+aAiGG/hSRcniQkMIdQfo0Wn2upt+zXCWSGDar?=
 =?us-ascii?Q?eKZAsKIAQQjgMsRYt9iCrsm5e2c3x08VbYLbbGlE6xYR1m+OvUr4lx1zTfP/?=
 =?us-ascii?Q?pSngKxZpsgXJnHLWbXuaXzsjkYG/8LEffcvDMaXllrutYPvG9HZwDrlzaujX?=
 =?us-ascii?Q?O8+2XfpQyDyBOs4bIKEThS7v21oF7HwbuJLEQ1vB2QdD7J+2mUODTcd8FZQh?=
 =?us-ascii?Q?gl6tQbPAumlzfsAXv9hnndRDTDYTn7HWv/iRUcU2VcZRE7H47koEwvMwNWkB?=
 =?us-ascii?Q?oig3opXUnBCt2ypibbwZLmEKtJxfMcqEUTu4X4af1T90NKcou+Qeq2lRj9wH?=
 =?us-ascii?Q?DdRgTbY36XpfpXkTSIDARsnNzW63Hut3JUOgttubaCApof/JlfLi2kKIIiyE?=
X-MS-Exchange-AntiSpam-MessageData-1: oPgbIypCNhBVNgip3t6PJhLH2YfpeiGavpw=
X-Exchange-RoutingPolicyChecked: NmxHs+J7CZ7XG6ydvbOs/splStUbsFmR7aqpk89JwIK9TsFmxpw/jkkMsQdtxN4S6Z+l1Uco/lVibDo+K6Eh3KD+uo65K5vvH9HlWsd9fzgZE7xL1nWA2u/ie/nEcE8AgwSeR/bTWH9vtXYhg/2ghSriMVveAe8OYmkA8ByY5G+JGcTRgrKkxDhgsgiSfZO/BLKBcjjAC5J5JDBr1MFYPN48QG0+RZeHjqw4hRrvWQBfc3RvuN8rxrs4MmWzYzQLnl6rpXL8ivH9wJkUt21IOQPW85k3rg8BCJpek35o2fHmKrcDJ4ATAQXSzdkt1oDavxd8vtRE/jtUn3ixXFZUZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63ef09f-0704-4980-8c4a-08df3b7e81dd
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 20:51:04.2093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t545Yfib12GiQCGVoZlZegaRFomcDp2nOmqDXkcWZ0HmNWQDfJQoebxpZyrqDD8rPYFSlwzXic28B2UOq5pSTHrwV6mRVUeEqcSmgNNwGvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aecec3b cx=c_pps
 a=wcWRxBclbL8OLrndhT266g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=qhOjpNPHAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=zMCEItk1-Um600heozwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: vzRrsKkNlh0gMV7UsAXy7uLIwyWtnAEG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX9Z4IRCq813vd
 fY6f9bbWM3N1CvKVdkIk2Rta2PM9dwx5T9RVAcXmS7cCOooKFtt8DkEKpbat3irtwTEHAHSsWoC
 U6N/zN4b7XXPTC2CD4Gq+kTxDNElih59rsZNBeQMr4Whd1udvc7Z
X-Proofpoint-ORIG-GUID: vzRrsKkNlh0gMV7UsAXy7uLIwyWtnAEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXxGo8PlHQqspU
 sPTu5AGmhTcnMQbXMGSzrBFLR0AzIv42yd/Tjp1MTHuuDcV1QTNmRJ7zgF43mXWXT4dRCj1JAc2
 FS6gIC5Ne4LjmznhG3ZQjvo/VwK5GaH5TND58dEDrl4z/eHKE0ikHvUiycLUQOeyd7pHGt2Tgdl
 O+aor2UWpU/1Ymbyvgx9vGKuxe0dr/DbJPC9GjjX8z1jeDr3VOEFBNtsH+2p6XebJM+63Pqozzv
 z5dALcyN1DG6OSpUiu40E8FrUXMAnIB24f+0BmA/AVBc1q7JnKRU4zcba3VweENzt6gyhtDT0q9
 HJR/KpFIAISWYGK+V9YCxRXpxi6fSq5Zs6JBuqZ/G1dW3sIBKok6gnxrsCmDGpXxq92zJ9SFt/i
 JRV8t/PFD3yC2cj8QF0CJegA7MfVzknDSvOXA4NGYqMmnpj4JT9gUZRF5PPOoTCfu59w90CbNQo
 /nOohgCXjdrvgSWQvnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 20:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249579
Content-Type: text/plain; charset="utf-8"

CVE-2026-4111 describes an infinite loop in the RAR5 decompressor
(archive_read_support_format_rar5.c) caused by missing block_length
validation in parse_filter().

The fix first shipped in libarchive 3.8.6 (PR #2877). NVD has no
CPE/version data for this CVE (Red Hat CNA filed it without version
ranges), so sbom-cve-check reports it as unpatched on 3.8.10. Adding
CVE_STATUS to record the fixed version.

Both the fix and its test are present in the 3.8.10 tarball we build from:
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
 meta/recipes-extended/libarchive/libarchive_3.8.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.10.bb b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
index 747a6b9969..095dd8ba1c 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.10.bb
@@ -92,6 +92,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4111] = "fixed-version: fixed since 3.8.6"
 CVE_STATUS[CVE-2026-4424] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
-- 
2.43.0

