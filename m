Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A5B8478A45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jul 2018 17:48:20 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id c21-v6so1448144pfn.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 10:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=w3+IRkIC+/N8h0+JovDhqui3KkZRICgpBFlKnsCfqOU=;
	b=Lth5xN2ubZpa6GhJO3OmvOLX4MY4N9H5h6m5+j/BJuqC/dft8tTBXr8SqkyiylUvPZ
	hoKQdoqJDZpnbXoraoA+j0Qd+VytvouzMPCuxhN6CYVdy1yyWEOSfwNvi6zqqLs6XU2q
	WTEVBKaUOWrneIMJVJxOmGNnX0hFCle9eJUa1RlgUZ7feYrB3BEh7yPUnmUcTbU2AQzb
	aOtY0pRXt9TSDYZNTMQXNFCPEJGG4XLmUIcEQa874YRjvi/nouVY061+lnTlWeodv7FG
	5VYFMPZwNHDr5oszmydsKn+euUr18kWH2f1dukcH19p7JaYbqbcYZjbb+in0g/nAlwDq
	244Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=w3+IRkIC+/N8h0+JovDhqui3KkZRICgpBFlKnsCfqOU=;
	b=cikxCBj4uPjYbYkwR9B/kttCDabxkHAnEYVO0UMMVSXLlcbwofvSoKBi8RLqgwzCJ8
	hqBo31tjtY8+hudrPAbEnpIyiB7Y6NJY2K+/set2O013BZzVBqhvc4HjXtVCVXLqyXv3
	kOD8ISdV1MPEZfTI/rjWwTOMC2CPiOoWmUd238uGDn2LAHcm53EM9CGbAZ7fk6qh9z1N
	NOwXsHJsVmn1zQTuzgj6BtAFF0V1+gEeidEQ9J2iPIi3ssSSqs1K0+++FHnGoVJ8xXdO
	CnWy4BkFH+hAadWGr9XNtDSaTQZYxc2rh2EdvUKU27loauENjD/u2mbUhRomVn9TRpx+
	g7uQ==
X-Gm-Message-State: APt69E0eWD7KpK9KqjQGznS2QY2s6BO/oWm7LORPvSdGC4Y77Mz9HgPY
	Ox2Ih0u+PaOpi/PaeywiOb+YHJ84
X-Google-Smtp-Source: AAOMgpf70UpLH7gMZAgVol6OkKW+TKU0C14lzJbkxLBrOgvfROka+jxNDsm5/tjxelSj+8VK5y4TSg==
X-Received: by 2002:a63:951e:: with SMTP id
	p30-v6mr1874295pgd.318.1530812901185; 
	Thu, 05 Jul 2018 10:48:21 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:b95e:f0e0:47b8:11a8?
	([2601:646:877f:9499:b95e:f0e0:47b8:11a8])
	by smtp.gmail.com with ESMTPSA id
	a20-v6sm10835634pfi.124.2018.07.05.10.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 10:48:20 -0700 (PDT)
To: Betacentauri <betacentauri@arcor.de>,
	openembedded-core@lists.openembedded.org
References: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <66fc8713-3bf4-add4-0026-dbd029c8fea2@gmail.com>
Date: Thu, 5 Jul 2018 10:48:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>
Subject: Re: [PATCH] libnss-mdns: Fix search path for avahi socket file
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
X-List-Received-Date: Thu, 05 Jul 2018 17:48:20 -0000
X-Groupsio-MsgNum: 113205
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7RmIfKOTjfbDnO0dUl4TZL21OUh512ziL"

--7RmIfKOTjfbDnO0dUl4TZL21OUh512ziL
Content-Type: multipart/mixed; boundary="GdBpVSkmLCTnnbrofpjKU8359bIXuza0E";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Betacentauri <betacentauri@arcor.de>,
 openembedded-core@lists.openembedded.org
Message-ID: <66fc8713-3bf4-add4-0026-dbd029c8fea2@gmail.com>
Subject: Re: [OE-core] [PATCH] libnss-mdns: Fix search path for avahi socket
 file
References: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>
In-Reply-To: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>

--GdBpVSkmLCTnnbrofpjKU8359bIXuza0E
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/5/18 10:26 AM, Betacentauri wrote:
> Since v0.7 avahi uses /run/avahi-daemon/socket.
> libnss searches in $(localstatedir)/run/avahi-daemon/.
> Set localstatedir to / to fix mdns resolving.
> ---
>  meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb =
b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> index 5be5e4f..d0eb276 100644
> --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> @@ -17,6 +17,8 @@ SRC_URI[sha256sum] =3D "1e683c2e7c3921814706d62fbbd3e=
9cbf493a75fa00255e0e715508d81
> =20
>  S =3D "${WORKDIR}/nss-mdns-${PV}"
> =20
> +localstatedir =3D "/"
> +

Adding --localstatedir=3D${root_prefix} to EXTRA_OECONF perhaps is better=

for description.

>  inherit autotools
> =20
>  EXTRA_OECONF =3D "--libdir=3D${base_libdir} --disable-lynx --enable-av=
ahi"
>=20



--GdBpVSkmLCTnnbrofpjKU8359bIXuza0E--

--7RmIfKOTjfbDnO0dUl4TZL21OUh512ziL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWz5Z3gAKCRC7BTNVkZ0z
FOo9AJwN4y67PZdUWygwv9G6EQQZ8NeuSwCbBZHvAA/zAFW9K8qOTEwBlA3f3kI=
=ZhXF
-----END PGP SIGNATURE-----

--7RmIfKOTjfbDnO0dUl4TZL21OUh512ziL--
