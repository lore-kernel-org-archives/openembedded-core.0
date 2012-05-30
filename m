Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SZjt6-0004Sx-Lj
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:28:36 +0200
Received: by werg55 with SMTP id g55so3521230wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jHzUP1JVcVxif8/YfUehIR8WEPgEXW6UVjGZcxVEds0=;
	b=OlhmnxTBXuYWbF04kr5geA0wFUgWb8JCeZza5I05KsECYvnVM1gwAU0bTSy2ywShlP
	KtiUmk4RqcrChcR2My7Ys/KgyL0GFnZ/LCvfkuPUixKV/bxvIYedHoXNT3e9MaTO3quZ
	7CWChBLm4FlBaq2myHWzO1GS1KuTqyKZq95CefEWB6L6OUVBWcxIpbgv2BvFl+pzsvTK
	hB4oRQXLaL4qApHR+RZU5FnzMAmfPN7I0sgzCBdjKP3UoPLqjPDr254JmgTFJqm0oOU/
	oZ7W2Lx4j/PejX5yvQpOqcI51HGBVt4bY8YbVge+Xpkk6wwUPioPB4k2DIvdFECXkCxM
	oUBg==
MIME-Version: 1.0
Received: by 10.216.131.97 with SMTP id l75mr9952261wei.21.1338387497930; Wed,
	30 May 2012 07:18:17 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Wed, 30 May 2012 07:18:17 -0700 (PDT)
In-Reply-To: <CAMKF1sq9qgmeWipuxSuRpPtkqKz7nHHtsoh0=+tZQj9J0v6fRA@mail.gmail.com>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
	<20120529200740.GC5528@sakrah.homelinux.org>
	<CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
	<CAMKF1soEBM3JUdDt7FEs_F8rX+_Fm962ruuR4GE4rjvSPL+2UQ@mail.gmail.com>
	<CAGiJk9dpiGdkDHeGkV=pVFu5joeJzqYZw338kJ3Wy2uKKYMEDw@mail.gmail.com>
	<CAMKF1sq9qgmeWipuxSuRpPtkqKz7nHHtsoh0=+tZQj9J0v6fRA@mail.gmail.com>
Date: Wed, 30 May 2012 16:18:17 +0200
Message-ID: <CAGiJk9dbcAVQk5Ta_iFFP=Wpy_=CRMoMrsXsQO4SgnayoJ3KFg@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2012 14:28:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/30 Khem Raj <raj.khem@gmail.com>:
>
>
> On Wednesday, May 30, 2012, Samuel Stirtzel wrote:
>>
>> 2012/5/30 Khem Raj <raj.khem@gmail.com>:
>> >
>> >
>> > On Wednesday, May 30, 2012, Samuel Stirtzel wrote:
>> >>
>> >> 2012/5/29 Khem Raj <raj.khem@gmail.com>:
>> >> >>
>> >> >> At some extend yes, the configuration checks the host, the default
>> >> >> string passed is "arm" but the configure.in checks for:
>> >> >>
>> >> >> case "${host_cpu}" in
>> >> >> ...
>> >> >> =C2=A0 =C2=A0 =C2=A0armv7*)
>> >> >> =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok (${host_cpu})])
>> >> >> =C2=A0 =C2=A0 =C2=A0 ARCH_MAX=3D"arm"
>> >> >>
>> >> >
>> >> > in OE we know that compiler is configured to generate code for armv=
7

What does this exactly mean, are non armv7 arches also running armv7 code?

>> >> > therefore you can safely change armv7* above in configure.in to be
>> >> > arm*
>> >> >
>> >>
>> >> On this change I don't have a strong opinion (looks rather
>> >> cosmetically).
>> >> But sure I can send a follow up patch like you suggested.
>> >
>> >
>> > It is not cosmetic if you see it also enables it for non armv7 archs
>>
>> Maybe it is a misunderstanding?
>> Do you also want me to change:
>>
>> COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
>> COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>
>> to: COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64||arm).*-linux'
>>
>> Else it would be only a cosmetic change, because the recipe is
>> preventing non armv7 arch.
>> Or am I mistaken?
>>
>
> Recipe and package itself are two different things I was commenting on
> package itself how it's baked in OE is a different thing

You want to pass configure for non armv7 arches but keep baking for
them disabled?
Sorry I don't get your point, if the machine is not armv7 compatible
then it is not compatible with valgrind.
If they are compatible there is no point in disallowing them to bake the re=
cipe.

Yes it is a difference to enable them at recipe / package level, but
the effective use of this recipe / package restriction combination
does not appear useful (to me).
I think I just miss your point.


--=20
Regards
Samuel


