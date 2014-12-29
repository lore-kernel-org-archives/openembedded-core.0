Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A81FD724D8;
	Mon, 29 Dec 2014 09:55:33 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so18545444wgh.37;
	Mon, 29 Dec 2014 01:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LI/6SmB9QBvgC8iy2hitQDuOqNRhcnLPndUBqBtDXVA=;
	b=k/kgHJqJQ2pBxJvLV64bYKHVjGUk6v/ubylbDMxMN/i2BjNfuRMm5A75Drkf18TFkP
	cd7plDVTNin81m3kSPdrIgizYZjjcl2Ckuet/nV30owp+dvtL2xmcleIxNraxLHOdtjp
	D0dMYubZf5NQmkeVS7ZGhpXgYcxgQuvpiimtSiO9uVl1q7/HeaPlibQFdXvcwQdGYXn3
	XUcxU2fhHTruuAXxif/KqY6GqMoql0FlYhQF4AAtUpGELxjb4YYixiNh+fa0XSkhKDyW
	f6m8eJEyZmshw8YGj3UyjqS3ftGfRHqnmgB2darMg1tb1msr+GYOVtJsLBpi2YaEfAWN
	EtCg==
X-Received: by 10.194.78.229 with SMTP id e5mr62187050wjx.11.1419846933220;
	Mon, 29 Dec 2014 01:55:33 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cg8sm47210677wjc.1.2014.12.29.01.55.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Dec 2014 01:55:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Dec 2014 10:55:41 +0100
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20141229095541.GK2465@jama>
References: <20141229092524.GJ2465@jama>
MIME-Version: 1.0
In-Reply-To: <20141229092524.GJ2465@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2014-12-{11, 22, 29}
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
X-List-Received-Date: Mon, 29 Dec 2014 09:55:38 -0000
X-Groupsio-MsgNum: 60871
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qgof7w7UksPF5inF"
Content-Disposition: inline

--Qgof7w7UksPF5inF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 29, 2014 at 10:25:24AM +0100, Martin Jansa wrote:
> We had almost clean state around 2014-12-12 after blacklisting few more recipes.
> Only xfce4-vala was failing. Then I've added 2 new layers meta-luneui and meta-luneos
> which break bunch of recipes (by introducing newer nodejs, changing qtbase
> PACKAGECONFIG, I'm still working on them to have fewer side-effects).

+ many warnings from stricter LICENSE check.

BTW: is "([&|() ])" correct? from this it looks like space is valid operator/separator,

WARNING: Recipe xfce4-wavelan-plugin, LICENSE (BenediktMeurer FlorianRivoal) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe libeweather, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe epeg, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe imlib2, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe expedite, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe expedite, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe evas-generic-loaders, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe epdf, LICENSE (GPLv2 LGPLv3) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe emotion-generic-players, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-efenniht, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe engrave, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe efl, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe edbus, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe edb, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-illume-dict-pl, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-native, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe azy, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe edbus-native, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe efl-native, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe terminology, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe azy-native, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe illume-keyboards-shr, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe exquisite, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe exquisite-theme-illume, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe ephoto, LICENSE (MIT GPL-3.0) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-illume-efenniht, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-b-and-w, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe illume-theme-freesmartphone, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-simple, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-tux, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-openmoko, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-niebiee, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-logo, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-dontpanic, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash-theme-handy, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe gtk-theme-e17lookalike, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-sowka, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-sixteen, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-niebiee, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-o2, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-neo, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-sowka, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-illume-shr, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-illume-sixteen, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe elementary-theme-gry, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-illume-niebiee, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-illume-neo, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-theme-illume-gry, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe shr-splash, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-menu-shr, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-sysactions-shr, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe e-wm-config-illume2-shr, LICENSE (MIT BSD) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe mailcap, LICENSE (PD MIT) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe traceroute, LICENSE (GPL-2.0 LGPL-2.1) has invalid format, LICENSES must have operator "([&|() ])" between them.
WARNING: Recipe linux-atm, LICENSE (GPL-2.0 LGPL-2.0) has invalid format, LICENSES must have operator "([&|() ])" between them.

--Qgof7w7UksPF5inF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlShJR0ACgkQN1Ujt2V2gByCjgCfTWDYLGjMjH/mwVR/FwVM+Cq6
aoMAoJuE8eiHI2agBOGzNDQ/QwgTI6C1
=UEwt
-----END PGP SIGNATURE-----

--Qgof7w7UksPF5inF--
