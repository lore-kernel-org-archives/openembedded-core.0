Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 739E7795B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:21:42 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id h22-v6so511825ybg.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hdjR8iVrszcS50+vGvlCpLvIqbqqn6X5brkQGXJxsz8=;
	b=eETDkPjBhqk4R6dMfWhEYnYZJOiZy4jSPuH65IZq9CBgmvaqG2GRsINnDDxcuaC8hE
	mem2DnM9kbqlvlbOQ7jwpMT++WC8uLPzB2jv+BG4xi9uDd0teDwaAnghDYM1QQWaqqW8
	8w9DkUxormpbuPUD8y+qycbdDJArBuekRG/Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hdjR8iVrszcS50+vGvlCpLvIqbqqn6X5brkQGXJxsz8=;
	b=eHnVHiBKvf4U3xmgtOVbDH1t9CvJZFmP+pyH8yrKDUITD1EJGb7ZOdXDp9N2FiE7W9
	jaVXOR6/fx6cdjDZ9443LPg1HN1go2/nlGLP0VfOy8fB5fCMuFynqMAP9Qt7YwnrHhgP
	nFdvAB6AHs9+Q5dfqtSOEi1UhYp6r8itGpGfMC7kwGf8PFWw+rPWgJa40MbFnbOWoydY
	WHt1zPP/o0ha1FmcuzKvLgcMQHeD+TxkFmKj451WsgSqC7S4PD2p/uxJpHU0Zt39vIQ+
	BVjWD0HNeJhbj7lBJ2yiRE5v/XKfyo8myO5qLd4QVELl5K0aeoyrUjGwUGVR9PQj+Xcx
	Wiow==
X-Gm-Message-State: APzg51DcsWt/zzx2/XKAOMm9pcnRTA89HoxSZ29hWBQG3WEcJ53KmhkM
	w8sslbtnwTR5YvtnUAhWI/swRw==
X-Google-Smtp-Source: ANB0VdYNwGYK86AtChlMUQxxgan8uldVx6Aj/BONx50U7jdfsrezUJIviVVxHQdwDhtn4zDgHG1tYg==
X-Received: by 2002:a5b:c41:: with SMTP id d1-v6mr8744277ybr.136.1535723724834;
	Fri, 31 Aug 2018 06:55:24 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	n6-v6sm3770295ywe.89.2018.08.31.06.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:55:24 -0700 (PDT)
Date: Fri, 31 Aug 2018 09:55:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Jiang Lu <lu.jiang@windriver.com>
Message-ID: <20180831135521.GQ26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-8-git-send-email-lu.jiang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1535681710-29461-8-git-send-email-lu.jiang@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] wic:mkefidisk:add use-uuid for all partitions
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
X-List-Received-Date: Fri, 31 Aug 2018 14:21:42 -0000
X-Groupsio-MsgNum: 115699
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7U/eSuoI27ekLyyn"
Content-Disposition: inline

--7U/eSuoI27ekLyyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 31, 2018 at 10:15:10AM +0800, Jiang Lu wrote:
> Add use-uuid for all partitions on mkefidisk.wks.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  scripts/lib/wic/canned-wks/mkefidisk.wks | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/lib/wic/canned-wks/mkefidisk.wks b/scripts/lib/wic/c=
anned-wks/mkefidisk.wks
> index 9f534fe..7bcb52f 100644
> --- a/scripts/lib/wic/canned-wks/mkefidisk.wks
> +++ b/scripts/lib/wic/canned-wks/mkefidisk.wks
> @@ -2,10 +2,10 @@
>  # long-description: Creates a partitioned EFI disk image that the user
>  # can directly dd to boot media.
> =20
> -part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --o=
ndisk sda --label msdos --active --align 1024
> +part /boot --source bootimg-efi --sourceparams=3D"loader=3Dgrub-efi" --o=
ndisk sda --label msdos --active --align 1024 --use-uuid
> =20
>  part / --source rootfs --ondisk sda --fstype=3Dext4 --label platform --a=
lign 1024 --use-uuid
> =20
> -part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap
> +part swap --ondisk sda --size 44 --label swap1 --fstype=3Dswap --use-uuid
> =20
>  bootloader --ptable gpt --timeout=3D5 --append=3D"rootfstype=3Dext4 cons=
ole=3DttyS0,115200 console=3Dtty0"

Please drop the ondisk lines as they're really not useful when using
uuid, which is good and I'm glad to see happen.

--=20
Tom

--7U/eSuoI27ekLyyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbiUjJAAoJEIf59jXTHXZSTqcP/1W6ejtMqpVzoTIdEey+b4+b
ihC3QpXi6+G8iqe3ho2Hy6FM0dLAqXHpgk8xK9TvcSMuSz7QwDoiMpmAJFbTctiT
aiUh4EZbkSo578JvJlwmYDK/PYVOZ+ReUFqOEmZ8qN/Z3d29n1rwMdHCdc0L62bh
MIF9q81TaNyB0Vg98OigGDDXvhH7KYxoeEKfw/8gnfGNUbtCn0KY2coM2n1C9CM3
vJ+r5a7FJhhguq9k69DPDMTwxXnKYSBtrR9BTKG71QCzV5zyY4Yz6pQadPzm8Gg5
RNW/6At/RRViMCueQrSjaRydyR9GSC7cYCgH6/+3wFBwJ7wb+du4QWrRaVi7+kOM
FPuqhFdDqrxjQzjmycaukuGAPiG2St5istzkYyBiKBhLjSuqUrx577/PptPKWGlG
cTlZcBDgW2xiZc1TDeTSToHF7tr/+hAPoum2Ef/wKTaqhHEOCBggdGc9+9XJX4XP
tCoeHFF77KKCip+gFI9ii6/zW2FiLkSrPwNi4VRZ39ILMFHG6CiFC52Vu5jIlAna
xzJ+EltYB9s3obZY8sezE3tUKxx/UNB3uAlf6+pKKtt3L6FttLFVyXrh2TCDMuit
DG2tBDKlyScmuP3RONdzZ/mOvXO80BWpCs6lAlk/55RxSdTeT1i0XUlAPffzYxln
7h5ZDJEf8eCGs1oWcLic
=YUIX
-----END PGP SIGNATURE-----

--7U/eSuoI27ekLyyn--
