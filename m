Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.65])
 by mx.groups.io with SMTP id smtpd.web12.51516.1600048452220888682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 18:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Mln16/78;
 spf=pass (domain: windriver.com, ip: 40.107.220.65, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=guN5uiEJ3jmMahbgN1Td7D/cAOs/V7no4tE4JOgAzcF79daEfipetEhtfUG9LHiuBjSJWeD7bK+cmUN9yZ9EHufXNyVOiNWNWlIWQmFWRs2lFX71PbRH2Cgrwer5mwwfD6qJAMnmXN4NRGzl2iWAmm60ssTrqadnnSkcAnJ1sol6U3RzMCBNr3/rSAsAh3wxeJLIkx6DZNYKIFnEtm2waBZfjwGBb3hbss/rQHkLAkbYFL5rooAeCigA8sVLq/YtUZsnMLQ+TjL/UeMEHrntcLu/Pe7pHfH6kI3rxZ+j7ayZooyBDT3VRAzM5CvuBeznl0miXaySKZKRHyev5puYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zCqJnAi6jS6uwq4n5bjuZZPdB3OryaT4eY19+b+lZ4=;
 b=im3ztHygV23Deyy90bQWtukWWjWS8nq44D6rM0vRb8Mo502aFukrvtWxC+I7yaT4zJx2hc4EJ/pgcC9sYPm2Gg+mHIKqDekyKBhPVBmioBjueJjgKsoCaTMFSiy4u0lUi5QfkyPGUelCaJGWbi3CpbdqQGNcDPQdUtaxjonNlbDLsMeztao/NqM8hm+ITF2LbGw7xKrU9H8nLhBWiWrdkdVI7mrG8GqZ1CbCtTIkb6cQe2FVPFvEMhxFFtGVSG8UsomQh/CBxczO/fedu9FrXwJhxwGKVP8LSQ9R4bZU70mhErLjmzKtv+sNson08Fs1YhZb6J382OFRt+ZwgOJSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zCqJnAi6jS6uwq4n5bjuZZPdB3OryaT4eY19+b+lZ4=;
 b=Mln16/78wlGwk8APOdbvXI4Du1vE6bfUJH+nem0EB0qZdsTfBaqQ7azthf6YPVZ/+QOcvYS5sc7ZogD/NAYsFT1OoB9scUX5TVicEJ73gv4awPnw2b+AT3zAsH9dPzf6CWcBDoB03zMRXTd3rePxrVgu1m5w+SmflPE3tsh8eVg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 14 Sep
 2020 01:54:09 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc%7]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 01:54:09 +0000
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
Date: Mon, 14 Sep 2020 09:50:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
X-ClientProxiedBy: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR03CA0054.apcprd03.prod.outlook.com (2603:1096:202:17::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.5 via Frontend Transport; Mon, 14 Sep 2020 01:54:07 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dacc009f-0a0c-4e60-06a9-08d8585111c1
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB280826AB3C7797FCD64F5C60F1230@BYAPR11MB2808.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TC69AoM5w3YEneznoylt6d47owEmPiUcYtiGDtXJSoF2rNf/h3Plx4GXACfsI7sNDuQxuC7kTpRIxdcYvE3c3xnuTmtF3vHJRi8BuoCv+TZbBJhP75JN+V5C4xLyGzEjTrJNEwFd8D0H4f16nwT4g02ObgrHFkcczIjNg+j4lnL48sB6oNYoV7XLK0DeI4x0jeU922U6NQKFcBEai4OJSyBcuE+xV7NwvYmNpjTLNRPJf3Em8DWkTVoNHWKAcEm7w3iHcvZhGDLnm8Gb6dLKONg+Ytbv27gj3FeYh0kOhMeUNrlIB42JzmSqPcKryhsjpLbobPNjMtMq7qrN7H36HTEPCJX+sPSB3us7fM6Xg18P5zk64u7UFRuYrbKJ74KDRCA/tK8UhgdIf6t1NZg3T6Xo8c5UcyYL1iAHjvjIiLjY2FR9A50jKSuy7ZUG9N7IyNeQBAFoN7ONTb9708LizHPT4y1rcsJ8xKkv/EE7H5U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39830400003)(366004)(136003)(36756003)(8676002)(6486002)(53546011)(316002)(186003)(83380400001)(956004)(16526019)(26005)(2616005)(478600001)(66556008)(66946007)(66476007)(31686004)(52116002)(6666004)(8936002)(16576012)(6916009)(966005)(86362001)(6706004)(4744005)(31696002)(2906002)(5660300002)(4326008)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	k4KZ4triZToa/wPV9YQ5iwoiZ+aQn2Y0pMwK+YHLCzibJiwKO1W6a5+eedPLKh84QVC6s6WYx0jYQib00sUCfMGei08hrHqh3MsnPxeC8rlVy32kJYj/+BCj/irouGSq2J/eU52Elw6kQsVSC5DBmmwpFXacpIh2fFYtNribDEZSNwlr69DdTtX5PexmNvMkEeOUlbkUPRpDiuIuZRs3bwa7mtQx7spmHFs+u+vnss1SjmZvgLNGe0dLpFagwbCuJNGuoGF22oqhgNOOPqdhNygcBXs/lgkmaalYBax0TK1MvS83SM6GRHT0kIc84+Qu2TTtN+8FOEUzH3y89HJ4iwo8BlD1qKeTZi8FdGIl8TEy0adujoLGoFkk7hHixLb7vIJvHq+RhL9Y5/0G12VQzRNcbhAuD+DD6HYmUPhJo47Ch4zlJJOsMRD/nKz8NNyXUZwEAdKONjLREpLwSGc+TElhs3OHoP7JOHJmS8czuhphmSKWLvIzjhQ0gZzqKy37zUWyuKtVPP393wYLJR7YMNXjlJWrfCwVPoFxiCwKdZdGd6VjGoAFXPhfHJNyVjCA/46vnxg6X0PZVP6WRIMpbwmxClZM1FxLdlB8tEZeht3/sD1Xx8EdHXc7b9VBxpwgEEPBIOKrdOOzqtboEjl5vw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dacc009f-0a0c-4e60-06a9-08d8585111c1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 01:54:08.8172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2s0Wj6ESjeowKb2syJcXBK48b4vux1Q0P96deUxzhpxG2bGAS0r24kTHhPr6/AxB3sT/QxNuvzIa8cbNI9ap3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2808
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/10/20 6:41 PM, Ross Burton wrote:
> On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com> wrote:
>> +Upstream-Status: Submitted [qemu-devel mailing list]
> 
> https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=unknown_lock_type&submit=Search%21&idxname=qemu-devel&max=20&result=normal&sort=score
> doesn't find this patch, can you link to it please?
> 

Hi Ross,

The link is 
https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html, 
will include the link in V2.

Thanks,

> Ross
> 
