Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.48])
 by mx.groups.io with SMTP id smtpd.web11.1519.1591854567701716893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2020 22:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Z4OnbsWE;
 spf=pass (domain: windriver.com, ip: 40.107.93.48, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZn4O6ug4izYNHqFSR8qAdOUiLOgvSXUpjuKsb8QugP5AXqr817vbsXZndSp9KxdHYJL/R5FLC0wWvek3PRfbuz/rpfWlRkCFvNuMWEb+tUNiWwdg1I3HmBARJLgcfPvAx+7r0gNgN17UUiR41xOKX9TgqBKzZx+eGr6SdsP9LAUUpp5TW9D+dxv/BRhKAdMuu8+3mdZbVi16hFwrt/3F6Vdnt8BlbSQwsSeGT0NxTmdcOTv5uLVWKBze3+4fURDeUd5tjUNr9HB+bgwXMgIFGUfIiRLtRor38Au9pb75+0s2yApYKJ2wH206kytTh4TvBfHU/w1uuFMMGRCOCNtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPH+rBeNp8F+TUzgeDmIlXhj9vM+UM9AaegilrG9tLI=;
 b=Vus08G7godyt8ltSRrpRj4dLNCimw4kgiUpou8WUaa6jhQ/dD3Zb3jYTBZ7RuvAelqXe/rrnpxCdXjgVwP+UzHiQz0q9BCNYTviKRvUmkJ6aEWJeK3jE608QweBZ0/YH8E/SK/N4BqXwv9YQaJPlWo3UWhchbu8G4uwWVBIhvEI3fcd8KJRA5XAAmb6F2lfNw4KoOKLzR7ZXsoTs/j6f6EVxqiNMQ/4fPnazfAghvPyaOpFmD3PUxB62T08GW2ZOkY46YTx+lhTUdneRWk9kKVoMvvfVFxX8wNbvjh0wMZOoSbmjvdxTzsa5OXDqiO40ORp9Jn15PEZtoetcRsOzqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPH+rBeNp8F+TUzgeDmIlXhj9vM+UM9AaegilrG9tLI=;
 b=Z4OnbsWEYgd/fHa0y34gT4T3BeGA6jYNO/ROR2AqJLPaMXn0Fwt0rG54g1H8EGupuBBhuqscDUCNY7fxAv+ZBEL34gM0eb40MJqwqCiC3SY1LQcIy6Cll8tX7KSrpJvcoamk1szU062eOJ4pIduCIBQEJPwbnVBBi6mdxMjCfXg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BY5PR11MB4181.namprd11.prod.outlook.com (2603:10b6:a03:18c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 05:49:25 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Thu, 11 Jun 2020
 05:49:25 +0000
Subject: Re: [OE-core] [PATCH] python3: add tcl rdepends for python3-idle
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200605084729.563714-1-mingli.yu@windriver.com>
 <5f4e92d0f303fbab8acf72dcaa7e0908d0dccd80.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <7b94fff7-577a-5dd7-c40b-8c65cd407dec@windriver.com>
Date: Thu, 11 Jun 2020 13:48:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <5f4e92d0f303fbab8acf72dcaa7e0908d0dccd80.camel@linuxfoundation.org>
X-ClientProxiedBy: SLXP216CA0020.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:6::30) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by SLXP216CA0020.KORP216.PROD.OUTLOOK.COM (2603:1096:100:6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 05:49:24 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff0b0bac-921e-4a1c-82a4-08d80dcb327e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4181:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41810069485C58D998D5FDFDF1800@BY5PR11MB4181.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0NitgIQdHn8uMnwOhDPd97kStVDW8xUaWSwJI9GcvdrqtbBDk5HNKWmd8B024/4ChJCKcYT2RMzHeTyDcWkABQtgsTgAhgIc6H312OS0kYDxenn1lrFESf+XGBwec5EF/qlq0W+HpEd+mA/0ScRuh2MEzOJ3jgXXYsz/5dG9BHXF9RGZaCIG6QBwUvg20ZUujTQFf2poVCFLx6e6sw9j5e36ZlnO43z+XmaWVEcF5uOHlDwi7n9ge+889F8FwG185YsLZ3jR5VPkNLZxeKdfbgfEagRT6R9n85qjxuaz8Xspmi6Jr+cZcRX6f83kkOYDw0GbHKxeJAxnj0/WypgwSScgfgNbBcuoJUyCxxVxUSP/onizEdoO8nZDC97e7Eeaks3hrA3d1SPbJuT171WKT2Gy4+X3zK/PYOm9yAtHJjJrXW0jFzIF/8kCL2zVESEY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(39850400004)(396003)(376002)(366004)(6706004)(31686004)(6666004)(66476007)(66556008)(31696002)(2906002)(6486002)(186003)(26005)(16526019)(66946007)(5660300002)(316002)(86362001)(8936002)(16576012)(478600001)(52116002)(36756003)(8676002)(956004)(2616005)(53546011)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	1dv/0UzfOkNxl9sNupioqYyso13tZG3CWyqBV/Nv73rFAs0vNtdOcS3I4hmpNNXyi+n9vfyeLFr7nqPbvNb4G7s1zFZInD1E/wPu/CmwnBgpsKXNHNAaNIYbCo56mibbKgifT2gMpwW57+ZCDFHMRtTUV93R6ThqVoIPaGU8qELeWOe+hCWuff8xtULsE71PdADhpZn8PdgT+TRdXqwkJaFmvPmN4NyDaXbFi97AqD0MQlcq5jCJRYz6YmLhE9+HMqW7Sg0dFCvopPqaZwZB/jSKkZaVTsrDIZEn5y9UFm9X+EWQn8QQReM4y8azj4qt9Se2/qchF3cCDc6HUa7HfAiBbjpgkdP2XVhNEku9n/tm3BuXBfSAVephEwlX28p05QedicD/oF5wZDIPXT0q/0/Dv3FzjphU5vwIwkC9gq/LIAGECgFRfqPdFu6VldiTn1D+p7XU0KfGgNAP0aa3WnCRqWtOmbsu7oPRBevH9tA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff0b0bac-921e-4a1c-82a4-08d80dcb327e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 05:49:25.1787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvjpLWHnNkAo5adLvjnziUys4i7qWDj7G4CD5t5A6hhGuGGKnsvsKwD+mL/aBop7XQubKbLOa6qwDrkItnQAYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4181
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 6/7/20 6:16 AM, Richard Purdie wrote:
> On Fri, 2020-06-05 at 16:47 +0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> Add tcl rdepends for python3-idle to fix
>> below error:
>>   # /usr/bin/idle3 -h
>>   [snip]
>>   _tkinter.TclError: Can't find a usable init.tcl
>>   [snip]
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-devtools/python/python3_3.8.2.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.8.2.bb b/meta/recipes-devtools/python/python3_3.8.2.bb
>> index 0474f07214..0ddf88699c 100644
>> --- a/meta/recipes-devtools/python/python3_3.8.2.bb
>> +++ b/meta/recipes-devtools/python/python3_3.8.2.bb
>> @@ -346,6 +346,7 @@ RDEPENDS_libpython3_append_libc-glibc = " libgcc"
>>   RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
>>   RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>>   RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"
>> +RDEPENDS_${PN}-idle += "tcl"
> 
> Shouldn't this be using the tk packageconfig too? or depending on

Will use tk packageconfig in v2, apart from rdepends on ${PN}-tkinter, 
it also rdepends on tcl.

Thanks,

> ${PN}-tkinter?
> 
> Cheers,
> 
> Richard
> 
