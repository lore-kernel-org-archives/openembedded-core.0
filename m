Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q36gi-0001IM-26
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Mar 2011 14:04:24 +0100
Received: by wye20 with SMTP id 20so531997wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2011 06:02:30 -0700 (PDT)
Received: by 10.216.123.69 with SMTP id u47mr697418weh.16.1301058150486;
	Fri, 25 Mar 2011 06:02:30 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f30sm338789wef.7.2011.03.25.06.02.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Mar 2011 06:02:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1300959372-27675-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 25 Mar 2011 14:02:28 +0100
Message-Id: <0C913ED4-C8C5-4A15-BFFD-E86AB68C1B3A@dominion.thruhere.net>
References: <1300959372-27675-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] gnutls: add BBCLASSEXTEND = native
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
X-List-Received-Date: Fri, 25 Mar 2011 13:04:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Any comments?

Op 24 mrt 2011, om 10:36 heeft koen@dominion.thruhere.net het volgende =
geschreven:

> From: Koen Kooi <koen@dominion.thruhere.net>
>=20
> This is needed for the native recipes in meta-efl
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-support/gnutls/gnutls.inc |    2 ++
> 1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls.inc =
b/meta/recipes-support/gnutls/gnutls.inc
> index 76f4ca6..a795585 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -3,6 +3,8 @@ HOMEPAGE =3D "http://www.gnu.org/software/gnutls/"
> BUGTRACKER =3D "https://savannah.gnu.org/support/?group=3Dgnutls"
> DEPENDS =3D "zlib lzo gettext libtasn1 libgcrypt (>=3D 1.4.2)"
>=20
> +BBCLASSEXTEND =3D "native"
> +
> LICENSE =3D "GPLv3+ & LGPLv2.1+"
> LICENSE_${PN} =3D "LGPLv2.1+"
> LICENSE_${PN}-xx =3D "GPLv2.1+"
> --=20
> 1.6.6.1
>=20



