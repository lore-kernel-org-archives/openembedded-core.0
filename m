Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BEEEA719DA;
	Fri,  9 Dec 2016 12:52:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so3896784wme.1;
	Fri, 09 Dec 2016 04:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OfIwa266mr5bCCnoOAbohNch1FUSoIgP9iyBBjEzKds=;
	b=M2kaBnhsKaQ9JBR6OCDxPIyyg+3iYSdZBazEmqU3yXGNeNHcFlTrASj3nGc2RrO0J8
	XVPgXlaq0OWBeyhpSVU07LpBqQ92yuHUC0x8YbW08GgbyznVvwqmk6z3of33jF9rz+HJ
	SH1It24RL++TT6lGe+H4zRO+FXxsokl9dGdYqQVXqD0808WARDZQIqrx+UeAeAE0nebZ
	MsmoMNzSiaRwMKYYJfWijxzmD7EmjRsl3fBXgjNreISk7jP1cgEL093TrF73Mnyi2UlF
	q2Fsn7eMAsSEl4gHhfN1Pl7gEMATwPOs6RFO7DqqvKCGb6iKK8EcTnRbRXH2VL28jWnX
	B4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OfIwa266mr5bCCnoOAbohNch1FUSoIgP9iyBBjEzKds=;
	b=b/YxHb9DLjbGCaPLQJluzfIUvBZnrUNvMsEB6xnJOla6CRmn2FZQV+tSz4RkICY1Xj
	aO5k07QUwqJKZw7tLBwrf6/tkbV9clCli8GZWatnaIcgMfZ/Zs4WzLFGlgUVOcyt8V9w
	pqEnvPdAPRynZycTV0Il5WeOHzh94QPm4s2/iiqQOwEkdwXeevijsFK8CC0UMSjEzNYH
	glyAyQutyf0gm4JGL3K35SDHWmzVd65FUE58poZUwHFyD6qFNIDFPWk/AxvzzDrt4L87
	H+uId6jf8oDM9wQfpEPrulM/tgZqX3ko7h0q45zB79TJRNqsYMF9/BjEPvwe9Sr87avO
	JK8g==
X-Gm-Message-State: AKaTC00JVYITb/ONVjpVdgj2KwsHzTkoD2UaFCL7S0iwktgNvo7tjzEaRASGXdgd/8M1eA==
X-Received: by 10.28.134.146 with SMTP id i140mr1655345wmd.100.1481287939085; 
	Fri, 09 Dec 2016 04:52:19 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	jm6sm42156714wjb.27.2016.12.09.04.52.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 09 Dec 2016 04:52:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 9 Dec 2016 13:52:19 +0100
To: openembedded-core@lists.openembedded.org,
	Armin Kuster <akuster808@gmail.com>
Message-ID: <20161209125219.GC3327@jama>
References: <20161206224742.2426.34904@opal.openembedded.org>
	<20161206224747.129FE50158@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20161206224747.129FE50158@opal.openembedded.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 13/13: tzdata: update to 2016i
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
X-List-Received-Date: Fri, 09 Dec 2016 12:52:20 -0000
X-Groupsio-MsgNum: 90574
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline

--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 06, 2016 at 10:47:55PM +0000, git@git.openembedded.org wrote:
> rpurdie pushed a commit to branch jethro
> in repository openembedded-core.
>=20
> commit c6e18b6734108c233afc1a188bc58c0e5287c60d
> Author: Armin Kuster <akuster808@gmail.com>
> AuthorDate: Thu Nov 3 22:53:28 2016 -0700
>=20
>     tzdata: update to 2016i

Hi,

now there is again inconsistency in tz* versions across release
branches.

Oldest jethro has newest (same as master) tzdata and tzcode (2016i)
and newer Yocto releases have older tz* krogoth (2016g) and morty (2016h).

>       Briefly: Cyprus split into two time zones on 2016-10-30, and Tonga
>       reintroduces DST on 2016-11-06.
>    =20
>       Changes to future time stamps
>    =20
>         Pacific/Tongatapu begins DST on 2016-11-06 at 02:00, ending on
>         2017-01-15 at 03:00.  Assume future observances in Tonga will be
>         from the first Sunday in November through the third Sunday in
>         January, like Fiji.  (Thanks to Pulu =CA=BBAnau.)  Switch to nume=
ric
>         time zone abbreviations for this zone.
>    =20
>       Changes to past and future time stamps
>    =20
>         Northern Cyprus is now +03 year round, causing a split in Cyprus
>         time zones starting 2016-10-30 at 04:00.  This creates a zone
>         Asia/Famagusta.  (Thanks to Even Scharning and Matt Johnson.)
>    =20
>         Antarctica/Casey switched from +08 to +11 on 2016-10-22.
>         (Thanks to Steffen Thorsen.)
>    =20
>       Changes to past time stamps
>    =20
>         Several corrections were made for pre-1975 time stamps in Italy.
>         These affect Europe/Malta, Europe/Rome, Europe/San_Marino, and
>         Europe/Vatican.
>    =20
>         First, the 1893-11-01 00:00 transition in Italy used the new UT
>         offset (+01), not the old (+00:49:56).  (Thanks to Michael
>         Deckers.)
>    =20
>         Second, rules for daylight saving in Italy were changed to agree
>         with Italy's National Institute of Metrological Research (INRiM)
>         except for 1944, as follows (thanks to Pierpaolo Bernardi, Brian
>         Inglis, and Michael Deckers):
>    =20
>           The 1916-06-03 transition was at 24:00, not 00:00.
>    =20
>           The 1916-10-01, 1919-10-05, and 1920-09-19 transitions were at
>           00:00, not 01:00.
>    =20
>           The 1917-09-30 and 1918-10-06 transitions were at 24:00, not
>           01:00.
>    =20
>           The 1944-09-17 transition was at 03:00, not 01:00.  This
>           particular change is taken from Italian law as INRiM's table,
>           (which says 02:00) appears to have a typo here.  Also, keep the
>           1944-04-03 transition for Europe/Rome, as Rome was controlled by
>           Germany then.
>    =20
>           The 1967-1970 and 1972-1974 fallback transitions were at 01:00,
>           not 00:00.
>    =20
>     (From OE-Core rev: daf95f7fd9f7ab65685d7b764d8e50df8d00d308)
>    =20
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-extended/tzdata/{tzdata_2016h.bb =3D> tzdata_2016i.bb} | 4 =
++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-extended/tzdata/tzdata_2016h.bb b/meta/recipes-=
extended/tzdata/tzdata_2016i.bb
> similarity index 98%
> rename from meta/recipes-extended/tzdata/tzdata_2016h.bb
> rename to meta/recipes-extended/tzdata/tzdata_2016i.bb
> index cd720e6..298bc64 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2016h.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2016i.bb
> @@ -8,8 +8,8 @@ DEPENDS =3D "tzcode-native"
> =20
>  SRC_URI =3D "http://www.iana.org/time-zones/repository/releases/tzdata${=
PV}.tar.gz;name=3Dtzdata"
> =20
> -SRC_URI[tzdata.md5sum] =3D "878f0ec3fd9e4026ea11dd1b649a315a"
> -SRC_URI[tzdata.sha256sum] =3D "da1b74fc2dec2ce8b64948dafb0bfc2f923c830d4=
21a7ae4d016226135697a64"
> +SRC_URI[tzdata.md5sum] =3D "73912ecfa6a9a8048ddf2e719d9bc39d"
> +SRC_URI[tzdata.sha256sum] =3D "b6966ec982ef64fe48cebec437096b4f57f428751=
9ed32dde59c86d3a1853845"
> =20
>  inherit allarch
> =20
>=20
> --=20
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWEqpAgAKCRA3VSO3ZXaA
HOXnAKCbdJWFeqvmeWhTWAh8F9vGjocjrwCglwhIhB+uEM+XdTUYoqPx9cry2+Q=
=xs5I
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--
