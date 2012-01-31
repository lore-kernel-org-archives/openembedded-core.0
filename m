Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RsJXm-0005FN-J2
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 20:39:06 +0100
Received: by eaao11 with SMTP id o11so105013eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 11:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lTSMqrBQCuX4PBc8UimiG5r0FotPDLK6kQrZgRK4oe0=;
	b=q5WNCrwR13+M3UjEKb1OLTDtzGhZpKGS+x7bGXV+55goERHd484oJSLX5XJNBpDRwF
	75n85SL2Ci7+F2iolk+/fxjRL9mC39FHj3Nun0bdB+lgPUfaFtglmndbhk7zc5iS5Qop
	AwljV6t5fRGHAmUXF4pr2lFsBrfitTKWpB28E=
Received: by 10.213.35.133 with SMTP id p5mr599476ebd.148.1328038272682;
	Tue, 31 Jan 2012 11:31:12 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm89519476eeb.4.2012.01.31.11.31.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 11:31:11 -0800 (PST)
Date: Tue, 31 Jan 2012 20:31:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120131193109.GE3644@jama.jama.net>
References: <1327681281-11454-1-git-send-email-paul.gortmaker@windriver.com>
	<4F281CAC.5010304@linux.intel.com> <4F282815.1070407@windriver.com>
	<4F28343A.8070501@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F28343A.8070501@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, poky@yoctoproject.org
Subject: Re: [poky] [PATCH 0/3] U-boot recipe for most recent stable release.
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
X-List-Received-Date: Tue, 31 Jan 2012 19:39:06 -0000
X-Groupsio-MsgNum: 16805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5xSkJheCpeK0RUEJ"
Content-Disposition: inline

--5xSkJheCpeK0RUEJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 10:34:34AM -0800, Saul Wold wrote:
> On 01/31/2012 09:42 AM, Paul Gortmaker wrote:
> > On 12-01-31 11:54 AM, Saul Wold wrote:
> >> On 01/27/2012 08:21 AM, Paul Gortmaker wrote:
> >>> This adds a recipe for U-Boot v2011.12.  In doing so, some of
> >>> non-shareable settings were moved out of u-boot.inc and others
> >>> moved in.
> >>>
> >>> The recipe was tested on an mpc8315 Yocto configuration.
> >>>
> >>> Paul Gortmaker (3):
> >>>     u-boot: Don't make the -Os removal part of global settings.
> >>>     u-boot: make FILESDIR a shared setting.
> >>>     u-boot: Add recipe for u-boot v2011.12
> >>>
> >>>    meta/recipes-bsp/u-boot/u-boot.inc        |    4 +---
> >>>    meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    3 ++-
> >>>    meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    3 ++-
> >>>    meta/recipes-bsp/u-boot/u-boot_2011.12.bb |   20 +++++++++++++++++=
+++
> >>>    4 files changed, 25 insertions(+), 5 deletions(-)
> >>>    create mode 100644 meta/recipes-bsp/u-boot/u-boot_2011.12.bb
> >>>
> >>
> >> What about the u-boot-mkimage recipe, does that also need to be update=
d?
> >
> > It could be, but it strictly doesn't have to be.  I'd say that
> > mkimage is a tool akin to something like tar -- i.e. you can build
> > whatever version you want, but its functionality isn't going
> > to really change often from one release to the next.
> >
> > If you want it updated, I can send a follow on patch to do
> > that.  What do you guys usually do with the old recipes, leave
> > them laying around, or STONITH?
> >
> Adding openembedded-core since that is really where patches to meta=20
> should go.
>=20
> u-boot seems to be a special beast since we keep the older recipes=20
> around for u-boot itself, are they are compatibility issues with going=20
> to the latest u-boot-mkimage and older u-boot itself?
>=20
> Comments from the u-boot users?  Do we need to keep the older u-boot or=
=20
> u-boot-mkimage around, or should the move to BSP/layers that need the=20
> compatibility of the older version?

All machines from meta-smartphone which are using u-boot are using only
uboot.inc from oe-core, because each has own patchset derived from
specific upstream revision.

Not the best, but such machine specific u-boot_git.bb are quite small
and not so bad to maintain.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5xSkJheCpeK0RUEJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8oQXwACgkQN1Ujt2V2gBybzgCghJ8UUzFEHlvlXc1rum3MTubp
vIMAoKRAeD/MaBcR6SCljHWE8GFy46KY
=LMSc
-----END PGP SIGNATURE-----

--5xSkJheCpeK0RUEJ--
