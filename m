Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD586B8A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 08:17:03 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so2771801eek.36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 01:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DZWp0Pg+Bj2rDnwO70Im+pSJfEZt2DLkwqQiWypuYn4=;
	b=qNmNYsUYimbFeE5Jmb1u9GbpLX6/sDjy66Z6HreA1094CEL9FxtRw+seFUGguCdADQ
	p8LjECcfI3qHHU7xTcTO4AgzxYHMgdJBhY4ZJ8ohfIHY9IcTjEnpCRZCMFmL3SeWT1Xf
	ZSomkrY4+kFLmULtqEkyBfCSbO4YQ00k7Mg6rUXl1ApC4ewQR7E/Z/LItzNQ79/Gmmgm
	kS3Q2zRtjT2TLTTTeB9tFwZoMlu9v4Nsg82GzFFg9CW3khS44eFu4Sn5RL9HLowsZkeo
	TysG0cKFmhLc0uHtlaYnV5r0knVLe4W7kT/JZPFVxXQRMMHswxQ83ko/vsZ3Qe58P7LX
	180Q==
X-Received: by 10.14.174.195 with SMTP id x43mr19865047eel.47.1377677823676;
	Wed, 28 Aug 2013 01:17:03 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm35202019eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 01:17:03 -0700 (PDT)
Date: Wed, 28 Aug 2013 10:18:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Message-ID: <20130828081814.GE3544@jama>
References: <cover.1377613447.git.mihai.prica@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Add midori and dependencies
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
X-List-Received-Date: Wed, 28 Aug 2013 08:17:05 -0000
X-Groupsio-MsgNum: 44177
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8WKGInOJRMBXYFEc"
Content-Disposition: inline

--8WKGInOJRMBXYFEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 05:59:34PM +0300, Mihai Prica wrote:
> The Midori web-browser can be used to more easily test the functionality
> of webkit-gtk.
>=20
> * The midori and libnotify recipes are from meta-gnome.
> * The python-docutils and vala recipes are from meta-oe.
> * The midori and python-docutils packages have been updated to the latest
> upstream version.
>=20
> Midori also depends on ca-certificates. A patch set was sent by Christoph=
er
> Larson that adds the recipe in oe-core. This series depends on his additi=
on.

Are you going to send patches to oe-devel to remove moved
recipes/bbclasses ?

> The following changes since commit b467b99a5d25efe5eadfb07dbecba608575256=
ac:
>=20
>   linux-yocto: switch genericx86 to use common-pc (2013-08-24 09:37:49 +0=
100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib mihaip/midori
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dmihaip/midori
>=20
> Mihai Prica (5):
>   python-docutils: add version 0.11 from meta-oe
>   libnotify: add version 0.6.0 from meta-oe
>   vala: add version 0.16 from meta-oe
>   vala.bbclass: add class from meta-oe
>   midori: add version 0.5.5 from meta-oe
>=20
>  meta/classes/vala.bbclass                          |   18 +++++++
>  .../python/python-docutils_0.11.bb                 |   18 +++++++
>  ...-gen-don-t-append-dirty-if-we-re-not-in-g.patch |   53 ++++++++++++++=
++++++
>  meta/recipes-devtools/vala/vala.inc                |   20 ++++++++
>  meta/recipes-devtools/vala/vala_0.16.0.bb          |    8 +++
>  meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |   17 +++++++
>  meta/recipes-sato/midori/midori_0.5.5.bb           |   43 ++++++++++++++=
++
>  7 files changed, 177 insertions(+)
>  create mode 100644 meta/classes/vala.bbclass
>  create mode 100644 meta/recipes-devtools/python/python-docutils_0.11.bb
>  create mode 100644 meta/recipes-devtools/vala/vala-0.16.0/0001-git-versi=
on-gen-don-t-append-dirty-if-we-re-not-in-g.patch
>  create mode 100644 meta/recipes-devtools/vala/vala.inc
>  create mode 100644 meta/recipes-devtools/vala/vala_0.16.0.bb
>  create mode 100644 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
>  create mode 100644 meta/recipes-sato/midori/midori_0.5.5.bb
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--8WKGInOJRMBXYFEc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIdskYACgkQN1Ujt2V2gBw1+ACeOMuAqoyMz4tBqSZeWW+66NIC
FMAAn2hFllqQgcPCPEgucmsXuefgl/zL
=VHAd
-----END PGP SIGNATURE-----

--8WKGInOJRMBXYFEc--
