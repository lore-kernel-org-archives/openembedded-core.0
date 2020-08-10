Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.87])
 by mx.groups.io with SMTP id smtpd.web11.42511.1597057195294882560
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 03:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3W/Ipg/a;
 spf=pass (domain: arm.com, ip: 40.107.6.87, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnhqdr/eeDSqX2b8TtyFvrpPBGLU6SakE8WhSfwk96c=;
 b=3W/Ipg/axu/KzaeXV/Ddp8Lvir7l9ZNgR9SPjVJx0t89XJeRWIM0X1cVLdeSB8lc+OPXLmf0lRiXamfe+x98z+aqJWmstneQ2RAWeT2HCRR7Z9MXmDuE5eaw2yvANmsFetJXx8kEVPv40syy4INS1MDmZKKNfXp0T6fLqSlzjAc=
Received: from AM5PR1001CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::25)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Mon, 10 Aug
 2020 10:59:52 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::8d) by AM5PR1001CA0012.outlook.office365.com
 (2603:10a6:206:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Mon, 10 Aug 2020 10:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Mon, 10 Aug 2020 10:59:51 +0000
Received: ("Tessian outbound 7a6fb63c1e64:v64"); Mon, 10 Aug 2020 10:59:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc8986024f7a22b8
X-CR-MTA-TID: 64aa7808
Received: from a03e26920352.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F91AFE69-5557-4BC9-A9A2-A17EB2EC163C.1;
	Mon, 10 Aug 2020 10:59:46 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a03e26920352.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 10 Aug 2020 10:59:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1PRh6Fsl2BdKmMay9xYzfrCt8qFGvnM3EJmfpyxWGXsf0WNVA0IjNUZ3X2m6C9NpAReLXSjHEldaQwTO/khwClJ2yaAkYCgAd0Kph9dYqGMdSnjYtfWN1Ij73PfiC7xvmUd9McJ2d6CDPkWz3lHPwk78J7AgLEeZcEBO5KW7K3dQMBi7OwuCEq3WSP+wcH0bYsGVtCH7qFP9/nCeOBB0M/fAWZPaoJSk0khgz14luNXvkkKFO2fWMxWCxjoFlTiRx01AeYR5/fTYbQAFN577fwParKa56NWnCaHsX6rnDuPLf/FiQkXS/hNLqmoWybKPnIqc0AnGe0qk8ZqbR0d4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnhqdr/eeDSqX2b8TtyFvrpPBGLU6SakE8WhSfwk96c=;
 b=izwVTY7df4caO/Ih3uE7WHx9yEmIICJqajHRxu6SYz2OzpwA5Ap3MJ9XnHqREX8I1WJ0PBUYuqoohaqUBYreIUv0GtzNiJiXRfmz//eld+omHTVZqRLUcaH+/LdrLWfAx6+HarUxyBKFQELkIqhUeBsJ+8qqYAxzv1DYhAPJmaMefNw2lX46tAu0UHzfPUEU1XrReB12yk34Y+pLWwVaVQxuDGD/S03Mkt37oxK7SZMUJP4lY1e1XyXPvZAl6XDVEymD3Jw5DtoMJ+iKkLpun/xeSc48g1il1Y05EJTyYN/F5Hqbhx/1RVmmSOS0nWgifNwxs/E8LDb2HOBlropdHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnhqdr/eeDSqX2b8TtyFvrpPBGLU6SakE8WhSfwk96c=;
 b=3W/Ipg/axu/KzaeXV/Ddp8Lvir7l9ZNgR9SPjVJx0t89XJeRWIM0X1cVLdeSB8lc+OPXLmf0lRiXamfe+x98z+aqJWmstneQ2RAWeT2HCRR7Z9MXmDuE5eaw2yvANmsFetJXx8kEVPv40syy4INS1MDmZKKNfXp0T6fLqSlzjAc=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DBBPR08MB4284.eurprd08.prod.outlook.com (2603:10a6:10:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 10:59:44 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::6939:c156:de89:adc5%7]) with mapi id 15.20.3261.024; Mon, 10 Aug 2020
 10:59:44 +0000
Subject: Re: [OE-core] [PATCH v2] kernel-fitimage: build configuration for image tree when dtb is not present
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <16238590BAEEF4BF.5706@lists.openembedded.org>
 <9d97ca08-04a6-6029-7a39-c96aad082fa0@arm.com>
 <030c97779b17a187b80e9d5817bdc9074dc55740.camel@linuxfoundation.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <51ee078e-0834-acda-bb8f-c9ed79041bb4@arm.com>
Date: Mon, 10 Aug 2020 11:59:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <030c97779b17a187b80e9d5817bdc9074dc55740.camel@linuxfoundation.org>
X-ClientProxiedBy: DM5PR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:3:5d::17) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.52) by DM5PR06CA0031.namprd06.prod.outlook.com (2603:10b6:3:5d::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Mon, 10 Aug 2020 10:59:43 +0000
X-Originating-IP: [217.140.106.52]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: abb09aed-1d10-48a9-1b0a-08d83d1c81d9
X-MS-TrafficTypeDiagnostic: DBBPR08MB4284:|AM6PR08MB3544:
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB3544CE094BC3F740F030011392440@AM6PR08MB3544.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZG3BWzbM7LI8Hqe+C99V6z5RbLym9RN2fdzEQTQII9MWaNqcjaFeZdYDd9E6XZkdWkghakQsgCzJ2FO/9ucMn1YIGoM5XYE/G3bkUxrtLsTxc42haE7AjhlDzW8Zd2TEXSrrKlX4B3ADE0xqR/qUw1tSPdEnAKtgGvKlU76jmqhsjC+Z7Zcl6PKx5IeZ2UxCOBgvR+x7ghOSc1CrBcrFhKXkhi7bmzDzAxyYbBoNUVfJyVgynLoe4Uy14fancV4QLv//6lRZg5rN4DtkicUmSbxAVTkSO3xnfKUusG28ywU34diqiP78w+jBsWrMeYHGPEv7phakTLhQH5BgMGsbqKq/n6Oqg/5ucc52XNLPfYPqpgs3joYi5siPHlBXsIj8
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(2616005)(66946007)(53546011)(4744005)(66476007)(66556008)(8936002)(956004)(316002)(5660300002)(31686004)(26005)(16576012)(2906002)(186003)(8676002)(6666004)(44832011)(4326008)(478600001)(83380400001)(31696002)(6486002)(52116002)(86362001)(16526019)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 vTRmNifW3aw1EpzRPlp3mzLvcEcbNq+6BpkFBmaJJncLYv5jl3oWOFOXnZSe7ImFYwynZ0aP3Z1+sf/4+UI/DQ10JRAyMOBBipd8xEABQoMH640nl0TKHqIjZv+ziO2xdVhoHlJR46QkWnUyTVYvhoitE39OHFHNjDd+HPxFkVw1tuCtAXhCjZHaRGcpuvs1Hi/FTyK8re63WuJzuPkNthY568GhxB5wqOEd8Uz2M2WC5QVy7hQIgvqewMuECF26nM3gVnfOh1uKRhNWKWLnpkm0k5p1BV1jEhlGghkIATRN1poQA+n7RNoZwoVIl+Cbz5b/6eLJuGxxeHhGBwnDrvKpyxUaDyCIPsdM1X8L/+W9vXCjn+Fa+x+JbMVw7TKzRydN2Cq9Dm3XL8+mOHG400wDNZhjpSAfWevsMsvE/dQrnN+9GlpSv+RinXDKdGdUMGE0wPUk6ZK5efUCAZck81hvKxfD3I5laHeJXUFOffdMQUR4Wf3Ed8HEniaJ00GWeJzJR3FsIJ3FYGxtdVBfaJVS5wq7z2c2YaYAwX4+ovJGzdKifB8GSACWGict+n9PtxDiP0OSmaW0q5YtlzFmYAvaYTum7WuhbaxL177SHOUT21UKQplKTkB3SMEYQNURy0g9F2L3+zOn3xo1yFudxw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4284
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	04c2de9f-cc7a-4167-f3a7-08d83d1c7d5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GB++6NcVu9JN1LwqJQh0uKTCy/VhRaXcHBVu7T4IlbUpoHZKb+6U4zJ02k+gk5rIkivyxE5z74EdNADklIqlsHBf8PeUaBFA/TdWCf90/FVBdZ7LVSIGdpu2KJxsQCBrB8H2bIq8SrasSb83wnbYYPz9/NQ8B3p5yQpq9DL1ra8IuGUV9mXylZb9GdAXRuKO+QnkfltibsFXYWCiFowrphrqElZ78mTzduj6/YGxbhLQztiTjGr9b0PdzmhQ2emyO+3TjAFNjlGA/EKRGj7qJGRYfWyk1zwHBjmbz3k6Mowbmn02kNZIXNHWDcNi/ttxNMWXiyLDODeS975HVYi5G80c4E75mrsO1wrdf6yit63cVYTGfF1KP6s8fAVV/NqQYL4XTUnCmvGdgqh9oKbCXG4eUoxKBfeHIl98+RsvuJJ98yH+ITuBShfOqhn+JRwR
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(5660300002)(16526019)(31686004)(47076004)(31696002)(186003)(6666004)(8676002)(82310400002)(4744005)(478600001)(356005)(82740400003)(44832011)(86362001)(2906002)(956004)(8936002)(2616005)(26005)(70586007)(36756003)(16576012)(36906005)(316002)(70206006)(53546011)(6486002)(4326008)(81166007)(83380400001)(336012)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2020 10:59:51.9193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb09aed-1d10-48a9-1b0a-08d83d1c81d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/08/2020 22:35, Richard Purdie wrote:
> On Thu, 2020-08-06 at 15:16 +0100, Usama Arif wrote:
>> Hi,
>>
>> I had submitted patches for both the documentation of kernel-fitimage
>> in yocto mega manual as well as test for kernel-gitimage in oeqa.
>> Just wanted to check if there were any review comments for this patch
>> to progress?
> 
> Sorry, I'm a bit backlogged after the infrastructure issues earlier in
> the week. At a quick glance the patch looks good, I'll queue for
> testing.
> 
> Thanks for doing this (and the docs update), its much appreciated and
> will ultimately ensure these use cases stay working!
> 
> Cheers,
> 
> Richard
> 

No problem, it was good to get familiar with the documentation and 
testing side of things.

Thanks for the review!

Regards,
Usama
