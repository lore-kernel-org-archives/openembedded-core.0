Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.104])
 by mx.groups.io with SMTP id smtpd.web10.8873.1591169916239667911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 00:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=U/VdYKKR;
 spf=pass (domain: prevas.dk, ip: 40.107.15.104, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaBFHMxbz3QpthCUxoTnF2XcXEo5wL560ioQDtAvyfVOCEZ92kOobfKhFi+8ghpySv2gOM3R25aOnxEIlQbzQ4uaqyeffr0nu2EKQPsgzERURTiFTSX+kPdoeUXVogRMHZlkAh07tElzDPe5WqLOI2eoO8grd7N0cIbK8gg/09m4UUiYC5wuOad4vno5C2xg4xlgk+3f05UPaw8eSPF2gygCrhs8OeFkJMqezUngOLCBcybca1T+kiKILRaC4eFTVsac5uCvhbil9xrXO5vXTI0cNAsKxgAKwq39htHObuNYC4OT/T2TV2OlXgqXFVU8yGbLN9sI742zuddy6JkQyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJCjJcF0uoj5bp8UvLJ4TeBkDfIUcKmWpvCG3C1RsNo=;
 b=ZuvZ+kEPPiBrzOpEOdIFKcvLwSIJ2KA1sRC37epVgOlhz/bDz8qIgEtIFSW8F940l6ERb1lBGHqs9diPLE7ZpdXAqWwlwrFqbflfpalKEwQqMNh1gWE6+Jh1U0mgV1DDwNhpa59Zos9KZrnPvKc4yIzYZ/GUd4xCsjxV18YoDFmwyovvfKnoCKIuZT7U/NAN9F8ri7MIt03+FK1KMjN9TcsQVIkttKwu3WyvcdyF2D6yBse9Zh6EA97zkseIJNIjh/sE35AA1VInzypNkNtrwkjJOCKkvVWTAPxICWv+KhCPX13vB2wBzsJTuw/fZBFLdWInWbvesIro5y8OhDqjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJCjJcF0uoj5bp8UvLJ4TeBkDfIUcKmWpvCG3C1RsNo=;
 b=U/VdYKKRnkpe0q7D11ShW/NOeuyI2NpMCHwRuKO7dhzsakO75Zyhuzo8Bt1RNXlIXVFJ7u1wCYDwGwh+0G0SmXuWPzRNNW+HUjHKLUrYUKZ8Sg1fZMlHMiHaQ1jGO3bDfawvVlOaKVcQGNDAUDwZKgBIiVEpSKa81h/GlLTvePo=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB1775.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:802:36::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.18; Wed, 3 Jun
 2020 07:38:32 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3066.018; Wed, 3 Jun 2020
 07:38:32 +0000
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Andre McCurdy <armccurdy@gmail.com>, Phil Blundell <pb@pbcl.net>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Andreas Oberritter <obi@opendreambox.org>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net>
 <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
Date: Wed, 3 Jun 2020 09:38:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
X-ClientProxiedBy: AM6PR0202CA0068.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::45) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM6PR0202CA0068.eurprd02.prod.outlook.com (2603:10a6:20b:3a::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Wed, 3 Jun 2020 07:38:31 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ccef430-e6ce-4bcc-d519-08d807911db8
X-MS-TrafficTypeDiagnostic: VI1PR10MB1775:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB17756B7CF90F11014A0E11CC93880@VI1PR10MB1775.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04238CD941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8nrpLYatnL9Eq7WOTFtdvSphc1+051QUQDn8egyUhVLK6NTjUGGF1dn9Q+qH5R01XraKDVlO5pENaL+4HhWLyX/vOWlg0WzKMUx1BwRD1Ub8v3wq4qQLiBswh+2rvjcreTVnbtdj/8+hKRMy+A2NKm5QA5oFy/tSX+LmFlZVkfrNiTV88QUdlblgo3sovB4KcVUnVRuFfHMYEvO15saXlkkxRLSvK1ddXH47tzU6qlerefV7X5B67FA9PXdQrfpm/5EMsCrjFNrSoUnGZA/QRKIEwijjN+APJ5tYN2G507aTyW8qDgp1JrQEoHxVfrHoQFG6CNnuZygbL3NpqQg4KQUKZDn2w2l7teQG0L+Aj9jreV+NsZC7pSWV1jSmvaAV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39850400004)(136003)(366004)(396003)(5660300002)(83380400001)(316002)(36756003)(86362001)(26005)(31696002)(4326008)(16576012)(66476007)(186003)(66556008)(16526019)(2906002)(53546011)(6486002)(66946007)(54906003)(52116002)(478600001)(110136005)(956004)(2616005)(44832011)(8936002)(31686004)(8976002)(8676002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	YiDbx6nuGoXaagI+nHEg1IsxNjxQLvHp+Jss5fRPGcNcoUBvj0h4n+UEttY1azy2m/iz5UdCuB2PQExowyE6bUzwjM73NlCp2iL9n48iGTTIqzumbJM0harApt3DpqfJECXnV+YwM0s4BU5Ys1aRuBz3JgP7d78NF4nmVHnVeOsiJuwhG0CinYgpcHhfFokp8TY1BE6QP1PWKmmBdx++xitiMKCVpNIuMm1axL1iaS4vU8kNiqi/F7NKM0UiQTzMrOOE5wts6A5uBZT35Y+YVGf1idk/usC5s1TCUNxXAxV+2cIgkVh9dkv4FA8WXHmmPpOLiyomiO4akaggy9f7BDYu/MlZBUQhraVcr2G/l895PItR1ZLgoR28G15OrJJOHv9eTZegV/uZVjASyqXf9C0Ww5F9fdh4imEEMLzNwMN6qj5ZchbA+oZ+x0AfrC9LV4B0YlsUfObDl5bJsngEtIog4f3sO+4zB+dLJjLKH1A=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ccef430-e6ce-4bcc-d519-08d807911db8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2020 07:38:32.4449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djximfMS8pWiok4F901Hhkyla72/qf5DPOmS3UmhRBfCfp3x0bPRoT2od9x+POL+ATSBhw5dGxTfrDYkzZ69ZNtqHfe+0Xu6cB0Xrs4fTcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1775
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/06/2020 23.46, Andre McCurdy wrote:
> On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
> lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
>>
>> On Tue, Jun 02, 2020 at 09:17:44PM +0100, Richard Purdie wrote:
>>> I understand the concern, I am a little torn on this as adding in too
>>> many different controls and options complicates the test matrix and
>>> makes things harder for users.
>>>
>>> You're effectively suggesting a new DISTRO_FEATURE to control this? or
>>> maybe better, perhaps a glibc PACKAGECONFIG?
>>
>> Yes, right.  I don't think it need be a DISTRO_FEATURE because nothing
>> outside glibc needs to care.
>>
>> Here are the scenarios that I think matter, ordered from simplest to
>> most complex:
>>
>> 1. Immutable filesystem, every library installed in the place where
>> ld.so would first look for it anyway (i.e. everything in {/usr}/lib).
>> In this case, we don't want ldconfig (because it can never do anything
>> useful), we don't want ld.so.cache and we don't want ld.so.conf
>> because they would cause ld.so to do extra file loads and computation
>> but end up with the same result that it would anyway.
>>
>> 2. Immutable filesystem but some libraries are in places that ld.so
>> wouldn't automatically know about.  In this case we do want ld.so.conf
>> and ld.so.cache, but we still don't want ldconfig.
>>
>> 3. Mutable filesystem where arbitrary binaries can be installed in
>> arbitrary places.  It's probably debatable whether ldconfig is needed
>> in all these cases, but clearly it's needed in some and I think at
>> this point it can be left to a DISTRO decision how exactly they want
>> to optimize things.
>>
>> I think right now oe-core supports #1 and #3.  The proposed patch
>> seems to be aimed at #2, which is a completely valid usecase,
> 
> It seems like a weird corner case to me. Where do these libraries come
> from and why can't they be moved or symlinked into a standard path?

Pre-compiled proprietary binaries/libraries that go in
/opt/<vendor>/..., just as /opt is meant for (and no, we can't just
install them to /usr/lib, /usr/bin etc - partly because they contain
hard-coded absolute paths, but also due to some not-entirely-techical
reasons). So there's an /etc/ld.so.conf.d/<vendor>.conf that needs to be
picked up.

> If they are somehow special and only used by special applications then
> setting rpath or using LD_LIBRARY_PATH just for those applications
> would seem to be a better solution than enabling them globally.

We don't control the compilation, so rpath is out. We did consider
LD_LIBRARY_PATH, but figured that the ld.conf solution is more robust
(no problems with setuid binaries or an application that misguidedly
sanitizes the environment for subprocesses).

Rasmus
