Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4288375745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 15:28:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 29 May 2015 08:28:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,517,1427785200"; d="scan'208";a="499941694"
Received: from clarkeke-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.5])
	by FMSMGA003.fm.intel.com with ESMTP; 29 May 2015 08:28:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Kang Kai <Kai.Kang@windriver.com>, Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 29 May 2015 16:28:07 +0100
Message-ID: <1528283.0UTgDEqc8E@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <5567C29C.3030307@windriver.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
	<20150528084706.GC2383@jama> <5567C29C.3030307@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] libav: upgrade to 9.18
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
X-List-Received-Date: Fri, 29 May 2015 15:28:09 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday 29 May 2015 09:36:28 Kang Kai wrote:
> On 2015=E5=B9=B405=E6=9C=8828=E6=97=A5 16:47, Martin Jansa wrote:
> > On Thu, May 28, 2015 at 04:18:24PM +0800, Kang Kai wrote:
> >> On 2015=E5=B9=B405=E6=9C=8828=E6=97=A5 15:14, Jussi Kukkonen wrote=
:
> >>> On 28 May 2015 at 04:26, Kai Kang <kai.kang@windriver.com> wrote:=

> >>>> Upgrade libav from version 9.16 to 9.18. Remove unused var INC_P=
R and
> >>>> backport patch to fix CVE-2014-9676.
> >>>=20
> >>> I'm sorry I didn't ask this in the original discussion but... Is =
there
> >>> a good reason for keeping 9.x in oe-core if we're bringing in 11.=
x
> >>> (instead of either dropping 9.x or moving it to meta-oe)?
> >>>=20
> >>> I haven't found the API changes between 9 and 11 to be so large t=
hat
> >>> they would warrant keeping two versions. Admittedly I'm not worki=
ng
> >>> with libav on daily basis so I might have missed things.
> >>=20
> >> The original thought is just in case someone may want libav 9. Acc=
ording
> >> to release log, series 11
> >> is
> >>=20
> >> "Libav 11 is API-, but not ABI-compatible with the previous major
> >> release."
> >>=20
> >> So it is ok for us to use libav 11 as default. libav 9 recipe coul=
d be
> >> removed if no one opposes.
> >>=20
> >> Ref:
> >> https://libav.org/releases/libav-11.3.release
> >=20
> > Does libav-11 show the same textrel issues? If it's fixed there I'm=
 in
> > favor of dropping libav-9.
> >=20
> > from last world build:
> > gstreamer1.0-libav-1.4.5: ELF binary
> > '/tmp/work/armv5e-oe-linux-gnueabi/gstreamer1.0-libav/1.4.5-r0/pack=
ages-s
> > plit/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has
> > relocations in .text [textrel] gstreamer1.0-libav-1.4.5: ELF binary=

> > '/tmp/work/i586-oe-linux/gstreamer1.0-libav/1.4.5-r0/packages-split=
/gstre
> > amer1.0-libav/usr/lib/gstreamer-1.0/libgstlibav.so' has relocations=
 in
> > .text [textrel] libav-9.16: ELF binary
> > '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/packages-split/lib=
avcode
> > c/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textrel]=

> > libav-9.16: ELF binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavcodec/us=
r/lib/
> > libavcodec.so.54.35.0' has relocations in .text [textrel] libav-9.1=
6: ELF
> > binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavdevice/u=
sr/lib
> > /libavdevice.so.53.2.0' has relocations in .text [textrel] libav-9.=
16: ELF
> > binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavfilter/u=
sr/lib
> > /libavfilter.so.3.3.0' has relocations in .text [textrel] libav-9.1=
6: ELF
> > binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavformat/u=
sr/lib
> > /libavformat.so.54.20.4' has relocations in .text [textrel] libav-9=
.16:
> > ELF binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavresample=
/usr/l
> > ib/libavresample.so.1.0.1' has relocations in .text [textrel] libav=
-9.16:
> > ELF binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libavutil/usr=
/lib/l
> > ibavutil.so.52.3.0' has relocations in .text [textrel] libav-9.16: =
ELF
> > binary
> > '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-split/libswscale/us=
r/lib/
> > libswscale.so.2.1.1' has relocations in .text [textrel]
> > libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary
> > '/tmp/work/armv5te-oe-linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+8=
11db3b
> > 957-r0/packages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' ha=
s
> > relocations in .text [textrel] libpostproc-52.3.0+gitAUTOINC+811db3=
b957:
> > ELF binary
> > '/tmp/work/i586-oe-linux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r=
0/pack
> > ages-split/libpostproc/usr/lib/libpostproc.so.52.3.0' has relocatio=
ns in
> > .text [textrel]
>
> No, the textrel issue is not fixed in version 11.3 either. It has an
> configure option '--enable-pic' but seems doesn't work.
> x86 has same warnings and it just skips the textrel check in the liba=
v
> recipe.

Just for background, the reason I disabled the textrel check for x86 in=
=20
libav.inc was that I was able to determine based on quick research that=
=20
upstream deliberately doesn't enable -fPIC for x86 (32-bit) because app=
arently=20
it doesn't really work there. I honestly didn't check what the situatio=
n was=20
on 32-bit ARM; I probably should have done that at the time.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

