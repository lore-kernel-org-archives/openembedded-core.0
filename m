Return-Path: <trini@konsulko.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB057E034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 15:55:49 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id m29so15051275qtu.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=PZqGSk9YseDU6jNEOY01SvfyTA9Rkn+1lgmeloDibuY=;
	b=mQSfxuvzIrhASZ2ZfAZoVXkDi3W+IDBkav2UuX240DpQfEcxdNMsaLR5P1H4rBXNV/
	AbwMLTxfyhNlUjufh/1wcZsNOdlKC8ZK7QkwxvYaVUdsyYB8pJG7q8o5aY34aHjuHsl+
	mZae6ysxZVKZTjH91gXzwyGvtjp+1efjdt1C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=PZqGSk9YseDU6jNEOY01SvfyTA9Rkn+1lgmeloDibuY=;
	b=JImJGknGQQL35zbOaGdbcWLpkGLgcxipO9zkOQtacsAtP9ba8cH00cJ3q1/HUXCmeK
	eZ/X/Qk/RIzeAHMXtyBL+pCo4F68kvIUC6Zks1uuNGUbICAnLXvBWZ140aVRFeqOksg4
	Yzh3ZG9sRKro4dJE5mhfY3XZlSQ7cf1Hek2LdgYlgP2R9/BUnkOOLkI+FAnWiiJTDask
	B/6H6njwwYPMqtWFLNQ7LJ/HO/NyV3BEo9U2FyOQ0gNlGiPKkP71AIZZeCbeidjLTKW9
	wMKJSA6GuUB34BvIw/4zBOmV3/7PyYyeW7VIw1pj18dtHSV/hcy4KHYuasYzzVmpQkFl
	Xrvg==
X-Gm-Message-State: APjAAAXWIK1WkFCkIZsd8NYtAXzK+gcLD48DRjkvDHpfflf6+DQxMOmm
	o4P7jnFxqtZj0M5V9ac5J00cWw==
X-Google-Smtp-Source: APXvYqxvomM5ckPdys43b5J06RIB82tFKJ6aahXoaM7qrEiGwgJkRvWqf7dFzTo5EC+Icpsex0Wm3Q==
X-Received: by 2002:aed:3e36:: with SMTP id
	l51mr129574860qtf.269.1561391749911; 
	Mon, 24 Jun 2019 08:55:49 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-BDCB-AF85-F65C-D853.dyn6.twc.com.
	[2606:a000:1401:82de:bdcb:af85:f65c:d853])
	by smtp.gmail.com with ESMTPSA id
	n10sm5568957qke.72.2019.06.24.08.55.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 08:55:48 -0700 (PDT)
Date: Mon, 24 Jun 2019 11:55:46 -0400
From: Tom Rini <trini@konsulko.com>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190624155546.GU9388@bill-the-cat>
References: <cover.1561348290.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Warrior][ 00/19] patch review
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
X-List-Received-Date: Mon, 24 Jun 2019 15:55:49 -0000
X-Groupsio-MsgNum: 126167
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nBNKYIkUhonyaPEg"
Content-Disposition: inline

--nBNKYIkUhonyaPEg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2019 at 08:53:59PM -0700, Armin Kuster wrote:

> Please review by Wednesday
>=20
> The following changes since commit 712c78984c891e6357e1b1dc414431fb6c226c=
49:
>=20
>   gnutls: Use ca-certificates as default trust store file (2019-06-14 07:=
05:34 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib stable/warrior-nmut
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
warrior-nmut

My concern is that the vim CVE fix isn't here.  As I replied to myself
when posting, it's a viable option for Warrior to take just the CVE fix
as due to the "every change is a new version" the fix itself is a single
patch.  Would you rather go that route, or just pull in latest in master
vim?  Thanks!

--=20
Tom

--nBNKYIkUhonyaPEg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdEPKCAAoJEIf59jXTHXZSnPYP/Rt6YNT0LMmbuHebGlyzqX78
7+q8Br6gXLWu6iurSqMzSrKyEDMQoEqsFXxjgNhQvvFIAb5ZEOo7+z6H5s4S15r+
xJx8eZSCVF99q9JypUhhU9LXFpcmFtiXidFipi+VaPUOA4CGtOMbuirnGjOU5ecX
X/STPsITpQmepi08NnRCYL0xFto2FxrqJk8kcEOIw0U62jawnCVg2BcwxfNcwWgF
g9QzuwucUQQR3thTv2QPAkzYGt2xPHQ7q9jb6jW3UwJp2boD5ZH4Nstw/KGTmr0W
B8t83m+dqVsGUJCiIBdPSwD1Vso6z4CrUVlRJ7Uznyc7hhCNZdzbvRUd5NIotyue
WmSj6ZK7gRVKYvijmwbvjba5+XMCBqlv/rvU5HksKUOlloGE0PZUwYAt5L5KHL1Q
T+RSiQDGooBqcrsbFbdd9KW/ohFDhVr4xARz/jEaQoWL9exF/Q88gi8abmLL/h1W
calvQ+8HO6SflwX4hPoXSzQNNYe05FXDZ5OqDguDYOJlM+hLZU//ISbIgUPid6Zo
tWXxgo1L1okx4DZdfJM4ZqPrZeyayEFSrPBAh59ArGPJu4fXST+Ri0cmilC7K5OQ
IfgPPVZIkiaHomqF9d1lNHDDz+6iLxeEvf2h/RaaP+cl23g4JoH9/7kuzOzHM799
MxK4GO8M0SoVs5iyDH4R
=Q5oc
-----END PGP SIGNATURE-----

--nBNKYIkUhonyaPEg--
