Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2488071969
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 09:27:39 +0000 (UTC)
Received: from comp-006-thk.localnet (unknown [46.170.72.194])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 0B2122D691B;
	Thu, 30 Oct 2014 10:27:37 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Date: Thu, 30 Oct 2014 10:27:36 +0100
Message-ID: <2237562.UqLqqrAogo@comp-006-thk>
User-Agent: KMail/4.14.2 (Linux/3.16.6-203.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <cover.1414618765.git.tom.zanussi@linux.intel.com>
References: <cover.1414618765.git.tom.zanussi@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] some wic bugfixes
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
X-List-Received-Date: Thu, 30 Oct 2014 09:27:48 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday 29 of October 2014 17:04:20 Tom Zanussi wrote:
> This patchset fixes a couple serious wic bugs:
>=20
> [YOCTO #6863] - Wic fails to create a working image for a large file =
system
> [YOCTO #6290] - Update WIC for gummiboot
>=20
> I generated core-image-sdk images for each of the wic image types and=

> was able to fsck/mount the resulting filesystems.
>=20
> These should be applied to the next dizzy point release.
>=20
> The following changes since commit cf82c6756bad8f7a5edc92ce513e02816b=
88efb3:
>=20
>   bitbake: prserv: don't wait until exit to sync (2014-10-28 15:00:39=
 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-bugfixes-v=
1
>   http://git.yoctoproject.org/cgit.cgi//log/?h=3Dtzanussi/wic-bugfixe=
s-v1
>=20
> Tom Zanussi (6):
>   wic: Don't allow mkfs to fail silently in partition command
>   wic: Use overhead factor when creating partitions from rootfs
>     directories
>   wic: Update the help text to include -D (--debug)
>   Revert "wic: set bootimg_dir when using image-name artifacts"
>   wic: Remove special-case bootimg_dir
>   wic: Update bootimg-partition to use bootimg_dir
>=20
>  scripts/lib/image/engine.py                        | 42
> +++++----------------- scripts/lib/image/help.py                     =
     |
> 23 ++++++++---- scripts/lib/wic/imager/direct.py                   | =
 5 +--
>  .../lib/wic/kickstart/custom_commands/partition.py | 24 +++++++++---=
-
>  scripts/lib/wic/plugins/imager/direct_plugin.py    | 20 +++++------
>  scripts/lib/wic/plugins/source/bootimg-efi.py      |  5 ++-
>  .../lib/wic/plugins/source/bootimg-partition.py    |  9 +++--
>  scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +-
>  scripts/lib/wic/utils/oe/misc.py                   |  1 +
>  scripts/wic                                        | 13 +++----
>  10 files changed, 68 insertions(+), 77 deletions(-)

For the whole series

Acked-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>

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

