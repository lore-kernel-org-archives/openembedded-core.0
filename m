Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427D9C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 17:30:45 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.96])
 by mx.groups.io with SMTP id smtpd.web11.53.1638379843902575571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 09:30:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=iYhOTP5H;
 spf=pass (domain: outlook.com, ip: 40.92.75.96,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VF8geyjLKj9Zx1Z7FrK2Y2VDmzZLvtlL0TmgabNdxXVVHVQD0D5k+vWbVLbp+9KhqGiZMGCzrKIS47hE8dEgQ3nSLKo/aZHZ2HPYL5Yvf7Dw8EZujWAL8i2JngTwy6wjMwCjUVRHMPS9KabcDDDQbQyTAvSpdR+QNaARRuLdXJS8cE0IlO3Rd6/BFJkLUoQRY6r0kxhEU9oS/FqFz8UfkJ/errUd8qS5HISCwlSHTr4eetpZPXRTbKO55rxxl3Z/FyHAS6NOb8qUpYKM6PhmootKb146vka4QO2Fn/j9jZM7e16cs68CaJknhV4rmB4wiERcfBdnmzGjrCl9aldK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44P9GAyj798Jbjky/TqnCSFTNiAnQNqwKtWzeftHTGk=;
 b=D7SXNGDFN4F5tpb6bPY8mRP5tkjietXlrS2APl5DniVr+2EZshX4aOObDFMSug70jRGEbbhaHDYzhBICGbhLoelPoK6rOL5jRlU745oqCDh8tES6wE4s+can8JETr40ko4fiFMZvzRXtQATCXNeiLSqc3nPtVz4uQRdL42sVftE03B0fVMYS9TWVqof9s3Os4TabAiPBevHy+0YvIL5N2K3LbpFVl+HHiPgKDXFfDagikYnuG0MwliMfSGnTX2errmq4gRzpBoDnKrv9+362KJf4lZFoz10aptwKttGCWly6khOVcI/njBvGTz3EpvpFl9DoG012lP8DQukzpNwiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44P9GAyj798Jbjky/TqnCSFTNiAnQNqwKtWzeftHTGk=;
 b=iYhOTP5H91n6e2JObTKYHJbHptcagZl1MVPLl7OZsb+s9R2UoChLasi6l9I02L3hRP5ZzwBKZ8AhLTrkH4hdzN0jdrR2ouDjy0u9wpQaL/NUwLE+1smtKUUOnvWBnUXKxCOYCejnfVVMFZaK4mCdC9Rf9YdukmJPXjLE/o1GOIaYIEHS2bGnW2NEt4RP4EqPyeOmDSKKlIctLqFeMTo9ZsqeD8yP/c61r9mX5HoAdDORYmT2WOWUi/g1XGL2FcTUN92rByMqLXkdarixuH1lDLkcJzriEImxPXTi6TXGhxDTwFreb2+v11SUSzS2U3950XdVovaGPcOcVJh7KJjr0Q==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AM7PR09MB4135.eurprd09.prod.outlook.com (2603:10a6:20b:118::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 17:30:41 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::f0c0:455d:26a8:99ac]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::f0c0:455d:26a8:99ac%9]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 17:30:41 +0000
Subject: Re: [OE-core] [PATCH] python: python3-idna: fix non-existent Unicode
 license
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
 Quentin Schulz <foss+yocto@0leil.net>
References: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
 <AS8PR09MB464559F9D616EB6583EDD813A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <20211201172008.i6hwxhvnwtul4mai@fedora>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AS8PR09MB464591DF8F8352BBAF6462B0A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
Date: Wed, 1 Dec 2021 18:30:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211201172008.i6hwxhvnwtul4mai@fedora>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [sXm/kSpTWtcapJ3vYc1Y6C4F/utXuV8Sc1o72dgxjXQchBipk0H8T2eCHxvXdJgX]
X-ClientProxiedBy: AM8P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::13) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <138c4106-7a42-c352-ff79-5fcadb3352ec@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM8P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::13) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 17:30:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ab409c0-af15-459f-7381-08d9b4f04be3
X-MS-TrafficTypeDiagnostic: AM7PR09MB4135:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Iwf97lLBGlBb+yNBxfVFiADeLdbJ8TGmTnLAbnQH5XXgBguyM+0O5j8ehxPBPt2NmDh95/MhQJJvZqNBSJR3bF8lXHVg3yabmciQTYBMGPjT7Xcky50ymA8AnQmmBJJGI2VpT6GPeySiOg1F9EisTMk/77Sr457khZNJGRzNaL0CF7lWdbpHPfYHVQZ+RoDNVyUmmbbns7DKXjWkBg+Gwj0q97mzGvtiXZgO2E9yYtI7RUAp2e/I0C759k+qJlx4mc+0FJwhnFWP1vZZfPFcgTRbqG1OBm2jO/LlO4R3lwqlU7LP00ru1E/PXAZY6UGh+92hDNONT1iTS/dAznKKpJj6S2/ioJDMkDrV0ad+09EGSaLgGl9Vr/zrcgq6atmwOsr5eY7ZV/Wc28lXtMWGEi9uGEaC/U/bILQ09IHCLsWzJQm5qome0uL+qXHyuPcJP+CPiXfdmwYAKEFOaqZXLQ8XkIX38ctnUhpCbhbxVikrh8u3V9GvESsomLzeMDy6eqfQyQ6gvmarUel6ns81r6iIcK+A26F864TseZ5NAUlSSMzn8P6kmlhBsC6GP0bZhKM66LEgqVVvs538ho6FInzcEp2uISE8/pUO3XIGm2C9WjHGKPk18LbrwdInf8VFaj/NqlGmVQQtKaF7ik6cKHU3ZJXonIVBi51frRHwmWI=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U8Sltd30Ek8tmt8jf/Nbl3hg1WCh78EoKCdciYQOmsvqzGqP+/EB7RhjZvVTJoRVFspq8eQkdEBDc8Hx5Q7D0IlACoFgrUUPNVN1sDq7DCc3nvyGD5jGvFmqAGzI9EZcTd8uMpb/C+IBAIGwLQwOiktBUbJJKBTtQ0Hr7WFsKX5fj7iHw61EJVCnUtXVQorTBu1+If6TWsDBOt+gJ7vHXpHMkwe1FRl4TEViSfPfbkHMkYxaAmlJF8sGMqf2yD+AxQGNOLbPOU+x7HjhX8CrYS3+yVVnh0yYl55EYp0beUtFtIPGpAaG4pLpHxlKQIOIojl6NQpp2JlGnMBZyBsajOXWjpwdNOYlWfJN4Y89OwB+QO9EiMwturvxryEJFvsDVSeJRTJbek3cLHycKtlpHdiHCV5CwiPZkTeT5RBBz3GAhaxo4hn0+oGir6Yr7kO4dtRmK7rZVnQLz5336Z/xtgz5mCadLaCvOZZbDJSNpIdio5IbLnNfIVk4wYC642m3yjgfcr39UG4Vg65X7/VkLb1/aR+HqJsD1eStW6ANHBjSAiN+qPs+W566SOywayHMLg0S+aI1CtjLQDxCBBmr9PfFO5Vkto0Dmd3ycfDTmLnFVZxVDNpzXapETKwZ1tvt6QawlDLlpT/8KYatxHadD0YJRbQLYozsxWxzVTDUfLwv640eD0DHzgogTs5dDn60SSsFRZEohB+54wUYnzqtaLPK1CX3yzvTo9TYxFukieEljy/nzEQS9umyFpeWuYHPieUXfz94l0DD5sg+YAAwQg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ab409c0-af15-459f-7381-08d9b4f04be3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 17:30:41.0244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB4135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 17:30:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159054



On 01.12.21 18:20, Quentin Schulz wrote:
> Hi Konrad,
> 
> On Wed, Dec 01, 2021 at 06:04:36PM +0100, Konrad Weihmann wrote:
>> I'm kind of following the argumentation in the commit message, still I see
>> differences between the Unicode-DFS-2016 template file and the text
>> downloadable from https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=
>> .
>>
>> Not much, but enough to make me think, if we wouldn't instead need a
>> Unicode-DFS-2021 file and reference to that.
>>
> 
> We'd need to upload the new license to spdx and I've absolutely no clue
> if the differences are enough to warrant a new SPDX entry... especially
> since AFAICT, it's just that some of the content is moved to
> copyright.txt (which is linked in the new license.txt) resulting to me
> to basically a noop? But me stating it was a match was incorrect, thanks
> for pointing this out.

Yeah, I'm also not a 100% sure if that's worth all the hustle - maybe 
someone with a more legal like background could just add her/his two 
cents, so things could be cleaned up in a followup

> 
>> Anyway I fully support that change
>>
>> On a different note - I think any unicode license reference would also need
>> a copy of https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e=
>> , as all the downloads point to that (and the license in just a subset of a
>> broader scope of rights and regulations) - INAL, but from my limited legal
>> understanding we should reference both
>>
> 
> AFAICT, this looks like it would be Unicode-TOU but it's again not a
> perfect match.
> 
> So /me shrugs, don't know what we should be doing with that except
> fixing the warning one way or the other (preferrably the best one :) ).

same here - *calling for lawyers to jump into the discussion* :)

Still I think the patch should be picked as it is, as it clearly solves 
an issue, that I've seen as well.

> 
> Cheers,
> Quentin
> 
>> On 01.12.21 17:13, Quentin Schulz wrote:
>>> In addition to not being an SPDX license, Unicode license also isn't
>>> available in any of the LICENSE_PATH available in openembedded, meaning
>>> the following warning is printed:
>>>
>>> python3-idna: No generic license file exists for: Unicode in any provider [license-exists]
>>>
>>> Unfortunately the license is not really explicit in the project. After
>>> looking at the code, it seems that this license gets pulled by
>>> idna/idnadata.py and idna/uts46data.py which are auto-generated by
>>> tools/idna-data which downloads data from
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_-257Bversion-257D_ucd_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=NVUVu2hKfeamx4mn_29KhgBwY_drrHGSIiEbbTpoUsk&e=  and
>>> https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_idna_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=XmJGToF17xNKllS2M3Zw4q82BF0PBORm7gMWm2E6sgA&e=  which are covered by
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=  as mentioned in
>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e= .
>>>
>>> Comparing https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=  to Unicode-DFS-2016
>>> resulted in a match so let's point to that SPDX license instead.
>>>
>>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>> ---
>>>    meta/recipes-devtools/python/python3-idna_3.3.bb | 7 ++++++-
>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
>>> index a0e6b79a56..f3c53a8717 100644
>>> --- a/meta/recipes-devtools/python/python3-idna_3.3.bb
>>> +++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
>>> @@ -1,6 +1,11 @@
>>>    SUMMARY = "Internationalised Domain Names in Applications"
>>>    HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_kjd_idna&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=Nh_apZKGYGza7AOqJ_dDAmZxqmdkIrXfuP_F90MfKI8&e= "
>>> -LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
>>> +# Note: Unicode license is pulled in by idna/idnadata.py and idna/uts46data.py
>>> +# files auto-generated by tools/idna-data which downloads data from
>>> +# https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_-257Bversion-257D_ucd_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=NVUVu2hKfeamx4mn_29KhgBwY_drrHGSIiEbbTpoUsk&e=
>>> and https://urldefense.proofpoint.com/v2/url?u=http-3A__www.unicode.org_Public_idna_&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=XmJGToF17xNKllS2M3Zw4q82BF0PBORm7gMWm2E6sgA&e=
>>> +# which are covered by https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_license.txt&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=TL5gUxzxy8LLKVu26a2BDDq1J8fal1pDvVz0ry1MulM&e=
>>> as mentioned by
>>> +# https://urldefense.proofpoint.com/v2/url?u=https-3A__www.unicode.org_copyright.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=-XEY2f17PVO0eg4ZpVBl4VpV5wPmG0K8z8LDsTQAPRs7x2MriQXaHDjlbwAVuKMk&s=GCcxTAmd-wOZF6SPpTOHW392veMDM8RBwO_IAMvDbZA&e=
>>> +LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-DFS-2016"
>>>    LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
>>>    SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
>>>
>>>
>>>
>>>
>>>
> 
>>
>>
>>
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159052): https://lists.openembedded.org/g/openembedded-core/message/159052
> Mute This Topic: https://lists.openembedded.org/mt/87431709/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

