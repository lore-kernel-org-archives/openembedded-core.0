Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B26857D1A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 00:08:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2T081tK004681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Mar 2019 17:08:17 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.68]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Thu, 28 Mar 2019 17:08:00 -0700
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: Tom Rini <trini@konsulko.com>
Thread-Topic: [OE-core] [PATCH] wic/bootimg-efi.py: add new source parameter
	"initrd_rename"
Thread-Index: AQHU5W5gMLUAz2phl0S7lZzdsSrBwaYhuz1Q
Date: Fri, 29 Mar 2019 00:07:59 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D12A8A698@ALA-MBD.corp.ad.wrs.com>
References: <1553683062-24444-1-git-send-email-yongxin.liu@windriver.com>
	<20190328135834.GL18421@bill-the-cat>
In-Reply-To: <20190328135834.GL18421@bill-the-cat>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/bootimg-efi.py: add new source parameter "initrd_rename"
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
X-List-Received-Date: Fri, 29 Mar 2019 00:08:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Tom Rini [mailto:trini@konsulko.com]
> Sent: Thursday, March 28, 2019 21:59
> To: Liu, Yongxin
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] wic/bootimg-efi.py: add new source
> parameter "initrd_rename"
>=20
> On Wed, Mar 27, 2019 at 06:37:42PM +0800, Yongxin Liu wrote:
>=20
> > When using initrd in bootloader configuration file, we may want the
> > name of initrd to be fixed. However, the actual name of initrd may
> > change and depend on distro/machine's name. "initrd_rename"
> > gives user a chance to rename initrd in final wic image.
> >
> > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
>=20
> I'm not nak'ing this patch, but I've long fixed this by just not using
> the "efi" plugin to make an EFI system and instead IMAGE_BOOT_FILES to
> say what goes where.  There's a lot of cases bootimg-efi doesn't cover
> but are handled easily with IMAGE_BOOT_FILES.


Thanks Tom for your input.

What I want to do is to copy "${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_F=
STYPES}"
to EFI boot partition and rename it to be "initrd", like

   /boot
    =86=80=80 bzImage
    =86=80=80 EFI
    =81   =84=80=80 BOOT
    =81       =86=80=80 bootx64.efi
    =81       =84=80=80 grub.cfg
    =86=80=80 initrd

"IMAGE_BOOT_FILES" is good to provide such function.
How about porting "IMAGE_BOOT_FILES" to bootimg-efi.py?


Thanks,
Yongxin

>=20
> --
> Tom

