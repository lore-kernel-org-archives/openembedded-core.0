Return-Path: <trini@konsulko.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1587C89C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 15:33:45 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id p2so2593283iol.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bQYiTeKz8MQVr73VmLv1XgIqkeGHk2gW4rICAFTs3Ss=;
	b=X0GSwxK7ynBhnf/yWzZFiY3NnxkRN8iZRdFPqGKCLLP4xbracF8V+1zw8wrBN7W95k
	K+rPhqQ4n3v3PEAsXguxgQZv3bql5x1t14IcKOyRAK8wAccrt3pAy6pFDAWdG1UkwhTX
	kn0E1u1bRYCIPVrukJLN0gZIp0LVY84fF54cQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bQYiTeKz8MQVr73VmLv1XgIqkeGHk2gW4rICAFTs3Ss=;
	b=oYpCCS9JSvi2hEdJ1QGTYlUcVBhLNHDQQ3/Dkua2lbITN/nSG5zKUFtSCHQOe9zS8j
	oAAp48zrQErAcwOl9+GzJYj8IRf02eGGTlbt5OBNHGlo9229b40KfBDWQGRFDckuNg7s
	60LVNEc7OL7MKtkmlgtOaqmkL6DQjOGeYT1M2pUz1Ekbz+vXNxcmy8okPNNfK27/UUSM
	xxdoQ2nLFhAmKDorHdF0RFo0y2lUwY5TnerE6ayXTDsZIpB1fZ/m/PNIyvnxwgHzmnnD
	jP8U1UQIz0GnE/l0rwW9rZegJjiJKSIgF4ZeEmWuHK94ofR4LE4Cq8aYhN8rlbAtfGZo
	+ezA==
X-Gm-Message-State: APjAAAXGaqylZye6bmqlsV68jMV6LU6Ang/4imJrVuCKUjVI5tgoKjUJ
	u7reUxwzSts5+SzFWHwK/dDYIA==
X-Google-Smtp-Source: APXvYqw3fMkfoMEXG8NW85T1OqWQVbIKRKNSzb4PLLpQm2I/fmaORwVKliR4DL6yXdm5DjwUlxvWmA==
X-Received: by 2002:a5e:df4a:: with SMTP id g10mr23072612ioq.94.1557934426973; 
	Wed, 15 May 2019 08:33:46 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id b10sm708082iok.62.2019.05.15.08.33.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 May 2019 08:33:46 -0700 (PDT)
Date: Wed, 15 May 2019 11:33:43 -0400
From: Tom Rini <trini@konsulko.com>
To: chee.yang.lee@intel.com
Message-ID: <20190515153343.GI22232@bill-the-cat>
References: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
MIME-Version: 1.0
In-Reply-To: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Wed, 15 May 2019 15:33:46 -0000
X-Groupsio-MsgNum: 124480
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WG0/bXtUnGTsWt66"
Content-Disposition: inline

--WG0/bXtUnGTsWt66
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2019 at 02:40:58PM +0800, chee.yang.lee@intel.com wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
>=20
> Existing installable image (hddimg/ISO) has limit of 4GB size, so to buil=
d larger installable image, we can build it in wic based image.
>=20
> 2 partition needed for installable image
>  - first partition build using source plugin bootimg-efi and configure to=
 run install
>  - second partition build with root.img, systemd-boot and kernel to be in=
stall on target machine (this partition build using new source plugin insta=
ller-partition)
>=20
> These patches:
>  - add new source plugin for second partition
>  - add new .wks
>  - add new wic dependency and set default value for required variable
>  - allow source plugin bootimg-efi to configure to install
>=20
>=20
> To build the image, set WKS_FILE=3D"wic-installer.wks.in" in local.conf.

I'm confused as to why we need most of these changes to support the end
goal.  The enhancement to bootimg-efi makes conceptual sense.  I don't
see why we need a new plugin to do the rest, however.  What's being done
here that we don't already do today?  I say this having made installer
images for EFI machines using wic (in sumo, even).  Thanks!

--=20
Tom

--WG0/bXtUnGTsWt66
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc3DFXAAoJEIf59jXTHXZSwzIP/0Ke5Nju8R7oWMUMVXIC9lUU
i1xAulOR1AO8jw64ostZ8dJ3mUWERov8cFqLFEKSXHgoRgx+QORxfBdgFVUdMR0B
cyE+JIX0ZK1s1f3cYn+Kz8DpOMiEVytO7RiUfPEEOscaJnKgZV3s640S1w33Ycpp
QR16rIv+nuVqRgEVZaTqgGJTLzA0LUN0EL5TlyXpGpX69g0YNUB1V9zUf/pP/EVY
9FR762iUTUEu5WoCnmePh3vukBeYLmGPS7MpmLWPwCExMrJUm/I4D4f0mSV47a8B
rr23JiWkaIV/1XbpP+fWbi+A/QmOxaNUr2aO1EajZEKGZOkPcHjKWAqd0gq6Kc1V
WtTHvvyA0EmXKdF0QVAPgT3ykmOTy6/JGrBui3aWQk2e6cKrn03woo/5GHexS4u7
VO/XnWpVS5EGHgVRw1cisU/IOAtfcEEaZ8mzmU+Xop4dxZHTf4bjxTXEX/ST+90W
GJyVbEHdhVrAe7mqbPfvsamshox37yUDj/HI0ink201N4WGm7opbOaaqFHkKqTZe
LObfIDtHzEYNNofzxiuID9PoiKee2YgXGD9RK+Gg0wLjSnd7N7RnwcJDqlGxpf0M
Js7d3n1Y1cP8VilJgZsTsEN6NE399FhoTkXC2MhM+pj36JgZ+K0VpIOQK17mLuMs
UQ4sU8AyWxFA+5r7TBJc
=dvLI
-----END PGP SIGNATURE-----

--WG0/bXtUnGTsWt66--
