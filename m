Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.41])
 by mx.groups.io with SMTP id smtpd.web11.8736.1606994317448712686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 03:18:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pXW+/+71;
 spf=pass (domain: arm.com, ip: 40.107.20.41, mailfrom: diego.sueiro@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awserA7Zgr9E4wgZ8D0SetfmDtwn/NBBRLulRovA4Uo=;
 b=pXW+/+712tDpFDMcoZwIYfOwq6lX652alRmaadGpJB4yPYzWsGJQfYzrH+bsCknFBAO0elAgHHj6Y2tmecOTiFqNIqpLSZu4rCGd+T00HJizPTKWMfBnteFz2yUoi88xEYC5pzGyZaVdUF3JgOBBvw3qAu5/QLGPlBmv4iuBaps=
Received: from DB8PR06CA0035.eurprd06.prod.outlook.com (2603:10a6:10:100::48)
 by AM6PR08MB4197.eurprd08.prod.outlook.com (2603:10a6:20b:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 11:18:34 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::a0) by DB8PR06CA0035.outlook.office365.com
 (2603:10a6:10:100::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18 via Frontend
 Transport; Thu, 3 Dec 2020 11:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 11:18:34 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71"); Thu, 03 Dec 2020 11:18:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1766174c4f578ab
X-CR-MTA-TID: 64aa7808
Received: from 84fc1d088a56.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BA15EED5-D859-4DBD-AD14-EB8C78A1132D.1;
	Thu, 03 Dec 2020 11:18:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 84fc1d088a56.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Dec 2020 11:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwruEu5LxVC+ORuUKFb61rcoIMAh+1ZmBz0r/lZK5aLoXQLy8RpztYDqq7I6AFFPijzTtEYhPw79S7QAijr+JrzSUCXd9VPgRf2m1JASB1faQ0dw1Fu0FGODbA696d4ejE12mKUyHkFVAAzPWnLzmQzO5TU7ag1Ie9IvnI7T/DxWtFBYZI/g/9Q3hIbaNGNiPBaX0wm6QBdiQdNBPqTqWYj16riWAeKnYAPsywcc+k5dSlaAw8BI1DAO/UAZ3pi3O6dUGLizHcHR7VTTpUVcj4IEcZMfp1S+s0Y6eKnZ+KDwgK9UKUKg7uyeUlKlZI6AupJQMazfxyR1y6FpECrQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awserA7Zgr9E4wgZ8D0SetfmDtwn/NBBRLulRovA4Uo=;
 b=deZoh5AZd18MLVzfQpakX8vxWDjq+kFiRclD+iAKTW57fv4azFbVXlm+Y5OvErjxDfqmepbxuCyVNRpogHb0DD+jmaU83E6AZRaqdU4XcVxbZgg458mIzs54DyE6P+ipo0ZInsgqi1xZ45MRF3LInF8i83eHzNieOqUPBSMBGYUrn10OvTzYgE+xcKjGCo2EEkKwo4KG74+fRQcVyvKxsb9Mk0pkh6zZUd72vRnvQzdJyqUUMWrJN/aR15OcQ/+V7IddFc1oQ4z8zdvGOrWWxnwDilXq8OUXIIINKbHX+5m0CUkoMlrUemVA+5eLgdpyxFxYAbW8dW/wtjKE3HfHqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awserA7Zgr9E4wgZ8D0SetfmDtwn/NBBRLulRovA4Uo=;
 b=pXW+/+712tDpFDMcoZwIYfOwq6lX652alRmaadGpJB4yPYzWsGJQfYzrH+bsCknFBAO0elAgHHj6Y2tmecOTiFqNIqpLSZu4rCGd+T00HJizPTKWMfBnteFz2yUoi88xEYC5pzGyZaVdUF3JgOBBvw3qAu5/QLGPlBmv4iuBaps=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4999.eurprd08.prod.outlook.com (2603:10a6:20b:e7::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 11:18:26 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::f500:d160:ee9e:f578%4]) with mapi id 15.20.3611.031; Thu, 3 Dec 2020
 11:18:26 +0000
From: "Diego Sueiro" <diego.sueiro@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com,
	Diego Sueiro <diego.sueiro@arm.com>
Subject: [PATCH 1/2] modutils-initscripts: Fix modules.dep creation when USE_DEPMOD="0"
Date: Thu,  3 Dec 2020 11:18:13 +0000
Message-Id: <dbb99de9f97c0b24d5a8536704adcbfa3bd95140.1606993906.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.99.251]
X-ClientProxiedBy: LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::18) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e125394.arm.com (217.140.99.251) by LO2P265CA0126.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 11:18:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4691fb2b-07b9-47e1-6bc7-08d8977d2c50
X-MS-TrafficTypeDiagnostic: AM6PR08MB4999:|AM6PR08MB4197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4197E849BE7B692E3556FC2D92F20@AM6PR08MB4197.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tq1TcwLF9UV83DHQsnYHKM+hLReh9aWWlLSgeCoaih7ko4zway+IhUpQnWSYCYXZPfG8TlUIcwRw+oGoQC7hJ+RJGULGaVhR0X78iGB2lv3Ds9KGPpLUKBzHmQ5uQ7F/P4rb9ziP6aaw1Bb5GeD4qfl06LDkTDVX9NLBNKuH4PJ7Ec7c97YNMg+woHUUJLSCfJ5LZJmAhGKCCyINESslkVLacisIQmXKAoqcQiYypRaonvzTLuwfVMGKp+wEBaIC2BxAQtkjzDsoTgefsUqKeEBmCweZvlbyW+qn36I9ZPKYbgNwRzB2W36354asis2WDVOUaQzCZXM2BAr5pyzOhA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3461.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(7696005)(2616005)(52116002)(5660300002)(66946007)(66476007)(66556008)(83380400001)(478600001)(6916009)(6486002)(16526019)(26005)(186003)(44832011)(956004)(8936002)(36756003)(8676002)(2906002)(316002)(4326008)(6666004)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 =?us-ascii?Q?zgPw7qh5IqDoMmQJrSSwt3qZ2BwxjBLYraO/KVHyz2YVXqEZ0yxeA0rN3ae3?=
 =?us-ascii?Q?Z3YS4jt1rAutrD3FIWGeTaJTgWa/zHAnDUH4NHIsPN6g0D+9X9DNa0QHDCHr?=
 =?us-ascii?Q?j3tk460YM78Kq82ytm9qv/6xc8N7mbSGTdnbEDcSA+8ox+6XySuJZiS9Yejr?=
 =?us-ascii?Q?AAHfTY8ZJb9pBGNpZHlb33R6T6CRjQysBAXWL27uppKf2eOh9SsxKIJZcqgu?=
 =?us-ascii?Q?WbL1uQpSxi0FuhwFKIRtrhPkCbidnLl2Ubp8uwYfDN1NERrbz5ZrtYKjsoag?=
 =?us-ascii?Q?lmA2He1U7TBVpU8ofByKpU8jMxnjwQTnwELE92wv+wr6/XHUqoz0G7latexl?=
 =?us-ascii?Q?rnWoI2h5Dgvt3jrWr4cUJSmOyk7Va0fO/XwNW3ksi50kObyPXK0GJSVlNABz?=
 =?us-ascii?Q?olVSgTgIkLJVetDFb2OFokCqvL2WqltDqS0bng3WkjTl81EahULP/hEdoHoe?=
 =?us-ascii?Q?BHbyBmXfmPrxS86Amve0hCy2d+TastC9hp0gY3AGagn43FSP8K1YlfsvMGtj?=
 =?us-ascii?Q?2o4IOwkk+fn8voMX7+tPJUEoGMRAkY+xwxBAuThVZHNxiLg/UIKdJchySrsa?=
 =?us-ascii?Q?U/EIDxlyIiUra8buST9j5H+ux79mE0ZpTliD1Qyd5p02dTWq8rwvPPxMQW5T?=
 =?us-ascii?Q?YyHkSMZEVVq+J137IfmxOH3VzZHMTTK5racd7Yct1up5ss4x1PWgrrQLyCBu?=
 =?us-ascii?Q?+frwlbxNoAd8pTGQR7QJBqz3tZZDz8e+tOv8GJ3AOcRhTwkxc+LOqWXMgE3f?=
 =?us-ascii?Q?bKd1efyJ7DVGaeWZG2cCj3Mq2XXPuEggtOavVfs+3LtFphIpSR8FjbX2xcmE?=
 =?us-ascii?Q?6POuCgn2WJdrSau5Y/qGDGL8bFwI6o1O8vSXfbrd+BsPRU673JrWDkjxVXm+?=
 =?us-ascii?Q?OKZ9+n8JrBAMij73KuML5D97u6wl+kXgV53d/dt/UbSQmHDkzgwdGf8l/Wwp?=
 =?us-ascii?Q?2dpt3zvchuqBQG/zjdLIHjtibycLKcahah5y64UZY70BM/cAwydVOSfc43SB?=
 =?us-ascii?Q?Xc3q?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4999
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Diego.Sueiro@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4d51d1c5-0e6e-4e63-a108-08d8977d271e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9bJMqR6ye9ZZvLCM8cd/38jQ594AserVcEvlrFMUQJIetgzD+bOEseU8+bEd/n0JBubJZJo04miKRaUVpZDpA5SNfdu/XC7WrvLenx8YJyHVlmzgk+Qeo3Jpc1mfu6s1MA+uG38g7ZFpGkEI50TG18cZz6ttKPtGZMzVV0JkkH+XJccilUJc+ZnpEnA114xb+eCAZH1wuuDyAfuE8CCGEkkEFxVos64Rr4WhTBz83l+Z9tWcpmUqr4xR0TDezj4LW+QNGcdHPCB/t5UOToSkH2JkX/rtmRbJmFsbO7bn/EL59AcLEgsFfIbRN1A+Ek7OX6sS0suvUMlzyGnumNifV8OqznnV2uMJrVePBrvVK62tQ2wGKohtVhQaswQRJu956ULU2BmpBm2Wq+uIjgZMSA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(346002)(376002)(46966005)(8676002)(82740400003)(36756003)(44832011)(8936002)(336012)(26005)(16526019)(2906002)(83380400001)(186003)(316002)(70586007)(70206006)(7696005)(5660300002)(47076004)(2616005)(82310400003)(356005)(6916009)(956004)(478600001)(81166007)(6666004)(6486002)(86362001)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 11:18:34.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4691fb2b-07b9-47e1-6bc7-08d8977d2c50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4197
Content-Type: text/plain

When having USE_DEPMOD="0" it is expected that in the first boot that
the modules.dep is generated. To achieve this we need to check if
modules.dep exists and has a size greater than zero. This verification
also needs to be done regardless of whether the /etc/modules or
/etc/modules-load.d directories exist.

Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
---
 .../recipes-kernel/modutils-initscripts/files/modutils.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
index a78adf5729..3274c25a69 100755
--- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
+++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
@@ -13,14 +13,16 @@
 
 LOAD_MODULE=modprobe
 [ -f /proc/modules ] || exit 0
-[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
-[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
 
-if [ ! -f /lib/modules/`uname -r`/modules.dep ]; then
+# Test if modules.dep exists and has a size greater than zero
+if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
 	[ "$VERBOSE" != no ] && echo "Calculating module dependencies ..."
 	depmod -Ae
 fi
 
+[ -f /etc/modules ] || [ -d /etc/modules-load.d ] || exit 0
+[ -e /sbin/modprobe ] || LOAD_MODULE=insmod
+
 loaded_modules=" "
 
 process_file() {
-- 
2.17.1

