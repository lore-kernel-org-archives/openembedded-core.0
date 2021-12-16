Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F440C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 15:05:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.90])
 by mx.groups.io with SMTP id smtpd.web09.11622.1639667107273648304
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 07:05:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=saQoD8hE;
 spf=pass (domain: outlook.com, ip: 40.92.89.90,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhD/Q0xZxvKMRJK44+wUbxJN4MJWo2RNqgCQTD4kC5cLkYTOxlwnc2Vex15vQ9sNZuZE2d1qKMGsyu1wUK8mToik4dbvyKyw+Ut9867Re4PC7BBwsGifHb3bOSTyIbFN+R4q8h0eJ8Kcxf3CpWI10z9EKOqqNfva6Ebkg1TIlekWeGIIvgTSmkc/+FulkAgUmooylkEp+sVNvyAQlPJRX6K0c0Vd9G00/AdCtBJYCsBUrBwevZioC6lxAguv/SzFgdkg9ahLqpTGfroSkrJgihFAdDAIptznOxSH5EgRUH7C0fnsuDun8hBuYXYEq3LxUiZKYh5YWSBqbUr+CZi74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrWWhNALs/Fk4hbMF+ED10yBP/9lHdYvf4ZEeZLrcEY=;
 b=JdbgLog/LiWRUmrZQe1v6RJnB6+83A3ycJKgA/ThSnNDifjIMsAKIb0DxMVv7Vn8kvnAkFuJRwb4Yjs5qY83U7WUERlnz2voWp4WEVcWTrctfYQX5FuxKiMuLiBQKhokoAJVjz/4gvVUBlQsvfvH6ugyI7w8l0Xn/BPjIOpbWGm+W6KcsE3Eu+VNU07nOteycnPuvnCuT5AXNkwPZGh1zYKIqMZUfYYEYokM8kEiCoLzjCR1Roq4hlr3IcuxAgKCPyqtdNCdU6HPKIa8e4ieMh3w/ID0qlYK2YR2RconxwqRZb2hyKPjX+7tE3sv7IEU1si2e8eOI1a1XzII0zguXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrWWhNALs/Fk4hbMF+ED10yBP/9lHdYvf4ZEeZLrcEY=;
 b=saQoD8hETowv5MAPHCAnZDu1fMD5M3xla1XeWwyOWwkOJzdaFW6AiFSP39sBscDdE9QGHaIAJXNwzpeYL1SN/BApciwLDQ4u7ZJS8OzQ7UQ6YgOGj2x2qSOjyLEByV69/JOT/zvFb5jCL8i0Xuuz6V6KKASXCMyS3vkN1DkY9UkcN+yiRGDXQJxik/IS2JNZAb2sHoYNpbuKGZLDAHW6/2sIMfH35PAX7ySLozRPGFeWdFTXLPjK7ZOXJ5Wh3NNBlTW87G5sizLYApWLoCVnXib0PR0+1juPkWUYRniXVCtIzimMebsjZX6VcVd9rfaxVBvutQtPI9PWKbNeAZ6KZw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2705.eurprd09.prod.outlook.com (2603:10a6:208:127::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 15:05:03 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 15:05:03 +0000
Subject: Re: [OE-core] [meta-oe][RFC PATCH v2] insane: Inappropriate patch
 reasoning
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: 
 <AM9PR09MB464237D86A4AD9E16A0E68BCA8779@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <9f29a71c2f10fca2f0f88e5835b1c79f88432b0e.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464279B7A152B97BD6C67873A8779@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 16 Dec 2021 16:05:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <9f29a71c2f10fca2f0f88e5835b1c79f88432b0e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [QID86hSctt8KIn8eYzI4vnq6XiwLijPK76UD29zjP7CJJfTcSyhpDDVcRUVsW0zR]
X-ClientProxiedBy: AM4PR0902CA0002.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::12) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <b7c22cdc-1e0c-675e-f00a-c120c58498b0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0fd122a-a368-418b-3aa7-08d9c0a56ff3
X-MS-TrafficTypeDiagnostic: AM0PR09MB2705:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DCAaSulOcgcZxkSbLudWsD/Y9b9jXQ2ksHTHNit2vKby49t6HDkE/Zd9VLTkLMv0jFmAXpEuASBKcq/bUP+U21z1Od5Y7/gxQ2Flz9zsf0sdUSZmlKXSYMLerIuC4oV17CakMb7y4Nk7uvL3iPOcUGdDFvTYypzsO85uuELS73IPhqM7UPPO2d/rtCWKJs8XZCYH4EZKDIy/nPOSgxJGGD8Rwihr6yGCCiIN74stnfcPaiua/oIfUC7983Ex+iR6RhYFQDDlHbcBGjRYIwSbpVEvL5KR4bGuiBf6cDgaOUhd/N2kd4Oip1Jk0QvJY3xNRGawxSTkjQ8K4F0sMOMMYPaoo7I4gLvldJ/24yieHFZzKo3hCBkHyMuaCqrTfk0H7b3pu4tFam2oJuG1QJ7Loj5OZLPc7CXMRH6VlIZNITNGhuFeBb9mM8DZMkTgah24/14FeH3RMpPeIw0JoyPbYzVSMiYMhgczcugY17BEb9+gdoOh7MC695fa4qODCKQjnxhnEfKAAVGWWmpx5mZRIXa47qEjvUPXNkMyjpcBVs1xe9ZZ7FsNF/XUD5a9LtRjpfaR9IvV23PoXJv/n8Jr2g==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0E5bGh6RUZYaXh5TEZZQkNPOHYxck5XeE5CNkFlVjFwZDdScXQ3WkxNQkx4?=
 =?utf-8?B?bU4yTklQK2UwWU5xb1NVWEtGQjVrY29kZXF6eTdQek81ekhDeG1YbllYb2hB?=
 =?utf-8?B?WGx0OXZDVytwbDErY1hXd2syTTAxV1dPUktqTUgvMWlsMVNScmZzK1ZIcytF?=
 =?utf-8?B?ZEVmNUttcWo5WU1UQ29ybC90L0loeVVUaEZsSVhzQmJZUitBNmVGRHdwdGZP?=
 =?utf-8?B?R0hQNzNrc3dwYklWRHZwVDFVTDhuWDRrVFVFT0VyQ0dYN1kvTzBKOHZzRWpX?=
 =?utf-8?B?WFNkM2c3ejlrbWVTbHpySEdyNEFtZkF6dEVNdUdWZ3RNUUE5YzZ1R2h1R2hT?=
 =?utf-8?B?Z29laGRjZXYyVVAxUFdjUFRhRTRJVlJmSFRYWjhIY2MwaVVTaWE4TkpnTHcr?=
 =?utf-8?B?eDduUG10RlV4Z3M5b0ZPTy9Ga3ZoV2NYcWFyakN0eXNiRTVrZXI2ZDM4V2Fq?=
 =?utf-8?B?bmxJWkJKbG9XQTRRZTA2MGY4UlZZalVPQUQwZW1tTEZFZlNXblJBalhmUGM3?=
 =?utf-8?B?YUZVUXovMFU1aE1oTk5jbHl2VzhqNThoeTVxWUJ2K2FRNHZ5VG5sRUM4WVhh?=
 =?utf-8?B?TnNNdXllNk45SjBJWE1pU2JYbWY4M1JiOVNUUGNGMGRpQWdqVW0yZHZQKzlP?=
 =?utf-8?B?VFlzeEtOM2VteitDZFNpRENQWHJmcWR6Qk83ZmZsMlpkUTVYRGVrU3VXYkw2?=
 =?utf-8?B?YnJjbE9ydUQrYWZGdm11eGc5NldyMG5INDNNWWErS1FVcTB4eS83YitKeGFk?=
 =?utf-8?B?VXdKcjVTSWkrY3FGSy9LNUJaMmZLMUxkNFdyOWJhS3pkY0pkbUlyWTZwUUNM?=
 =?utf-8?B?dmR6bzVmZ01VWElRNGlzSEc3aU5qYktLSUZDQjJ1d29HZjh1d29WSlloellr?=
 =?utf-8?B?dGlPM3R3ZUVXR0s0OHc0OHB2RDdHbkhHa00zcC9wY1NXWXRYOEJLVWZZVFow?=
 =?utf-8?B?NnpSMGRYdk1IL20zODZVQ0NzVi8vb01ZMGdza1dtTTUwbmx5UHk3WjhlMnVN?=
 =?utf-8?B?K2NmRDI4aTMxb09vZkdIcnFaQ3dpVzgwb1VhaWNVTmxBT05RTEF4STlEZWhE?=
 =?utf-8?B?bDNsVzVaQUxTeEFKRXkveXJIS2dPNDFoSUwvVEFxNlVvRlkwNVVwdk9aUHpE?=
 =?utf-8?B?aEZBVlhXZzkyYmtJVWJhZjZYc2I0cnYxOEJlZEpNbFpHYUZkaVNsVURsVXc1?=
 =?utf-8?B?T3pPK3grN01jczYvazdENGdhZS9HbUd1RDh1U2xtZWlKbkMveDhOWlQyelZL?=
 =?utf-8?B?MUdYaEhvQjRoK3cxUmtCM29vd1paY2p0emxqTDVHK1I3eCtCU3RLeGZzdFhL?=
 =?utf-8?B?Z0NvS2d6bXJOM0tqWUYvRWg2YURRRVk3QStEcG1pUVhZdWdzRGgwazFLNXNh?=
 =?utf-8?B?Nzdlb0hRclJKZEE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b0fd122a-a368-418b-3aa7-08d9c0a56ff3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 15:05:03.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 15:05:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159794



On 16.12.21 15:54, Richard Purdie wrote:
> On Thu, 2021-12-16 at 13:26 +0100, Konrad Weihmann wrote:
>> if a patch uses Upstream-Status: Inappropriate it should provide a machine
>> readable reasoning in square brackets.
>>
>> According to latest wiki entry that would be
>>
>> not author
>> native
>> licensing
>> configuration
>> enable feature
>> disable feature
>> bugfix .*
>> embedded specific
>> no upstream
>> other
>>
>> a detailed reasoning could be provided as part of the commit message,
>> but format of the metadata line is fixed.
>>
>> This patch adds a check to insane.bbclass and warns if there is a
>> non-compliant reasoning given, or none at all.
>>
>> In a follow-up this should be turned into an error, as it was done
>> with missing Upstream-Status
>>
>> Can be skipped with newly added patch-metadata key via INSANE_SKIP
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>> v2: add possibility to skip with patch-metadata in INSANE_SKIP
>>
>>   meta/classes/insane.bbclass | 25 +++++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index 240f3aad62..eae8e0e549 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -1124,6 +1124,8 @@ python do_qa_staging() {
>>   python do_qa_patch() {
>>       import subprocess
>>   
>> +    skip = (d.getVar('INSANE_SKIP') or "").split()
>> +
>>       ###########################################################################
>>       # Check patch.log for fuzz warnings
>>       #
>> @@ -1191,6 +1193,29 @@ python do_qa_patch() {
>>                  bb.error("Malformed Upstream-Status in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_kinda.group(0)))
>>              else:
>>                  bb.error("Missing Upstream-Status in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
>> +
>> +       if 'patch-metadata' in skip:
>> +           continue
>> +
>> +       inappr_message_re = r'Inappropriate(\s+\[(?P<reason>.*)\])*'
>> +       inappr_reasons = [
>> +            'not author',
>> +            'native',
>> +            'licensing',
>> +            'configuration',
>> +            'enable feature',
>> +            'disable feature',
>> +            'bugfix .*',
>> +            'embedded specific',
>> +            'no upstream',
>> +            'other',
>> +       ]
>> +       for match_inappr in re.finditer(inappr_message_re, content, re.IGNORECASE | re.MULTILINE):
>> +
>> +           if 'reason' not in match_inappr.groupdict():
>> +               bb.warning("Missing Upstream-Status: Inappropriate reasoning in patch\n%s\nPlease add according to %s ." % (fullpath, guidelines))
>> +           elif not any(re.match(x, match_inappr.groupdict().get('reason', '') or '') for x in inappr_reasons):
>> +               bb.warning("Malformed Upstream-Status: Inappropriate in patch\n%s\nPlease correct according to %s :\n%s" % (fullpath, guidelines, match_inappr.group(0)))
>>   }
>>   
>>   python do_qa_configure() {
> 
> I appreciate the intent here but I think there are details we need to look at
> first.
> 
> Whilst this list of inappropriate reasons looks like a good start, I'm not sure
> it is exactly the list of things we want to encourage people to mark patches
> with. The wiki was written a long time ago and I think we want to make sure it
> is right before we go through the work of classifying a large number of patches.
> I'm very much in favour of an approach which looks at actions we could take
> based upon a given classification.
> 
> I'm also worried we actually lose information with any "forced" transition like
> this. There may be links to discussion in the current [] field and I'd much
> rather keep those links that force people into changing them and them being
> lost. Common sense says people would move them to the patch description but that
> isn't any guarantee that it would happen.
> 
> Also, this isn't really how we go about making transitions like this. Usually
> we'd make some decision about a direction and then we'd migrate to it over time.
> This patch will start generating hundreds of warnings on the autobuilder to the
> point that all warnings would become meaningless. Currently it operates mostly
> warning free and where we do hit them, usually intermittently, we get them
> fixed. Once things start to fail, they "rot" quickly as one warning turns into
> many more unnoticed.
> 
> In some ways I'd prefer we add a new field, something other than Inappropriate
> and then over time we could classify patches. We'd use the approach we're using
> with Pending where we gradually encourage movement over time.
> 
> Cheers,
> 
> Richard
> 
> 

Fine - I'm also in favor of a transition phase - I just wanted to 
highlight that Inappropriate lost almost all of its meaning as the grep 
output from an earlier mail showed.
One thing I could think about is to at least flag the patch that doesn't 
even provide a reasoning.

At this point we could do the very same for core as for the 
Upstream-Status and do a hard error when not even a one is given.

Then in a second round fix all the misspellings - and maybe rethink the 
way the classification is done -- any I'm fully with you -- find a way 
to enforce a textual justification besides the classification part.

BTW one thing that for instance bothers me is the wide use of 
"oe-specific" even though it was never documented.


Concluding from all that I'm rather not keen on inventing more and more 
metadata IDs - but would like to see movement into a direction of having 
better patch checks with better classification.

> 
> 

