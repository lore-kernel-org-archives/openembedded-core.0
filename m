Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 361B4606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 10:58:57 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u6CAwviU027709; Tue, 12 Jul 2016 05:58:57 -0500
Received: from adi-pc-linux ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016071205585761-752915 ;
	Tue, 12 Jul 2016 05:58:57 -0500 
Date: Tue, 12 Jul 2016 13:57:46 +0300
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <20160712135746.762f93c9@adi-pc-linux>
In-Reply-To: <57846393.1090200@windriver.com>
References: <1462536830-30243-1-git-send-email-catalin.enache@windriver.com>
	<CAJTo0La2hOxuxNsEdoEVE2tKDsL_3nRd6zonG-iLn7_=HRtqyQ@mail.gmail.com>
	<57846393.1090200@windriver.com>
Organization: National Instruments
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/12/2016 05:58:57 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/12/2016 05:58:57 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-07-12_06:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub-efi: run autogen.sh before configure
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
X-List-Received-Date: Tue, 12 Jul 2016 10:59:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello

On Tue, 12 Jul 2016 11:27:15 +0800
"Yu, Mingli" <mingli.yu@windriver.com> wrote:

> On 2016=E5=B9=B407=E6=9C=8811=E6=97=A5 18:22, Burton, Ross wrote:
> >
> > On 6 May 2016 at 13:13, Catalin Enache <catalin.enache@windriver.com
> > <mailto:catalin.enache@windriver.com>> wrote:
> >
> >       DEPENDS=5Fclass-target =3D "grub-efi-native"
> >       RDEPENDS=5F${PN}=5Fclass-target =3D "diffutils freetype"
> >     +DEPENDS +=3D "autogen-native"
> >
> >
> > Because +=3D happens after overrides this results in autogen-native onl=
y a
> > dependency in native builds, so you can't be sure it will be present for
> > target builds. =20
>=20
> Thanks Ross! Will update the line as:
> DEPENDS=5Fappend =3D " autogen-native"
> >
> > Should the configure=5Fprepend and autogen-native be added to grub2.inc=
 so
> > that every recipe has that dependency? =20
>=20
> Hi Catalin,
> Could you help to confirm if the three recipes (grub-efi=5F2.00.bb,=20
> grub=5F2.00.bb, grub=5Fgit.bb) all need configure=5Fprepend and=20
> autogen-native? if yes, I will resent the patch to add configure=5Fprepen=
d=20
> and autogen-native to grub2.inc, if not, then we still let it stay in=20
> grub-efi recipe.

I would really appreciate if you could add the autogen call to all grub rec=
ipes,
not only to grub-efi, because I'm also carrying OOT patches and have to add
it into a bbappend.

>=20
> Thanks,
> Grace
> >
> > Ross
> >
> > =20


