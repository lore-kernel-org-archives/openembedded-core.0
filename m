Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2915260097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 12:48:54 +0000 (UTC)
Received: from comp-006-thk.localnet (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 58B8543241F;
	Wed, 22 Oct 2014 14:48:52 +0200 (CEST)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Wed, 22 Oct 2014 14:48:51 +0200
Message-ID: <3835144.lX68KSfk9D@comp-006-thk>
User-Agent: KMail/4.14.2 (Linux/3.16.6-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1413981637.8474.30.camel@empanada.home.network>
References: <54454A41.7090900@balister.org> <2808693.YK3zlpjAPq@comp-006-thk>
	<1413981637.8474.30.camel@empanada.home.network>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wic debug suggestions
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
X-List-Received-Date: Wed, 22 Oct 2014 12:48:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday 22 of October 2014 07:40:37 Tom Zanussi wrote:
> On Wed, 2014-10-22 at 09:03 +0200, Maciej Borzecki wrote:
> > On Monday 20 of October 2014 13:45:37 Philip Balister wrote:
> > > I'm trying to make an sd card using the sdimage-bootpart.wks file=
. I've
> > > made an image and dd'ed it to a card. The card has a good vfat
> > > partition, but the ext4 partition won't mount. Looks like bad
> > > superblock. I can format the partition manually, so partitions se=
em OK
> > > and card works.
> > >=20
> > > Does anyone have any suggestions for debugging this?
> >=20
> > In default wks, the vfat partition is /boot, ext4 is /. If I unders=
tood
> > you
> > correctly / fails to mount, is that right?
> >=20
> > I've rebuilt an image with poky rev
> > 8ac8eca2e3bd8c78e2b31ea974930ed0243258a3. Loading via loopback and
> > mounting partition 2 (/ in this case) works fine.
> >=20
> > Can you post the output this command?
> >=20
> >   wic create -D -e core-image-minimal sdimage-bootpart
>=20
> It seems the problem is in handling a large file system.  A new bug h=
as
> been opened for this:
>=20
> Bug 6863 - Wic fails to create a working image for a large file syste=
m
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D6863
Do you need help?


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

