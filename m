Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RjR1t-0005kd-5F
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Jan 2012 08:49:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2012 23:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="93895902"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 06 Jan 2012 23:42:02 -0800
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 7 Jan 2012 15:40:22 +0800
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.199]) by
	SHSMSX151.ccr.corp.intel.com ([169.254.3.223]) with mapi id
	14.01.0355.002; Sat, 7 Jan 2012 15:40:21 +0800
From: "Xu, Dongxiao" <dongxiao.xu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/7][PULL] Hob2 related oe-core changes
Thread-Index: AQHMzJAwcEt/xKdibEuvyoRPDGZqapYAdZbQ
Date: Sat, 7 Jan 2012 07:40:20 +0000
Message-ID: <40776A41FC278F40B59438AD47D147A9016A27@SHSMSX102.ccr.corp.intel.com>
References: <cover.1325840092.git.dongxiao.xu@intel.com>
	<1325867267.14746.8.camel@ted>
In-Reply-To: <1325867267.14746.8.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [PATCH 0/7][PULL] Hob2 related oe-core changes
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
X-List-Received-Date: Sat, 07 Jan 2012 07:49:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Saturday, January 07, 2012 12:28 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 0/7][PULL] Hob2 related oe-core changes
>=20
> On Fri, 2012-01-06 at 17:04 +0800, Dongxiao Xu wrote:
> > Hi Richard,
> >
> > This pull request is the hob2 related oe-core changes.
> > Please help to review and pull.
> >
> > Note that this pull request has dependency on the hob related bitbake
> changes.
> >
> > Thanks,
> > Dongxiao
> >
> > The following changes since commit
> 4a85312568a6bb052cc511c15b4ae842ff7f8e59:
> >   Richard Purdie (1):
> >         image-mklibs/package_ipk: Remove bashisms
> >
> > are available in the git repository at:
> >
> >   git://git.pokylinux.org/poky-contrib dxu4/hob-oecore-changes
> >
> > http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddxu4/hob-oecore=
-
> > changes
> >
> > Dongxiao Xu (6):
> >   bblayers.conf.sample: Use ?=3D to set BBLAYERS
> >   image.bbclass: Use ?=3D to set LINGUAS_INSTALL
>=20
> I merged these.

Thanks!

>=20
> >   packageinfo.bbclass: add a new bbclass to pass package information
>=20
> I still have quite a strong dislike of this code, its rather nasty to req=
uire this and I
> wish we could come up with a less ugly way to collect up this information=
.

I am sorry if this patch makes you feel uncomfortable.

Actually this approach was brought out early in the HOB2 design phase, and =
that time I didn't get explicit objection about it.
Refer to bug http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1750, which is=
 a M2 task.

Later we had some discussions of finding new way to dump all the available =
packages from server side.
Due to the schedule reason, we have to put it into M3. Refer to bug http://=
bugzilla.pokylinux.org/show_bug.cgi?id=3D1871.

But I think this approach is similar with buildhistory.bbclass. (Actually I=
 am not aware there is buildhistory.bbclass exists when I wrote my code).
What the main difference is, buildhistory.bbclass writes the information in=
to a local file, but packageinfo.bbclass emit the info as an event.

>=20
> >   hob.bb: Add a empty image template
> >   hob-toolchain: add a new recipe hob-toolchain
> >   layers: add a new folder to put user added layers
>=20
> I don't like these three. They're horribly hob specific and IMO shouldn't=
 be in the
> general metadata. If there is no way to avoid them, they should perhaps g=
o into
> a meta-hob layer directory to keep them separate from the rest of the sys=
tem.

If we need to support the split of client and server, there is a principle =
that client GUI should not access any server directories or files.
Therefore HOB will not automatically generate any image bb files and copy i=
t to meta directory.
This is the reason why we need to generate two empty image/toolchain files =
for the GUI to use.

If you do not like the name of hob.bb or hob-toolchain.bb, I can rename it =
to a generic one, like dummy-image.bb and dummy-toolchain.bb.
Actually putting them into meta-hob layer also works, but this requires the=
 hob user to manually add meta-hob layer each time when he launches the HOB=
 GUI. Of course we can defaultly add meta-hob layer into bblayers.conf.samp=
le in meta-yocto layer if you think it is feasible.

>=20
> I'm still puzzled how the layers directory helps. We deliberately support=
 generic
> layer locations so forcing the user to place them in a particular place s=
eems like
> a bit of a backwards step? :/.

We do not need the "layers" directory if users know where the layers are an=
d then they can edit bblayers.conf.
And in non-split HOB case, users can still put their layers anywhere. HOB s=
upports file browser and user can add layer by that.

But one new situation is, client GUI and server may run in different machin=
es.
How could a client GUI user get the information what are the available laye=
rs in server?
I definitely welcome good suggestions.

Thanks,
Dongxiao

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


