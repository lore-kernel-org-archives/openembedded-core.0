Received: from mail-da0-f41.google.com ([209.85.210.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UK91l-0001hQ-Oo
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 16:09:39 +0100
Received: by mail-da0-f41.google.com with SMTP id w4so3263426dam.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sGSYnU+g0FbDcqu/O7A5bKNIgKrJfXDf80E8/ac7q8A=;
	b=t98FKWjayEKIVT1jgm7MirAG3AKYI8klPBg01M+5ot8DtyP9GVE6uxd+tGtRR3Jgcp
	z7EXuwlTjFBbgnH64GqEW5Nm5aQGHCjh86VvTX5JIRpVpzuPRL4haVo4KIgTXTDJMymt
	/mO1Yj/4jZp/wXf9+80N94qMPYc02IheSlIxdWdeRA9ZHM17IEnf4cVeh4E10HgnwfEc
	Ya/VcBYmn8yIpg2ghahjmcfjkL7+c+WCdHhCx36QW9hBAUXDpXyH+Ig+BqnySQt/n/nB
	MmBDkB1oLnQ9nSkhpiUv+ieFiajk2HSK3b1ADT2LXcDS/QWaClpJ8exlglWidCku9iYh
	WB0Q==
X-Received: by 10.68.226.201 with SMTP id ru9mr18084803pbc.102.1364223158633; 
	Mon, 25 Mar 2013 07:52:38 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kl4sm13698352pbc.31.2013.03.25.07.52.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 07:52:37 -0700 (PDT)
Date: Mon, 25 Mar 2013 15:52:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130325145230.GB7539@jama>
References: <20130322170539.C5237504C8@opal> <20130325140816.GA7539@jama>
	<51505C56.8040508@intel.com>
MIME-Version: 1.0
In-Reply-To: <51505C56.8040508@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Mon, 25 Mar 2013 15:09:39 -0000
X-Groupsio-MsgNum: 37013
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 04:16:54PM +0200, Laurentiu Palcu wrote:
>=20
>=20
> On 03/25/2013 04:08 PM, Martin Jansa wrote:
> > On Fri, Mar 22, 2013 at 05:05:39PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3Dc8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> >>
> >> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >> Date:   Tue Mar 19 18:23:56 2013 +0200
> >>
> >> mesa: rename mesa-dri recipe to just mesa
> >>
> >> Rename mesa-dri recipes to just mesa. Also, replace all references to
> >> mesa-dri in all recipes/configs.
> >>
> >> The reason for this renaming (quote from bugzilla):
> >>
> >> "mesa-dri is a artefact of mesa-xlib existing, which doesn't anymore.
> >> mesa-dri should be renamed to mesa."
> >>
> >> [YOCTO #3385]
> >=20
> > How is this supposed to work with incremental builds?
> >=20
> > WARNING: The recipe mesa is trying to install files into a shared area
> > when those files already exist. Those files and their manifest location
> > are:
> >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so
> >    Matched in manifest-qemux86-64-mesa-dri
> >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.la
> >    Matched in manifest-qemux86-64-mesa-dri
> >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.so.1.0.0
> >    Matched in manifest-qemux86-64-mesa-dri
> >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so.2.0=
=2E0
> >    Matched in manifest-qemux86-64-mesa-dri
> >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.so.=
1.1.0
> >    Matched in manifest-qemux86-64-mesa-dri
> >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM.la
> > .. and lot more ..
> >=20
> > from what I remember this means, that old mesa-dri files will be kept in
> > sysroot until I do build from scratch (or sstate-cache). That can be
> > pretty bad when mesa is upgraded to some new version required by other
> > components and my incremental sysroot will still keep old mesa-dri
> > instead.
> >=20
> > Yes, I can cleansstate mesa-dri before updating oe-core to include this
> > commit or revert this commit to cleansstate and then remove revert..
> > but that's not something average OE user will understand and do.
>=20
> I understand your point here but, frankly, I have no clue how this could
> have been avoided... Are there any means in oe-core that would allow
> removing the old files from the sysroot?

I don't think there is something for that now, but the same problem is
for PACKAGE_ARCH changes :/. I'm not sure if such renames and arch
changes are worth it without proper support in OE.

Maybe we should introduce something like:
REPLACES =3D "${TUNE_PKGARCH}:mesa-dri"

and use it for PACKAGE_ARCH changes too (e.g. from TUNE_PKGARCH to
allarch)
REPLACES =3D "${TUNE_PKGARCH}:foo"
This can be a bit more complicated because it would create variable
dependency from new allarch recipe to old PKGARCH (to know which files
need to be removed) :/.

> >> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> ---
> >>
> >>  meta/conf/distro/include/default-providers.inc     |    6 +++---
> >>  meta/conf/machine/include/ia32-base.inc            |    4 ++--
> >>  meta/conf/machine/include/qemu.inc                 |    8 ++++----
> >>  meta/conf/machine/qemux86-64.conf                  |    8 ++++----
> >>  meta/conf/machine/qemux86.conf                     |    8 ++++----
> >>  meta/recipes-graphics/mesa/libglu_9.0.0.bb         |    2 +-
> >>  meta/recipes-graphics/mesa/mesa-common.inc         |    5 +----
> >>  meta/recipes-graphics/mesa/mesa-dri_git.bb         |    8 --------
> >>  meta/recipes-graphics/mesa/mesa-git.inc            |    1 -
> >>  .../mesa/{mesa-dri.inc =3D> mesa.inc}                |   11 ++++++++-=
--
> >>  .../mesa/{mesa-dri_9.0.2.bb =3D> mesa_9.0.2.bb}      |    2 +-
> >>  meta/recipes-graphics/mesa/mesa_git.bb             |    7 +++++++
> >>  meta/recipes-graphics/wayland/weston_1.0.3.bb      |    6 +++---
> >>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
> >>  14 files changed, 39 insertions(+), 39 deletions(-)
> >>
> >> Diff:   http://git.openembedded.org/?p=3Dopenembedded-core.git/?a=3Dco=
mmitdiff;h=3Dc8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFQZK4ACgkQN1Ujt2V2gByNfgCfbso8k8+sZ+Iogaomk+alaobS
uzEAn13C4v//AiMn4CVvBVG0b2INH/UU
=mND8
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
