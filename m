Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SZjFB-0004CC-Rl
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:47:21 +0200
Received: by wgbds1 with SMTP id ds1so3098535wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=J2PbZAVK2kIjXC4Yk5nCRIV1ghdYv3l/QJqI7Iqyvcg=;
	b=RHDYvcoh+7R4clZupfZgtAM3D9a+Ez92BSC4717Gg1pSkwtVHe7LEPFEjJxy1AdVmQ
	F6oEKXSUk9wRRHQ2a6CF6Sh6BoP6HuX8QxHa+Ja+JzEyYdE6Ydx9aPGPP47XcG1nJMtO
	QJ5ITlZyg//7yMTH+6OhhQdYIDFYMF7iejUmoTmirLEnvXrLzcwqrHAFdzTD2Y9zJ3bD
	/12pk1OFsBrHzhBq+QjTMbwfBKtdPJxObpMPAXDa9cVE3uPCynTD2Yrmin5PakvtlP+L
	OW/1n+FW/jTr0+LpdjS/zBH1AESVcds2Kn7V22a0JXUd998x+CmaStCJcVUdmO4sxJJ7
	NSFA==
MIME-Version: 1.0
Received: by 10.216.198.23 with SMTP id u23mr1103966wen.195.1338385023424;
	Wed, 30 May 2012 06:37:03 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Wed, 30 May 2012 06:37:03 -0700 (PDT)
In-Reply-To: <CAMKF1soEBM3JUdDt7FEs_F8rX+_Fm962ruuR4GE4rjvSPL+2UQ@mail.gmail.com>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
	<20120529200740.GC5528@sakrah.homelinux.org>
	<CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
	<CAMKF1soEBM3JUdDt7FEs_F8rX+_Fm962ruuR4GE4rjvSPL+2UQ@mail.gmail.com>
Date: Wed, 30 May 2012 15:37:03 +0200
Message-ID: <CAGiJk9dpiGdkDHeGkV=pVFu5joeJzqYZw338kJ3Wy2uKKYMEDw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: Enable valgrind for armv7
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
X-List-Received-Date: Wed, 30 May 2012 13:47:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/30 Khem Raj <raj.khem@gmail.com>:
>
>
> On Wednesday, May 30, 2012, Samuel Stirtzel wrote:
>>
>> 2012/5/29 Khem Raj <raj.khem@gmail.com>:
>> >>
>> >> At some extend yes, the configuration checks the host, the default
>> >> string passed is "arm" but the configure.in checks for:
>> >>
>> >> case "${host_cpu}" in
>> >> ...
>> >> =C2=A0 =C2=A0 =C2=A0armv7*)
>> >> =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok (${host_cpu})])
>> >> =C2=A0 =C2=A0 =C2=A0 ARCH_MAX=3D"arm"
>> >>
>> >
>> > in OE we know that compiler is configured to generate code for armv7
>> > therefore you can safely change armv7* above in configure.in to be arm=
*
>> >
>>
>> On this change I don't have a strong opinion (looks rather cosmetically)=
.
>> But sure I can send a follow up patch like you suggested.
>
>
> It is not cosmetic if you see it also enables it for non armv7 archs

Maybe it is a misunderstanding?
Do you also want me to change:

COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'

to: COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64||arm).*-linux'

Else it would be only a cosmetic change, because the recipe is
preventing non armv7 arch.
Or am I mistaken?


--=20
Regards
Samuel


