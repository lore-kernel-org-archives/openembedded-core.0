Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 286D473120;
	Thu, 12 Oct 2017 05:01:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id m28so4571380pfi.0;
	Wed, 11 Oct 2017 22:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=C0cnDR5urxSK+wS6kNG9PCNgR0B5pChMl7y1In6KV54=;
	b=rb3H5W19XmzMWP7CKsOb0pQR+VvG58lY2Q0AxOPyjfjPqsN1bYpzxxl/1mG2N+4zTx
	/RyJcZpy+/TqYGwFw4Ocq8O4dl0x8BPwbzCoe/jh4Ta2odizJuMp1yXzi9FqtjL8jsbI
	7oF+sGGqNsS0GhzIQ5PWaRLj3wP4kGr7/IkPbT7WRhsoxOIaO64r6qXiNrR/K3pI7h9O
	v6Ovq9zol9Ho9p8EewdCtaJaiQDpNPsxJ8HXcnNwDt3lHmn11pL339b0xtfCZuEYMFAR
	0lAPj/4KIFN+QWSsXxD4+/GFQ38V2C26JigRW0lM1MDI/XfwSNcwfGk36J0NuMM89RXu
	mOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=C0cnDR5urxSK+wS6kNG9PCNgR0B5pChMl7y1In6KV54=;
	b=Fq+Gb0Z0SLGLX71iYzUojsnrbP78SVobiHoqp8tKl7dV0XlTQOuN13oXYJCpXTNhm5
	g6fFflqQAaSXNwNLmPafou0ttrsNxZcBq71Zb6N2cECcfENLhRmhkVUkg+QuEUcQSZOS
	Ol/WtBn3qsahOT1//0SxuJUnyRiS0x7gENL9l3Q/Pi4zwAiZvi9m1o7F0u1Z/4zHMzpM
	4cO7rZEtkRAjDq9yr97PkF2GNhA4A47L8E2m+GkI4whw1y7cbCKLp8nEGsKpz9uuhdln
	wOCENPA+MJoMIUeaSIyYU0A//cjqriHHj7uHj2AwTvfHx3tLkdGAOUKcCExKRcNpsF9m
	rllQ==
X-Gm-Message-State: AMCzsaWlBLJjxuy1nmA/N9SJtKm3u1S9Tce/5W59Jeu/qq7RoVjbIEWl
	cp4H6uoaQ45Fytqe2DcywUxzsYa2Vd/6lI7F8yY=
X-Google-Smtp-Source: AOwi7QABALP/o6FVlgnKs5EBfzqabxHNhCAQ20X86JZDOJfAzxbyXRbzSdPpZnWjf5NOWeuaqL76WSc2MhgZ/1piZzI=
X-Received: by 10.84.240.12 with SMTP id y12mr1136712plk.215.1507784516003;
	Wed, 11 Oct 2017 22:01:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Wed, 11 Oct 2017 22:01:25 -0700 (PDT)
In-Reply-To: <50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171012015609.GA3832@jama>
	<CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
	<50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Oct 2017 22:01:25 -0700
Message-ID: <CAMKF1sqqx-7PgL7833JVTn87Tdc57+h-Ob7VLfBD4khmpKN+HA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 12 Oct 2017 05:01:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 11, 2017 at 9:32 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:
>> On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org wrote:
>> >> --- a/meta/conf/bitbake.conf
>> >> +++ b/meta/conf/bitbake.conf
>> >> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
>> >>  "
>> >>
>> >>  # Tools needed to run testimage runtime image testing
>> >> -HOSTTOOLS += "ip ping ps scp ssh stty"
>> >> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
>> >
>> > Shouldn't we include at least ssh by default?
>>
>> I would say no, since nothing in OE-Core depends on it. more we
>> abstract from host system better it is.
>
> I'm with Martin on this one, let's not make it painful for people to use
> the SSH protocol in git URLs in their recipes. I don't see much potential
> for host contamination.

Standard distro do not install ssh, if we want to add it here, probably we
should at the same time let user know that he should install ssh

We have had certificate and cypto algorithms issues with openssh based
on host distros, where we have added customized sshd_config and ssh_config,

but, I dont have strong opinion either way

