Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.55])
 by mx.groups.io with SMTP id smtpd.web10.3845.1604345468103063011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 11:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Hxq6LyQq;
 spf=pass (domain: windriver.com, ip: 40.107.243.55, mailfrom: jason.wessel@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mng65OPxoMjXOnysuR0EWsETjsyRhTFlnw4iOsmP2/LochJ2CaWcGd5VAVbQ7vCnlC19nDluftAzw7W7rpkD+sesZq1cRmL51OzsyNqBvTLsrvGqZZVwNQb+jZgwu0zoVkZCvD7gQMox+xX9AcCQOAxCkzr5Dkm0Ybg+6EoZ/5evVqtRREiYma67+8qvBuPvu6Xzg4i0pqn3zvOkiocjpBgDfSJdh//5i72wsV9QhLqAf0PS0x2IEj3rDsHf8x/Y8ib6qV3NIIfFv8LDQrQEowO/JHI7Bv7+GjlIL83flLGwUZ1hlLZ/Oom1ocwXiggwG3tFhCGGk1FTxxoN1Jixgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPabWzDbI/6ZZcx+Tqd+/CJYBUXAKUH5VwfCVewHGBU=;
 b=oX9q5xcd4xOBgEJHSoqMyUH8LcugsZz9Inf4qhHQAoiXQHPuflPHlWsAidW0mz2i9ldR4/6RKHSLuopwuMTMJX1cy94eShpSvatSSDVzNCiVV4q5LTaaMjMfbsHbRFEmPuiWnXVo0xwzEIXKAX03oSrp4SnDh8PdaT8SzuMnuYmo+e249XiY5ysELLXqGi7OhFz26SpE3gFTaOUyQZJuzTJo0yfhsMjhzPMEZBSEc2Wx+KXanIAAShpij4hf5Y3UQVMlBocLeE/26jPqZvKrKfTkzMJmNMel2iA56YLI/D+UZwlKnWLwvjhvH+bPTGHQ3dE9KoM5PTeC9xCTRlnA1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPabWzDbI/6ZZcx+Tqd+/CJYBUXAKUH5VwfCVewHGBU=;
 b=Hxq6LyQqz2zQlGRu62t3U1Hfri+093gfq4qBa5eopE+803avSCN3RXh7uUlvV43jjMJBjccCE+vI1CdY4xW266krXqnYea+7Z0kHhYm54nsUSZNkVpASq2iJHGiCNYDfbXH1BGLcPUegdnvfhMOB2Coor8pmmvI+ofH0lcbJU0s=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3514.namprd11.prod.outlook.com (2603:10b6:5:61::26) by
 DM6PR11MB4153.namprd11.prod.outlook.com (2603:10b6:5:19f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Mon, 2 Nov 2020 19:31:06 +0000
Received: from DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97]) by DM6PR11MB3514.namprd11.prod.outlook.com
 ([fe80::9945:c647:8f02:4a97%2]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 19:31:06 +0000
Subject: Re: [OE-core] [PATCH 2/2] systemd-serialgetty: Switch to TERM=linux
To: Konrad Weihmann <kweihmann@outlook.com>,
 openembedded-core@lists.openembedded.org
References: <20201102185921.65148-1-jason.wessel@windriver.com>
 <20201102185921.65148-2-jason.wessel@windriver.com>
 <VI1PR01MB6462DFFAC980A40F8A084D6EA8100@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
From: "Jason Wessel" <jason.wessel@windriver.com>
Message-ID: <2119ed7f-4da3-da5f-9686-a4bd17f3f197@windriver.com>
Date: Mon, 2 Nov 2020 13:31:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <VI1PR01MB6462DFFAC980A40F8A084D6EA8100@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Originating-IP: [73.74.120.8]
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To DM6PR11MB3514.namprd11.prod.outlook.com
 (2603:10b6:5:61::26)
Return-Path: jason.wessel@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.0.2.15] (73.74.120.8) by SJ0PR03CA0075.namprd03.prod.outlook.com (2603:10b6:a03:331::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 19:31:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd8393e-934f-4fce-fe5b-08d87f65d79c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4153:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4153DB0AE431734CDA7E5F3797100@DM6PR11MB4153.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y2P2KHUX9QHjy2f912WsVDbB4PqPKRUoaPjeNZrJcacMT1pAJplJicPOqDbgKMw/LqZJZtC9smgXUglksRZQjtrFYwAeG/D+d6/nmac4eaJgV8+mIOgnoeHtPBQdlIVRNMmGxmR+0dUC6fXV7h1nbs3srnkoAAiUDOGnem11FiCwE/inEiyysqVowSBGCTZWIZVxObodMK4fAJlkMNtTj2ezyon1Nmb7OiNIPQ+vnV5cZSVKSj53f4aMqPFrxpQ6KH5ZIDXEZMR/E6xZF4V55UvnGOKCyvrAVg4iqzBKLl4U0yGUUr/bzQkpG9BBbK/bNagsh4tWyqBe2a9ob0agmPv1l8+0SpOd7ehtN2X2u96y7X9U1e5sYU6tjvIeyswhhXmhjHKdSG22PKP3difjCKC2aCytTnAcIC9DfcoZzXQk6wItFPg50rXK4zwrO9r0urKlsxn894nHFHVHKlNxxRIFwe3oesCWqRKTlZHgm98AeNDKgkRpoGmWrbFxm6jB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(396003)(376002)(366004)(31686004)(31696002)(316002)(45080400002)(966005)(2906002)(478600001)(53546011)(8676002)(2616005)(956004)(26005)(186003)(16526019)(6486002)(5660300002)(66556008)(66476007)(66946007)(86362001)(34580700001)(83380400001)(36756003)(52116002)(16576012)(8936002)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	myQwqGXmvcIZl58mSNTOJzG2E3eogZE+dcLCL6IgxWiXE7hG8HqBV62CoZeIlQGdV499r3/wL5BVzIJguGT/lOjeSrq7PUDm5ArWNoJogNcP3yurNyqtKcwwk9i/QgTXqc1zoMYogqZM1OHZ5NDBQhURhT/f/pWQUcRDp2tLj3v7WjZjucVLpjgyWCjss6yWDEiee39gZGdaxY7WdpYJduY0aeVapN96GCCUHjPZIAz0hnLm1WCM7ELQBRqoGeJ9kEkLaWLaGde6v4I85PpB8ayI1jLms6bwk13zuzKK6YBSb42J1igB4AEI7y0POkVRAerkox9RJaOLlOVtmOPJjOO5kHj+RofM9uMNp3zuPSYP9e1cjODzi0/qOhHnI86ggjauVzMDDIzipwh8UUngAGTftyBHL+FwZMIegyIxkqFQG5AllVhEZWFq8U5ytkX02j6SfW6Upz2MtggLWpODIWZNu7gAELyxWzJ8pfd2U5O7sJwnCfP9AI7skt0XGOGmL6a/RJgbtffWKjubaCPk7jnyOXXWgZsgFVWfEAdfOe7/BPbzMuz4Atc8EmWHHJWGXqkOiVXPW20dl0+5mdZW0MHAWrmL1IdyU5S5iplfpKwqc4bzW6UJssIWRhOtOYMRmpOGy2A5ZB/7gBwDehrD4Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd8393e-934f-4fce-fe5b-08d87f65d79c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 19:31:06.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTitSlogNH9KKKZgsesVCcdQ+wJ3KrOO3J7hMxs9KAe23lcNyY1VzDpo+KL+nqCfYFUH12RkAjUR+kBCPiFikCd2UocdP00KxYpIZWcpA0g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4153
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 11/2/20 1:22 PM, Konrad Weihmann wrote:
> Why not have it configurable as already done with BAUDRATE?
> Especially as it doesn't change the behavior for user without the 
> mentioned prerequisites
> 


Good idea.  That seems like a perfectly reasonable ask for
a v2 patch. 

I would still change the default to "linux" as it is broken
and the defaults for the oe-core should work for the broad
range of users. 

Jason. 


> On 02.11.20 19:59, Jason Wessel wrote:
>> Long ago in commit 473ff65c2f69de4ece3204fadfae7c5cb992149a
>> (serial-getty service: Add xterm as default TERM), the xterm
>> became the default for the serial port terminal.
>>
>> Using the version of vim.tiny in oe-core master with the
>> serial port connected in xterm version 322 (which is one
>> of the most widely deployed versions at the current time)
>> causes artifacts and missed characters.
>>
>> The example sequence is the following:
>>    * Start vim
>>    * Press "i" to enter input mode
>>    * Type "123"
>>    * Press Escape to enter command mode
>>    * Press "a" to enter append mode
>>    * Type "456"
>>
>> At this point if you are using xterm less than version 535 you will
>> see on your screen "12456" instead of "123456".
>>
>> Changing the TERM variable to "linux" will still allow you to have all
>> the same functionality with colorization, ansi character escapes
>> etc..., but will avoid the extra xterm specific escape sequence that
>> only exists in the most recent versions of xterm.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>   .../systemd/systemd-serialgetty/serial-getty@.service           | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> index 549d566009..f2290639a6 100644
>> --- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> +++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
>> @@ -29,7 +29,7 @@ Conflicts=rescue.service
>>   Before=rescue.service
>>   
>>   [Service]
>> -Environment="TERM=xterm"
>> +Environment="TERM=linux"
>>   ExecStart=-/sbin/agetty -8 -L %I @BAUDRATE@ $TERM
>>   Type=idle
>>   Restart=always
>>
>>
>>
>> 
>>
