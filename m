Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1A6C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 08:59:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44063.1752742748834888007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 01:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9293639f93=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H47ZEZ4116076
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:59:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdva2v00-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:59:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBsnKjIEt3OQMdMAAklN61o89Rpus61EHW21PPgdo2chaaBZz8HoqPJZgC6oycYsxo5rJuIKVEWAOY9XoG2Nw4YQ9ycA7Li8BF0lhLarSWi/gdFt2dGPBNGr4HLngK/5ZrTaoEAocoHCWCd848YgGVZgA71FGPue/U/nwOYV0Vog3T/gmjxp5yTWj5yVl7DxrQFerNSiZi4s9B3HJN2arlDBTHLFsWRKx6gwKBphn2s6JaCOigrVpgrR9qf3xyxsBS5mA1pRqohZTqfWEDWGHdFye9B5hJ58MV51pGY6AvQjfks0HtNrUd441TBwUsGNiUo3JsJBeAmv41oDYuAmNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEakUkdAKr7oEXL2S+rjLqBwS6uGRj9A8fOkRVgcfgo=;
 b=t7Y31YS2uFj6jJEYVCbtl15GNuoaCFEXiLP993nZMkZlUs87QvRRXO99Z5snE8ccNxwWDNr5CM+TvtH2t3YlUyATQUQ8ad1G4tu4sxyhBMeNR3iwWcabH9VzGjOIkxvskv69NkvlRb9BuyrbAb063TyVr9Yhs6WRJOeofFoJe4NEXvKN9WU60AF4hnI+mFUkmIic12MIAYmGpZXQN5p+LSo4XPiWHyepJznQywwz/lBIDo86PltWZN8mUneFKkLw92h4nHx93BgeuwDifXsHKbFWZrmAwKP5OzzlGv/vr2JETs3plg1uTqrqFrAmhSIyDs69sblXoiTKwOW1ylLUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 08:59:05 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 08:59:05 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [walnascar][PATCH]  glibc: stable 2.41 branch updates
Date: Thu, 17 Jul 2025 01:58:37 -0700
Message-ID: <20250717085837.227414-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd49f15-ed4d-4ebd-1943-08ddc5102ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FaoF8pGfDlc38bZZ6YgZyhk/sO0DuuCaYZ5nTW5Q3cfQPIk2lGChhG/n0OYs?=
 =?us-ascii?Q?AUahFmZ9zZxN81c79KAg9vpudvwCDM/h020cbINPxLJkm0P0XIoz/xd6qgH0?=
 =?us-ascii?Q?gfmeoEDoapUtKZaKgeqQv96TxJfWVRAHrVWJ/Tse/vLRkB6EU/7SgDIxyVbT?=
 =?us-ascii?Q?cErM5vUpmMY6ksTLEp52g7l4krxzePmUaiyomj95hFlyNfx3KF2XVxM2QRZo?=
 =?us-ascii?Q?b8yXOKe4AsUqNqMI1dwMFiUGyg1735DVh3gIjHJfg5Sg9UVUhzocsEFzekmD?=
 =?us-ascii?Q?adcNqvDq0DlIFf7LJnPbwdTDOSd2zTtFderVXZHZGR9imLBWTW9BmmMyrdum?=
 =?us-ascii?Q?K6dVUgxrseHo9UqJzT0rvFjMq/ivMlSNI+VHCuadg9WPLUJ8Ht5s1BMD1AZ5?=
 =?us-ascii?Q?0NYHQQSUvNlMXn0vlh8HmkUZo81ggWTwSpzWTs3AgMAqyrweELeYZnTiol9Z?=
 =?us-ascii?Q?F4kTr2b+oDfyB0ZYfUz4FhnEoGRH0YahG3ipjIujND+9QYF6XiPWmggXK+Y4?=
 =?us-ascii?Q?FCSv5PuymDQoMSdh+51Bmp+hhAscXtVG6JpzWyAr9c0XvQFss7fC/pbSJakG?=
 =?us-ascii?Q?XHKfSs0lbib9Dkce2gOkIGvOaebvIVg6zIKP/YKyMseMspTaGUp6zkQwPC/W?=
 =?us-ascii?Q?v9Gwpz5Ly0GRf3FEIjeQ4/tl64onOuvALzjvyGPiHTfzl9ZtHPb2V2m7wbj9?=
 =?us-ascii?Q?Q26doIf/EFpppP1+pSJWHpwwVD7OK27MvkOGE+V8xFp8d/6wviXOtqnEyCEy?=
 =?us-ascii?Q?BSz7j+qplSnF8jg8f0eMF1gRgldXOiZqnRa0lVetOOQ1EunQsYsO8sbixlB5?=
 =?us-ascii?Q?iKDhiGaiKpuE7x2DHsypu12BhD1hYHpdbolg8D4eZhSxc1W822kMA0IwOQ8m?=
 =?us-ascii?Q?MopqPBAbR+TmMPpZMfwxp/C1omuPTdo8ckThL6NoGutcjD91JNZPqaO92yec?=
 =?us-ascii?Q?8dZcCMUg5Nl6o4xleVxShb5OfVOWmlGUPcDisk/XYRXurxNdYZ/Eftc8zzib?=
 =?us-ascii?Q?N4yKslHcqJbMoFFHexrtRORgcMEZ+raGQdml34QarpLr+U2Z9pFwYv3i+J9S?=
 =?us-ascii?Q?MuLTC2fQ8g4JYrMQfq+EQjdkSgVaPpUeDtup5QegvqAb/V+bvYYezMRfubNW?=
 =?us-ascii?Q?blRrTWhr7oGQT/tnMJ9F594jgt01OA3k+yKxxzax+Ycyj8A/g/4Y1dnMYNOR?=
 =?us-ascii?Q?AKrWH9w6MJlGcHLC+WrBBE/Xuk0LqGdzWMse5rel7rY19Hft9+cZEzZbY+4Q?=
 =?us-ascii?Q?TIgYTHo3wsGYECmHFfw0O2cvxr1vMY+mr5rxRXMlkxoefLbSjZRviSp6N+gQ?=
 =?us-ascii?Q?IqbvmcYgdgOU8IyLHKqglbKBv+zOXQWAGwXTrr16w3aLlYPKthBrlIJheQ+Y?=
 =?us-ascii?Q?iMfS8kGPN3F4Bv/lJ3TYF22B2By3yhjw5Wldw73pujCSmGwdMhTrOqQU2Bzs?=
 =?us-ascii?Q?axCTZajBsRF1jZYPbAo+3471ToIIiNf0WjSIrTpnjn2rnBzvD+M6Pg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RqAE67GvFFHSzp9fzBhSvHPdRIPzwxfMLxoAK9GM65X2E+z5r3OwmByteBPW?=
 =?us-ascii?Q?UqI4LEi9s6unonKiYLs3TdJUzBZxpc+qAqoRldMGYbDbYg/sniuGHq3B2qdz?=
 =?us-ascii?Q?s80+ww/Df8uLEbalz71/ThH+Gdk9sWPzq9vQBP6BOhOOCnqHP5ZoTtsjfCuZ?=
 =?us-ascii?Q?PZE/GTc0JhB5Q9XND2maY8GQ6H8E9IYqt/oQMUrxJzXds5ttoTXVGZnZApHb?=
 =?us-ascii?Q?cBq47415IiMi86mWeIL3n14Cd+OChcxdo8qziI7hT6mBZAo7+o7R5CgzJfiZ?=
 =?us-ascii?Q?nhskb9yffyicayOHsH7WbyCMqAdogh6FhEgUxRD6fFGjVCGtzVuHvCNOFK20?=
 =?us-ascii?Q?wKJn0C0IgSzC78QF3zNAeGHexKn+qDdrGImW4U7no7/tZEasc5mmF3nYJ975?=
 =?us-ascii?Q?+j3HSb97Pnj4FmHcdJ4pXbMle7JgSuR6rTeg5O0EcrZA7/DeaPlabGjtlw9T?=
 =?us-ascii?Q?EUWI82Lr3FAPJIZKkldfZks9ISeQADXwvsQxgfFxbI559PDurtkhWkSHt9jq?=
 =?us-ascii?Q?ZfxZ2KEYx42aO9vKRWNXkEm/JVZVLFH2t0QUY74breVgSrx6ZEpq4r8ZPW/6?=
 =?us-ascii?Q?Gaw5YuNEzyX057H/g4aZcSx9GTczEW8hJYlDaNJrqhhM+YvQWDpMLtR0Ba4q?=
 =?us-ascii?Q?RlA+9ytGNcODKJWQvGJWf3OfTMm2c07aRYKrnH2guydwKEsjst3yTcktTs8/?=
 =?us-ascii?Q?ex+VTaZgsspKhBV8eyJX61uvY6xrWdr5goE5YZAV3hHkRwklRsGSi2PrIN3a?=
 =?us-ascii?Q?StOg34sMdiNwthOE1kyymkkeHU7hQAq0zg9YcLc+4x4IRoHCe+ciP6xPqZx5?=
 =?us-ascii?Q?XOhZImKXUxvc0pDEZfi4qvMWYyzDapbkiuF5dH3Ovnodm+U/EFsWc0IM2oil?=
 =?us-ascii?Q?BXKOQ/0pLmX682qaS9AcVdmL0Lb3+nPgCHQy0Nu4aiSiwbU8DThHPUyqvunB?=
 =?us-ascii?Q?W8EIxug9uHG1+/9A5F2NiG2m4LtEF/NCwA+cwOcrhhc6Kd/08QjJg4HtAFm4?=
 =?us-ascii?Q?WcKWrEzPjXy5SpegI9Wst9TfV4L3rb2UABTNd1Rrw1NIaKXhrP7a1/eUZSGu?=
 =?us-ascii?Q?6ZY5eqM+EaKBaM0Q5JN4kgY+IxZ7L+wYsggf9HXJXr4awS13a1yxVS9qgGYp?=
 =?us-ascii?Q?o8jlb9RR2KIneLyQkhbgCcCbDr8BsOretAA5DKlKAuUFia+KrlD5u7PntcGv?=
 =?us-ascii?Q?ixkvuFL9fwCrkqyaNOMA0NeRCPgkkj0Sz7NFz9+2tc4WX6BNthDCv9ZAtWB0?=
 =?us-ascii?Q?fB1nrSMMx7TbsOehGEMu0APFqU+mSCXgWlWojLl+THahAbE6/eqzFu75kJB5?=
 =?us-ascii?Q?hLFpdMyr7ouDoK4a0PwQX6LJbv+05VUFItSdGl7X5q+/cQwNK47B9Bzl+c5f?=
 =?us-ascii?Q?U68eXEUYDLBNAp5dIHFaXOePbta2SUFi9iKItBULXaU+0V/M1tG5WXylD34i?=
 =?us-ascii?Q?VTG+pvwleWTKdc7aPfPGIGISmgc5Ax6wSXuYI32TSCD5yLtgKCwo5sjTCrHr?=
 =?us-ascii?Q?tLlFL0sPeEAfCHZuRCH7HJbO5qQTySebOZ3fOjmOUxoN3xc9UcJLRNSyC5jj?=
 =?us-ascii?Q?S9DJxhiSaaoLsmeCIdy5xZJZTMtVrawRyuNvXqqPXMxDZL7gMM0Ydqv7jDhb?=
 =?us-ascii?Q?B7GBhHxgtZELfexybbvrOXM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd49f15-ed4d-4ebd-1943-08ddc5102ee0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:59:05.4021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qygMWhwpZz4oJNDfF+ReyMeFgRTQPGK0rvk+DJ8AyRPQ0lFMBCzpOo+6wSVgFewgK/XreesfrdP4qY/AUVKSisTjI4DC+xtdtzcNs7dbMhbVOvkoLxrwdZO9RwGMwvD/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
X-Authority-Analysis: v=2.4 cv=AbaxH2XG c=1 sm=1 tr=0 ts=6878bb5b cx=c_pps
 a=pudcQBrbfwINlGfP2eN3Hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=WxXQT_c7q7_JZ_ZvkY0A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: I3fjM9h5QK2q_8F06t0p34nJ8szwmP8f
X-Proofpoint-ORIG-GUID: I3fjM9h5QK2q_8F06t0p34nJ8szwmP8f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfXwyo5wYrUxBw1
 HCBre6kD1O525HbjqHUdSIwsDUkF1omldHfiDbBB+kTxOJodRNjFV+SlCBpFerqIKIxoDLoZLb7
 jKstm31equ7oUxfiLmpG8ohNRTuhF7YaRZTFkAMEfw38K58kvAYTT6pMslkbTn7YhaLQxjhXcKu
 BxIty4Upc2x3M5LlMRzOo9qtTajZi/pcC2MTS1JKrb6x2AWsFhOVk6Q9t6q3cIKKmLyfKq+LK8v
 4qGIz37BtqzEv00meynM/T6QxYQBbxXQsUJ0h1pt0RZcRAP6z097HBrKFP1tGYPiPKndBMxZqtc
 xeLyPRP52P5gSjfj3gS6GOphalI+BHLvVcPP55gDsiPX1bZ5TLVHrczvzmRcDwEU/oC0WQtWxu2
 YJ6KWV/Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 08:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220522

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

    $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
    6e489c17f8 Fix error reporting (false negatives) in SGID tests
    11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
    61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)

    Testing Results:
               Before     After   Diff
    pass         5807      5813    +6
    xpass        4         4        0
    UNSUPPORTED  164       161     -3
    FAIL         280       257    -23
    XFAIL        16        16       0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
+SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


