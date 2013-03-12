Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UFXK4-0003Wh-54
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 23:05:29 +0100
Received: by mail-pb0-f51.google.com with SMTP id un15so304421pbc.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=+PFiWxcBAzxXJrDa1d6N2SgyMogqqGJxQVlh8y/Cyac=;
	b=C5ZadX1aqKFs19N2thZgfcnMY2ZBFw38MTBDU77S4n/ZGupRrnvv5UAXtgSD1r6mUk
	fmsxkujQARTx/J39lYad22UaaubZrBBFDFPBEfb5Jd5DLko4/y+9lI3yHQGGgGn0tLan
	u96MY+NPrOpR92s4bMeN7RT4q/xuT1GUJ/46dt8NnNtw0hSAgooShC3xpkDMnNcUaQ8A
	QPaitYYY36FrbT5c2qqenX/4lOeeiUY/SXS6vSM/NgyZCdk5zK30X2zT6QqKx3P6cF1G
	YU69wf8EbUAWryKtfLMFnel5kvr/h78LGvI73bDICMj2TbrZ+/9nKo8dXZWgVxX4PcJv
	VGNg==
X-Received: by 10.68.97.65 with SMTP id dy1mr40718503pbb.190.1363124927453;
	Tue, 12 Mar 2013 14:48:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ax3sm26610656pbd.42.2013.03.12.14.48.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 14:48:46 -0700 (PDT)
Date: Tue, 12 Mar 2013 22:48:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20130312214846.GM9724@jama.dyndns-home.com>
References: <1363107795-2140-1-git-send-email-cristian.iorga@intel.com>
	<1363107795-2140-4-git-send-email-cristian.iorga@intel.com>
MIME-Version: 1.0
In-Reply-To: <1363107795-2140-4-git-send-email-cristian.iorga@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 3/4] bluez5: conflicts with bluez4
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
X-List-Received-Date: Tue, 12 Mar 2013 22:05:30 -0000
X-Groupsio-MsgNum: 36541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6CiRFyVmOOJ3DkBX"
Content-Disposition: inline

--6CiRFyVmOOJ3DkBX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2013 at 07:03:14PM +0200, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5_5.3.bb |    2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb b/meta/recipe=
s-connectivity/bluez5/bluez5_5.3.bb
> index 311562f..5963483 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.3.bb
> @@ -6,6 +6,8 @@ SRC_URI +=3D "file://bluetooth.conf \
>  SRC_URI[md5sum] =3D "44de20f6422bf90a01b8df48e7dfe4ed"
>  SRC_URI[sha256sum] =3D "828e2cd1109835c2fc1d731fb7fd7b46951044e451cc8556=
a37e1312d8c8c9a6"
> =20
> +RCONFLICTS_${PN} =3D "bluez4"

That's not enough for upgrade path, add RREPLACES/RPROVIDES too.
> +
>  do_install_append() {
>  	install -d ${D}${sysconfdir}/bluetooth/
>  	install -m 0644 ${S}/profiles/audio/audio.conf ${D}/${sysconfdir}/bluet=
ooth/
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6CiRFyVmOOJ3DkBX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE/or4ACgkQN1Ujt2V2gBzzrACfXqmyeXeJcjZTX+0+6mjviJWO
SmEAn01alvvKPV9nYFPpX4z7mFvr8H/i
=7iyL
-----END PGP SIGNATURE-----

--6CiRFyVmOOJ3DkBX--
