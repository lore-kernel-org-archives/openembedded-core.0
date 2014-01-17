Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2AFDA6AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 15:37:17 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id n15so1833887ead.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QwDv7yVnbwxT89COSCkCULniAU4zJjuVVhKmKp1rDfg=;
	b=koxWzjEiDZ4VWXiwJ5Y6Jge7Vgw49WnQ8Cl4TV5tKizvtO2qL8voXQGlh3VUP0u19w
	OpVvm8fc5kY8OgAbOs5HfnBMMRmPo6cVfo+P3XKfD3G8wGCsNe33iM4kScocpWzzd8Qx
	vGvhDWau3HXmTVCOXPsfMXKbtRPcxIrSllq1bfq4xpP7JX7Ktld1fwE8EsK24wHjUOO7
	LSIgr/5/7scPhUTRC5ZjIFV9bXfEOy9M5d9695CpmoE7IBm/K7tpYCfUlgKpM7lRBnLK
	6OafPlY2PPB7ZzkajMJEjD0bWttKT7ELBdfj48dd7sCj/Prs+1GWXY/URHo8BrTMyU8N
	B45A==
X-Received: by 10.15.50.129 with SMTP id l1mr2839135eew.114.1389973037542;
	Fri, 17 Jan 2014 07:37:17 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm27797877eew.18.2014.01.17.07.37.16 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 07:37:16 -0800 (PST)
Date: Fri, 17 Jan 2014 16:37:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140117153740.GN3742@jama>
References: <cover.1388992959.git.Qi.Chen@windriver.com>
	<0522b744ff3e02f6ef1f794294f759ec1f176923.1388992959.git.Qi.Chen@windriver.com>
	<66190526.u9bvojJavk@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <66190526.u9bvojJavk@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 17 Jan 2014 15:37:17 -0000
X-Groupsio-MsgNum: 49138
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UFMLoheMaWcIEZAi"
Content-Disposition: inline

--UFMLoheMaWcIEZAi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 02:11:39PM +0000, Paul Eggleton wrote:
> Hi Qi,
>=20
> On Monday 06 January 2014 15:27:35 Chen Qi wrote:
> > Now that the initscripts-functions has been packaged separately,
> > packages which may use the functions script should have a runtime
> > dependency on it.
> >=20
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  meta/recipes-bsp/alsa-state/alsa-state.bb          |    2 +-
> >  meta/recipes-bsp/apmd/apmd_3.2.2-14.bb             |    1 +
> >  .../irda-utils/irda-utils_0.9.18.bb                |    2 ++
> >  .../nfs-utils/nfs-utils_1.2.9.bb                   |    4 ++--
> >  meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
> >  meta/recipes-connectivity/ppp/ppp_2.4.5.bb         |    1 +
> >  meta/recipes-core/dbus/dbus.inc                    |    2 +-
> >  meta/recipes-core/systemd/systemd_208.bb           |    2 +-
> >  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
> >  meta/recipes-devtools/distcc/distcc_3.1.bb         |    1 +
> >  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +-
> >  meta/recipes-extended/at/at_3.1.14.bb              |    3 +--
> >  meta/recipes-extended/cronie/cronie_1.4.11.bb      |    2 ++
> >  meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb     |    2 ++
> >  meta/recipes-extended/sysklogd/sysklogd.inc        |    2 ++
> >  meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    1 +
> >  .../oprofile/oprofileui-server_git.bb              |    2 +-
> >  17 files changed, 22 insertions(+), 11 deletions(-)
>=20
> Sorry to come back on this patchset again, but could we not detect=20
> installation of an initscript requiring these functions in update-rc.d.bb=
class=20
> and just add the RDEPENDS automatically? Otherwise it's just another thin=
g=20
> people can get wrong when writing a recipe, not to mention all of the exi=
sting=20
> recipes outside OE-Core that install initscripts.

Agreed, my current list of components where I've reverted this (to get
my images building again) is:

dbus, systemd, apmd, rpcbind, nfs-utils, alsa-state, openssh, ppp,
cronie, irda-utils

To be fair, it's possible that some of these need it and I just don't
use their script in runtime (e.g. irda-utils is included only in image
on "spitz" MACHINE and I've never used irda here - it's pulled through
some packagegroup because MACHINE_FEATURES have irda)

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UFMLoheMaWcIEZAi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLZTkQACgkQN1Ujt2V2gBwybgCgqtQMIFvEEVDmWnU24nji9LLZ
9JEAnA0vckR8iwpCT8hGVX9lN8C1AQOk
=PwfK
-----END PGP SIGNATURE-----

--UFMLoheMaWcIEZAi--
