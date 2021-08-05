Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.63])
 by mx.groups.io with SMTP id smtpd.web11.11711.1628182799269876246
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 10:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=rjtnkfpb;
 spf=pass (domain: outlook.com, ip: 40.92.91.63, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cv2hWcB3j8NThTeFWrCzcY04J16ChKFrrmdGHBfRY+mDr5+1EhdoM/plAqZuFIGj7n4ibi7SwBL1JhkDT+m4LrEDO+fm4dI48IfljD0khJO5venoJOOVQXZYw6k282uX3i5bNktfuLD7OLgDWssTtAdFkwCXhewgUCuC9/uz3db/dD4jre33Cmff87jjLoKGXKYJkfjSX23nG5b/WH2xLeCi09khh11bTEeotlX+DIig6Js+xafj3M9jTjV1A6xs1njc+ChxOHTPHfLaWvYjQpKU1Chu63/4OJOSBvjz6LBGl88taE09JQMuF0yNBXDsy764u1qkcxNhe19UMertSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxSeGyXFK/uu0gznJur7nrdP9p3Z/o7gRxIMmOH6ZmA=;
 b=StUFf+CFqvX9qBdff3UsRzBCUH67iOOKDVwmm9gX7tsvnTG3+9Izx97k/5DlysOyvSHsrHKcKCRZgGadTQF4lLR8JM9hBr/BXqdrang6VV5QZ+KUQItILbC4CZwWirp32XHIRQ58CIPohJKRaczVTR7wu0H5zoOVUt1tCBaAklpqb6g7gqzNzVPb8ptiKwKBhUCNaxbLvVFnxSlPpbAAYjr3RbzWLW3zqcIGdr6mW5MdgSCZjzOySrtnbgDU4dFG530iHyNASTg8jf5wl0J5UUC4niHJFmhonw5P4WQGncfqBLv/xSR4ku4rT1v745zCD12vED68JQQAiQPxAijexg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxSeGyXFK/uu0gznJur7nrdP9p3Z/o7gRxIMmOH6ZmA=;
 b=rjtnkfpbFJg4PXg1mgwV7U8lE01VMl532b6GF277JlA8SRtceZ4d+/OG55VZI7uABD3NkfnyCUbj5l2MVxuzyHwiUcrtFXYmdu1g4EkGheIn3LTsBiik91942R62Zx+HqMjIxYUV/Z8l4cYt77/4dud12qjdbw3fWxrRbQK7NKCqmFUM+jbhxxhz3VkhK/2SOiGF/9HkbftNpOPIHAO7phNa85pEMH9rJdPchxV3aHYZqELbJYVDfi/Ua0K0dE49ICOrtPEjy7JqTxSzqxFfqNkRYhkLtV5R+cbamJx6aaRcehp4gZhgeFtocxMZcLEnQJErz1Gbv+hzKqnPBakvpg==
Received: from VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::46) by
 VI1EUR05HT087.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::364)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Thu, 5 Aug
 2021 16:59:57 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc12::4f) by VI1EUR05FT025.mail.protection.outlook.com
 (2a01:111:e400:fc12::123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Thu, 5 Aug 2021 16:59:57 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:93B5B752318EC2200DE828B6F75BEDF5EC729899F653A019704BFC274BB38FCB;UpperCasedChecksum:66A2F9C84AF987C0F29AB63B79F0EE8780C6A0744BDA69483E988679D817F6A2;SizeAsReceived:8647;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::411f:efb1:4a12:95b7]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::411f:efb1:4a12:95b7%8]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 16:59:51 +0000
To: OE-core <openembedded-core@lists.openembedded.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: Issue after override syntax change
Message-ID: 
 <AM9PR09MB4642973A068A5ED354160ABAA8F29@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 5 Aug 2021 18:59:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
X-TMN: 
 [UoFLPH+XUkatiGngkF0QSMZOJZ3t7msoTNxAj4ksSqf+8HT9t7FIAx1Jq5Jn3UBYMQwEJI8gkOI=]
X-ClientProxiedBy: PR0P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::19) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <f129d678-2b77-93d0-8113-0977b46aec08@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:cc9c:2958:f692:7043] (2a02:8109:9a80:3b94:cc9c:2958:f692:7043) by PR0P264CA0127.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 16:59:50 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dab37d0a-220c-48bc-5e4a-08d958327065
X-MS-TrafficTypeDiagnostic: VI1EUR05HT087:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vIse+bD8sw1CkAARv3JTa7WzU53yOCH+YcbNa1k8+2M0xjiXq25dEzMhqjJhRgA1xeAU7hshNbn6Ap/MdsHjoU45evf5uESD4bMYG7K0xYS9eJmnqv5uNSOPooTq/3sT3G1YJ0PRW7EdQo3M7z919TfMicK8q+x0v+DHhTrRr3Fp4ivliB6CX2QZSAh0joK0eHALTUH95TaaSVhsje/eT9YQtAluxXLX6yCRtfvN8sz2mUa/VMuXXQGxU2EtNRpaSnbA0iJ9hiYoyJSJlPJIuA3dfh8wukzg27a5aJqAJ7+3DAdgl7gzL9DdZGzZ4HfHMKJ71Rl7NMKbVUQQUvv6l3m2OyhPodgmHhCIJ9rvZ5rsNzcSpqaPcLdwNqwZSL6J9cQ4BITrbzMdmdZsp7FSF0stQFiRbqIJIBajkpV0GxugCW0em5/g2gAlvEqiCGc+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RrQg6DPK7mgglM4DP0TN2GEOIkZaAavYymiroSOMWKQ6sF2MvItHnJoQ+zN0nR+2LkEobtEP9ODtLROIQNLDIoC70FAaLs8Ov7J2gJ9uHjkmtt8Tych8y2eWRq+XbH8GtPGeC5hfQxyMdUIg1vtBx42kU/5D9RH/ckpOmikSvT5OgQR9jy4U3qVqqN85PKXB9gprYoM6EZEnDhkrni7hcA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dab37d0a-220c-48bc-5e4a-08d958327065
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 16:59:50.9823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT087
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

I'm currently seeing the following behavior after the latest override 
syntax change (tested up to today's poky and meta-openembedded)

Take an image and install any kind of packagegroup, which references 
several recipes, which pull in dependencies by their own.

image:

IMAGE_INSTALL:append = " packagegroup-foo"

pkggroup:

RDEPENDS:${PN} += "recipe"

recipe:

RDEPENDS:${PN} += "libxml2"

pkgdata for the recipe

RDEPENDS:recipe: libxml2 (>= 2.9.12)

and the pkggroup are correct

RDEPENDS:packagegroup-foo: recipe

still I don't get libxml2 installed into the final image - there is no 
sign of that in log.do_rootfs or anywhere else.

The same thing worked pretty well the week before.

Thoughts?

BR
Konrad
