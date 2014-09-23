Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD3F71551
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:15:35 +0000 (UTC)
Received: from comp-006-thk.localnet (unknown [78.8.239.243])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id EC5B43FD3B1;
	Tue, 23 Sep 2014 21:15:35 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 21:15:35 +0200
Message-ID: <2738412.mu1sQAsdJT@comp-006-thk>
User-Agent: KMail/4.13.3 (Linux/3.16.2-201.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1411499359.15825.59.camel@ted>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<4258812.nj1qq677CN@comp-006-thk> <1411499359.15825.59.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 23 Sep 2014 19:15:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday 23 of September 2014 20:09:19 Richard Purdie wrote:
> On Tue, 2014-09-23 at 21:04 +0200, Maciej Borzecki wrote:
> > On Tuesday 23 of September 2014 14:31:13 Denys Dmytriyenko wrote:
> > > On Mon, Sep 22, 2014 at 01:35:21PM +0200, Maciej Borzecki wrote:
> > > > Set IMAGE_BOOT_FILES to list of files that end up in boot
> > > > partition. This in turn is used by wic to generate a bootable S=
D card
> > > > image.
> > > >=20
> > > > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > > > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > >=20
> > > Acked-by: Denys Dmytriyenko <denys@ti.com>
> > >=20
> > > But meta-yocto-bsp is not part of openembedded-core...
> >=20
> > Right, thanks for pointing that out. I did not want to cross post a=
nd some
> > of the patches depend on one another. Is yocto-bsp more applicable =
for
> > this one or just yocto ML?
>=20
> It should be the poky list but in this case I'll take care of it (I j=
ust
> put it into master-next of meta-yocto).

Great, thanks.

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

