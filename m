Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 966C0780B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 18:09:46 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id v15so93435841wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 11:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7qgZwFczFZbPXLdE3eoy2IMzWcDWggj9ObXTQQzlq84=;
	b=uchlfD8DUHAnkzJga1uUNKwR7QapZFPXqHVlzhRWpAyzzAshHjVYhu3UV19WowWo5+
	QUvKBlNVD3h86IRKv0Qca2M/MjygV3hxSUw+TwZF4PMvuV1z3dee/WACVbTDotAfHET9
	NPFY+aoYrQLPW+w+HRs0jDF/Xq2qxfpN8TG32GcZPHFD4FpWej/gd7Cbq3kUgnfzqq2A
	XNwvpEeSzdQWrINPWry+k9SjLBhyvlemc/RT+1VPQs7j1iL2iGpuYbsrYFSaDX01+hA2
	kuUZCvboEOP6sD1bXLvdcRkUTAhks7oBKuvcMKg0YmKKiBcwENodzfkBqO6dL6QMVkBS
	MI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7qgZwFczFZbPXLdE3eoy2IMzWcDWggj9ObXTQQzlq84=;
	b=XgAdu5d0tEn90SK63GSAc1M39FO5dyyKiUC+Fzkvvj+4SYETWsrneWPfYk/Pqf125j
	Gu7+7W6NIMXn2a6Cuhbadf9GEhh/RkhvLu72T4NdKtdxPktUoFnV6NQps15AhNW8LZK9
	2yiKGU6UcAKBxnug5wkrJrvnhFhdIMisA1Qd7nzwRDQqxRuzg59rt77KuYDFArvoUbkL
	CGao7ROsGQvlNS8M0OhZjYI26QbgDMIZxu9eedO0+D85hkNYz5UevD6yZA+LBbM2s4tx
	EJw9L95VNb5ZJ64WUZYbzgpuJcnFPM8HDKXpjCkc4fE/0HbAMxoWDJoEIdQ7Ys3oClQc
	EnIQ==
X-Gm-Message-State: AODbwcDOBaWn4DEktrjijEIMx/Xcu2wi+Q/5DHkLqSooCzWoWrgI+nGs
	IbTt1G0fGYe/p++I3frIWKXhD6wm5w==
X-Received: by 10.80.147.195 with SMTP id o61mr8035625eda.178.1495217387158;
	Fri, 19 May 2017 11:09:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 19 May 2017 11:09:16 -0700 (PDT)
In-Reply-To: <20170519180720.GW28053@denix.org>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
	<20170518181957.GU28053@denix.org>
	<lyinkxrb1k.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170519180720.GW28053@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 May 2017 11:09:16 -0700
Message-ID: <CAMKF1spOwKdev0seT_RzTQ==H-Vby_VUKa=Y=5kyf+1gm82-qg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Fri, 19 May 2017 18:09:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 19, 2017 at 11:07 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, May 19, 2017 at 01:37:59AM +0200, Enrico Scholz wrote:
>> Denys Dmytriyenko <denis@denix.org> writes:
>>
>> >> -EXTRA_OEMAKE += "cc=${CC}"
>> >> +EXTRA_OEMAKE += "cc='${CC}'"
>> >
>> > Should these be double-quotes around ${CC}?
>>
>> I wrote it in this way:
>>
>> - to 60%, because '' is more correct than "" in this context (see below)
>>
>> - to 40%, because "" would clutter code too much and I can not say
>>   whether it must be quoted as \", \\" or whether perhaps plain " works
>>   too
>
> FWIW, bitbake handles nested quotes properly, no escaping needed:
>
> +EXTRA_OEMAKE += "cc="${CC}""
>
>
>> A yet more correct solution would be
>>
>> | export cc = "${CC}"
>>
>> in the recipe (outside of do_*()) and perhaps adding '-e' to EXTRA_OEMAKE.
>>
>>
>> This handles additionally the case when 'CC' contains a single quote
>> (which causes misbehavior in my patch).
>>
>> Double quotes are much more worse because CC must not contain '$', '`'
>> or '\\' (which is not uncommon in flags like '-DFOO()=\"bar\"').  In OE,
>> it is not expected that these characters are interpreted directly by the
>> shell (${CC} is passed properly quoted in the environment).
>>
>> But all this does not matter... correct quoting is neglactted in OE and
>> bitbake; when you are lucky, commands are written as "foo '%s'" % path.
>> But nobody uses functions like 'pipes.quote()' or a non-shell variants
>> like subprocess.call(['foo', path]).
>>
>> So, you can assume that '${FOO}' expands to the same value like "${FOO}".
>
> Yes, bitbake variables will be expanded properly regardles of the quotes.
> Passing a shell variable may cause problems, but may not be a good practice
> in general.

you can toggle '' and "" strings, will keep the readability and embed
the string too

>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

