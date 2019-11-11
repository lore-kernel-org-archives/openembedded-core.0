Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFCD6C4D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:21:31 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id o9so7984765plk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 08:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=iEcOPokyieU0UrMApPe9aMY3/UCU9GtuXBLU2EnwWzc=;
	b=nyG7piqj6QLe7mcRWZpQgpN7fyHHPbvFZBg65+awbsiiFokeUmfj3RFAFI8HaCu//F
	y/EJ9wlPHxV50u82f8TLyv/t0KOgmU6ccQ8uWB0WTbvnmsaUC3//iuDbBqfDsNanG3+v
	TTnH1dx5vihdC5hu4hQ0uf7SMJgZnWJ4jFZI8l8sbJwe12p8aDEvDY3IdPHAdEfe415y
	sKI1W81kBZIqmmr2jbpTlPO3M30x6V81VrbDFreareNVhcZvtx2g8WtbuMsRKb8CEeDM
	WSoJd61K8vjWd/EWZFQT/26Q4iSAyKkNfTIGmSpPB7yjJ1PGDHKOgnGi275mtntrqKT0
	6UBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=iEcOPokyieU0UrMApPe9aMY3/UCU9GtuXBLU2EnwWzc=;
	b=YK+J6+wtKQQTB+SBfI3OttW4R+H3adlZtIkz5YZvra6lXttMJ4TajMPV1nKLvZo4sb
	ClT0FHqH7rpS3Ya+trXRAdaiEklREWtCxD2Sk3Mdu7x2hIkV7ZIfIEIgLy8sOTnG+NLL
	Qsvpz2LlZKdRA/StBJB5MVgwLMcz+qArNhabN9FvPgXuXXhq8DW83MczAyO7Rk3Bspxb
	YVc62TCcaUghDfCrBcj1skvITzZXZLE+66TzY/SMDsziEY1+cwxIzxsVw4eY9kyWhwNB
	BggUfn0CNrtcFQTV62w7WMEwRte9iWtTTMeKLIlKGmnzt+hVkfWynASQyNzNFZSxrC7p
	wbsw==
X-Gm-Message-State: APjAAAXy3NhAJjs9qH0s/gAt30CbDnyyHDRIv+WaLkSveQdxqxtJG6vq
	xYYinTCRANQJes67babfC3Y2Yk1C
X-Google-Smtp-Source: APXvYqyCwa4aKeqlVZWHG8XXQflmtVk8NyzaH7brqGhMsFezVcM2dVBa8Tq53xmojedrs+YfZVRhBw==
X-Received: by 2002:a17:902:142:: with SMTP id
	60mr27287289plb.38.1573489291928; 
	Mon, 11 Nov 2019 08:21:31 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:604a:b703:29ca:5c7d?
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	21sm20793165pfa.170.2019.11.11.08.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2019 08:21:31 -0800 (PST)
To: Mikko.Rapeli@bmw.de, richard.purdie@linuxfoundation.org
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
	<e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
	<20191107075931.GD2398@hiutale>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <16eb87ab-5cca-d052-4663-e5faed54c3a2@gmail.com>
Date: Mon, 11 Nov 2019 08:21:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107075931.GD2398@hiutale>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: maintaining sumo (was Re: [PATCH][thud] cve-check: backport rewrite from master)
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
X-List-Received-Date: Mon, 11 Nov 2019 16:21:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 11/6/19 11:59 PM, Mikko.Rapeli@bmw.de wrote:
> Hi,
>
> On Wed, Nov 06, 2019 at 05:53:27PM +0000, Richard Purdie wrote:
>> On Wed, 2019-11-06 at 16:06 +0000, Mikko.Rapeli@bmw.de wrote:
>>> Hi,
>>>
>>> On Wed, Nov 06, 2019 at 02:59:16PM +0000, Ryan Harkin wrote:
>>>> Hi Ross/Richard,
>>>>
>>>> I'd like this applied to Sumo also. Should I create a new patch and
>>>> send it
>>>> to the list, or is there a process for requesting this is cherry-
>>>> picked
>>>> across?
>>> I just posted the port of this and all other CVE scan related changes=

>>> to sumo
>>> http://lists.openembedded.org/pipermail/openembedded-core/2019-Novemb=
er/288817.html
>>>
>>> But the question is valid :)
>> Support for sumo officially ended. I can see a case that the broken CV=
E
>> tools there are a good reason we could consider merging the patch
>> series but we do need to be able to test it to merge it to the main
>> branch. If we can't test, we're merging blind and the quality the
>> project tries to deliver could be compromised.
>>
>> I have made some tweaks to the autobuilder which bring us closer to
>> being able to test sumo using the workers still around from that
>> release.
>>
>> The things that make me nervous are questions like:
>>
>> Which releases do we "open" for such patches? How far back do we go?
>> Which kinds of patches are acceptable?
>>
>> Note that sumo (and earlier) doesn't have much of the QA automation
>> which we've now built our processes around so we don't get test
>> reports.
>>
>> You mention wanting to change gcc. That means we really do need a full=

>> retest of it to merge that (which is why it never happened originally
>> from what I remember).
>>
>> Also, the LTS proposal stated we needed someone to handle this work. W=
e
>> have no such person, even if we do somehow find them, they can't be
>> expected to cover all the old releases and effectively turn all of the=
m
>> into LTS releases. How can we get the funding to try and get some help=

>> with handling this workload?
>>
>> I am probably going to try and make a case for sorting the CVE tooling=

>> on sumo as I agree its bad and we should do something. Where do we dra=
w
>> the line though.
>>
>> Basically, this looks like it could create a lot of extra work without=

>> helping the core project under-resourcing we currently struggle with.
>> You can therefore see why I might be nervous :/.
> All this is understood.
>
> I need to maintain sumo in a project for a while longer so I can publis=
h that work.
> The CVE checker patches are just a start.
>
> Providing funding for Yocto Project LTS work is possible but a lot hard=
er for me to do.
> Testing and publishing patches is much easier.
>
> Could you clarify Yocto Project side answers to these questions:
>
> If I continue to publish patches for sumo, can I continue doing so on o=
e-core mailing list?
As far I understand it Sumo is under "Community supported" and now more
and more patches are being sent. We should formalize this process IMHO.

I don't mind collecting them but they wont land in mainline as we need
to address the regression for the other layers or until we change the
policy.
>
> If I continue to collect patches for sumo, can I do so using Yocto Proj=
ect infrastructure, e.g.
> a sumo-contrib-lts or similar branch in poky git tree?
Well if you get write permission, then the stable branch maintainer
should have it too.

You can use
"https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/s=
umo-community"

Would we want a similar scheme in Poky-contrib?

I would prefer patches being sent to the list before they land in the
branch.

If we decide to build, we can use those branches.

Not sure where they would go from there.

>
> If I continue to test patches, what would be the patch acceptance crite=
ria and required testing?
> I would assume same as stable release rules, but maybe these need to be=
 even stricter, e.g.
> only support building on Debian stable, following the LTS proposal. I'm=
 testing in my own project
> trees and CI with target HW, and doing world builds on pure poky with q=
emu target. I could some
> kind of ptest execution to plain poky as well.
>
> Would any testing of patches be possible in Yocto Project infrastructur=
e?

How about BMW join the Project.=C2=A0 Cash might help support such an end=
eavor.

>
> All of these things I can do also completely outside of Yocto Project, =
e.g. publish a sumo
> git tree on github, and rely only on my own testing. But I'd like to se=
e
> some co-operation here from other users who are stuck with sumo.
I would prefer not to see a fork situation expect in a last resort.

let see what we can come up with.

regards,
armin
>
> -Mikko



