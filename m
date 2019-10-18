Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE306B5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 21:18:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t3so4016374pga.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 14:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=SCvKqVjdeTFdlnCdVJzSKCdVH4Tetg2FuOTywkKwNxo=;
	b=dBkOYmUsXlqmZQ/AbhgGj1WiAKWbg2N3IKkr/f+PLSIWPbD2WUOeMSOJnUl8yxqsEq
	0JmJUhKgYKDEaPbmcisIK0nwV6tbQGNR4u5fmgebn87PKjLjCLDtTg2sURRdz5TWx07h
	pOUXTgD4DxyTlEm2RP84RcEKcf2brbm288ModTpR6dJYElgcYnU+AcEVctJX+zxBhxMf
	MHGGT1BEa3hxELbluTYuVsnrxbCPP7llnkbgGlaxCUGNO0KWAmKf45632CbJCYmuNt5y
	Bm0zDQzrXlLrTpnb4nV2I6sPGrolKK7Sc0m7sfA3Hje8pMZvUsBFUphxPS95+o8+bBOL
	8Ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=SCvKqVjdeTFdlnCdVJzSKCdVH4Tetg2FuOTywkKwNxo=;
	b=gnS54sPGCkypAFu4BLiQP6Jku9dPIER3mdHvn9/HnAUWFbPoQGCoaJMFx1YK19SqC+
	E+JfyUqDuoSd45OKFE5jZtZgk34YEcd71h6YaILbybs5zm65VZEBnPHcAN3U6FuzZOTM
	gOTBAhTUUPj4aFG0UhNsipD0C7JU//YWRJ9UbCeSm/STL+EUZaIjfypWb8Y3OOhJm81K
	wUuikYzBpLZT/Y9KLKvMvUrdSL/Zz9RhUoXB0LvOuZkvcjwNbRtYGZA3Gn4QqrHJTUYe
	ICXuJ4EfgngswAqMiv1l9ZujEQRRSV3upJUja/GXg/KyXQ7qu3Q06xwCpnAfGNY/sBY4
	4PhA==
X-Gm-Message-State: APjAAAWQDQ87BUuDFgVe7ykNq0sr9o2+C2fElk6DV08T5qInl/eoQOEm
	/fYDQL8EX01EbLF4IEOyqNTEK5cJ
X-Google-Smtp-Source: APXvYqzX4yLhlOTEq0M8IqEB6OhRsZu7aELJ9QLgcQPxgL2P+oJb6OnKZTablehMV7n2RYOMNRYgQg==
X-Received: by 2002:a62:e80b:: with SMTP id c11mr8801385pfi.241.1571433498206; 
	Fri, 18 Oct 2019 14:18:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:80c4:1df3:e700:2539?
	([2601:202:4180:a5c0:80c4:1df3:e700:2539])
	by smtp.gmail.com with ESMTPSA id 127sm9851588pfw.6.2019.10.18.14.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Oct 2019 14:18:17 -0700 (PDT)
To: Alejandro Del Castillo <alejandro.delcastillo@ni.com>,
	Denys Dmytriyenko <denis@denix.org>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
	<20191017184222.GN17412@denix.org>
	<2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
	<20191017200153.GO17412@denix.org>
	<80a9db47-73ab-3326-3488-d5d9649e352f@ni.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <21ecbf49-d34f-414c-bb05-636626ac6ee9@gmail.com>
Date: Fri, 18 Oct 2019 14:18:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <80a9db47-73ab-3326-3488-d5d9649e352f@ni.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2019 21:18:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/18/19 10:58 AM, Alejandro Del Castillo wrote:
>
> On 10/17/19 3:01 PM, Denys Dmytriyenko wrote:
>> On Thu, Oct 17, 2019 at 12:21:11PM -0700, akuster808 wrote:
>>> On 10/17/19 11:42 AM, Denys Dmytriyenko wrote:
>>>> Thank you for this revert! I've been pulling my hair out past couple days
>>>> figuring out why BAD_RECOMMENDATIONS stopped working for us. This fixed it.
>>> What I find curious is that the offending commit has been in thud since
>>> July 29th and we are just now hearing about issues.
>> Yeah, in our case we only noticed the issue when we started preparing the
>> latest release and found extra packages that weren't supposed to be there.
> Is there a bugzilla ticket tracking the issue? 
I am not aware of any for thud. IIRC, this commit was a backport request
from the community.

It would be interesting if those who have issues with thud check against
master.

- armin
> I added the 
> --add-ignore-recommends flag to opkg, mainly to get BAD_RECOMMENDATIONS 
> to work for OE. If that's not the case, then need to figure out what 
> went wrong (the OE side or the opkg side)....
>


