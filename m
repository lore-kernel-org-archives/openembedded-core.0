Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.88])
 by mx.groups.io with SMTP id smtpd.web09.2311.1612489697876669299
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 17:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SLhkgJep;
 spf=pass (domain: windriver.com, ip: 40.107.70.88, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVqqohQZb6x6efswS8DTyUX0jr8qjpLzYBNG+pXY5Zs4vf0mmeziIU23qHn54dRl8PcxVg1kJZW6QNErSzglvkYrKQewLqBJbbcpleawu0eoWQhF32Fp6L0X/n9rfExK6lrLmZCnTgmjnJWxkUxD93RbHVkiita2Kf2Nm3/KFkbr9mytGyjmo5/QjUG3qwTEP+Xk8Xt85J3ZpIkgRlVE81DEvsB2d4EPJL/3Xe9knJvXL72YFSGZdmMmnyh82lq2Ym8SlkUnXvfA+JjdroN1M2obbRFg/12vVKHTfIHRH0VStjpqGYXTpY6gDpEcA7uRh/EV2eWBRoSmoLcjNRNKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JCHX7ldJIqyRAKsOaLe+sRzaD0R3HXdR1yyTgCAk0o=;
 b=gwuS/GKUfoXpXCgchG+G+XuAL3S4BS+ty9GbZV4VmsF6NAO6+wJ99BaipDRAXlmFwEdyP1jcu8tbf66h44feGYNDNbj8rsiqlODu9aCePswjYYaCvsYqw69Uz8cfuJjYDO9fEidoJiLXNFtkn1qDjON6dvwS+SxqiyJ8Q75qICfkOMNbqdbbRQ+4P6mDEAgwkKSmEb3Qh78fXaSheChBq5wz0uufH27E/ClfXLI60lwdiEIqHVgAlumIvOOEonLPMSFVjWbEdIyFgh7qe8Vl0/ChFTJOUXvy9UxnN1JR9ZY7x0pw6K9eeg/yLtQfRuw+DpM37Tpv0IiaqtquMi37+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JCHX7ldJIqyRAKsOaLe+sRzaD0R3HXdR1yyTgCAk0o=;
 b=SLhkgJepVLCO2GsqFjTW2EXIlZrmBMyT4+s88lzSgi3G+F9N8E2LKlMXzS7UNu87yiaU9IRTlOFmUfV39K4Wz7CxCp8n/WsTR1yPwlMx6wrldlAT06EIF62Cua8xHGxQkPfRAaEdm+eC/QmhAuRW3rDJSe8loARxjcsyiSxl3Tw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB3593.namprd11.prod.outlook.com (2603:10b6:5:138::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Fri, 5 Feb
 2021 01:48:16 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 01:48:16 +0000
Subject: Re: [OE-core][PATCH] bash: Disable bracketed input by default
To: Joshua Watt <JPEWhacker@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210204213841.8397-1-JPEWhacker@gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <8b2e6663-fe27-a533-fdfc-b1fc842f6c0e@windriver.com>
Date: Thu, 4 Feb 2021 20:48:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210204213841.8397-1-JPEWhacker@gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY3PR04CA0001.namprd04.prod.outlook.com (2603:10b6:a03:217::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 01:48:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c91462c5-21eb-4386-d050-08d8c9781afc
X-MS-TrafficTypeDiagnostic: DM6PR11MB3593:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB359390CAF5DB7844650D23BFF8B29@DM6PR11MB3593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:199;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7FLMfvrnMwKK4KLeE+g46tn5fWl8lOMFE+O8zbpK910oCkExv5fl+rH7lsgYULd/6E2eQox280IpBHhJpOHQ3IxYQWb3hX+J2Kwjm9GfYBqdMWFqhgwCk/X9ziaMcUcFkLcOTL84G6Mt6+i2gKiykUJJQpVyFtPGof/3ofz3bpnVYU1xtDBFkyYzdZzt74bdDVp1LLX/bAo1qrIk8xBwKcHFHL9mmmBXmgmO44bFjy9wSSXINv0z+opTFHK3jJck35c0bnAeL5rVAUn8zHr2vtfYy4CZi1xa4UeUqRFMoyGG/4ju8qC2BFzhEAhpQs8S9jIO0b0dykig1nwVTS9JV4sMKVa6adYGxKh+300CJvVPxWhoBDAguTrvnd+tVRpRhNBkKEUaNjgifB+fgML/l5uIOc8DfDtHpvvOM1xgqhUxCrswGRB/DArOwcv3+vXOcdzhC4kqUv8y/WY5pB7isxykANg/loipFL88MylBPOpIq8wmZuOoheT949NOTSpHc+hwS25q6oikq8xoo3Z2s6D1jb7NbSVteXy9atuGV7GFeSgieLGo3C3GontO8aKUQjQt3GEH+YjxaYIpNwUTWKqkdnYczF4I1D9rjyP1DcUU2rTuIznHh2S3fyTg8OaxPBbE2DCkE1GhPbr/P4iDos8ovwvV6X5QCw+CXdv4XknlUCsLe0/0o6lNNs2P0WfWNqKMLdMe2vNyok1FMIXIHA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39850400004)(478600001)(16526019)(66556008)(186003)(6666004)(26005)(52116002)(86362001)(66476007)(66946007)(8676002)(8936002)(36756003)(966005)(31696002)(2906002)(2616005)(16576012)(316002)(83380400001)(6486002)(31686004)(5660300002)(956004)(53546011)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MWhBNFVFRHh2STJZdklyempnNXFWejdUNTIzNkJBZ3JTbWx6MDY0Ui9KdzNK?=
 =?utf-8?B?c3NRZGg4Z0UrWkdqekhWb0RpV0ptNTFmQ2Z0Mk8xQk5WQlNRL0xvNlk4ZFpE?=
 =?utf-8?B?bWxoSzFSUTh0UlIrTDRQdDFJVHM0N1MzSGxDYTk2c25WN3FXYk80Q21ubm04?=
 =?utf-8?B?eUZFeW1kOVU0VzZjaUlLYWRNRHVnY3FRZGsvUkl3UlEyOTVJa2g0amhkZHFQ?=
 =?utf-8?B?L2ptUVpEZlo3TkxIWjdndmhXemhkUEExTjgyM21QYjFBT3pZbFk0aCtHN2da?=
 =?utf-8?B?dUZUUUljUCtBMGx4YkNwdDRCQ3IzUXRBWVpEbDlPVUZJcFpMN3puSVIwaHc0?=
 =?utf-8?B?OGNkd3J4b0RwbUt4VEtLbHU5ZmVtTXpjWGFDeXFNelRXMFpSUGhCeUp6VjVx?=
 =?utf-8?B?RlBHVEtzSVRPeFB6bVFYMk1wamg3Tnh0eEdBKzZVcE45S0MyZEJkMEVjY1ZU?=
 =?utf-8?B?UldrQWtaUUtXZk1UNnc0clhnWk5WaDVIMmFkSEk2SjhLZHdhRGtKWWhKa3g2?=
 =?utf-8?B?VGJiY05wUGphOE1pWTdBSXErOVhIOVhBSFVMQUpMbW1FKy9qazdXOVBJbHI5?=
 =?utf-8?B?bDZIL0hWb2ZvZmpHNTZLRHM4U3Q4QlM5NitIeFdMcHplS1NFL1JsYjFGK1gx?=
 =?utf-8?B?MzRENVQyZWFWVFArQlVpMVVPWS9meFBySzBrNVhPOGRjeVdGcXk5MHd6blc2?=
 =?utf-8?B?YytLeXA2MjFUdkI0UmwrUW9VL0wvZ0lEUWFLSTloRmNXY3ZQcDNWNm4yQU9G?=
 =?utf-8?B?NnJwTmhTUUJHeHhvQVI2QXZJU3FjRjZXamx0Yk5lUlRTREpEMkUzZy80RDEw?=
 =?utf-8?B?YlpyV09kSTNKZUhXTU5mVEJUM0VWOTkzM1BVRDN2OXZGdjFXSTQ0S3c5TUF6?=
 =?utf-8?B?RzYxaGJ3RlZvc0E3blNGaDY3VFF0K25ENC9INVNVaG81NGtWTmE1ajhiNWdF?=
 =?utf-8?B?SWtaL1hmUjIvMWRtVndZeVZYeXFtVHpwUUJYeE1kaVhyUjQyWU4wQlJBeXUr?=
 =?utf-8?B?VFlMallpTFgvTTNkMU5pLzl1TVI1dFgybzgzSXJzU0k1aE9lc3IrWkNyNVZM?=
 =?utf-8?B?TFJWUlJkMy9XcUFJWGM2bitJTjV1eVZ2dlJGQ0dzQzV3dkNkRmlGSGM2dU9s?=
 =?utf-8?B?MXhVUWlTZTZuZ0hpVVBpZmU0NGo0SFpBaG9ic05KcjNxdmhlamt1SjFYOWta?=
 =?utf-8?B?RTJnK2c2NWtxRjZiNEdaS2lTVzFCRkxyaVdFNTY1cmcrUFIwL3lMVnQwWjc1?=
 =?utf-8?B?dnFJVXBxai9DdDFOdkR3ZTgydTJ3cWtUSUhmYVQxNkhYMzJtVWVERndvNjRa?=
 =?utf-8?B?RkFyQnB6VHN4MjFjamw2MFY1SUtxc2FOUVhhWFFid05OdEtkMk1SSDFWWkNi?=
 =?utf-8?B?MkZ5MHhycHFzWFBsandPQ3dFZkcydDNxWnArQkZCOGJiRG82REN2ZW13U3cy?=
 =?utf-8?B?Vm5qbnBLcXhNZmV4ZmpGcEdwa0JIQ3hmNFNVWWZ4SVRDNkVVNlNGbGxZVWM3?=
 =?utf-8?B?Q0x2Nm9MdFZlYVFvQVJZdExkN01RNnhRdCtSNlhham1JbFk1OTUvYWM1TnY4?=
 =?utf-8?B?TGtZdHJVc3l2NjdZbldjZGcrQ2NaVk9JM3FtSDI3ZHk5dmFQWHpFRVd4TDM4?=
 =?utf-8?B?NFJ4djUxOFNZc05peG8zVnpCTDFPbXhPUVVhRC95bG5WYml4cVM4dXhWaUxF?=
 =?utf-8?B?aDF0UXZoejBDQW1zMC8vcjlvZytmZkNmVWFiRXhUWkFRbWlBamJEb2xwQ2dw?=
 =?utf-8?Q?OhnH7uF8jq8murW/pQq25XTGbVxzXGRyxAhjEBr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91462c5-21eb-4386-d050-08d8c9781afc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 01:48:16.0358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CR46AmKy1AmLXahbToQGeUAxjAe3xRNE91nx38XWDc1lH9w+wJGPVN9g5DFFSnW3Qa7jhgMwDk5oeBFQ8mqNTJ02T0gRRupMpUNe8Gzg5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3593
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-02-04 4:38 p.m., Joshua Watt wrote:
> Bash 5.1 enabled bracketed input mode by default, but this causes a lot
> of problems with automated testing as it can inject a lot of control
> sequences into non-interactive output. Disable it to cleanup the output
> an preserve the pre-5.1 behavior
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/recipes-extended/bash/bash.inc | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
> index bc737acd63..db326660ea 100644
> --- a/meta/recipes-extended/bash/bash.inc
> +++ b/meta/recipes-extended/bash/bash.inc
> @@ -17,6 +17,10 @@ CFLAGS += "-DNON_INTERACTIVE_LOGIN_SHELLS"
>   # This can vary depending upon the host
>   CFLAGS += "-DHEREDOC_PIPESIZE=65536"
>   
> +# Disable bracketed paste mode by default (enabled by default in bash 5.1). It
> +# causes a lot of garbage in non-interactive shells
> +CFLAGS += "-DBRACKETED_PASTE_DEFAULT=0"
> +

Reverting default upstream behaviour seems dodgy but in this case the 
feature is marked as experimental (see below) so I think it's fine.

See:
https://git.savannah.gnu.org/cgit/bash.git/commit/?id=8868edaf2
and search for:
   +int _rl_enable_bracketed_paste = BRACKETED_PASTE_DEFAULT;
and then
_rl_enable_bracketed_paste

(patch section shown below)


Joshua,
Will you ask that upstream turns this off by default?


../Randy



Sorry for the line wrapping:

+    case ESC:
+      /* XXX - experimental code to allow users to bracketed-paste into the
+        search string. Similar code is in isearch.c:_rl_isearch_dispatch().
+        The difference here is that the bracketed paste sometimes doesn't
+        paste everything, so checking for the prefix and the suffix in the
+        input queue doesn't work well. We just have to check to see if the
+        number of chars in the input queue is enough for the bracketed 
paste
+        prefix and hope for the best. */
+      if (_rl_enable_bracketed_paste && ((n = _rl_nchars_available ()) 
 >= (BRACK_PASTE_SLEN-1)))
+       {
+         if (_rl_read_bracketed_paste_prefix (c) == 1)
+           rl_bracketed_paste_begin (1, c);
+         else
+           {
+             c = rl_read_key ();       /* get the ESC that got pushed 
back */
+             _rl_insert_char (1, c);
+           }
+        }
+      else
+        _rl_insert_char (1, c);
+      break;
+


>   ALTERNATIVE_${PN} = "bash sh"
>   ALTERNATIVE_LINK_NAME[bash] = "${base_bindir}/bash"
>   ALTERNATIVE_TARGET[bash] = "${base_bindir}/bash"
> 
> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
