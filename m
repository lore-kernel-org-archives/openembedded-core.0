Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QKq10-0000gf-SI
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 12:54:39 +0200
Received: by pzk36 with SMTP id 36so1167737pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 03:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=9qzT7Ag1Oe+CO8lMtpFLWdBAu25wQTmR6SvUHNkmCoU=;
	b=IQSSaJKl8UVNkuyVy99LLtExjzH0gn8YGjO0mWjhC2rhm4R0oB3QEyzuRXuIxZYMxN
	Ywz6Lj1hXOyJ0sadEVsJ2HihXhsdh2E2JNdXSGxSo7H1wtSL8a6CPcURNlHTrn7stcgN
	mWCS9bnPHFZoOra+z8Cwc55qKzAWkMVGGF+Nk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MvL6FjUKacdb5uhvSa1GP7lai7+B1L1BJZm3g6Nq3BppjpqGIPnn4AcZtjdfvzu0a9
	0CcKRvE38F0YAcDXhw7QQ8lMbEAkhjqLqrTPVNVaEBFY1T3OKWSmv6JK/Ks77kVgSIjO
	0rn4T2NPeUsx9SwB7W+l1ksKTRClL37u5whVQ=
MIME-Version: 1.0
Received: by 10.68.63.99 with SMTP id f3mr135764pbs.471.1305283908617; Fri, 13
	May 2011 03:51:48 -0700 (PDT)
Received: by 10.68.52.232 with HTTP; Fri, 13 May 2011 03:51:48 -0700 (PDT)
In-Reply-To: <1305283559.19606.42.camel@rex>
References: <cover.1305109178.git.leon@sidebranch.com>
	<687fb20407ee32261a840c9e475b489319d8ee62.1305109178.git.leon@sidebranch.com>
	<BANLkTi=C-5rjKtd0675Y70VX+g4MdL64Uw@mail.gmail.com>
	<BANLkTi=zwa4m050EcKkSp_KV8LOUYQK67g@mail.gmail.com>
	<1305283559.19606.42.camel@rex>
Date: Fri, 13 May 2011 12:51:48 +0200
Message-ID: <BANLkTi=DyLtRApjkRYkyqsXJMHmvfDuRWg@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] siteinfo.bbclass: Add powerpc-linux-gnuspe.
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
X-List-Received-Date: Fri, 13 May 2011 10:54:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Richard,

On Fri, May 13, 2011 at 12:45 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-05-13 at 12:28 +0200, Leon Woestenberg wrote:
>> On Fri, May 13, 2011 at 5:50 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> > you need to rebase this patch on latest oe-core
>> >
>> Yes, I was using oe-core-contrib/master as a base, wrongly assuming
>> that that is the correct base for -contrib fixes/additions.
>
> To be fair when you wrote the patch, the conflicting distro changes were
> not in either branch so in that case it didn't matter.
>
> It was easier to take the distro changes and fix this up than the other
> way around though.
>
It takes a while before I will git it all,

Thanks for the patience and help,
-- 
Leon


