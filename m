Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 25CBD6A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:04:39 +0000 (UTC)
Received: from comp-006-thk.localnet (unknown [78.8.239.243])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 41C673FD206;
	Tue, 23 Sep 2014 21:04:39 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 23 Sep 2014 21:04:37 +0200
Message-ID: <4258812.nj1qq677CN@comp-006-thk>
User-Agent: KMail/4.13.3 (Linux/3.16.2-201.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <20140923183113.GC2480@denix.org>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1411385721-22264-10-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140923183113.GC2480@denix.org>
MIME-Version: 1.0
Cc: Denys Dmytriyenko <denys@ti.com>, Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 9/9] beaglebone.conf: add IMAGE_BOOT_FILES
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
X-List-Received-Date: Tue, 23 Sep 2014 19:04:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday 23 of September 2014 14:31:13 Denys Dmytriyenko wrote:
> On Mon, Sep 22, 2014 at 01:35:21PM +0200, Maciej Borzecki wrote:
> > Set IMAGE_BOOT_FILES to list of files that end up in boot
> > partition. This in turn is used by wic to generate a bootable SD ca=
rd
> > image.
> >=20
> > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
>=20
> Acked-by: Denys Dmytriyenko <denys@ti.com>
>=20
> But meta-yocto-bsp is not part of openembedded-core...

Right, thanks for pointing that out. I did not want to cross post and s=
ome of=20
the patches depend on one another. Is yocto-bsp more applicable for thi=
s one=20
or just yocto ML?


>=20
> > ---
> >=20
> >  meta-yocto-bsp/conf/machine/beaglebone.conf | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/meta-yocto-bsp/conf/machine/beaglebone.conf
> > b/meta-yocto-bsp/conf/machine/beaglebone.conf index 4263715..a31620=
7
> > 100644
> > --- a/meta-yocto-bsp/conf/machine/beaglebone.conf
> > +++ b/meta-yocto-bsp/conf/machine/beaglebone.conf
> > @@ -35,3 +35,5 @@ UBOOT_ENTRYPOINT =3D "0x80008000"
> >=20
> >  UBOOT_LOADADDRESS =3D "0x80008000"
> > =20
> >  MACHINE_FEATURES =3D "usbgadget usbhost vfat alsa"
> >=20
> > +
> > +IMAGE_BOOT_FILES ?=3D "u-boot.${UBOOT_SUFFIX} MLO"

--=20

Maciej Borz=C4=99cki=20
Senior Software Engineer Open-RnD Sp. z o.o.=20
www.open-rnd.pl, Facebook, Twitter=20
mobile: +48 telefon, fax: +48 42 657 9079=20

Niniejsza wiadomo=C5=9B=C4=87 wraz z za=C5=82=C4=85cznikami mo=C5=BCe z=
awiera=C4=87 chronione prawem lub=20
poufne informacje i zosta=C5=82a wys=C5=82ana wy=C5=82=C4=85cznie do wi=
adomo=C5=9Bci i u=C5=BCytku os=C3=B3b, do=20
kt=C3=B3rych zosta=C5=82a zaadresowana. Je=C5=9Bli wiadomo=C5=9B=C4=87 =
zosta=C5=82a otrzymana przypadkowo=20
zabrania si=C4=99 jej kopiowania lub rozsy=C5=82ania do os=C3=B3b trzec=
ich. W takim przypadku=20
uprasza si=C4=99 o natychmiastowe zniszczenie wiadomo=C5=9Bci oraz poin=
formowanie=20
nadawcy o zaistnia=C5=82ej sytuacji za pomoc=C4=85 wiadomo=C5=9Bci zwro=
tnej. Dzi=C4=99kujemy.=20

This message, including any attachments hereto, may contain privileged =
or=20
confidential information and is sent solely for the attention and use o=
f the=20
intended addressee(s). If you are not an intended addressee, you may ne=
ither=20
use this message nor copy or deliver it to anyone. In such case, you sh=
ould=20
immediately destroy this message and kindly notify the sender by reply =
email.=20
Thank you. 

