Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7AACF60721
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 16:12:37 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id hl6so7637058pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=wqNF6AaIlTdp8k6RbT+SL/ErSfgDYCicbRp2l3UhDIs=;
	b=aLZwecb+yYB1fk4VrB1kYKCeVEksjc06nj+neKuxXYTROKIVU4Z05j5ZC+1gKWW1np
	xTdAbnvxS57PAN7kUaAicUm4sMkHoj5DAGSU2LVuQ9s1UnfM3w7P7zfz8m8q5oMWB0M8
	j+vERun5A8EVyJBWiwrojvCcRP++TBlJgCzUQILe9aEv8z4LbFYIDPKO4QvlcuoMlezr
	jIkvsZPFceYhV+uYPC6YijavsLXFe/jqODMmHBA1pxpu7WqMPvQws84NlsR8ZEyY32rm
	PfhfrJpmsT9Mnb+ot7ZPKCobd7bJiNkmy0vylgLGTUpa2jN01/emC5z0g/nIYspCOYqV
	xmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=wqNF6AaIlTdp8k6RbT+SL/ErSfgDYCicbRp2l3UhDIs=;
	b=luYOvv+gZqqzLzrh3WUwBG4UXRLa71EqXkSXOaHGGuBQ+0Tsq4ew3FTEXMXVlHoFKT
	bHIeEJQqL2tyVyoNw1P7FMOUZ1fHLwyY4cL2ksb1frat1V5gA4Kg0q0JtzYwdavWoy9Q
	sios891R1H6MxdV9EcbIRkrg995mNnRSyIKL0GEv4J2pbyLvnPdpZI4TUHGPlPh7uye5
	Jc2lRdYyn5uspk8+GfAS2k8CToGoldvAf9VrMHFPodlm7oI980ASVJizLXtf/AZ9Z+JZ
	reo1R42R1c30GuZ/5HTszY5cqldYpLdlHEAt4q7C/6Iq5JJwtQ7R4KE60ZjqoKE04xL5
	7Tqw==
X-Gm-Message-State: ALyK8tJI+CGnICsyWDn+d0fRQ2XTmo2uqeBF8K9ctiJEXCNKFGrrDNlhcBfdPbrfctXtuw==
X-Received: by 10.67.3.105 with SMTP id bv9mr12040919pad.29.1466525558008;
	Tue, 21 Jun 2016 09:12:38 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:a187:b48d:cd1e:1c21?
	([2601:646:8882:b8c:a187:b48d:cd1e:1c21])
	by smtp.gmail.com with ESMTPSA id
	v126sm34287312pfb.60.2016.06.21.09.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2016 09:12:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1466434134.6499.27.camel@andred.net>
Date: Tue, 21 Jun 2016 09:12:36 -0700
Message-Id: <F0BF27CC-0D2F-4E58-B937-EFA6824F40A2@gmail.com>
References: <1465571533-21604-1-git-send-email-git@andred.net>
	<1465571533-21604-2-git-send-email-git@andred.net>
	<CAMKF1srfaxLS3wn5d5Fu46i5-hU+kGj3dViD_v7YyF3wut013A@mail.gmail.com>
	<1466434134.6499.27.camel@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] uclibc: never build with SSP
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
X-List-Received-Date: Tue, 21 Jun 2016 16:12:40 -0000
X-Groupsio-MsgNum: 83698
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6471A0D0-4CEF-4B68-8345-591FC4C4242A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6471A0D0-4CEF-4B68-8345-591FC4C4242A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 20, 2016, at 7:48 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> Hi Khem,
>=20
> On Mi, 2016-06-15 at 17:20 -0700, Khem Raj wrote:
>> On Fri, Jun 10, 2016 at 8:12 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>>> From: Andr=C3=A9 Draszik <adraszik@tycoint.com>
>>>=20
>>> This doesn't work, as the initial gcc that is used for compiling
>>> uclibc doesn't have support for SSP yet (since that will only
>>> be available once uclibc has been compiled). Since during that
>>> same compilation step uclibc is trying to build its own utils
>>> those are failing to compile with SSP enabled as the
>>> initial gcc doesn't have access to the required libraries,
>>> yet.
>>=20
>> Please look at how we do this for glibc based systems.
>=20
> Are you saying glibc is compiled *with* SSP enabled?

We set the ssp variables manually (gcc_cv_libc_provides_ssp=3Dyes), when =
building gcc initial.
which should suffice for building core libraries. If uclibc build extra =
utils then lets spin
that via a separate recipe something like uclibc-utils or some such =
which is built later than
uclibc.

>=20
> I can't seem to find anything relevant. The only thing I can find =
seems to
> result in glibc and (and glibc-initial) and all glibc executables (!) =
being
> compiled without stack protector. As you seem to have something in =
mind, can
> you please be more specific and give me a pointer?
>=20
>=20
>> This patch is
>> not something we need.
>=20
> This patch fixes uclibc builds when SSP has been enabled by including
> security_flags.inc in distro.conf. Why is it not needed? Can you be =
more
> specific please?
>=20
>=20
> Cheers,
> Andre


--Apple-Mail=_6471A0D0-4CEF-4B68-8345-591FC4C4242A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldpZ3QACgkQuwUzVZGdMxSqIACgjI5cQM+y/Ecub13JMlf0tavl
ALoAnRFqWTd+9mMj0LQCH3xE+lMszHjE
=ADag
-----END PGP SIGNATURE-----

--Apple-Mail=_6471A0D0-4CEF-4B68-8345-591FC4C4242A--
