Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.89])
 by mx.groups.io with SMTP id smtpd.web08.6447.1618563931703681433
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 02:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DAiuCQZB;
 spf=pass (domain: windriver.com, ip: 40.107.243.89, mailfrom: qiang.zhang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLoeOvexsX5WEcCR7tbb/o7vrNWxucbmIJFlABbiRy5T9WEDmj3QrvE5f/+jd9jk6NjdL+AyN9DBEdbqZWxxW5jIMN1aHfSfqQM6+nTgO1LZsrssM6Qvz3nzM2iok0Efo/GwpRWXYJTo8jgW8U7ehlwUdXo/UEVunC0G0bbc2xQVoi9fSyUBMQmxIhH69AWExO6DCAYydcm7fJrA5o+NkyePrazww+zPsXNECEFOKA/f97/0KRwLFXAZm7n7GlJS6aWOY+QuDNBX7NAlBWCdULZ1u3xbg0hUFtypkYeyC8kIr6uFgRI3JU+Y7GsZgtnl58QS9wzYEm3aKC3bA+fp8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k76BnnHgexIY9gZjDYSVvRvzb9VBAYki8B2eeF94daQ=;
 b=JT6uTniZVACX8Od1kinDy1okp0v9KxyQvZ6wLNzpqbD3duS+jTRUqySE9df6vzRTwBsCm7g6f2JbBdIkw4GSd8Oil4R/LFd7t4zhur7ZtLBqEgvER8D7LFH0VwydhETYSstuggl1E/IVzxkyYx4qPsZHQjR9MdUuvdNTfdVPy8pal+5p14Koabk7TVQ3KTB3CODiSJdeCqZt7B5JM5Q3o8WAElvQWj+kwERFFVD4112LM+3iUo2ktAVNrpjsNZIvvAM0AuDXkrSEY5sSA/YoRjNEZ6YiCSFf1Fve7Gte9jfj72VD/pCDg70K8gukVkdckOv0MUeIr9PKMeeNktvegw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k76BnnHgexIY9gZjDYSVvRvzb9VBAYki8B2eeF94daQ=;
 b=DAiuCQZBjJEFiD50z4+6zgdLqkcUgFwRZ07wFGUSUPrVEdLUPMJEkD0UWpB3E/+kBpiY8AyLNcScPk4uEO5fvnFBsmQ9I7ISsBl6zr/4F3rYei3VVd2bViP7ClYSVkBpmy22dOPMn9LRlicJM7mO2EqJ6e2OqoYv/9pssYdlY0w=
Authentication-Results: redrectangle.org; dkim=none (message not signed)
 header.d=none;redrectangle.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4202.namprd11.prod.outlook.com (2603:10b6:5:1df::16)
 by DM5PR11MB1578.namprd11.prod.outlook.com (2603:10b6:4:e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Fri, 16 Apr 2021 09:05:30 +0000
Received: from DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274]) by DM6PR11MB4202.namprd11.prod.outlook.com
 ([fe80::60c5:cd78:8edd:d274%5]) with mapi id 15.20.4020.024; Fri, 16 Apr 2021
 09:05:30 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: robert.joslyn@redrectangle.org,
	bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	linux-yocto@lists.yoctoproject.org
Subject: [PATCH] rt-tests: Update the latest branches
Date: Fri, 16 Apr 2021 17:05:58 +0800
Message-Id: <20210416090558.1681-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0049.apcprd03.prod.outlook.com
 (2603:1096:202:17::19) To DM6PR11MB4202.namprd11.prod.outlook.com
 (2603:10b6:5:1df::16)
Return-Path: qiang.zhang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR03CA0049.apcprd03.prod.outlook.com (2603:1096:202:17::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7 via Frontend Transport; Fri, 16 Apr 2021 09:05:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0249c365-29eb-49c0-0cc5-08d900b6c869
X-MS-TrafficTypeDiagnostic: DM5PR11MB1578:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1578C0CA4951EEDE224D853FFF4C9@DM5PR11MB1578.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CJqpJPso6pOcQ3x8xcRETm8zdwxINr/KvN2mzDjlc3xgvLxJdFsEArOOJmghwqPQvwLiw7J/8f/YJ1bWl7zedETIvq4Ml+/PaMSjIaQGMV6nK5cMsUmSSn0gMgzL2d6Fs2qOFIIsaZKFE5wo4SCTsOp7Joum+OlbibkfEHXMr3dPvCpppTp8HhCuedGnwL33UNsVatdI5gH1+8aLezAOGamoeeEr8oqoEfDeyF3tytMoaRK764vqUMErtyWh3ykmEetUSUVoxgBI8kWuxmDK1UQY5H9wHqk/5OubLFazLOOnrq4OV/AI0fhVSBWbjsF6uw3C3n9mONz6cequhkNsCwbFAh7qH08MwMgL8OTUAlj8cZnQnMrSoWs2Ym0J7wwLqEXQxzPS5BPkji4XjkmFK04/Kfbo7tskFqVBKuLkS6P3I8+OgkMwmOLAc+SZbaMWK04ZCBxf/Be/wl1PKsEpK4GAAjnGtjnF6O58vKdBckCbkPnvi9SDLgLqL4sN/xpbHjsKetf8X9+uSFNZqjIu7ak/xpX7PHfaZVh0qxWgFiKxdC7o7Mbtj5hYhMYJmRbLE3xT5pHiYKF2XONcIbKOraQrltsh/bQB3rBneI42YxK7OJmZt+fbcVT4MQy7Kjy3pV1XqrGbxzNmmpfg2q1v2yOXjO/b9fHpoyMxGADTNYE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4202.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39850400004)(5660300002)(2906002)(26005)(8676002)(186003)(956004)(38100700002)(9686003)(6666004)(316002)(2616005)(36756003)(6486002)(8936002)(38350700002)(52116002)(16526019)(1076003)(66556008)(4744005)(86362001)(6512007)(478600001)(4326008)(6506007)(66476007)(83380400001)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Oa0v81TqLqAh2TGrc3BFWoPwk2xxaxNqqXYIt1eRRM3me4QiqOcx9S6v8dUW?=
 =?us-ascii?Q?D8JlO9Q5k+kPDRtFFkyYLsY+4SVGqfC4unqT4xGVt6jo8roNY7PXuZvwfAUv?=
 =?us-ascii?Q?WBJfguc27G7MQvvToWxKEUysSedrMJ7Flsa3ANbjs3peBt5meZC8U++URLV9?=
 =?us-ascii?Q?/ZPneyESMNKQuBXCxGF5SIrkDICc7si9Qra/X/5RG/ygwUpF3zUnP88xazaE?=
 =?us-ascii?Q?7nvPceaBOAQjo7JaMdA/BYYbNtcwqYSPEKppGJauxJ/7fqRnG9f1pw6V9f9v?=
 =?us-ascii?Q?vjwuQfzpT69O7tWhv4P7GtDlcOBWCveBp/GZZ67TxfQcHmoIgiK3NWw91IPS?=
 =?us-ascii?Q?BI7LsAyyMuQ3px4N1rUmBZ2iV7VQeYbqEpLxUhnDs1TEcIn+xujxucslynZV?=
 =?us-ascii?Q?DjBTluD0orDRIyoJsrXWZXPAHbzAvV+fKtMVz1NlqjSAI8kmb51bqrI7bKXd?=
 =?us-ascii?Q?gn52VkbaszHUczgjDdv+eoIL9K15cH9dA9yohSHtQsEMzrWkW0VnuCf2oH/3?=
 =?us-ascii?Q?/RT0EckoDbpQi0tC2mE6Su1qS1sfs4BtRnY8d9cqXr0Nu+NijR1skCuhAtjW?=
 =?us-ascii?Q?57eC9c+L5JK7EGD1ZTj7/cB5/9501STR4hMsbtBKLI7TD/RRxV3/GQ/lhO45?=
 =?us-ascii?Q?WrUvrz80g1p0IdyMp/yemE/Mah5nlfi0nqNhKdzK4wogN2v0WyrIv/+vesZK?=
 =?us-ascii?Q?J58WzRHgLgQnHwSamY2W7J586dPbWGi4sWsDHaRhkR0kpf6f5SGSJ/x0mWOA?=
 =?us-ascii?Q?OcER9B68fOugRybneg5QAsuCiOsImpdAooAULcixlCenm9bqbcdo2xlexFuT?=
 =?us-ascii?Q?61CRMfCmsraOHxlgsldM2zh4DocjVdZ1zWm9PNxs/bamwbLBXzxpQ+TZn956?=
 =?us-ascii?Q?yMoyMkJUylqOB3V5G029NbNirbcvDdLl6rgd/iq99ZgvOgtAuo0+rDLlzVje?=
 =?us-ascii?Q?2aykM4wH0HYBNjEZ9T8culzg7Ay7h2B16FQD/6iPl00YesB0O6g4QV6seAz7?=
 =?us-ascii?Q?owLUyf8dBAiaTD26oyhiLZGEwZvTzLBHNr7b058QJ3pxm4YCng63438F74Fd?=
 =?us-ascii?Q?76K+GNJUSzV6MdBD2kjOpbbAsC7t6LP3mp3MuGdr0MQUAcGByTUGcj8+hQjn?=
 =?us-ascii?Q?z47GE7Mviztois01PkdnCw178sNF6ANUFgMfhsHOxPw7YIMRdxZlptqRFlcj?=
 =?us-ascii?Q?lHQ7x7dOCGn1Xr7VRFJJypGjIL/G7Nfth/QINoszEafqL1sU0mIxPFa4AUk2?=
 =?us-ascii?Q?dUClOajKEBWHVZGtWwCvt1/lBKSIEoZutzy/kd4kXAX6ixfJ4Ll6iHFY0pdK?=
 =?us-ascii?Q?jd0gaW9sdbdzC7hB+HZTvwek?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0249c365-29eb-49c0-0cc5-08d900b6c869
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4202.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 09:05:29.9509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whrKHc0E82vmy574UtDxJ5F4PMxyFzdY/zSj5DxVQutpLcJJJmKgYEubKy7AQRTjF35NxXpctdj2AUwMaMfItWXyDVmRE1iym4AjcE2KS6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1578
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

When run cyclictest, the parameter enable NUAM. but in some BSP
which not support NUMA, will causes the test program to exit
directly and does not carry out subsequent operations, the
latest changes have fixed this problem.

"3aec580 rt-tests: Don't assume numa is available at runtime"

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
2.29.2

