Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A451F771B2;
	Mon,  8 Aug 2016 23:05:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y134so25764605pfg.3;
	Mon, 08 Aug 2016 16:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=/b3TYUqYqV7CgKvFrtkoDbTyuGGm7GZbj/M9KbsPgAg=;
	b=G/XziXZewuzmSjSB1Hth9BZa31Lq8GWuqoJR1ErkeuHpTJh9eZ1renB6qH+EMjToYF
	PUxkH340/qqNt+o45yM9hHBfx91cAAiZjBPuFseS+KgB7xTjqn7Um7/qgB+qeuMWetNd
	HeE4z7MfJo77B+msAD26X9+ZJZU+wN6Cle1EdvsdivGa7StTTJbTa5V/IDYMgqRTW4xe
	mvf1BjKHmZ8J9r7ByQj5OnoYZBu+P7+Hx7d8jIWn44dkVqosrx21TP5IlZrwEIO7scUJ
	zN+Al0pNI1F9iujcErN25wQWbT6aNVXaAGFfhvu33flBKdoTk+X3eukbmZ6Gcepnx3+h
	QOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=/b3TYUqYqV7CgKvFrtkoDbTyuGGm7GZbj/M9KbsPgAg=;
	b=Tp7ugNiQT6mZxAdPnYwNneHmSyUAPjCq0HeVfWMkAEDvnbl2W7905cEU/TA+0oIgfb
	QWiLpO8AsuOnnm40fKvxmAH8DsAszSOlBZnSlMkIcL96eupr4niGvyKyii3YaM9x7/4h
	x4a+nefnrELPaWAfmDaSND0/Eu/21Neo1Eeg0BIpa8FNOr3rmEcqXsKKPerAK4Qf4/gF
	eF0CZ6wl+CLOTZBORtXu9rs7i+2EfP4bu+iV6K39rZoKCAhwLRhqJA1XH4Qd85S+IvrX
	y7RCGpxqPnyUnEona755XkyUL8X9gfHefU4M0n2zrM8fzKWuf4HGNc9F2IYfYSyxLAnD
	uRFQ==
X-Gm-Message-State: AEkoout4qfLJp8YO9g8OG14cQh/+q3+NQQFFFdE9/38i0WA4h94ylDPjx+ykrx9Nyqry2g==
X-Received: by 10.98.77.70 with SMTP id a67mr164824177pfb.151.1470697560128;
	Mon, 08 Aug 2016 16:06:00 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:8833:ac66:d76e:6708?
	([2601:646:8882:b8c:8833:ac66:d76e:6708])
	by smtp.gmail.com with ESMTPSA id
	81sm50530787pfm.90.2016.08.08.16.05.59
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 16:05:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1470637705.8166.29.camel@linuxfoundation.org>
Date: Mon, 8 Aug 2016 16:06:35 -0700
Message-Id: <63866A53-6AA3-417A-9F72-F98288B55039@gmail.com>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 23:06:00 -0000
X-Groupsio-MsgNum: 85524
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4A7663E1-595A-4780-BEB7-95375E53D3CE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4A7663E1-595A-4780-BEB7-95375E53D3CE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 7, 2016, at 11:28 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Sun, 2016-08-07 at 01:39 -0700, Khem Raj wrote:
>> I have put together upgrade for binutils 2.27 here ( kraj/master
>> branch )
>>=20
>> https://github.com/kraj/openembedded-core/commit/b98f5761d2285ffd773e
>> c6ecb901b799302ebd6b
>>=20
>> I have started bunch of test builds. but I would appreciate any help
>> in testing it out in your
>> environments and report any issues you see.
>=20
> I ran this through the autobuilder:
>=20
> bitbake world shows issues in libunwind (from gold?):
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-world/builds
> /889/steps/BuildImages/logs/stdio
>=20
> bitbake world with no x11 also shows it:
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
> s/231/steps/BuildImages/logs/stdio
>=20
> Other than that, things don't seem too bad though.
>=20


I posted couple of patches for libunwind and webkitgtk recipes which =
should take care of build issues.

https://patchwork.openembedded.org/patch/128733/
https://patchwork.openembedded.org/patch/128731/



> Cheers,
>=20
> Richard
>=20
>=20


--Apple-Mail=_4A7663E1-595A-4780-BEB7-95375E53D3CE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlepEHsACgkQuwUzVZGdMxQGFACePa5a0wPcOYhMMieRfGfR8xim
n3kAnizI0UZx+n0NzwXr4ce3xfRq8R1X
=vAuy
-----END PGP SIGNATURE-----

--Apple-Mail=_4A7663E1-595A-4780-BEB7-95375E53D3CE--
