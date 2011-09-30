Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9iBQ-0001Em-79
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 20:51:40 +0200
Received: by fxi1 with SMTP id 1so3409740fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 11:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xh8xm9aXGZFg0cDW9E8ubMb+o6E598uYVigkQH/QBMY=;
	b=GxIvSRWe88nkofilCm4uvOJ11nQJtVK7SO63yRhq1kuR78WE+kAgv95gJFNOSS/iOV
	PEiuNtvXylapxkG+WW3s+NdFTnzU/oo9pSB+BpeaRdbn2O2IDAzO7hnytdoGHOo6eTRc
	8kyMU2aOe7ajBQ0CFCiVYNnM6/LtcwiuR4OfU=
Received: by 10.223.97.220 with SMTP id m28mr18974741fan.20.1317408371355;
	Fri, 30 Sep 2011 11:46:11 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w6sm7845584fah.0.2011.09.30.11.46.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 11:46:10 -0700 (PDT)
Date: Fri, 30 Sep 2011 20:46:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110930184603.GI7364@jama.jama.net>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
	<9DA5872FEF993D41B7173F58FCF6BE94E0905BBC@orsmsx504.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E0905BBC@orsmsx504.amr.corp.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Fri, 30 Sep 2011 18:51:40 -0000
X-Groupsio-MsgNum: 10351
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Content-Disposition: inline

--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 11:40:47AM -0700, Kamble, Nitin A wrote:
>=20
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: Friday, September 30, 2011 11:38 AM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 4/4] python, python-native: upgrade from
> > 2.6.6 to 2.7.2
> >=20
> > On Thu, Sep 29, 2011 at 06:27:11PM -0700, nitin.a.kamble@intel.com
> > wrote:
> > > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> > >
> > > rename from meta/recipes-devtools/python/python-2.6-manifest.inc
> > > rename to meta/recipes-devtools/python/python-2.7-manifest.inc
> >=20
> > this is wrong.. just to rename it isn't enough
> >=20
> > I will send patch which regenerates manifest with right paths to
> > actually package something..
> >=20
> > Regards,
>=20
> Hi Martin,
>   Thanks for catching this. I did not see issue with old manifest. But ge=
tting new manifest would be better.

Maybe you had python2.6 packages still arround, but for me the issue
looked like this (because almost all python-* packages were skipped as
empty)=20
-FILES_${PN}-foo=3D"${libdir}/python2.6/foo"
+FILES_${PN}-foo=3D"${libdir}/python2.7/foo"


| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-shr-minimal-fso:
|  *    python-textutils *      python-multiprocessing *
python-shell *  python-syslog *         python-threading *
python-xml *    python-io *  python-logging *         python-stringold *
python-ctypes *         python-difflib *        python-datetime *
python-logging *        python-textutils *    python-sqlite3 *
python-subprocess *     python-io *     python-fcntl *  python-stringold
*      python-pprint *         python-shell *  python-datetime *
*      python-codecs *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-fso.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-shr-minimal-gtk:
|  *    libpoppler5 (>=3D 0.12.3) *       libpoppler5 (>=3D 0.12.3) *
libpoppler5 (>=3D 0.12.3) *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-gtk.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-shr-minimal-apps:
|  *    python-resource *       python-io *     python-terminal *
python-fcntl *  python-shell *  python-lang *   python-lang *
python-lang *   python-lang *         python-codecs *
python-lang *   libpoppler5 (>=3D 0.12.3) *
|  * opkg_install_cmd: Cannot install package task-shr-minimal-apps.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-shr-cli:
|  *    python-compression *    python-netclient *      python-textutils
*      python-image *  python-mime *   python-json *   python-html *
*      python-sqlite3 *      python-netclient *      python-sqlite3 *
*      python-netclient *
|  * opkg_install_cmd: Cannot install package task-shr-cli.
| ERROR: Function 'do_rootfs' failed (see
/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/shr-image-2.0-r18/temp/log.=
do_rootfs.13435
for further information)
NOTE: package shr-image-2.0-r18: task do_rootfs: Failed
ERROR: Task 8
(/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-image.bb,
do_rootfs) failed with exit code '1'
ERROR:
'/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/images/shr-image.bb'
failed

> Thanks,
> Nitin
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6GDmsACgkQN1Ujt2V2gBzCrACeO1jfIgF6iqul4jQuMWyKgy2L
SMkAoI04WxhbHySjiQp2KAax2efr9yYA
=N2gu
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--
