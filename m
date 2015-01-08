Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE57D72ACC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 00:36:39 +0000 (UTC)
Received: by mail-qc0-f169.google.com with SMTP id w7so1804536qcr.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 16:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/efBB1m78KBASgXDmPgfmajRRwFAL5j9MUH4ZTxHbcE=;
	b=JB3IKJQ70NQ3vmOcfQJGVj0Dl59MsRhEqbdbV60TZzhIoyAP1CZtC0O5ayEvcyf69u
	cFSK+SF+gGOCpOtBSEUntvUTLD1HzmNU8ftITCcXXhHJGI5N9IGlFzhNq2F3fM29vj/s
	kfuun3/Emblfgdz7JIVEbN1wBgmgQzQTiUFL5RJ9oHwPI3IJ6Xd1rvsFTucvTf1DROgj
	lQNukzTx2oUennV4fM1c/QZdCa+Q0bWFJAlgJvtpAuOtCU8rMpHsRKB/6NVsLAwX6SjA
	G/HH3NqX/cuvR5xlR2v2jXGjMxBANfilpNHkgkf7x4LxMznosfrZ+1YpXLDYkscqA1lO
	d/ig==
X-Received: by 10.224.137.65 with SMTP id v1mr9783810qat.95.1420677400279;
	Wed, 07 Jan 2015 16:36:40 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:309d:3246:9ece:a635?
	([2601:9:3580:84c:309d:3246:9ece:a635])
	by mx.google.com with ESMTPSA id h6sm2606098qgh.32.2015.01.07.16.36.38
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Jan 2015 16:36:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1420622709.25779.60.camel@linuxfoundation.org>
Date: Wed, 7 Jan 2015 16:36:37 -0800
Message-Id: <1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
References: <1420622709.25779.60.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1993)
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Bug reporting and good bug reports
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
X-List-Received-Date: Thu, 08 Jan 2015 00:36:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 7, 2015, at 1:25 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> I was informed on irc yesterday that bug reports are hard and that
> debugging via irc is easier. I think I need to remind people why good
> bug reports are important and how they do actually help immensely.
>=20
> I do actually believe that not everything has to have bug report. If =
you
> mention an issue, someone says "hey, I know how to fix that" and sends =
a
> patch out, a bug report is wasted overhead IMO. I know some programme
> managers who disagree strongly with me and would suggest *every* =
bugfix
> commit should have a defect tracking item. We're not going there I
> understand the idea, its not practical.
>=20
> That said, if its not immediately clear what the problem is, it should
> become a bug report. Why?
>=20
> Firstly, the random selection of people on irc at the time probably
> aren't the right people to fix it. Telling those people to read 48 =
hours
> of irc log for the details is disrespectful of their time.
>=20
> It also happens that the first people referred to a bug may not be the
> person who actually can fix it. If someone else needs to come to a =
bug,
> having a summary of the issue, the salient facts and the current =
status
> is immensley useful for handover.
>=20
> As a case in point, I tried to debug a qt4 build failure yesterday for
> which there is no bug report. I lost hours building the wrong things,
> experimenting to try and find the reproducer steps and generally =
chasing
> my tail, losing the autobuilder log of the failure, the name of the =
qt4
> recipe that was failing (which task was it again?) and so on.
>=20
> I do now have a set of reproducer steps, its quite simple:
>=20
> MACHINE=3Dimx53qsb bitbake virtual/kernel
> MACHINE=3Dimx53qsb bitbake virtual/kernel -c clean
> MACHINE=3Dimx53qsb bitbake qt4-x11-free
>=20
> I also have a patch. Where should I share them? How do I ensure =
everyone
> with an interest in this defect actually gets the patch? Sure I can
> create email and send to the people who I think need to know. The
> bugzilla lets interested parties add themselves to bugs though.
>=20
> I should also note that QA actually go through bugs in the bugzilla,
> including closed ones, looking for test cases. We're not great at this
> yet but it does happen. If there is a well documented test case like
> that above, we might write an automated QA test for it. Having it
> documented is therefore a good thing.
>=20
> I do appreciate writing a bug report is hard, especially if you don't
> know where the problem is, or how to reproduce it exactly. It takes =
time
> and effort. You can however document what you know and discussion can
> happen in a common place to figure out how to reproduce it. I do =
except
> the submitters to fully understand the bug, if they did they'd =
probably
> write a patch instead.
>=20
> So fair warning, I am going to start ignoring things on irc and ask =
for
> bug numbers in future, assuming something isn't a 5 minute fix with an
> immediate patch. I will back and encourage anyone else doing this too.

What about developer mailing lists ?. isn=E2=80=99t it also a way to =
report problems via emails after all
we use emails for patch work flow. Not all people working with OE-Core =
e.g. might be following yocto bugzilla



