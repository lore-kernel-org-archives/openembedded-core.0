Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URNpI-0001pK-4U
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 16:23:22 +0200
Received: by mail-ea0-f181.google.com with SMTP id z10so1866008ead.40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Vpp1mfUhWNYXo3xtYqKY+VzmFZ8QDM42+1fInCS0CXA=;
	b=yQG23NqDWyl1OtWJI8aQNrsPwjKsBMp2PDcEr3u6w5xqW6Q/acZ1fC9F91lzJ9p83e
	C9yl34c9IT6Wv2tmNBYexsKIqEILkOX2bgaUUCllM79mFC1xKXnuHVVGjQVuZX0bhFq9
	vMFMzbZ21lQbk6szV1NogW3/qphkTchCTrI9wcranxmIqh95SK+41uARvULFumCHNHAX
	pTtpMF8xBlmfWGhuqhAOyFPKsfoMR7vJGIg7aNSUd15yFL06cNeQWwux0kIw1zAiQ0uH
	nQ6uEs4Im7G4EQLgY57AGwBIFI8WEtL/isyq56LI3voj+yJoIL1X7JPz1QPxzjTLL8iA
	Eczg==
X-Received: by 10.14.175.134 with SMTP id z6mr8558946eel.15.1365948312987;
	Sun, 14 Apr 2013 07:05:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i53sm21725307eeu.5.2013.04.14.07.05.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 07:05:12 -0700 (PDT)
Date: Sun, 14 Apr 2013 16:05:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130414140517.GA2475@jama>
References: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1365947722-16267-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] systemd: remove udev-extraconf from RRECOMMENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 14:23:28 -0000
X-Groupsio-MsgNum: 37870
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline

--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 14, 2013 at 03:55:22PM +0200, Koen Kooi wrote:
> In the original udev and systemd updates these extra conf rules and scrip=
ts where removed and moved to a different recipe to avoid pulling them in b=
y default, making them opt-in. The systemd merge into oe-core regressed thi=
s into making it impossible to opt out of it when using package feeds for u=
pgrades.
>=20
> Change it back to opt-in for images/packagegroups.

Maybe RSUGGESTS?

Cheers,

> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> Since udev-extraconf is persona non grata in angstrom I have no idea what=
 depends on it, so please tell me what needs to get fixed after removing th=
is.
>=20
>  meta/recipes-core/systemd/systemd_199.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core=
/systemd/systemd_199.bb
> index 0d07f85..fbf2a2f 100644
> --- a/meta/recipes-core/systemd/systemd_199.bb
> +++ b/meta/recipes-core/systemd/systemd_199.bb
> @@ -202,7 +202,7 @@ FILES_udev-dbg +=3D "/lib/udev/.debug"
> =20
>  RDEPENDS_udev +=3D "udev-utils"
>  RPROVIDES_udev =3D "hotplug"
> -RRECOMMENDS_udev +=3D "udev-extraconf udev-hwdb"
> +RRECOMMENDS_udev +=3D "udev-hwdb"
> =20
>  FILES_udev +=3D "${base_sbindir}/udevd \
>                 ${base_libdir}/systemd/systemd-udevd \
> --=20
> 1.8.1.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFqt50ACgkQN1Ujt2V2gBwhJQCdGx26J1M2jdUV4VLpRXfKswtV
n54Ani0xYfUvm2gJm4O+ZEJLlrId0vlH
=9coN
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
