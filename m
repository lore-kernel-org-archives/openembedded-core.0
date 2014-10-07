Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id B109971186
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 16:57:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3jC4bV0lK0z3hhsZ;
	Tue,  7 Oct 2014 18:57:10 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3jC4bV0D2Czvh1y;
	Tue,  7 Oct 2014 18:57:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id n5eDphaW9m18; Tue,  7 Oct 2014 18:57:08 +0200 (CEST)
X-Auth-Info: Dr4yH22efHSmqIydDY9YGE+JRX9bzb+B3ADiczmP/xpjeHOOZAAQk1whVg44Y8mL
Received: from [10.0.0.72] (host-212-18-10-182.customer.m-online.net
	[212.18.10.182])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue,  7 Oct 2014 18:57:08 +0200 (CEST)
Message-ID: <54341B5F.5070807@menlosystems.com>
Date: Tue, 07 Oct 2014 18:57:03 +0200
From: Olaf Mandel <o.mandel@menlosystems.com>
Organization: Menlo Systems
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <mailman.3924.1412700227.1406.openembedded-core@lists.openembedded.org>
In-Reply-To: <mailman.3924.1412700227.1406.openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.6
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] Images: handle rowstride != width*bytes_per_pixel
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
X-List-Received-Date: Tue, 07 Oct 2014 16:57:14 -0000
X-Groupsio-MsgNum: 58405
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="fLwI8wHJ3FD65XSAmeilBQMbkgiVP7q69"

--fLwI8wHJ3FD65XSAmeilBQMbkgiVP7q69
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 07.10.2014 18:43, schrieb Olaf Mandel:
> Up till now, image data with a rowstride larger than the value
> expected from width and bytes_per_pixel caused a trapezoid
> distortion of the displayed image.
>=20
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
-Snipp-

Hi,

my apologies: I should have said that this patch and the next are
against the psplash repository:

http://git.yoctoproject.org/cgit/cgit.cgi/psplash

This is why I CCed the pslash maintainer.

Best regards,
Olaf Mandel


--fLwI8wHJ3FD65XSAmeilBQMbkgiVP7q69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)

iQEcBAEBAgAGBQJUNBtkAAoJEFS9nbRiUh3/x1AH/jS1ClzhR3gOCfhd4qlSbGx/
MDrNZoj9GqD395k88TGRrP9V5Ggty8H1Q3rkVoZAbf4zLr5xXpkZ8ICnHTNwiGTR
UeIzOjDFTT4ccaIPuoMv15EiEoIdRYPz9A+FqJnS6xRVu4hI5lAcbqBULAG9of3j
lszL54EQDXYdZkXi/YrStjIxiNPiFZhR8PM4DArXe/A1y9bpLvZjiAChxAUdvg4y
sIdq5tWhuhmiCsurKA+L59gFEmSexeTYdMGez1cHUlFeGKeWmjjydXMjjn0LVeCa
3c8UjmI7DrcvG8GjSAVYUl5wLrfYu5BYXMJI2qTjXjZ8bYLzpx6w+QGVsIgIHXU=
=GDin
-----END PGP SIGNATURE-----

--fLwI8wHJ3FD65XSAmeilBQMbkgiVP7q69--
