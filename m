Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 581D7719F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:41:23 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id r16so61113858pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=OMo7PBDe/y8kaTetuzKiADnVehn15cwRJQUqapqxOUA=;
	b=UW8XTAgluoszzIGMZeHptwQUPF58/BoqKcLIhsQA1hKeAkN+bugqTpb3C0H2twLavY
	Nrw8/10RtZwKnLlu1dn2sjGCIKDPTZLzE1DVd3NBCU73RPFgRg1Eaq8s63G2CvgK7f/I
	+AKFSs3brrVrUjHOfCpeE5wc0ygbxcaoD+ckUx8crFc4ZLUsFzankdgZ0ynXj+psDoMM
	r31d7sl2clDNbUDwtz0Tk/+MznoRvnUmwoIflCMndD2lg3Ks71xYfJoZUSWcc+Vc4gMT
	NttfxWU1xjHI9Fsb7CIrPnrd82/FbzWY1lRzr4lb6gsgYjyDc9NA5T9sJ5qMVdQW2zuq
	ncNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=OMo7PBDe/y8kaTetuzKiADnVehn15cwRJQUqapqxOUA=;
	b=jBsUllHF1WKwXk7fFncBqDAsTAekwqF+Uiz7erjuZpBqi8CSk+Lec0LnDnnG4QvebU
	zKE96yEcEYa86Te06g0nNkn09lWsgutvLpTgO1EwrbeBKcsCZ3QtBOiCKJ+jEbtFknm9
	uFGeblZdiJ4KmTHzjEJhdyjBtJrZfHuA6A91c2TpvwyH1zkVCqPxRN0OyZUoHMJQz0Ub
	g8SdCy4afhUWPq/MOitAwN5hQ0OnGNOqnnwzRh+Jz/BiW5azLfwW11k1AZCo/vmN5Pzm
	y0sSnWh1DS2jdv1mHSkSm5es/x0ezgQGfsjRRCCpLC8vk25nXnSodaXhhvu1zotTnc0G
	jQJw==
X-Gm-Message-State: AA6/9RlNCQ9y+Mgc8UDH7rCqFYccf/dwrtyfMTYStO5XmhPj0bgiVuMY1vJgpwsUiN8wnA==
X-Received: by 10.99.36.65 with SMTP id k62mr78830pgk.88.1476747685210;
	Mon, 17 Oct 2016 16:41:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:ec00:906:f8cb:31c1?
	([2601:646:8882:b8c:ec00:906:f8cb:31c1])
	by smtp.gmail.com with ESMTPSA id 3sm50556877pfo.31.2016.10.17.16.41.24
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:41:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
Date: Mon, 17 Oct 2016 16:41:23 -0700
Message-Id: <D3C9AE63-D4E7-4905-BF0C-6C49331FED6C@gmail.com>
References: <35a67fa817544a4fa1a59f5ceef6b8db@HEL-EXCH-02.corp.vaisala.com>
To: vesa.jaaskelainen@vaisala.com
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Two kmeta's not allowed for master?
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
X-List-Received-Date: Mon, 17 Oct 2016 23:41:24 -0000
X-Groupsio-MsgNum: 88295
Content-Type: multipart/signed;
	boundary="Apple-Mail=_AABBD39D-C24A-41A2-B303-F0F06D352324";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_AABBD39D-C24A-41A2-B303-F0F06D352324
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


> On Oct 11, 2016, at 6:15 AM, vesa.jaaskelainen@vaisala.com wrote:
>=20
> Hi,
>=20
> I was trying out how well 'master' branch compiles in our environment.
>=20
> We are using meta-xilinx and then we have custom BSP layer which =
bbappends linux-xlnx.
>=20
> When using meta-xilinx as standalone (w/o our BSP layer) I can get it =
to compile.
>=20
> However when using it with combo meta-xilinx and our BSP we get =
failure on do_kernel_metadata due to missing scc files.
>=20
> It seems that there can no longer be two kmeta entries in SRC_URI.
>=20
> meta-xilinx's linux-xlnx.inc has:
> file://xilinx-base;type=3Dkmeta;destsuffix=3Dxilinx-base
> our bbappend has:
> file://meta;type=3Dkmeta;destsuffix=3Dmeta
>=20
> In krogoth this works fine.
>=20
> Is this expected change?

I guess you need to map your changes to master branch of kernel metadata =
probably
guessing since I dont know what you are doing in your BSP layer

>=20
> Ps. Sorry for html version of this same email.
>=20
> Thanks,
> Vesa J=E4=E4skel=E4inen
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_AABBD39D-C24A-41A2-B303-F0F06D352324
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYaMACgkQuwUzVZGdMxQa5ACgkWVcDBZeXygN3G/NDkX2AETU
mloAnRmN8XGdb7yuuZQvPu9FygviYKSP
=dhgV
-----END PGP SIGNATURE-----

--Apple-Mail=_AABBD39D-C24A-41A2-B303-F0F06D352324--
