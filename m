Return-Path: <msm-oss@mcclintock.net>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id D192A785E6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 21:22:57 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id i20so6842858uak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 13:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p7sF+iYSZ50Ndh1AyYQVu+NJW9eRt68tn/0++8wNj1o=;
	b=cqajmQlwBFCDhx1vTtfJ5ytPrnSHujXPvRNRewo6JTgHiXaEIe3Sy9YYQkIR3UHeAD
	rO+hkmCqgGW7F/SpvYMmTZ0vyKCC1OwpfKFS44cEQbGAgN2icCFADGMombP6smu9yeiK
	NU4NnuJ5G4qyz3LBC/MbZWThDsKK1SRThHEuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p7sF+iYSZ50Ndh1AyYQVu+NJW9eRt68tn/0++8wNj1o=;
	b=C1r/hL0tMQCqE434StVq5aU2LQVq3Dja9bi/iZW4+tq39+FD8YbrXeEdPZaQFMw0+X
	68NCLAKXfOXLaPlaXiT93q/zq9eZVfGgzj8UQ2DVgsmH3tHL9KarqXC86qO5TCgpjwlJ
	JXFK0rq/LztqX33JlgxUETJHNhU1G8leAIq/enQSZpgpGrVqTsGKO9NB2PGoryf+jr6L
	OiHZ7+28qB4cORJA4oDVxhRIHZRqlPPSZdMwYQ10/BDdnYXi9WcFO2Pn0p9eSsPuC2+H
	lkC9udLmuer+czk/mbJxqbibhcecf3Qnl0neT7hH8Qa6NrBSKiqs0d7PboyN3F0mLyb9
	SEAQ==
X-Gm-Message-State: AKGB3mJGqAMbQnGCBJ8ECVf2ve+MbKTMdDouos/LQY2J7UmFYf0jfyWY
	TmnKCmphfjSSHPXAG/wV3+ISvUTlAkyvCeR63PKw6w==
X-Google-Smtp-Source: AGs4zMarKlgutyR6ubTQ+KJdBPbt2wYt0nYrTrKCadNYmGj5oXURKUkNvVDgNb3xMjdJLUP5lg5x/Mi0uJwHBeB/gsw=
X-Received: by 10.159.41.166 with SMTP id s35mr5956336uas.86.1512163378559;
	Fri, 01 Dec 2017 13:22:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.125.150 with HTTP; Fri, 1 Dec 2017 13:22:38 -0800 (PST)
In-Reply-To: <CAMKF1sowNmwhq__dZdYmV8RCuBpyLJKKAenkacLjE7jTR1WAUw@mail.gmail.com>
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
	<CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
	<CAJTo0Lb4VsORo9110=Q8JSgQytcfoHpsRRSTWiJJ_BiPfYxvvA@mail.gmail.com>
	<CAJ86T=UsiK40aCLw-4KeY3LdOCHKXw_r-h2NTwAG7QjA5kQfJQ@mail.gmail.com>
	<CAMKF1sowNmwhq__dZdYmV8RCuBpyLJKKAenkacLjE7jTR1WAUw@mail.gmail.com>
From: Matthew McClintock <msm-oss@mcclintock.net>
Date: Fri, 1 Dec 2017 15:22:38 -0600
Message-ID: <CAEsOVNfMjeT=4zTcO-WcN0VyY_c1326U7qmEPXSuo4+=ukKJHw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Fri, 01 Dec 2017 21:22:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 2:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Dec 1, 2017 at 11:30 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Fri, Dec 1, 2017 at 3:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>> Extend lnr to have a --force option?
>>
>> Is there ever a case where we want lnr to fail if the target already exists?
>>
>> There are plenty of existing examples in oe-core where rm is run
>> before lnr (and in the cases where it's not, it's perhaps just a bug
>> or an oversight).
>>
>> So I think either leave the v1 patch as-is and run rm before lnr in
>> musl do_install as we already do elsewhere, or update lnr so that it
>> unconditionally removes any pre-existing target?
>
> I like Ross'es suggestion to modify lnr implementation as an
> independent patch and
> rebase your patch on top. Maybe a cleanup later to remove all rm cmds
> that are used
> before lnr

Do we keep the lnr filename? Change to ln-python and add -r and -f?

The above question wasn't answered. Should we just always force it and
emit a WARNING if it's being replaced?

-M

