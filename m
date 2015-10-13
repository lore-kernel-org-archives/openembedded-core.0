Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 78D9165D6E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 17:02:19 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so26514715pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=EkENqetxQqPXUJ0WOLq6NpRyKLQxt3AwfItSNzQY8AM=;
	b=RpoOG0i18ZNzIF735iQ+8nSh81bahBDPZT61KO1tuB6AY7+OUMleQWP1KQbxWliUGr
	r2Gotsd26IvzLKzK9CftscywbtIuVjtD9qPb+cJE3Wu/jr+tMfjb7XIFsQWSXr4+vrW0
	nztmpS744+vWNdMDKr3oi9zmXPwse6wIivy/wxHgCSpXMt796sn3/wTCLCh6EXchUhIB
	/aFdgPoaYEzNWtzmKB9zhChBK7LdMCQFqvpR+4oQGZQ0nOgRPWnWLd4SwMz5i1xrskln
	YAlsnEf/lpSW6x8tdhLvlid8UEjJEZSDutSr2smpVxiyd5D60lgb96vZRrzAW1G+QCYA
	CYwg==
X-Received: by 10.68.197.196 with SMTP id iw4mr41430784pbc.153.1444755739585; 
	Tue, 13 Oct 2015 10:02:19 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f002:9d80:e725:c0fd?
	([2601:646:8601:4580:f002:9d80:e725:c0fd])
	by smtp.gmail.com with ESMTPSA id ou1sm4893141pbb.0.2015.10.13.10.02.18
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Oct 2015 10:02:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpgFEmuXzG8xQpA3g4ou2Swoyq2wpds6v5Uqo5kk2aFcg@mail.gmail.com>
Date: Tue, 13 Oct 2015 10:02:09 -0700
Message-Id: <EEE571F8-C3A1-49F6-89B6-30D5F50B972D@gmail.com>
References: <CAP9ODKrxCLF1m-UR9_TYQboUQtWODG8erwgnmjFiWd_O57CEEw@mail.gmail.com>
	<2D1734FF-E28E-4B9D-AF22-A4911A5DE293@gmail.com>
	<CAP9ODKoN8S-nqASuUsRzt_qeuPGBuhsoHPeH_NFHEGbHWbGd+Q@mail.gmail.com>
	<CE766E63-DA13-44FF-AE6A-B76615CE56DA@gmail.com>
	<CAP9ODKpgFEmuXzG8xQpA3g4ou2Swoyq2wpds6v5Uqo5kk2aFcg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Mailer: Apple Mail (2.3096.1)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: glibc build error when it is rebuild due hash mismatch
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
X-List-Received-Date: Tue, 13 Oct 2015 17:02:19 -0000
X-Groupsio-MsgNum: 72135
Content-Type: multipart/signed;
	boundary="Apple-Mail=_14501948-48D8-4819-BDF4-28AA582F83F5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_14501948-48D8-4819-BDF4-28AA582F83F5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 13, 2015, at 9:59 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>=20
> On Tue, Oct 13, 2015 at 1:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Oct 13, 2015, at 9:53 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>>>=20
>>> On Tue, Oct 13, 2015 at 1:52 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>=20
>>>>> On Oct 13, 2015, at 9:45 AM, Otavio Salvador =
<otavio.salvador@ossystems.com.br> wrote:
>>>>>=20
>>>>> Hello,
>>>>>=20
>>>>> =46rom time to time I see following error:
>>>>>=20
>>>>> | /usr/bin/install -c -m 644
>>>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/option-groups.h
>>>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/image/usr/include/gnu/option-groups.h
>>>>> | /usr/bin/install -c -m 644
>>>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/build-arm-oel-linux-gnueabi/gnu/lib-names-hard.h
>>>>> =
/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueab=
i/glibc/2.22-r0/image/usr/include/gnu/lib-names-hard.h
>>>>> | msgfmt -o rw.mo rw.po
>>>>> | /bin/bash: msgfmt: command not found
>>>>> | Makefile:84: recipe for target 'rw.mo' failed
>>>>> | make[2]: *** [rw.mo] Error 127
>>>>> | make[2]: *** Waiting for unfinished jobs....
>>>>> | make[2]: Leaving directory
>>>>> =
'/home/otavio/src/yocto/build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnuea=
bi/glibc/2.22-r0/git/po'
>>>>> | Makefile:234: recipe for target 'po/subdir_install' failed
>>>>>=20
>>>>> and it seems to happen when a rebuild of glibc is triggered due a
>>>>> change in the sstate hash. The host is a very minimal system so it
>>>>> explains why it does not provide the msgfmt in host and also might
>>>>> explain why it is not being catch in Yocto Project AB.
>>>>=20
>>>>=20
>>>> are we missing a dependency on gettext-native ? it could be that AB =
slaves have gettext installed on host
>>>> and you don=E2=80=99t.
>>>=20
>>> First build works fine; rebuild fails. So I am not sure this is the =
culprit.
>>=20
>> it might not be rebuilding message catalog first time.
>=20
> Right but in this case:
>=20
> - we fix it to not rebuild it
> - we fix why it is not building it
>=20
> I am a complete ignorant in glibc build system. Can you help on this =
one?

share the complete logs for first time and second time builds somewhere.

>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--Apple-Mail=_14501948-48D8-4819-BDF4-28AA582F83F5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYdORoACgkQuwUzVZGdMxQ40ACfbSFG3xF+ap1I36S+3h4gOa57
9DEAniMPcR0uwpY99s4JcNGw/0ZGgyyH
=klLe
-----END PGP SIGNATURE-----

--Apple-Mail=_14501948-48D8-4819-BDF4-28AA582F83F5--
