Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 821EA600EA;
	Wed,  1 Feb 2017 17:48:55 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c85so50015216wmi.1;
	Wed, 01 Feb 2017 09:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9gbOcWhGD1huV5Zc1lYVy/shzAByJGJwI2VSggp8KW4=;
	b=KGj9Kp3T3hjrxEiTw9NEreqv7fkKBA3MhAaQMsRENDNM9cgUi0de6mvIBIQfRQ0LPO
	yd6sAZlgHgrOAqvRE3Qq8kfdiSbrB3jschsW1WanitqLj5FFEAu3qYm14HOb6JiV8VQe
	Rq55RFalQWdsWERUdkXrqP8ZPenAmFuYUR8M+BbqO4h50ByJ6eHa5U2dGB7M2GsdeRIe
	yANkOSfU/cFT+bH1tciry54A1fBUdZKQLBM+KLrBByAErZSA+QKTNYE2qWEO1YbK5IQW
	JyTMcA2//y6WRlrON5svhorvuzRaT8nfT+zmscuQRmhM0BTjCVl1ykyv5yBDTkINU6u2
	8O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9gbOcWhGD1huV5Zc1lYVy/shzAByJGJwI2VSggp8KW4=;
	b=MY7ENiitslZHhlSVubHCrRP/nAnW3DIPD+ax46Qri5r+5w2hrP2CSj9mo803iquVi4
	lFjy64eiZnVu2JqQWUDoq0O4Y9G6gMn13RPZVt+9/j6n/hMTZIQgcD8WiBM8rAMu/dZG
	BSXn/4L8fZqRsqDehDV0S0rZghnOn9zN9qj+YaOMMfG2DjPGj/0qcWe9M3Ul2Dl/Osus
	A0LuGa36u3kimgFrIv+0lyAncZT94bITshAGJFP3G2KHcdlTE3ThRuYaUpW+vYDv/1yw
	TPGoDq20bL/82P7YHVnjaWe140EOWcJFH+mXavf9B2vtMkldZJuFR4CJdpNSZYW1MGHz
	PJ0w==
X-Gm-Message-State: AIkVDXJoorFO1NGwpHNn3weD4X5qCsLfCwvbVerA4vUqjmdFcLrIMcru9fWx0PNzZvg7mA==
X-Received: by 10.223.133.226 with SMTP id 31mr3633249wru.137.1485971335133;
	Wed, 01 Feb 2017 09:48:55 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x25sm35369948wrx.27.2017.02.01.09.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 Feb 2017 09:48:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 1 Feb 2017 18:48:55 +0100
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170201174855.GC4362@jama>
References: <20170131171049.GA3273@jama>
	<CAJTo0LYxg6dt6bmDg_x2_X4L9GTK5dBzBic7K41=seDNUFts3Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxg6dt6bmDg_x2_X4L9GTK5dBzBic7K41=seDNUFts3Q@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-01-31
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
X-List-Received-Date: Wed, 01 Feb 2017 17:48:56 -0000
X-Groupsio-MsgNum: 92766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UnaWdueM1EBWVRzC"
Content-Disposition: inline

--UnaWdueM1EBWVRzC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2017 at 08:08:20PM +0000, Burton, Ross wrote:
> On 31 January 2017 at 17:10, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > There is a lot more failures this time (mostly because of RSS), but
> > I wanted to share it anyway, to be clear about the current state of
> > other layers.
> >
>=20
> I presume you'll be changing this script as the minimal/maximal build runs
> are redundant now that recipe-specific-sysroots has landed?

Yes, I've changed it so next time it won't show the results from
test-dependencies jobs.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UnaWdueM1EBWVRzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWJIfhgAKCRA3VSO3ZXaA
HH9TAJ9zzwRKMx3oCaRZ2FwmYXdg9OgLVgCgmPsk9pVyGMkJlpi6JEvZQu8IHQc=
=bTKi
-----END PGP SIGNATURE-----

--UnaWdueM1EBWVRzC--
