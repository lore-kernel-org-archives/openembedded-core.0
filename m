Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 789F06CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 10:18:20 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id h10so2958021eak.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 02:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GDK5vSkjlf1Nx5jorKGgtkEcRxMDkUqghKRKqX5v8Fo=;
	b=VL7GXKyHWl+TgyqKnG2LLt1FKMeh5mUCtTHZqcuiMfFRxTuBcyIhIteUupuBgbu0+9
	aPyp0uQmOjIKuiqRm1Jl+ExKQmoLuCmeLi0ARnLf54g+ZrrMCZo29wYydwNC1Tfqetz2
	c7YAS1ScL1JKHc3VOE3Y8av4+IoD6hOViYKjBSqY5G6yh9Jf/ETunuGB62t+Ks9/9wjH
	Yx009e2a5zg2qsC37vzsqxTlYNFwAXQ9n00pYD7981gt39Vt4syrYFENG36LqKvP7ui+
	fZHJD4MYJQ1UkqTj8M0VDkObJRfHlFDmrj10JOvxXLpzMf/gzyWnbeoby/P/hvSEbNNp
	h6WQ==
X-Received: by 10.14.37.131 with SMTP id y3mr16798278eea.1.1390213100770;
	Mon, 20 Jan 2014 02:18:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o13sm1722884eex.19.2014.01.20.02.18.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 02:18:19 -0800 (PST)
Date: Mon, 20 Jan 2014 11:18:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Message-ID: <20140120101820.GF5565@jama>
References: <cover.1388992959.git.Qi.Chen@windriver.com>
	<0522b744ff3e02f6ef1f794294f759ec1f176923.1388992959.git.Qi.Chen@windriver.com>
	<66190526.u9bvojJavk@peggleto-mobl5.ger.corp.intel.com>
	<20140117153740.GN3742@jama> <52DC86CD.3040302@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52DC86CD.3040302@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 2/2] Add missing RDEPENDS of initscripts-functions
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
X-List-Received-Date: Mon, 20 Jan 2014 10:18:21 -0000
X-Groupsio-MsgNum: 49207
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Content-Disposition: inline

--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2014 at 10:15:41AM +0800, ChenQi wrote:
> On 01/17/2014 11:37 PM, Martin Jansa wrote:
> > On Fri, Jan 17, 2014 at 02:11:39PM +0000, Paul Eggleton wrote:
> >> Hi Qi,
> >>
> >> On Monday 06 January 2014 15:27:35 Chen Qi wrote:
> >>> Now that the initscripts-functions has been packaged separately,
> >>> packages which may use the functions script should have a runtime
> >>> dependency on it.
> >>>
> >>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >>> ---
> >>>   meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
> >>>   meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    1 +
> >>>   .../irda-utils/irda-utils_0.9.18.bb                |    2 ++
> >>>   .../nfs-utils/nfs-utils_1.2.9.bb                   |    4 ++--
> >>>   meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
> >>>   meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    1 +
> >>>   meta/recipes-core/dbus/dbus.inc                    |    2 +-
> >>>   meta/recipes-core/systemd/systemd_208.bb           |    2 +-
> >>>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
> >>>   meta/recipes-devtools/distcc/distcc_3.1.bb         |    1 +
> >>>   meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
> >>>   meta/recipes-extended/at/at_3.1.14.bb              |    3 +--
> >>>   meta/recipes-extended/cronie/cronie_1.4.11.bb      |    2 ++
> >>>   meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    2 ++
> >>>   meta/recipes-extended/sysklogd/sysklogd.inc        |    2 ++
> >>>   meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 +
> >>>   .../oprofile/oprofileui-server_git.bb              |    2 +-
> >>>   17 files changed, 22 insertions(+), 11 deletions(-)
> >> Sorry to come back on this patchset again, but could we not detect
> >> installation of an initscript requiring these functions in update-rc.d=
=2Ebbclass
> >> and just add the RDEPENDS automatically? Otherwise it's just another t=
hing
> >> people can get wrong when writing a recipe, not to mention all of the =
existing
> >> recipes outside OE-Core that install initscripts.
> > Agreed, my current list of components where I've reverted this (to get
> > my images building again) is:
> >
> > dbus, systemd, apmd, rpcbind, nfs-utils, alsa-state, openssh, ppp,
> > cronie, irda-utils
>=20
> Hi Martin,
>=20
> Could you please give me some more information why to revert this?
> I really don't want to mess things up. So I really wish I could be aware=
=20
> of some potential problems before I start working on this.

I'm using systemd only, so on my image there aren't sysvinit scripts
installed and to make sure that everything stays that way I've
blacklisted initscripts recipe in distro configuration.

http://lists.openembedded.org/pipermail/openembedded-core/2014-January/0881=
16.html

So including it only when update-rc.d is enabled and the sysvinit script
isn't masked by systemd service or disabled by
openembedded-core/meta/recipes-core/systemd/systemd-compat-units.bb
looks like good compromise.

Changing it to RRECOMMENDS isn't really
correct (because it's either mandatory required or not at all), but it
would also make "disabling" it a bit easier.

Regards,

>=20
> Best Regards,
> Chen Qi
>=20
> > To be fair, it's possible that some of these need it and I just don't
> > use their script in runtime (e.g. irda-utils is included only in image
> > on "spitz" MACHINE and I've never used irda here - it's pulled through
> > some packagegroup because MACHINE_FEATURES have irda)
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLc9+wACgkQN1Ujt2V2gBywPwCaA/GDxPu+2GsxB2PCmOMLkGAY
TtQAn3XIX4O2BT8MVvLM+xfH8d1xVIT4
=yv96
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
