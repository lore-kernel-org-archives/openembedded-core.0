Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.128])
 by mx.groups.io with SMTP id smtpd.web10.8819.1591253870788252492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 23:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=S2+M6USq;
 spf=pass (domain: prevas.dk, ip: 40.107.20.128, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1Pf2zHmtg58pN0BD8MdL9M79MLWCAPTnJL18Oet9XJTAlgJTzcHnuxjtznDoTG1QPwssjYeETbHd4cTqk+NgFIcigEfARTnHQ3HUH0SyCfTj6Jph78YWuoDusPxe0iLZZN1qEP2guuVxbwobWSYWLFHBmkAdVNA9eFrUdkjFRnhhx9Yzc0a+rObG7FIZsnYqxBC0wZ4mQ2cwynG2OOXuMsAvCtgmFMXW12UD1k2Zi3WPdkRAcjJLg8wEVJ4Nwr5AFCIGvgbGj//Pn+ZO6q+rhfZ7udw2EbW1PV7pIgRNWwe9s5/8EvS7LWH1LKCJ1kN64mvkccKZFlr3YXSpTNzGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM+RiRK4gROFlmmcfEej8RE78yi6hWsaIT7VDjrwtBE=;
 b=W8yiYxxd80nwxB8a+M0t0zXnFK4d0rWk+1OSYAoaIUJhPALWwWsUwajq5K7WSYRY4HGLRA0LdyKWSqtwi1tYTorPU4yrcF7sSUQwEJm/SShTzeJ1l6A9cKgYds+8kxkGs9hrbL6BWKTkJxcLZkLLrM3cGMQvrzU+NDZxYrnnkcW2NuRR7ntx0jvHXo6pIYs4fhtVabW4In8yk1NVkOnxeG0PDKJ9O4S8DDhX1geGtWxOdwVdvBscMOO3oD24ThMjTz2Dv7Rebioo+syXULsN7AAouBxikVq5A2/pKEyAs1Y4G3mbdk8VNQE08zA4tFl7/4TW1YGtis2Q4DPV4ZX/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QM+RiRK4gROFlmmcfEej8RE78yi6hWsaIT7VDjrwtBE=;
 b=S2+M6USqO9ekjIBdKKYxc5duqk3T21ULUawvkLt5q14SXALiamhqLRsk2gNwIpV2CHhMV+dBLoveZBxyz9FhgVXT5ftPPElcNcBX2wymuysa4zyFUJPq4KDJs7YFBoYVHlzEobJ+w+jsYITSbJD3q1sCcDwKJniQG0q1lFEmrHI=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB2061.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 06:57:48 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3066.018; Thu, 4 Jun 2020
 06:57:48 +0000
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Phil Blundell <pb@pbcl.net>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Andreas Oberritter <obi@opendreambox.org>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net>
 <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
 <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
 <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <7d0cb356-ee3f-d83c-3bb7-99c06af4a7d6@prevas.dk>
Date: Thu, 4 Jun 2020 08:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
X-ClientProxiedBy: AM5PR0602CA0001.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::11) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM5PR0602CA0001.eurprd06.prod.outlook.com (2603:10a6:203:a3::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Thu, 4 Jun 2020 06:57:47 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78e6aa03-4dbd-4680-d5da-08d808549707
X-MS-TrafficTypeDiagnostic: VI1PR10MB2061:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB20614B5BAE694242075423E393890@VI1PR10MB2061.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 04244E0DC5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IM485vwAxdLhKAGIyDwpMiwa5QAl8fUmhdedzzmNnqFjy4X58KD0G1xaaMwOKfBZEEwBKKrhj346Zv5Dl8tj4A1qKRfvn1ou67H/VpnsupwqW2Zb8X1inzUKPifJhC8rjQAry41m2Kdn3qa0M8pHfLqCW/ixOEzM0r0yV8zdUMYewxKZ0apFavu/JEnomGK0ypTfquvC/B7Y6GH2FKs8or5Tgo2IUrVKzkQr1QFgfUtKf58d7/uadoAMy9Gh7Mkm1GA+AdgPiN7W039EZhxt0XiF3QNvc2+3k9V7eizSfknv9roiseY2FrKQe1k/HTWcwo1/SdTgCvC/N2NuAKXSMmzzUj9C60xeqB03G56fO/xept4gr1/Ps4zLotWOqTin
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(366004)(346002)(136003)(39830400003)(16526019)(31696002)(8676002)(8976002)(31686004)(44832011)(66946007)(956004)(2616005)(8936002)(86362001)(66556008)(6486002)(52116002)(26005)(16576012)(53546011)(186003)(66476007)(478600001)(2906002)(54906003)(6916009)(316002)(4326008)(5660300002)(36756003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	q4wPwqt5siNuXRfWtEEvWanSw1LfQUx0Rr8CCla6f3OY7D0icH06nr2iGDQbDKPNpC2X1AUUxb1jc29+jZlLw2KcoFJHeNNMS34yvInfbmFrkrzX7xylmorY1KdCSqjHh/xYJ80cyzgvgXpZL9KjQQhnb/Tpzwglj6FuAnVZkFGGOliDMAnPvwiXNpNlTBLG/3TMo5mlA9KdQjamXslOz6bqjfQ65EAtzG4IFTHsjvABXpFJf5tEb8Glx1N9z6fiv413KXzQRSVofd5NqfPCLUEzRr6eAsz1MVZDQryXL6HFPtZarQoKONbYblj6WeTN0s0BI8Hpg2tINWKtFhFVTz5knbjjGWwkrF9auCAGuf6A3ffURUYaZvrxPlw1JItl4Qp4aNpW4sC2z0BOn46y/N1ercR+WmAvVy27keimAuSVwM1rQOSlQ8OxNnyRK7UUP/5lYhT+1jY7CiSIQq0HPHOs87bqTNh26u5G+fuZHkM=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e6aa03-4dbd-4680-d5da-08d808549707
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2020 06:57:47.8882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wk/qbSfnIFoqGY679SPKLv5+8WF1zdwGWh8MNxs1GN1De2JrQ6/tBjrYYbJaoPjJjbOJtY1DiyJjri2D6f0o5CddFn4FdcBKY5azg44QcAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2061
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/06/2020 22.44, Andre McCurdy wrote:
> On Wed, Jun 3, 2020 at 12:38 AM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>> On 02/06/2020 23.46, Andre McCurdy wrote:
>>> On Tue, Jun 2, 2020 at 2:15 PM Phil Blundell via
>>> lists.openembedded.org <pb=pbcl.net@lists.openembedded.org> wrote:
>>>>
>>>
>>> It seems like a weird corner case to me. Where do these libraries come
>>> from and why can't they be moved or symlinked into a standard path?
>>
>> Pre-compiled proprietary binaries/libraries that go in
>> /opt/<vendor>/..., just as /opt is meant for (and no, we can't just
>> install them to /usr/lib, /usr/bin etc - partly because they contain
>> hard-coded absolute paths, but also due to some not-entirely-techical
>> reasons). So there's an /etc/ld.so.conf.d/<vendor>.conf that needs to be
>> picked up.
>>
>>> If they are somehow special and only used by special applications then
>>> setting rpath or using LD_LIBRARY_PATH just for those applications
>>> would seem to be a better solution than enabling them globally.
>>
>> We don't control the compilation, so rpath is out. We did consider
>> LD_LIBRARY_PATH, but figured that the ld.conf solution is more robust
>> (no problems with setuid binaries or an application that misguidedly
>> sanitizes the environment for subprocesses).
> 
> Unless the supplier of your binaries is completely unresponsive (if
> so, bad luck) then educating them on the usage of rpath and asking for
> a new release is probably the cleanest solution.

For various reasons that is not a viable path.

> If you start your special application via a wrapper script which sets
> LD_LIBRARY_PATH then it won't be seen by anything else, so the
> concerns about other apps messing with it etc should not apply?

"Other apps" could be the apps in /opt themselves, that start other
binaries from under /opt, perhaps via some maze of shell scripts or
whatnot (the usual mess one sees with proprietary stuff) - which is also
the reason I'm worried they might have done some "value-add"
sanitization somewhere.

> Relying on /etc/ld.so.conf.d/*.conf will certainly work too, but has
> two disadvantages: it will add the custom library path globally
> instead of just for the special apps and it's not portable (it's not
> supported by musl etc - although if you only care about your
> proprietary binaries pre-compiled for glibc then that won't matter to
> you).

One could also ask the question: If one is not supposed to use the
drop-in dir ld.so.conf.d/ for exactly what I'm using it for, then why
does Yocto provide a ld.so.conf that mentions it? Sure, for glibc-based
distros (of course, it's from the glibc recipe), but that's fine.

Please remember that this is all just about ensuring that the ldconfig
run at image build time produces the same result, regardless of whether
one has opted to have ldconfig-the-binary in the rootfs or not (and
everybody seems to agree there are valid reasons not to have that).

> Anyway, the original patch has been merged, so this now just a side discussion.

Indeed.

Rasmus
