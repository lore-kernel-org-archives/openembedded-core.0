Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.684.1793979453553396394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 07:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XMRey0sN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=577071825f=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6F1bTT029310
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 15:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=WpAhJj9yJ
	L73NYoMbkm39Z7nUSkbMc/pXNZKW+lQ9zs=; b=XMRey0sNsz5z36D+coE3/W2l7
	UJ028uT5l5E+ngBa7AsnLpKM5rn/5i7uJjWh9fJ6+bS2wmvRFMewY6/4omh/f+At
	toRYyu3mr8JmqJWjo0UyNuCS0C6JhHSzt8s0WNAREB4ak5TpngN1bcd5EFQ16rUh
	VN/ma71Ps7VFyxcagqFwYNY3K2C++vwsbc7CmSR6cqDgaNIWCVoWNc/QJsufUJ8o
	4Ppmvp74KAQKmAYLT5JrhQaDlktit5mB+u+SwJCzJgf4/1dXuiceiSoM8KBHtPno
	NPcpO6vIEwbbpxayBETnAvXVl1IYkOyQE/Mw6sQJKCPZ2A+FwstujkAh4HS/A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020074.outbound.protection.outlook.com [40.93.198.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hs3pu18ns-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 15:37:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGi9wLaSHyTlWVShPV2dXBQIj7Vkg6xuXAKt+8r56M8zUdypr8CLtEeIG9tZzo6G2jZiQI1RK+h1cx4uRAhWekqyt+VTy5fxerG2yWzOvLUUnnd0a57nztjeYPvKH3H68vnUnypWtwSHYJFKTFVrNyE4Xexc4xsmSRhbX0an7YcoVUInQHlfUS20IUJRQ3kacf2fSrjPFJkzIeBJLhScZhj51+doFMtu4hNF4V2o8BJAT+AMJ5z8lvxKueV/r8UzAc1T30w4Gi5s1T5TT4wSULTxZLzQTzuZabemdpqXHQEkflLhdwm6BYCJzW0hdh1e2Zv2V3GJK/ZgwABdfS0tUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpAhJj9yJL73NYoMbkm39Z7nUSkbMc/pXNZKW+lQ9zs=;
 b=n2IF+cFuG1+8z2wTizzMf7F6wY1b/YrJQQJ3i9v1CFuPC18FAG82+H0Grpv+WvGvaDuVYGs7eSbLBQw7ixdvneB8OkZs0LTHYczJOo16WqvG2XYSbXnJok88CiATj77ceUmF7iAYYEHlD89usItVc/326dgnGqmUqFfwCAReNvjRvcQGRjko6jtuEA7PJ6R3yNy3EBcxM6rBkD+mob88wcJMq0XjpTmInDLCrAVP5DgMO5kZEBxRHvij05WECBA184ZKi2Pm/r15svBD/IQv+ohTsU0ujB+QHXyJRcBtf+PMai1twHZMhsOV66ekt32oox7Hz/Y58ZZ+AtAUc8MUvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by SJ5PPF3A51834D3.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::821) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 6 Nov
 2026 15:37:28 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 15:37:28 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [PATCH] libsoup: set status for CVE-2026-0719
Date: Fri,  6 Nov 2026 09:37:17 -0600
Message-ID: <20261106153717.83181-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0110.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::21) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|SJ5PPF3A51834D3:EE_
X-MS-Office365-Filtering-Correlation-Id: 11191242-2eff-4005-65f8-08df3c1bdd0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|23010399003|366016|376014|52116014|1800799024|261102123227099003|18002099003|261026140227099003|11063799006|261009223027099003|261028144727099003|261022105027099003|261021121427099003|260925021311599003|10067099003|56012099006|260925022911599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: W1RDYo4yfWj1Y1fFAPhJ9mvRDxgfsDzmlB3uO4hWK80VVhwA1h8zTOnps/1UoSNJb/rX3DhVH4kBjNt5r0QNlBvYDikVVpT/SzbqdsaoGgud+lcLfNVmdTKDku2YZzeTVcdt+76OAy4NPBCelw15dkmJJkMP8Y4xisrp8gaKQwmE3um6LfsLW3dovDAc8jVnMflnNqWvftodZLj0PRvzDEj61ljqkfrg+REOYlZOgb/fcC2rgUaCVJnfLVw0OHFzV+W0Awrta5jgTc8R6VNmClz07TzOPMxVf4atWCuIcDCgultYlpJd9EIxD3QxR1Adx4yR3ZmO2YxfIfixHjW7nQPZ8jDAvp6h/AONeRN7DehLGvkydsFBdMn6dystTdNXOOeVDpOrDbh5AZ0SM9znQakQAFbNvm1mYNzW+mWJxpxlOB+E1aFUYsdrlcHNnJ9U1d5zaen5pFgoLUd8mYCWl3XEyN54Kn4o/REwdcg0f393ypvW4rrpmdmgUpmNDAAipdJNMYy2uAtRwNekk74+0njpk9U28zXE11e0cb7SCNTis8wd0ZwY0cbVIsAbj4nXPIyaV4okiTZYaII+70gnjSj5nDNiXPOeJLAP9lz0P38vyP/Vtuv8GLkOcmp+zDcc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(376014)(52116014)(1800799024)(261102123227099003)(18002099003)(261026140227099003)(11063799006)(261009223027099003)(261028144727099003)(261022105027099003)(261021121427099003)(260925021311599003)(10067099003)(56012099006)(260925022911599003)(260925021911599003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u0Unyz76o8L1c/2rozSbla0kziV6FA1xpwqTCeJKTCLT67BA8Dj67t4hy1z5?=
 =?us-ascii?Q?hAarBDV7XgCMT10qze2JfoTd7mfCPQU4KplyQRLetdCICimv0ULC7Kom0+xh?=
 =?us-ascii?Q?IqwbsPKwqIDqPJ7dYahfvhNoqn+90cI5QY2T4FCRNL9cu1UuMFYo9NWZRHL9?=
 =?us-ascii?Q?7USxnqvbCAY4HbI5xmR2JrR+ImJXqhvQH6kLTEko4jtaENV5p4U/y3JYwwFu?=
 =?us-ascii?Q?enmWlBkbwG9J784TMrT1ibq7fNHHGWuhwubEO/aTdAe3iudOopWX4qvzqTPC?=
 =?us-ascii?Q?PZszNRYoxDEOmx1sy+lbUX8sh896yS/znK41I/YPRgqOx5erh0BUG6fOBgQV?=
 =?us-ascii?Q?rJawkTp4f3nfQDRAWe239jhm4rVyoeMrkPXwnUuiMsAAYQiv7zWljGShgofY?=
 =?us-ascii?Q?N0Hr3RQndv3/V3tEkxDMlwmTqJswl3oRe3RunaoLUQ3B1dSP63hHeBWHbOxt?=
 =?us-ascii?Q?mR0w3ceRwFTqGQ9Faj1//+cnwx45m8ydT3h4yFgDAfmHSgYbTq4mqDmZ0pcW?=
 =?us-ascii?Q?QPgtc/MhJMUQtyrnZsPtpKQUYYH6ZiLTGXnzJuhexNNwcDD6RjKOzTpRikvP?=
 =?us-ascii?Q?XbcI3zXDvLOVSEj1Ox7XGU5WeZzWK0AXVTE9c/5UkOkjvKdieoTa8ODqf99G?=
 =?us-ascii?Q?TS5i2MwBiXiINyQR5ZPKlW5YEFhJe9iCFAkJiOG4cQgEv6mORzkyInllLkS5?=
 =?us-ascii?Q?aAu+Nr5fB5yy9WOKhXoe7GUOoJ8gVorNAewEzMvPv99ggMUB9tO50ZHBBGb2?=
 =?us-ascii?Q?/FjSMrCiYUcDpQ2EkSCWi0JyL3afLQUjbTjKz6nG3NmKGvoAw3lIg5wUUYw2?=
 =?us-ascii?Q?VT/50/eNiAhGWVffJwKDGO1moLc3wCGzQV5Fw8ms04huezuZiXCJsY4AmrqB?=
 =?us-ascii?Q?1cxqF3rmUJGOukFb0zPsoTU9NdUhgtOHF391J2FS/9KVgqf4eyPnrRqQaxXn?=
 =?us-ascii?Q?z1NTzJ6fZ/BBgquipqoVg6vjfmOjvXc2wkLjD34pghurRkGfJhaDwBUku10x?=
 =?us-ascii?Q?xaX5WW8M1zsik3YNz/X4Vs9TKVFSl/rJTxHmNBhbURKEy5fyT0+mD/4waGz3?=
 =?us-ascii?Q?LThIWHJ/5lsiWY9e2OstRe1i5p9u96LoczSuhYyYB8gOFOtxVqcQWA3zpmws?=
 =?us-ascii?Q?2ydMkQuqAZ7XraUzW1h41y5EpctNS7w+vragGeiBnAD5uVTww9HltwDrQxQC?=
 =?us-ascii?Q?zU3ebZSCfRDmyRU7ae3gwLrhDr7G9ZI/fb36XbvhOz1QUd8i4VSPSaIFoCAY?=
 =?us-ascii?Q?vV0dNVOdIBgimecErPhgxmq9+6FGEkoJY+MItkThDTclXRYN4jFdCDdnngey?=
 =?us-ascii?Q?JvozLWeHpGKw3sqvkO8/OeZ+LsItZXxvfAzJ6J2n+mV1wq1+Go4WWGdXcfXI?=
 =?us-ascii?Q?zxDdPdTU4oRJtdVF7YqI2i9CH4bfM6VCJZ2uws4sef0i9Nj77Uu9e+jFSRL2?=
 =?us-ascii?Q?nx3r9yWrLzdkNVvgiBCG2yLINiooQ+u+RPBL0dbFAQWr+nBASa9S7t5n65py?=
 =?us-ascii?Q?8t7BwEwyAwTrzw/m6dv4e2U7GHm87Du4PwvXG6zoLEDiKtTL4WWKdEIjthGC?=
 =?us-ascii?Q?QJFc9SpBSsByahFhzMdpS3bTSPkXjyjkahs96cgJKBXisKWFlmxboBq3BWTK?=
 =?us-ascii?Q?W7yLSFWFJ4YFGvQE7DCINvGLZ6yMABm88CI0loH4XteFKZriCw9j/nW8pEtj?=
 =?us-ascii?Q?5eAmjtTI7X3aWtNzY0iEqwYHOgyGENqyp6EjAfBS4CNp/O100ETpRM3lyYdd?=
 =?us-ascii?Q?pkOpsKiZzlNMGA0pOc1vUZg+hE8yQVFnmoVI3eM+M0c5xJbKSc4cI8vLw1A+?=
X-MS-Exchange-AntiSpam-MessageData-1: mhKXDe49m+JzPXS1svbLJY9iB5vD1CveZEg=
X-Exchange-RoutingPolicyChecked: DzmaL6CV3TrUYw7t0WWjxwIaaaL1nWwDvO8/ERmVBUQeKTdpdfu9Ab90T7vtNrPHEFc4+vhCv/ylmaQL6rPPzP3bpcCSfK2JqK5k57Yx1OT2AUA/ADW9ibBE1+duAdKEOwOCfVsyz+xndGtXZgwioDgvnl+EKWc7smiRM3AVs2a8EQWDX9NHjtDUUQAEqrgpmHLq/7ivnkZLGM3u3lgwQ2RIeSK1xr9hG4rp46TkmwsXYFaBngBoqjZbtFdmCxQ+3MFN2VRxotTsenfmgzB0v7MppJTnvee4o7xnzcMN1FlfbPF4IgLQRf11+1/aCwkaH7J5WBRXBNt9c5U4W5Jf7g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11191242-2eff-4005-65f8-08df3c1bdd0d
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 15:37:28.1214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoqytjpIiSUEVvHQmS5T8GQogxOU7A53RjFxv1LPbr+VptQ/Hw4Km5DI8LDuNRHEaYLHo7hAZoLWPSTVLktW85MaACWdNui4hlfyZremb8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3A51834D3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX2r5Y6vmHpKQm
 PJTaeUUy5jRq/HvqdxB2X5FIHKJj55U+21bNvHtH8kjmimcIBLl5oVEG2o6JYkSHyV94hmWa+4Z
 boXM3rlygj6CSzKIJnLryZDjxSVy3LIJVdeGxV0Abv0fFMbDWS+v84NIWJbuAcU5ILOgY1fk2HI
 nuoZR22MMpO1BwIJO13p6DlGJr1vsGGNWjqcIqrIP4+mrjo8ANyg9CKh7CnFnYEtDK8ecmhflCZ
 s4Y4pZ/ebkrKRzEP0KjdkNZaTYbDndt7ZLbAFRXjw+VIhLmtSHKdaGs6SToIZ85Xaqm8lRK4qRB
 M/N9WshkDIpioXaEEyXDa71pNG/9IaD4E1pPDjKEZ/oHTI0AK1/aCT9K6jBnl/u0XC+5GyoDg5R
 lWWycqxgeNTHj36dn7ftX1oLC5tB5p3/GWIf/wUIKf5OeXGTrReQAJ221XycGhnepzAyC3eocb7
 B/0NcpXvBNucvOn0mvw==
X-Proofpoint-GUID: 5rh6uDX2RO0EwZBmPcasxhs_-NjRxT1R
X-Authority-Analysis: v=2.4 cv=Hf+B3SE8 c=1 sm=1 tr=0 ts=6aedf43c cx=c_pps
 a=ydTOzwc5oh0TSxJkn1Qoyg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Ie6wDQvhI9px07Uog3YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA2MiBTYWx0ZWRfX8MLcY+Cu7heY
 tTwrdECdvZEtuemqOLjhPRGPEKxkZsh56wT+z8gRveHcED5xymSodh91uK5Cbu5z8clL+24dudI
 wxsvNP/WNkICJVZs9A9aJ7ook4zBNnefm5Hh0nWufnVNwTOI4JCg
X-Proofpoint-ORIG-GUID: 5rh6uDX2RO0EwZBmPcasxhs_-NjRxT1R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 15:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249696
Content-Type: text/plain; charset="utf-8"

Commit fixing this CVE is [1]. Fix first shipped in 3.7.1.

[1] https://github.com/GNOME/libsoup/commit/1972635264f1d9ab1823c8b6becf921b4125b513

Signed-off-by: Sai Sireesha T <saisireesha.t@windriver.com>
---
 meta/recipes-support/libsoup/libsoup_3.8.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libsoup/libsoup_3.8.1.bb b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
index 241fc1ee78..34d0efbc46 100644
--- a/meta/recipes-support/libsoup/libsoup_3.8.1.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.8.1.bb
@@ -88,6 +88,7 @@ CVE_STATUS[CVE-2026-1801] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2369] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2436] = "fixed-version: fixed in 3.6.6"
 CVE_STATUS[CVE-2026-2443] = "fixed-version: fixed in 3.6.6"
+CVE_STATUS[CVE-2026-0719] = "fixed-version: fixed in 3.7.1"
 CVE_STATUS[CVE-2026-1539] = "fixed-version: fixed in 3.7.1"
 CVE_STATUS[CVE-2026-2708] = "fixed-version: fixed in 3.7.1"
 CVE_STATUS[CVE-2026-4271] = "fixed-version: fixed in 3.7.1"
-- 
2.43.0

