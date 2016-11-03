Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 7C56F60102
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 19:28:30 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id n85so36539430pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2016 12:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=uMM2A+v2PrUl5nhvwGf8MdREum08mzEJlkfzwQJTqMc=;
	b=Q+nehADhRQ89zKirXOhdDDkReERHXUB+Fs1Yb2NkUjwBY6WsaYlIDaAgue6FNsdr3m
	zCVepExJQBDfLiKf05pou8sCapLXWuUX0AKqUOzLm03Xw4T3+f8NHadpO34in0Xuea2O
	vOp6mLSjMUGqPur2ONalppBdRHKdojmKxp0NuL5UCMCeo3nZsZqZOaMyT7C/a13bpHx+
	DG7WbrMks12G6yY0AB7OUW93wnvfT6isO5Plvj8PfmDS1G26y9VwXITMAEJfl09z79iY
	6BM09LqRgmhMvFT7LRRG14bmXeG/eydkzlukM6ZwDROCEH6JVSVPizWBpvUb8CdxESP1
	FUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uMM2A+v2PrUl5nhvwGf8MdREum08mzEJlkfzwQJTqMc=;
	b=EunH/3sy0d766tv1QocbS2M33HJkUcdvZW7te1cCi+JJ5Ii/veDCTcQANGThKU8e/t
	mDJZUIlTehrOLRbgoaWleIZvDwYxnrQWljmSyHekAF5F5BuSQ81mI6CvEBbS8ZPiwU3+
	8JOX51sT0ep+OycUU3EGL1d1kgoWTGyVFY8U89Zks6iLGZo698KbIwsGeWqUs90b+4ar
	s6T5VqikeOYscC6xNErZSdwUOFTRNLUaUaJrWRONugHZ4tOvYSsXNVJ+4ZBBfbS7CFv2
	6gJoUoIkpwsGlCLoqTVOd4lK1njqoxpFwm/g5qxlXB3333LS+9Spid+i6XRDWguk1a1T
	iDUg==
X-Gm-Message-State: ABUngvftsq9ea+adnHLK4erLFrSgbpqcWXUvrgX5bvtrsflFmFfUg4cT6MqpDrmXZnsFxQ==
X-Received: by 10.98.214.20 with SMTP id r20mr19467787pfg.59.1478201311722;
	Thu, 03 Nov 2016 12:28:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:a08a:c533:b969:820?
	([2601:646:8882:b8c:a08a:c533:b969:820])
	by smtp.gmail.com with ESMTPSA id
	z9sm14568713pfd.29.2016.11.03.12.28.30
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Nov 2016 12:28:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LayXt5s0d+Sho6HtWiU53vnoJ5=JaZPLz5hKDXsCB_jtw@mail.gmail.com>
Date: Thu, 3 Nov 2016 12:28:30 -0700
Message-Id: <5115CF7A-C1E8-4B77-9096-AE4D363F1E0F@gmail.com>
References: <CAJ86T=Wp0B_kpgD20y2q89cL=C8hfy5AT0jF42-hiSDE-L+wKA@mail.gmail.com>
	<CAJTo0LZdGvZ2wvuwQR6v-daF8yHyq9+hTrNNAgxj2GHwMEZnBA@mail.gmail.com>
	<CAMKF1src9Pw2=6T7V3J7vmrccFkU5-POCukerpZYFQDxj8we+A@mail.gmail.com>
	<CAMKF1sp2Bft-bhJqT_C0siXFiHJyT8ouqoNQ2vmt-XGnJqw9Wg@mail.gmail.com>
	<13e6f9fa-fc42-68cf-3961-33c43d26e13f@linux.intel.com>
	<CAJTo0LayXt5s0d+Sho6HtWiU53vnoJ5=JaZPLz5hKDXsCB_jtw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: version of gdb in morty
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
X-List-Received-Date: Thu, 03 Nov 2016 19:28:30 -0000
X-Groupsio-MsgNum: 88986
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A75717AA-F233-45E3-BC54-0C0857D2B597";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A75717AA-F233-45E3-BC54-0C0857D2B597
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_378B0C16-991D-47BF-885F-8F6FE12615D6"

--Apple-Mail=_378B0C16-991D-47BF-885F-8F6FE12615D6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 3, 2016, at 7:06 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 November 2016 at 13:32, Alexander Kanavin =
<alexander.kanavin@linux.intel.com =
<mailto:alexander.kanavin@linux.intel.com>> wrote:
> Update to 7.12 for master branch please.
>=20
> To ease backporting to morty, taking 7.11.1 and then 7.12 makes sense =
to me.

yep

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_378B0C16-991D-47BF-885F-8F6FE12615D6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Nov 3, 2016, at 7:06 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 3 November 2016 at 13:32, Alexander Kanavin =
<span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank" =
class=3D"">alexander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qo" =
class=3D"a3s aXjCH m1582a82958039971">Update to 7.12 for master branch =
please.<br class=3D""></div></blockquote></div><br class=3D"">To ease =
backporting to morty, taking 7.11.1 and then 7.12 makes sense to =
me.</div></div></div></blockquote><div><br =
class=3D""></div>yep</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_378B0C16-991D-47BF-885F-8F6FE12615D6--

--Apple-Mail=_A75717AA-F233-45E3-BC54-0C0857D2B597
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgbj94ACgkQuwUzVZGdMxStywCfcnfZ3bt4qNqxK6IxdcJreq8+
nRMAn3GhcZ2JgJ6EckNLuSyyLAHtXyv5
=UUL4
-----END PGP SIGNATURE-----

--Apple-Mail=_A75717AA-F233-45E3-BC54-0C0857D2B597--
