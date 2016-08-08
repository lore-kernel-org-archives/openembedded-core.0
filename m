Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB8617716F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 15:57:35 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id pp5so114993668pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 08:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=2wWrcTe6pMkJR98wamquOAzFJHlXxMboXsVzamhv1R8=;
	b=N4JUOMCKYT46wpySeBDahjTIKhQGsDSSiwGhLAfJnjvS4svlaWGggcmeHFkXylyN4y
	80FaKAfk/pDFj9j0XPyb+qv5jzhJlTEQ+tX6+TbLaJGGrlD/EOa8m0LZRptjl6rqumXq
	hUpqT7h4XkEjNw1AVz0eAwP+TBMzP3XD1dgG9wht43nLYJetgq86UHGoYUvbjR/7GUxc
	VQr3ZO25D93Oof1RiozXeKGMZar4Hh4pMGE4FFwLaFaNXBF+DW/zVBPgV4t00ftmfLNK
	97NDtg/ZXViFq2h5k8YMBZG/sFJZ0aUlleCg7K3//pe+vUh5TYttKs/t/R2yYh7P5ObP
	fTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2wWrcTe6pMkJR98wamquOAzFJHlXxMboXsVzamhv1R8=;
	b=M5r2ZuE25BXShpo0lw3loIkIzndFgSv13bgIwE/4gpR3APgyHdjwa6821ZRdvwzkzh
	QPCBFhVaABaJ7dIS4DKoRZZUbglpFmLdVLtgqeAsMKCtuhoeM2DrkDysXxVNMK1vnXZG
	pxpWJk7NDeM1dHo2SS+9zEq7FIBfso/JW60kPJ1uFiSnNEOX9xur2o+gcwS8cFOCk0oT
	RUYHgJdyS/JGPNytq2ugC1Kqtu0WQRxPtVdTf/TptI+OhzCw4qKttGV8SdhmNFU5V56+
	B4uzAQiOPPXhV6a6B5ysKkg7hU8dWjskn/nOpvpOOmfnRr7gbT157z0GSvEqZWSMpeqZ
	ko6A==
X-Gm-Message-State: AEkoouu8thIkLYj1ZI57BgHoLDV0sasjOCUjU64HpX/2e7T1Id+ysdfSVRkFjAnblr/kMg==
X-Received: by 10.66.153.163 with SMTP id vh3mr166287634pab.0.1470671856408;
	Mon, 08 Aug 2016 08:57:36 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ddaa:6f66:32b4:378?
	([2601:646:8882:b8c:ddaa:6f66:32b4:378])
	by smtp.gmail.com with ESMTPSA id
	f84sm49157737pfd.87.2016.08.08.08.57.33
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 08:57:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZUT+9Wgf+kvtUJwJj7_W2afRciuW5PA2OfRrXYBRO-qw@mail.gmail.com>
Date: Mon, 8 Aug 2016 08:58:04 -0700
Message-Id: <EBA8A76F-AB24-4D00-851D-A8DCD856998C@gmail.com>
References: <1470204251-6173-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LZUT+9Wgf+kvtUJwJj7_W2afRciuW5PA2OfRrXYBRO-qw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH] ltp: upgrade to 20160510
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
X-List-Received-Date: Mon, 08 Aug 2016 15:57:37 -0000
X-Groupsio-MsgNum: 85467
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3FFD07CB-C9A5-4F77-9C8A-59F00874118D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3FFD07CB-C9A5-4F77-9C8A-59F00874118D
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_72093D7D-6C1C-4448-913D-61727DE7F29E"

--Apple-Mail=_72093D7D-6C1C-4448-913D-61727DE7F29E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 3, 2016, at 9:22 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 3 August 2016 at 07:04, Fan Xin <fan.xin@jp.fujitsu.com =
<mailto:fan.xin@jp.fujitsu.com>> wrote:
> diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb =
<http://ltp_20160126.bb/> b/meta/recipes-extended/ltp/ltp_20160510.bb =
<http://ltp_20160510.bb/>
> similarity index 100%
> rename from meta/recipes-extended/ltp/ltp_20160126.bb =
<http://ltp_20160126.bb/>
> rename to meta/recipes-extended/ltp/ltp_20160510.bb =
<http://ltp_20160510.bb/>
> As this recipe fetches from git if you don't change SRCREV then it's =
not an upgrade.
>=20

Please look into

https://github.com/kraj/ltp/commits/oe/master =
<https://github.com/kraj/ltp/commits/oe/master>

The oe/master branch has all the patches needed for OE, you should =
regenerate those patches from there
since many of the patches has been upstreamed but not all. That branch =
carries the latest pending patches
after rebasing them on ltp master.


> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_72093D7D-6C1C-4448-913D-61727DE7F29E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Aug 3, 2016, at 9:22 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 3 August 2016 at 07:04, Fan Xin <span dir=3D"ltr"=
 class=3D"">&lt;<a href=3D"mailto:fan.xin@jp.fujitsu.com" =
target=3D"_blank" class=3D"">fan.xin@jp.fujitsu.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3kv" =
class=3D"a3s aXjCH m1564f019b65e6bf9">diff --git =
a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20160126.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">ltp_20160126.bb</a> =
b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20160510.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">ltp_20160510.bb</a><br =
class=3D"">
similarity index 100%<br class=3D"">
rename from meta/recipes-extended/ltp/<a href=3D"http://ltp_20160126.bb/" =
rel=3D"noreferrer" target=3D"_blank" class=3D"">ltp_20160126.bb</a><br =
class=3D"">
rename to meta/recipes-extended/ltp/<a href=3D"http://ltp_20160510.bb/" =
rel=3D"noreferrer" target=3D"_blank" =
class=3D"">ltp_20160510.bb</a></div></blockquote></div><br class=3D"">As =
this recipe fetches from git if you don't change SRCREV then it's not an =
upgrade.</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>Please look into&nbsp;</div><div><br =
class=3D""></div><div><a =
href=3D"https://github.com/kraj/ltp/commits/oe/master" =
class=3D"">https://github.com/kraj/ltp/commits/oe/master</a></div><div><br=
 class=3D""></div><div>The oe/master branch has all the patches needed =
for OE, you should regenerate those patches from there</div><div>since =
many of the patches has been upstreamed but not all. That branch carries =
the latest pending patches</div><div>after rebasing them on ltp =
master.</div><div><br class=3D""></div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_72093D7D-6C1C-4448-913D-61727DE7F29E--

--Apple-Mail=_3FFD07CB-C9A5-4F77-9C8A-59F00874118D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleorBEACgkQuwUzVZGdMxTfsgCeMefBHscVPtCV9sQEA6E4eptA
gB8An2DEuvKLNWWuuFvRJag6y52bVTSQ
=yF3Y
-----END PGP SIGNATURE-----

--Apple-Mail=_3FFD07CB-C9A5-4F77-9C8A-59F00874118D--
