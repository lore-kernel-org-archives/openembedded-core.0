Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6199B72AED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 17:06:13 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id pv20so10243334lab.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=+m4+ulpZYuaEQ1LAgzlVCoXqC2O/wImyYjggRzgCAYU=;
	b=rXOftL43g5BiBOFk5uG/hoFx3vIJLqvMnOTpBri91vQh70IKGGkMyhbIOEItJVzrJX
	+g1qyeuMyile5Q+EDW5SmUQNa8gpdpzpiTuJEv3pWdcpZBnmVukaeEsaBn1wQk90i2DO
	Pq3CLaEi3B1c4XyZjoH2VPxCLFgi8TwCAAGqFHjSCwWGL1nsJWEq/d6tmMM+WnTO+Ik2
	75hhZVFml6jGJuWzscqfzCeNPSSXgSEO0tZDeHAeCCCl4XmTwW6LHiWLJrT2xWW56lWC
	nPifXe2LuQS+3CjXCphB1lUt+HLpVteCYTr7LQBPE0B6HRtOpkl4Ibco2B+pJshJ31vC
	1iQg==
MIME-Version: 1.0
X-Received: by 10.112.134.74 with SMTP id pi10mr14832490lbb.67.1420736392392; 
	Thu, 08 Jan 2015 08:59:52 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 8 Jan 2015 08:59:52 -0800 (PST)
In-Reply-To: <A4B52F1A-F782-4EE0-B4E3-8E007AC38BCE@gmail.com>
References: <1420622709.25779.60.camel@linuxfoundation.org>
	<1D92EEB7-710A-4923-9AB0-FEC6A3D884FB@gmail.com>
	<56832778.XUIYBB79do@peggleto-mobl5.ger.corp.intel.com>
	<A4B52F1A-F782-4EE0-B4E3-8E007AC38BCE@gmail.com>
Date: Thu, 8 Jan 2015 11:59:52 -0500
Message-ID: <CADkTA4MVZir6UMdfAoABSh5TgmiMLa3sQMKE3YRiWefQuQh7UA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, yocto <yocto@yoctoproject.org>
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
X-List-Received-Date: Thu, 08 Jan 2015 17:06:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2015 at 11:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 8, 2015, at 2:01 AM, Paul Eggleton <paul.eggleton@linux.intel.com=
> wrote:
>>
>> On Wednesday 07 January 2015 16:36:37 Khem Raj wrote:
>>>> On Jan 7, 2015, at 1:25 AM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>
>>>> I was informed on irc yesterday that bug reports are hard and that
>>>> debugging via irc is easier. I think I need to remind people why good
>>>> bug reports are important and how they do actually help immensely.
>>>>
>>>> I do actually believe that not everything has to have bug report. If y=
ou
>>>> mention an issue, someone says "hey, I know how to fix that" and sends=
 a
>>>> patch out, a bug report is wasted overhead IMO. I know some programme
>>>> managers who disagree strongly with me and would suggest *every* bugfi=
x
>>>> commit should have a defect tracking item. We're not going there I
>>>> understand the idea, its not practical.
>>>>
>>>> That said, if its not immediately clear what the problem is, it should
>>>> become a bug report. Why?
>>>>
>>>> Firstly, the random selection of people on irc at the time probably
>>>> aren't the right people to fix it. Telling those people to read 48 hou=
rs
>>>> of irc log for the details is disrespectful of their time.
>>>>
>>>> It also happens that the first people referred to a bug may not be the
>>>> person who actually can fix it. If someone else needs to come to a bug=
,
>>>> having a summary of the issue, the salient facts and the current statu=
s
>>>> is immensley useful for handover.
>>>>
>>>> As a case in point, I tried to debug a qt4 build failure yesterday for
>>>> which there is no bug report. I lost hours building the wrong things,
>>>> experimenting to try and find the reproducer steps and generally chasi=
ng
>>>> my tail, losing the autobuilder log of the failure, the name of the qt=
4
>>>> recipe that was failing (which task was it again?) and so on.
>>>>
>>>> I do now have a set of reproducer steps, its quite simple:
>>>>
>>>> MACHINE=3Dimx53qsb bitbake virtual/kernel
>>>> MACHINE=3Dimx53qsb bitbake virtual/kernel -c clean
>>>> MACHINE=3Dimx53qsb bitbake qt4-x11-free
>>>>
>>>> I also have a patch. Where should I share them? How do I ensure everyo=
ne
>>>> with an interest in this defect actually gets the patch? Sure I can
>>>> create email and send to the people who I think need to know. The
>>>> bugzilla lets interested parties add themselves to bugs though.
>>>>
>>>> I should also note that QA actually go through bugs in the bugzilla,
>>>> including closed ones, looking for test cases. We're not great at this
>>>> yet but it does happen. If there is a well documented test case like
>>>> that above, we might write an automated QA test for it. Having it
>>>> documented is therefore a good thing.
>>>>
>>>> I do appreciate writing a bug report is hard, especially if you don't
>>>> know where the problem is, or how to reproduce it exactly. It takes ti=
me
>>>> and effort. You can however document what you know and discussion can
>>>> happen in a common place to figure out how to reproduce it. I do excep=
t
>>>> the submitters to fully understand the bug, if they did they'd probabl=
y
>>>> write a patch instead.
>>>>
>>>> So fair warning, I am going to start ignoring things on irc and ask fo=
r
>>>> bug numbers in future, assuming something isn't a 5 minute fix with an
>>>> immediate patch. I will back and encourage anyone else doing this too.
>>>
>>> What about developer mailing lists ?. isn=E2=80=99t it also a way to re=
port problems
>>> via emails after all we use emails for patch work flow. Not all people
>>> working with OE-Core e.g. might be following yocto bugzilla
>>
>> Mailing lists are great for discussion (e.g. "I have this problem but I'=
m not
>> sure of the right way to solve it") but a terrible way to track actual b=
ugs,
>> because mailing lists tend to concentrate on the latest postings; older =
issues
>> that haven't been resolved rapidly disappear with the tide of new postin=
gs. Of
>> course old issues can build up in a bug tracker, but at least it's trivi=
ally
>> easy to find open issues where it's much more difficult to find unresolv=
ed issues
>> on a mailing list.
>>
>> The point is, the best way to ensure that an issue gets solved at least =
for
>> OE-Core is to file a bug in the YP bugzilla. There is then a triage proc=
ess and
>> in most cases someone to actually assign the issue to so that it can be =
dealt
>> with. There is no such process on the mailing lists.
>
> for a user perspective
> when I try to google for any issue, first hits are not bugzilla, but the =
ml discussions
> I am just saying all different ways for reporting issues should be encour=
aged. Now if someone
> wants to turn it into a bugzilla entry thats good.

For reporting an issue and discussing it, I don't disagree that something c=
an
happen on the mailing list.

But if the reporter wants serious time spent on a bug (or I should say that=
 the
fix for the bug is something that will take more than a few minutes),
I think it is
reasonable to expect that the reporter (not the person working on the bug) =
takes
the responsibility to get it into the bug tracker.

Assigning and scoping the actual work doesn't scale based on email threads
(as someone who has been thrashing to keep information straight, and reprod=
uce
issues .. I feel this pain greatly).

Just my frozen 2 canadian cents! :)

Bruce


>
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

