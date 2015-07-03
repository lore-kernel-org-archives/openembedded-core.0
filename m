Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4F375D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 10:34:14 +0000 (UTC)
Received: by wgqq4 with SMTP id q4so84963889wgq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 03:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kMapnx5aOYivZ5vjVPcx2Qy2EP5Fpo2wqyPmBg4pM40=;
	b=lZ/t32YPrP/IzijFBx8VljhD9RIF1/Djf5qgjd2PtHjTvE0XB3N2ITmoIvUxkKU2Jt
	Ko04EeEAA560+nVHSNw6971o6pYNMB9DL2ACHUMixinfyYi4rI0T4LcW36MmiBUCZ/Ok
	83UUSMTVY/H14E/3WFffuSxjM1A8WQlZaG99Uy4OeiIBG13Ec1BjuMCRVkLcWPxuLdAz
	x+eUTcODwk77vBSbe75eMFqEzZ5iJ1S1gWx2peYTDq9jeomEnfCpAHyp+M/xyZiTL+Ox
	7ESt3DX739rqDdS9Xn32ZeAAlgUtelgi1kPLq0MqefvhZmw+l4aiD5dEdR6bXqrej6EW
	eIyQ==
X-Received: by 10.180.206.33 with SMTP id ll1mr62759228wic.91.1435919653700;
	Fri, 03 Jul 2015 03:34:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id js3sm12714826wjc.5.2015.07.03.03.34.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 03:34:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Jul 2015 12:34:46 +0200
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Message-ID: <20150703103446.GB2436@jama>
References: <1435737141-31961-1-git-send-email-jackie.huang@windriver.com>
	<CAJTo0LacneDbjFJR+uPQs__cqx+FVwXEuyCXe5zVui+Gu9tbpg@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F6D32@ALA-MBB.corp.ad.wrs.com>
	<20150703090405.GA2436@jama>
	<CAJTo0Lbdq1=ZgX5VQApdvhDfX1uF3MkT0sD_MXfQr3coN18t1A@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F7414@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0LZDcTfLFE8wsCU04m0LR1mNOb-Q1zjO2d8hRTQfTmvuHw@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11F7479@ALA-MBB.corp.ad.wrs.com>
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF11F7479@ALA-MBB.corp.ad.wrs.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xorg-proto-common: allow the empty package
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
X-List-Received-Date: Fri, 03 Jul 2015 10:34:21 -0000
X-Groupsio-MsgNum: 67525
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Content-Disposition: inline

--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 03, 2015 at 10:16:09AM +0000, Huang, Jie (Jackie) wrote:
> Thanks for the explanation. I think you=E2=80=99re suggesting that we do =
nothing for such issue or
> just tell the user to use PN-dev for this kind of packages, right?

Yes, if user wants to install PN-dev, then he should add PN-dev to
IMAGE_INSTALL not PN.

> From: Burton, Ross [mailto:ross.burton@intel.com]
> Sent: Friday, July 03, 2015 5:39 PM
> To: Huang, Jie (Jackie)
> Cc: Martin Jansa; OE-core
> Subject: Re: [OE-core] [PATCH] xorg-proto-common: allow the empty package
>=20
>=20
> On 3 July 2015 at 10:34, Huang, Jie (Wind River) <jackie.huang@windriver.=
com<mailto:jackie.huang@windriver.com>> wrote:
>=20
> I see your point, I think we can make the empty PN rdepends on PN-dev(but=
 the dev-deps QA check need to be skipped),
>=20
> then when user try to add PN, PN-dev will also be installed, so it=E2=80=
=99s not an useless empty package.
>=20
> bigreqsproto is development headers.  Therefore its in the bigreqsproto-d=
ev package.  This is not hard to understand, nor should we start filling th=
e feeds up with empty packages just to please users who can't verify the pa=
ckage names.
>=20
> Didn't we have this discussion a few months ago?  There are some recipes =
where PN not existing is unusual (avahi was a good example, and I had a par=
tial branch to fix that), but for recipes which entirely consist of develop=
ment files, there only being a development package is reasonable and predic=
table.
>=20
> (If I *had* to do this, I'd have RPROVIDES_${PN}-dev +=3D ${PN})
>=20
> I see that openssh has similar situation, PN is allowed empty, but it rde=
pends on =E2=80=9C${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen=E2=80=9D.
> That's a different use case entirely: pulling in the entire SSH suite in =
a single package whilst still allowing resource-constrained or secure syste=
ms to pull in only the parts they want.
>=20
> Ross

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWWZUUACgkQN1Ujt2V2gBwEwwCfWtfd2vtMyZcLNoIYtv9K63ur
CnYAoIUWh7XGRc3f6ui6sqIIXd6MuyGQ
=8T7k
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
