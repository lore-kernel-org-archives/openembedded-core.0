Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SuiXI-0001zn-Mz; Fri, 27 Jul 2012 13:16:48 +0200
Received: by bkcik5 with SMTP id ik5so1345578bkc.6
	for <multiple recipients>; Fri, 27 Jul 2012 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i9bdEBth8un98gq4dGXlmVg5pTBcwRZAPH2CNmG0DBU=;
	b=JqMb9W2SzjhyQQdsOB8Elp2kq8dL0uYYAO1+7eq4XYeG7/Ue8ZY8pLZ4MwXd6vjme7
	nIpVKDGC4gnF1d/W2qf7RweuVQKbhYCLQiFGCmEpgO8Lw3fxnFwNGcDLlQZRF3MR9Y0g
	jbLxo8SUFkCcqfHkjIFz9Gini4hyCHIMCOhqG4zyFVPGkDFs/7Qex5iF4b+3PHbkCAMM
	8bkhrOsAfZFSEVPLPG2KFucJet03IAIQZVdonptGPg8bUk679ohpUzvhoDV0d+sMQW8Y
	DCySWF7f9HVEK17tEmtk4uqwMNiMLQL63skojQ8cxOoPdEtmIn1kCDQr44EkN5Rmk/J8
	M8bQ==
Received: by 10.205.132.12 with SMTP id hs12mr808447bkc.47.1343387116764;
	Fri, 27 Jul 2012 04:05:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm766985bkc.1.2012.07.27.04.05.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:05:15 -0700 (PDT)
Date: Fri, 27 Jul 2012 13:05:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Cristian Iorga <cristian.iorga@intel.com>
Message-ID: <20120727110521.GH3621@jama.jama.net>
References: <20120726135324.6971710217@opal>
MIME-Version: 1.0
In-Reply-To: <20120726135324.6971710217@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : libpcap: upgrade to ver. 1.3
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
X-List-Received-Date: Fri, 27 Jul 2012 11:16:48 -0000
X-Groupsio-MsgNum: 26360
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r5lq+205vWdkqwtk"
Content-Disposition: inline

--r5lq+205vWdkqwtk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 01:53:24PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 3f0cc742ea5d4788df26bb0592c294e5a67e1093
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D3f0cc742ea5d4788df26bb0592c294e5a67e1093
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Tue Jul 24 08:36:57 2012 +0300
>=20
> libpcap: upgrade to ver. 1.3
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This changes .so version so now libpcap package is renamed to libpcap1
and breaks at least ppp and tcpdump recipes:

/OE/openembedded-core/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
/OE/meta-openembedded/meta-oe/recipes-support/tcpdump/tcpdump_4.1.1.bb

I'll send PR bumps for those 2, but maybe there are more recipes
depending on now non-existent libpcap.

Cheers,

> ---
>=20
>  .../{libpcap-1.2.1 =3D> libpcap-1.3.0}/aclocal.patch |    0
>  .../ieee80215-arphrd.patch                         |    0
>  .../libpcap/{libpcap_1.2.1.bb =3D> libpcap_1.3.0.bb} |    4 ++--
>  3 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.patc=
h b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
> similarity index 100%
> rename from meta/recipes-connectivity/libpcap/libpcap-1.2.1/aclocal.patch
> rename to meta/recipes-connectivity/libpcap/libpcap-1.3.0/aclocal.patch
> diff --git a/meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-ar=
phrd.patch b/meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arph=
rd.patch
> similarity index 100%
> rename from meta/recipes-connectivity/libpcap/libpcap-1.2.1/ieee80215-arp=
hrd.patch
> rename to meta/recipes-connectivity/libpcap/libpcap-1.3.0/ieee80215-arphr=
d.patch
> diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb b/meta/re=
cipes-connectivity/libpcap/libpcap_1.3.0.bb
> similarity index 73%
> rename from meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
> rename to meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
> index 91bedf7..717e0e8 100644
> --- a/meta/recipes-connectivity/libpcap/libpcap_1.2.1.bb
> +++ b/meta/recipes-connectivity/libpcap/libpcap_1.3.0.bb
> @@ -5,8 +5,8 @@ PR =3D "${INC_PR}.0"
>  SRC_URI +=3D "file://aclocal.patch \
>              file://ieee80215-arphrd.patch"
> =20
> -SRC_URI[md5sum] =3D "06046e0e81efc60566daf1cc96c77d46"
> -SRC_URI[sha256sum] =3D "a135a6ef7e539729a57c7ed345bdb9b64159e13404174006=
a7972eb33f00debd"
> +SRC_URI[md5sum] =3D "f78455a92622b7a3c05c58b6ad1cec7e"
> +SRC_URI[sha256sum] =3D "41cbd9ed68383afd9f1fda279cb78427d36879d9e34ee707=
e31a16a1afd872b9"
> =20
>  #
>  # make install doesn't cover the shared lib
>=20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--r5lq+205vWdkqwtk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlASdfEACgkQN1Ujt2V2gBw1xwCfWmLd9pZt9z/BPJyE3jeesFPR
3JUAn0CrOMs0iQ2QEX0B0knvz6qM8FDo
=L/YX
-----END PGP SIGNATURE-----

--r5lq+205vWdkqwtk--
