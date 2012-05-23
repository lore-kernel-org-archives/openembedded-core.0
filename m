Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXC0g-00042U-Ms
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:53:54 +0200
Received: by werg55 with SMTP id g55so5041590wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=rNZWA08sS6VUhTtzX8ljGBItTJ7moSGpsH/odgpcmOA=;
	b=kzXyBmU075UdbAL+YtnVDKttDZrYfYWBeJE07IJ5GUMjBx4yIQVBTdOI5Eed0m69oR
	XZbwbU2AYxr5SNULJZ8icf3h/y8V2lOr4GmitGkIMvmCWyDOzumOpApkRxxhYBGLkxZB
	qmJtRIlQnqQzEfnUTkNt257DpRCqBhHxgFNwou+1i1hkZXJ745rflCEHEcMhe3YGU1kj
	EWwmNMoSkfHnoVjH4vYFJ7jlAfc3htJyXMYI9sTox+0iDk+khkyftyHxunlmMehQGP0n
	iBkcy+RKDUF7nLRW89L/zX/pXR2bkx4FGAzw58g49NUaE270m5k9BpJ2K87ZOsVGZOWC
	fzEA==
MIME-Version: 1.0
Received: by 10.180.83.196 with SMTP id s4mr46249082wiy.15.1337780624671; Wed,
	23 May 2012 06:43:44 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Wed, 23 May 2012 06:43:44 -0700 (PDT)
In-Reply-To: <CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
Date: Wed, 23 May 2012 15:43:44 +0200
Message-ID: <CAGiJk9edovx+tYFrYfXPJnyuEhedQebouLJVyMWPqsUZn1LyMg@mail.gmail.com>
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
X-List-Received-Date: Wed, 23 May 2012 13:53:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/23 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2012/5/23 Koen Kooi <koen@dominion.thruhere.net>:
>>
>> Op 23 mei 2012, om 14:46 heeft Samuel Stirtzel het volgende geschreven:
>>
>>> Valgrind supports the armv7 architecture, this patch allows armv7 users=
 to build and use Valgrind
>>>
>>> This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
>>> * The test consisted of running valgrinds memcheck (memory leakage dete=
ction),
>>> * and callgrind (profiling) on a Qt 4 application
>>>
>>> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>>> ---
>>> meta/recipes-devtools/valgrind/valgrind_3.7.0.bb | =C2=A0 =C2=A03 +++
>>> 1 files changed, 3 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/re=
cipes-devtools/valgrind/valgrind_3.7.0.bb
>>> index d7c7b24..0998f72 100644
>>> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
>>> @@ -23,13 +23,16 @@ SRC_URI[md5sum] =3D "a855fda56edf05614f099dca316d17=
75"
>>> SRC_URI[sha256sum] =3D "5d62c0330f1481fe2c593249192fa68ff454c19c3434397=
8cc9ce91aa324cbf6"
>>>
>>> COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
>>> +COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>>
>>> inherit autotools
>>>
>>> EXTRA_OECONF =3D "--enable-tls"
>>> +EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi=
"
>>
>> we should already be passing --host through autotools.bbclass. Does the =
configure have a special check? I've seen a few projects that insist on the=
 -none- TARGET_VENDOR for no good reason :(
>
> At some extend yes, the configuration checks the host, the default
> string passed is "arm" but the configure.in checks for:
>
> case "${host_cpu}" in
> ...
> =C2=A0 =C2=A0 armv7*)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0AC_MSG_RESULT([ok (${host_cpu})])
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH_MAX=3D"arm"
>
>
> So if we use the default from autotools it won't work.
> I've seen the arch in some examples on the net, do you prefer -host=3Darm=
v7?

Seems to be a more "intelligent" check:
"checking host system type... Invalid configuration `armv7': machine
`armv7' not recognized"

>
>>
>>> EXTRA_OEMAKE =3D "-w"
>>> PARALLEL_MAKE =3D ""
>>>
>>> FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug/*"
>>> RRECOMMENDS_${PN}_powerpc +=3D "${TCLIBC}-dbg"
>>> RRECOMMENDS_${PN}_powerpc64 +=3D "${TCLIBC}-dbg"
>>> +RRECOMMENDS_${PN}_armv7a +=3D "libc6-dbg"
>>
>>
>> ${TCLIBC}-dbg ?

v3 coming soon, it looked odd because of angstrom.inc: ${TCLIBC} ?=3D "egli=
bc",
but it seems alright with ${TCLIBC}-dbg pointing to libc6-dbg

--=20
Regards
Samuel


