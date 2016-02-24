Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8F76873218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 12:50:27 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id g62so28373528wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 04:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DoeJllGyLhXlMjtXCYc1OwZ8/es7QETZtkiRrUtLCR8=;
	b=L/c72K6cPp8WjA+jQPoe1WeMcNVBGERj+kH2xz5EkN1Y4eHQMC/c7ajazUz0oTuAYl
	CRQje0SPZzh9Xn0hdxV1LwgIcH98y+ivTt14za1RtaGFGgbCtrpn0pZ5nh3CA3riJi8Y
	DKYABqy0dQ6YEy3ioTTdbfek4Msg1Hkls+ph02hgGy+IYpKbC5eAHdZYO4UjW/diBBoa
	D67CI7s/4THh5mLpLOjylk+cO1bS77p7XADwpNNyvjCTgfVb/56NkT5n1wzwOEbq0ILN
	4cIEKdbOn8eYODr6o9yQL8h0l44jW3pPl6JdRI75TKRC1MNj1/iInuR3O3UjVQMfS07N
	aeyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=DoeJllGyLhXlMjtXCYc1OwZ8/es7QETZtkiRrUtLCR8=;
	b=cmKwGM4KMyp6GUsPSeswbXukOxkllp+jaOOCI9pnnhaIupydZzh4yiNuvUt3gxK88u
	9ok8iJiVdT8obwHqsJnGaFzmCr5YU9Wo0JRc14G3Q+vEJJ9OPtRpIhcY5MmkahW0agak
	HEuI+MwJlXVUcLBKpdVMiYOIQ2LgIJ6IncPGjfcdhnDw+89mbG/IsKkTELNeRctVvcSv
	bvxb5REpjGQfRaHm51bmCVZpt+HxRgT/nLEh5SIu+MdA8f5Ya9l88FxtHFe1W7fck7Yr
	3a1VvZLUX92th7/C4G9r7LcoNfY7UOqfCdC3ZF0mLJIq/vxQB8uhscmGgq0tw4TBA39r
	WY2Q==
X-Gm-Message-State: AG10YOTrQtQGbhYfYOq5ioEi2UFV4Qi/gO2XizbGfGKoNu6CUzZFCVp1Vzg9CQfGqaQUyg==
X-Received: by 10.28.63.200 with SMTP id m191mr23045619wma.21.1456318228085;
	Wed, 24 Feb 2016 04:50:28 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w144sm31065665wmd.8.2016.02.24.04.50.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 04:50:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 24 Feb 2016 13:51:33 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160224125133.GA7560@jama>
References: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1455823285-32028-1-git-send-email-armccurdy@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] libsoup-2.4: cleanup + disable libsoup-gnome by default
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
X-List-Received-Date: Wed, 24 Feb 2016 12:50:30 -0000
X-Groupsio-MsgNum: 78592
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 18, 2016 at 11:21:23AM -0800, Andre McCurdy wrote:
> Andre McCurdy (2):
>   libsoup-2.4: minor formatting improvements
>   libsoup-2.4: disable libsoup-gnome by default
>=20
>  meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb | 20 +++++++++-------=
----
>  1 file changed, 9 insertions(+), 11 deletions(-)

It looks like this was merged without suggested fix for upgrade-path.

Will you please send follow-up patch?

It also most likely breaks libgdata in meta-oe (for complete log see bitbak=
e world
reports or errors.yoctoproject.org)

  | configure: error: Package requirements (libsoup-gnome-2.4) were not met:
  |=20
  | No package 'libsoup-gnome-2.4' found

Maybe it will be resolved by libgdata upgrade sent in
gobject-introspective set, so this is just FYI.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbNp1IACgkQN1Ujt2V2gBy8MACdHnEGs1FEVPpBz+XhMRHBl/5i
7KoAn1fz3GJhIiW1/53REw1T/D2rG+7L
=BSgG
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
