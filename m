Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SCUmt-0003u3-3c; Tue, 27 Mar 2012 13:42:07 +0200
Received: by wibhm17 with SMTP id hm17so4507772wib.0
	for <multiple recipients>; Tue, 27 Mar 2012 04:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sPm/43MdLXeJGhmwTxjazgfDmO2ZfBwKAGBQppAw8G0=;
	b=jB04vgDxIVMECmTzYt356zmLuc0IDMO+cSTGDCW4J5mYodLiJcXBn3Yjtxe8olfEih
	OaZBgccYpFvV0H6N92MK4zbJYDAvdnSmnfRNDtkl/tg6kz4RE8pGn+Z4B1vqJuWuU4d0
	3fuag6SnxlJ3RW0J8r1mj8l+Oq2A8V1Fgua39vc4UXx7uBr0ee6euQeTQtoysxbVN5F7
	/v+UEV2LYWePFMRkeDa4OrFi0V1BQxprBNfhrgV4xY4rcQldTVgrebkTdj7KWiG8VH+T
	blvgxJKEDOVh1HwVve6OAE4a3ZW13mag8F2AlF4z13Gm6iq8JEvT2bUncDADKYTaFqOA
	QKjQ==
Received: by 10.216.203.146 with SMTP id f18mr14578173weo.21.1332847986345;
	Tue, 27 Mar 2012 04:33:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm48765888wie.9.2012.03.27.04.33.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Mar 2012 04:33:05 -0700 (PDT)
Date: Tue, 27 Mar 2012 13:33:04 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120327113304.GB3969@jama.jama.net>
References: <20120224000137.466F310330@opal>
	<20120327110632.GA3969@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120327110632.GA3969@jama.jama.net>
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
X-List-Received-Date: Tue, 27 Mar 2012 11:42:07 -0000
X-Groupsio-MsgNum: 19810
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 01:06:33PM +0200, Martin Jansa wrote:
> On Fri, Feb 24, 2012 at 12:01:37AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 7c99ef6d2173b14e1109a540ee5ae47b56d707e7
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D7c99ef6d2173b14e1109a540ee5ae47b56d707e7
> >=20
> > Author: Robert Yang <liezhi.yang@windriver.com>
> > Date:   Wed Feb 22 20:38:30 2012 +0800
> >=20
> > A script to clean obsolete sstate cache files
> >=20
>=20
> > +# Use the "_" to substitute "-", e.g., x86-64 to x86_64
> > +all_archs=3D`grep -r DEFAULTTUNE $tunedir | \
> > +    sed -e 's/.*\"\(.*\)\"/\1/' -e 's/-/_/g' | sort -u`
> > +# Add the qemu archs
> > +all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc"
>=20
> This doesn't list any thumb variants, current list is:
>=20
> arm1136jfs arm920t arm926ejs arm9tdmi armv4 armv5 armv6 armv7 armv7a
> core2 cortexa8_neon cortexa9_neon cortexm1 cortexm3 cortexr4 ep9312 i586
> iwmmxt mips mips32 powerpc powerpc64 ppc603e ppce300c2 ppce500 ppce500mc
> ppce500v2 ppce5500 strongarm x86 x86_64 xscale
>=20
> so thumb versions (e.g. armv4t) are not found in
>=20
> > +for arch in $all_archs; do
> > +    ls | grep -q -w $arch
> > +    [ $? -eq 0 ] && ava_archs=3D"$ava_archs $arch"
> > +done
>=20
> Cheers,

And after extending list of machines in all_archs with armv4t and my
machines I got only one file in sstate-cache left :/

First run without armv4t found:
OE crespo@shr ~/shr-core $ du -hs sstate-cache/; openembedded-core/scripts/=
sstate-cache-management.sh --cache-dir=3Dsstate-cache --remove-duplicated; =
du -hs sstate-cache/
14G     sstate-cache/
Figuring out the archs in the sstate cache dir ...
The following archs have been found in the sstate cache dir:
armv7a x86_64
Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
Removing the sstate-xxx_deploy-ipk.tgz ... (58 files)
Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
Removing the sstate-xxx_deploy.tgz ... (0 files)
Removing the sstate-xxx_package.tgz ... (62 files)
Removing the sstate-xxx_populate-lic.tgz ... (46 files)
Removing the sstate-xxx_populate-sysroot.tgz ... (102 files)
268 files have been removed
13G     sstate-cache/

Second run with armv4t manually added
-all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc"
+all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc armv4t"
OE crespo@shr ~/openembedded-core $ du -hs ../shr-core/sstate-cache/; scrip=
ts/sstate-cache-management.sh --cache-dir=3D../shr-core/sstate-cache --remo=
ve-duplicated; du -hs ../shr-core/sstate-cache/
13G     ../shr-core/sstate-cache/
/OE/openembedded-core/meta/conf/machine/include
Figuring out the archs in the sstate cache dir ...
The following archs have been found in the sstate cache dir:
armv4t armv7a x86_64
Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
Removing the sstate-xxx_deploy-ipk.tgz ... (460 files)
Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
Removing the sstate-xxx_deploy.tgz ... (0 files)
Removing the sstate-xxx_package.tgz ... (454 files)
Removing the sstate-xxx_populate-lic.tgz ... (456 files)
Removing the sstate-xxx_populate-sysroot.tgz ... (468 files)
1838 files have been removed
6.2G    ../shr-core/sstate-cache/

Third run with machines I'm building manually added
-all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc armv4t"
+all_archs=3D"$all_archs qemuarm qemux86 qemumips qemuppc armv4t om_gta01 o=
m_gta02 om_gta04 nokia900 palmpre palmpre2 crespo spitz"
OE crespo@shr ~/openembedded-core $ du -hs ../shr-core/sstate-cache/; scrip=
ts/sstate-cache-management.sh --cache-dir=3D../shr-core/sstate-cache --remo=
ve-duplicated; du -hs ../shr-core/sstate-cache/
6.2G    ../shr-core/sstate-cache/
/OE/openembedded-core/meta/conf/machine/include
Figuring out the archs in the sstate cache dir ...
The following archs have been found in the sstate cache dir:
armv4t armv7a x86_64 nokia900 palmpre palmpre2 crespo
Removing the sstate-xxx_deploy-rpm.tgz ... (0 files)
Removing the sstate-xxx_deploy-ipk.tgz ... (7024 files)
Removing the sstate-xxx_deploy-deb.tgz ... (0 files)
Removing the sstate-xxx_deploy.tgz ... (0 files)
Removing the sstate-xxx_package.tgz ... (0 files)
Removing the sstate-xxx_populate-lic.tgz ... (0 files)
Removing the sstate-xxx_populate-sysroot.tgz ... (0 files)
7024 files have been removed
3.1M    ../shr-core/sstate-cache/

OE crespo@shr ~/openembedded-core $ ls ../shr-core/sstate-cache/
sstate-shr-version-crespo-oe-linux-gnueabi-1.020120327-r0-crespo-2-fcb5bb2c=
0ac03d75285d77e7c30af869_populate-sysroot.tgz

Original count of sstate packages was something like:
Sum                     3043
all-oe-linux            661
    gnueabi              94
nativesdk               953 (i686 + x86_64)
  x86_64-nativesdk      480
    gnueabi              37
  i686-nativesdk        473
    gnueabi              36
x86_64-linux            309
nokia900                229
    gnueabi             222
crespo                  215
    gnueabi             211
palmpre                 475 (palmpre + palmpre2)
  palmpre               244
    gnueabi             236
  palmpre2              231
    gnueabi             223
om_gta04                201
    gnueabi             193

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9xpXAACgkQN1Ujt2V2gBwf5wCeOBk6BufZuOV9uWCJt0lJ+EV7
B1oAn3HTP0PSO4jHW6rjGFA4SqWbgT7c
=rt2q
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
