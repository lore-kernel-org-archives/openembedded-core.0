Return-Path: <S.Mueller-Klieser@phytec.de>
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4B971144
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 08:39:17 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 08B2DA00105;
	Tue, 21 Apr 2015 10:40:28 +0200 (CEST)
In-Reply-To: <1429540460.26983.11.camel@linuxfoundation.org>
References: <1429525121-28802-1-git-send-email-s.mueller-klieser@phytec.de>
	<1429540460.26983.11.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
X-KeepSent: 55E5DCE2:B2872A85-C1257E2E:002F5F84;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
Message-ID: <OF55E5DCE2.B2872A85-ONC1257E2E.002F5F84-C1257E2E.002F8AD5@phytec.de>
From: =?ISO-8859-1?Q?Stefan_M=FCller-Klieser?= <S.Mueller-Klieser@phytec.de>
Date: Tue, 21 Apr 2015 10:39:17 +0200
X-MIMETrack: Serialize by Router on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 21.04.2015 10:39:18,
	Serialize complete at 21.04.2015 10:39:18
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][dizzy][PATCH] gcc-4.9: backport from gcc trunk r212178
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
X-List-Received-Date: Tue, 21 Apr 2015 08:39:19 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Richard Purdie <richard.purdie@linuxfoundation.org> wrote on 04/20/2015=20
04:34:20 PM:

> Von: Richard Purdie <richard.purdie@linuxfoundation.org>
> An: Stefan M=FCller-Klieser <s.mueller-klieser@phytec.de>
> Kopie: openembedded-core@lists.openembedded.org
> Datum: 04/20/2015 04:34 PM
> Betreff: Re: [OE-core] [meta-oe][dizzy][PATCH] gcc-4.9: backport=20
> from gcc trunk r212178
>=20
> On Mon, 2015-04-20 at 12:18 +0200, Stefan M=FCller-Klieser wrote:
> > When compiling meta-toolchain-qt5 on cortexa8, the compiler throws an
> > internal compiler error:
> >=20
> > ...
> > qttools-opensource-src-5.3.2/src/linguist/shared/po.cpp:
> > In function 'bool loadPO(Translator&, QIODevice&, ConversionData&)':
> > qttools-opensource-src-5.3.2/src/linguist/shared/po.cpp:717:1:
> > internal compiler error: in add=5Fstores, at var-tracking.c:6000
> > ...
> >=20
> > Tracking this down led to https://bugs.linaro.org/show=5Fbug.cgi?id=3D5=
34
> > It seems the bug is well know and fixed upstream. So backporting from
> > trunk seems to be the right solution. This fixes the compiler problem
> > on cortexa8 and does not seem to be very invasive. The original commit
> > can be found at:
> >=20
> > git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@212178=20
> 138bc75d-0d04-0410-961f-82ee72b054a4
> >=20
> > Signed-off-by: Stefan M=FCller-Klieser <s.mueller-klieser@phytec.de>
> > ---
> >  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
> >  ...racking.c-backport-from-gcc-trunk-r212178.patch | 39 +++++++++
> +++++++++++++
> >  2 files changed, 40 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0060-gcc-
> var-tracking.c-backport-from-gcc-trunk-r212178.patch
>=20
> Does this need to be added to master before we can backport to dizzy?
I thought Yocto will resolve those dependencies automatically ;-) No for=20
real, I don't use master at the moment. But I managed to quickly test the=20
patch on master with qt5.3.2 on the beagleboneblack. The bug still exists=20
and is fixed with the patch. I will send a new one...

Regards, Stefan

>=20
> Cheers,
>=20
> Richard
>=20


