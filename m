Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UW4P6-00058Z-Oz
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 14:39:29 +0200
Received: by mail-ea0-f171.google.com with SMTP id b10so1125032eae.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 05:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=eorS1Lo3NiLAzt+RW8PRwy6KIkxgQe6J9bjfnVe8kg0=;
	b=FRqf1AFMuLBzNBldtO3J8uT1+Z+lPmSIQo/9IeozwXr0pEMzEHdQ6Ta1J8FL9A9JMB
	HZ3pYcbG3I/XfsE7+sI9PfAzret9BX7Utp5W1kImYu50JyLD3JihwVlNCjph8UMdT5Kr
	9EoE/1CviwFpmFM330KeOrlbymbI3Hrfai+1wGb0QAZIszXWYU1h3tDUFsvMdVfTEbjp
	NFc8AHxHdxZ+8lu56UMnddxcqYrPVIROnaJN/pd6VVLJoUkwThkB45lN1RbBnPtjQQLb
	wbvofow3IeCcjXjPWLvnk/qUeVTd/bZLokxuHJoi+s08OpXOoL1sDHLhBSbdxLQVeoTE
	7Fkw==
X-Received: by 10.15.36.2 with SMTP id h2mr99547050eev.2.1367065274571;
	Sat, 27 Apr 2013 05:21:14 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id cd3sm21541632eeb.6.2013.04.27.05.21.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 05:21:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1367057955.29677.99.camel@ted>
Date: Sat, 27 Apr 2013 14:21:12 +0200
Message-Id: <0423C450-C7D9-4D8B-B787-315815458F98@dominion.thruhere.net>
References: <5E6BBD57-21F8-4282-97F0-567ACFB008CD@dominion.thruhere.net>
	<1367057955.29677.99.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQla5kzeBYFagFLVZuOGg0TMdgo34+EqKkey8DfujSi0iHV2jyN22/NtXoIqWUtJC1P98FS3
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Annoyances with dylan
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 12:39:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 apr. 2013, om 12:19 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2013-04-26 at 16:47 +0200, Koen Kooi wrote:
>> Hi,
>>=20
>> I have 2 big annoyances with dylan:
>>=20
>> 1) Multimachine builds trigger spurious warnings:
>>=20
>> WARNING: The recipe bonescript is trying to install files into a =
shared area when those files already exist. Those files and their =
manifest location are:
>>   /build/v2013.06/deploy/eglibc/licenses/bonescript/LICENSE
>>   /build/v2013.06/deploy/eglibc/licenses/bonescript/generic_MIT
>>=20
>> I get that every time after switching machines for each =
recipe/license.
>=20
> This sounds like a symptom of a deeper problem. At a guess bonescript
> has some machine specific element in it but its not marked as machine
> specific and hence the system is getting confused.

Nope, it seems to happen for 'generic' recipes as well, this one was =
just the bottom one in my console scollbacl

> Do you have a list of
> the recipes/licenses that are showing this? It is just license issues?

=46rom what I can see it's every recipe, and it's just the licenses.

>> 2) PRSERV makes things go backwards:
>>=20
>> ERROR: Package version for package gadget-init-network went backwards =
which would break package feeds from (0:1.0-r19.3 to 0:1.0-r19.0)
>>=20
>> To trigger 2) I updated meta-linaro and switches meta-minnow to the
>> new rebased branch, delete $TMPDIR (prserv db is outside out TMPDIR)
>> and started building images. I only happens for some recipes, not =
all.
>> I can't deduce a pattern or easily reproduce it. Bug filed some =
months
>> ago.
>=20
> IIRC we looked into that bug quite extensively and couldn't find a way
> to reproduce it. If we want to get it fixed, we're going to need some
> help distilling it down to a simpler test case to reproduce so we can
> understand the issue, then we can look at fixing it.

I guess I should start putting the prserv sqlite db under git control :/=


