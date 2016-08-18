Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id DCEBC731C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:58:09 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id h186so471694pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=OGee1szbwr/li3aeIuV3vY7ChnRKCd3Vcsw2QR2/Pew=;
	b=Sg9joozUZnNE/R1mIyRqiJvL1RJpFqIIN4RUZjJbrSTAv1VbmLEXHHEPyw5ZfRkgX7
	J8NR1mc6xP/Kody0wpgMpdtv2PxovNMKbPKLPGrD2GvlXPbdgVLSPlnXlWcaYXzth6iN
	hl/rq+v0YVC9XbacI6muk7h0f6yilBSX+8H2+AvyxAdwzhCM2+I77BRK7P8ZWOvHtlG8
	pR9vW6R24rZAX7geKAwBd66PQyUW6WoC77PKi5P6iDmnvTEIQOxxO7ZSMhwmVjgZvvle
	NnlpmD6fHnAXsY1HJ1ofc/bkT67ca49RC/Ii71Ch/i9Mjxs2Zy+IVBxWLv3YbiMH07AU
	bHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=OGee1szbwr/li3aeIuV3vY7ChnRKCd3Vcsw2QR2/Pew=;
	b=Ndfd+kl4Phx+icBtAlXhORrgktKVSZHUyeUYyiHrqS4HoeDYVHfJXtJqyu/wFno89Y
	xo6OF0TOzrsXc2btnTDsyV2oqgaIwSCSSNerc/dEYqakdqvjGqg5lgOOOCldokcnEAw/
	HbDijlSEcsuCFKR8zZ93QHUSAgJc1IOrmhcPwgHjGka5zGwChdbA0cfVX3oD6s7+HNfg
	zvBGWohgOhh8InpP3g4EWQeSS1iZf1Kkjadjzu+q05EDbehnpVKLyvA81HsOKRvbgKf4
	I9c+dew8FFhaOZvAWvHVWHUYSpoRmumK90wThBvbNVf1wDgn1qLI4OXnxjngVxGq+yFo
	fIrw==
X-Gm-Message-State: AEkooutF8PMtEmJ3HfgfkrMfp7n0NQrtsxZW+dKmQxF8X7QkLBNgqHBhV3NIXan4sr5tnQ==
X-Received: by 10.98.108.3 with SMTP id h3mr6272688pfc.162.1471543090349;
	Thu, 18 Aug 2016 10:58:10 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id a5sm324297pfc.89.2016.08.18.10.58.09
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:58:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
Date: Thu, 18 Aug 2016 10:58:04 -0700
Message-Id: <56847BB1-DCA8-446D-9418-2D42098A7073@gmail.com>
References: <1471499308-1666-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
	<CAJTo0LZy-mx4K=eSJdNRq12JVDzGwW+Oe0uf40YRZAmyWVJsZQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: 2.34.0 -> 2.35.3
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
X-List-Received-Date: Thu, 18 Aug 2016 17:58:10 -0000
X-Groupsio-MsgNum: 85915
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6968D3A5-5292-4783-8D9D-145342F43E53";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6968D3A5-5292-4783-8D9D-145342F43E53
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_6747993F-E7EA-4813-9764-07A4DDA12E88"

--Apple-Mail=_6747993F-E7EA-4813-9764-07A4DDA12E88
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 18, 2016, at 4:33 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 18 August 2016 at 06:48, Wang Xin <wangxin2015.fnst@cn.fujitsu.com =
<mailto:wangxin2015.fnst@cn.fujitsu.com>> wrote:
> Upgrade gdk-pixbuf from 2.34.0 to 2.35.3.
>=20
> 2.35.x is a development release, so stick with 2.34.x until 2.36.0 is =
available.

perhaps recipe updater script should account for such presets ?

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_6747993F-E7EA-4813-9764-07A4DDA12E88
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 18, 2016, at 4:33 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 18 August 2016 at 06:48, Wang Xin <span =
dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:wangxin2015.fnst@cn.fujitsu.com" target=3D"_blank" =
class=3D"">wangxin2015.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4ip" =
class=3D"a3s aXjCH m1569c3311408dd51">Upgrade gdk-pixbuf from 2.34.0 to =
2.35.3.<br class=3D""></div></blockquote></div><br class=3D"">2.35.x is =
a development release, so stick with 2.34.x until 2.36.0 is =
available.</div></div></div></blockquote><div><br =
class=3D""></div><div>perhaps recipe updater script should account for =
such presets ?&nbsp;</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_6747993F-E7EA-4813-9764-07A4DDA12E88--

--Apple-Mail=_6968D3A5-5292-4783-8D9D-145342F43E53
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle19zAACgkQuwUzVZGdMxQGRgCeJpqiVTeeptUBJDxxA5Nk7grq
Ac4An1YMpK9o7AVCdD1yEnhfrS0zfjkW
=GbtL
-----END PGP SIGNATURE-----

--Apple-Mail=_6968D3A5-5292-4783-8D9D-145342F43E53--
