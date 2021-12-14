Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807F3C433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 18:48:56 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.92.71.12])
 by mx.groups.io with SMTP id smtpd.web09.29936.1639507734402204177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 10:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=oMTwJHGg;
 spf=pass (domain: outlook.com, ip: 40.92.71.12,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SS5TUHKTdFsqi9XtEIvb4E38C9E64EWWSx84JW4V5TOwD4cB7b2ikHsZyHCHzAc5y+3VGBT2cvPEZnpTDCvKBl0cQS7WFDDpCQyjIgVvKSFc0Mgor8yS+dOH5Y3ESTcLxWURO+iYnl+3whdW597+52bycI/4Q7aOvEtWcJ1CYwzmTlKznjE1SK7yXhdvKtMDaTSwlzoya5MMT8Yrp6zjbkgKokQ6eSIUyASobqlEBNKO+BcnwxzlDOor3zXKBii4PtTWyA/NlHLlNy6+0ectdHZWS6MrFzIfIOnnEWEob0htaB2RSuSiRg8U2ax5+g0XqW74MF6NMBOVvEOFuCJCNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLZOKGLwWqF/f2DVs1b7OtY7MfCcrQdNSKTYgNYmxCE=;
 b=OFYPWzX4T2PUdd1vfTD3eCbwettb/8oc3g/Eb5Eva5QQsOxAB4jS0UjTlncJNV5as0SPxGLrhq8qDaywEUQ4ou960DLJ5XqDr9DTvgHPkBcgWnk8TYKtYEH6lGoUtzNxfJSR2F4jA2AnZWJ/ZxXxMm7UDC+XSQOBUp1M7PNxftv6UsT1pVlA8OILUJCUmV5SL4mprIf194hcu59DlTbGPBnTkrXZtWMmZXrgqsEYVcydx3tgbc8ECEJ1CA3tyX4PMyB5wtVBOfhJ0FJoYpQyvm/Elx5b2su2MC63xdYpls9feGm+AwAAoULef73h7cpuLAbFzvXhHfi+rh5G6oHo/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLZOKGLwWqF/f2DVs1b7OtY7MfCcrQdNSKTYgNYmxCE=;
 b=oMTwJHGg8Zi1Mg20MxEsNRDCfRoFT583IzbTeiL95pm9003CeXB8OQJsoueRvSiWw7ydFJbzNXI4E1UoOfp4cSM33tK6MWNj/eO4KqCEZCUabjBQz9y40Y3he8PzzIDK3XC9sUp+lJHNA0JAJRB2T8+whKc7sRgcYxPP3ztgqDth2aF2002Z4Bod7JLZMPga+akvPxrKtyqfcu4weiUTDA7opE9coFyYh6ygpTholRKC0u09O46+iACD1VvQu+K+EnWVQcTYOPRmQ0FdOwBj/6zHZ0XQcF2Qpezwna8FefcVq7/yasqTpBUZZvtMPWtz3CIs3Ld7ipLVRYmGQHWIbA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM4PR0902MB1825.eurprd09.prod.outlook.com (2603:10a6:200:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Tue, 14 Dec
 2021 18:48:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.014; Tue, 14 Dec 2021
 18:48:52 +0000
Subject: Re: [OE-core] [meta-oe][RFC PATCH] insane: Inappropriate patch
 reasoning
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <16C0B098D197A5E1.12686@lists.openembedded.org>
 <AM9PR09MB464259F10AA7B2E44E403188A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CADkTA4M=vQvNfTirHjAmU3tm7CdhkBrdErEgUqCqSyD749Us+w@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464226B4422C79E0C7F6E508A8759@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Tue, 14 Dec 2021 19:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CADkTA4M=vQvNfTirHjAmU3tm7CdhkBrdErEgUqCqSyD749Us+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [qwUqIk+S/D8qOLLbpsRLtrMyQqwXz0yW5zwNkUKV9J7KscuTNLq0U8TpQjXlSy1q]
X-ClientProxiedBy: PR2PR09CA0017.eurprd09.prod.outlook.com
 (2603:10a6:101:16::29) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <f7a1573f-9be6-dc27-1d56-2f416ea75cd8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93b36727-287c-496e-9846-08d9bf325f7f
X-MS-TrafficTypeDiagnostic: AM4PR0902MB1825:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H8Fkdpwqst/3P8453zSBvFwXpThIs3XeqAbNs5/evpdFyc7Hc+iN7v67svjnpyjzX8oIGfeamIl9/T/Jn3hVlTDsP6PyTP1UMCS/JXk4PKggehWe2ohSOI5+hbOSSIjrqYOsZ/GVJEMwypIJD86orI3eQPSX9Hl22warlHtcmEL4QQiQA3/+fQ5WWzog2CSg3Ch5dwX5uDoMUSiL/H879jnn7vtXRYNdsWe+pZwDuCLxCxSFtn/IzaRjwEWkq0hQsRi3A+jafLov2wG7VpQhkwfSVUZ3PxnhrI+KKLa+1zOz6x4gGGjYnthygZFdN/K1gJ1UNvpbIaRx4OvAiz1cCZz+2sVhFTWsfAnL4s5y1kAd9Ks2YcqaFe2Y+csgN4s7uC8KV5q+o99RYe7WtzzcRYtAagMjUm7k5WtRQGB8lGInKZTJiIrblo4EojiWMmcb50MbVcmPMCym6B6Sfxkh7NcIVu1kS3l4K3A2tiKjKGFEQmWhgfakRdUnQ5OkFBaKeyFRWXwv0kSFNe0whbLw/kwW8nmXuOAKpWC5Xl0GRz0Wc6dLwJ4YXvJ10BvOzYTs6KoJ7a0OADOLWh2dmuFE1Z/OnwW2mld2I5yG9lYL/rfOKBlPORp8Lxom2Mn5XeQgeuYW13qzrOrSX/fONyPQYhxvs2gXC4veFhq8aG+Qsbs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OE9MWWl2OURweXdvR2J3TllEbm1Za2l2YUtYUXJZYUNVVGZ4cVZoSllIU2hU?=
 =?utf-8?B?RjJkcWlEOXlLL0hwREt1MUkvYUcvWVdZaVM5bGtSVUEyekQwZXVuTTlrL0Zx?=
 =?utf-8?B?bGYydk5VTG1jRVh6dTF5b3NRb3dYVk1uY1FjNTdtWERoVFA3OHMvbFNyblEz?=
 =?utf-8?B?czJjRkY4V295dUFKSGJsd1JXWVdNSVR4V2pCVVlVb3VRVGpTdmtaSWoycERm?=
 =?utf-8?B?Zzd5R0d1UUFFOGhMQjF5SVdlZWpKQ2JFb3NhcHlYaUtReWFLUzNFaE1QOHFh?=
 =?utf-8?B?bExzU3JyT2w5c1J6MVBPc2w4RzlRVWREZ1N6YjRtWDBRYmt6UWhhem5KYktB?=
 =?utf-8?B?UFUvbkl1ZCtTVFF2K1JnaS81ayt0Rk41bWt2eldobmxjMXlRVjgzTm82QUxJ?=
 =?utf-8?B?MEVYMy8zWjFGUlFtUTM3cHZBd2k2ZVg0M25nL0dsUEpYVzVlSjhoN1MrdFBJ?=
 =?utf-8?B?K00rQVEwdFo1NWpmMDZiNWRrNTBzdTFuWWo4WEt6ZjJzd0NnWFpVZlREK0JJ?=
 =?utf-8?B?c2xzcXFtRFZtbGdrRUxEMnpOWFd6WC9UVW83OVpQMElpdjRUQ0NpUG9rU2Fn?=
 =?utf-8?B?L2xTTDNkTzlZWnpiSDRZdUtYeVRuWU9IaW5VQm83b0cwNHFvVVVZbUV0NlNr?=
 =?utf-8?B?eU04QjkyR1VqSTlreHR0dFVVSVZEOEEvSWRTSCtZSHZueU9HOHVvYktNMnF2?=
 =?utf-8?B?bzdrQVVJVHc5SnQ4Sms2eGgyYUxlM29JUTBPbGxBTis2YUFJRkUwOHNzQzg3?=
 =?utf-8?B?R01JQlkvMG9kRnhkcGxaYXJxUVN1WWg2N3ZrbUtwZ1poOGRMTms3a25NSDFx?=
 =?utf-8?B?WUZsam94U1NBcTAyTlQrejRPLy9OTUdtL0lQazQ5Z29HR2JWQzNwZUVobUVs?=
 =?utf-8?B?bm11V0drenpHakVzMzU5V2VxNk0xQzB3bnZmODh0aFhPeUxqY2JzM1llcFJM?=
 =?utf-8?B?Uk1MK0JEWUg1SWw0MHQ2d3VCdGtQMFlTZ0ZXTENxOVBMR0h3b3FOZmRBRVF2?=
 =?utf-8?B?bXZBdGk0OGhySFJuek5pMHZNcEdIelkwNGtRb1MzU3EvRmlNdmFSUFQ0Ty9U?=
 =?utf-8?B?aWgzcDY0eGNaZEl6V0FIbUJUWHVUZGpzYndocVdIOElIb2F0RkhuWEF5V3FH?=
 =?utf-8?B?TUZOUXpnYUI1eUhJN1N5SEpiTmFhbFFBVUlBekxCazI5ZCtWMkUxSys2cUNQ?=
 =?utf-8?B?MDRpL1ptalMxd1U0Skk1d1J4aTJlTVJrOWJMd2xMNHhtUU0zbzZlenIxT1J3?=
 =?utf-8?B?MEdrZ1BLeUJocEEzamdpMHZ5QTRrVE1PcDhkODVOYmpobThPTTlSQ3R6dzQx?=
 =?utf-8?B?VjE1U1BrdDlJdkVMUFpmbFVWT09HekEzak0raGF6bnNEN0lOZWVKUHN0czVG?=
 =?utf-8?B?OCs2T0wxb005alE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 93b36727-287c-496e-9846-08d9bf325f7f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 18:48:52.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0902MB1825
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 18:48:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159705



On 14.12.21 19:38, Bruce Ashfield wrote:
> On Tue, Dec 14, 2021 at 1:05 PM Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
[snip]

>>
>> meta/recipes-support/vte/vte/0001-Makefile.docs-correctly-substitute-gtkdoc-qemu-wrapp.patch:
>>     6: Upstream-Status: Inappropriate [oe-core specific]
>>
>> or are simply ignoring it at all.
>>
>> In total that are 352 patches I could indentify in latest master.
>>
>> I don't want to open up another can of worms, but either we drop the
>> reasoning from Inappropriate in the patch guideline completely or we
>> need to fix that in core (I guess in other layers it is even worse :) )
>>
>> Any thoughts?
> 
> If we can opt out of the check either in a layer config or a recipe,
> then the noise can at least be minimized. Since the ecosystem !=
> oe-core, this level of checking needs to be something that can be
> opted-out / disabled.
> 
> Whatever way this goes, I'd suggest that it not merge until the start
> of the new year .. luckily RP is in full control of when it merges.
> 
> Because I for one, won't be spending the Chrismtas holidays queuing
> other people's patches, or fixing status lines in the patches in my
> layers :)
> 
> Cheers,
> 
> Bruce

Actually a very good idea, but I'm not sure how fine grained we want 
these package-qa ids to be... @RP any thoughts?

Basically we can solve the issue either
- by keeping the status quo (dropping the reason from the docu)
- or having is according to docu
	- having it as a warning in the first place
	- turning it into an error once we are clean in core and all layers 
hosted on yocto project's infra

But yeah sure that patch doesn't need to go in this year, as I don't 
want to ruins everyone's holidays :-)

>>
>> On 14.12.21 18:53, Konrad Weihmann wrote:
>>> if a patch uses Upstream-Status: Inappropriate it should provide a machine
>>> readable reasoning in square brackets.
>>>
>>> According to latest wiki entry that would be
>>>
>>> not author
>>> native
>>> licensing
>>> configuration
>>> enable feature
>>> disable feature
>>> bugfix .*
>>> embedded specific
>>> no upstream
>>> other
>>>
>>> a detailed reasoning could be provided as part of the commit message,
>>> but format of the metadata line is fixed.
>>>
>>> This patch adds a check to insane.bbclass and warns if there is a
>>> non-compliant reasoning given, or none at all.
>>>
>>> In a follow-up this should be turned into an error, as it was done
>>> with missing Upstream-Status
>>>
>>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>>> ---
>>>    meta/classes/insane.bbclass | 20 ++++++++++++++++++++
>>>    1 file changed, 20 insertions(+)
>>>
>>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>>> index 240f3aad62..da26f4662c 100644
>>> --- a/meta/classes/insane.bbclass
>>> +++ b/meta/classes/insane.bbclass
>>> @@ -1191,6 +1191,26 @@ python do_qa_patch() {
>>>                   bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
>>>               else:
>>>                   bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
>>> +
>>> +       inappr_message_re = r'Inappropriate(\s+\[(?P<reason>.*)\])*'
>>> +       inappr_reasons = [
>>> +            'not author',
>>> +            'native',
>>> +            'licensing',
>>> +            'configuration',
>>> +            'enable feature',
>>> +            'disable feature',
>>> +            'bugfix .*',
>>> +            'embedded specific',
>>> +            'no upstream',
>>> +            'other',
>>> +       ]
>>> +       for match_inappr in re.finditer(inappr_message_re, content, re.IGNORECASE | re.MULTILINE):
>>> +
>>> +           if 'reason' not in match_inappr.groupdict():
>>> +               bb.warning("Missing Upstream-Status: Inappropriate reasoning in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
>>> +           elif not any(re.match(x, match_inappr.groupdict().get('reason', '') or '') for x in inappr_reasons):
>>> +               bb.warning("Malformed Upstream-Status: Inappropriate in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_inappr.group(0)))
>>>    }
>>>
>>>    python do_qa_configure() {
>>>
>>>
>>>
>>>
>>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159703): https://lists.openembedded.org/g/openembedded-core/message/159703
>> Mute This Topic: https://lists.openembedded.org/mt/87726727/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

