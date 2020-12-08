Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.43])
 by mx.groups.io with SMTP id smtpd.web12.7342.1607427937032121206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 03:45:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=kNwNTIQa;
 spf=pass (domain: arm.com, ip: 40.107.13.43, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLr64ST5l9k3WzTFA6ZGNAVIXay+U9sR22RtDRQtOXI=;
 b=kNwNTIQafnfZgSSgKO0cjlRHS0EaV6mx/L+cY2GKGYSQa+JeIEFZO9OFjQpFYuQZCgLct5hVDg7ZBb0mq+Sz8utG8hQzs7GOGDfJVYq0r64owVw7R03SNxblITn8Ve9oiJN9apE8y6fqsM0A7N6MCD85CHDIjh9SFJe7mncO1Zc=
Received: from DB8PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:10:a0::26)
 by VI1PR0802MB2157.eurprd08.prod.outlook.com (2603:10a6:800:9c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 11:45:34 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::82) by DB8PR09CA0013.outlook.office365.com
 (2603:10a6:10:a0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 11:45:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 11:45:33 +0000
Received: ("Tessian outbound 6af064f543d4:v71"); Tue, 08 Dec 2020 11:45:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5eb30e5e3b86625f
X-CR-MTA-TID: 64aa7808
Received: from 4a8c26176233.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A4978238-1AF2-4318-8C7C-7D8EDB340FFB.1;
	Tue, 08 Dec 2020 11:45:11 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4a8c26176233.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 08 Dec 2020 11:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpkFJWpBKK0Kj7tYzQuUlHOJA7M8Cyqwg+CAMSPCGIkJmGZ+4OioxtH8giAwxiMUfKmPdqXfzWoG2FOZzgOtztOON0+J7715f9tkxo+f8jKIau4D9Q6o9TgrPPknJLeiJKIMl7T5uwfF2pqHUT3aLcpyfRh2jN+utGDENoXFeBxpOSqMzLAROFYH5TuspZFgkk2REn4pNfObmRuj3L0WK+GJFxYnc36LXZLvSChqy3XXjcPN+OYn05kPGnFhYz3bGh2WhoXI3adNud95ycVDVqiZkIr46AuDHZuHWNyGidfnCuy7ZaLn8mNrou/3xeR2LORd/MhQyVIpucqnpO7Tuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLr64ST5l9k3WzTFA6ZGNAVIXay+U9sR22RtDRQtOXI=;
 b=XK9qyMLSjfdDqLyO1VzthrrXMQDTbffXV+/vhNzNNZ0lj4kj6pmBKoxqUv1atgVFcwLKy9SOCSZtsVYD1C2l2fOT/XEMgOiA2ZJtMa0nTnT6XoJzjG0pdYEQwqPuexZHf6y9HSegWdcZD6M6MbW8irXqMXtFufM5QvFBiU3q8d4IH2fZt9S+A6WUW0ZdVEn4tN+GtLqILu9oUQlydut3T/DkF2xaXm97/wblyb0Z1AWbsNfLGQVF5aYjdG5/4a8tjpzyUL4eU9so5c4HrhNh2h4O/5vYtoqovWcbhX/Mp/i/s4NWTkxK4p/H0seLsTrBP2XPNC74vpe1wzLon/hOYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLr64ST5l9k3WzTFA6ZGNAVIXay+U9sR22RtDRQtOXI=;
 b=kNwNTIQafnfZgSSgKO0cjlRHS0EaV6mx/L+cY2GKGYSQa+JeIEFZO9OFjQpFYuQZCgLct5hVDg7ZBb0mq+Sz8utG8hQzs7GOGDfJVYq0r64owVw7R03SNxblITn8Ve9oiJN9apE8y6fqsM0A7N6MCD85CHDIjh9SFJe7mncO1Zc=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM5PR0801MB2003.eurprd08.prod.outlook.com (2603:10a6:203:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Tue, 8 Dec
 2020 11:45:08 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 11:45:08 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH] modutils-initscripts: Use depmod -a when modules.dep is empty
Date: Tue,  8 Dec 2020 11:44:59 +0000
Message-Id: <d470a02e9f532a8f9b5b407403f4c8a62be44632.1607427806.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::23) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO4P123CA0018.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:150::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend Transport; Tue, 8 Dec 2020 11:45:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6459fda6-5438-4699-f985-08d89b6ec5ab
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2003:|VI1PR0802MB2157:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<VI1PR0802MB2157B5DF2BA3DB991D90358192CD0@VI1PR0802MB2157.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 0JOkV22PJE4SxSvjWUYZ0rIWBTpFkCMdhmYZ+U/HIjBzl5a95ksK4u5EaI58lAP5GX8tuSjcM6+2cisjoue2xulXNmyRMPaJ5mlnbgOCMokT8lVHYp/xVPR5XBdeeucFyHp3em+xP1fFDapaVDPASy/aZDNVHa0CcIuIGbCK1d+cTgkSmkPZvJK/WDBFE8XMWLcD9kgUItuGddCcDX6tii63WRtZDeVdEEyBjajOzqtdn4hwMj6ZTLxNHS5eDTsrUlsw++7lpBSKVwZZ7/+sWvKF8A6pKX0ZqfddfX0vS22XZSJK7DonclGcXP2dF3XQ6+2Ml3h/6fpyplqT0UoJTjUcvu9h6kpFqite8nmKJH8mP7PM0ZhxIL9kUR/QrHXe
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(956004)(5660300002)(6666004)(26005)(2616005)(6486002)(4326008)(36756003)(7696005)(83380400001)(66946007)(6916009)(66476007)(34490700003)(2906002)(86362001)(66556008)(8676002)(508600001)(186003)(16526019)(52116002)(44832011)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?K7cbeGqP2ULC3DluobtmwgfFZRBloqspnuKSqP+AhfV/K09CU/JT1aENHDlm?=
 =?us-ascii?Q?t6vZZ8ZgvpkW1Ban1wCCtHLWbLX0JDGi6FK/MLyw3s27x52jtaNDGRN3BVy+?=
 =?us-ascii?Q?gKLnR17sqRV+19LGu0zOZqLvejWLoNsR4SMHifj36sCqNsuymlpZMKP3QqgB?=
 =?us-ascii?Q?EW8KzKZ/LJrRFwH0EM1Q9bTyzKkZGUgtvFuqWd5wYdnN8jIaLo+/+IdyJI94?=
 =?us-ascii?Q?iVpajJloWQfeHxLeqsNaq1cNMyDAIlSZT+eopQC1neaL6aO0lAhvBGB0czCv?=
 =?us-ascii?Q?HTB9TlfPPzNZA4giuxxHJyde4SyrWutBuNcQxn38kUTmkwTqxSjjNs+YAGCr?=
 =?us-ascii?Q?Uayypwa+VXbC57w+n0jManHQcWtJxmC2eFWrnWiNT1eDIc4gLbKdPQQDfCIn?=
 =?us-ascii?Q?W6ts2KZ2N5Z83gq7iitmPnNdx7h1bAEIr62FiXiQs807gd2z6XphEMxmJMRx?=
 =?us-ascii?Q?WxAT3RkE70od1kBsV2kmHDr9JlL0EFCpeMZpdx0rbZszp+fIPhbZVdszXAV9?=
 =?us-ascii?Q?KVWbet75jeC8vSFCDuCR5evsnopyM9nM37XGSxleNQJst+Ylnnn9yB/EMajY?=
 =?us-ascii?Q?Cnk08QJVjs20DLWwp8RhQkyiHs5eioMwroNZCbzIbuxluHUUYzXm6tWFN5DV?=
 =?us-ascii?Q?ThmWKw5QExmIXiFqa2BCc3xELzwfyy14wUD7RLGeik6Js6/+MD0xocvDe2pY?=
 =?us-ascii?Q?IKe5E7UBTKKPACNl9CtjsSiT192QN+iRtCSo7/HEjhaV9EwwPyqAUDOTqRgo?=
 =?us-ascii?Q?KyGmD+xbFM08E74wYkTpZeJ/kAniP+1Llx7uxGl/W3NEE+sgsLpZ87CdOTGl?=
 =?us-ascii?Q?fbaw6V5X0++P7fhy44hzFiG6izYOCDUuifU9GNslxjUfrozpjVuANezSrO+b?=
 =?us-ascii?Q?9rnjcYknezf3TVK6E5fvHO4ywnlua9KmqKwbDV/JaMWMd33mOdS5oIsxsd6y?=
 =?us-ascii?Q?CkvcNWtrGSvv5fgs5Tj0FLNF3EJqez3TLwXevRzGJGiYf0rt1mvaoW3Lk4yN?=
 =?us-ascii?Q?l9uO?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2003
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7f7e4df4-9113-417d-f69c-08d89b6eb621
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KIL4r6UGrn1OvcLIG2mASgsT4vIZsKecIcG8REQIC/VTN3MIF7Fxxh+vWAuuRjJ7kJTg6knpXvhpA2m1E2rdX+jI8aSeBr25Cp2lmPq326dsNvMJvEUiKlOmHz2cjyneIJCEMi1SPG34yyxHQFAfWxZC5lf9YmnVbyHAwC9lILQTDpqJh0WfiOT79T/b3OsH/UEi+xZT/JNf/HjSMzd7gfnF36vmtVjwLZkAQzmx7NnOAEWuFtKSSjbAdkjIDD2823T9XYYqg3hsXLe0xdvQvD4GVlhageu4/qazb6wxESwlVQTAxwHFxWqZblaQp2XYtvv0tvXa/oKxFgmCs7DJgPTxp6K/77wREJiUpPeTSdDtXHlnagc40AyC5qWQkuQU8sePLPcEpxM1/QIraYiY1Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(46966005)(47076004)(6666004)(2906002)(6486002)(36756003)(26005)(508600001)(4326008)(8936002)(336012)(7696005)(186003)(6916009)(5660300002)(70206006)(356005)(2616005)(86362001)(44832011)(70586007)(16526019)(956004)(83380400001)(82310400003)(81166007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 11:45:33.7955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6459fda6-5438-4699-f985-08d89b6ec5ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2157
Content-Type: text/plain

To correctly create the modules.dep when it is empty, we need to call depmod
with '-a' instead of '-Ae' since the quick option uses the mtime to decide
whether or not it needs to update. This way we can guarantee that it will be
recreated completely and not only when adding new modules.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 meta/recipes-kernel/modutils-initscripts/files/modutils.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
index 3274c25a69..28fe6f92d7 100755
--- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
+++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
@@ -17,7 +17,7 @@ LOAD_MODULE=modprobe
 # Test if modules.dep exists and has a size greater than zero
 if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
 	[ "$VERBOSE" != no ] && echo "Calculating module dependencies ..."
-	depmod -Ae
+	depmod -a
 fi
 
 [ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
-- 
2.17.1

