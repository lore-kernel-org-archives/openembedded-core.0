Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BA79A7722D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 05:46:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so942425pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 22:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=9++zUe9cTi+l2HTuBmqntj8Bsz3EIyFdMNLCXabx4Xc=;
	b=ICC6K5DMObu29CUhfXgHK6KSZc6/MNLwXoCokeS7dPoZaGg42nVB8tytuNLzRKf9jd
	ROsqMuMjez/TU65n7nzHQ63QQ0IRLSi8dnyy6iJ4oSZFnaEO7hMNO+1KTXUzuBjgS9kN
	RDREx2zhtU8PfDH14VRTZik4J5UDiOV1JW8zkVZk05xsxpk6U/vGP/U/lhTAQvjVWQRw
	P2rMSQK9eFy9TBN/guMiOudLoIU30ppplJIN089AQyLr2fsGHc7OllsyrP0XqZkXSaVq
	1FPBfMF1+9am5n4Cco9XecdUKf4nUeUSMOErtGW8vTgYDNjZV0JWINFkq2hiWWc8EjgY
	WdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=9++zUe9cTi+l2HTuBmqntj8Bsz3EIyFdMNLCXabx4Xc=;
	b=Fslf+/s8hjzWE9sJ82/DtROcJlXpX5Pl6xrNxzi/KhiG1PfNiY3Bk+T3OqUlTGfjdS
	uxRlaY2Fh2MLr2Oqzr8/g7iP9AzOxAskdNlNd6Gl7EIj/93DubYXGbjNXIKGfBM5ZelI
	CkAxH53M2QHVTnXO4aMGnIbaaflyNfy+dIONQkEXM4u4U9AaJkZvLu6OQwdhEqoXnSUg
	+v7bbKrFTxstJWDPGm1DSF2te+pcB/m3U421ruFKZe517HQwk/g264B1out9/lD/6Ldb
	VgKl3KkQ8WYrqys+XSkZYLjiAvxdkEa+NH10MQ9qV3anzfcULkKdNxDPin3hrQ2UE7Gd
	3iXw==
X-Gm-Message-State: AEkoouvSud/Amgsf/VQkkdH7yfwawLrth/rGP62Aaid6QpPUdgwDQUlZxt6kruDNQHPClw==
X-Received: by 10.98.68.1 with SMTP id r1mr24235571pfa.161.1470980785853;
	Thu, 11 Aug 2016 22:46:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:5ca7:11cd:bb8a:7702?
	([2601:646:8882:b8c:5ca7:11cd:bb8a:7702])
	by smtp.gmail.com with ESMTPSA id
	dz13sm9330347pac.44.2016.08.11.22.46.24
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Aug 2016 22:46:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lap6sa53wkDi_dJr-yRZiGkwHc_fuDmt8OG5ob7tgyAeA@mail.gmail.com>
Date: Thu, 11 Aug 2016 22:47:16 -0700
Message-Id: <BCEB06E0-9F66-470B-9691-95CA0DA1968C@gmail.com>
References: <1470786256-25154-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Lap6sa53wkDi_dJr-yRZiGkwHc_fuDmt8OG5ob7tgyAeA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master] curl: Update to 7.50.1
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
X-List-Received-Date: Fri, 12 Aug 2016 05:46:28 -0000
X-Groupsio-MsgNum: 85692
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2A6A9B7D-7D63-498F-A082-1824B463E40F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2A6A9B7D-7D63-498F-A082-1824B463E40F
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_C050C876-79AC-4AD3-B6D6-E269E612DAD3"

--Apple-Mail=_C050C876-79AC-4AD3-B6D6-E269E612DAD3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 11, 2016, at 3:21 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 10 August 2016 at 00:44, Armin Kuster <akuster808@gmail.com =
<mailto:akuster808@gmail.com>> wrote:
> This fixes 3 CVES:
>=20
> CVE-2016-5419
> CVE-2016-5420
> CVE-2016-5421
>=20
> Affects curl <=3D 7.50.0
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com =
<mailto:akuster808@gmail.com>>
>=20
> Master has 7.50.0.

7.50.0 has broken API which was fixed with 7.50.1 so we should upgrade =
asap.

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_C050C876-79AC-4AD3-B6D6-E269E612DAD3
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 11, 2016, at 3:21 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 10 August 2016 at 00:44, Armin Kuster <span dir="ltr" class="">&lt;<a href="mailto:akuster808@gmail.com" target="_blank" class="">akuster808@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":12g" class="a3s aXjCH m15671b210bcad86f">This fixes 3 CVES:<br class="">
<br class="">
CVE-2016-5419<br class="">
CVE-2016-5420<br class="">
CVE-2016-5421<br class="">
<br class="">
Affects curl &lt;= 7.50.0<br class="">
<br class="">
Signed-off-by: Armin Kuster &lt;<a href="mailto:akuster808@gmail.com" class="">akuster808@gmail.com</a>&gt;</div></blockquote></div><br class="">Master has 7.50.0.</div></div></div></blockquote><div><br class=""></div><div>7.50.0 has broken API which was fixed with 7.50.1 so we should upgrade asap.</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
-- <br class="">_______________________________________________<br class="">Openembedded-core mailing list<br class=""><a href="mailto:Openembedded-core@lists.openembedded.org" class="">Openembedded-core@lists.openembedded.org</a><br class="">http://lists.openembedded.org/mailman/listinfo/openembedded-core<br class=""></div></blockquote></div><br class=""></body></html>

--Apple-Mail=_C050C876-79AC-4AD3-B6D6-E269E612DAD3--

--Apple-Mail=_2A6A9B7D-7D63-498F-A082-1824B463E40F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAletYuQACgkQuwUzVZGdMxSCSQCfTHuGCFFAHohOynKOHj0tttz1
Ho4An3Ql39TilMqqMyujibE9U+hVcYdQ
=PkHz
-----END PGP SIGNATURE-----

--Apple-Mail=_2A6A9B7D-7D63-498F-A082-1824B463E40F--
