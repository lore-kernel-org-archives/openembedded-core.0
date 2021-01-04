Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.58])
 by mx.groups.io with SMTP id smtpd.web11.12875.1609764260830189532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 04:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bhEKpzME;
 spf=pass (domain: windriver.com, ip: 40.107.243.58, mailfrom: ovidiu.panait@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=feaZ9vxac6a6Ivg+g6IW/znxk9XdLqxeZ2VDzCket0O7QbQDYAUdAK6N5QdvyJK1TQgprMNWFzLjWGJg9Wr8quA84eZjQPL2g6XjYKi+D7VY1ZrLy007DLSsMV1zJqnz69+Urbg5zGP4W+q5tu8MyA/VjvHKyXsKkfE54iDD3DZzeuw9e6wWc06+KVSeChbjQ/xK6zScDxA3M19NHOems2hzyWkVzn5gW4ZIGPlfoYKR6paztfHTnI1itEF3h3R56RNxMzjDFbToCARS4Nj6MTWe5eNEXR9MgYQ2nuj+DL83TK9xVV2rXPVLEBH1WSSGyhmQZzUVtyDVaHlz54Z6OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGS35J5xhLuDUIbsWDVMSMd8D2l8oOIsJmF3GaXL6cc=;
 b=fM7EmIRZNzdwt09G6uQOd+uIskKLFRgxlO9c6oM2blqBaKcmA2XcZ8zBZo+iZc+3Nm6LWJe07Wrs/2BAQbmzDDxi7vMq0RqWFWr0o1VAQigKdKmscdWyoQmfgSWZPTvPfvHTclcrX2Hd1A3sr5uMovp24Y9aXqCUNhgabzXPeqktfrinWl4uMrYpLOFlsnyC6eBnvGcoMRiskWmrfys51acY6AANbcm1ebhMqG26w+3IugQxTd7EB9Lrh6H3HvEbomNBLgla7yBn2QTLioTSoGb4UAgyZjvl6VQbA9KGW2nIQsCtn8jpv4sfmInvppAdfffb3IRqlw4e2632u+Bx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGS35J5xhLuDUIbsWDVMSMd8D2l8oOIsJmF3GaXL6cc=;
 b=bhEKpzMEC/I93qoakzKSgzfN5TU03nrKROPw625K1/3+vzvTb+FBPNWDlmmCYVg36dq6NVcQsF5w8ihPkYDd84/2wtpQzZgrkwoCxMiIz1/H2vPQDwkN9Fi3LLJQbgy5vzEgQh9Qfdl/igMYN9lDn1BK8m/JeWxZXuCmmg41jLI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3201.namprd11.prod.outlook.com (2603:10b6:208:6b::21)
 by MN2PR11MB4237.namprd11.prod.outlook.com (2603:10b6:208:195::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Mon, 4 Jan
 2021 12:44:18 +0000
Received: from BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43]) by BL0PR11MB3201.namprd11.prod.outlook.com
 ([fe80::85d9:7219:6427:fb43%6]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 12:44:18 +0000
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] timezone: upgrade to 2020f
Date: Mon,  4 Jan 2021 14:42:39 +0200
Message-Id: <20210104124239.14351-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [46.97.150.20]
X-ClientProxiedBy: VI1PR0502CA0007.eurprd05.prod.outlook.com
 (2603:10a6:803:1::20) To BL0PR11MB3201.namprd11.prod.outlook.com
 (2603:10b6:208:6b::21)
Return-Path: ovidiu.panait@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from otp-linux01.wrs.com (46.97.150.20) by VI1PR0502CA0007.eurprd05.prod.outlook.com (2603:10a6:803:1::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Mon, 4 Jan 2021 12:44:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a542def9-6a6f-4149-20ea-08d8b0ae737b
X-MS-TrafficTypeDiagnostic: MN2PR11MB4237:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB423743AEE65A3DF0D5ED575EFED20@MN2PR11MB4237.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5ELm1AbfZwe8ARVFEABbBTnN6iUgtcPItPsrsevu+9yBdF8MUYFOJyFOiID7v0jz2Sb5a/OEeonVWI9TVvPQnj/OKjuxAjFSavGi8IzFtUHoQiujBGmqlfeuHFglzbADdXK3QrorIsdpD0tQJVmDcVtdnyLkk3FsDbHcEPggOEWfQQJoBzFhbvALQ/A0Fs2Pu46D7534jxArRiI7RxrEWPyrWrX0s12Rkt51Yf3s9M9nzBP0JMxKUriztLV0cdaRhbtab32bcJSsq2AqQsfykjTjJtAJaAIK9qlgiF2VYIc1jO2zCr+Czru/BxgiSCq389Hqxnhl5yrmnyp/usWLp5Pc4o76tr1MWAnP4I0UbnXSua8fgq9cXLwtJaogjlr7dvEwJB071MMzvCiNiVErEJudLcph5XVke+RKDn5cXHZvfHoBpGK13O+eaO0OeZnsp1JLojYbU6EWO2BCid6omw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39840400004)(8676002)(4001150100001)(26005)(66946007)(2906002)(16526019)(186003)(66476007)(478600001)(66556008)(966005)(6506007)(36756003)(6512007)(6666004)(83380400001)(316002)(6916009)(52116002)(1076003)(44832011)(956004)(2616005)(8936002)(6486002)(5660300002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?GACuq+EaC8I19Jwz3HQeWV3o4FEH/Haq6QWHA9vo+gqfZw42NUIikSKj06jj?=
 =?us-ascii?Q?iTuC7xBNtO7qEnnlFoabGd2SPwrVPkqSY7T4jJcpnNDcAGeoRsvfj/iJI7oC?=
 =?us-ascii?Q?QLmxeA6AaX31STw9TVu7yruUeArOxwi0+wie4pxI8ROsE8WcgVV0cJl7XSQR?=
 =?us-ascii?Q?no9Dfr/sJdiHftvEEy8DdXbvnOmROZBFp0R117oSZwo4Xiycf4j/LsHle/bO?=
 =?us-ascii?Q?Eg5L9PBXoHhKunkQG0df/3bJuid7obQcGEeQCccMIHfXN1a89XTK9s8i451E?=
 =?us-ascii?Q?kDK1kXdCORY7s61t3SMwUKAmZffKeVeShm+LeSGMLdCRrvBDAAdTQ7GfU9Ow?=
 =?us-ascii?Q?MHm8EzLZn68jhOJf+y+JIE/PoCXluk8Bk3367VfsXVvf9TJLmeZrDcbQsUir?=
 =?us-ascii?Q?TZDeoAJz/prtl1MN9oVaSurrnv7uIY8V3oM4ddz4aI4qRhSkl/TJ8GtR6eOa?=
 =?us-ascii?Q?1K2Y5EyQGChHE7QFRdxBX8TdbvnbxR2gU/bVtuh7afpGgMjO7IGP5EuNSGnX?=
 =?us-ascii?Q?vjVxLzND1Yo9WsNxAMjAD6senoFFipbci2PPFm3/PyXgdxDCea4hQc+6aSIf?=
 =?us-ascii?Q?IulvehVROax2Tmx0wgWFs41zj3DJOqWNrfoSvhYPHrEzl5zOa8e6G8gBJjUE?=
 =?us-ascii?Q?uDVt4kS15o1h8K8DvKad+u7u7d6fYXkcHbxrVsxOUuqP+pn39V/pQQQMAqmf?=
 =?us-ascii?Q?kPu3O6Rax9X21vQ8qHJC54u4E4I0gpXrilYoHrl+41umGEGh0BHJvskg6mcq?=
 =?us-ascii?Q?E2GnWqYT+Rk06NjFSpyE8iD8Eme0shaXSeKo2+Kq+9OYfMHhRVPV3C6gXi+5?=
 =?us-ascii?Q?kNP/2WXJqLSbIB8Zjsh7W2Nc79As8yVvqfT+bOdUTwE+OWJDIw1tCeG89/CY?=
 =?us-ascii?Q?yTQiomylUPoJPyp7FT6mnOEycla+a4kKOkqVTjtPEyJ0976rclEJ29CjnKlO?=
 =?us-ascii?Q?ORzp8QRxRAbQ+10GdavFJSSl+lCmIItiR/8OwJv/KG4siGynx1xyGk4LaV5d?=
 =?us-ascii?Q?QzJt?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 12:44:18.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a542def9-6a6f-4149-20ea-08d8b0ae737b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K/vt3THh035k/xL3e+oGc3hmNZXm2adyJ5f1un+FLo0rdTwsKHbQZmyUZN+riGce1+wPS5gpew32LfBU0XgInD4CpDjb8kEMx51efB5hVo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4237
Content-Type: text/plain

Release 2020f - 2020-12-29 00:17:46 -0800

  Change to build procedure

    'make rearguard_tarballs' no longer generates a bad rearguard.zi,
    fixing a 2020e bug.  (Problem reported by Deborah Goldsmith.)

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d175f0d4a0..9a19093e24 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020e"
+PV = "2020f"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "3e10308976b09305d15cb4a32ff75483421f2063bfa24a9be366a027e7cd2902"
-SRC_URI[tzdata.sha256sum] = "0be1ba329eae29ae1b54057c3547b3e672f73b3ae7643aa87dac85122bec037e"
+SRC_URI[tzcode.sha256sum] = "cfeeea2a7745164f64bd9f6d76e47916f4ac820c4434493674adbbd4324329c5"
+SRC_URI[tzdata.sha256sum] = "121131918c3ae6dc5d40f0eb87563a2be920b71a76e2392c09519a5e4a666881"
-- 
2.17.1

