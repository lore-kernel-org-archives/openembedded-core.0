Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R1MwJ-0002xB-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 20:33:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Sep 2011 11:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,346,1312182000"; d="scan'208";a="48997218"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2011 11:28:30 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx603.amr.corp.intel.com ([10.22.226.49]) with mapi; Wed, 7 Sep 2011
	11:28:29 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2011 11:28:28 -0700
Thread-Topic: [OE-core] [PATCH 1/1] image-types: add btrfs as a supported
	fstype
Thread-Index: AcxtLfU5Uv9UZdbCRp6TyzzWTeWRuAAXO3Aw
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DEFEF755@orsmsx504.amr.corp.intel.com>
References: <cover.1315343093.git.nitin.a.kamble@intel.com>
	<7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
	<20110907071541.GB4181@chargestorm.se>
In-Reply-To: <20110907071541.GB4181@chargestorm.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: "Lock, Joshua" <joshua.lock@intel.com>
Subject: Re: [PATCH 1/1] image-types: add btrfs as a supported fstype
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
X-List-Received-Date: Wed, 07 Sep 2011 18:33:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Anders Darander
> Sent: Wednesday, September 07, 2011 12:16 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] image-types: add btrfs as a
> supported fstype
>=20
> * nitin.a.kamble@intel.com <nitin.a.kamble@intel.com> [110906 23:07]:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> > ---
> >  meta/classes/image_types.bbclass |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/image_types.bbclass
> b/meta/classes/image_types.bbclass
> > index c24b326..3e303ed 100644
> > --- a/meta/classes/image_types.bbclass
> > +++ b/meta/classes/image_types.bbclass
> > @@ -141,4 +141,4 @@ IMAGE_DEPENDS_ubi =3D "mtd-utils-native"
> >  IMAGE_DEPENDS_ubifs =3D "mtd-utils-native"
> >
> >  # This variable is available to request which values are suitable
> for IMAGE_FSTYPES
> > -IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz live squashfs
> squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz cpio.xz
> cpio.lzma"
> > +IMAGE_TYPES =3D "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz btrfs live
> squashfs squashfs-lzma ubi tar tar.gz tar.bz2 tar.xz cpio cpio.gz
> cpio.xz cpio.lzma"
>=20
> As Joshua already replied, this isn't enough.
> This raises one question, though. Have you successfully built
> btrfs-image? If so, I assume that you have more patches locally,
> otherwise you should resist submitting patches, unless they're clearly
> marked as RFC (request for comments, and thus not to be applied).
>=20
> Cheers,
> Anders

All these pieces Josh mentioned are already in the tree. I found this new l=
ine, and saw btrfs was not listed in it so added there also. The btrfs supp=
ort in yocto is working with Linux-yocto 3.x kernel. The btrfs kernel confi=
g needs to be enabled, I have sent a patch for that implementing it as a ke=
rnel feature, Once that is there then also need to enable the btrfs feature=
 in the Linux-yocto kernel recipe. I will send a patch for that too.=20

Thanks,
Nitin



