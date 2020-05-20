Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.51])
 by mx.groups.io with SMTP id smtpd.web12.858.1590005856225829762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 13:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hUcQ2umu;
 spf=pass (domain: outlook.com, ip: 40.92.64.51, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD+QIIkikME6n7SEks6Ifo0ykScgsi+KPEFNVeWWeTQt12r/GAhuiA9o+yjq/iCqCjEVuCK+tT5Nr73FZ++q+qXM5UZC0xOfyRI9ownJm5yUk5ENTFxpX1izfG991+IUCycrcqjowIcCkquYTY6HSyWD3XnBHIKNwrbodS/taaQG/2OHAV2XyIKO7r4Y5gmmKw6jYm1sgQRmzyr9bfYQqch1HD8Vu7uGyqQKGeLsyKKkvPixxiV0nBHwZNiu5XQRVGbVqUr+XWhloYyWVvYChY588BzGuwZC5XDr/zZRpqFRSN/w/c61fIPBbwZVgn59PIxyXmpFVI9puF63Xu4+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3KURhe7JfSyAglhbPpFMdojYsk2A29C3xa4JZDrJHM=;
 b=Cr4ZAnmUip5ne0rzUbvyeqQ9v4wrDrOZv4BjzAic6Q32dzKSpzbc4bauC0buJry6USz1zokS7OSqvuonPj5X77J0GE8/JU2elKkYacbsjoL7Ouul9zHJtLQBpoL5jgKgRW6S3c4BjoJYDSZ96+sr4wB/u1B7aV8E7QFGrJIRl5UxrKIkDIyO7TzBlb9jTZXo4HCIzspy8BhQANDApdIbjvmEsSW5wXfkkwEfOU5SFmItPe9ThI6/3xoPJS4OnaoXxHY6zZ0NSg5Luyc1vJDmn6Wg3IVu0OwSGaVkdzI4h4YGAIwtzFKIA6kI70un3lPlWxlFJ+TlfDwoDRjTnKRF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3KURhe7JfSyAglhbPpFMdojYsk2A29C3xa4JZDrJHM=;
 b=hUcQ2umuD+XglFAsYTl6tkAnRwPE5IKqAckK7uXzPiUh2Nzx93R7OLtaNoVNV68NZZf24FjKhN1M1jM97Tw+q4E6Qy7Sgjx/Ec44lqBD5DvCAa0PSg055SGAno/GS86P622ubrWK7v697IvsTYK3BqWgKGZzs3MdgskNFuwNOjew+SeVC04D03rk8jv4+2Zw/oPrzBxBLLlSIBgjCdHAjcLlP4wAyf35HKfN6lFzLesxg+h5ab+eGZZGdgEAE30cVYbedh3tCvOv7BgTuQZmYv8YLAP/L/qQSvY04DF4DV4sV2CNBEzFcFHck0EQM4vYs3yveDE4zBAk2vcJu0A6EA==
Received: from VE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::44) by
 VE1EUR01HT047.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::363)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 20:17:34 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::40) by VE1EUR01FT063.mail.protection.outlook.com
 (2a01:111:e400:7e19::179) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 20:17:34 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:BDB0F4DB1E68111E5A970CAD0BD0CC686E6C2D9F4652DC59ACAE09BD7FFEEDFB;UpperCasedChecksum:7BF0CEB12F8DED04D6DD4E8FD91BD9F928E6ED8CD017522C3A9C8177CB18D85B;SizeAsReceived:8955;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%5]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 20:17:34 +0000
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB68818CD461CF14303C8BCA71A8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Wed, 20 May 2020 22:17:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6P195CA0003.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::16) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <d91cc95f-6695-a0eb-d75e-57c18a98913a@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.92.26) by AM6P195CA0003.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Wed, 20 May 2020 20:17:33 +0000
X-Microsoft-Original-Message-ID: 
 <d91cc95f-6695-a0eb-d75e-57c18a98913a@outlook.com>
X-TMN: [OXYo9pUGE6qtFUhuJ1SbK4qK0BvxOLtH]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4fefb7c1-a7d4-4419-3e80-08d7fcfad4aa
X-MS-TrafficTypeDiagnostic: VE1EUR01HT047:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZEBhlgHH23PZQQ4e8SRmI110H/jBq5PKr2aW9SCA1Xo+rrTPDXGB1ygD8wqDehuNhDIb5Ssp/MLR3iOVUIbc0wfVNITRCbjfH3hgSci+psAoS9rxuz8yqnEwZImStWSMnM94Z5toyYIfUWdYAvfhn9FpHVf/i6yJUBvk3eQGvLZPQ0jIuoHJbLfBCPCdTngkPEZMHkwu966Gah+0jj1FTQ4dPpNBHMUAMVssbaWlfDMNKiVAeOfpttvKJOKex9f+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	GyBA1YQ4CXGPq0LG1ONIa1DDZNEc+3bDplO8oC/VW/eifoD2DNs676Dqdejb0YI3SRFkFOQbhu0SToKVZwZC37S+Vj1eltENZRRpFH3JJ2z1MKtCyvVPi3cDQYPjhR98Myvu1Yu2WMgrrsX98b9NXw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fefb7c1-a7d4-4419-3e80-08d7fcfad4aa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 20:17:34.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT047
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On a second thought it should be bb.error not bb.fatal - are all okay 
with fixing just this one for now?

On 20.05.20 00:02, Richard Purdie wrote:
> On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
>> in case the opkg command fails in before no output of the tool
>> itself was printed to assist the user with debugging the issue.
>> Print all output of the tool by using CalledProcessError wrapper around
>> the call
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>   meta/classes/package_ipk.bbclass | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
>> index c008559e4a..5e7d552cc5 100644
>> --- a/meta/classes/package_ipk.bbclass
>> +++ b/meta/classes/package_ipk.bbclass
>> @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
>>               conffiles.close()
>>   
>>           os.chdir(basedir)
>> -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
>> -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
>> -                                stderr=subprocess.STDOUT,
>> -                                shell=True)
>> +        try:
>> +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
>> +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
>> +                                    stderr=subprocess.STDOUT,
>> +                                    shell=True)
>> +        except subprocess.CalledProcessError as exp:
>> +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
>>   
>>           if d.getVar('IPK_SIGN_PACKAGES') == '1':
>>               ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> 
> I get the feeling we have a problem with our subprocess calls and
> debugging but its hard to know what to do about it. We can patch each
> call site like this but it starts to make we wonder whether we need a
> general wrapper, or we're missing something in bitbake or elsewhere to
> help with things.
> 
> There is this code:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378
> 
> which is meant to help but it clearly isn't helping/catching all cases.
> 
> I think we are going to need to look at a wider/more general solution
> or at least have a plan for one.
> 
> Cheers,
> 
> Richard
> 
