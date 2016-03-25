Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id CE7B360290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 10:45:39 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p65so3372384wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wS5zU7eeGvjKyGT+G1Hy+QfY9MhumAU81lBQFlLf/k8=;
	b=vvUsl0rhOL3Z9GH+8uJi/NIKRlwaUdG1TRoSp/Wd8sDYSywaSZZIscrGaq7Nq3J7Rq
	HCUFn6jNgrdUWYJmlOAcm95tF3K4Njb2G1BAq+Pr3U/9HueNdMjySWLQwUmAqdxnaQZq
	so9AuZxru2Ui6g84dBzLTeyWOgmijDeYrFzWTiT2I4LG0+3Of/OHLY9N2ISRDsC8bCP0
	16fH3ia2KcTXifs7Mue67VN8NU74P17njkEhlBK/xkcNSFV17I7dPPvk2n9V9uFrIwH+
	0dk8V1XFA/a/2DGEplvV2iqaXLRuxlX+Q03GhIn3hYhfGQLgGSYq/otPJzcGf+ZGEoFe
	88wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wS5zU7eeGvjKyGT+G1Hy+QfY9MhumAU81lBQFlLf/k8=;
	b=K4V9O+6pGlrzlodPNiqPOFBYYcihYpk4uas6wotM1M0iArZFqA6j+4wUsXCa/SHkTr
	qRp0vJMCYMq6g1P+aUZxZVj/zXk5kXKglnZ4WkhAwk5IMtZ0nFbkyAim2YPDtHXAbV2i
	+OqxpxWCe7vaM3fdg3VFOT5Dyge4XSAeTzafqX+I7TlHvGv9vA0nMl7/54zjR28j17GF
	0OAFQcrcYsw8Hve2vWp8q4F61FeC1k5JcvX4BpaKrvrCSZYczx1DXPtkEMMx73dQfICc
	LeEbhjLgRf9+yu0GwmxxiO3t2cJua6WUVh3c9JvU7enxu8IJlvXEGK0e79IIxdeUs/RG
	tbew==
X-Gm-Message-State: AD7BkJKsaeSlUFbydCmPWmcLiV1fy0NqsB9QnXvrpO3+5aOazp+eQGhlNLvtzKIH8mBGKQ==
X-Received: by 10.28.30.215 with SMTP id e206mr35506816wme.25.1458902740060;
	Fri, 25 Mar 2016 03:45:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w8sm11411865wjf.19.2016.03.25.03.45.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Mar 2016 03:45:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 25 Mar 2016 11:50:25 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160325105025.GC2555@jama>
References: <1456610987-17836-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaVL04OQaipNFn1hyCGruFZ7itmrxH00i=L+OkcsZexQw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] base.bbclass: Introduce EXTRA_CONF_PACKAGECONFIG variable
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
X-List-Received-Date: Fri, 25 Mar 2016 10:45:43 -0000
X-Groupsio-MsgNum: 80148
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dkEUBIird37B8yKS"
Content-Disposition: inline

--dkEUBIird37B8yKS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2016 at 12:40:31PM +0000, Burton, Ross wrote:
> On 27 February 2016 at 22:09, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > * add separate variable for configuration options generated from
> >   PACKAGECONFIG setting, this helps other bbclasses and recipes
> >   to take advantage of PACKAGECONFIG mechanism, without including
> >   other options from EXTRA_OECONF
> > * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
> >   from PACKAGECONFIG:
> >   EXTRA_QMAKEVARS_PRE +=3D
> >   but with
> >   conf/distro/include/no-static-libs.inc
> >   it means getting --disable-static as invalid option inside
> >   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
> >   to use poky with meta-qt5.
> > * once we migrate all bbclasses and recipes to EXTRA_CONF_PACKAGECONFIG
> >   we should also restrict EXTRA_OECONF append only to autotools.bbclass
> >   like I did for cmake.bbclass
> >
>=20
> Sorry, some of us have been a bit busy trying to get M3 stable.  This does
> look good and I'm for squeezing it into M3.

Any update on squeezing this?

meta-qt5 is still broken with default poky config

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dkEUBIird37B8yKS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlb1F9AACgkQN1Ujt2V2gBzwZgCeNI1Tu5c1xQbkIrRFuBjPnKvv
gJMAoITVSjrooK2zOPvJMzdrW78u6FCu
=XeBC
-----END PGP SIGNATURE-----

--dkEUBIird37B8yKS--
