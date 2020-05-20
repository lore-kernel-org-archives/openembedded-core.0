Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.19])
 by mx.groups.io with SMTP id smtpd.web10.7087.1589951239800823917
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 22:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SJLFNp7T;
 spf=pass (domain: outlook.com, ip: 40.92.73.19, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnX2bpSB1IST756jpToUKbblw6cw3PvGOT2OOheMsa5y2qt1aSMvVb0UVS4wNy5xk3gJo/w6OAE4yk1sV/fCHU1xv/zcCFYj9N50p8XR+HHa6tj2z5TI2zGQ6VpGQbZNzwFJPuPVHWbn+6AB4bGKjTmr93GY+DKLaDyEIDszCVwc3K3zEugJMaRPjvpQzwoqnA3laXHkRvFozXt4APbPPq6pMMQWmKaVhLq8DEkkuYvKipcyG9/qF03fVRjMRKl4DIu/i9rbIUkXFa0d2DFFxSctdufbsLEMcABnraHTpxRqqfom83fgSalPEitaxn2+YIWheti60Sq7Nj1CtOcsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQx79YbjSelA7r7ZSh2jTE8bZC0fYG/RMvjbLsG+WR4=;
 b=e9t8NSkTav2NNq+e/ZI+7H0ODGAKHdIgUU5n9wM9Z/F6FwlaxElAZpmRENPfrq09+aVIjwnpkJc4Cybsgt6zNGgXON4eZAoyMNH5O1dGe0upVpWBSaQ3QoEHMduQB0Yg/SlpRoZTYEV5UbnW4Iuo7svlcMcmyavOVKHmNMxHaL//5sM3b8oCq67L9xxEDsqSseTTx5Jbpn+H1S49AluAi6nLG3ERX5TqaMHru3npwVgYMoNJ8+fpAJ5KiqPMMJD88GIXrx0fDiNkQXvEWDIe6nKZwaNGUdnBSS5BPxnJUVJevBkaW0+9EtmUrIE7C3hrEsee2IuKVxdhDRyX/KZKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQx79YbjSelA7r7ZSh2jTE8bZC0fYG/RMvjbLsG+WR4=;
 b=SJLFNp7Th7VdtHZOe8/5ecnWgFHk0Kl2Vg4ii38RTzdeMV3PO+guO0XRORzLYpw9z8gQdX/NHb/IFs2GSr7plHdixfv70JBuApWQnOUbkGyQK+xldRXtoe7SBMsAhfbQ1g64zcsLWqLTPjqvrRjJZ2vUlAB73LRYoFSv1Tm1DwZ8i/BNUAy1qIk/YbmtJYOEiOsls9BP+vhfNb+l6JAT83WZfoYUqGD8CKzTqSAnj4v4+OPfC+TOnAUNGKq0diyQICdKai55xDAwuPaggXnf3ZRxv+2RLxzRKQ7V+PHbH6eh5/vppTA+SnOHQ0JmbEkyM7e244HCavPXiLb/yaGisg==
Received: from VI1EUR04FT013.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4e) by
 VI1EUR04HT059.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::289)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 05:07:16 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::50) by VI1EUR04FT013.mail.protection.outlook.com
 (2a01:111:e400:7e0e::175) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 05:07:16 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:1D4167A7AAB415B4CF7BEF1E0D7800F16701255E96E86FB0645CDFD2D9A6BA7D;UpperCasedChecksum:245F219431F6F5B720E39330A79EEECFC40000CA469CF56113CC191682293B5B;SizeAsReceived:9113;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%5]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 05:07:16 +0000
Subject: Re: [OE-core] [PATCH] package_ipk.bbclass: print opkg output on error
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <4c0bdb8031119a16004ecf9aa5d1a19dc0ec397d.camel@linuxfoundation.org>
 <CAMKF1sqXcOgUUcay18or1dg_1ESbZEa6RFB=i_vPqC74-eXepQ@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM7PR05MB6881DD5067E7598DE651788FA8B60@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Wed, 20 May 2020 07:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <CAMKF1sqXcOgUUcay18or1dg_1ESbZEa6RFB=i_vPqC74-eXepQ@mail.gmail.com>
X-ClientProxiedBy: AM6P191CA0064.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::41) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <2cff1b42-aa60-3787-4064-fc37b1c21ec5@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.20] (87.141.92.26) by AM6P191CA0064.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25 via Frontend Transport; Wed, 20 May 2020 05:07:16 +0000
X-Microsoft-Original-Message-ID: 
 <2cff1b42-aa60-3787-4064-fc37b1c21ec5@outlook.com>
X-TMN: [wrEsVpxK/jsdKj+SCi48u81M/DQD60uK]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cc43653a-145d-4e2f-0d3f-08d7fc7baa4f
X-MS-TrafficTypeDiagnostic: VI1EUR04HT059:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oWCOUs5byVuPQ2xPitbOL3hpXfXpWxLcBCgG64lvY5wlpi+AXi4s/nhJZ3n+aFa/bTmlkN/v+5ZJJpB+yjGQ2Qfn54NXy89oWBxuV/aFrm1o7jbj9MtPz2s69e9C5UPuzKvuDBaxqFNElBrqC3phxEYMrIlH0CI2CxHb3z51x5jdve4SzFVK8DDn+nmYc0wWOO24nAzBMEqZ4WfmmHHlN0ED4xZzshO4+q1s/Hff40drjUxOOm6dfH33RFnyxVo9
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	1++R/wDOdXQ1sZOgF/r0y2XCMdHOkgCbIhXheOlEAI8Qk6nJ1UyF8uk3lxu0uXTlIpDI2HMzTD+timgx7GcCNjledSMr6rWSyLSR/JxrI78TBjZaFTNGklkPQnor+42B1kGoZmvSprEcWvTKBGu6Dg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc43653a-145d-4e2f-0d3f-08d7fc7baa4f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 05:07:16.7984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT059
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi all,

I don't like the idea of wrapping subprocess.check_* calls once more.
IMHO too many possible workflows are possible so chances are low 
catching them all appropriately.

check_output is a wrapper around subprocess.run, which is a wrapper 
around subprocess.popen which is wrapper of popen, so an additional 
wrapper doesn't sound like the best idea so far.

I'm okay with generalizing the output of a failed call so maybe just
http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n330 
could be used more widely.

It all comes down to handling subprocess failures and in this particular 
case it was simply missing.

Long story short, I'd rather fix them one by one (with respect to actual 
code flow) than abstracting things even more.

Regards
Konrad

On 20.05.20 00:14, Khem Raj wrote:
> On Tue, May 19, 2020 at 3:02 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2020-05-19 at 20:36 +0200, Konrad Weihmann wrote:
>>> in case the opkg command fails in before no output of the tool
>>> itself was printed to assist the user with debugging the issue.
>>> Print all output of the tool by using CalledProcessError wrapper around
>>> the call
>>>
>>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>>> ---
>>>   meta/classes/package_ipk.bbclass | 11 +++++++----
>>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
>>> index c008559e4a..5e7d552cc5 100644
>>> --- a/meta/classes/package_ipk.bbclass
>>> +++ b/meta/classes/package_ipk.bbclass
>>> @@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
>>>               conffiles.close()
>>>
>>>           os.chdir(basedir)
>>> -        subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
>>> -                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
>>> -                                stderr=subprocess.STDOUT,
>>> -                                shell=True)
>>> +        try:
>>> +            subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
>>> +                                                            d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
>>> +                                    stderr=subprocess.STDOUT,
>>> +                                    shell=True)
>>> +        except subprocess.CalledProcessError as exp:
>>> +            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncode, exp.output.decode("utf-8")))
>>>
>>>           if d.getVar('IPK_SIGN_PACKAGES') == '1':
>>>               ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
>>
>> I get the feeling we have a problem with our subprocess calls and
>> debugging but its hard to know what to do about it. We can patch each
>> call site like this but it starts to make we wonder whether we need a
>> general wrapper, or we're missing something in bitbake or elsewhere to
>> help with things.
>>
>> There is this code:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky/tree/bitbake/lib/bb/utils.py#n378
>>
>> which is meant to help but it clearly isn't helping/catching all cases.
>>
>> I think we are going to need to look at a wider/more general solution
>> or at least have a plan for one.
>>
> 
> 
> are you think of wrapping subprocess.check_output calls with some post
> processing ?
> 
>> Cheers,
>>
>> Richard
>>
>> 
