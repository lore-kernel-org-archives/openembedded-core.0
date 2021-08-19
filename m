Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.97])
 by mx.groups.io with SMTP id smtpd.web12.72457.1629390669547779298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=kyaU9qza;
 spf=pass (domain: outlook.com, ip: 40.92.66.97, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xe/Y+ky+tOX2UhVH+KY08VAlaUe+88ZLxwYkiaABpi8FoKJwd/RartwWjr8JYLVQN45aB/ZqBN+Mub/OeLluTFE37xFv9lW2QIX131Ytw9jMbAbJmCCBQH6jm32kFck4xk1DvyuUEhZfXFkm7kBp+8WJ9M6rz1vfd49x3mAsjyFdRgusHgI8mTRYzoNqAAczZjB4URIWzie5ZmAQaobV5SMexmS9Q5dZt/Dc/xYXcnWnRS0pxd6YPQWtBQH7qvM4JqJ8dz1VuaHc1p36DAuBQRrrd4JvprcY1otdBdKyCQN70Y7SKqu1edkQHu7kolm787+CmEOPIEMTU5eZToS7Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gMqeCBP2DdvSYptmtvvnhwdPYXqJcB7g77bweLAUXM=;
 b=BU957yVg8XnAZvJf6fWK5Av12iE5WHaUJGBQVabTFVFS9Cb8yEeovfeLbVHCz3Ns+HjoE/HlbXcuJpASAh1s0VDac5VjGFy55YRlZIohMzfLsHLJBGcdIt3uQaetNicer7VmylyV6CApVo/oTxjYQhLWfvCAfYS3JCquzmUH6DJz353MaJ1XO7H8DgvOJ4sPC15M6vXzk2/HZx1MK5rcjUocf6AKvQMJeW6/DqoBP2i0WZoDanA8Dj+kMWre3wttM4vYDfTSTzH8YKSnQEyCTLZ+U9wj3FFdAcixbQtIj1u6SqWCSoZNrroK8Z6zS2S/cSOeK50rUvtGeUEQEzwARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gMqeCBP2DdvSYptmtvvnhwdPYXqJcB7g77bweLAUXM=;
 b=kyaU9qzaHqxN6+xoM+uX7eWbhmXzZD1RSzVLHSiV5LLEwGzqi2YStFAFPwffRDMXD30WWQoWM3M20JHgqooAq+MyXNgnocPrWAqiRPsaPB/QePoYxRQ3150RKjQf9v71cUY1hJUL7WdoNqmXfirHGeNCc2v2O+Gd2EZsQfd5MjMoiLeY5H9asREy3Z8FAEMPkRnu0cCNV2M6nDBKpmq4sG5kDsNv6cR52/WsjnWmzrsAhhm6+suIn1hCQSdSMbjpwvGquyrnDiE8BbNlCYj3UiaqjheHbv9R8gk0yDffm9k5ij1UnqNWMpzELwCc8QhHvkuIBfGlrH9v8riHsDupUA==
Received: from DB5EUR01FT051.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::45) by
 DB5EUR01HT010.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::141)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 16:31:06 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e1a::45) by DB5EUR01FT051.mail.protection.outlook.com
 (2a01:111:e400:7e1a::262) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 16:31:06 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:ADB00674858A03DBCD5147432C83BF07F7EB5AD60E9498623CCD147D3FE03E3E;UpperCasedChecksum:AB80969C04C8A8E7285BD21FB484A81DEB2DA9072A8CD1C57341EE2C1D55C5DB;SizeAsReceived:9118;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e4c0:3ddf:e023:da7a]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e4c0:3ddf:e023:da7a%6]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 16:31:06 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
 <CAMKF1sqy4JmetZ43q7Nq0EFN1ooRBdR8uutxZxzi2QvuvU1SpA@mail.gmail.com>
 <2ec0fd8d-a20f-c64c-b5c0-0c86b3a682a7@windriver.com>
 <AM9PR09MB4642908F79699D4DD2839AF2A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <ba3db5ea7343701e5a78c5b55704bcedfb2106b5.camel@linuxfoundation.org>
Message-ID: 
 <AM9PR09MB464268B7229085D9F34B7E15A8C09@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 19 Aug 2021 18:31:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <ba3db5ea7343701e5a78c5b55704bcedfb2106b5.camel@linuxfoundation.org>
X-TMN: [3pSKFLJ/OcJ8zfqVnB+/RZf81BRNADqHxi9B2mc25vL6/UAD8Dhu3ToQ8razQuSJ]
X-ClientProxiedBy: AM3PR05CA0109.eurprd05.prod.outlook.com
 (2603:10a6:207:2::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <ae25aa73-a96c-0d5d-cd2c-8389818b4ee1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:8109:9a80:3b94:21e6:643:d458:fcb] (2a02:8109:9a80:3b94:21e6:643:d458:fcb) by AM3PR05CA0109.eurprd05.prod.outlook.com (2603:10a6:207:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 16:31:06 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 64f74207-665c-4057-6c93-08d9632ebe73
X-MS-TrafficTypeDiagnostic: DB5EUR01HT010:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xhbTyD2nldEI1I1X5osMpBCx1eqmTA5y7ZmkQcVbPz+JG14bAx7hPm7sFRIHuWIRZk+yI8IDhZIFQdJVFfYf8EJhcTc3K2oe2310hAIvD3qb+DRzK0i5OhBi8mqoCgmAEgeuZ6WAnGAdmR/NpbWnlsbibbw3QBzDyEdQyZxl/ZYQ7+EGA4vZkUYsvv+aIhBK2T85hoMxmcHLK5KiiJSTwHQiBBjtbHpjnqBvdg2FNPsW5dJ6KgsplnpmSmSp2R862w4CiuzoWhvz+FWtaJiS8We9Hf8++GmY3kbJR/oXdUMGxa02dlDXVNrH/gEEhs5KzxeN+47lANxMT/nFdEuafwkn7oKpIT1fjq6R70HdEFcEIxY7cnuq+kcXzqQKexI3/tdLDDXaKC0m+uCKijKJfii5F7FnhUTMRmgPMeaZ2gSysuYNmkjcZmScc/cAZ4zZFDe+deXX5X/8Gu6VfqXEKzQ/6K+lW3Zb9sLrNtJKM3k=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KVgDVOUY86ckeN4cFIFlUV3v4Y4Ad1FtYDa2WFq3lmH/tB/k0bUzLkKlKVZmiPfFUnCjpwhlPAXLbpXZ9yugJ5yE3i2WNwEA8VlMbAs4aN6UMslU2tENwJnvh1pTEU129k0vb2wENKBGtc0j8kZdGSXAlSm/VQXFoICrftIzwFi3dAWOdAYEP+YICM/sVDpx+hEXvXwVfTHqwMdWjU/i+Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f74207-665c-4057-6c93-08d9632ebe73
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 16:31:06.7214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT051.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT010
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 19.08.21 18:06, Richard Purdie wrote:
> On Thu, 2021-08-19 at 16:50 +0200, Konrad Weihmann wrote:
>> I kind of missed out on this change... but I got caught up by reality
>> hard this morning :-(.
>>
>> I currently don't see a reason why zstd is required on the host - only
>> systemd is having a hard dependency against zstd atm, while the other
>> lately added references are just optional PACKAGECONFIGs (and there are
>> plenty of them which have loose ends - in poky and meta-oe)
>>
>> So the question I want to raise: why a hard dependency? wouldn't have
>> been HOSTTOOLS_NONFATAL enough?
>>
>> I mean this is the second hard cut in the project within just weeks and
>> this time it was host related, which is even harder to fix in a timely
>> manner in a corporate environment (basically rolling out changes to all
>> dev installations isn't something I fancy on a Wednesday morning :-( )
>>
>> None of the commit messages somehow mentions, why we all of a sudden
>> need that on the host, instead of building it from sources (which should
>> be possible judging from the latest master sources).
>>
>> And on that note: that the documentation wasn't updated in the same
>> changeset is very unfortunate (not even the crops container where updated)
> 
> Sorry the change is a bit of a pain. It has been in master-next for a while
> and we did have to jump through a number of hoops as a project to enable this
> (e.g. adding to buildtools and our autobuilder infrastructure).
> 
> The reason we're doing this is that we need to use compression within bitbake
> itself for some of our output files. We've not done this in the past as it is
> a pain to have the host prerequisites however there are multiple places we can
> potentially benefit, such as compressed pkgdata and compressed siginfo files.
> It is also possible we may be able to store a compressed parsed datastore.
> 

Thanks Richard, that's explains why it's needed

> The siginfo files and datastore could mean we can improve debugging of a
> number of currently hard to solve problems our users face.
> 
> Without this we're unlikely to be able to move forward in these areas. If we
> do it, we open up new development opportunities and potentially improved
> usability. We can't "just build it" as that would mean we can't use it within
> bitbake itself.
> 
> Sorry this isn't well described anywhere, it is mainly as we can't yet
> "guarantee" that this will do these things. We do know it won't happen
> unless we try though.

Agree - btw maybe a good opportunity to insist on better commit messages 
;-)- just out of interest: is there any guideline, maybe it's worth to 
at least link to a commit message guide at 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded 
or here https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines.
And slightly off-topic, but maybe also worth to do some automation, as 
I've seen multiple patches lately, that don't 100% follow the patch 
guideline in place.

> 
> Master *is* a development branch, not a stable release so things can change.

I've been brave enough to enforce a multi-branch development (just to 
keep the bar low when jumping from release to release), maybe I take 
that as a personal learning :)

> 
> Cheers,
> 
> Richard
> 
