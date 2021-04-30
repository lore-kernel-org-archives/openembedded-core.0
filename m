Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.52])
 by mx.groups.io with SMTP id smtpd.web09.8183.1619765943498743524
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 23:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=nYPWBLWh;
 spf=pass (domain: windriver.com, ip: 40.107.92.52, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGqz2JlHC4j4R84QSs3V1VuXzv7YMI4uDnrNhyZgn+P1J8X+XGbHptGZEo+cFxf15t8UntUTfRnftSqEDRcq/FSriGjQ65G/8WeuOYEWNcxEamWczOoUxHKVHA3vD1rKO0RKnm6pbhvbTEk5OR2n2LfGKVnWD9QTWetGhdDUasMdVjT0ScxQ8Ht2Ch/wGNUQK75nibO5TQx9gqfz9obH7UMVEH9D7ryoLs0SxsjLPY/lJi6i2gF56q6Wh5/j/bODTi8hi3lTSnNOQwzDpe+36m6997sAPKrFt6mjicAWsp5ySF5T6j34CLCm27Bhl7X/7vGpL15DXIlNULPX/8zaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwcfJPXEv90uZdNoxMT/8G+GxbLs1R8fIGt9QqQj4Ak=;
 b=WXX341C2yTvYr8OKopB2BAm6sBN41sxPYEJUR/BG282l2ykZOeYYdM8VGTokHtY+zCWLQnCR7qkDZCjfzSpYj4QaZ7vbfFasIRoC6E/Z/SnYQk1Cfey86oA6asIJuVKbt7LNeqF8xD1zKQKe6ZTjOy+69YHhmxL+LKj+3IxM0nE8JFN1knS3ESCfjvuk7JotbZN4K6hEFHTrYWliUerc+5lfeABDuFVc4uKyvOqumnmULBFhuk1byZAdHBSEgjCGZhkkdsI8u4xp0JgIuLT+nFL+81TxZf1jHKpfwCyAv45SnD4M4wmkRg48iHUCVcyG06qtivzjsubhLhqi7chCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwcfJPXEv90uZdNoxMT/8G+GxbLs1R8fIGt9QqQj4Ak=;
 b=nYPWBLWhGOKsy5mWsXqGrekY5VtnyNTJs8icU71FRqrE8xEeKAbgWVmF3SQMufFGm16lu0hSJlTsCEsIegZHuBxcU+nlNeLCsGdcf6sa9wFagIhK6cT6A3OQ8fK41czKkqkRVvJO9ly49u5IUBT+LVh6m2pKH74LggvLjcbcUT4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM5PR1101MB2186.namprd11.prod.outlook.com (2603:10b6:4:52::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Fri, 30 Apr
 2021 06:59:01 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 06:59:01 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] rt-tests: Update rt-tests
Date: Fri, 30 Apr 2021 14:59:46 +0800
Message-Id: <20210430065946.1475-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0058.apcprd04.prod.outlook.com
 (2603:1096:202:14::26) To DM6PR11MB4202.namprd11.prod.outlook.com
 (2603:10b6:5:1df::16)
Return-Path: qiang.zhang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR04CA0058.apcprd04.prod.outlook.com (2603:1096:202:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.33 via Frontend Transport; Fri, 30 Apr 2021 06:58:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0656921a-1478-4be9-e54b-08d90ba56ec1
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2186:
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB2186FEE6C0FCA59C19D920F5FF5E9@DM5PR1101MB2186.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wPRvFE7x7N4o4WrdZK0W7njLVRZwOA3ayk5PsshhHFPEJVWQ1hlMMg3yUKrBqKl4yu1fIMhV1qCxb70KTyDCAC66yObBg3UWR9VDdUoQnr+3JsYJBJY3TM0b1k7z7WWtHrmEaPjaJw0kn7qPKuylW6KeSv1qg01auriuRlZdApua8LB5wm3xAYF08q7pgE3W+g4sR2GTAh7ZYcUWR/OtPx8bxm1yJySHWIiVGhBP6LVrdtw+wN1gd65VxlVEjp8xDOyHy4RTTi7booxlOAewnVDIj+Lt1qMgF7m+dOW6RDuK6FG85aJskOSvsqf9sFL4DSCqakq1+m+gRys9+RD7ohWw1KTIdGw/yAtLDto7GazCZ/Y/BEoVviRw3KIQBpeYT0BOBT8k9PCKIc1CVzcvVoEJEL/c4xahU5NNdKTIKPjhmp8pOIuDlxvVf4hYNqP0qjTW72yU/AilbNcDE4Mv+1jV22rEi46AzBI7scrVj8oJLTDiiZY3VBh3tAXvUuqXzyXrgV6gzPqBqAGIk/66V3Gy1m5iywY+WT0xCGCgG4iHIRtGCaDiJbZn6VrQUx86LyxyeXVoOihKc54xWogmxtMmk6UGoDSZGYSa8k+BQzHVQCYw7tafSbdI4e/YVJdwl6ZopUo2v4AUA7fiao1VqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(376002)(136003)(396003)(346002)(6916009)(1076003)(8676002)(66476007)(2616005)(956004)(316002)(478600001)(66556008)(6666004)(2906002)(66946007)(52116002)(86362001)(38350700002)(9686003)(6512007)(83380400001)(38100700002)(5660300002)(6486002)(15650500001)(4744005)(36756003)(186003)(8936002)(6506007)(16526019)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?JdgUlslSZUwXs5D8VKzVbpwH4U8WQJCxW+fZy9bNKqs+nEXAQr4ePqNSXbKd?=
 =?us-ascii?Q?prMmHbnkh26rXsje/flIyPggIL/TPeRSiUYx+FTcd3PWBZh7rDriv1ZLmaKu?=
 =?us-ascii?Q?qgJZx3HnPQnUcZa9OMniT+Q8YXccXDm6VVrDqo49kIfBAu2H3tQPKJPE3tPh?=
 =?us-ascii?Q?W5u1vyH0mAIaG44fXOMTM3SMx68NZulfy2lgWqnCElmxRQv4gdUr9LEgDeeq?=
 =?us-ascii?Q?CCMC4sQ4ZZF8VUqfodmhIWeqtpg/UNSyiC6o9UwW8aMn2lwea3xHyVKbPAyS?=
 =?us-ascii?Q?TlcKoVgjaaHsguV6OV8Ikw0xua0SUCx3BcvXROOgVyZemSZ335Z65LtBQReE?=
 =?us-ascii?Q?rPY2RbSb/ELUFNCn4wbVSocNJka56k4Vg/r56ov2U9XWbTASMrxXoWg7RgM/?=
 =?us-ascii?Q?+ioPp7Qp2j+A+bxP/a2S1EanBpLHIiw9zes/qqMsYL3FNirzBFYFHRvVZ3v6?=
 =?us-ascii?Q?kTEuOUe9Eh7LxzHP9OWnPv3ZZrr1LfU+5AkQkglKeUAm3Tii++mF7B0/KurE?=
 =?us-ascii?Q?6BEIvThyY0F36D/Lu3hN+X1O5p5cUZw9gP4u98U5o4B8fNEige6Cd+FHFXIW?=
 =?us-ascii?Q?9TE+XmcTpy5w2drKVOJ0cTJaFeQXPm5KM/Hgi2/SMSf/sCmrDr2CPOFBGXMw?=
 =?us-ascii?Q?tALe9vuPTvKXk7CouobPk2VVV2t9Y9dCp/Razhm7d7fr38sJBxQTFliDOW8O?=
 =?us-ascii?Q?01qjwSv/EGbRqb8QPrqj+PTgM1l90fAU1FhovRSeo/NaVhPyvFoT8rNSpNMs?=
 =?us-ascii?Q?UhvfYGUZh6obt4QfQyOjfZoCZyjvID/yG+DHnIbReKiwOupXpWOWIUJw1pYw?=
 =?us-ascii?Q?GW0ehEPSl9QHZdnYr+538smoZ40VxoN3Lmtxdv+6Zbf/pOQNnNDmWHCetZx3?=
 =?us-ascii?Q?0PJUw54snwwg7HBm0LsVbuULZtl7mQJi8rZsAlzlbQuFpSvN3oFJzbLKAOvc?=
 =?us-ascii?Q?wv9R54Qj/wWyWJztDj0v57dBEj5fKvRM5bnBYvF6WKhMPrswIbMDbBC6pmYJ?=
 =?us-ascii?Q?0+aZAgBRZhCxGMDr1IdZkEwg1cVcOO/hoRXSLQ7rLxQe66LW526smKcTMezt?=
 =?us-ascii?Q?GLqbpX+aPIfgF8LPI22zNI/bPmpgBd41z5GfNOcVOTLIFmnyyuRu+i/skern?=
 =?us-ascii?Q?7DYTdrLUbstHBhSuI1qxTPwFMGvzifFlE8BKfNXBQcXlgESh3lLzlzrGZ9pX?=
 =?us-ascii?Q?Tr3wAJAk0ZLrCY5l/M4hrMhCEMyIOn03xkGRW9JSKmUsgxO6c4brAKsHMe+O?=
 =?us-ascii?Q?/yl+bjqYnX8HkvKpaomE9OqpzKeLKWUCEMVvsMblSXu4J6aPuj1dLXOdicLH?=
 =?us-ascii?Q?7kGN0x/zwV8C4VgNWlk3L4HW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0656921a-1478-4be9-e54b-08d90ba56ec1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 06:59:00.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lRpFthsopu6jK9sCd//IUURlMYenZknRWcgYOqg5Va1+ultdpmRhSBrdVMT7FEaOxSojtx6VliDC/8CN0fhlkZy6OCo4gCFeHSWO7ykQ6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2186
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

When run cyclictest, the parameter enable NUMA. but in some BSP
which not support NUMA, will causes the test program to exit
directly and does not carry out subsequent operations, the
latest changes have fixed this problem. so update to the
latest branch to resolve.

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 9358f13d06..0c89bad91f 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
 # Version 1.8
-SRCREV = "32819581cc0509c9d58c33c3061f57abe0c40c88"
+SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
-- 
2.17.1

