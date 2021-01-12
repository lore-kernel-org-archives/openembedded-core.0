Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.83])
 by mx.groups.io with SMTP id smtpd.web08.6285.1610437413214318765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 23:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=arPmreSJ;
 spf=pass (domain: windriver.com, ip: 40.107.237.83, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HWzef7PxDVam3bBDBLddD2+Rdx4rptZzByktDSEnmZuXTbyQ0IH1Z7f2ZrA+YDPEVXGHVa4UwBCHDlrbIU4JRVSv+vHeLZMMctuyZeAfEJL9Nojjk+kVCkYDvB0cVQH6BL9RvOVO9SswhkLTBZ7I/lMeXZ+JCLoojSBu6x0RkZ2Xpi0eODKgflcR0jGpvQNlqRUMIA34N+yKM5tbkSitLzAOaEcatBoNTeiy2rdG0zfxFjNy7jBTSoCP/hAbPbJKi/fs2r+7YyP4n4/CmnlqZyNDP//pKbOWNb6ro4zqHezfCIcOY0qkQoSabJsAkmRWaJtqE7XUcYe2OpgytNfipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVfirikCdS3E4/IQ82ELuVmAko0jPWvGa/NTbGMxGHo=;
 b=BZoBi/PLfAx6sfFDBON1Y/QaPR6yIo/9uz87xwQVeGHQuLUnYjhG7tfNd3hmwrwvzLEsPqyNPcK6/21k4pPnOh03Q7lEUZryT83UjcDIwLn4jCDPgrnZiFaEO6ybl3K50sZ79FdIQSOjKuZJ7y3xZqSy9eSdeaBbaaLuu8oh65tsPuObmHZ7JA9Q7thBWRRP4peYaGSrohrXDBx+2o7QdhKI+FiIC3+BBoOAjv/GfAkALsnK12BrUeAAmN7BkS5yTb5LU0NWqfTmiQwbYCIj6Hgj0bjlcThVi3+2xL5WsTLkacnUpDwjYFE2Ov3ooY39MkdJv8vMPJhfrg6ErFzikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVfirikCdS3E4/IQ82ELuVmAko0jPWvGa/NTbGMxGHo=;
 b=arPmreSJdBEtg+hdaMrehZoFVfH3lWi6gNhBbEWgb1iOxm5rrmaP+3lTXe6dWyL/sqeWzEGY9P1L50ctEbE8z7DACosan+ki4YQQJKIxjF59VGrsd9YXqIXb4tL5uJqlPiB6+EV2uxYjLvjdRV9G2SJd7Mj/FJWbNkE2dcrQVeY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by PH0PR11MB4885.namprd11.prod.outlook.com (2603:10b6:510:35::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 07:43:30 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::587f:54db:8f1e:5e2f%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 07:43:30 +0000
Subject: Re: [OE-core] [PATCH] systemd: use the absolute path in service file
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210107095630.32609-1-mingli.yu@windriver.com>
 <b4307af4a02b5d302e06ed776cab0cf84d5ced30.camel@linuxfoundation.org>
 <CO1PR11MB5009BC95B4E3E7547D01CFF1F1AE0@CO1PR11MB5009.namprd11.prod.outlook.com>
 <56862538e3b73683149fcba749ea5dfcedd26012.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <1daa7957-d969-1db0-9bd6-83304c74a46c@windriver.com>
Date: Tue, 12 Jan 2021 15:42:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <56862538e3b73683149fcba749ea5dfcedd26012.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0018.apcprd03.prod.outlook.com
 (2603:1096:203:c8::23) To PH0PR11MB5014.namprd11.prod.outlook.com
 (2603:10b6:510:31::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HKAPR03CA0018.apcprd03.prod.outlook.com (2603:1096:203:c8::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.2 via Frontend Transport; Tue, 12 Jan 2021 07:43:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61c99cb9-b911-42ee-0825-08d8b6cdc1ca
X-MS-TrafficTypeDiagnostic: PH0PR11MB4885:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB48853E1833DD38381237C26BF1AA0@PH0PR11MB4885.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	S2K+aLNrz8eZTR4C93tDBz17Hur7uOCNjN5N6KjmkZ3iXXpYrzzscb/nWn/lSbZnpUBEQUsNl1rljsuFXvjHvM5uSdGNbEk8dS3fHPMILgmc4pf3n+gm1xneupHzdEFw7Xl2OK9H/RuN11lbbjcwiC0BASPzuLBMLii5iGS33xn+h5Prq9zqvZhBxIJCB+BTsvNYoDnZsd2A2ZVVd/QtUxeXMUbEDtqK+EB8TGqJBOldsvmkO+mj5g9e3prWaS/WxD4UovImGuafpxnlfObOkiMF+Bw7skdQn7katxOlsCD0FU11Ywi7NLg7pJWK2y1DoC5jZzSMrPa+WCswlazRP1ZOUO2N3DW6/kH+ihnEEtw4413qxmvO52v7xv9YnmR+ieWDF5UbgRARlO1r2NLffPasbyGzlVpLmHhTFkQdcnN5adl2YcX5Ul03eZCNx1Ys31GuGLPo252fl8SBAjTKwhPdhgm4Qb7iqNWazBYoboAfUsUOhx2L5jS60OsFJy8zzcA02jZAk8TkRuAFMFYwhFtHDABt+J/ORwFCSq4y8UqzVwiO3iaAai8D9Aur9DvYd40hT4sSlgMg2jMNwDF3Dg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(186003)(16526019)(26005)(66946007)(6706004)(31696002)(2616005)(53546011)(966005)(86362001)(16576012)(36756003)(6486002)(8936002)(66556008)(66476007)(478600001)(110136005)(31686004)(2906002)(6666004)(52116002)(956004)(5660300002)(8676002)(316002)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?c3R4c3BZcStjaE1zZ1RJTmZtamhhNXRYbGhQRkJBbzM0anI5WkxmV0tvdVZT?=
 =?utf-8?B?SVhBTVZWc1kxd3dKTTF3YzFwRmNOTzYwaXprWFZhRWNSd2w1QWZXYzdmWkNu?=
 =?utf-8?B?VjBMUFh0cjdCWHRRb2prMmI3TlpZK0dDZHAvWWpIQkxHeVpUUkFrcVk4VUll?=
 =?utf-8?B?TkI2R3pRSkpQc2dHU3lGZzFXeTdHTWdMM1kwZWIwa2tsS3VEQXYrc3ZKbEVk?=
 =?utf-8?B?dTNmRE9Wa2lScDdaWlNKcVRuOGdpcGJaVmxJS2FyS0JOejZkQk9SQ0gvNTJr?=
 =?utf-8?B?a1VFNUgrcUk3dDhpQ0F0eHZ1TnV4MmxYN3IvS1huYlF1UXRkRlFFaVQ4TkN3?=
 =?utf-8?B?dmtyMGxpQThuQUJUYVdNSlZIdVNqQ2hWZm9pdnpRZ2JLS2Y0OStMZFpNcVJN?=
 =?utf-8?B?Rm5vYUpnZmlhY01WSVJGemwvZU5JR3hKMlE4RXZDa21lakVFUWFJZ1RtcGNT?=
 =?utf-8?B?L01SY3FKcEtDY0gyUThoa2tEL2EyS1VWNHlRUDBsQmdOV3pyUGc3N1Brb090?=
 =?utf-8?B?Tll1WXlXQkdIcHhNZ0k1amt5Qmxjc2dXWFBZMjNjV0ZGeXVIblkraGhnOHhi?=
 =?utf-8?B?Qm5FN3VVUTF2QkpmYzdtUCt2Smo5ZmkvM1E1RUJHZzVzNXV2T0EwRmZpdGVU?=
 =?utf-8?B?N3B1elIraWwrTUFSZFQ5c05MZFNlWUZyOWpLMmN3QlM0V3ZVUGFueHJuRnBu?=
 =?utf-8?B?Q1lYTVRybVJyeFh4RFR5dmVoWjF1TDZyWjEvRW5acytDaUdleEV3QmtTV21a?=
 =?utf-8?B?RURxWWJaMWNZcDluYklRZkxSNkFZUGppQXhvK1NZSUhreWYwSnFac3JGQWk4?=
 =?utf-8?B?NHZuL1ozR0RnV085ZnNENVI5WWlxSkQxbCtNRXpib04wcno1T0Rma2tJWXZr?=
 =?utf-8?B?YjRPVVg1dlB2WUNuc3VQMkNqSXBhUFBZeHNVdjQvZDFrbkpTWGw0VG9mNjVa?=
 =?utf-8?B?ZDVSNEhtNS9wQnR4M0pZakV3aU5uV1B1eDlPYzBTMHV4eUVuUDFjbW5BK1BC?=
 =?utf-8?B?akdkczdrMmxvNlVFOE9mcGtrLzJjMUJUbzl1K00xYlErY3FPb1g4SWFoWmwv?=
 =?utf-8?B?T3hYNUlNc1ZMbEwwbW1WVVFXa0JWOHhoOW5qbmt6a0p4VjZpYXpyWk52VWVn?=
 =?utf-8?B?SkxvUFNDV09WRm1SeXExbC9qdHpaZisyTVlGMnJwNGpWK1Jsbk5XRW1md1E0?=
 =?utf-8?B?a2ZSNFQ3aHRLcVVhYlNCNU84S0xHOXFVVS85NUFJcWkrRUZPN0Rna2hsQ1Fr?=
 =?utf-8?B?aEFoL2JHNUZqbThQZlRKS083a3J2V0lCejNlS1loNWNyTjcrWE5Jc05KZlp5?=
 =?utf-8?Q?+BiiOpg2ljhPhRg7aNd4KEE82EhgWeLH6R?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 07:43:30.6996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c99cb9-b911-42ee-0825-08d8b6cdc1ca
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97YFsR05YtV9+OYVdcKA6MHaeVHFitQmWaQOMM2exb8Fwyj5givD8vZx9NwRh/CYDEe4qu6VoQgwT8EZoL+zBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4885
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi RP,

On 1/8/21 4:52 PM, Richard Purdie wrote:
> On Fri, 2021-01-08 at 08:40 +0000, Yu, Mingli wrote:
>> This is just configuration change which defines the absolute path for
>> the command to silence the warning when systemd-analyze verify the
>> unit files and the command may be installed in different place
>> between OE and non-OE, so it should be OE specific, will resend v2 to
>> mark it is configuration specific.
> 
> Why wouldn't systemd-analyze show warnings for upstream too though?

I also checked the service file on other linux distribution such as 
Ubuntu and it also use the absolute path.

Thanks,

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
