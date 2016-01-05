Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0570A6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 15:01:14 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id b14so33138517wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 07:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fhFgui7TyQgkTv0QrGCvaqZNl4mEknjRx5lBHD6TE/4=;
	b=KJrMrzpyl3wfTwzGu/DIEvYdQF/dNi7hVhg/pFnK8rs2zEIuTkGX+XdHclIr+1oHF6
	O5PxLw33DeW3W98ELhuFLzBCCeRdCT3WenogNIhanwaMz2nAAhSdZZrdPnFhDZf0Qm9C
	uwkg9g1IJdy+h+CZyLdJSrYDYZSZ6YmpRiBKSdOg8yG8fXSxl5FZ6CMHpw5qML6JDs6U
	gls/z4OVz6mZpgK+R3rfK6LGHaoiRZvlVvR27lr4TPb6eqfyv3yvBwsP+a8QDbcjI8vE
	NRMN8/kuDc/dtLfJ1jXlOxmHbdG/roDNWGFFFt/iCV3/z4BPJG8JG3VCrah59hB3TqgX
	QIYA==
X-Received: by 10.28.176.131 with SMTP id z125mr3635506wme.5.1452006074796;
	Tue, 05 Jan 2016 07:01:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c203sm3983665wmd.5.2016.01.05.07.01.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jan 2016 07:01:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Jan 2016 16:01:24 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160105150124.GB2574@jama>
References: <1452002894-10301-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1452002894-10301-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] bluez5: upgrade to 5.37
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
X-List-Received-Date: Tue, 05 Jan 2016 15:01:19 -0000
X-Groupsio-MsgNum: 75451
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2016 at 04:08:13PM +0200, Maxin B. John wrote:
> 5.36 -> 5.37
>=20
> Remove the backported patch:
> core-profile-Fix-possible-crash-when-registering-pro.patch

Don't you need to remove
file://core-profile-Fix-possible-crash-when-registering-pro.patch
=66rom SRC_URI when you're removing the file?

Can you please add PNBLACKLIST which will blacklist bluez5 when bluez4
is in DISTRO_FEATURES?

Like I did for bluez4 in:
http://git.openembedded.org/meta-openembedded/commit/?id=3D73ba7cd70f75a898=
bf4c3f8ae38c9904fc3e4724

Making bluez4 and bluez5 really mutually exclusive would help with
issues like this one:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-January/105=
341.html

> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  ...e-Fix-possible-crash-when-registering-pro.patch | 54 ----------------=
------
>  .../bluez5/{bluez5_5.36.bb =3D> bluez5_5.37.bb}      |  5 +-
>  2 files changed, 2 insertions(+), 57 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-=
Fix-possible-crash-when-registering-pro.patch
>  rename meta/recipes-connectivity/bluez5/{bluez5_5.36.bb =3D> bluez5_5.37=
=2Ebb} (83%)
>=20
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-pos=
sible-crash-when-registering-pro.patch b/meta/recipes-connectivity/bluez5/b=
luez5/core-profile-Fix-possible-crash-when-registering-pro.patch
> deleted file mode 100644
> index 5c6cee1..0000000
> --- a/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-c=
rash-when-registering-pro.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From bc4dbda3362d3654447d8ae6525cac1540b7d705 Mon Sep 17 00:00:00 2001
> -From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> -Date: Thu, 5 Nov 2015 15:14:50 +0200
> -Subject: [PATCH] core/profile: Fix possible crash when registering profi=
les
> -
> -Upstream-Status: Backport
> -
> -Profiles under ext_profiles are local and should no be mixed with other
> -external profiles since its type is different which can may cause invalid
> -memory when accessing member of ext_profile struct.
> ----
> - src/profile.c | 14 ++------------
> - 1 file changed, 2 insertions(+), 12 deletions(-)
> -
> -diff --git a/src/profile.c b/src/profile.c
> -index 49445d7..5a4f09c 100644
> ---- a/src/profile.c
> -+++ b/src/profile.c
> -@@ -719,19 +719,13 @@ void btd_profile_foreach(void (*func)(struct btd_p=
rofile *p, void *data),
> -=20
> - int btd_profile_register(struct btd_profile *profile)
> - {
> --	if (profile->external)
> --		ext_profiles =3D g_slist_append(ext_profiles, profile);
> --	else
> --		profiles =3D g_slist_append(profiles, profile);
> -+	profiles =3D g_slist_append(profiles, profile);
> - 	return 0;
> - }
> -=20
> - void btd_profile_unregister(struct btd_profile *profile)
> - {
> --	if (profile->external)
> --		ext_profiles =3D g_slist_remove(ext_profiles, profile);
> --	else
> --		profiles =3D g_slist_remove(profiles, profile);
> -+	profiles =3D g_slist_remove(profiles, profile);
> - }
> -=20
> - static struct ext_profile *find_ext_profile(const char *owner,
> -@@ -742,10 +736,6 @@ static struct ext_profile *find_ext_profile(const c=
har *owner,
> - 	for (l =3D ext_profiles; l !=3D NULL; l =3D g_slist_next(l)) {
> - 		struct ext_profile *ext =3D l->data;
> -=20
> --		/*
> --		 * Owner and path can be NULL if profile was registered by a
> --		 * plugin using external flag.
> --		 */
> - 		if (g_strcmp0(ext->owner, owner))
> - 			continue;
> -=20
> ---=20
> -2.5.0
> -
> diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb b/meta/recip=
es-connectivity/bluez5/bluez5_5.37.bb
> similarity index 83%
> rename from meta/recipes-connectivity/bluez5/bluez5_5.36.bb
> rename to meta/recipes-connectivity/bluez5/bluez5_5.37.bb
> index 884bb77..b58423a 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
> +++ b/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
> @@ -1,8 +1,7 @@
>  require bluez5.inc
> =20
> -SRC_URI +=3D "file://core-profile-Fix-possible-crash-when-registering-pr=
o.patch"
> -SRC_URI[md5sum] =3D "9a0ee479cacc44fac68f6a65b1cd3eba"
> -SRC_URI[sha256sum] =3D "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a=
3d23e75962e578f2"
> +SRC_URI[md5sum] =3D "33177e5743e24b2b3738f72be64e3ffb"
> +SRC_URI[sha256sum] =3D "c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd46=
99b7e0ce5350d6b0"
> =20
>  # noinst programs in Makefile.tools that are conditional on READLINE
>  # support
> --=20
> 2.4.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlaL2sMACgkQN1Ujt2V2gBxZigCXYfsf9XHt7tRn//CFZ0geA8fl
HQCeIR9NM9FzrxH6cZsZpu4nw28xYWY=
=buoq
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
