Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31650.1794846909200118408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 08:35:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cPz/VvT+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=57804575e2=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGH7Me4034005
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=zuwrvk1HH
	NbinGrRJsp1eEW6nrSawvw+ngd3iL51HVM=; b=cPz/VvT+VYxqPpoICiNA9/UMj
	0Nm9ygsAcvR9w6NKNVyPgN2EbYT9tvaqBDmdZUbEMmvsg84plW8ZjzC9jjWIWuHk
	pyzvjIA9s54aQpLLutnhPj1RtjyWwyktZw385rOgRlnu2WNCWzkypMUi0gz74kh1
	xInmAqhk768k9nhy+S13HoPa2W3YhZ7ohfjaetU7jOqN0yWCAm+hBXAC8vGdSM9h
	hcmyeDnliKV4fe/u43ADwIvGUKYA3xQpPUgwp9/5YlQZxDx0vClkiHkBmkffVZSK
	vtPaSxRpydgMTSXRGQGUIKKpAGXSVS0hlOAwATxW7l4Ecg5cbF/2rJY/Y0qlQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022138.outbound.protection.outlook.com [52.101.48.138])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hxgwab05p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:35:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGYl1HQC0pvLbjP7amPn3svWcuaVH4quRqDSs8rflQJgnxqRMBsDgeyWN/B6qK6qhjQzJVlbtKfJdVwgT450cy77WsHezr0jW3G/Wq6QcLulvpydu5/hqFDWmztLsIhIc5XtmZ6uejBMB8POOXFYgkx25zy4vJskkeZaKzb/DMzXIFkoPbMkWgmqt4jCiKWiSMzQM3p4bUfUvfK3yFJCy3+1xguQBmj9q74/0kiuimj/ju40INfUGZnq+V1mrllBkJe4QeWId5oG1yQk+3lb4ZYyU0KJYZ9H+miOuk24aBqT6RPfvjXLFdGGRGC/KWFF+9LFozUi4crSBXQd/gYefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zuwrvk1HHNbinGrRJsp1eEW6nrSawvw+ngd3iL51HVM=;
 b=Zlr2MSCUDog72isEU7Dl92xRZEqi1e1Ryc0oVLruhwScaKInHqFFzmPSf35+rJ0ZKDq/KVNflAXyj9ZgIQYkHg9e8MXKWtwct2c5dyt23ZnJISwS/+hjM3WgGqPdSuLWgiQKbt+ppx5T1K6n0MNTGg4qoUGjWzTbU3Kew+k6MOhB3bciY8s546aUwo6mzSEkOktlsq3TMs9MWCT+fYpWtPtua2YSAPV3QK1M+gNFZyh17zj42zDeZuNP4HrObsVGcMy7tc6f/ihkmuh7eUhRGOW/JW+RXBb5H9BhzAevh14pZQmFM4IB8J+uQWFl0YqbhwyYFrFrYykO+QU52JbTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Mon, 16 Nov
 2026 16:35:04 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 16:35:03 +0000
From: Sai Sireesha T <saisireesha.t@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: sumanth.gavini@windriver.com, Randy.MacLeod@windriver.com
Subject: [wrynose][PATCH] libarchive: set status for CVE-2026-4111
Date: Mon, 16 Nov 2026 10:34:52 -0600
Message-ID: <20261116163452.5982-1-saisireesha.t@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::24) To SA7PR11MB9594.namprd11.prod.outlook.com
 (2603:10b6:806:4cf::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA7PR11MB9594:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b620d60-0f1e-44ed-9ca9-08df43ff906f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|52116014|10070799003|261028144727099003|261009223027099003|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261102123227099003|11063799006|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: vI4CO8zp7LwPzU6ccxNhcTZr08tkiREQ1YmcJvJ/HK2MljGUnrh/J+pWBTofk0sG8HwHrI+rWyqX3+5TmdLViOgM9rkPhWeF/f6dqZBZER+i7xakf8UuQWRbtBFdiOjzfYi2iI6aybKsGHRGfvzQc6URaDyYPC/lSaAkC+QyCKA+2k2/HQ11jCoPKDq4S6gFeKJ9EjmkkdgLl3AinIbU2m7xX6/AfeIMydmCTTKadS6xvdpryvUysiQQ2Gr/xwa8gjzEnCpx7YL3hauJrQAJ2lLWgjyzT5p7/GlbBetS9Dtlm52tvDJtu32qPGsdeyxFPdWzsA4DyOineOOWldpbaR4tKwzgrNtF8FrXHirCKve+xAA6OCWrKY61QvnicclM9/T32bJERZqoDW0xi7Xr/BPiikalB2rI67YlYDG10BJHrrj4dDsUQKxq5VDv8rtw5tu+fT0GJgKwy6EuoHb84YjHl0ucr+GMYGcRZceLGJPhYnV91SvOO+Sod3mpGC/B1T8j55TagLQEpVHak0gFhfKf7JtHKqnbINRrWZBQVE0Mb8jP0CYZrR2SdnK+Od3MEyyTUjZzVIo9FWTAT85j+srYD0ezLnZ+fScjdtrg6Ie8PA80FQBfKUvY8Km9xVu0pqmsiQyiU8vZ6LPkppWNWonj07+vaQtSDNlTPhPj+Lc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(52116014)(10070799003)(261028144727099003)(261009223027099003)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261102123227099003)(11063799006)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4kr+NN0HRiHVE5pKITTpzAdDH0A50rVoyWHKK66rmG2BoaE6+1GARhamn5fs?=
 =?us-ascii?Q?V9l/mnXCOqMzY68/UycxHbWZTvotSzsGm1fVZanTfeZLi7BKRTrCLpvQRRGL?=
 =?us-ascii?Q?KkG9NYtX6730PZn2xH8TJ67IAibRi46Zc786ifdGedRaa0GKnqe5yEIdiFTR?=
 =?us-ascii?Q?nGjzGV9PcBSYcEgO4AflIYZRrqWeOZpbpiM+BPa4CXcp8RGTU+unDTTJKZP3?=
 =?us-ascii?Q?IpwcEFbcfoyXCrZnQs7slVy+icFYlhWD0yuvMse36EAeOywvlL0k4+XGBo6F?=
 =?us-ascii?Q?qlwJjZbAmgaygXilDIUaJOIQ3xDEf5eCFI4Smm8PK3I45uT5AtJOxxejEv7s?=
 =?us-ascii?Q?lRqIRRmgEub6C/Ig2FV/Sj8y7Yk0X5+/rgdew1qwiv/TddwJYU1UZDh757tI?=
 =?us-ascii?Q?wbZPSzBFE1BiAGxKI7taZPep7C53FHfL8MUa9cI3xxLfsRFEdzXvVKhdUd9q?=
 =?us-ascii?Q?XNFcusIZymf93l2Sc3XMQfeIFjUJLnpUkbdBvUAk+g9Ec+C5XoasdCu5vsJd?=
 =?us-ascii?Q?RyBnBiwKLlEAaB97IUA6ixAZf5iWbq1e6sqMkwjR3N8y8r1XlMLQd3kh3CCr?=
 =?us-ascii?Q?U/xbQ4ajEPBoWTC/XZYbaC9zEVWgrTq3qmyuvppVblL22aiRrheU9HnNR41G?=
 =?us-ascii?Q?JrO10iEgW7X+zZ3HDTz2PuAPbK846mS5MX9iPim3BrKisPkaC4de9VbtnqlE?=
 =?us-ascii?Q?1DxRP5Yhp0mKhpWxpZu/DcnM95dCfG2G+bcbEDr2U8MkvbbQXHvNW19e5oiG?=
 =?us-ascii?Q?DhEFl2DopiBiLcTJpD/qE+7RNTPYkJfYSJtn2mH3rH/6FMQBzCAenbPFESry?=
 =?us-ascii?Q?QaRiVm6dmHEwUQ9j3zeOL5Wj0Kk7KUfo71ydfDvFb/MyS0SRGxgbV8crt0Le?=
 =?us-ascii?Q?rtijIOkl7iDp5re70FPrJXvKGwjLD+DSqhUHPOBAWHvsU6O6xhsFZIHmhdTm?=
 =?us-ascii?Q?BKN5n8wx6jCKXjXr7USPwsHgVAhBpt9Kwf530DKfft7zmt2Ka0AMiK2s2YOQ?=
 =?us-ascii?Q?SZnIq6AfVlSdr+dn0ruvbyCLt7vxt9/Skpx1OvR8LCA/zl1CTht9i99Jj2Zg?=
 =?us-ascii?Q?6ZFqCvIS9oje5T8TJUeiigiN+9k5ZXQZY4RkHR8MbqAAvTL2Irk8jEGpF646?=
 =?us-ascii?Q?05PWgYXo+TgR4O1dY+/OqZ66GIaxO32DVeBUCS+0YElz/+T35+o6vig1tslU?=
 =?us-ascii?Q?JIW7+zwV/u4xPH/aWentytbAwJior267tgrLdsB30mR2LvqqrUUc5sEpU8Vv?=
 =?us-ascii?Q?EoZbH6LdwA2CEKsqNc2oVXOrqzCxaIm5QZQ1brCCaCGxtpYGPmgv+/eiacYd?=
 =?us-ascii?Q?f/QQ1onfUyt2+1rrVuZuxwDmZoL1OkCrQsgJMKc6grSP+IdLShrZI4mGTga1?=
 =?us-ascii?Q?CaHSnzj9hL5J82TB0yQHIZpfxDvZuMwcKUL30tGiZjd/OqxuCjIp5IzNQHZz?=
 =?us-ascii?Q?amw1wsZ8dQof/w0BWxNudMjatab77sC/NsRk+kSi+++It3Xl3v8yUNqo4jI8?=
 =?us-ascii?Q?v16oa7hZuxIHtyvJ5A2XO0thgoCOQNKHGmt6TJveAJFhnsbsnIcuMnd/ItqV?=
 =?us-ascii?Q?ifuhk3nrQ+YupXKLG1o2knlTbLHKFbDOrQVF8F1ACYwGoddj0KDuYS7HuXEc?=
 =?us-ascii?Q?VeRkU+mk29amc26gUOAdvLO6Pxeusn0Sv3O7G5pyqwkE+M6o2dh+LeWAB+Ez?=
 =?us-ascii?Q?sazat7dll9hPE+x2eMbhmImSNeE90GzIgGOdr8/ytB8nPC1EHUbZssscf7Zc?=
 =?us-ascii?Q?vbEn/bGaS6HAGj2bvKWzvO+eqLt7evdxRNGJthTPSKqtQE+GKJYdBChVX4yz?=
X-MS-Exchange-AntiSpam-MessageData-1: CG3q1wvse0QaP9FNHL/TFwb6jM8CW08NdXs=
X-Exchange-RoutingPolicyChecked: pVJuiGlfKB8GJTqDK105Y1PBnL6JBMVo/9eSESmBFrzR5FB2lac4rJn+ZGnNbMtQHhmDGazd0HRgCULvopbEoE/1Ns8gar6gKW+OtkJoMcvlhR5LWLno6ADfUelRZdK+rIY3bvTypX6uheSZKOq6iOMM8Og11N+S53haYNl4+Y7VMne/2lLEJFBWGNJOrrbr0jOiQipwD7B/wR7VP5qzCotBwUcc2KC9GVnkm0NYNjG9mp4yWnHXTlSIPDBcB1FUasQVrTcLeHELDDXvfQyrRKBCNd88LxVpkPvf5y67gHcXUILo+7hIHpMfGTIEbktkk5/jgc3n5cBtebQ1rCIq9A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b620d60-0f1e-44ed-9ca9-08df43ff906f
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 16:35:02.9742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7+biLh5yZlULE/zJcyyFUZZ1FiTIf5E1dR7xoVRZa4XgXgem2L5S0ObRTWo/+Sph0eIa/Y6Tx0MOub37j9fYEfY8K4ZQWaLokiRQdgFx4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
X-Proofpoint-GUID: 6U-D9DvXy1GuviUBh7zPlXEN3lUdFK4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NSBTYWx0ZWRfX6Eoz0vi/3VrQ
 QgJLfUolM5rspeNNv+Zb9/zeoClTvRBmiX+hJFMw9PXd7KJnn+3/Hopa4GtVuoX8VZrg60GfTdu
 ZDr0kcAdIKz/ZjS+HgwQDTZxzhUw+KLzniQ8Qstlp6nAiHyyNUIq/KdRH0pM8Lpv641eTJtBaoE
 FuHA6WlPNST4oo1O6Pu56a9SLmxQxXO8FQBl6jCb2tw7cE7XrGZ2RdmXuap8e9VaLymRClzptdB
 xGiOg9MPyr+/1HdQV86drB8Ds5aMPNYUco1arYZnzF1frp+7BgRTRvJepN5iw2qH5qXqr4OBJ7p
 2tmkP8NfMhZ4oiFoTY53lxLQRZwaXQY03yr0iIwjVHZCGJFTlfE+n5raOlYyXLiLy3VyBi4SaU/
 p58R9jCqYAWOYfKA9gBRvag4W9Hndrx6fPnjUkaI+5PybDi3fd0xyJYIgeebgnRhXjVGeJxs84i
 NlC/lu3blhP+0FIJwSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NSBTYWx0ZWRfXwKHQy7/ckU0t
 ukOmzNJV2NCEgeKnczrHN89yAi8PzCROruIVfryl88wWk1MfCwe3qGHpmgb8vnOjhTWsp2xYEdN
 Y13AhoBuxbqdopb95qj9QKHE7B0dnMgos2gJ7d6jBA5aFnZT1BF2
X-Authority-Analysis: v=2.4 cv=OJWyTiaB c=1 sm=1 tr=0 ts=6afb30bb cx=c_pps
 a=9zj7lKEKmmm8jlyvJfKehg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=qhOjpNPHAAAA:20 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_jTuoejvMRxamUYzDI8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 6U-D9DvXy1GuviUBh7zPlXEN3lUdFK4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 16:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250364
Content-Type: text/plain; charset="utf-8"

CVE-2026-4111 describes an infinite loop in the RAR5 decompressor
(archive_read_support_format_rar5.c) caused by missing block_length
validation in parse_filter().

The fix first shipped in libarchive 3.8.6 (PR #2877). NVD has no
CPE/version data for this CVE (Red Hat CNA filed it without version
ranges), so sbom-cve-check reports it as unpatched on 3.8.7. Adding
CVE_STATUS to record the fixed version.

Both the fix and its test are present in the 3.8.7 tarball we build from:
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
 meta/recipes-extended/libarchive/libarchive_3.8.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
index dea22287fc..5ee625bd6b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.7.bb
@@ -90,6 +90,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest += "bsdtar bsdcpio"
 
+CVE_STATUS[CVE-2026-4111] = "fixed-version: fixed since 3.8.6"
 CVE_STATUS[CVE-2026-4424] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-4426] = "fixed-version: fixed since 3.8.7"
 CVE_STATUS[CVE-2026-5121] = "fixed-version: fixed since 3.8.7"
-- 
2.43.0

