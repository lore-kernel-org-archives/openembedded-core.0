Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2UXs-000695-AH
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 21:20:44 +0100
Received: by fxm19 with SMTP id 19so7913991fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 13:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=bDYunGmNI6xnqeHUbPswxroDVBhrymxXklv5vxvHbSk=;
	b=xPxjM4xNW6DlT82joxMSnjkTLHK+wT2UyQAfWACiVF64+8L1w85EKmmnNEh3xnMjVL
	urlv+mRIjwuUlzW47+mPdIlYVlerKYmg7tys0TAvfF6HA4QSp2qaNwbxo+k/7lkR2UFJ
	fM2NFLif2nHSQKUBKqtIVk504qEjnVHTbXoDY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=aaiHFSXhn+nlkUgmjr6lI99VTr6oegIAgxlJtvhWg1PwhxGKxIYm5YawN9ZoBc157T
	VEwNG6IuWws+QHJsB7OWhu5DyyqyhGzwv798+quFBDJhZ9X8UnfyhKvawRQxDneXv/kT
	pUV+XvBk4NiIfZ5WPATFhnj8GoucT4HRIUDkc=
Received: by 10.223.78.138 with SMTP id l10mr5636647fak.106.1300911532711;
	Wed, 23 Mar 2011 13:18:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Wed, 23 Mar 2011 13:17:29 -0700 (PDT)
In-Reply-To: <21BA7A9E-9AB1-493C-96BE-4B600FBFB125@dominion.thruhere.net>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
	<20110322184459.GE26336@sakrah.homelinux.org>
	<32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
	<20110322221814.GA13076@sakrah.homelinux.org>
	<B073FF3E-7CE1-4FAF-99B4-3ED5832954CD@dominion.thruhere.net>
	<AANLkTimhEBgbMP8OrgVavchhHgjKrtpS2CKzFzC8wuUW@mail.gmail.com>
	<1300894880.3018.8.camel@rex>
	<21BA7A9E-9AB1-493C-96BE-4B600FBFB125@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 13:17:29 -0700
Message-ID: <AANLkTi=xADqvPxkLNS2a8hF0gXt1ejdM9-QWXq9S6keC@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: MIPS rootfs creation failure
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
X-List-Received-Date: Wed, 23 Mar 2011 20:20:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 8:43 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 23 mrt 2011, om 16:41 heeft Richard Purdie het volgende geschreven:
>
>> On Wed, 2011-03-23 at 08:17 -0700, Khem Raj wrote:
>>> On Wed, Mar 23, 2011 at 12:16 AM, Koen Kooi <koen@dominion.thruhere.net=
> wrote:
>>>>
>>>> Op 22 mrt 2011, om 23:18 heeft Khem Raj het volgende geschreven:
>>>>
>>>>> On (22/03/11 19:54), Koen Kooi wrote:
>>>>>>
>>>>>> Op 22 mrt 2011, om 19:44 heeft Khem Raj het volgende geschreven:
>>>>>>
>>>>>>> On (22/03/11 19:42), Koen Kooi wrote:
>>>>>>>>
>>>>>>>> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
>>>>>>>>
>>>>>>>>> Hi
>>>>>>>>>
>>>>>>>>> I did an update of oe-core yesterday and now mips is failing with=
 this
>>>>>>>>> error. It was not there 2 days back.
>>>>>>>>>
>>>>>>>>> | Configuring sysvinit.
>>>>>>>>> | Collected errors:
>>>>>>>>> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following =
dependencies
>>>>>>>>> for task-base:
>>>>>>>>> | =C2=A0* =C2=A0 =C2=A0kernel-misc *
>>>>>>>>> | =C2=A0* opkg_install_cmd: Cannot install package task-base.
>>>>>>>>> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
>>>>>>>>>
>>>>>>>>> I have not bisected but if anyone else is seeing it I would like =
to know
>>>>>>>>
>>>>>>>> I think thats fallout from the kernel.bbclass change:
>>>>>>>>
>>>>>>>> meta/classes/kernel.bbclass:FILES_kernel-misc =3D "/kernel/include=
/config /kernel/scripts /kernel/drivers/crypto /kernel
>>>>>>>>
>>>>>>>> I don't know what purpose that package has, but try rebuilding the=
 kernel and see what happens. We might need to blacklist it from being incl=
uded in the kernel-modules meta-package.
>>>>>>>>
>>>>>>>
>>>>>>> I have already build everything from scratch even deleted sstate ca=
che
>>>>>>
>>>>>> Can you give this a try?
>>>>>>
>>>>>> koen@dominion:/OE/tentacle/sources/openembedded-core/meta/classes$ g=
it diff kernel.bbclass
>>>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbcla=
ss
>>>>>> index 3eb6659..9f014d4 100644
>>>>>> --- a/meta/classes/kernel.bbclass
>>>>>> +++ b/meta/classes/kernel.bbclass
>>>>>> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
>>>>>> =C2=A0 =C2=A0 =C2=A0 metapkg =3D "kernel-modules"
>>>>>> =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d=
)
>>>>>> =C2=A0 =C2=A0 =C2=A0 bb.data.setVar('FILES_' + metapkg, "", d)
>>>>>> - =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image',=
 'kernel-base', 'kernel-vmlinux', 'perf' ]
>>>>>> + =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image',=
 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
>>>>>> =C2=A0 =C2=A0 =C2=A0 for l in module_deps.values():
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in l:
>>>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pkg =3D module_pattern % legitimize_package_name(re.match(module=
_regex, os.path.basename(i)).gro
>>>>>>
>>>>>> I think that should go in regardless, but I'm curious if it fixes yo=
ur problem. The meta-pkg should only pickup kernel-module-* and kernel-firm=
ware-*, so a whitelist would be even bettter.
>>>>>>
>>>>>
>>>>> It did not fix the problem. I tried bitbake -c cleanall virtual/kerne=
l
>>>>> bitbake console-image
>>>>
>>>> To which class did you appy it? There's a copy of kernel.bbclass in me=
ta-oe with some change we need to merge into oe-core (initramfs handling, b=
etter uImage handling, etc).
>>>
>>> thanks I was thinking I applied it to meta-oe but when I revisited I
>>> applied it to oe-core
>>> :)
>>
>> If that fixes it can someone share a proper patch please (for
>> oe-core) :)
>
> I'll send a patch after Khem confirms the fix.

My build is still underway dont have a very fast machine. I will reply
to your patch once the build it done.

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


