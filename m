Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.87])
 by mx.groups.io with SMTP id smtpd.web11.138.1595265677913445896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 10:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4RcYOO11;
 spf=pass (domain: arm.com, ip: 40.107.8.87, mailfrom: usama.arif@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXvCl1fWcXifins9zme1EpS8YbPgcjkaGZNSU7PTAkk=;
 b=4RcYOO11jEQ4XoxWffCtCrkfrRRuaiLXomZ3KeVjfnHZrf+/8/1bMQO3q1/5n21tHZ7QC7AnROXERI7L+Dsa3tUfKzprbuOHOSjnfvW0hlKpbrWwGSLKwa3YnSaYBUjZp+TmadCimiagZSEGi3YaLJcQdpUpCWsZOvzk5LfgXvA=
Received: from DB6P193CA0022.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::32) by
 HE1PR0802MB2554.eurprd08.prod.outlook.com (2603:10a6:3:d7::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.23; Mon, 20 Jul 2020 17:21:14 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::6f) by DB6P193CA0022.outlook.office365.com
 (2603:10a6:6:29::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Mon, 20 Jul 2020 17:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.18 via Frontend Transport; Mon, 20 Jul 2020 17:21:14 +0000
Received: ("Tessian outbound 8f45de5545d6:v62"); Mon, 20 Jul 2020 17:21:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 34f1a82e705dc703
X-CR-MTA-TID: 64aa7808
Received: from 00efdf5ea548.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 35070260-16A9-4A6C-B214-D95A37EDD6B1.1;
	Mon, 20 Jul 2020 17:21:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00efdf5ea548.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Jul 2020 17:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyEZ449q+dKx3BGEP8Et+cDsg5BMTFSng9DWjIkQE+FpsuUXJ7TSHB2/YdnbWMHO4lztSBoE5sE25r9QImooi2BbHueKhn47gfF+SrBZer9u4iPmx6ZSiFKklSo+o0cxk5mCkmczRllV2gE7ItULHXhKP6VlsPp+QnuNBkSnFzfeTfK/OU/gUtDJ4luoEV8yb5wvQlQff8UPwUHtdS8Ab/letgn6Ox8D5tGZxEpnS/PzAYs0WGmQFyN5wCZdDcSivV6KEo+SzYyBBOp+ieFx9GxPEhGn6G1kPdUWc2lSaa9N6+0O7BImh21LFEymDCfiO1bZKzs/iJ5Tj/Orc8WuYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXvCl1fWcXifins9zme1EpS8YbPgcjkaGZNSU7PTAkk=;
 b=iQBUQpv5Np3+tcG0YHCopHSczRjN7ThkoSAhWFbcaCfkyYUbx7qBGlGhCMDYKDlpF21Qr+JbWC6bMZxNnWxtqr5kwaSr0GnXxOWH+NwIYcV9/IZh2fpUtPlmXJoq4jC5HzlqiKDpn10irAqSMGu9jjc92H0UQWdBdItOBiFcRaYyhx5fvKqc1KWRRP9qmEW395WthUNHqye1g4g2OrmIDyeMaBpwWO7wjHnHENZuq8IOyfpXEyfaZ7rwYVETqArkPsCMQERN5+YnYRB4gpn+QD+HYEJsAnnCc2pLt/8yneEhD/Zb5FpEh1/olNVtooQz/piaeIrAnnQnXWUuRYKjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXvCl1fWcXifins9zme1EpS8YbPgcjkaGZNSU7PTAkk=;
 b=4RcYOO11jEQ4XoxWffCtCrkfrRRuaiLXomZ3KeVjfnHZrf+/8/1bMQO3q1/5n21tHZ7QC7AnROXERI7L+Dsa3tUfKzprbuOHOSjnfvW0hlKpbrWwGSLKwa3YnSaYBUjZp+TmadCimiagZSEGi3YaLJcQdpUpCWsZOvzk5LfgXvA=
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com (2603:10a6:10:114::9)
 by DB6PR08MB2773.eurprd08.prod.outlook.com (2603:10a6:6:20::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Mon, 20 Jul
 2020 17:21:07 +0000
Received: from DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58]) by DB8PR08MB5481.eurprd08.prod.outlook.com
 ([fe80::d0ff:7eaf:e6b9:d58%6]) with mapi id 15.20.3195.025; Mon, 20 Jul 2020
 17:21:07 +0000
Subject: Re: [OE-core] [PATCH] kernel-fitimage: build configuration for image tree when dtb is not present
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20200717141936.9689-1-usama.arif@arm.com>
 <540353726b3e013ad76aa299bbf836f30d618f14.camel@linuxfoundation.org>
From: "Usama Arif" <usama.arif@arm.com>
Message-ID: <28f469d4-6333-d1e7-0224-25d4c20eefcd@arm.com>
Date: Mon, 20 Jul 2020 18:21:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <540353726b3e013ad76aa299bbf836f30d618f14.camel@linuxfoundation.org>
X-ClientProxiedBy: LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::28) To DB8PR08MB5481.eurprd08.prod.outlook.com
 (2603:10a6:10:114::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.1.198.43] (217.140.106.49) by LO2P265CA0304.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17 via Frontend Transport; Mon, 20 Jul 2020 17:21:07 +0000
X-Originating-IP: [217.140.106.49]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f1c46b52-c3b1-43f5-a447-08d82cd14e2f
X-MS-TrafficTypeDiagnostic: DB6PR08MB2773:|HE1PR0802MB2554:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0802MB25547CFA2ED445AE86BAB040927B0@HE1PR0802MB2554.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LiELz11qVbiivPROnCmCT0UwyGtBql3OUsfvFFZZkLDQC3Q2z7ro5LotXQ0oDDa3OCKfRlhuQAUMXdr7TWXXY9aIlQmPvt5DwxXhaWM6fATn/PqhZWj+IUgTz9U3AdroEUW4Cz7WmcFdNPZxGpY7yPYtrS/8CvqLp+icpCZHv/Zr8315uji0akzcTVcYWOTC6s6vymi7WcR31yR2XD4v1ok9QGjIjfZGwTO2j1uJxui7XFvzdjdi+TCz2WYD7KZfS+b5A4fKfwq9Dc4J3fXu1AKTy8my0byaoPtJz6CHIw+P6F3D1fT9krg8EYoHwl6f2GjuPTwGRu4JhUecDtTujNUgRR1T1CqLxSPJzOp0qIBORa5I/j9izCgdakzselDX628BkObUHBoAUs1A7P6XiOGUHfOIaIA1mfOiROs4nmZSw9jA99YCFGXreFj5TZRCHJLLbB9C+7utkB9Fzn9gGA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR08MB5481.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(44832011)(8936002)(2906002)(83380400001)(5660300002)(316002)(16576012)(956004)(53546011)(2616005)(36756003)(966005)(86362001)(186003)(26005)(16526019)(52116002)(4326008)(31696002)(8676002)(66556008)(66476007)(66946007)(31686004)(6486002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
 UqTZ/Db9u2OuNLlQtA+UC+2uEo/H8VWomUTez1ash4xkxyBWMU7X81oyv60vHTxybX1ODIM/acJAYZgtXspVAm1Ybt0pY80P0w1LXT2B451Ah1rXfGZN0Lw+4svmx7x/DVlLi3smElpN5uFplOELTDI51ydIej5qtnjV070x7hjfeN/rfpDtMWyVrYKgGAOQYcXcmtfwUoVw8h6Cw3zEpuLWzIrdHBi8fWURL4wNIh7JlNBFy4SCEEYHeQ1jwO8nrTUvXuzqgD/wmY/CDaj4ZXtiThS5o/6t4LxPYdYggAnMKBXMd2Iq9W5m9RYyGXEKjoJVOhmdGdLQOQLkKGHtijptrZanMMjLGAAjJSd3IaDa62GnqL5kFDzhfI46ZJLzH78QrF+GaYBWjM7URbLT7evWGvYiPerDyhjcBgCKKfRkdYYlU3O7rOw2iDleO+INOPhu5/yRYx764TVtw4ngYGPTgdIwUgvKSQyux07dlIjMpjnSwn3SHT/TRxEsAh9m
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2773
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
Return-Path: Usama.Arif@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966005)(36756003)(16526019)(186003)(70206006)(44832011)(478600001)(2616005)(336012)(26005)(2906002)(53546011)(70586007)(82310400002)(956004)(316002)(5660300002)(31686004)(82740400003)(47076004)(8936002)(356005)(83380400001)(6486002)(966005)(8676002)(16576012)(86362001)(4326008)(31696002)(81166007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	34c16816-bb93-43b0-8003-08d82cd149f8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	36mvjFDhg6K2szzGgB+G5Er5v4jFUruT0FFxyeI9QDdPXjL24E7ZzpJHOc75kN8Brv1fPupQxMh33nyVu3Sus7EfTzvKWXXcmXq/xsm4UuSZ+Mi0xItL75AIRJ+rQflPNrhfb03AzpJop0Iu5s2kHxIQYwnI2nQtqxa/0GjNP55J1aoSIntoUv6iS/NC3PDq+zPlTjd/nHQKKaLJylV96R26Jk3QB91V1xjwYy5XYHutQLF1q5Jcxy2gbsYO1zSGfdHoClbT8RFvNv2SvRycfHD9cqHCaYHRimY4TTWJpBlOF694WlZ0qnRbetwhe9iswNbPck/VPKOxXt6hsxRn4PCGYNk8junRuRJsxAgz3xBytW8ROeZHLOQ1arwFFyfhBbulZT3pm2yAmBaymkF8EBYKFQmzYPYTae2yuqLgTOxJLQCoDgx4IGxEeZ0juhGLH975IJOLp0GJe2PMJsdPeD0HE9nUCD6VtWwONuDmaFa7c+nFxLLvbR3s1WTH6iNK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2020 17:21:14.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c46b52-c3b1-43f5-a447-08d82cd14e2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2554
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 20/07/2020 08:41, Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2020-07-17 at 15:19 +0100, Usama Arif wrote:
>> This patch adds support for adding default config node even
>> when dtb is not part of the FIT image. The conf options are
>> therefore changed to point to kernel ID rather than dtb
>> ID when dtb does not exist.
>>
>> Signed-off-by: Usama Arif <usama.arif@arm.com>
>> ---
>>   meta/classes/kernel-fitimage.bbclass | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> I keep asking someone to start providing tests for kernel-fitimage but
> nobody does. Its near impossible to tell whether this is a good change
> or one that could cause someone else problems as we have little
> documented behaviour and no tests.
> 
> Could someone please start looking at adding some (and documentation)?
> 
> Cheers,
> 
> Richard >

Hi,

Thanks for the reply.

There are different components that can be added to a FIT image. This 
include kernel, ramdisk, dtb, etc. However, it is not necessary for any 
individual component to be part of the FIT image. In reality, you can 
have 0-N (0 to N) kernels and/or 0-N ramdisks and/or 0-N dtbs.

However, kernel-fitimage.bbclass currently only supports limited 
usescases: adding 1 (no more or less) kernel with 1-N dtbs and 0-1 
ramdisks.

Before support was added for multiple dtbs, the configuration of FIT 
image without any dtbs was supported.

This patchset adds back the original support to kernel-fitimage.bbclass 
for building a FIT image when no dtbs are present. i.e. adds support for 
1 kernel with 0-N dtbs. It doesnot affect the existing usecases, but 
adds back support for a usecase (0 dtb) that originally existed and was 
removed as a mistake.

I have submitted a v2 of this patch which better documents the code I 
have submitted so that hopefully its not blocked on the testing and 
documentation of the entire kernel-fitimage. It also always creates a 
configuration for FIT image.

I guess i have spent some time debugging kernel-fitimage so am happy to 
help with the documentation. I guess you would like a high level 
description of kernel-fitimage at the top of this file as a seperate patch?

I havent worked with the test framework for oe-core so not sure how 
helpful i could be on that. I tried to look for example test cases that 
would test any of the existing meta/classes/kernel*.bbclass but couldnt 
find any.

Hopefully the extra documentation in v2 and the explanation would be 
useful in understanding and progressing this patch.

Thanks,
Usama


>> diff --git a/meta/classes/kernel-fitimage.bbclass
>> b/meta/classes/kernel-fitimage.bbclass
>> index 72b05ff8d1..6f4530fc3b 100644
>> --- a/meta/classes/kernel-fitimage.bbclass
>> +++ b/meta/classes/kernel-fitimage.bbclass
>> @@ -257,6 +257,7 @@ fitimage_emit_section_config() {
>>   	# Test if we have any DTBs at all
>>   	sep=""
>>   	conf_desc=""
>> +	conf_node="conf@"
>>   	kernel_line=""
>>   	fdt_line=""
>>   	ramdisk_line=""
>> @@ -287,12 +288,18 @@ fitimage_emit_section_config() {
>>   	fi
>>   
>>   	if [ "${6}" = "1" ]; then
>> -		default_line="default = \"conf@${3}\";"
>> +		if [ -n "${3}" ]; then
>> +			default_line="default = \"conf@${3}\";"
>> +			conf_node=$conf_node${3}
>> +		else
>> +			default_line="default = \"conf@${2}\";"
>> +			conf_node=$conf_node${2}
>> +		fi
>>   	fi
>>   
>>   	cat << EOF >> ${1}
>>                   ${default_line}
>> -                conf@${3} {
>> +                $conf_node {
>>   			description = "${6} ${conf_desc}";
>>   			${kernel_line}
>>   			${fdt_line}
>> @@ -445,6 +452,9 @@ fitimage_assemble() {
>>   			fi
>>   			i=`expr ${i} + 1`
>>   		done
>> +	else
>> +		defaultconfigcount=1
>> +		fitimage_emit_section_config ${1} "${kernelcount}" ""
>> "${ramdiskcount}" "${setupcount}" "${defaultconfigcount}"
>>   	fi
>>   
>>   	fitimage_emit_section_maint ${1} sectend
>>
> 
> 
> 
> 
