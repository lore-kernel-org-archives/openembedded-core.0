Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDF1C28B28
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 07:40:18 +0000 (UTC)
Subject: Re: [PATCH] kernel-module-split: fix conf file generation when KERNEL_SPLIT_MODULES=0
To: openembedded-core@lists.openembedded.org
From: "Dixit Parmar" <dixitparmar19@gmail.com>
X-Originating-Location: IN (1.7.171.2)
X-Originating-Platform: Windows Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 00:40:16 -0700
References: <20250317142422.GA20712@localhost>
In-Reply-To: <20250317142422.GA20712@localhost>
Message-ID: <12461.1742370016392631451@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Rdgu8UL7qnr3IYZexwpO"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213266

--Rdgu8UL7qnr3IYZexwpO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 07:54 PM, Trevor Woerner wrote:

>=20
> On Sun 2025-03-16 @ 01:16:47 AM, Dixit Parmar via lists.openembedded.org
> wrote:
>=20
>> Can you show the conf files for the same kernel configuration
>> with and without the kernel_split_modules enabled ? That way
>> we know there's no change in existing behaviour.
>>=20
>>> I have confirmed that in my testing. Can you suggest how I can
>>=20
>> share that information here?
>=20
> What data are you expecting to find, and where are you expecting to find
> it, that prompted this fix? I assume that in one case there will be
> information/files populated in the image's /etc/modprobe.d and in the
> other
> case (the buggy case) that isn't happening? Or is there something else?
>=20
> Can you provide complete instructions and/or your configuration
> demonstrating
> the problem occurring before your fix, and the problem being solved by
> your
> fix? Simply enabling KERNEL_SPLIT_MODULES by itself won't show anything
> unless
> the user is trying to enable some module(s) too.
>=20
> I found that I had to go read the bugzilla report to better understand th=
e
>=20
> issue and potentially how to show it occurring. Keep the reference to the
> bugzilla, but ideally the commit message would have all the necessary
> information to understand and reproduce the issue.

Yeah. I shall add the issue reproduction configuration, and overview of the=
 fix in the next patchset v2. Do you see any other code changes that are re=
quired? so I can take it in the next set of changes.

>=20
>=20
>> We also should make a test for this in the OE selftests. We
>> are adding conditional code paths, so they should be tested
>> to ensure no regressions in either in the future.
>>=20
>>> Never done that before. May be I can do it given some direction
>>=20
>> as separate patch.
>> I'm curious about the above line. It is unclear to me why we'd
>> only have this postinst be relevant if none was previously set.
>>=20
>>> Reverted.
>>=20
>> Is there really a scenario where the directory won't exist ? Isn't
>> this just running in our own install phase ? So all prerequisites
>> and directories should be in place.
>>=20
>>> Ideally no, we kept it for safer side, I have added log warning.
>>=20
>> The walking and sorting seems quite heavy. =C2=A0Isn't this called from
>> do_split_packages indirectly ?
>> Do we really need to walk and gather the information ? Is this mainly fo=
r
>> the case of no-split
>> on the kernel modules ? If that is the case, isn't there a way to short
>> circuit the processing
>> on the split-package case ?
>>=20
>>> Litterally I could not think of anything else here and not sure of ther=
e
>>=20
>> are any short-circuit options. I have limited knowledge in this. I am op=
en
>> to suggestions
>> if this is not the best solution at the moment.
>=20
> It is customary that quoted text have the start-of-line ">" symbols (the
> more
> symbols, the further back in history the comment) and that replies not
> have
> any start-of-line character, as I'm doing here. Your email program should
> have
> an option to do this automatically.

As you might have rightly assumed, I am a newbie so figuring out this stuff=
, I hope you understand.

~Dixit

--Rdgu8UL7qnr3IYZexwpO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Mar 17, 2025 at 07:54 PM, Trevor Woerner wrote:</div>
<div>
<blockquote>On Sun 2025-03-16 @ 01:16:47 AM, Dixit Parmar via lists.openemb=
edded.org wrote:<br />
<blockquote>Can you show the conf files for the same kernel configuration<b=
r />with and without the kernel_split_modules enabled ? That way<br />we kn=
ow there's no change in existing behaviour.<br />
<blockquote>I have confirmed that in my testing. Can you suggest how I can<=
/blockquote>
share that information here?</blockquote>
What data are you expecting to find, and where are you expecting to find<br=
 />it, that prompted this fix? I assume that in one case there will be<br /=
>information/files populated in the image's /etc/modprobe.d and in the othe=
r<br />case (the buggy case) that isn't happening? Or is there something el=
se?<br /><br />Can you provide complete instructions and/or your configurat=
ion demonstrating<br />the problem occurring before your fix, and the probl=
em being solved by your<br />fix? Simply enabling KERNEL_SPLIT_MODULES by i=
tself won't show anything unless<br />the user is trying to enable some mod=
ule(s) too.<br /><br />I found that I had to go read the bugzilla report to=
 better understand the<br />issue and potentially how to show it occurring.=
 Keep the reference to the<br />bugzilla, but ideally the commit message wo=
uld have all the necessary<br />information to understand and reproduce the=
 issue.</blockquote>
</div>
<div>Yeah. I shall add the issue reproduction configuration, and overview o=
f the fix in the next patchset v2. Do you see any other code changes that a=
re required? so I can take it in the next set of changes.&nbsp;</div>
<div><br />
<blockquote>
<blockquote>We also should make a test for this in the OE selftests. We<br =
/>are adding conditional code paths, so they should be tested<br />to ensur=
e no regressions in either in the future.<br />
<blockquote>Never done that before. May be I can do it given some direction=
</blockquote>
as separate patch.<br />I'm curious about the above line. It is unclear to =
me why we'd<br />only have this postinst be relevant if none was previously=
 set.<br />
<blockquote>Reverted.</blockquote>
Is there really a scenario where the directory won't exist ? Isn't<br />thi=
s just running in our own install phase ? So all prerequisites<br />and dir=
ectories should be in place.<br />
<blockquote>Ideally no, we kept it for safer side, I have added log warning=
.</blockquote>
The walking and sorting seems quite heavy. &nbsp;Isn't this called from do_=
split_packages indirectly ?<br />Do we really need to walk and gather the i=
nformation ? Is this mainly for the case of no-split<br />on the kernel mod=
ules ? If that is the case, isn't there a way to short circuit the processi=
ng<br />on the split-package case ?<br />
<blockquote>Litterally I could not think of anything else here and not sure=
 of there</blockquote>
are any short-circuit options. I have limited knowledge in this. I am open =
to suggestions<br />if this is not the best solution at the moment.</blockq=
uote>
It is customary that quoted text have the start-of-line "&gt;" symbols (the=
 more<br />symbols, the further back in history the comment) and that repli=
es not have<br />any start-of-line character, as I'm doing here. Your email=
 program should have<br />an option to do this automatically.</blockquote>
</div>
<div>As you might have rightly assumed, I am a newbie so figuring out this =
stuff, I hope you understand.</div>
<div>&nbsp;</div>
<div>~Dixit</div>

--Rdgu8UL7qnr3IYZexwpO--

