Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id C34AF745D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 07:21:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id o37-v6so524077wrf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 00:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=LCAV4LGeHLljgUV+wMn8OrncLtIRbUJYu76mEVZDRBo=;
	b=rYG9QdXh+cKuR1jDBw2Jc+MkTmQbTAmPWGZmVPzZl5DgUjHj1IwOAukd0GeCq6UMO2
	5bvn+T1tOSydERwtdBs+PgXYfFWhVzVrjuoIKKVkH0W2tvujbGOMBK51OashwLrZlaOf
	f/aEhF/UA8lsegoSXNbfDS7KjGMYW6aQT0ZvvuRsZ08DZeSwFBz7O/hWzqy/Hpm1c44v
	4sW1+Ah6lQG6F/s/Cow2vk6UqtVHzfjCmhEcgdR0chbyIV+B3gZ5lN7mg2Doj4cU1xQp
	kOHQWufl8yc0BypCz48nLM4RUFUlfAuCJveHPKozAJ2M7epl8ntVYVZD21PMKVRD//hD
	oDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=LCAV4LGeHLljgUV+wMn8OrncLtIRbUJYu76mEVZDRBo=;
	b=kGQ22C0Zl4kIstLaA3pt1bur2AxLZVdjgB6bqP8YC3/MzxF9X/38DDts4Qtyel5nh7
	XrmE0U/xfZ7ZmbU15bdi/SGzUzwKKVzXcAblu/OC3gK/P+CvVxEUHZFY8keUpnKTXNBS
	8kVZhSBJxujRA5Ixa8BPUtSJTGhyEtYM83mBu8GGEhWnTEHae2qRdpjHGOTXeRpjGyqU
	W0+tStklEMSmPRkKpLQF6WiCwCnKxlQudcqfKTrf6+ZdLHy1GewiEXGhkp7p7l6hf0D5
	aDQIxXI2lzOozjBjx70c+4GG2EdSpiyoWYrKnaXP+IIy3EVIH2D9AC54PS/+8hzln0/K
	9Bug==
X-Gm-Message-State: APzg51Ac60ERBdm1GIfwzOxpMFjEgudv3EbriLAjqsYQNOMGXlXCxJgF
	+pTaKp9ODtcbwdAgsSXubjM=
X-Google-Smtp-Source: ANB0Vdbvi+wprQXxtPtxh39D7GBt3agzxlohsx3fbhW9bT4SrKuOCy2WVxmm8vfTggpfXqKjd1Fhlw==
X-Received: by 2002:adf:8485:: with SMTP id 5-v6mr247368wrg.34.1535440908367; 
	Tue, 28 Aug 2018 00:21:48 -0700 (PDT)
Received: from [10.42.8.207] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	j11-v6sm245797wrr.37.2018.08.28.00.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Aug 2018 00:21:47 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <90CD9834-5DC6-4700-8CFA-53634E2A2EA0@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Tue, 28 Aug 2018 09:21:45 +0200
In-Reply-To: <20180824080738.6061-1-raj.khem@gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20180824080738.6061-1-raj.khem@gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "cpan.bbclass: adopt to recent EU::MM"
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
X-List-Received-Date: Tue, 28 Aug 2018 07:21:48 -0000
X-Groupsio-MsgNum: 115500
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B1A02EC3-25CD-43F0-B769-8B2BBD7B544E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_B1A02EC3-25CD-43F0-B769-8B2BBD7B544E
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B5F372AD-D8DB-441E-95B3-52936FE26D0B"

--Apple-Mail=_B5F372AD-D8DB-441E-95B3-52936FE26D0B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 24.08.2018 um 10:07 schrieb Khem Raj <raj.khem@gmail.com>:
>=20
> This reverts commit 2e61533e7c1b1cfd49dc771e907207f11a15c44f.
> ---
> meta/classes/cpan.bbclass | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
> index 926c6358a6..8e079e0d55 100644
> --- a/meta/classes/cpan.bbclass
> +++ b/meta/classes/cpan.bbclass
> @@ -16,7 +16,8 @@ export PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
> export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
>=20
> cpan_do_configure () {
> -	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 ${EXTRA_CPANFLAGS}
> +	export PERL5LIB=3D"${PERL_ARCHLIB}"
> +	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
${EXTRA_CPANFLAGS}
>=20
> 	# Makefile.PLs can exit with success without generating a
> 	# Makefile, e.g. in cases of missing configure time
> --
> 2.18.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


This one shouldn't get tested together with
   2387c0d3 cpan.bbclass: make RPATH fix more general
since the hacked PERL5LIB=3D"${PERL_ARCHLIB}" hides the broken RPATH
behavior.
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_B5F372AD-D8DB-441E-95B3-52936FE26D0B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 24.08.2018 um 10:07 schrieb Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com" =
class=3D"">raj.khem@gmail.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">This =
reverts commit 2e61533e7c1b1cfd49dc771e907207f11a15c44f.<br =
class=3D"">---<br class=3D""> meta/classes/cpan.bbclass | 3 ++-<br =
class=3D""> 1 file changed, 2 insertions(+), 1 deletion(-)<br =
class=3D""><br class=3D"">diff --git a/meta/classes/cpan.bbclass =
b/meta/classes/cpan.bbclass<br class=3D"">index 926c6358a6..8e079e0d55 =
100644<br class=3D"">--- a/meta/classes/cpan.bbclass<br class=3D"">+++ =
b/meta/classes/cpan.bbclass<br class=3D"">@@ -16,7 +16,8 @@ export =
PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version<br class=3D""> =
export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"<br =
class=3D""><br class=3D""> cpan_do_configure () {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>yes '' | =
perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor NO_PERLLOCAL=3D1 =
NO_PACKLIST=3D1 ${EXTRA_CPANFLAGS}<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>export =
PERL5LIB=3D"${PERL_ARCHLIB}"<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span>yes '' | perl ${EXTRA_PERLFLAGS} =
Makefile.PL INSTALLDIRS=3Dvendor ${EXTRA_CPANFLAGS}<br class=3D""><br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># Makefile.PLs can exit with success without generating a<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span># Makefile, e.g. in cases of missing configure time<br =
class=3D"">-- <br class=3D"">2.18.0<br class=3D""><br class=3D"">-- <br =
class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">This one shouldn't get tested together =
with&nbsp;</div><div class=3D"">&nbsp; &nbsp;2387c0d3&nbsp;cpan.bbclass: =
make RPATH fix more general</div><div class=3D"">since the hacked =
PERL5LIB=3D"${PERL_ARCHLIB}" hides the broken RPATH</div><div =
class=3D"">behavior.</div><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_B5F372AD-D8DB-441E-95B3-52936FE26D0B--

--Apple-Mail=_B1A02EC3-25CD-43F0-B769-8B2BBD7B544E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAluE+AoACgkQRJmWrtzl
Cp3+9hAAsHhT3gch9lDzIqN8xYrVKOX9lSwbewhn8KQWJ6xAGr/9vZY7IN24NXPc
ih3UXR1bJXCDVhAfXvbcgz5RdBjC+XgDmVqfVrSgdhgKg36p1DO9+n7PaH06388f
5YC1SWIIAo17C47iSV2g2S2vYOi+wrVlqMDxBMYgB4yFxjVoK5WnOPEPooorLOFf
2lGYkqy3vC9GHvWscqoMAhTLPtAKZEDZdXrRXHxncR/qu//xJ1UwRJkxGI4I3l7r
1TArD/+k7VdRSsxpDCwk9yepp9rOmj1ZSZwMoHb71LNIO9orec575XyvW9dxhmwF
Uf9irF2n8spYr11e+bLuPnafDbIjeXujs154anTj/Oa0s60vcqA3vGFcefsI4IGx
tl759q9KF0aeWV9Vq3gxOu8IScyKlM36tIqTGxW9PvuYGjygU4qaX/ChQP081psz
MgbnUaniGtB7nKKkpwpP5au6RhhayU+h5CiIZ9LPM2DSvZbfK+R3UdMtS+m6FVtS
ayAVnAwK2VsiEJZ6+mGsfsKL7KjLt7uzpd4864d9eRH8wTcpF7wFemKRY+tDJN4P
ruZIbGl4n/WaNoETmaJbzwAUPttLINlC+BgMQ9LmAJgVgTKo3LrcgVA7j8dkL60O
YDjayQ9BRxU02CnBjsRdpj+PedIFSyVlPkLAL9iFvkkTChxJzIk=
=qqlZ
-----END PGP SIGNATURE-----

--Apple-Mail=_B1A02EC3-25CD-43F0-B769-8B2BBD7B544E--
