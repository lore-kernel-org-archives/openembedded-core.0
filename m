Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 79F1C60017
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 15:54:34 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 205so6760390pfw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=MXmpjlmpRmUBsUhg9Z17YqbP09uCFV0Ibcix7WO1Xls=;
	b=uMOsbBpLP/CPnfjE+PYfYmFAwG4RaEVPGvY2UWxJCYARwxMYqz/4nQXyGnqX9UdwRB
	Ge2VuhvD3508np3DWcEaVfcP3kR6UpJwGYsZdib01/0Fs4GblTSwE0arDahukerYhyM7
	oYMAjMZwHY5G/S4SFnjRfU4TKVuRfw2112TlCHJCIWviZTIBpvWX1iB+py9UJVAVHhHQ
	g/0FZ4hOGYPKf6Z26AFcyvi4gwLfux4YXME0Hp6bN6SWX649HkuUgGOT20jPTPDu8Dsd
	iIzX97qTmzHHmb9Ms8iM+pXu3Tl8FcX7T2+jTBNoFng7bh4puNrMMeioPG5zGJ+e605G
	2scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=MXmpjlmpRmUBsUhg9Z17YqbP09uCFV0Ibcix7WO1Xls=;
	b=Gfui90jc2RFVmecpWlJdcikGTkKwyprDh1WnHNO6veWkxyqPOLaxpok9kI2QH8JlOE
	0LtlhEBVt0p9YR58cI+xczlR+RWGPCXvdKtJlyiVdclhfstujA0e4euJz7HgQOaAx4Mp
	K6kOI+tQ2h+GU9lf8RiD52bYAixUl7DjGs8iajq98oh2GZIpNveuG6xPsdS9Dd7htGCj
	VjYCpfEGHH86VYH9pCOBY0ItuH23AH2PAiHTF8YQNV8fVqgKGM3+45bCoBxDbmr3G6uF
	+5wB7/fGeQg1K9L/w5vbKOeFMYnYr0be3e6ysXcUPar+88vwgV0a+57y/qDyyXeeRVMj
	fH3w==
X-Gm-Message-State: APjAAAXo7qFvPZunZ1J3gxg5nSa9QSaHryId6lKgU2wnatD0uC6hc00V
	0slwFVNDTrVlwNKqqU5KVgSjaDLa
X-Google-Smtp-Source: APXvYqwZmE1zvbt2jREv/VqmPq79+pKzhNbSbgosEkA5qzBRemL368AgJ21XRR0fV6Xw90kUD3lWdA==
X-Received: by 2002:a62:e206:: with SMTP id a6mr17904809pfi.64.1571586875018; 
	Sun, 20 Oct 2019 08:54:35 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:2c50:19ce:4df8:e156?
	([2601:202:4180:a5c0:2c50:19ce:4df8:e156])
	by smtp.gmail.com with ESMTPSA id
	h1sm13453434pfk.124.2019.10.20.08.54.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Oct 2019 08:54:34 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <b8921ea9bc7bad48a33b0a818d47e2ea069a1dc6.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <db51470b-812f-d60d-b9e9-7741c536f3e2@gmail.com>
Date: Sun, 20 Oct 2019 08:54:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b8921ea9bc7bad48a33b0a818d47e2ea069a1dc6.camel@linuxfoundation.org>
Subject: Re: Help with intermittent autobuilder exposed bugs
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
X-List-Received-Date: Sun, 20 Oct 2019 15:54:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 10/20/19 5:54 AM, Richard Purdie wrote:
> We have a situation brewing on the autobuilder. Each run there are some=

> bugs which sometimes can appear. Law of averages says one or more of
> the issues below will now appear as we have so many of them. The
> project's standard processes aren't helping to capture the issues or
> track them down.=20
>
> With the release mostly sorted out from my perspective I can look at
> some of the other health aspects of the project.
>
> In theory SWAT should have filed bugs for these. In most cases they
> haven't. If they did, we'd discuss them at triage, decide they looked
> hard and then there wouldn't be anyone to "assign" to them so they'd
> most likely end up on my plate anyway. I find it hard to know what to
> do with these. I already have a load in my bug backlog which I've not
> gotten sorted out so adding more probably won't help.
>
> To summarise the issues [just from the last few builds]:

I'll get started logging bugs
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/756
> oe-selftest recipetool.RecipetoolTests.test_recipetool_load_plugin
> RP has a long standing bug:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13070
> https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/1177
> qa-extras2 step2c testimage logrotate.LogrotateTest.test_2_logrotate
> for core-image-sato
> [no open bug?]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13602


>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/441
> oe-selftest devtool.DevtoolExtractTests.test_devtool_deploy_target
> [no open bug, unhelpful backtrace from tinfoil]

Bug #13601, seen with stable/warrior-nmut and on same host - fedora30-ty-=
1



> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/440
> oe-sefltest signing.LockedSignatures.test_locked_signatures
> [no open bug or any idea why it failed]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13605
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/440
> oe-selftest distrodata.Distrodata.test_maintainer
> [no open bug, same unhelpful backtrace from tinfoil]
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13604
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/440
> oe-selftest reproducible.ReproducibleTests.test_reproducible_builds
> [no open bug?, fedora specific perldoc reproducibility issue]
Think its the same as
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13602
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/52
> qemuarm systemd timeout parselogs error
> """Central error: Oct 19 11:21:48 qemuarm login[228]:I have=20
> pam_systemd(login:session): Failed to create session: Connection timed
> out"""
> [no open bug]
I am seeing this on one of my arm machines at home when it boots so I
will take this one.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13603

>
> Some of these are with master-next but I don't believe are related to
> any issue specific to -next, its just because -next has had more test
> runs.
>
> I'm not sure what we do about this. The SWAT process really needs to
> pay more attention, equally the people are volunteers and therefore I
> try to be grateful for any help.
>
> These issues are becoming more frequent and mean we lose confidence in
> the builds which delays patch merging. People often ask me how they can=

> help, ideas on how we can move forward with this would be welcome...
>
> I also know Armin has a difficult to debug selftest issue with warrior
> which is blocking its release build right now.
>
> Cheers,
>
> Richard
>



