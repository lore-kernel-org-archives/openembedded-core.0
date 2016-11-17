Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id B0F10719D7;
	Thu, 17 Nov 2016 18:08:11 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id y23so67346510itc.0;
	Thu, 17 Nov 2016 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=XIi0SjxfreWWfW59HoPywr06R0CWHW5v6cGwyCO7Gu8=;
	b=KoxTi4URq/vnx9BBfxmv7Sp2biv6W0xLb7b9mCR00jQvpxy7dNpanxTXZsb+YKc2eS
	kmW5lY71dxheplQPVYvBQ4lVNiN2i65qpaPIT8ofiC4EpYnm8at/YcQbPbNHJu8bDd8Q
	cvtQiuQmDGWdxk1+5/ND8/V5h2/4RusFBHVaEAseHP2Aii+8VwKOzEoMo0Sb7Cvbs3qJ
	xBx9ZOGhE9Zib4Smxx2OIRbKVXpkM95z1zaCwNErM8wVQTheF2LVHoE1OB3gXq07j2pB
	ozZ0QlxpJCQwkX3pOlsOd8opnwFgy89xCVkkER1nHuvUUFFG8rOpVkhhpbGWVXBM6wnX
	gDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=XIi0SjxfreWWfW59HoPywr06R0CWHW5v6cGwyCO7Gu8=;
	b=aQYqOwT/c7vN9LqHH9KXZXf4XObc87rCQ4W53sdjjwLSGTBduxWXiH0EsEUcEeUFKS
	CtCXbCUs/ShEwU6q/5lPaaSQw1arwJfJueqa82j+O5BpYm3KSMIEd0AJFnlFQEIpxMlX
	aYJ9MidQGe+6e5DQKg4B5p57AO0Ru7E0qVQlaIocS/j+99EWlMZ733aJPfwlbf+Oomdx
	xTr8SH1kcKuus8SigAfYH/maJ0uDThUilB5J+Ck4cbc5jHUgH7n0tvUnJD59rg8jVDiO
	IRvHAKmAPfoR4z+UHyMREOmjCKES2gHwTGiizxKi0lFe5CyJuJ48LWmBQgs1fBbrAuE5
	GPVA==
X-Gm-Message-State: ABUngvfoTBIKESCUfOWFsYtJx1+sKsyQJ3bGO14h3bbgYn0IkXIYa1H3u+TEt14Bb+4wBw==
X-Received: by 10.36.82.85 with SMTP id d82mr14343527itb.95.1479406092785;
	Thu, 17 Nov 2016 10:08:12 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	c79sm1615835itc.13.2016.11.17.10.08.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 10:08:11 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
Date: Thu, 17 Nov 2016 10:06:46 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
Subject: Re: Enabling uninative by default in oe-core?
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
X-List-Received-Date: Thu, 17 Nov 2016 18:08:14 -0000
X-Groupsio-MsgNum: 89540
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="IVHmtg215F3jnkTm6xP3IKgAKanSbGvJP"

--IVHmtg215F3jnkTm6xP3IKgAKanSbGvJP
Content-Type: multipart/mixed; boundary="3ljX3IHs9EQq9ixxgCl7SEJmbCFMQ26wv";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Message-ID: <4181f25d-a2bc-bb94-2b94-4d18ad654ab8@gmail.com>
Subject: Re: [OE-core] Enabling uninative by default in oe-core?
References: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>
In-Reply-To: <CAJTo0LbvGwRpzxfOL0505w+Vz=Jhf6O3QOr5Z8SX9XaFqaZ7eg@mail.gmail.com>

--3ljX3IHs9EQq9ixxgCl7SEJmbCFMQ26wv
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/17/16 9:31 AM, Burton, Ross wrote:
> Hi,
>=20
> Background: uninative is a class that downloads a precompiled host glib=
c for
> use in the sysroot, thus isolating the native sysroot from the host
> environment.  This means greater sstate reuse, as instead of native bui=
lds
> being dependent on the host system they're able to be shared between al=
l
> hosts.  There is a reference tarball hosted on www.yoctoproject.org
> <http://www.yoctoproject.org>, and the URL can be overridden by distros=
 if you
> would prefer to build your own.
>=20
> We enable this in Poky so that we get greater reuse on the autobuilders=
, and
> due to some issues with the C++ ABI the eSDK generation in master now r=
equires
> uninative to be enabled.  The question is: do we now enable uninative b=
y
> default in oe-core's nodistro (pointing at the yoctoproject tarball), o=
r do we
> keep it disabled by default and require the user to enable uninative if=
 they
> wish to build an eSDK?
>=20
> Personally I'm torn: I don't like eSDK not working out of the box, but =
I don't
> really like oe-core nodistro depending on uninative.  Though enabling
> uninative globally does mean everything works out of the box, so follow=
ing the
> principle of Least Surprise that's what we should do.

If we are supporing e-SDK in OE-Core then we should enable uninative too
on the same lines.

It does improve the user experience so I am in favor of adding it
unconditionally. May be tarball can be hosted on oe mirrors as well for
redundancy

>=20
> Ross
>=20
>=20


--3ljX3IHs9EQq9ixxgCl7SEJmbCFMQ26wv--

--IVHmtg215F3jnkTm6xP3IKgAKanSbGvJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgt8boACgkQuwUzVZGdMxR43ACfZEiWwj3mskDJIcZcSjaKN7Je
ktAAoIDYpdwyDx1Ij4Rk+m06bXr5rrP1
=zGsM
-----END PGP SIGNATURE-----

--IVHmtg215F3jnkTm6xP3IKgAKanSbGvJP--
