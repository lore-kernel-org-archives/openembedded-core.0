Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TB6ZT-0003fb-BY
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:10:47 +0200
Received: by eekb57 with SMTP id b57so1186358eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 08:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JLJSeNLrSn2jwUAf+aAtucvdD1l7pvF9beoSiL7LEHg=;
	b=GbLbavluBPdz66956zmnVSJLsKXYAYfYHZhd1IfNeN6Zt2WkwYaLI/wyOKCWAULQh0
	YiyH2Nv4Lo7yEwCvHN6tF4UYVopCnTTqeCbz5HWhS+/4utz++CuYmw4IyIIc+gSgI0S5
	pw+6e4zj8yQZWobxbcUvDxHJ4ICY04NKNtcF6BBEqAViDGFbg0GH40jJ4Rhv3Tk+LSlK
	cH77E2LdlTNtom0Ys7cJ/BMSWDJwh/4rVXbwCPaZChi5qtN12UeaHitetiHjgTwbHXr9
	tpUJY0AhMoxyiGP8HSv2iCLtltwMPcq5DVbzsbDarmeIzBfIN9abwXH/cg76qPQlu7il
	q7eA==
Received: by 10.204.10.92 with SMTP id o28mr4077061bko.39.1347292697316;
	Mon, 10 Sep 2012 08:58:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm7640262bkv.11.2012.09.10.08.58.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 08:58:15 -0700 (PDT)
Date: Mon, 10 Sep 2012 17:58:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120910155814.GD3502@jama.jama.net>
References: <cover.1346970617.git.raj.khem@gmail.com>
	<504E0DA0.6000802@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <504E0DA0.6000802@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Upgrade qemu to 1.2 and eglibc with kconfig
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
X-List-Received-Date: Mon, 10 Sep 2012 16:10:47 -0000
X-Groupsio-MsgNum: 28962
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline

--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2012 at 08:56:16AM -0700, Saul Wold wrote:
> On 09/06/2012 03:32 PM, Khem Raj wrote:
> > This patchset updates qemu to 1.2 release
> > Adds kconfig to eglibc, kconfig is of interest for
> > eglibc upstream which is next step.
> > Removes nptl and enable-tls configure options from
> > x86 machine configurations
> >
> > The following changes since commit 610f8c0c0cab8e258919689fd641faec28b5=
8caf:
> >
> >    adt-installer: Allow changing YOCTOADT_REPO (2012-09-05 23:27:31 +01=
00)
> >
> > are available in the git repository at:
> >
> >    git://git.openembedded.org/openembedded-core-contrib kraj/qemu-eglib=
c-updates
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Dkraj/qemu-eglibc-updates
> >
> > Khem Raj (6):
> >    eglibc-2.16: Add kconfig infrastructure
> >    eglibc: Enable kconfig for option management
> >    kconfig-frontends: Create symlinks for conf and mconf
> >    qemu-git: Move to tip of git past 1.2 release
> >    qemu: Update from 0.15 to 1.2
> >    machines/x86: Drop redundant glibc configure knobs
> >
> >   meta/conf/machine/include/ia32-base.inc            |    5 -
> >   meta/conf/machine/qemux86-64.conf                  |    3 -
> >   meta/conf/machine/qemux86.conf                     |    4 -
> >   .../0001-eglibc-menuconfig-support.patch           | 1007 +++++++++++=
+++++++++
> >   ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
> >   ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
> >   meta/recipes-core/eglibc/eglibc-initial.inc        |    1 +
> >   meta/recipes-core/eglibc/eglibc-options.inc        |    4 +-
> >   meta/recipes-core/eglibc/eglibc.inc                |    4 +
> >   meta/recipes-core/eglibc/eglibc_2.16.bb            |    8 +-
> >   .../kconfig-frontends/kconfig-frontends_3.5.bb     |    8 +-
> >   .../qemu-0.15.1/0001-ppc64-Fix-linker-script.patch |   46 -
> >   .../a4d1f142542935b90d2eb30f3aead4edcf455fe6.patch |   66 --
> >   ...-Actually-raise-interrupt-on-timer-expiry.patch |   41 -
> >   .../qemu-0.15.1/ppc-s500-set-invalid-mask.patch    |  610 ------------
> >   .../qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/arm-bgr.patch |   12 +-
> >   .../enable-i386-linux-user.patch                   |    0
> >   .../fallback-to-safe-mmap_min_addr.patch           |    0
> >   .../fix-configure-checks.patch                     |   18 +-
> >   .../{qemu-0.15.1 =3D> qemu-1.2.0}/init-info.patch    |    0
> >   .../larger_default_ram_size.patch                  |    0
> >   .../{qemu-0.15.1 =3D> qemu-1.2.0}/linker-flags.patch |   14 +-
> >   .../{qemu-0.15.1 =3D> qemu-1.2.0}/no-strip.patch     |    0
> >   .../{qemu-0.15.1 =3D> qemu-1.2.0}/powerpc_rom.bin    |  Bin 4096 -> 4=
096 bytes
> >   .../qemu-vmware-vga-depth.patch                    |   70 +-
> >   .../recipes-devtools/qemu/qemu-git/powerpc_rom.bin |  Bin 0 -> 4096 b=
ytes
> >   .../qemu/{qemu_0.15.1.bb =3D> qemu_1.2.0.bb}         |   18 +-
> >   meta/recipes-devtools/qemu/qemu_git.bb             |   15 +-
> >   28 files changed, 1431 insertions(+), 868 deletions(-)
> >   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-m=
enuconfig-support.patch
> >   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-m=
enuconfig-hex-string-options.patch
> >   create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-m=
enuconfig-build-instructions.patch
> >   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/0001-ppc64-=
Fix-linker-script.patch
> >   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/a4d1f142542=
935b90d2eb30f3aead4edcf455fe6.patch
> >   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/hw-pl031-Ac=
tually-raise-interrupt-on-timer-expiry.patch
> >   delete mode 100644 meta/recipes-devtools/qemu/qemu-0.15.1/ppc-s500-se=
t-invalid-mask.patch
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/arm-b=
gr.patch (75%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/enabl=
e-i386-linux-user.patch (100%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/fallb=
ack-to-safe-mmap_min_addr.patch (100%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/fix-c=
onfigure-checks.patch (59%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/init-=
info.patch (100%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/large=
r_default_ram_size.patch (100%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/linke=
r-flags.patch (64%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/no-st=
rip.patch (100%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/power=
pc_rom.bin (100%)
> >   rename meta/recipes-devtools/qemu/{qemu-0.15.1 =3D> qemu-1.2.0}/qemu-=
vmware-vga-depth.patch (61%)
> >   create mode 100644 meta/recipes-devtools/qemu/qemu-git/powerpc_rom.bin
> >   rename meta/recipes-devtools/qemu/{qemu_0.15.1.bb =3D> qemu_1.2.0.bb}=
 (57%)
> >
>=20
> Merged to OE-Core (along with the runqemu fix)

Please merge
http://patchwork.openembedded.org/patch/36205/
to fix eglibc-initial build

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBODhYACgkQN1Ujt2V2gBz1qgCgugeF+8JpUzXUkjKsQmukSmmt
auwAnjXWuUXww10tdEOk7oApulVxw6vq
=dwAZ
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
