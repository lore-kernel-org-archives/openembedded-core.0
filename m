Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZkdV-0000i4-QA
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 17:16:37 +0200
Received: by eaal1 with SMTP id l1so1797320eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=gUtVCd8qwLjXmzuT6rPb46Hm5H/IBFd5RqGYN6QZluc=;
	b=Z+krJaOuDp0rTFFm3Ire+PBJs/Ph4Ky8OH+W05FeDm1/vdlzdwisGVETDZaKKx2BUt
	QhaS/8pEHW6KX+YK4RjzbKxKvZNisfHL4aqwufPSDAX9WKrPzAWrHnCfI0ghXBuh8O+2
	NnE/Gm9so0pnpJeXSbSQXsBIjBrREGbCESU6sG8FDcnpWxBF2TGTAeS0NYf/HwJSK192
	7ItmVRTMueySyNAiezOb15+Fo0gagzQH+cWZt5OFiu/Vuq9dQrKt6/Lq0PETcdhYJMCk
	P57ArNnNIofvuQJXxuA5HsmsoEj5GPEVDAvaoo4BglriaV7XpQm48yVilqEmwpDlT4pN
	9VaA==
Received: by 10.14.188.140 with SMTP id a12mr5690433een.25.1338390366665; Wed,
	30 May 2012 08:06:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 08:05:36 -0700 (PDT)
In-Reply-To: <CAGiJk9dbcAVQk5Ta_iFFP=Wpy_=CRMoMrsXsQO4SgnayoJ3KFg@mail.gmail.com>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
	<20120529200740.GC5528@sakrah.homelinux.org>
	<CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
	<CAMKF1soEBM3JUdDt7FEs_F8rX+_Fm962ruuR4GE4rjvSPL+2UQ@mail.gmail.com>
	<CAGiJk9dpiGdkDHeGkV=pVFu5joeJzqYZw338kJ3Wy2uKKYMEDw@mail.gmail.com>
	<CAMKF1sq9qgmeWipuxSuRpPtkqKz7nHHtsoh0=+tZQj9J0v6fRA@mail.gmail.com>
	<CAGiJk9dbcAVQk5Ta_iFFP=Wpy_=CRMoMrsXsQO4SgnayoJ3KFg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 May 2012 08:05:36 -0700
Message-ID: <CAMKF1srZX77uj6cAKydoN1kidg3EEGV4KKf-LsvXVbs+MCN8Yw@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2012 15:16:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 7:18 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/5/30 Khem Raj <raj.khem@gmail.com>:
>>
>>
>> On Wednesday, May 30, 2012, Samuel Stirtzel wrote:
>>>
>>> 2012/5/30 Khem Raj <raj.khem@gmail.com>:
>>> >
>>> >
>>> > On Wednesday, May 30, 2012, Samuel Stirtzel wrote:
>>> >>
>>> >> 2012/5/29 Khem Raj <raj.khem@gmail.com>:
>>> >> >>
>>> >> >> At some extend yes, the configuration checks the host, the defaul=
t
>>> >> >> string passed is "arm" but the configure.in checks for:
>>> >> >>
>>> >> >> case "${host_cpu}" in
>>> >> >> ...
>>> >> >> =C2=A0 =C2=A0 =C2=A0armv7*)
>>> >> >> =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok (${host_cpu})])
>>> >> >> =C2=A0 =C2=A0 =C2=A0 ARCH_MAX=3D"arm"
>>> >> >>
>>> >> >
>>> >> > in OE we know that compiler is configured to generate code for arm=
v7
>
> What does this exactly mean, are non armv7 arches also running armv7 code=
?
>
>>> >> > therefore you can safely change armv7* above in configure.in to be
>>> >> > arm*
>>> >> >
>>> >>
>>> >> On this change I don't have a strong opinion (looks rather
>>> >> cosmetically).
>>> >> But sure I can send a follow up patch like you suggested.
>>> >
>>> >
>>> > It is not cosmetic if you see it also enables it for non armv7 archs
>>>
>>> Maybe it is a misunderstanding?
>>> Do you also want me to change:
>>>
>>> COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
>>> COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>>
>>> to: COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64||arm).*-linux'
>>>
>>> Else it would be only a cosmetic change, because the recipe is
>>> preventing non armv7 arch.
>>> Or am I mistaken?
>>>
>>
>> Recipe and package itself are two different things I was commenting on
>> package itself how it's baked in OE is a different thing
>
> You want to pass configure for non armv7 arches but keep baking for
> them disabled?
> Sorry I don't get your point, if the machine is not armv7 compatible
> then it is not compatible with valgrind.
> If they are compatible there is no point in disallowing them to bake the =
recipe.
>
> Yes it is a difference to enable them at recipe / package level, but
> the effective use of this recipe / package restriction combination
> does not appear useful (to me).
> I think I just miss your point.

Its fine. Dont worry


