Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0064.outbound.protection.outlook.com [104.47.42.64])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5E777E8C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=l/GppHmRRdId3EYHficUXDo4JW+44klbBWPXN9xpL0U=;
	b=fGr1A68ae15A4NmVqlpe0raCYEUXcTG3lT1kHyCgy4kjGs61siO5mmP57P9xEcedFpDtG2gr2vyz9eKiF7hd9nr51eXo8PAFfxhsDUEXSCDNaO7XSLsWiSeC3p24MLuDgBMUQaAIOHBrK+HYgKArekju/BguTUDzKK7Xmj0AYEI=
Received: from MWHPR0201CA0070.namprd02.prod.outlook.com (10.167.160.47) by
	DM5PR02MB3273.namprd02.prod.outlook.com (10.164.148.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.366.8; Wed, 3 Jan 2018 00:45:16 +0000
Received: from BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by MWHPR0201CA0070.outlook.office365.com
	(2603:10b6:301:73::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.366.8 via
	Frontend Transport; Wed, 3 Jan 2018 00:45:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT014.mail.protection.outlook.com (10.152.76.154) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Wed, 3 Jan 2018 00:45:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:46889
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eWXBC-0002ZX-M6 for openembedded-core@lists.openembedded.org;
	Tue, 02 Jan 2018 16:45:14 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eWXBC-00034D-Lk for openembedded-core@lists.openembedded.org;
	Tue, 02 Jan 2018 16:45:14 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1eWXB3-0002xm-Ez; Tue, 02 Jan 2018 16:45:05 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jan 2018 16:45:04 -0800
Message-ID: <1514940304-8151-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23568.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39380400002)(39860400002)(376002)(2980300002)(438002)(199004)(189003)(2906002)(107886003)(478600001)(36386004)(48376002)(7696005)(9786002)(106466001)(50466002)(2351001)(51416003)(77096006)(6916009)(16586007)(5660300001)(63266004)(316002)(47776003)(106002)(72206003)(50226002)(305945005)(8676002)(356003)(81156014)(8936002)(81166006)(4326008)(36756003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3273; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT014;
	1:xHB3DfkgcYvLxonwsKC16DRjF7DibbLzUS1KlZVVe3hWdgpi1EGK+ar4jk71KwbvDZNuKu54qEsvv2kdFVsVrKiGX4GNSVmxNo9DX9WnBkPm5aQlPM/lFl8gsJXLFCQs
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d532ba9-0564-424f-f9f1-08d55243415b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM5PR02MB3273; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	3:VfpeP4SLKCYyA23/3wAjF2JQmJYJhYqvZvLGK8aUpfxvuozQuPKBTfJjQ2ByyUhhbT8cYGuNCvaXLx5nBcoj2XatE62lVKB2bR1nyAfMsRoC6EidrE8IdhF2uGTOXJufSSS9ntOYlpHKbNi975nspBUbwQEzxIW1MXjfhlT/OoKz+fUzwqk9cgNbpuPa0dwWdqkctbHhDcqB0NtROoskC/lyD6/ZBaIPqaa7rFD934KGWhONavEsy+9tFYCPn+YN9yILU6gotXukpxH6YRqTMK2m4Z1YtehkcZ0MnC92hIti490JK6iM+btvZmlabQ7sDm1SVQjBBkoA6WU94awuNG7po6+HEIvCle5S2hDqZzY=;
	25:thHuKGzPVpwVVMsIvekEZl73y/AEFpf+u9UuR6iW0ttIJchbzuJAKQqsB0oW5wCb3AYlFXCuC26dYhn6qL7+r8Tz4yZB07imMPZVXENXF4aUgf4BIXcSMSZBtkTDpXaemah/zNCCe0RqGAFebWic9bGWEzl3jK3WG+8pYsSXGwiNvxEIRaol0iT3wcS8oDyymxBCPBTWjClGNwT0VO0Mz+OnLFlF+DGFKAGbYAzuw72JKj5/zds8OSs0usV3Ax/QPQGPiIdq6Q2Q7C4vy/zH+5KMxZD631pZwVLxJPbXqeJs2OKU3x38sOzPKJ/PuzgooNUzYNYqtZm3KEr//tzXSg==
X-MS-TrafficTypeDiagnostic: DM5PR02MB3273:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	31:lcS6yyU/zlMY+VvlIxVA2IvrAm5T6rchbMqToFOzpgCVYvGsiUK76tijlU2ck9B84aTFMDynyhh/AevU/TtGG1MzXg92rJ9XtFfSKZVDv/IDsi8u5Dkmr22L0y0CPVSTyjTQPoutRnVSQeb6Xh6eODXpuLahYZxNboWu6dAQyhvfA1QxHvmrogsw181W5hZfKyXorUmaBmVGoRW4str1AItHdco3EgW+TzklpqHAaYE=;
	20:JJKGNBOxPYaAszWOUw+IUBztvG44oq7jZO6cQNObKWn6UM206wNNG8x64Y+UKW2jNcesNQEIAdbp2H5IT78S+k+EK3ymGQ/nVOr0VV0L8yV2jofr/Bke+KP22AtqeBmSiWXi22H448Rpc6LVu9naKVMQgBKvWPMTL7yxQ7UGn/uGzuXB+nxOyRvJUC0kzJkb93Nyg9JxVrG31FIshgYBcT9JPuEllT8ZxLDzuQBqWBZn10pzoWy49MnPT6ivQM4UrsCKAhgRwUfEY7Oek6GfD5vWJmApiG3bAXD1Gav/LDY1FqyYv8PMXCX3YK4BSNv2tM+PpQBPA5RjBMunigOePCZTo4ExuDf2QXqi1ziMjB79KUvHy8ntkspOQ5UiTMCJkA7A1VbOWoU6M4sX15ny+kDGekvsnnMRLrKuBGfN9EYqP82enZYIoXDbWTVYU2gXA50rOfeD8+5Pmy+96PDaRXnq/VJfqzSo8J28F3GwkxxqKg2zQv2s4JDVczSvuhxU
X-Microsoft-Antispam-PRVS: <DM5PR02MB32730746CACF99253A17D632B91E0@DM5PR02MB3273.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(3231023)(944501075)(93006095)(93004095)(10201501046)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:DM5PR02MB3273; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM5PR02MB3273; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	4:7+LsZ5SRoLAFX3FBWWmPYo5Syg60ZwtaM/9Z/WSgsT2IJh2b3qROMKgRp7ZTfeBSikP/tK4soGrIQxKHlTA2tFL/2Eg/JMyC9EMGFO9DC4V4+SWROWPwOy0xWOYbG4cJMzw3jT4lRoyrkAe+WU3c4dbOfX3QmXuwVMYzdYylquVJP+IDBTwlUj5V7Ht0owVADr83Q1RSrtpOFBMOQBGZTyPaiEVWa5c2e5a7KxnA1GQLKPyUPdeqIoJXj4zE2Q6/ac/DwCT+CWOutltu/Am6R/+Sg01BBd0+0V9icDfLR4mWmjIM+AqIeYpN7sQhZ2Rs
X-Forefront-PRVS: 0541031FF6
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR02MB3273;
	23:FPlaW+LwbE6tlxJtZGDUhxvpyQKMliRmI/6QV68cX?=
	=?us-ascii?Q?YYQENejOWoJxF+5EQ/sJ326fInom01kTPX0q6yd58vHvBbvRu/3JybkWK+3O?=
	=?us-ascii?Q?/X2ukOzNUQwlDOF2MXPPa/srEximsf6PsZshMPKd6J1TIE+sIKl8VNv6nWzN?=
	=?us-ascii?Q?1PsK4f1J1YGOl9QzfJmeLxSG0P9m0TgSssjLcs9QplgfLq2zGJqoofyedZF3?=
	=?us-ascii?Q?k0GugkccWimY/rD43DIF5JKDT62mRTGB8WmbGPnlmsnURAfq1wLZQ71ct+0w?=
	=?us-ascii?Q?PVlEdIw+rfrgme+eTmO2Pw3TIK72816ebhQ0MmhG2Ormn7ZqmauTpbDT/D5o?=
	=?us-ascii?Q?xEU5j4wbwniozU2cxqbftUz3FVttj5zByFztjJECyGNtwjjBSsu7PFoXQf77?=
	=?us-ascii?Q?c+2w34RlgCi0BCOwRgzeRYh+Vbf9rm/O+pdYDzJoQW76lHFplnIRmXc99JK8?=
	=?us-ascii?Q?kVy7u3r7qdDKR1NMwOmWyrF1JQjS0hieT1MmXXFc5DxQy/9/EkUC6744JEWJ?=
	=?us-ascii?Q?fcuPV6hQ9KLd6o4Z8rOBLJ1OgvHhXf+LpswFcXZABWEbMR/NMcy04QhjU8NS?=
	=?us-ascii?Q?p4AeZfIt1W7vDyvt6EmwnQG+nIc0NjcRVq0K7WvF93ZkvF2sumDLtWGwZn9o?=
	=?us-ascii?Q?O4ox9m7IZS1vQb2rRjUlSuD5x/m295tog/vp1UALlRUf1BjEvrLYNucn3lu6?=
	=?us-ascii?Q?LxhfnBZcaYfvQ87rJ/W/MVAOYmgUUsdrEZBLrDpv7SAoss+S5UUPsDRJ/i6d?=
	=?us-ascii?Q?Y7XZQMLUFgvVvDDMHkRohOPH+hQcUTbm9ItAdQWqvLFf+q4/EbPEbEwdJTke?=
	=?us-ascii?Q?B4wn8FXTscBWXOgZmUKBHaFiIQS9RucF+e991nvORyMMMGTDBzHJ7El45JXh?=
	=?us-ascii?Q?QS0NkpLem1/TtbQOPBDeTEQAIJx+xNF8DUFUzqHS7saV+QqvqT5GJKaxKt5T?=
	=?us-ascii?Q?kivySG8BxVB0ECJf/eByoCWz+j/XEgF6/zU9QxRuw=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR02MB3273;
	6:GPrClik8FATqYbKjnKwgdgsXIP87Dua7rmzv2ckt63kGKT1Wi/8wRlh84dC3NDWiy7fKJELy6Kka/1LeTM5/S5JpIi7REVLUa6wIAWJ5yMhAll5DGS7IP41tGqsnOgCXyY1+fGnYeoKYgqMD/1thcayLZfS0gPNaTtWekxUV6k1VA/LMLQJKVgrCGzl6lF8unAZM2vHTQhES5OipNsOZHydQZ9XxyoRzTznR+MKx/gftxXdZxM7Fv6gmlCdta/MGALe/q/TH1A1qXOGyJsmPHtZFztvLXmpV3sreIlUcCjvMzNOMtwZ0vxpteK6+7O5Jmxnvk1O1qq5Vz9nW/AS3ZQmEmcChxlA1iRjWdsUf9MY=;
	5:XNlSmWenjjCFFpbYWGqXnBpP1STt4IGe0qmocIhtRKbcBoX6eX6z15+fchwD6BwQbPQimGi/KT0+huPSMEPDfcAOY9Vmpe36IUwbI0BX8JlH+hR8dDcFtNR+03U/UZ97xNcqoh4r4pno4yxrd7C0Rh3cEsEBH9wtZh9MIpeQa5s=;
	24:97YUkWUNvN36E27nSWY9m+8GxREl4tIBvGLa0KZg0HE5Sm69U7L32dhgnhrWSqsj4qQ8VZI8uKv1gaIGUpw5XiDz4BLEIDepPzg3VxYnbww=;
	7:mluWMBLHKJvqNEX1t+FdL56ek3k51e2crXEWq1Fi8VaJHdAfhvlvjXOvid+noea+xdxww4qyBv2AMzaHiADgPTTXj+WLxxTZPwTIpNIAmsMJ/Tpr9Pb7IGKg3riGSHlDoJl1gBfm4s20Ce8PRJvHAeHlGYrSvQDp4lX7BESOkC6lggMFfR5EPqwXHQXt0Vcza1KKCZKPQYbN5dyCBnXfrHI9T3fFBxnfZpKe02wlPn0NeqYXJRA/vzFIxTJbZOOp
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2018 00:45:15.3907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d532ba9-0564-424f-f9f1-08d55243415b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3273
Subject: [PATCH] kernel-fitimage.bbclass: Fix bad image type replacement for microblaze
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jan 2018 01:00:25 -0000
Content-Type: text/plain

When using kernel-fitimage class with microblaze, the image type has to be
linux.bin not zImage. This patch fixes the bad image type replacement
for microblaze

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 9baf399..a50f8a1 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -14,6 +14,8 @@ python __anonymous () {
             replacementtype = "vmlinuz.bin"
         elif uarch == "x86":
             replacementtype = "bzImage"
+        elif uarch == "microblaze":
+            replacementtype = "linux.bin"
         else:
             replacementtype = "zImage"
 
-- 
2.7.4


