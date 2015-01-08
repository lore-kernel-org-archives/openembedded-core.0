Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 43A0665D72
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 16:40:39 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id x3so2875306qcv.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/twmE3KAJ8K7oQXiMKvFaNFU8l4q5+MqeGYUkMOWjgA=;
	b=V1uzrjYjUgP5WK7xS1/UevCmmgz/em8AJKjcDtozf/C4S+c5zYFxerx0vxC4R39gu7
	Op4WOJLsgOOUjaEh+0Rct8rDU8LHEivdA9i8flfw8cpnhKHTbHXGgedSSXg1plQ+YL+4
	0/kgzy1ijrqk2ToabagRt0FS8Y+/vjvjFoPZTVAQOdjm3kbvWm2JJmsCRJUBpLsoc8nN
	eJDTm0pfVJsjTdAP3RGKUA8OGnXnPHAXseHQE3quGcEz5XG2z163TD1en6OL2w3ltpId
	f6026jPpfnzq+tYx2Ik8w0d8lby7uF/l0rJES1DQllW76P+qkMr0chF8/0EDLBJcodtj
	a00Q==
X-Received: by 10.224.50.209 with SMTP id a17mr7497531qag.96.1420735238490;
	Thu, 08 Jan 2015 08:40:38 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:10d:1c10:bb0:ae2b?
	([2601:9:3580:84c:10d:1c10:bb0:ae2b])
	by mx.google.com with ESMTPSA id u20sm4445439qaj.5.2015.01.08.08.40.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Jan 2015 08:40:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56832778.XUIYBB79do@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 8 Jan 2015 08:40:35 -0800
Message-Id: <A4B52F1A-F782-4EE0-B4E3-8E007AC38BCE@gmail.com>
References: <1420622709.25779.60.camel@linuxfoundation.org>
	<1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
	<56832778.XUIYBB79do@peggleto-mobl5.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1993)
Cc: yocto <yocto@yoctoproject.org>, openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 08 Jan 2015 16:40:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Jan 8, 2015, at 2:01 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Wednesday 07 January 2015 16:36:37 Khem Raj wrote:
>>> On Jan 7, 2015, at 1:25 AM, Richard Purdie
>>> <richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> I was informed on irc yesterday that bug reports are hard and that
>>> debugging via irc is easier. I think I need to remind people why =
good
>>> bug reports are important and how they do actually help immensely.
>>>=20
>>> I do actually believe that not everything has to have bug report. If =
you
>>> mention an issue, someone says "hey, I know how to fix that" and =
sends a
>>> patch out, a bug report is wasted overhead IMO. I know some =
programme
>>> managers who disagree strongly with me and would suggest *every* =
bugfix
>>> commit should have a defect tracking item. We're not going there I
>>> understand the idea, its not practical.
>>>=20
>>> That said, if its not immediately clear what the problem is, it =
should
>>> become a bug report. Why?
>>>=20
>>> Firstly, the random selection of people on irc at the time probably
>>> aren't the right people to fix it. Telling those people to read 48 =
hours
>>> of irc log for the details is disrespectful of their time.
>>>=20
>>> It also happens that the first people referred to a bug may not be =
the
>>> person who actually can fix it. If someone else needs to come to a =
bug,
>>> having a summary of the issue, the salient facts and the current =
status
>>> is immensley useful for handover.
>>>=20
>>> As a case in point, I tried to debug a qt4 build failure yesterday =
for
>>> which there is no bug report. I lost hours building the wrong =
things,
>>> experimenting to try and find the reproducer steps and generally =
chasing
>>> my tail, losing the autobuilder log of the failure, the name of the =
qt4
>>> recipe that was failing (which task was it again?) and so on.
>>>=20
>>> I do now have a set of reproducer steps, its quite simple:
>>>=20
>>> MACHINE=3Dimx53qsb bitbake virtual/kernel
>>> MACHINE=3Dimx53qsb bitbake virtual/kernel -c clean
>>> MACHINE=3Dimx53qsb bitbake qt4-x11-free
>>>=20
>>> I also have a patch. Where should I share them? How do I ensure =
everyone
>>> with an interest in this defect actually gets the patch? Sure I can
>>> create email and send to the people who I think need to know. The
>>> bugzilla lets interested parties add themselves to bugs though.
>>>=20
>>> I should also note that QA actually go through bugs in the bugzilla,
>>> including closed ones, looking for test cases. We're not great at =
this
>>> yet but it does happen. If there is a well documented test case like
>>> that above, we might write an automated QA test for it. Having it
>>> documented is therefore a good thing.
>>>=20
>>> I do appreciate writing a bug report is hard, especially if you =
don't
>>> know where the problem is, or how to reproduce it exactly. It takes =
time
>>> and effort. You can however document what you know and discussion =
can
>>> happen in a common place to figure out how to reproduce it. I do =
except
>>> the submitters to fully understand the bug, if they did they'd =
probably
>>> write a patch instead.
>>>=20
>>> So fair warning, I am going to start ignoring things on irc and ask =
for
>>> bug numbers in future, assuming something isn't a 5 minute fix with =
an
>>> immediate patch. I will back and encourage anyone else doing this =
too.
>>=20
>> What about developer mailing lists ?. isn=E2=80=99t it also a way to =
report problems
>> via emails after all we use emails for patch work flow. Not all =
people
>> working with OE-Core e.g. might be following yocto bugzilla
>=20
> Mailing lists are great for discussion (e.g. "I have this problem but =
I'm not=20
> sure of the right way to solve it") but a terrible way to track actual =
bugs,=20
> because mailing lists tend to concentrate on the latest postings; =
older issues=20
> that haven't been resolved rapidly disappear with the tide of new =
postings. Of=20
> course old issues can build up in a bug tracker, but at least it's =
trivially=20
> easy to find open issues where it's much more difficult to find =
unresolved issues=20
> on a mailing list.
>=20
> The point is, the best way to ensure that an issue gets solved at =
least for=20
> OE-Core is to file a bug in the YP bugzilla. There is then a triage =
process and=20
> in most cases someone to actually assign the issue to so that it can =
be dealt=20
> with. There is no such process on the mailing lists.

for a user perspective
when I try to google for any issue, first hits are not bugzilla, but the =
ml discussions
I am just saying all different ways for reporting issues should be =
encouraged. Now if someone
wants to turn it into a bugzilla entry thats good.

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


