Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q2Pr9-0002fh-Hr
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:20:19 +0100
Received: by fxm19 with SMTP id 19so7621850fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 08:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=EWeRstj85IyszWEukWvSXQDW/dtR/7Y76qyBIPHa478=;
	b=iSVpG5tTZAQRmcuX6bLM7UGpD7RmkGGy87MiA1T4dd4oMe0FAXb1JNsEe5Hvh29gjW
	nvSAi6xg0+lLxX7/CwH1CYadiGJsxWJgSqihxdHXiwJka63sI0RZHJLuaFh4Ccnxn4TT
	gcDkeN2hqEkHPu/TjtTjUXPmGKrYZIfUiQ0t8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=PEaB5ZfHR8oXQ4N1Y2TRpolNuKuI+qfgaDPw0ZxrU6VNdXXYQPt1tm4sR7clx/6OSP
	51LSeShwWkUsYKGtXjlc9Iaqip/ifuO0zshlI2N7wrQrNHLN1HikE9WcpvSfGxgX9Rbq
	tvKvMcRCMOHRgV8wmxzp7ItPkPTrisBhkUN7c=
Received: by 10.223.110.4 with SMTP id l4mr812222fap.125.1300893465336; Wed,
	23 Mar 2011 08:17:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Wed, 23 Mar 2011 08:17:15 -0700 (PDT)
In-Reply-To: <B073FF3E-7CE1-4FAF-99B4-3ED5832954CD@dominion.thruhere.net>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
	<20110322184459.GE26336@sakrah.homelinux.org>
	<32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
	<20110322221814.GA13076@sakrah.homelinux.org>
	<B073FF3E-7CE1-4FAF-99B4-3ED5832954CD@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Mar 2011 08:17:15 -0700
Message-ID: <AANLkTimhEBgbMP8OrgVavchhHgjKrtpS2CKzFzC8wuUW@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 Mar 2011 15:20:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 12:16 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 22 mrt 2011, om 23:18 heeft Khem Raj het volgende geschreven:
>
>> On (22/03/11 19:54), Koen Kooi wrote:
>>>
>>> Op 22 mrt 2011, om 19:44 heeft Khem Raj het volgende geschreven:
>>>
>>>> On (22/03/11 19:42), Koen Kooi wrote:
>>>>>
>>>>> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
>>>>>
>>>>>> Hi
>>>>>>
>>>>>> I did an update of oe-core yesterday and now mips is failing with th=
is
>>>>>> error. It was not there 2 days back.
>>>>>>
>>>>>> | Configuring sysvinit.
>>>>>> | Collected errors:
>>>>>> | =C2=A0* satisfy_dependencies_for: Cannot satisfy the following dep=
endencies
>>>>>> for task-base:
>>>>>> | =C2=A0* =C2=A0 =C2=A0kernel-misc *
>>>>>> | =C2=A0* opkg_install_cmd: Cannot install package task-base.
>>>>>> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
>>>>>>
>>>>>> I have not bisected but if anyone else is seeing it I would like to =
know
>>>>>
>>>>> I think thats fallout from the kernel.bbclass change:
>>>>>
>>>>> meta/classes/kernel.bbclass:FILES_kernel-misc =3D "/kernel/include/co=
nfig /kernel/scripts /kernel/drivers/crypto /kernel
>>>>>
>>>>> I don't know what purpose that package has, but try rebuilding the ke=
rnel and see what happens. We might need to blacklist it from being include=
d in the kernel-modules meta-package.
>>>>>
>>>>
>>>> I have already build everything from scratch even deleted sstate cache
>>>
>>> Can you give this a try?
>>>
>>> koen@dominion:/OE/tentacle/sources/openembedded-core/meta/classes$ git =
diff kernel.bbclass
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 3eb6659..9f014d4 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0metapkg =3D "kernel-modules"
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1"=
, d)
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.data.setVar('FILES_' + metapkg, "", d)
>>> - =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'k=
ernel-base', 'kernel-vmlinux', 'perf' ]
>>> + =C2=A0 =C2=A0 =C2=A0 blacklist =3D [ 'kernel-dev', 'kernel-image', 'k=
ernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0for l in module_deps.values():
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in l:
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0pkg =3D module_pattern % legitimize_package_name(re.match(modu=
le_regex, os.path.basename(i)).gro
>>>
>>> I think that should go in regardless, but I'm curious if it fixes your =
problem. The meta-pkg should only pickup kernel-module-* and kernel-firmwar=
e-*, so a whitelist would be even bettter.
>>>
>>
>> It did not fix the problem. I tried bitbake -c cleanall virtual/kernel
>> bitbake console-image
>
> To which class did you appy it? There's a copy of kernel.bbclass in meta-=
oe with some change we need to merge into oe-core (initramfs handling, bett=
er uImage handling, etc).

thanks I was thinking I applied it to meta-oe but when I revisited I
applied it to oe-core
:)


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


