Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.71])
 by mx.groups.io with SMTP id smtpd.web10.42240.1600694767070802350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=XT47sG9L;
 spf=pass (domain: arm.com, ip: 40.107.21.71, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl61/o6td9ZlQIyPy3w/i5OJ5bT7rg8cZRSCdW/9kg8=;
 b=XT47sG9L4huMlCZrwkpa47sj7mkZt5etprQEKi5uWLqyq8g23WImGKNhBY2DRmMHS4ZRxLj0mmcxG7chop6KKUSDd5hN3MAMhgK1yk4Rudf1xSEtkK60zHsCNBey153mZhWsJPv71Aqandqc35DjgkcsiIMEdDi/j8nl2HCSpgg=
Received: from DB7PR05CA0069.eurprd05.prod.outlook.com (2603:10a6:10:2e::46)
 by VI1PR08MB2928.eurprd08.prod.outlook.com (2603:10a6:802:1e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 13:25:40 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::fb) by DB7PR05CA0069.outlook.office365.com
 (2603:10a6:10:2e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26 via Frontend
 Transport; Mon, 21 Sep 2020 13:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 13:25:40 +0000
Received: ("Tessian outbound 195a290eb161:v64"); Mon, 21 Sep 2020 13:25:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25bd21e9e3c84a1c
X-CR-MTA-TID: 64aa7808
Received: from d0166849e146.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5A5FC972-0EDE-4C9B-874C-27F5CFCC3363.1;
	Mon, 21 Sep 2020 13:25:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0166849e146.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 21 Sep 2020 13:25:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V36XzjoBOvbhVdMYtRP19tWONG7SPY9v9yiyT7UxoL8RRaM2TSNaXQ4BmatRc6SB2zUTWGv+nTcEMX6eKxyluLXVZ5hSjXtAv1Wn4pGWZnNOWJrlzHKMZiORjUlCF6BGaQ4bR50pVl5BzFJ6DudogaSyYFezrTCSxqfFyU05vAJDv2CBCLXIQv0DtNkvFPezTWAcJznKZoBOVAGK9rDB0RbYIT2SrCL/k8AmEhxyJxeL+QLU3kXa8YG9maW9fO0rwuuDm6OBflloeDS9NmEwjZtaV+/2u/1fxyMM4JOgsmrZIiav2xWRoV1wq6qI4h/32cTaRqwIanfnkHNBRKoT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl61/o6td9ZlQIyPy3w/i5OJ5bT7rg8cZRSCdW/9kg8=;
 b=JfIom96XwKuCoe3hLCsAX+uWLcU8GvMIcp6aG1Rljh3dzhBtK5uYfdErVeHn4idSK7/43O8LiqpbHBnW5wj4lGITiqqb6XLNYXoxjpWyHMXFEfF8f6jP+rAu0ShtVkRZkbLEkyc0jl3Lxd77NgfjyZtmKJYJGsHxQhmhJHKZ3inzoNu6vr16d+g1lGNciYaTgrqXe8IE0UbBPJ5M+EvOZe5kE94h2j7ECI5XQrgKVSJATm9iWHf4NQQRw/FwKmGvmnxtHnECgIhTox7zG1dg0n5oBgDArHp55cYIuWr0dAvuaLe6vp+5OHnDYU87wuGVcIVSCHQ17DwV/fLZt7uD3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vl61/o6td9ZlQIyPy3w/i5OJ5bT7rg8cZRSCdW/9kg8=;
 b=XT47sG9L4huMlCZrwkpa47sj7mkZt5etprQEKi5uWLqyq8g23WImGKNhBY2DRmMHS4ZRxLj0mmcxG7chop6KKUSDd5hN3MAMhgK1yk4Rudf1xSEtkK60zHsCNBey153mZhWsJPv71Aqandqc35DjgkcsiIMEdDi/j8nl2HCSpgg=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB8PR08MB5385.eurprd08.prod.outlook.com (2603:10a6:10:119::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 13:25:00 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::1986:b83c:8198:ecdc%9]) with mapi id 15.20.3391.024; Mon, 21 Sep 2020
 13:25:00 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: generate openssl RSA keys for signing fitimage
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20200908122835.38284-1-usama.arif@arm.com>
 <5e940f933da98f5546c1626e8f2ba0fd7b3c58fa.camel@linuxfoundation.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <2afe9b84-dd6d-78e3-a100-6e10bddcd4ac@arm.com>
Date: Mon, 21 Sep 2020 14:24:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5e940f933da98f5546c1626e8f2ba0fd7b3c58fa.camel@linuxfoundation.org>
X-ClientProxiedBy: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.53) by LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Mon, 21 Sep 2020 13:25:00 +0000
X-Originating-IP: [217.140.106.53]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ecc04be0-4e73-49bd-fb06-08d85e31d59a
X-MS-TrafficTypeDiagnostic: DB8PR08MB5385:|VI1PR08MB2928:
X-Microsoft-Antispam-PRVS: 
	<VI1PR08MB2928168472F9FF6C4F13724A923A0@VI1PR08MB2928.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zl+e2ZtUzePLegOqCq1I1wmdkL0PR4nuXkOQ+H6YIWZTngWwlmEbww58PpAl8UYqJN0JRTPevukYUTzNNa+Z4Q0rOFJcE27dOPTzzlzwKjpqk7Fki9Q+W6AX8cg9yswXGg9oZ4xrUSdOwN1uXPhRq0yd2Elh0TZCKW9RCNaArPb9/AgNdu8PaGP5tEbmJCIt4v6QwtqfqGvP8SMej5rgYoRRIhdceZKLIbqFoRy7h4acziwHGXTJOZWUC3ygSrN/VQhqvg7tV4m2pPZ07uAlM2V5i/YUhQNn3g48iorHA4rY6oaat3NsH3MgmQPlVQKCFv5wtesoH5xtGwOM8vT+FMVmmXbBKaERzZWE8viJ1mNFQiPcftJYmSK/okapt9ny
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(36756003)(44832011)(8676002)(316002)(8936002)(16576012)(6486002)(86362001)(31686004)(478600001)(31696002)(66556008)(2616005)(956004)(52116002)(53546011)(66476007)(186003)(4326008)(2906002)(16526019)(5660300002)(66946007)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 WYppwmXMerQdRNF/U9idU6I0AVC+FG2aNIwdhQHr/wGNsAvBY9jrEzop8TSVw6hMCxrayI8z5SDzXgby+h3UdeV60+qJOA3dDII6N1Ix6tlKLJmI9F8azeel1dATx+JolKiF1V2/9TpsGraua1FmCEFIttlyaLFffDmoKULds68zeu/2Rs9RFuVj3i4RsopTTtWAHV1pFxc2qYY4u0Nmar+PNcfL1xMdyImFkso2Q4vH5nzN0zwS8B547c030Yzc2IxsHGHlDiqs+8Pkg+bdtqWhLYblDenlJsfHRny5L0qFCNqYzNBLHVESo9GceZxmaoPUDGm0cWxnVuYVMr/SELSVPu1MT9NF3++wE9MJZ1cZEUAzfKlHf3evObaKilfw/GOWYBjOm5WQdK+3+vO34mKZqtn4x52XesbPzuHKWPRG/bsZL5xC+LQp8Ukkdx1gcBy1n502TIyAUS7JDJnD132ZwvcxUGcos8bDkJeMjzRWuGIWkZsI7lLU8zVLdsJWIc08F0yEh/4LkphSWdvwayyO3SzGM/2TPeRMwaWxQjJQbBTFDjq8QyWQjosBXpXus07nf8DyJych+7ddm4vMBEBLGDoWUFC+QnoW4B/ERkjY1VgdUzCbvKPp2miZDKQYXXiMIEd5g0dEcDHdnQ+oKw==
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5385
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bbe32dfe-89fc-454b-0b69-08d85e31bdca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	COKeV/aPiZVws0dS3uX+p+jTLLtjnbLdAb2VZyBCUk6XDpo9Lw5vQKceYDBcd13qbIfbwrJoA5SPecKtDGHKh3IAZOriZH4Xc6LcL5jJ9zi0MJLk8z7FFnBJrgW105EqFmcnW0WTIKrJHgPwwNl0+KZpomgDRoOMnmCZeyPPK+Zit1izHRlB9qVbUTVbPs6FoxkbXLRjH3KQKZ7XUTkUqJL9jpbKVktm+gv2si/q6fobUzTtd+2ASInWxFJMX1sguyGoWk1zvF/jr14UghjVUPMEfh5nb+7e31B4lnXVWndvlLI26Wu7FPvWbUY/leJJ7X3GilEM3gy/0zoNweFKNx3xf2Ny14RZ0qEDh7hVoBdVK01kANimWJGAdNjA81kfoEfHvMMx6KyTlf8Pt6QJDeSOzXkzQIVoz/M7IkfYmcqtMtqAiiJh526jMoU2c9Mb
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966005)(336012)(81166007)(8936002)(316002)(82740400003)(2616005)(44832011)(70206006)(6486002)(47076004)(478600001)(31696002)(26005)(16576012)(356005)(186003)(956004)(16526019)(4326008)(8676002)(70586007)(53546011)(5660300002)(86362001)(2906002)(82310400003)(31686004)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 13:25:40.2927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc04be0-4e73-49bd-fb06-08d85e31d59a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2928
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 21/09/2020 14:03, Richard Purdie wrote:
> On Tue, 2020-09-08 at 13:28 +0100, Usama Arif wrote:
>> The keys are only generated if they dont exist. The key
>> generation can be turned off by setting FIT_GENERATE_KEYS to "0".
>> The default key length for private keys is 2048 and the default
>> format for public key certificate is x.509.
>>
>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>> ---
>>   meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++
>>   1 file changed, 44 insertions(+)
> 
> I'm worried about this as keys are generally something the user needs
> to handle carefully. Making it all "magic" means that a missing key
> might not throw an error when it should and also, someone might not
> save the keys when they might need to.
> 
To make sure the keys exists, we could check in step 7 of 
fitimage_assemble that ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".key 
and ${UBOOT_SIGN_KEYDIR}/${UBOOT_SIGN_KEYNAME}".crt exist if 
UBOOT_SIGN_ENABLE is set to 1?

> Perhaps this code should need to be explicitly enabled?

By explicitly enable do you mean change the ?= to = in the below line?

FIT_GENERATE_KEYS ?= "${@bb.utils.contains('UBOOT_SIGN_ENABLE', '1', 
'1', '0', d)}"

I actually think that keeping ?= is a good idea as users might want to 
use some other key not generated by oe-core, so they can choose to 
disable FIT_GENERATE_KEYS.

Thanks for the review!
Usama

> 
> Cheers,
> 
> Richard
> 
