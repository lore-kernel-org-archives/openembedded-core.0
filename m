Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2A260054
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 03:22:20 +0000 (UTC)
Received: by pdbnk13 with SMTP id nk13so4567061pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 20:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JNDBXhZYq/lLZQLIzwRO3bOF9n1nLt1/iP7hm++yExQ=;
	b=JTGHp7j+rkTAWypHHInMGIDhxsZkInve4EMME8fkDVaJqGZW2FMj/rMgNT+sKKxAEt
	PgFrQiCHdN/o1ITjbJMI+hTs832A7R+yq20+c4Cu72ojL8JYOncnnz3HQjNqLTgtZf/I
	fPwyeUX4CUG8bdnFED9/9uyxhuADwpCTb8je7Q8R4rALmO/TclMztnZhPR2tZ0xDRrgE
	dnXyTTn1AcDl6019kYPCu6v70V0wjqyonEP88bKetyu3SKwWOPs7fAzEVSnupl9/unJq
	u/fJnqpK5wTO7P7FiVti0k6vYWZ4fM5eA+wBXYM/9nIBHE8K4E198FStxz+7X0UdmToh
	iTPQ==
X-Received: by 10.66.66.173 with SMTP id g13mr5273524pat.155.1432005742303;
	Mon, 18 May 2015 20:22:22 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:6195:1fa1:395:1fff?
	([2601:9:3580:84c:6195:1fa1:395:1fff])
	by mx.google.com with ESMTPSA id p5sm11432969pdi.2.2015.05.18.20.22.21
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 20:22:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
Date: Mon, 18 May 2015 20:22:14 -0700
Message-Id: <B4831DAC-586D-4D30-A2D0-F05EF682DF53@gmail.com>
References: <CALbNGRRq94M86hm=0y8ZR7+5RXDMCJkXPxGREzAOjNQLerNkPw@mail.gmail.com>
	<20150518080138.GD9407@jama>
	<CALbNGRReeZHBXDo2C4tRTHfdCwSfS5QxpKdGWpsZJbgAGGCYdw@mail.gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
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
X-List-Received-Date: Tue, 19 May 2015 03:22:23 -0000
X-Groupsio-MsgNum: 65696
Content-Type: multipart/signed;
	boundary="Apple-Mail=_ECAC0ACE-77E9-4DBC-A4DD-015486455266";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_ECAC0ACE-77E9-4DBC-A4DD-015486455266
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 18, 2015, at 2:00 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> On Mon, May 18, 2015 at 10:01 AM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>> On Mon, May 18, 2015 at 09:46:03AM +0200, Andreas M=C3=BCller wrote:
>>> Hi,
>>=20
>> Hi,
>>=20
>>> have seen that a while ago but had no time to take care.
>>>=20
>>> Since oe-core commit
>>>=20
>>> commit 3e760031f91fb87c3e2f62b77a117eb41164f259
>>> Author: Martin Jansa <martin.jansa@gmail.com>
>>> Date:   Wed Feb 18 15:40:35 2015 +0100
>>>=20
>>>    feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding =
thumb suffix
>>>=20
>>> I get
>>>=20
>>> ERROR:  OE-core's config sanity checker detected a potential =
misconfiguration.
>>>    Either fix the cause of this error or at your own risk disable =
the
>>> checker (see sanity.conf).
>>>    Following is the list of potential problems / advisories:
>>>=20
>>>    Error, the PACKAGE_ARCHS variable does not contain TUNE_PKGARCH
>>> (cortexa9t2hf-vfp-neon).
>>>=20
>>> I don't understand this fully but it seems that
>>> fsl-dynamic-packagearch.bbclass would add this pkg arch but this =
never
>>> happens because sanity.bbclass is executed first and interrupts
>>> parsing. What I don't understand: Am I the only one having this =
issue
>>> o
>> I'm not using meta-fsl*, butdo you have this patch in your setup?
>> http://patches.openembedded.org/patch/90989/
>> it was discussed off-list a while ago and this change looks like =
result
>> of that discussion.
>>=20
> Have meta-fsl-arm current master in my layers. This contains a similar =
patch:
>=20
> commit bfe01a0ebde407086f4a7710ea165c6beff310d7
> Author: Max Krummenacher <max.oss.09@gmail.com>
> Date:   Mon Mar 30 23:49:32 2015 +0200
>=20
>    fsl-dynamic-packagearch: add all MACHINE_SOCARCH feeds
>=20
> Have rebased the mentionioned patch -> same result.
>=20
> My problem seems to be that sanity.bbclass bails out before code in
> fsl-dynamic-packagearch.bbclass is executed (and would fix). Playing
> around with layer priorities / order of layers nothing changed
> situation.

angstrom uses thumb2 by default. So you have exposed a bug in OE-Core or =
meta-fsl-arm
the default configurations that meta-fsl-arm has been tested is probably =
not using thumb2

Just set ARM_INSTRUCTION_SET =3D =E2=80=9Carm"

in local.conf and you should make progress.

>=20
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_ECAC0ACE-77E9-4DBC-A4DD-015486455266
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVarGwACgkQuwUzVZGdMxTPKQCeOYkW+C8PPLZbobG07WwF44yA
YMQAn0IXneF18grUs+I9SVh7yD6g0fzE
=w7Ub
-----END PGP SIGNATURE-----

--Apple-Mail=_ECAC0ACE-77E9-4DBC-A4DD-015486455266--
