Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QWBjA-0007Hi-FA
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 20:19:08 +0200
Received: by yib18 with SMTP id 18so901005yib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 11:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=1m9QvQx7SYkInSz3lPREbAx4H2RG98W/RW7T0EArZHE=;
	b=Q1c8PWw71hsjd2SLOHn4zbWd6OvKyc7nfZjF+N4H327uhD2kN0lNY1HTYfI2mPgLTk
	QUefh3OIipG4o/0uV72OKAG0L8RZAKdtmpMfWkNtuUfRPba5wy/RtxN9J8nwSNp/gw21
	kfjOW2Tuqmw+IXihc7T0517cRVldhycnIsZeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Dh5Nj6PVcbRe9Y4d+d6drlh24GYdDphncggHTRvRiZcnv0Yrg6tY+7ArpKmCPXaoIQ
	B6kgDyIxU/PALXaL5PkD9E69RxgPyU8mauhSpUcV/7CMwveT9jltKKItxcVVjML8r8y2
	pySQ567xywtO7tZ4O9eJFPASF8aU7++jolJcU=
MIME-Version: 1.0
Received: by 10.91.72.1 with SMTP id z1mr6505433agk.78.1307988943520; Mon, 13
	Jun 2011 11:15:43 -0700 (PDT)
Received: by 10.90.96.1 with HTTP; Mon, 13 Jun 2011 11:15:43 -0700 (PDT)
In-Reply-To: <09A32280-131B-4201-8E32-AFA6A6FD78CA@dominion.thruhere.net>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
	<BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
	<09A32280-131B-4201-8E32-AFA6A6FD78CA@dominion.thruhere.net>
Date: Mon, 13 Jun 2011 14:15:43 -0400
Message-ID: <BANLkTinpbdMW=QZL-qtvD+SsThB2qdyNGQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Mon, 13 Jun 2011 18:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2011 at 11:47 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 13 jun 2011, om 17:33 heeft Otavio Salvador het volgende geschreven:
>
>> 2011/6/13 Yu, Ke <ke.yu@intel.com>:
>> ...
>>> =A0 =A0Combo layer tool provides three functionalities:
>>> =A0 =A0- init: when the combo layer repo and component repo is not exis=
ted,
>>> =A0 =A0 =A0init will "git init" the combo layer repo, and also "git clo=
ne" the
>>> =A0 =A0 =A0component repo
>>
>> I think it is duplicating many features of git submodule. It seems
>> more logical to put a script above git submodule rather then use a
>> full repository for it.
>>
>> Am I missing anything?
>
> The fact that git submodules:
>
> a) universally suck
> b) behave wildly different between git versions
>
> The first version of the angstrom setup scripts used git submodules, but =
I quickly found that I as well as my
> coworkers are too stupid to deal with them properly, so we wrote an awk s=
cript to manage the layers. It's a red
> flag that only very recent git versions have the 'git clone --recursive' =
feature. It shows that git developers are either
> really, really disciplined or don't use submodules themselves.

Anyone that knows me, knows that I'd second Koen's description of submodule=
s.
On paper they sounds good, but in practice, you quickly find the issues whe=
n
dealing with them. So if there is some duplication with git submodules, I'd=
 see
that as an acceptable trade off if the end result is something manageable.

Cheers,

Bruce

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


