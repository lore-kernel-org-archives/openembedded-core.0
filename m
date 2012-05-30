Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SZirM-0007kY-TU
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:22:44 +0200
Received: by wibhm14 with SMTP id hm14so3352281wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Z9eJrjFiU8hsJ17n0vHkGmnkEpnjKx3Qpsj+J+EB46Y=;
	b=zniPrEcTDtZ2j94WjcdqtKwD90yEcyu3Vlph1hge8B3Q3hMqLRlWVl2kcTe2wVM4Hf
	GAh07Hx376vl9VRCgTJu/qu0YrHSRRtsEYhE4Pr+mf7vSKce936s487fOpEgPZmWi0KN
	YqFE1Jw+JOp1g0kUdXbBfADw8oDbiv6sFOaXu5PifLfKRoznay9G1unqTKBixxAohAVa
	X7FDe9Ww0y3oGdBtTRi2n7vbC6D7QEfKiZb9mLh8pRV5WI8sAqGOQ7QEKMIDCJnUouC8
	pDxQZcEjhLS3CrKJZK9ag+09c8vBDGy1ZdcIDymXXTDrU/DcLRr02H3CnddDApczKfO4
	Y79w==
MIME-Version: 1.0
Received: by 10.216.193.162 with SMTP id k34mr10546834wen.54.1338383546396;
	Wed, 30 May 2012 06:12:26 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Wed, 30 May 2012 06:12:26 -0700 (PDT)
In-Reply-To: <20120529200740.GC5528@sakrah.homelinux.org>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
	<20120529200740.GC5528@sakrah.homelinux.org>
Date: Wed, 30 May 2012 15:12:26 +0200
Message-ID: <CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2012 13:22:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/29 Khem Raj <raj.khem@gmail.com>:
>>
>> At some extend yes, the configuration checks the host, the default
>> string passed is "arm" but the configure.in checks for:
>>
>> case "${host_cpu}" in
>> ...
>> =C2=A0 =C2=A0 =C2=A0armv7*)
>> =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok (${host_cpu})])
>> =C2=A0 =C2=A0 =C2=A0 ARCH_MAX=3D"arm"
>>
>
> in OE we know that compiler is configured to generate code for armv7
> therefore you can safely change armv7* above in configure.in to be arm*
>

On this change I don't have a strong opinion (looks rather cosmetically).
But sure I can send a follow up patch like you suggested.


--=20
Regards
Samuel


