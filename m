Return-Path: <paul.betafive@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 05B6F609BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 12:00:07 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id z11so1218321lbi.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qLzK73RnLmxA30WVVWFbHRoWT0ju9TmccXqAnjCxSV4=;
	b=ccXq+AAm5FBoP+WD0wdgX3xiFr8MO9yNtavzX8Q22xk/LAe8jTnWOr3obmgwBUOcn0
	tPojelIW7HoUaR9DqdVyIF7CZtEGVGrbIa7iHiAzXsLR710lLUSZT8URw5n5FewP2AM4
	MYQBL/YfOBm6/dC3SG9ZdnEaQtxUxOc6GTwmsanI3+zLzZIqzrEpBkZIXKwGY1xVEUCF
	s7jSLflxreuxDhbMFJGnkrZW4dWeNhbrpEPCd/Y7u7OOG2qmnFmJIR/tHfLt6qozro5w
	i3OxC9vDtuX5qecv7u/92c7WuQh8bU9HYvdS8P7ZPWq4HJCYKKaz8+Sbx+YYmo9FIKnr
	Q6Hw==
X-Received: by 10.152.170.227 with SMTP id ap3mr25097297lac.15.1411387208085; 
	Mon, 22 Sep 2014 05:00:08 -0700 (PDT)
Received: from gmail.com (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id y7sm1453888lbp.46.2014.09.22.05.00.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Sep 2014 05:00:07 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
Date: Mon, 22 Sep 2014 12:00:04 +0000
From: Paul Barker <paul@paulbarker.me.uk>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20140922120004.GD32340@gmail.com>
References: <1411109378-27850-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYdghqD+V_0QDCV-dgsEtrU4vSPZjG60Da+BCogkwZ+gQ@mail.gmail.com>
	<541F6BE5.9000002@windriver.com>
MIME-Version: 1.0
In-Reply-To: <541F6BE5.9000002@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gnupg: add pinentry RDEPENDS
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
X-List-Received-Date: Mon, 22 Sep 2014 12:00:19 -0000
X-Groupsio-MsgNum: 57996
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BI5RvnYi6R4T2M87"
Content-Disposition: inline

--BI5RvnYi6R4T2M87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 22, 2014 at 08:23:01AM +0800, Rongqing Li wrote:
>=20
>=20
> On 09/19/2014 11:08 PM, Burton, Ross wrote:
> >On 19 September 2014 07:49,  <rongqing.li@windriver.com> wrote:
> >>gnupg needs pinentry to run
> >
> >Isn't this only needed if the agent is enabled?
> >
> >Ross
> >
> >
>=20
>=20
> No, gnupg 2.x.x always need it;
>=20
> 1. the below is from README of gnupg
>=20
> You also need the Pinentry package for most function of GnuPG; however
> it is not a build requirement.  Pinentry is available at
> ftp://ftp.gnupg.org/gcrypt/pinentry/ .
>=20

There are some uses of gnupg which never need pinentry. For example, managi=
ng
the set of trusted keys for verifying package and feed signatures with opkg=
=2E I'd
prefer pinentry to be in RRECOMMENDS so that I can add it to
BAD_RECOMMENDATIONS and thereby disable it when I know it isn't needed.

Thanks,

--=20
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

--BI5RvnYi6R4T2M87
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUIA9EAAoJEBwoJlo7UPQD+6wH/jH2wr/f1P1xImYwfVj4OaPu
FCH/1nrTQcRwpgSfBeJ0z0hicWlcM4/1mo1FxUs6jwxZxGzzEgpMQGoccmDv4OPf
/nue8EpaiO9ZVvazwveiyoP2oC02QJCDZjK9lSXfr2+S2aXJ5InQWmDU4XpOdlmF
Nxjulj9ixB9Ov+E7ZkafnFDVIu76e+dBJbQhZpXm1+DcAsh2fKqhewbSPp6yh/CB
bePqVLfuLKFDJOgDdQCHcGBY6fr1yqcORG95lqeKWLwq5tHRBkrBdk0q9I6Ax8AF
sloUhmspUTYPkzSURj9ABbHBRavpQawNnLK+HitqR81OwUkZNmQln3K6NQkJXA4=
=9n0Q
-----END PGP SIGNATURE-----

--BI5RvnYi6R4T2M87--
