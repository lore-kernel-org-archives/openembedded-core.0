Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.44])
 by mx.groups.io with SMTP id smtpd.web08.8926.1618838338980233805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 06:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OPHSgzpX;
 spf=pass (domain: windriver.com, ip: 40.107.94.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px3sXOH9fVZI1uUULe8mUDlWx3WUklGSv+KswhgS22xAHjbFV5RhyJWSewQVDwt24KgoXorIdANHiAr2C94c2oEUtqkoA7Nq5kk3YbHq2Tpkjl8RXmTdWZn6XCTog3So4pLzkGjuyphlWSVmy2PCVFAIH4YReUijgBtrispKgsHvywiaEqVVftwwasiZgp9nYneNkv4kNI3X9esuxDqk76uogApDLdT1+uanv8OHFLNTUHt5dkIQhM4dbpw7bgPnbJIkAN0CQI0G3N9VoKJHtzmW/183OouQC7Iue0GVV4lUIK2Ab9FqzQQgg2jjiArF6vK3ih1n6ghgYPUpNptBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AviAkwZmlqavshQVUPKzQPGUuxJi1uRG3VqW8jOYvLk=;
 b=g9Jcf0kONiMYeytDz5FIrur2D4ORs10sM1VZSr8fHLfhrTbBlqRPh4e4Rp+FwDVGqf6hhtRqCxdtZf9Gq/AUkvpVV77mnu+Bi5F3ZcgDwYyfgREk9yHLY1d0dRcCpyKR4nx9iQFm1IO5jBb4BC2qZt3pIpsNK8tLt6+sV64PnzYxQjOgRvEy311/1H+DD9G1qw8O7Pgo0ftU1zkduMSFROHjQMESuIdQtTLKJ/yJcJjP3zGJLNjEROaC2gg7cFXXlxDeYhiI9DkpdiP8P00cBXYE1v8Cel3nQUQBBy/NEL2nwHF0VSaTPthMYvr2y2YZA6cIQ4SmzfEn2kE3VT31uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AviAkwZmlqavshQVUPKzQPGUuxJi1uRG3VqW8jOYvLk=;
 b=OPHSgzpXP9p+jqXqsUx+8hqTa5sCeh3B4F3qDdOYsxwsGR9kyY3VzZ9JQcIqg4HHV0abPo8FEVijXvaF+lLc7iyncba+5G7PctrPJIg9VWcz3TQQKKPKj+DNmgT1BkCKvckNMGNaxyFWMI5lO9i1ArNgr8MV7p0B9wrM5l1Plvo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2677.namprd11.prod.outlook.com (2603:10b6:a02:cd::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 13:18:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 13:18:56 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] nettle: upgrade 3.7.1 -> 3.7.2
Date: Mon, 19 Apr 2021 09:18:47 -0400
Message-ID: <20210419131847.24317-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BY3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:254::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend Transport; Mon, 19 Apr 2021 13:18:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8d39808-6fd0-4da8-ee21-08d90335af6a
X-MS-TrafficTypeDiagnostic: BYAPR11MB2677:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26777425239EA951BC6181489F499@BYAPR11MB2677.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AlNkSebFd/LcScxB1WfuZsOLo3itRBU4n/sFBr0tuQ/TSMw3P7VaHLwa3FYysxLa8W33ziLbt9RqEA2/lNAXc6tm6I3mGTeL0kFrf/kwJK0QNBa6dLJ/waCH6TPoF9yaBu/NF33YgCxKEzL7af4f1CwmNBxtW5H7FmL5rlsR2+KHHpnefUZJ6kFoKZRCMd7xc5hEFhAt0vf6UManegeajDxgoT2cgbqzyDhKZZuIsuT2Wj/aSFUq0JCUVLchzKWL14C6HJBb7ME7ydxEhPJ01ATWDYluWsxEbJK3219LSSB9UKWo8zrH75DGSox+In+Xjpr6LHxS807xRBovnU5ovGdP2fEEf1va2nxVxFBexSBTSUe9RETw9SLiEO93k09a0CZmTSNkPXdD5LAopxtafGbmxDMZT7dRpPz8R8y6yjHG4ALq/uP14wVvJMW16IMpsuxp4NCE1UQZ868tVnyCPHcMpQHWNOWimqTcRbm+8kBqA+Vzjau/PdwWqKVYBKV/OmG+DnOMpvdk0PotBsLfWSr45AKbFx+dhawoO4Mf9BfBBuEX2oJ3HnQLoC1DM3tiEa4uF0pDGVSwnvUXRjPpo+n5hYjpIC3KWjI4nQfU+O23g1yb3BP6fNjr1S/01Q7lBHoYCKwDSOREZgWmhD61AA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39850400004)(366004)(136003)(6486002)(2906002)(38350700002)(186003)(38100700002)(8936002)(1076003)(6506007)(44832011)(36756003)(83380400001)(316002)(956004)(478600001)(86362001)(6916009)(26005)(6512007)(52116002)(2616005)(6666004)(16526019)(5660300002)(8676002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?ugGB7W7EsiUDdnEpbj/g4A3lt+eDMsKu9izMbRf5N3nupR2LnvI5MBP2CCq6?=
 =?us-ascii?Q?5zb2uVw5mlsOe+yudNfVUngvavqUqbFPCRD2r1LBaJXoJo6raJrKi6w05zwl?=
 =?us-ascii?Q?3audWJZc+F2b89XZjZS7Ksu3FLqmdumP49pUxUyfCyYECjXagOKzrDIrb5cG?=
 =?us-ascii?Q?9R7aINvuaPnyVaO8osuUl9ZbK9EBkvFcouK8kcDnYyuJ7mb2oZInH54wTIa0?=
 =?us-ascii?Q?KOxyRKjMJ4yH/hXXir2F997t0xS4PRAUlqFFh58w+p9VvuJLT4Gtxc8tRrFB?=
 =?us-ascii?Q?U4bTnCEzkUEBXAPESkm4bI/20mosxlvM3pNawFAo0eBiETQYxvqhONd4EoT+?=
 =?us-ascii?Q?KS4zWQVCb+leENk6FhLlfcCtbs0E6B7tC8KxwZgSfYxbqC3yZdNfF+a9SNmh?=
 =?us-ascii?Q?X1UGDnJfHsl+uAttoKMC1+MFGg3NNrKO5wpNMJJlyOZGpXAQrqSwGw5Oe0H7?=
 =?us-ascii?Q?sQfxqeq7dU7wKOB8B1NMx2ko0+yXogvKrxueivQSCcj9qANd/zLJ/w65knot?=
 =?us-ascii?Q?psEZ87D8d8Be5BxLCelK21offJ8Lk8lGOwLo5eYbTu7OMWQGegUMwXWfahH7?=
 =?us-ascii?Q?A/plIvPKB4rFk2+3hsDe5OpT/gtHs0NF1V+jomEs3HbOMgV0lKymDbCVZ1L9?=
 =?us-ascii?Q?0nzDhDvL2Ty6WLgk4EiOcgGW49/v0lyqTlIZmqKP+Nfp8wTtLVqaCOjexWN/?=
 =?us-ascii?Q?UR9ZlypWCegCm2KwABrflaKTA9VcGeX+JKLPc6SBjh/fzMNvXEv4znBcAP2D?=
 =?us-ascii?Q?FQg7AB+F1FFZEGNpfJ58C0gYhjp1yY8GxOYLK/+oebUXAOtC4sI+vqDfCFRB?=
 =?us-ascii?Q?PD1tsLpqQ6KoIpQFaoa6ZtZqh6mAyFGxNo3dHDnENGKNXzWqEW00XFBLT677?=
 =?us-ascii?Q?L16KOxfa5naZAUjHZbckBpcc4x9F0831+vVG2zmQjKIwfSqtrlPWsb2hEmar?=
 =?us-ascii?Q?9WigdYiTZlvh9GnXk0PiifgJMOEofouswQJGtQoFPI/4hJAWJ4WDALxERcp+?=
 =?us-ascii?Q?5jV4wUSh9BtvQ5kVpdf2jxRJe2YOCsGBneU55jvruFm3vCpUyM6YNIZwtBIK?=
 =?us-ascii?Q?4bc/1+OaGYyeT1/MxA9p3ThUgenKWVHaghySNdNQMbAlRbsRnS9lssLXvDOA?=
 =?us-ascii?Q?RsFr1A8mLhh9B+4Z8OPq7hfCAI+X5mz4c0zroqSWbn5Ax+0C9Ykr0PBVzL1X?=
 =?us-ascii?Q?wrxcT9Iu79PcyotahKt260InvXP24yTT7+l/h1L0XUV8uk7VK1SMudFiO1Cn?=
 =?us-ascii?Q?7hf00a9Cbwj1VSLGCNGyKEcC5TCXUCoR/hIRY2i5ApNTbF/FSCPPmuMOZ1hI?=
 =?us-ascii?Q?EzyXuyxYmJ0RLy9IUSv0tz2b?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d39808-6fd0-4da8-ee21-08d90335af6a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 13:18:56.3035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dyX9c7eapLalCzoEIer6NfqeUHXNDWLcLqkPdcimIi0z5AHaFpl5sfVxbPpxX24Da7OfZ2BOXn71SnOWfopOjPoy5jr1oDxhjDeyBvjr7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2677
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Version 3.7.2 includes a fix for CVE-2021-20305.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-support/nettle/{nettle_3.7.1.bb =3D> nettle_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.1.bb =3D> nettle_3.7.2.bb} =
(96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.1.bb b/meta/recipes-sup=
port/nettle/nettle_3.7.2.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.1.bb
rename to meta/recipes-support/nettle/nettle_3.7.2.bb
index 3bbcf17c7a..f8f3360086 100644
--- a/meta/recipes-support/nettle/nettle_3.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.7.2.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-target =3D "\
             file://dlopen-test.patch \
             "
=20
-SRC_URI[sha256sum] =3D "156621427c7b00a75ff9b34b770b95d34f80ef7a55c3407de9=
4b16cbf436c42e"
+SRC_URI[sha256sum] =3D "8d2a604ef1cde4cd5fb77e422531ea25ad064679ff0adf956e=
78b3352e0ef162"
=20
 UPSTREAM_CHECK_REGEX =3D "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
=20
--=20
2.30.2

