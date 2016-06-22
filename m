Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EDE016010B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:21:06 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 66so4543867pfy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=9xefjcAbmaIoc23cOVXJQPJn167uZSVdQSqbemqyMJc=;
	b=IifbbxEQKac+HTK8fUlsceaGJVeuCiRjkqJ/g8DuS7CAU7NwdTXeHH6dRbNDwBvABW
	eQE5oCkymRh4uWZh0haNod7KcXAo5v+zjzma3NCnNyNl16PfdwT/ijvtChEZJUoGOg2J
	UcJx5jcbFuIGy5d9pWBAJmye++BgLIysCwXOxEOz0YQo4ljQ0MhNbWR8HzAnEQ75Pabj
	159iAmA9G5LkPaP7gUObAn0TFQ9RbdhQTQTGm0SF+/OFgK8gR9RMqBa9VYcwII+JfaFe
	gCpKlV9UuV3+mnyxXGYrIc2+UxFfRTPxLOvOi9H8cm6UCPh1N7M1gVKZTT91pt8q0w0h
	arcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=9xefjcAbmaIoc23cOVXJQPJn167uZSVdQSqbemqyMJc=;
	b=jMze+Bj8cCHv0EPa6Wdme/LlK0qJADwhyvVw7oEoclxemPafN5owO6IUySw6IQi5ri
	vdZBQhETU3wFcCiUHY6AzOuXquNwV6MhsupTVEI6Bw8L2moikvjSQX/RY7Exl3/ijumg
	B+WH99in7QwCkq/KPl68Z9VWsP3qZ55p7mJPhJbzRpx+qPi7B8K6ituvpVLHck8tfiVD
	STk5gfO5s5Lfq4uP+kwEU2kQKqQtknK9jBK7VuAfh1klIgDsna89Xo7oYr6PEvzGzxyw
	5WN9DktiYysD+yDfYQ4jcONQMCMzQI744+Sd1omhKTjAq51nW/xaD2McPxGalB7dGwkM
	fYSw==
X-Gm-Message-State: ALyK8tLgLtmGquLxi4Z4LVP6TeEtyAR6B78CjLsCEleyMFV/aoKEtuormAweVybJiGxISA==
X-Received: by 10.98.204.2 with SMTP id a2mr35560287pfg.149.1466616067519;
	Wed, 22 Jun 2016 10:21:07 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:fcd1:61e:b1e8:f28?
	([2601:646:8882:b8c:fcd1:61e:b1e8:f28])
	by smtp.gmail.com with ESMTPSA id h66sm1172535pfe.6.2016.06.22.10.21.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 10:21:06 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <576AC542.9020709@gmail.com>
Date: Wed, 22 Jun 2016 10:21:05 -0700
Message-Id: <112E5421-6EE1-465A-9D4A-AEC9A38B9EB7@gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
	<9FC96606-1A87-49F3-8A49-F692CDF8C2AA@gmail.com>
	<576AC542.9020709@gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add gcc version and tclibc to build summary
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
X-List-Received-Date: Wed, 22 Jun 2016 17:21:07 -0000
X-Groupsio-MsgNum: 83750
Content-Type: multipart/signed;
	boundary="Apple-Mail=_05F725F6-03A0-4A5D-A740-51E2BABF5997";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_05F725F6-03A0-4A5D-A740-51E2BABF5997
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 22, 2016, at 10:05 AM, akuster808 <akuster808@gmail.com> wrote:
>=20
>=20
>=20
> On 06/22/2016 09:52 AM, Khem Raj wrote:
>>=20
>>> On Jun 22, 2016, at 8:29 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>>>=20
>>> Since there are two gcc versions supported and any number of =
tcglibc,
>>> it would be nice to know which ones are being used.
>>> Add those to the build summary.
>>>=20
>>> Build summary
>>> TCLIBC            =3D =E2=80=9Cglibc"
>>=20
>> libc is evident from TARGET_SYS
>=20
> TARGET_SYS=3D"x86_64-oe-linux", this is not the my intent.
>=20
>=20
> The intent is to track which libc is being used. I changed TCLIBC =3D
> "musl" local.conf and now build summary show.
>=20
> TCLIBC            =3D "musl"
> GCC_VERSION       =3D "6.1"
>=20
> Is there a clearer / better way to display this?

if you set TCLIBC =3D =E2=80=9Cmusl=E2=80=9D then TARGET_SYS should have =
changed to x86_64-oe-linux-musl
and TARGET_SYS is displayed with build configuration.

>=20
> - armin
>>=20
>>> GCC_VERSION       =3D "6.1"
>>>=20
>>> Not sure if the gcc version bit is best practice.
>>>=20
>>> Armin Kuster (2):
>>> build summary: add gcc version being used.
>>> build summary: add TCLIBC being used
>>>=20
>>> meta/classes/base.bbclass | 2 ++
>>> meta/conf/bitbake.conf    | 2 +-
>>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>>=20
>>> --
>>> 2.3.5
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20


--Apple-Mail=_05F725F6-03A0-4A5D-A740-51E2BABF5997
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldqyQEACgkQuwUzVZGdMxS6egCfVVUoRbDxPYnUaYZVIiV9QCCh
YWQAn0PInYizDd71ejBG2mlTl/QxhsIa
=SWIA
-----END PGP SIGNATURE-----

--Apple-Mail=_05F725F6-03A0-4A5D-A740-51E2BABF5997--
