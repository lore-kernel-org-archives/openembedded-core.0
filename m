Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A76A9753C0;
	Thu, 10 May 2018 22:38:44 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id a137-v6so680282wme.1;
	Thu, 10 May 2018 15:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nK4bQ7VdYITFwRMOV25C1qJw0Ce50bl9W3u3v0Mv58M=;
	b=odzRI8PqfBNS20nAqQIUfQqxAQDv9+fFJHkzO9dNAMlRIG0k1vPnlxVVDRtK02E6uT
	Eb4if0uyyiwz4GgFtUCOeBrhJGrNiEQCGL2MJnkIuBXupxvnOcQWWZ7L3qlcMD8PNVTv
	15v5ZeWpVjy2MLLyipsxoSEBBiQndSVGynuKPJ2pY+/8iIhHOTK/t7FYrgESL6pCazKl
	MAft2TGdABT/Ka7RPMjA3hHaUEZl+xFrnCGRxI3pHhHi80kHnPnBQYCWCmyjhzmeV7LW
	zQnTdyvNJ3blnPn66HckDWvqTyq9FSh+tcdmA+mbfQPckGCMV9hhjzp2H6eMDQiP1IBR
	d9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nK4bQ7VdYITFwRMOV25C1qJw0Ce50bl9W3u3v0Mv58M=;
	b=XQBpBrjiw66A27t+nL3KEQJiXMQXMxM3BxaJp0+PaLVZdYE7xH35IL3RHC36e+MvPX
	HpvGK9yi72Y79o8LAJ11H9lVnV+lG9uNqD1aIR6e8z4CC3WqjkbXH51/3+1VDXG+Fm4o
	iUkUcuclfAl6KBVQdlUh3wBAF3Da0MpPMX+QYrGSHIjhlkePXFCFa/4e0JqdocaiWDTx
	BjrnJ7nNjjk7H3/mYlpsDV9HQjbT7UhTOXPZrEd7pdY2ihvDL9ybR6iMKbDppMkQKpkT
	Iq+9S5reS3EimSIeeye2Mhuuo8dBCtLhWif3+9x7CEFMbrphkILl/llHU7gmkM7aTUEd
	olGA==
X-Gm-Message-State: ALKqPwcRXIvT4VWSBnnh2jcnEArbDAaGfyAOFPBxDTSOo9L+fgw7VkbP
	abE8e96B25cFD+62n0BccQKQ7nHQb6wSRKUnLLo=
X-Google-Smtp-Source: AB8JxZrSEJtDuF5ViRo8w7C3QbQuXm6blP+iISCV11/3C4jpAkG7SMpj3HCKKNGEn8bRS0C7nSnPOagDcNRKTEqiaD4=
X-Received: by 2002:a1c:5946:: with SMTP id n67-v6mr407517wmb.32.1525991925142;
	Thu, 10 May 2018 15:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CA+chaQcUU=Dew1cATDBpuA2_f_eh1=DAyEMaDHfVx7kY88rZhg@mail.gmail.com>
	<8d962430-ac63-5e97-fd32-2c0464c62acb@gmail.com>
	<20180510191145.GA1954@jama>
	<CAJ86T=Xz+2neJPBw41_sFxd977xp=zznsgzFdbeHJ-aysJNk+g@mail.gmail.com>
	<20180510214325.GC1954@jama> <20180510220735.GD1954@jama>
	<CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
In-Reply-To: <CAJ86T=UpZ0+HTqre2Z4eAPM9LY_eH1EUO=e1v0sz7FPe4+8aRw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 10 May 2018 22:38:34 +0000
Message-ID: <CA+chaQcTPwJy+dL6GvBKJTcZuiVUiztVqEDXmSwZ==b53m_mcQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 22:38:44 -0000
Content-Type: multipart/alternative; boundary="000000000000a0dbcc056be1ae36"

--000000000000a0dbcc056be1ae36
Content-Type: text/plain; charset="UTF-8"

see
http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150654.html

On Fri, May 11, 2018 at 12:38 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, May 10, 2018 at 3:07 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > On Thu, May 10, 2018 at 11:43:25PM +0200, Martin Jansa wrote:
> >> On Thu, May 10, 2018 at 12:27:50PM -0700, Andre McCurdy wrote:
> >> > On Thu, May 10, 2018 at 12:11 PM, Martin Jansa <
> martin.jansa@gmail.com> wrote:
> >> > > On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote:
> >> > >> Hi Martin
> >> > >>
> >> > >> Thanks for testing and reporting back
> >> > >>
> >> > >> On 5/9/18 2:38 AM, Martin Jansa wrote:
> >> > >> > My initial tests show couple issues, but usually caused by other
> changes
> >> > >> > in that branch, not the gcc-8 itself.
> >> > >> >
> >> > >> > 1) strace-4.22 from
> >> > >> >
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/gcc-8&id=af33a8b721cc9caebd3f5226b4c5903f666ab654
> >> > >> > fails to build with ptest enabled (it builds with 4.20 version
> if I
> >> > >> > revert this change)
> >> > >> > ../../strace-4.22/tests/inject-nf.c: In function 'main':
> >> > >> > ../../strace-4.22/tests/inject-nf.c:86:1: error: r7 cannot be
> used in
> >> > >> > asm here
> >> > >> >   }
> >> > >> >   ^
> >> > >>
> >> > >> are you targeting thumb1 ? how can I reproduce it ?
> >> > >
> >> > > I'm trying to find out what's different in the builds where it was
> >> > > failing, will provide more info later.
> >> >
> >> > This is probably due to making an inline syscall from Thumb (doesn't a
> >> > matter Thumb1 or Thumb2) with frame pointers enabled.
> >> >
> >> > Does adding -fomit-frame-pointer to CFLAGS fix it?
> >>
> >> It was with raspberrypi3, thumb (Thumb2) enabled in DISTRO, there is
> >> already -fno-omit-frame-pointer in the default command line for it,
> >> adding -fomit-frame-pointer at the end fixes it:
> >>
> >> docker-lge @
> ~/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/build/tests
> $ arm-webos-linux-gnueabi-gcc  -march=armv7ve -mthumb -mfpu=neon-vfpv4
> -mfloat-abi=hard -mcpu=cortex-a7
> --sysroot=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot
> -DHAVE_CONFIG_H    -I. -I../linux/arm -I../../strace-4.22/linux/arm
> -I../linux -I../../strace-4.22/linux -I.. -I../../strace-4.22
> -DTESTS_SIZEOF_KERNEL_LONG_T=4 -DTESTS_SIZEOF_LONG=4  -Wall -Wempty-body
> -Wformat-security -Wignored-qualifiers -Wimplicit-fallthrough=5 -Winit-self
> -Wlogical-op -Wmissing-parameter-type -Wnested-externs
> -Wold-style-declaration -Wold-style-definition -Wsign-compare -Wtype-limits
> -Wwrite-strings -O -fno-omit-frame-pointer -g
> -feliminate-unused-debug-types
> -fdebug-prefix-map=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0=/usr/src/debug/strace/4.22-r0
> -fdebug-prefix-map=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot=
> -fdebug-prefix-map=/OE/webos/build/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot-native=
> -pipe  -c -o inject-nf.o ../../strace-4.22/tests/inject-nf.c
> -fomit-frame-pointer
> >>
> >> This might come from:
> >> meta/conf/bitbake.conf:DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer
> ${DEBUG_FLAGS} -pipe"
> >> because in this build I had DEBUG_BUILD enabled.
> >>
> >> Will retest with 4.20 version + DEBUG_BUILD to see if it fails there as
> well now.
> >
> > 4.20 doesn't fail with DEBUG_BUILD, because inject-nf.c test is new in
> > 4.22:
> >
> >
> https://github.com/strace/strace/commit/58598cd7f6e23e531d71bfe5a4e35f898a4f3b2d#diff-dc01d20c1e55f8adf7536cb46d4481e1
> >
> > What is preferred fix for this? Is adding -fomit-frame-pointer to CFLAGS
> > when ptest is in DISTRO_FEATURES acceptable solution?
>
> I would say unconditionally adding -fomit-frame-pointer to CFLAGS for
> all builds is OK (strace is a debug tool - not something that
> generally needs to be debugged and frame pointers aren't essential for
> debugging anyway).
>

--000000000000a0dbcc056be1ae36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">see=C2=A0<a href=3D"http://lists.openembedded.org/pipermai=
l/openembedded-core/2018-May/150654.html">http://lists.openembedded.org/pip=
ermail/openembedded-core/2018-May/150654.html</a></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr">On Fri, May 11, 2018 at 12:38 AM Andre McCurdy =
&lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">On Thu, May 10, 2018 at 3:07 PM,=
 Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blan=
k">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, May 10, 2018 at 11:43:25PM +0200, Martin Jansa wrote:<br>
&gt;&gt; On Thu, May 10, 2018 at 12:27:50PM -0700, Andre McCurdy wrote:<br>
&gt;&gt; &gt; On Thu, May 10, 2018 at 12:11 PM, Martin Jansa &lt;<a href=3D=
"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt; &gt; On Thu, May 10, 2018 at 11:50:02AM -0700, Khem Raj wrote=
:<br>
&gt;&gt; &gt; &gt;&gt; Hi Martin<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Thanks for testing and reporting back<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On 5/9/18 2:38 AM, Martin Jansa wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt; My initial tests show couple issues, but usuall=
y caused by other changes<br>
&gt;&gt; &gt; &gt;&gt; &gt; in that branch, not the gcc-8 itself.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; 1) strace-4.22 from<br>
&gt;&gt; &gt; &gt;&gt; &gt; <a href=3D"http://git.openembedded.org/openembe=
dded-core-contrib/commit/?h=3Dkraj/gcc-8&amp;id=3Daf33a8b721cc9caebd3f5226b=
4c5903f666ab654" rel=3D"noreferrer" target=3D"_blank">http://git.openembedd=
ed.org/openembedded-core-contrib/commit/?h=3Dkraj/gcc-8&amp;id=3Daf33a8b721=
cc9caebd3f5226b4c5903f666ab654</a><br>
&gt;&gt; &gt; &gt;&gt; &gt; fails to build with ptest enabled (it builds wi=
th 4.20 version if I<br>
&gt;&gt; &gt; &gt;&gt; &gt; revert this change)<br>
&gt;&gt; &gt; &gt;&gt; &gt; ../../strace-4.22/tests/inject-nf.c: In functio=
n &#39;main&#39;:<br>
&gt;&gt; &gt; &gt;&gt; &gt; ../../strace-4.22/tests/inject-nf.c:86:1: error=
: r7 cannot be used in<br>
&gt;&gt; &gt; &gt;&gt; &gt; asm here<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0}<br>
&gt;&gt; &gt; &gt;&gt; &gt;=C2=A0 =C2=A0^<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; are you targeting thumb1 ? how can I reproduce it ?<=
br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I&#39;m trying to find out what&#39;s different in the b=
uilds where it was<br>
&gt;&gt; &gt; &gt; failing, will provide more info later.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is probably due to making an inline syscall from Thumb (=
doesn&#39;t a<br>
&gt;&gt; &gt; matter Thumb1 or Thumb2) with frame pointers enabled.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Does adding -fomit-frame-pointer to CFLAGS fix it?<br>
&gt;&gt;<br>
&gt;&gt; It was with raspberrypi3, thumb (Thumb2) enabled in DISTRO, there =
is<br>
&gt;&gt; already -fno-omit-frame-pointer in the default command line for it=
,<br>
&gt;&gt; adding -fomit-frame-pointer at the end fixes it:<br>
&gt;&gt;<br>
&gt;&gt; docker-lge @ ~/build/build-webos-master/BUILD/work/raspberrypi3-we=
bos-linux-gnueabi/strace/4.22-r0/build/tests $ arm-webos-linux-gnueabi-gcc=
=C2=A0 -march=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=
=3Dcortex-a7 --sysroot=3D/OE/webos/build/build-webos-master/BUILD/work/rasp=
berrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysroot -DHAVE_CONFIG_H=
=C2=A0 =C2=A0 -I. -I../linux/arm -I../../strace-4.22/linux/arm -I../linux -=
I../../strace-4.22/linux -I.. -I../../strace-4.22 -DTESTS_SIZEOF_KERNEL_LON=
G_T=3D4 -DTESTS_SIZEOF_LONG=3D4=C2=A0 -Wall -Wempty-body -Wformat-security =
-Wignored-qualifiers -Wimplicit-fallthrough=3D5 -Winit-self -Wlogical-op -W=
missing-parameter-type -Wnested-externs -Wold-style-declaration -Wold-style=
-definition -Wsign-compare -Wtype-limits -Wwrite-strings -O -fno-omit-frame=
-pointer -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/OE/webos/b=
uild/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/=
4.22-r0=3D/usr/src/debug/strace/4.22-r0 -fdebug-prefix-map=3D/OE/webos/buil=
d/build-webos-master/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.2=
2-r0/recipe-sysroot=3D -fdebug-prefix-map=3D/OE/webos/build/build-webos-mas=
ter/BUILD/work/raspberrypi3-webos-linux-gnueabi/strace/4.22-r0/recipe-sysro=
ot-native=3D=C2=A0 -pipe=C2=A0 -c -o inject-nf.o ../../strace-4.22/tests/in=
ject-nf.c -fomit-frame-pointer<br>
&gt;&gt;<br>
&gt;&gt; This might come from:<br>
&gt;&gt; meta/conf/bitbake.conf:DEBUG_OPTIMIZATION =3D &quot;-O -fno-omit-f=
rame-pointer ${DEBUG_FLAGS} -pipe&quot;<br>
&gt;&gt; because in this build I had DEBUG_BUILD enabled.<br>
&gt;&gt;<br>
&gt;&gt; Will retest with 4.20 version + DEBUG_BUILD to see if it fails the=
re as well now.<br>
&gt;<br>
&gt; 4.20 doesn&#39;t fail with DEBUG_BUILD, because inject-nf.c test is ne=
w in<br>
&gt; 4.22:<br>
&gt;<br>
&gt; <a href=3D"https://github.com/strace/strace/commit/58598cd7f6e23e531d7=
1bfe5a4e35f898a4f3b2d#diff-dc01d20c1e55f8adf7536cb46d4481e1" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/strace/strace/commit/58598cd7f6e2=
3e531d71bfe5a4e35f898a4f3b2d#diff-dc01d20c1e55f8adf7536cb46d4481e1</a><br>
&gt;<br>
&gt; What is preferred fix for this? Is adding -fomit-frame-pointer to CFLA=
GS<br>
&gt; when ptest is in DISTRO_FEATURES acceptable solution?<br>
<br>
I would say unconditionally adding -fomit-frame-pointer to CFLAGS for<br>
all builds is OK (strace is a debug tool - not something that<br>
generally needs to be debugged and frame pointers aren&#39;t essential for<=
br>
debugging anyway).<br>
</blockquote></div>

--000000000000a0dbcc056be1ae36--
