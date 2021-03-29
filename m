Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.15])
 by mx.groups.io with SMTP id smtpd.web11.23399.1617031411884946250
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:23:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hVukFs40;
 spf=pass (domain: outlook.com, ip: 40.92.73.15, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWch9iWNPRo1PP9dQ69HyAu+sN2nilWGdvWyoxVQ47+4+h+qP+julsbAWVIJuXEJDaUHOS2XMIh5c9ASP9ufWYr3ROlsV7evEwN9vjI3TLSSZqnNPBOtzKCmMz9hVxSNUB9I4/g+lJ/EZZLqjBs2cIQ67VNjpcj/RaYBmNGYnC8GjE67ylR9sa5LyfEaJ5mhGqDBUyAb60jQ+sTVZn6C5g8jXqMul1FVuv6Ja6ZmY37qPbQmtR8Ap5boDLnAcOzOxSU/j2KD8w8kLbM/tr98/Vc9BuWZ9IfzdFKgpkT+b4L1hSzHQjT7jxe0cHMZZov7t3Cg6ahfkVBoNl2KlNNVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1OXL3TLsT4ooTRBZtERPd1VccXVcfPKKzfBgehPSOY=;
 b=lKns3TrQ8ZMzEqfOo1XKyOtic4KLvYbmlncgrvYR+p4jw5OOF1jwrKUo0PByv6UH1Vjwf5PMpxfxJq3QRlDoqAEEhfZhuRqhngOqgzs0b/F1qINthjvxMkDK3Ubn5DVsVb/DghasduDKdglYc1j0MMIyNXOL6mshof2o6vVaDUwE4DVc/U6S2EmhPxuZKbple+Vq9i9SppOtQOXGQLZd3yle7aa5s3WL8c0SYkKdgBZu5Fy1HUmAr+gaRztvQxpWaF2HpcjhQ1rczU2coE03ynrKIbt6Ixrc0WUq4xoY9sw72aiGlWH63kJIw6AayPngUPwsi4GWyX5GTUiA4DNrTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1OXL3TLsT4ooTRBZtERPd1VccXVcfPKKzfBgehPSOY=;
 b=hVukFs40NW0BZMEgfVqDOwr473RxvROWmsVkIHrWUx3NIcrfI+JyMplPjCKjazZttnf1s9LmeSnstPb6e8cZmvJvu3edBg+a2rzSB9CajQc+G/ugTWc7LEWZKCftjX8mH7uX0t3jfIHqhCbcxEd7yTl0VGDQWd7PyMz4Ls+qJoRAwX7pKvQp+rASZBaedfChJvWlUAIJmFpRgqNN6YZWxUmZlLY8rgF+fJ8zmNw8qCU2e+nHLuVi+ct1foUB8nVGDGxYSIqa3Pqw1Jqk4MpvYsfT2dRQ+cpmRylMXiPGWrK2oqRmuUX/kjGj7ovzqw0AT48z66doF5nu8EzH8Xqbjw==
Received: from HE1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0d::49) by
 HE1EUR04HT142.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0d::368)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Mon, 29 Mar
 2021 15:23:28 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e0d::53) by HE1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0d::285) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Mon, 29 Mar 2021 15:23:28 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:D4C260F7091DA13A6575260230FC096A7FE506EF71A27AC36BD247F0DED4174B;UpperCasedChecksum:8627117152D4C24D431C55EAC047C7ABBFC95CEF7AE9E72E132B0F8F4F3981F2;SizeAsReceived:8742;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 15:23:28 +0000
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
To: openembedded-core@lists.openembedded.org, devendra.tewari@gmail.com
References: <20210329151442.86306-1-devendra.tewari@gmail.com>
 <CADkTA4NsocrBk0aRdqKqorWAuePMJd4O3g+K40j0J8zLrt7sLQ@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464265DE482819EB7D2B92C7A87E9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 29 Mar 2021 17:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADkTA4NsocrBk0aRdqKqorWAuePMJd4O3g+K40j0J8zLrt7sLQ@mail.gmail.com>
X-TMN: [s2onqULsky9E11LPrr4nPPfXp+2SWUNd]
X-ClientProxiedBy: AM5PR0201CA0022.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::32) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <3f0bccc6-a26e-4fef-bb6a-745d80a02902@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.85.71) by AM5PR0201CA0022.eurprd02.prod.outlook.com (2603:10a6:203:3d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 15:23:27 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b01fc02b-27fc-408d-2b13-08d8f2c69a6d
X-MS-TrafficTypeDiagnostic: HE1EUR04HT142:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ApGBP2oWF8zY2txyHTEFNx4V+6j9oDJjSc2ixgBSeb9G3LNDhSZgELiYKYHMQzKiebnGkljlO4U3HeehDWzULJ1j/ZW5P6ULPcjmugnpXmRbU8t0wohB/gX4pj8v+bHnVJXmFh4cehlxLTHjIdGuV78HDueFsgqNj5css2j3vN7KcowdfRNjWx8Dv+mv1Sf8oTwxgJfLizewsfI100KPhBEbwmshgCKQYq4VnF8CGBqHdZD3xJBScEXD8vUVbkhNdJc9fRNHZKiZY4FiAgX66c7dlV4IWJLtjqcqvIdAg4mUqigKuElCio5mMHi+5+Pj9Vy4d2LmEC7DAFbGaytlVHFDW8AmlpogoRE+YQosvJbuQDxZWX28wB0YwXzCFiKBxSEMrQPwr7vnjQL4Fy9y+KruI5UBA9HopqQaYm3FQuN+69fyw5wCP9Xz3+iQECgS
X-MS-Exchange-AntiSpam-MessageData: 
	usDIGCaKvTTU9qV+cjDo0xcXPP2vwYb98cXJMUo8D2jirdPjwYh8MHIUjTG0ZW5IdGi/p0BSLwxyw6A4rpLxaEZ5txyJGKVRYB2t9/0G4+87PUZASCMdRh0tTmjnpR007TkBulhBStgEmPDs8m6OUg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b01fc02b-27fc-408d-2b13-08d8f2c69a6d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 15:23:28.8246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR04FT026.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR04HT142
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Yes please quote a bit from the python manpage [1] - I certainly see the 
difference (and the edge cases where os.rename might fail), but that 
should be documented as part of the commit message

[1] https://docs.python.org/3/library/shutil.html#shutil.move

On 29.03.21 17:21, Bruce Ashfield wrote:
> Can you document the cases that os.rename() is failing ? And also why
> would we expect the shutil.move() to work in those cases ?
> 
> If a change like this cases issues in the future, we need that extra
> information in the commit head for proper triage.
> 
> Bruce
> 
> On Mon, Mar 29, 2021 at 11:16 AM Devendra Tewari
> <devendra.tewari@gmail.com> wrote:
>>
>> ---
>>   meta/classes/sstate.bbclass | 26 ++++++++++++++++++++++----
>>   1 file changed, 22 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
>> index f579168162..f94aa96d70 100644
>> --- a/meta/classes/sstate.bbclass
>> +++ b/meta/classes/sstate.bbclass
>> @@ -384,6 +384,7 @@ def sstate_installpkg(ss, d):
>>   def sstate_installpkgdir(ss, d):
>>       import oe.path
>>       import subprocess
>> +    import shutil
>>
>>       sstateinst = d.getVar("SSTATE_INSTDIR")
>>       d.setVar('SSTATE_FIXMEDIR', ss['fixmedir'])
>> @@ -401,7 +402,11 @@ def sstate_installpkgdir(ss, d):
>>
>>       for state in ss['dirs']:
>>           prepdir(state[1])
>> -        os.rename(sstateinst + state[0], state[1])
>> +        try:
>> +            os.rename(sstateinst + state[0], state[1])
>> +            break
>> +        except OSError:
>> +            shutil.move(sstateinst + state[0], state[1])
>>       sstate_install(ss, d)
>>
>>       for plain in ss['plaindirs']:
>> @@ -413,7 +418,11 @@ def sstate_installpkgdir(ss, d):
>>           dest = plain
>>           bb.utils.mkdirhier(src)
>>           prepdir(dest)
>> -        os.rename(src, dest)
>> +        try:
>> +            os.rename(src, dest)
>> +            break
>> +        except OSError:
>> +            shutil.move(src, dest)
>>
>>       return True
>>
>> @@ -638,6 +647,7 @@ python sstate_hardcode_path () {
>>
>>   def sstate_package(ss, d):
>>       import oe.path
>> +    import shutil
>>
>>       tmpdir = d.getVar('TMPDIR')
>>
>> @@ -664,7 +674,11 @@ def sstate_package(ss, d):
>>                       continue
>>                   bb.error("sstate found an absolute path symlink %s pointing at %s. Please replace this with a relative link." % (srcpath, link))
>>           bb.debug(2, "Preparing tree %s for packaging at %s" % (state[1], sstatebuild + state[0]))
>> -        os.rename(state[1], sstatebuild + state[0])
>> +        try:
>> +            os.rename(state[1], sstatebuild + state[0])
>> +            break
>> +        except OSError:
>> +            shutil.move(state[1], sstatebuild + state[0])
>>
>>       workdir = d.getVar('WORKDIR')
>>       sharedworkdir = os.path.join(d.getVar('TMPDIR'), "work-shared")
>> @@ -674,7 +688,11 @@ def sstate_package(ss, d):
>>               pdir = plain.replace(sharedworkdir, sstatebuild)
>>           bb.utils.mkdirhier(plain)
>>           bb.utils.mkdirhier(pdir)
>> -        os.rename(plain, pdir)
>> +        try:
>> +            os.rename(plain, pdir)
>> +            break
>> +        except OSError:
>> +            shutil.move(plain, pdir)
>>
>>       d.setVar('SSTATE_BUILDDIR', sstatebuild)
>>       d.setVar('SSTATE_INSTDIR', sstatebuild)
>> --
>> 2.29.2
>>
>>
>>
>>
> 
> 
> 
> 
> 
> 
