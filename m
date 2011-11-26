Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUBFj-00054Z-6p
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 06:56:43 +0100
Received: by lahe6 with SMTP id e6so125754lah.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 21:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=4t0tyDvoxPGbK7mlK8O5ucE/Ri5lj4UNUatnCoGihQ4=;
	b=pYbvwGhFiPmg+Z2+tNjJlkGWZBFFN18Mmxh4VeUgf4LF9x9VLfVac/Q9Jl+wnSTP5V
	dkao3/T2CINktREwlNMCx0eFR3JA81/tzY8vuwop70Q3KcFuHAzAIsUo9EMr3EAry24Q
	Wd2md/MEDptCiIJm5Vf2jezExXtqj7bxdckGY=
Received: by 10.152.105.226 with SMTP id gp2mr22011984lab.28.1322286607055;
	Fri, 25 Nov 2011 21:50:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 25 Nov 2011 21:49:36 -0800 (PST)
In-Reply-To: <4ECF7C0E.304@dresearch-fe.de>
References: <4ECF768A.4060108@dresearch-fe.de>
	<95977E6E-2138-4CEA-B7C6-FC8A248F9C95@dominion.thruhere.net>
	<4ECF7C0E.304@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Nov 2011 21:49:36 -0800
Message-ID: <CAMKF1spxSD4pG1x4Z30ATfMKWKcjoFJJxW4r0pguM0rybcyHaw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Uncommon source deployment policy of live555
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Nov 2011 05:56:43 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 25, 2011 at 3:29 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> On 25.11.2011 12:21, Koen Kooi wrote:
>>
>> Op 25 nov. 2011, om 12:05 heeft Steffen Sledz het volgende geschreven:
>>
>>> The LIVE555 project has a really uncommon source deployment policy. :(
>>>
>>> They publish *only* the latest tarball of their code [1]. And they don't make the code available under a source code repository [2].
>>>
>>> I've asked to change this policy but they are not willing to do that [3].
>>>
>>> How can we handle this?
>>> Does OE provides a "mirror" server to provide the versions we're referencing?
>>
>> Angstrom has had such a mirror ever since it started and it has the following live555 releases:
>
> Great.
>
> So there's no need to change the recipes. This server is used automatically. Right?
>

for angstrom yes the mirror is a fallback


>> live.2009.06.02.tar.gz
>> live.2010.04.09.tar.gz
>> live.2010.05.29.tar.gz
>> live.2010.10.15.tar.gz
>> live.2011.01.10.tar.gz
>> live.2011.03.14.tar.gz
>
> I'd like to see the current live.2011.11.20.tar.gz there too. Who's maintaining such requests?

as another backup you can also put this up on
sources.openemebedded.org, send it to ka6sox


