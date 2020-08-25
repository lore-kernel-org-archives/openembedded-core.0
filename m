Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.128])
 by mx.groups.io with SMTP id smtpd.web12.8235.1598336330611825976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 23:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=MfIoV1oL;
 spf=pass (domain: prevas.dk, ip: 40.107.22.128, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wc/9VJ5fgC3RX5RlnUHHsI1eMvz1mPAU8TwZ1B6iEujOvif9GnMC2CaPhhn1tui99cexRWMX9tVReh5RhlQuRPVuhzCGMVPINaYLofHj0xCr0/CXHW/vxpDP/TtJszgo3qyoNiz+xvsFvq56nlT6XWe9LE49Dc/DfFqHXw+QWXGgpgvoWnpRw1YO81zCxWIhoWcbVaQbZgAkfwDV92FRwuFpn4eUXeuPazfOczb+K5O0mkM8ITO/IC2mFxNBIKGB4i0ImEUrY7WFnnM6we0fVRQdsyVGvva/IfqwzxCPioq6jvg4n2mIRktfnAFL3PSobJNlrg53wZv+KoU0IgBQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCa299Maiq3mGzDkJBfoljhQOaSPccBe39RO6Rb037A=;
 b=j0ZDqtOsYtY38gv126z64j1IprlZj866wkyqwYSKg9UrO1s4yO9bC6nKOih3VZCmMLeegCL4VVuo9vTcQeOXNAN0K5CvpLtFn4/4cWovs7a7Q7iKQUBul+juE1IxdBuaG/UvWSTxt7Dc7DAiHVSPJztkqdYzgznuj6vvDDo8tDCUEPjuzulTaSF6onYustSVTIpfyOF5LD49j7xJq2jDn9hoSCJB1wJIMUbIsNkMp6GXXDtB1iPuN4BU6lMZiGAxiTyz6gEhRCq+qxx5kyWmkKisNAZ74fxLlV0YjvA3OB3cUeU7+Mu0R4Y6/fTN18xtz8VsvxZPUYmohvEZY5lYmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eCa299Maiq3mGzDkJBfoljhQOaSPccBe39RO6Rb037A=;
 b=MfIoV1oL6eVsNrc4RYOTkMBS9iGlmDv+wy9CfTW/1etmL6oGpxGRLtZihaDC7G0xJvXe/H7w3ADTKdw0ii5DvEvGo4gtgcpjsdUQ0Ua/3Em8AT4V9aWPsEBWjDLCYuH5iQwCG9BQih3xFcG0nPf4g24pg5Ib6CjWW0RYvzPL8fg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM0PR10MB2962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 25 Aug
 2020 06:18:48 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3305.026; Tue, 25 Aug 2020
 06:18:48 +0000
Subject: Re: [OE-core] cleansstate
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tom King <ka6sox@gmail.com>
Cc: Joe Slater <joe.slater@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
 <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
 <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
 <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
 <fb0fa58a-cf84-9a5f-5b5e-489bd154b257@prevas.dk>
 <f058d2bf3e7d880aed5682d958e8afc0b90f752d.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <e6facd8b-6b2f-0d78-f54a-cd79e6591059@prevas.dk>
Date: Tue, 25 Aug 2020 08:18:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f058d2bf3e7d880aed5682d958e8afc0b90f752d.camel@linuxfoundation.org>
X-ClientProxiedBy: AM3PR05CA0101.eurprd05.prod.outlook.com
 (2603:10a6:207:1::27) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.16.11.132] (81.216.59.226) by AM3PR05CA0101.eurprd05.prod.outlook.com (2603:10a6:207:1::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26 via Frontend Transport; Tue, 25 Aug 2020 06:18:47 +0000
X-Originating-IP: [81.216.59.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e642e6bc-d7d6-4141-ba4d-08d848beba35
X-MS-TrafficTypeDiagnostic: AM0PR10MB2962:
X-Microsoft-Antispam-PRVS: 
	<AM0PR10MB2962A141E92C4D843CCF464993570@AM0PR10MB2962.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AOQUZyqdKed4emM3uOgi1p6uvSUiOWICJ0BnHD+7uuBbe9qVNB2dniacrlPpMmEXmISTBcpr7ZAiAxMXCrdBV8bcFZv5rkuFi6RFKXK2nTVQTNqdxTjY6CEkM49ekggOiMHNzhbirCY/w8t2/XWYlLgULGtwZHpwYfCA2ciVa44tBnBqRFX/a8wNRueAd27UV/BjNMtNWfeCPZH7JQRlHUuohGVm/8kfOh8QO8VY41faxfs8V/Y6jt8n5zpWdzJ/y+h1s6zFShQWErWISyoiJgMvCxPx9FAuUHbUkmIhlgD3Ap4ZNBjYuhboIUjpAxBROoSRzCaCMk9DlwxbOU+8rujde774YD67U55T+tqRNkMlJwR/OEd5Ns45CuPnx0T7KLXfTPgZhq9HZR48vCC4jugw8RVdSem+zDlka5wsGGPnARk8jax9OcTQJOoC0WX1poS+d6N25+y8JUrmLJg6Vw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(39850400004)(396003)(376002)(366004)(136003)(52116002)(86362001)(956004)(66556008)(478600001)(2906002)(6486002)(110136005)(316002)(66476007)(4326008)(2616005)(66946007)(966005)(16576012)(83380400001)(54906003)(26005)(16526019)(8976002)(44832011)(5660300002)(36756003)(8936002)(8676002)(31686004)(31696002)(186003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	KI6tgP93k6lTtuqn7krc7voaOuKSkFy73KxvkTvcyq9aEX8Vij8hjt4Z7/5pvM02fCy0lp6OImPEPdOIGcG+cs5JwixNjylbSzNMvmnKqTOdY7IbwjNgf4DwPdQ+QrgyyejkgiChz6sfNs5phOiKkcRemYfjRdZEVzbsWuiyFJ5FI6NW6AjyzXgJt2eb4GeE1+UiJrVL2z7eu4DDs7sg1Ngi9gNoJSS9hemE/m83Sw1jpkvi/EMMoMh+ke7zkF9izX2fQI6d+LmkkeeVqoLhHWNnjOc25hDqwv8o4exyetu+yJbczXZfIQrtV85z5w8MRaZiPUjIEdJrF3FRm3nGCozWAedLg0QHX6GUAKMwK0LF9PVPQtyG4zWD/RNpHERN6nAbeV4mQhCGdY5WOspvYmT/IT0CIhYYfiyK/G9rYqazH95Bh7eDFp7BR03MqbP9RkMUmx2gVXb40wn7yBOYah34mYdYmIHZNMRri9paZzAYXhKg+HZfJco2N06bQGZbXsogPT+//61jicndE67UVKerbDKgR6P4+Zu78yfh1BA/MdH9WOCSk1MEAOAopcC3tAlKBdXPG5y1JzfnsvrvnLJU3N35gSiHVhLl7ktpQc2aLknG6gz6bO7y4DQEAIfebijj5KlBumzj4o/EB2Hwzw==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e642e6bc-d7d6-4141-ba4d-08d848beba35
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 06:18:48.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGXe0R0nHwF8VsctEL3f6xUuRrRlJpy+zpYLi63hGD06JE+oVz9/ipC6Q4zWpGwBrlfdoVh8FCdmwF1IAuyYFvuCuK0w9gYhamiB6oZ+KJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2962
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24/08/2020 23.08, Richard Purdie wrote:
> On Mon, 2020-08-24 at 23:05 +0200, Rasmus Villemoes wrote:
>> On 22/08/2020 09.27, Richard Purdie via lists.openembedded.org wrote:
>>> On Fri, 2020-08-21 at 17:32 -0700, Tom King wrote:
>>>> What would be a use case for cleanstate?
>>>

>>> I understand why people want it although it should never really
>>> need to
>>> be used.
>>
>> Well, except when you discover that your sstate is effectively
>> corrupted/polluted by objects that happen to have the same hashes as
>> those computed from current recipes, but the build artifacts
>> would/should be different. Such as when using a file://foo/* glob
>> pattern in SRC_URI.
> 
> Where such issues are reported, we do try and fix them. I hadn't quite
> connected that the globbing issue was actually breaking sstate hashes,
> that is more worrying :(

It does, and you can reproduce yourself using upstream core recipes. Try
building connman-gnome. Then alter one of the png files under images/,
and build again. The recipe does not get rebuilt. Then cleansstate,
build, and yes, then the modified png does get picked up.

Of course, those pngs don't change often, if ever. But in our case the
recipe was for including some firmware blobs for some I/O modules. We
found out when the CI builds that used sstate cache failed to produce
BSPs containing the updated firmware, while the nightly builds that
build from scratch did.

>>
>> Richard, I'm still hoping you'd respond in the
>> https://lists.openembedded.org/g/openembedded-core/topic/75235594
>> thread. As I see it, half-way supporting glob patterns in file://
>> URIs is a giant footgun.
> 
> My leaning is to remove them. You can just do file://foo and I think
> that actually works?

In some of the cases where we had recipes using globs, yes, that was the
solution. In a few other cases we had more complicated patterns (e.g.
*.sh or something else that wasn't just including a whole dir).

Rasmus
