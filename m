Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0A971A15
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:46:22 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id n85so116375854pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=mlmhG5tyyn9WcHmlIg+4qjumvqEyP3Zy+e2EZdDuoLs=;
	b=okVdMSrNVDMydt5sG39KYyp6H1NbeyDfwkbaRJohQ8yhW7+Dub5viVZesuShPBm+6m
	xc/ygcGhJbbvk2TZj82Oi/jnrvJutt+gJHvGJWOEwN/uhIDaTpx4c8QeTvvuW+jHTSJW
	ZxvXswIJV1o12QdnwdfozQmVHZUxX2/x6dd/nUPHcnPpatz6KZ+kzby32mQ5EEdleG7W
	y1Gbb9JR0vAGGLdqfUBK8AS7e88AhPJJHrqtwlT87HDOOuOeIOIl+DFxlqLgW30t7o6O
	ykEyOsQbeR6XXhHDuwdomCdy74W7uBfCDzdsGQTeolP3XU+SAmHDa44vAZEFzQnBJc9x
	clpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=mlmhG5tyyn9WcHmlIg+4qjumvqEyP3Zy+e2EZdDuoLs=;
	b=b4VIr+Ge/l66dc8XWDFcMTxKe5O3kjS8IlnKvhe+3bOPmk30eyJuX2f3+pEPYsbE/E
	cLRnqEyrsNhxM+4KRum8+UOJoxa8YBRLq7k7sOMQ2MxyYEo8XmUv0zFXvHJA3hLL6GBS
	TboqDBjN5v4NmZmM5BtU8oNtc39MKFfz4gWq8zBAbeau/zvlrnApk0lwPwdjkOE4hlNc
	NGwtRBwAWUQqewB5/NRO2o/0fROC7UCBFcoPycdwNU48cURkupbemjanM/eLxT522OlH
	A4BUbbpC59zkUyCN8I2Mu9OkYkd0dny54WoiUX3o8lsvN8AqdjwFQOwHd/jj69p3JP+Z
	/riw==
X-Gm-Message-State: ABUngvfeRjOxghQ+fMoAdSZ5PRop+aWwjNgbYwZhZ4C7FH6TBHAEBPIQqHNqaPVIKW/sCQ==
X-Received: by 10.99.163.1 with SMTP id s1mr10641873pge.126.1478652384226;
	Tue, 08 Nov 2016 16:46:24 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:8af:972a:9de4:9514])
	by smtp.gmail.com with ESMTPSA id
	yp3sm50831849pac.22.2016.11.08.16.46.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 16:46:23 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
	<20161108171235.41837-13-Zubair.Kakakhel@imgtec.com>
	<CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <5ac79668-0555-5329-e9d3-048ee217d3ff@gmail.com>
Date: Tue, 8 Nov 2016 16:46:21 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2 12/14] ltp: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Wed, 09 Nov 2016 00:46:24 -0000
X-Groupsio-MsgNum: 89178
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="feF1iISCTuaHTNumcmhdeRo577ImHq0E9"

--feF1iISCTuaHTNumcmhdeRo577ImHq0E9
Content-Type: multipart/mixed; boundary="RBtuB4tXitOHLwgR9mGDsIehBTCxpsQfO";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <5ac79668-0555-5329-e9d3-048ee217d3ff@gmail.com>
Subject: Re: [OE-core] [OE-Core][Patch v2 12/14] ltp: Reduce duplication in
 MIPS variants.
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
 <20161108171235.41837-13-Zubair.Kakakhel@imgtec.com>
 <CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>

--RBtuB4tXitOHLwgR9mGDsIehBTCxpsQfO
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/8/16 4:13 PM, Burton, Ross wrote:
>=20
> On 8 November 2016 at 17:12, Zubair Lutfullah Kakakhel
> <Zubair.Kakakhel@imgtec.com <mailto:Zubair.Kakakhel@imgtec.com>> wrote:=

>=20
>     Reduce duplication in MIPS variants now that the MACHINEOVERRIDES
>     variable is defined
>=20
>=20
> I'm guessing that this is the cause of this error for qemumips64:
>=20
> http://errors.yoctoproject.org/Errors/Details/99744/

seems to be yes.

>=20
> Ross
>=20
>=20


--RBtuB4tXitOHLwgR9mGDsIehBTCxpsQfO--

--feF1iISCTuaHTNumcmhdeRo577ImHq0E9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgicd0ACgkQuwUzVZGdMxTPOgCfXdus6wHtcZjliCXKn7VU30Cq
qzwAnj65CUJOfiC8eCf7p1LdsXUdC4pI
=w9/4
-----END PGP SIGNATURE-----

--feF1iISCTuaHTNumcmhdeRo577ImHq0E9--
