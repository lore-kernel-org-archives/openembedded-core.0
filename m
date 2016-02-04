Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1EA771F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 03:08:48 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 65so28395920pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 19:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=TFCPbucUvtrtXNyMq4/0A0OY/fAGQzfceHHOdbs2P8U=;
	b=bZgUswcTU50trN0AsHlqLkwnEjnF5tYwo9agfoPZvyiD9qg6j1NZxY0eCIShd8t+R+
	xyUbauQzbxtqE/3UUmm1GUMu0aq+rGsIexeywV/lWxpAZvVG9+TT6Y2Nbl1U5i+pzU+H
	YfcJqdbu0wv5Me8tnhMCzHLOZN9WID6+mFd+B0swqAlDSKAzoxRbqSm4wcjH3nS3tXeR
	W5tKioX70sPh/j8EuJzZXMQlrTffxX1f6TtsTS2K4A0/vAWNIAhHcOfD1GRzig7/f98u
	8lx8sKb4SX1HdbIFPD5DMb5xXAyUAdR8UPEi7LtXI6rqP5c65wDfR8MtUd5+OaTdH+2S
	iTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=TFCPbucUvtrtXNyMq4/0A0OY/fAGQzfceHHOdbs2P8U=;
	b=Sjpo7Vrp6SIbbccTGlA7f6mSFfE++zr/rQ+nz+QPJLxQdDCSxrmQR28SKTIyQ8h5sj
	F9FtplXGQK8QBJRdkyie64UYNIpk/8TV3TXCfGUM7RGLffPr2V6rxf5qawmobaXUc0UN
	Iof4BjhuatCnnfdkMBGWFFzziywSe3n2KGMkU+krsrtBkuB5WTu7ctz/rXLxRwWJ7qrU
	07lqHl3Z9PsH+llcxenbAKy7Po76imB3OOZ1nJcBz49M/0wyju9Xyw8puIlSngNwgSIT
	/y3Jts2XxdjNGcBeUPCxDmy/gR+IDBGoo4/gsRFiPYWgQ5KT0uer7Tj+IdhHYRtghVXa
	b8QA==
X-Gm-Message-State: AG10YOTBq6shN6x+/XddTwpJ8nnv9CnqEuoOhLMIjGL6VqTfyHM8USY/4w/iu8c23V3AUA==
X-Received: by 10.98.75.22 with SMTP id y22mr7679308pfa.147.1454555329937;
	Wed, 03 Feb 2016 19:08:49 -0800 (PST)
Received: from [192.168.0.4] (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ya4sm12850491pab.22.2016.02.03.19.08.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 19:08:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56B2C02C.90607@gmail.com>
Date: Wed, 3 Feb 2016 19:08:44 -0800
Message-Id: <1F06A159-1BC5-4008-92D0-B7939CE41A17@gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
	<56B2C02C.90607@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Thu, 04 Feb 2016 03:08:49 -0000
X-Groupsio-MsgNum: 77503
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BA6E0157-4C34-4C13-9C4D-28F406CBF93C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BA6E0157-4C34-4C13-9C4D-28F406CBF93C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 3, 2016, at 7:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>=20
> On 02/03/16 15:32, Martin Jansa wrote:
>> This could be caused by chromium using own bundled binutils where the =
version doesn't match, I've solved it in our recipe by:
>> +GYP_DEFINES_append =3D " linux_use_bundled_gold=3D0"
>> +GYP_DEFINES_append =3D " linux_use_bundled_binutils=3D0"
>=20
> w00t!! awesome. works for me :-)
>=20
> So it looks like we both have working chromium recipes, yet the =
upstream one doesn't work. What version are you building? For what arch =
(which archs)? x11/wayland?

please submit your patch for meta-browser

>=20
> I have a working recipe for 50.0.2636.0, but I'm only interested in =
x86_64 and x11. wayland+ozone is a whole other mess ;-)
>=20
> At some point it'll probably be easier if we build chromium with =
llvm-clang, the same as google is doing. Is that possible?

you can try using meta-clang

> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_BA6E0157-4C34-4C13-9C4D-28F406CBF93C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaywL8ACgkQuwUzVZGdMxQWZACfdJBGqXWAhzb/NSWRuVHgQDGZ
yc4An02O6FL/UPKerNDjaQ1MoUBZFwJc
=b9e7
-----END PGP SIGNATURE-----

--Apple-Mail=_BA6E0157-4C34-4C13-9C4D-28F406CBF93C--
