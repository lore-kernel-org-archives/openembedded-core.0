Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SCWh5-0004zu-GT; Tue, 27 Mar 2012 15:44:15 +0200
Received: by wgbds1 with SMTP id ds1so3290229wgb.0
	for <multiple recipients>; Tue, 27 Mar 2012 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=vwRB9zLGOu2HwVUdnqVd5AUFmjxp09XsOCy0t34MokI=;
	b=ZVDRastGK8CQgxJT0/Cxp1fRWYVJZ3od+VoRJL4W9VsD2N1yOYSN3px2TalA83ghph
	bxcrx42tkXiHh6FA2y3nyn7IaTMBVSKNJOlYCNTtyVyWe8bQMk0dV1U/lhXZ3l+fL5MY
	7XwbB5BWe1XGWL/xId67jtt8KaurLGrpHVbV0sBCoPGwxzyVElsRVaiUoEfx21QQPZZP
	tRKYsHDytKIV80cgvbTgV3f25I+QmVInH7DQafVApeYL43XcDIFlh+6NiRA5mKVZs0kx
	fxEOqs3fwNf1l1eJluzahgkifOKM1Bt/a1IePcXnR9j5zRm8LSu7PSSrIHM8d+Ado1ca
	Lc1A==
Received: by 10.180.91.10 with SMTP id ca10mr27677618wib.17.1332855314674;
	Tue, 27 Mar 2012 06:35:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm49511064wia.11.2012.03.27.06.35.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 06:35:13 -0700 (PDT)
Date: Tue, 27 Mar 2012 15:35:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120327133512.GC3969@jama.jama.net>
References: <20120224000137.466F310330@opal>
	<20120327110632.GA3969@jama.jama.net>
	<20120327113304.GB3969@jama.jama.net>
	<4F71C069.30205@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4F71C069.30205@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Robert Yang : A script to clean obsolete sstate cache files
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
X-List-Received-Date: Tue, 27 Mar 2012 13:44:15 -0000
X-Groupsio-MsgNum: 19822
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDt/GgjP6HVcx58l"
Content-Disposition: inline

--KDt/GgjP6HVcx58l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 09:28:09PM +0800, Robert Yang wrote:
>=20
> Hi Martin,
>=20
> Thanks for reporting this, and I'm very sorry for the inconvenience,
> please see my comment inline ...
>=20
> On 03/27/2012 07:33 PM, Martin Jansa wrote:
> > On Tue, Mar 27, 2012 at 01:06:33PM +0200, Martin Jansa wrote:
> >> On Fri, Feb 24, 2012 at 12:01:37AM +0000, git@git.openembedded.org wro=
te:
> >>> Module: openembedded-core.git
> >>> Branch: master
> >>> Commit: 7c99ef6d2173b14e1109a540ee5ae47b56d707e7
> >>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D7c99ef6d2173b14e1109a540ee5ae47b56d707e7
> >>>
> >>> Author: Robert Yang<liezhi.yang@windriver.com>
> >>> Date:   Wed Feb 22 20:38:30 2012 +0800
> >>>
> >>> A script to clean obsolete sstate cache files
> >>>
> >>
> >>> +# Use the "_" to substitute "-", e.g., x86-64 to x86_64
> >>> +all_archs=3D`grep -r DEFAULTTUNE $tunedir | \
> >>> +    sed -e 's/.*\"\(.*\)\"/\1/' -e 's/-/_/g' | sort -u`
> >>> +# Add the qemu archs
> >>> +all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc"
> >>
> >> This doesn't list any thumb variants, current list is:
> >>
> >> arm1136jfs arm920t arm926ejs arm9tdmi armv4 armv5 armv6 armv7 armv7a
> >> core2 cortexa8_neon cortexa9_neon cortexm1 cortexm3 cortexr4 ep9312 i5=
86
> >> iwmmxt mips mips32 powerpc powerpc64 ppc603e ppce300c2 ppce500 ppce500=
mc
> >> ppce500v2 ppce5500 strongarm x86 x86_64 xscale
> >>
> >> so thumb versions (e.g. armv4t) are not found in
> >>
> >>> +for arch in $all_archs; do
> >>> +    ls | grep -q -w $arch
> >>> +    [ $? -eq 0 ]&&  ava_archs=3D"$ava_archs $arch"
> >>> +done
> >>
> >> Cheers,
> >
> > And after extending list of machines in all_archs with armv4t and my
> > machines I got only one file in sstate-cache left :/
> >
> > First run without armv4t found:
> > OE crespo@shr ~/shr-core $ du -hs sstate-cache/; openembedded-core/scri=
pts/sstate-cache-management.sh --cache-dir=3Dsstate-cache --remove-duplicat=
ed; du -hs sstate-cache/
> > 14G     sstate-cache/
> > Figuring out the archs in the sstate cache dir ...
> > The following archs have been found in the sstate cache dir:
> > armv7a x86_64
> > Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
> > Removing the sstate-xxx_deploy-ipk.tgz ... (58 files)
> > Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
> > Removing the sstate-xxx_deploy.tgz ... (0 files)
> > Removing the sstate-xxx_package.tgz ... (62 files)
> > Removing the sstate-xxx_populate-lic.tgz ... (46 files)
> > Removing the sstate-xxx_populate-sysroot.tgz ... (102 files)
> > 268 files have been removed
> > 13G     sstate-cache/
> >
> > Second run with armv4t manually added
> > -all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc"
> > +all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc armv4t"
> > OE crespo@shr ~/openembedded-core $ du -hs ../shr-core/sstate-cache/; s=
cripts/sstate-cache-management.sh --cache-dir=3D../shr-core/sstate-cache --=
remove-duplicated; du -hs ../shr-core/sstate-cache/
> > 13G     ../shr-core/sstate-cache/
> > /OE/openembedded-core/meta/conf/machine/include
> > Figuring out the archs in the sstate cache dir ...
> > The following archs have been found in the sstate cache dir:
> > armv4t armv7a x86_64
> > Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
> > Removing the sstate-xxx_deploy-ipk.tgz ... (460 files)
> > Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
> > Removing the sstate-xxx_deploy.tgz ... (0 files)
> > Removing the sstate-xxx_package.tgz ... (454 files)
> > Removing the sstate-xxx_populate-lic.tgz ... (456 files)
> > Removing the sstate-xxx_populate-sysroot.tgz ... (468 files)
> > 1838 files have been removed
> > 6.2G    ../shr-core/sstate-cache/
> >
> > Third run with machines I'm building manually added
> > -all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc armv4t"
> > +all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc armv4t om_gta=
01 om_gta02 om_gta04 nokia900 palmpre palmpre2 crespo spitz"
>=20
> The script figures the archs according to the 'meta/conf/machine/include',
> this is incorrect since it only searches the oe-core layer, I will fix it.

The first issue is that armv4t and other thumb variants are also in
oe-core layer.

> And where can I get the "om_gta01 om_gta02 om_gta04 ..." archs? I mean wh=
ich
> layer are they in? So that I can test them.

Those are machines from meta-smartphone sublayers
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dsummary

Maybe add some param to add extra archs/machines or just list all used=20
xxx variants from 'sstate-xxx_'.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KDt/GgjP6HVcx58l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9xwhAACgkQN1Ujt2V2gByk/QCfTPTcdFFnMAkzG/9Rr0uUTcKY
U8oAnRsq1eJwojdg/r73fc2NnAcRPaeo
=lFWF
-----END PGP SIGNATURE-----

--KDt/GgjP6HVcx58l--
