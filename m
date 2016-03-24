Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAF5731BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 22:24:51 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n5so68110139pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 15:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=tx8lW8tYYN6i7D21fc0LlvvTqjP2JbSoquq7I4FKzv0=;
	b=ZzS8tlvIAbqgo5YO4y3k/qMeBnsEivcGv5nu/p/WJOgM1EkA+fuwAGos89aQ+pj5cJ
	eaFy0ayzxyioKFqIx3XJpvB0r8cCkRV2weOgzosnVDtmTGM2jIt6vUp9TSdxvHf6wvV8
	rE/qg5E52fOX2hjwdpCrHOvTkVaZuDwaVGc3ot7peiX6jK9VTLPy8hfoTI6z93/nBDRP
	OLnJraBeoN+LRtbjNMvHOA4YuW5qPpZO/jBTF1pwxxDPQBg1JhrjMG4hg5hlsiUuvuy9
	pbuvDuvyjqwY6cKOhk6eRZ50bh7RuumLVid3OQ0Q2mw5CVcO8UpJcUWsxEPNn+NgdUwj
	ilVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=tx8lW8tYYN6i7D21fc0LlvvTqjP2JbSoquq7I4FKzv0=;
	b=BYzJOWm3HcMpvhLFx+VcbSVXXL3bcrzrRy8zBp8KqMRbEd2fmS2Orpmaq66BwsVh6j
	vF/ov+sqQtC8WLUlOpma0c2/JOWaUaC0Ift9hsnEdTOcrbmj78RY698r1anqubPfCpzT
	QjYqZhfTLOWhp6f00w1jMLp6JOwbqHGasEmDus7z0huIYshH2oS0XFAxamldViPK6K68
	PSP6PxTkIjqtFRvd8hkxDq951OcDKBqcDnKEewKUI1JDd8INNt5m07+UXT4jtUQM5ngy
	WXf7rftucXmXcQAv+rE54eAsxaFMd4SkK0mV1wOwoqdoqc7L4jxHsb7Pf2RPtsJznDl8
	spIA==
X-Gm-Message-State: AD7BkJIVKcz0HoLVQWfPAfYPzhO0fDG45fGyxBu8YTffpDbSZ4r9uNqzR3iFkhNTuHsIrg==
X-Received: by 10.98.7.81 with SMTP id b78mr16225146pfd.49.1458858292345;
	Thu, 24 Mar 2016 15:24:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2?
	([2601:646:8800:5a9a:a4d9:b8b5:b926:f5b2])
	by smtp.gmail.com with ESMTPSA id
	82sm12230146pfi.78.2016.03.24.15.24.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2016 15:24:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1458836404.3476.194.camel@pbcl.net>
Date: Thu, 24 Mar 2016 15:24:50 -0700
Message-Id: <DA8E3E92-8B9C-43CA-8563-DE5E37EC3F93@gmail.com>
References: <1458833075-543-1-git-send-email-raj.khem@gmail.com>
	<1458836404.3476.194.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: Explicitly link with libssp on musl/ppc
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
X-List-Received-Date: Thu, 24 Mar 2016 22:24:52 -0000
X-Groupsio-MsgNum: 80118
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1E9594B0-0C1B-4620-9341-54B3F2F103C6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1E9594B0-0C1B-4620-9341-54B3F2F103C6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 24, 2016, at 9:20 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Thu, 2016-03-24 at 15:24 +0000, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> This is all a bit obscure.  Please add an explanation of why this is
> needed specifically by ppc (and not other architectures) to the commit
> message.

It is using nodefaultlib on linker cmdline and as a result, it was =
complaining
about missing __stack_chk_fail_local which was being added by compiler =
due
to -fstack-protector-strong being in CFLAGS, I did not look into roots =
as to
why it was showing up on ppc only.

>=20
> Also, the subject says "musl" but the patch doesn't seem to be
> obviously specific to musl.  Is SECURITY_LDFLAGS not used at all by
> other libcs?

It does not harm others.

>=20
> p.
>=20
>> ---
>>  meta/recipes-support/nss/nss_3.21.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-
>> support/nss/nss_3.21.bb
>> index d2e2411..9f2626b 100644
>> --- a/meta/recipes-support/nss/nss_3.21.bb
>> +++ b/meta/recipes-support/nss/nss_3.21.bb
>> @@ -41,6 +41,7 @@ TD =3D "${S}/tentative-dist"
>>  TDS =3D "${S}/tentative-dist-staging"
>>=20
>>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>> +SECURITY_LDFLAGS_append_powerpc =3D " -lssp_nonshared -lssp"
>>=20
>>  do_configure_prepend_libc-musl () {
>>      sed -i -e '/-DHAVE_SYS_CDEFS_H/d'
>> ${S}/nss/lib/dbm/config/config.mk
>> --
>> 1.8.3.1
>>=20


--Apple-Mail=_1E9594B0-0C1B-4620-9341-54B3F2F103C6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb0aTIACgkQuwUzVZGdMxQbCwCfQgQK6z2aeL/ZQPMmfSkVpiI4
EvYAnAohfaCFjH+G9LU/Na/fV0D5TYiL
=M8PL
-----END PGP SIGNATURE-----

--Apple-Mail=_1E9594B0-0C1B-4620-9341-54B3F2F103C6--
