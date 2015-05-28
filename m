Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id A0C5A756FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 08:46:45 +0000 (UTC)
Received: by wifw1 with SMTP id w1so52807024wif.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=PBTVGg1WJV2vsl0oo7Yys5H/xkrhjupo2GJwm+IZui0=;
	b=mfgJNJNuaeGhNlj7Kto0/ayEGOaqSoffS0Oqy7LZAT/Yg9YB853NNvs2o1ekhMMUKB
	aK/rViOS/wkSV+hg3SFpHnlLluY67CjSjCtwHZMFX7x7wCrX89ElqpO6UOz+p3jMpxFJ
	CpnkBvxhJzW2ek8IXryuUa/FAGNNgNvDYTE2TRPOZAMs15wAAf6l0LKYScjq1m3LkOT1
	KphUVu7BpjLNDCILmny3KUeExMVPqLPYzbKJy00GlQOLCQM898q38UnWh5hbZW41kPUh
	XHz6SK3ZFoOVfzzKI5DL19Ula6Zqp6KUGMIspkbfRfcznjZZZvmLC41Teu10HPK93fwP
	wixA==
X-Received: by 10.194.97.196 with SMTP id ec4mr3298732wjb.3.1432802805358;
	Thu, 28 May 2015 01:46:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id z12sm2253000wjq.12.2015.05.28.01.46.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 May 2015 01:46:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 28 May 2015 10:47:06 +0200
To: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <20150528084706.GC2383@jama>
References: <cover.1432775689.git.kai.kang@windriver.com>
	<274a045e16a1d3a0fad66f8727de7a04cc86e614.1432775689.git.kai.kang@windriver.com>
	<CAHiDW_HYEW8+SYsLhbTLWpk1=z0XNvwYaGkBsEaSGi0Zk5Y4Ng@mail.gmail.com>
	<5566CF50.8090503@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5566CF50.8090503@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 28 May 2015 08:46:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2015 at 04:18:24PM +0800, Kang Kai wrote:
> On 2015=E5=B9=B405=E6=9C=8828=E6=97=A5 15:14, Jussi Kukkonen wrote:
> > On 28 May 2015 at 04:26, Kai Kang <kai.kang@windriver.com> wrote:
> >> Upgrade libav from version 9.16 to 9.18. Remove unused var INC_PR and
> >> backport patch to fix CVE-2014-9676.
> > I'm sorry I didn't ask this in the original discussion but... Is there
> > a good reason for keeping 9.x in oe-core if we're bringing in 11.x
> > (instead of either dropping 9.x or moving it to meta-oe)?
> >
> > I haven't found the API changes between 9 and 11 to be so large that
> > they would warrant keeping two versions. Admittedly I'm not working
> > with libav on daily basis so I might have missed things.
>=20
> The original thought is just in case someone may want libav 9. According=
=20
> to release log, series 11
> is
>=20
> "Libav 11 is API-, but not ABI-compatible with the previous major
> release."
>=20
> So it is ok for us to use libav 11 as default. libav 9 recipe could be re=
moved if no one opposes.
>=20
> Ref:
> https://libav.org/releases/libav-11.3.release

Does libav-11 show the same textrel issues? If it's fixed there I'm in favo=
r of dropping libav-9.

=66rom last world build:
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/gst=
reamer1.0-libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreame=
r-1.0/libgstlibav.so' has relocations in .text [textrel]
gstreamer1.0-libav-1.4.5: ELF binary '/tmp/work/i586-oe-linux/gstreamer1.0-=
libav/1.4.5-r0/packages-split/gstreamer1.0-libav/usr/lib/gstreamer-1.0/libg=
stlibav.so' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/armv5e-oe-linux-gnueabi/libav/9.16-r0/pac=
kages-split/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .t=
ext [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavcodec/usr/lib/libavcodec.so.54.35.0' has relocations in .text [textr=
el]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavdevice/usr/lib/libavdevice.so.53.2.0' has relocations in .text [text=
rel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavfilter/usr/lib/libavfilter.so.3.3.0' has relocations in .text [textr=
el]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavformat/usr/lib/libavformat.so.54.20.4' has relocations in .text [tex=
trel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavresample/usr/lib/libavresample.so.1.0.1' has relocations in .text [t=
extrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libavutil/usr/lib/libavutil.so.52.3.0' has relocations in .text [textrel]
libav-9.16: ELF binary '/tmp/work/i586-oe-linux/libav/9.16-r0/packages-spli=
t/libswscale/usr/lib/libswscale.so.2.1.1' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/armv5te-oe-=
linux-gnueabi/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/li=
bpostproc/usr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]
libpostproc-52.3.0+gitAUTOINC+811db3b957: ELF binary '/tmp/work/i586-oe-lin=
ux/libpostproc/52.3.0+gitAUTOINC+811db3b957-r0/packages-split/libpostproc/u=
sr/lib/libpostproc.so.52.3.0' has relocations in .text [textrel]

> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   meta/recipes-multimedia/libav/libav.inc            |  2 -
> >>   .../libav/libav/libav-fix-CVE-2014-9676.patch      | 98 ++++++++++++=
++++++++++
> >>   meta/recipes-multimedia/libav/libav_9.16.bb        |  4 -
> >>   meta/recipes-multimedia/libav/libav_9.18.bb        |  6 ++
> >>   4 files changed, 104 insertions(+), 6 deletions(-)
> >>   create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE=
-2014-9676.patch
> >>   delete mode 100644 meta/recipes-multimedia/libav/libav_9.16.bb
> >>   create mode 100644 meta/recipes-multimedia/libav/libav_9.18.bb
> >>
> >> diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-mu=
ltimedia/libav/libav.inc
> >> index cac836f..6ef273b 100644
> >> --- a/meta/recipes-multimedia/libav/libav.inc
> >> +++ b/meta/recipes-multimedia/libav/libav.inc
> >> @@ -24,8 +24,6 @@ ARM_INSTRUCTION_SET =3D "arm"
> >>
> >>   DEPENDS =3D "alsa-lib zlib libogg yasm-native"
> >>
> >> -INC_PR =3D "r8"
> >> -
> >>   inherit autotools pkgconfig
> >>
> >>   B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
> >> diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-96=
76.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
> >> new file mode 100644
> >> index 0000000..1e31caa
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2014-9676.patch
> >> @@ -0,0 +1,98 @@
> >> +Upstream-Status: Backport
> >> +
> >> +Backport patch to fix CVE-2014-9676.
> >> +
> >> +https://security-tracker.debian.org/tracker/CVE-2014-9676
> >> +https://git.libav.org/?p=3Dlibav.git;a=3Dcommit;h=3Db3f04657368a32a99=
03406395f865e230b1de348
> >> +
> >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> +---
> >> +From b3f04657368a32a9903406395f865e230b1de348 Mon Sep 17 00:00:00 2001
> >> +From: Luca Barbato <lu_zero@gentoo.org>
> >> +Date: Mon, 5 Jan 2015 10:40:41 +0100
> >> +Subject: [PATCH] segment: Fix the failure paths
> >> +
> >> +A failure in segment_end() or segment_start() would lead to freeing
> >> +a dangling pointer and in general further calls to seg_write_packet()
> >> +or to seg_write_trailer() would have the same faulty behaviour.
> >> +
> >> +CC: libav-stable@libav.org
> >> +Reported-By: luodalongde@gmail.com
> >> +---
> >> + libavformat/segment.c | 32 ++++++++++++++++++++------------
> >> + 1 file changed, 20 insertions(+), 12 deletions(-)
> >> +
> >> +diff --git a/libavformat/segment.c b/libavformat/segment.c
> >> +index 52da6b9..bcfd1f9 100644
> >> +--- a/libavformat/segment.c
> >> ++++ b/libavformat/segment.c
> >> +@@ -184,6 +184,13 @@ static void close_null_ctx(AVIOContext *pb)
> >> +     av_free(pb);
> >> + }
> >> +
> >> ++static void seg_free_context(SegmentContext *seg)
> >> ++{
> >> ++    avio_closep(&seg->pb);
> >> ++    avformat_free_context(seg->avf);
> >> ++    seg->avf =3D NULL;
> >> ++}
> >> ++
> >> + static int seg_write_header(AVFormatContext *s)
> >> + {
> >> +     SegmentContext *seg =3D s->priv_data;
> >> +@@ -265,12 +272,9 @@ static int seg_write_header(AVFormatContext *s)
> >> +     }
> >> +
> >> + fail:
> >> +-    if (ret) {
> >> +-        if (seg->list)
> >> +-            avio_close(seg->pb);
> >> +-        if (seg->avf)
> >> +-            avformat_free_context(seg->avf);
> >> +-    }
> >> ++    if (ret < 0)
> >> ++        seg_free_context(seg);
> >> ++
> >> +     return ret;
> >> + }
> >> +
> >> +@@ -282,6 +286,9 @@ static int seg_write_packet(AVFormatContext *s, A=
VPacket *pkt)
> >> +     int64_t end_pts =3D seg->recording_time * seg->number;
> >> +     int ret, can_split =3D 1;
> >> +
> >> ++    if (!oc)
> >> ++        return AVERROR(EINVAL);
> >> ++
> >> +     if (seg->has_video) {
> >> +         can_split =3D st->codec->codec_type =3D=3D AVMEDIA_TYPE_VIDE=
O &&
> >> +                     pkt->flags & AV_PKT_FLAG_KEY;
> >> +@@ -322,11 +329,8 @@ static int seg_write_packet(AVFormatContext *s, =
AVPacket *pkt)
> >> +     ret =3D ff_write_chained(oc, pkt->stream_index, pkt, s);
> >> +
> >> + fail:
> >> +-    if (ret < 0) {
> >> +-        if (seg->list)
> >> +-            avio_close(seg->pb);
> >> +-        avformat_free_context(oc);
> >> +-    }
> >> ++    if (ret < 0)
> >> ++        seg_free_context(seg);
> >> +
> >> +     return ret;
> >> + }
> >> +@@ -335,7 +339,11 @@ static int seg_write_trailer(struct AVFormatCont=
ext *s)
> >> + {
> >> +     SegmentContext *seg =3D s->priv_data;
> >> +     AVFormatContext *oc =3D seg->avf;
> >> +-    int ret;
> >> ++    int ret =3D 0;
> >> ++
> >> ++    if (!oc)
> >> ++        goto fail;
> >> ++
> >> +     if (!seg->write_header_trailer) {
> >> +         if ((ret =3D segment_end(oc, 0)) < 0)
> >> +             goto fail;
> >> +--
> >> +2.4.1.314.g9532ead
> >> +
> >> diff --git a/meta/recipes-multimedia/libav/libav_9.16.bb b/meta/recipe=
s-multimedia/libav/libav_9.16.bb
> >> deleted file mode 100644
> >> index 79ff3f8..0000000
> >> --- a/meta/recipes-multimedia/libav/libav_9.16.bb
> >> +++ /dev/null
> >> @@ -1,4 +0,0 @@
> >> -require libav.inc
> >> -
> >> -SRC_URI[md5sum] =3D "7b44b75cec24b8e7545e5029e76917e0"
> >> -SRC_URI[sha256sum] =3D "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec=
498525de3ffda4367a0"
> >> diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipe=
s-multimedia/libav/libav_9.18.bb
> >> new file mode 100644
> >> index 0000000..210a649
> >> --- /dev/null
> >> +++ b/meta/recipes-multimedia/libav/libav_9.18.bb
> >> @@ -0,0 +1,6 @@
> >> +require libav.inc
> >> +
> >> +SRC_URI[md5sum] =3D "75e838068a75fb88e1b4ea0546bc16f0"
> >> +SRC_URI[sha256sum] =3D "0875e835da683eef1a7bac75e1884634194149d7479d1=
538ba9fbe1614d066d7"
> >> +
> >> +SRC_URI +=3D "file://libav-fix-CVE-2014-9676.patch"
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>=20
>=20
> --=20
> Regards,
> Neil | Kai Kang
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

