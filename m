Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLFeo-0000Cw-14
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 15:49:42 +0100
Received: by eyd9 with SMTP id 9so6206479eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 07:43:35 -0700 (PDT)
Received: by 10.216.138.221 with SMTP id a71mr2583113wej.102.1320158615462;
	Tue, 01 Nov 2011 07:43:35 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff6sm38739055wbb.10.2011.11.01.07.43.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 07:43:34 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 1 Nov 2011 15:43:33 +0100
In-Reply-To: <1320157607.15387.10.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320157607.15387.10.camel@ted>
Message-Id: <CAD24AFF-6CC1-4BAC-ACAB-F2179BA2BFC8@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] dbus: Use $D not ${D} in the postinstall
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Nov 2011 14:49:42 -0000
X-Groupsio-MsgNum: 11748
Content-Type: multipart/signed;
	boundary="Apple-Mail=_26AE3F06-6ACF-403F-9E87-0A29D6AC5419";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_26AE3F06-6ACF-403F-9E87-0A29D6AC5419
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 nov. 2011, om 15:26 heeft Richard Purdie het volgende geschreven:

> We need to do this as we don't want bitbake to expand the variable
> but use the shell variable instead.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Acked-by: Koen Kooi <k-kooi@ti.com>

Although it technically needs a PR bump, we can skip it since there's =
one later in this patch set.

> ---
> diff --git a/meta/recipes-core/dbus/dbus.inc =
b/meta/recipes-core/dbus/dbus.inc
> index 4c7d87a..b378bda 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -51,7 +51,7 @@ RRECOMMENDS_${PN}-lib =3D "${PN}"
> FILES_${PN}-dev +=3D "${libdir}/dbus-1.0/include =
${bindir}/dbus-glib-tool"
>=20
> pkg_postinst_dbus() {
> -	if [ -z "${D}" ] && [ -e /etc/init.d/populate-volatile.sh ] ; =
then
> +	if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
> 		/etc/init.d/populate-volatile.sh update
> 	fi
> }
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_26AE3F06-6ACF-403F-9E87-0A29D6AC5419
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6wBZUACgkQMkyGM64RGpFkDQCfUbMsTNSx5VlN8ffNj3PWyf3h
OuEAoLMfLFu1NkfXN+Zai9De2SeeKLqW
=p8OJ
-----END PGP SIGNATURE-----

--Apple-Mail=_26AE3F06-6ACF-403F-9E87-0A29D6AC5419--
