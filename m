Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C3E7B6069D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:51:07 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 3so706190pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 19:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jTBRVXYvPc095XzjJ4Ah9483H7cLLjnr3uj4asc6lxM=;
	b=wh3ZF/LdriSymIEdefEveq3LIn/Mmyj5OiWYRXDBSiOmpjJ6++c0KYUe+DYrDO548I
	9hlv5vLtZ3MsI59F887+88sSL9lO9ZsFrObyTlGmR3GzCm9BbiN5I4cUB5A+QsmY8nx2
	2h+YARkJE834Eq0HAyJEfKmW6U281uWgfVw1lnjvqayFN0QzbS2IjmFsj9Op9tXCmYgM
	FI1XBxsDwjnbAbu5OPUhFrspIy/YagCuRI34kJewt6Kl+XMiL3ddEM29mszt58Kgq8Nk
	XpkZo8Spo/slvTm6pmnwCthhmQpRPxPlWx25xKATjTwoMRiQJ89Kss0aWwEd8ul/DECy
	M3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=jTBRVXYvPc095XzjJ4Ah9483H7cLLjnr3uj4asc6lxM=;
	b=b2RKTLXA9qeNm3OAwZGsdMQZzaLAP2Xuq6BCJXybbwsdyDpuZVt9KlokU79CmN56c8
	mu3SVEHX/9YXbYk6b4d4KjhX6yFv3eQ1ldnohcP4lMhxra5dNuoIJT8tJRH995xmI5I/
	lsm9L9U9LJImevzHIWENCbiSTpl9nq5eOPfHbn8cijSmjVGfg/by62Wlnd+TvIxelK67
	2wVocdq+SQT+mr6TYpQq+E8ily7j5Q66BAY9PwUuVj1xJAjm/CMiZUSCYfFyqvBGD0IX
	DzvE299/l5zuzp1+U0gsTYWg8zmStf+Ob2qRZRWFzYtiDKwSSKJl81jHdsLRdljeIRt2
	itzg==
X-Gm-Message-State: AKaTC00D94x6jwOcMimSRD8LbOuiP/N2VMVJIcR9YrBwPaWlrXiGtP+FHTzavCnQpHcOpA==
X-Received: by 10.99.168.10 with SMTP id o10mr39168677pgf.105.1479786668799;
	Mon, 21 Nov 2016 19:51:08 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:79bd:3a31:4354:fac0])
	by smtp.gmail.com with ESMTPSA id
	y134sm40671026pfg.81.2016.11.21.19.51.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Nov 2016 19:51:08 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161116174748.26994-1-raj.khem@gmail.com>
	<CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <fee9f44e-4dd3-9286-a1e2-2f4e5ca2a74b@gmail.com>
Date: Mon, 21 Nov 2016 19:51:07 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] systemd: Upgrade to 232
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
X-List-Received-Date: Tue, 22 Nov 2016 03:51:07 -0000
X-Groupsio-MsgNum: 89639
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="vTlld25oMMRQeKrUwgEW0PTIimwDl0lJE"

--vTlld25oMMRQeKrUwgEW0PTIimwDl0lJE
Content-Type: multipart/mixed; boundary="fEE2nVgVx9u5xsTPqbrIKPmGs8JjwpdrE";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <fee9f44e-4dd3-9286-a1e2-2f4e5ca2a74b@gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] systemd: Upgrade to 232
References: <20161116174748.26994-1-raj.khem@gmail.com>
 <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>
In-Reply-To: <CAJTo0LYgH6_T5Y-YO1Px5eyYFLiud9SQvG1vHGRoebwkhVhdKg@mail.gmail.com>

--fEE2nVgVx9u5xsTPqbrIKPmGs8JjwpdrE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/18/16 4:38 AM, Burton, Ross wrote:
>=20
> On 16 November 2016 at 17:47, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>=20
>     * Drop support for rcS.d SysV init scripts.
>       These are prone to cause dependency loops, and almost all package=
s with
>       rcS scripts now ship a native systemd service.
>=20
>     * Drop mount propagation patch, it only happens with libseccomp, OE=
 doesnt
>       enable it
>=20
>     * kdbus option has disappeared from configure
>=20
>     * Ignore dev-so for PN now since systemd introduced private .so see=

>       https://github.com/systemd/systemd/issues/3810
>     <https://github.com/systemd/systemd/issues/3810>
>=20
>     Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.=
com>>
>=20
>=20
> Because systemd-boot basically include the systemd recipe, this breaks
> systemd-boot.
>=20
> Can we think up a way to handle systemd/systemd-boot without breaking e=
very
> upgrade?

Is it a runtime break ? I just built systemd-boot for turbot/64bit succes=
sfully
>=20
> Ross


--fEE2nVgVx9u5xsTPqbrIKPmGs8JjwpdrE--

--vTlld25oMMRQeKrUwgEW0PTIimwDl0lJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgzwKsACgkQuwUzVZGdMxSHYwCdFn5Zrxtg5H+/PDs+Q2dzgMh0
bQoAn22/80OgE17zQ6bwV02UgZH3KwY9
=sGu2
-----END PGP SIGNATURE-----

--vTlld25oMMRQeKrUwgEW0PTIimwDl0lJE--
