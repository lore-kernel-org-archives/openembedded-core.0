Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id B8A5D606E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:08:35 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p10so29185875wes.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9jELSF4rVEUD2B94J8u/2rAZkZPY0OHJfoFtmVRU5yg=;
	b=G6X0NzMUJ5jBOC7MKFhCRzumTIxR/CdwAtCMwPCxIrf3y62YtVueCCc0KaWrcfjc6q
	Uf65R89CWUragQD/9J046qO/SKn3JScu42TDAaEDZHfzb92Clu4JVhTN0EeDyJxZUQ3J
	RjReeLe7El4p8LkXL+d+3zfaJTjaZ0fU6ovRqIA6SuIT3+hvlhKv+3k6Bpkvvn932r7/
	vKUy2Fx/EMQOBG9CZnDd9ofXMj1ztffU+LQghFmO7ax6CcorXAv+CTQM6365fppbRWOj
	fuxA3ZtquSZOO6UPdJkQzJKxrEzrqhOW2E7t9sfsuzaCxZifzR8uGHuVeTFFz3MzuxMm
	Z0IQ==
X-Received: by 10.194.84.176 with SMTP id a16mr1720413wjz.113.1424092116483;
	Mon, 16 Feb 2015 05:08:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jg3sm19648449wid.0.2015.02.16.05.08.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 05:08:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Feb 2015 14:08:44 +0100
To: scerveau <scerveau@voxtok.com>
Message-ID: <20150216130844.GF2297@jama>
References: <54E1CED1.6060900@voxtok.com>
MIME-Version: 1.0
In-Reply-To: <54E1CED1.6060900@voxtok.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: cdra_1.1.3 is not available anymore.
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
X-List-Received-Date: Mon, 16 Feb 2015 13:08:36 -0000
X-Groupsio-MsgNum: 62422
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vJguvTgX93MxBIIe"
Content-Disposition: inline

--vJguvTgX93MxBIIe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2015 at 12:04:49PM +0100, scerveau wrote:
> Dear all,
>=20
> It seems that crda_1.1.3 recipe is broken according that the link=20
> http://wireless.kernel.org/download/crda/crda-1.1.3.tar.bz2 is not=20
> available anymore.
> It can be now downloaded here=20
> https://www.kernel.org/pub/software/network/crda/crda_1.1.3.tar.bz2
>=20
> But concerning the binary=20
> http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.0=
1.11-regulatory.bin=20
> it is not available also but i dont find a server which will allow to=20
> fetch it.
>=20
> Does someone modify the recipe already or does someone know where we=20
> could fetch the binary?
> I'll continue my investigation.

http://patches.openembedded.org/patch/87751/

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vJguvTgX93MxBIIe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTh69wACgkQN1Ujt2V2gBwZJgCZAW2rYx6jWEi4lf43SRQN3+r/
KBgAoKtr0w1vqdYodblmMjTpVW4Jh1wl
=vI3i
-----END PGP SIGNATURE-----

--vJguvTgX93MxBIIe--
