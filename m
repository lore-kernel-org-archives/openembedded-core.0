Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id EFD37601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 13:58:33 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so69931573pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=5IbrTVP07pCSkC2UlQqf1gVfeUCuXazJQOrpBQgflAI=;
	b=CFduzGdMYMlsDUN7oODaAOQJwS8kPkczLjXf6mspitWBFXPRBM00BxZQe6EpVjfYJE
	MpfOVBbloqyLsdJotSQCGy3z9Vx3doetyGz8tXmlUPWotKp+V0pIoj5Nh5FZD8GPxI84
	+SFaAF8o7rRBDUsiswpO2jrV+CFveI3JAAc8ZJu+5WmjK8TfKNCpaa8Xv/wgLogyVFrE
	LpxrD1YICdC+MT79l23TE/Xv4ZdDXBbkBzylq7sOfbrR7JKUYFNu/jexB5HprGaEZiw0
	adalB9ZlPOpmSPXgEonzcHpfw8jTeodn5BrpzLjbhEvBXrLk09xSbTffN9yrEC3Kx4Dw
	A8CA==
X-Received: by 10.68.250.194 with SMTP id ze2mr64764663pbc.24.1432130314472;
	Wed, 20 May 2015 06:58:34 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:f46f:40a:7124:fb2?
	([2601:9:3580:84c:f46f:40a:7124:fb2])
	by mx.google.com with ESMTPSA id xv9sm16289515pbc.2.2015.05.20.06.58.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 May 2015 06:58:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKr9ntS+W8DZuSXrN_V_sg-=CVAHCESULeUdUNki2jSMGg@mail.gmail.com>
Date: Wed, 20 May 2015 06:58:28 -0700
Message-Id: <5EE3C094-2BFE-414F-ACF3-F3ABD8D0BD41@gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
	<CAP9ODKqpnGVrBNh9PekyZJJBzRnjs9mfELM3afHTmT=0UDEegw@mail.gmail.com>
	<CALbNGRSnxG0ZmFH2sAFL0B3uEy3mi97t30fSnn2JCSyFLr9Pdg@mail.gmail.com>
	<CAP9ODKp1-e6oiv6oKUJ5aTPjYMBJL9YtF+16Gt=cooC+4LEdYw@mail.gmail.com>
	<CALbNGRQPU2ToHpwcD6GA+TOz4zS2sJV8dXgbZsufn=9Pg-Pn3Q@mail.gmail.com>
	<CAP9ODKo3MhRR_2OW4Xgg6GMkdV-ykD3AvrRRQU9n0pF1xqh4rQ@mail.gmail.com>
	<59DAE1C4-3DB3-44B8-A036-927EBD67C212@gmail.com>
	<CALbNGRTA-rPDinuWqDzdRK=jmY6wYJ_Li_NGCkoO52G-t+U1+A@mail.gmail.com>
	<CALbNGRSeZ7CZtbJd2U6iGu+ARgT3hi9CdC5xO7iwwipk89D=4A@mail.gmail.com>
	<CAP9ODKr9ntS+W8DZuSXrN_V_sg-=CVAHCESULeUdUNki2jSMGg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.2098)
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: trouble related to oe-core update
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
X-List-Received-Date: Wed, 20 May 2015 13:58:34 -0000
X-Groupsio-MsgNum: 65777
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F1E7B676-CAD4-472C-A01A-AA84BB3AC52D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F1E7B676-CAD4-472C-A01A-AA84BB3AC52D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 20, 2015, at 6:46 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> OE-Core does not seem to enable thumb2 by default so I don't think we
> ought to change the default here. However I do agree in extend the
> comment and provide an example so it is easier for people to do this
> when needed.

No. That setting is effectively telling
this chip does not have thumb capabilities which is wrong for that class =
of processors, that assumption
is wrong and should be fixed.

even if you have thumb tunes expressed, it won=E2=80=99t change default =
ISA which is what you are
implying with your first sentence there. Default ISA for a component or =
globally can be changed
via different knobs and distros can choose that policy.



--Apple-Mail=_F1E7B676-CAD4-472C-A01A-AA84BB3AC52D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVckwgACgkQuwUzVZGdMxQQbwCfXm5F1ePqRi20+LqVdsPhYvy3
mAMAn28jHoxj6YeRGweMdG1ZZnhATmd6
=6DkM
-----END PGP SIGNATURE-----

--Apple-Mail=_F1E7B676-CAD4-472C-A01A-AA84BB3AC52D--
