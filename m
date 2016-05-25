Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id A32C760620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 07:38:51 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 67so12725744wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 00:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=2+50u+CSf9htsvpHFwS/145o1MDSuUFs4JVUKLKg2jI=;
	b=VCdei5eO9suMCrnat6luJBz0RQElwLqWb23K7DtOKPWvPgkZ3uEg3Bah9I+jEtS/DV
	Fb8OK1k+QR7rx1wrNIzJeIUuZYKTR4/wC7I2IJ8JgS9qDuIMQtChqGZ1uhP5w0VH7VQZ
	pBo1CNv3s/KU4bXFLC1HmTv/ak4UDo/t3CrVEDVwvB9vL80dFgsuMkPxONchwSHHrO0f
	pn9dGgETJ6aS1LDGyln5DgI247SoiZ9wbNqlOYhMoHOQrS8MsCwXr2jcKbCMVgWD5uE0
	GruG8IqZv4l7HZTfjLSIBoFOLu8v6cjShZgb2wynDjh442rhazh15Lm0gbbPbq4Gw5y/
	q/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2+50u+CSf9htsvpHFwS/145o1MDSuUFs4JVUKLKg2jI=;
	b=OGLMGWav5A2JKK+liKSTEQcFrKfRGk/nhcAFzlqss3AnhQQ4+NeK+10eiiP3N/Xf1i
	xnEoRG0whW3y7zPDt1s6Bt8DLiMfPdSwRK7v5bBYo8bM1+ldSdbU/7fsHmFVdpQsY/Un
	Fz0dh5W6I5EbeXA/PAzvTSw+U68hSdSwXlCHtx8OzM/1/m7Q2y68gv54PkksyLU0QYcX
	1cDyx4GNmx0yWsy9JboJFhSFqkq2NmJBRvA1SRh+0h0jt4HQNF+8r1jqf6pLbG6l0Su3
	tkEj1McM6Vdh7bHuEcWQIy1R3dlkLvhJbl9t4IjmFOaLOkEUMOUnDqoI/uw/pOJjDlKm
	raog==
X-Gm-Message-State: ALyK8tJGYSuXYkiF4/2ByH5vEzaBH/F5iFnbJNjHUXeGQ8Hbl6DRER5YVo9Y/Sthvm+Yug==
X-Received: by 10.28.94.12 with SMTP id s12mr1898413wmb.54.1464161931781;
	Wed, 25 May 2016 00:38:51 -0700 (PDT)
Received: from [192.168.1.3] ([80.106.206.16])
	by smtp.gmail.com with ESMTPSA id c62sm7679689wmd.1.2016.05.25.00.38.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 May 2016 00:38:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160524173531.GA6413@ad.chargestorm.se>
Date: Wed, 25 May 2016 10:38:45 +0300
Message-Id: <586E3EB1-7F27-4176-A884-473B6B0A2F1C@gmail.com>
References: <DB5PR07MB1431386E8583B4F0F5204924C54E0@DB5PR07MB1431.eurprd07.prod.outlook.com>
	<20160524173531.GA6413@ad.chargestorm.se>
To: Anders Darander <anders@chargestorm.se>
X-Mailer: Apple Mail (2.3124)
Cc: Matthijs Vader <mvader@victronenergy.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: wic wks: data partition only mounted on second boot?
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
X-List-Received-Date: Wed, 25 May 2016 07:38:51 -0000
X-Groupsio-MsgNum: 82630
Content-Type: multipart/signed;
	boundary="Apple-Mail=_84CD88E3-B1D6-4CD4-AE27-3851E460AC1F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_84CD88E3-B1D6-4CD4-AE27-3851E460AC1F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 24, 2016, at 8:35 PM, Anders Darander <anders@chargestorm.se> =
wrote:
>=20
> * Matthijs Vader <mvader@victronenergy.com> [160523 13:37]:
>=20
>> Hi again, fixed and found it myself already. There is an error while =
mounting that
>> partition on the first boot because the mount point (/data) doesn't =
exist yet.
>> Then, later during first boot, some application creates it. Which =
explains why
>> it does work on the second boot.
>=20
>> Which brings me to a new question:
>=20
>> Is there are reason for mountall.sh to put all errors into /dev/null? =
See:
>> =
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes=
-core/initscripts/initscripts-1.0/mountall.sh#L20
>=20
> Good question. To be honest, I don't know.

you need to ensure that wherever you want to route the logs to, should =
be mounted and ready for writing.
/dev/null is easiest.

>=20
>> Or shall I send a -tiny- patch dropping that 2>/dev/null?
>=20
> As long as it doesn't produce too much noise (i.e. errors on normal
> boots etc), sure do that. At least as long as you check that it goes
> into the syslog / journal.
>=20
> That would probably help people debugging certain issues.
>=20
> Cheers,
> Anders
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_84CD88E3-B1D6-4CD4-AE27-3851E460AC1F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldFVogACgkQuwUzVZGdMxTejACZAeYjEeuq5SDnRcLf4d1kk8JT
SE8An353iNjmChHh/36OhMRIIXl0l49L
=gjKE
-----END PGP SIGNATURE-----

--Apple-Mail=_84CD88E3-B1D6-4CD4-AE27-3851E460AC1F--
