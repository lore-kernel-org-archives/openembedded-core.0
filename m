Return-Path: <nicolas.dechesne@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B04C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 07:58:00 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.8170.1672905478521581053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 23:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TA3sa3ZF;
 spf=pass (domain: linaro.org, ip: 209.85.128.180, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-46d4840b51fso448688417b3.12
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 23:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E0fQpzEfZC9Pzuj1WN1IU3bAwSJ4AnbweLA15fb40Jc=;
        b=TA3sa3ZFtdB7iucQPpzzQg4617DyRxiLIrw315jXiLF58P1DbMHGeaBw0Gq/oSSpBd
         VKMZvqf4tsZXLZADoSsLi+0knLVaPpCmj9iod2MR7coVXb7KAjn9jyXu9hipV+BeTj10
         pAqkvLy08KjONTZ+Y+Wyvfjdh93DQT6ZqDClrz0dnUD7wB3RrDmSwLninp2+Z6UxkavO
         XqMZUrem94/q/9njBb3TLudyjkVMr05JthtTYGVqmiGwAEVtydDgdiz+ezWen4W+55cM
         waXy/vlZ11u8pLXjk3Dqe2lTURWm4D1nFYILaHZ3fAUSPAGsKqnMTw+ki9HIfQ4ImQav
         M3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0fQpzEfZC9Pzuj1WN1IU3bAwSJ4AnbweLA15fb40Jc=;
        b=DncV4vcrarWB203qa7on9O6OC9DbKcId2W/ejqQbywIELBkQOgLyJAu0uyBRl4hSnL
         Jvyr9AB4alqW7HUWpGMdr3cJZ1KXyQaTgnctUwqWby12rFb0t4q07XLOmlWL9BQZWe74
         +uBVJIZdfd1RYIdWT82Xwe4WJ7Ihyugv9yQjYF1eMeXZLD6uBoqm40TFTApchKVkhqpy
         5O081ZkOOpEbX70FW2lVz/Jir3+Th69kBoplCGd/bWNqZlIRC2+RHg9Y+ioVmv3cx0sU
         HjuBDVEXd5o6fVnq6pDdlaKwccNfRR/4kj5WF6VkiPFX81Cps4kZYsvw2whN+PNB7KbY
         zLeg==
X-Gm-Message-State: AFqh2koXX/BafW6PWaT3hrtVFE7zpzg9Nnffh5csAm/dmw5uEEH8UFs1
	6r1tMFFNggGXb2K9JUk0ci1f5AY3CQInyHnHE99/kw==
X-Google-Smtp-Source: AMrXdXvSXpZF9MrQrf2/mbQP4kGLu59p7zoqFahqmKngEsk9EHvFy2BsL8m8R6vWsgo9tLxs+EFIwsEUTfF8nDEAroc=
X-Received: by 2002:a81:4e0c:0:b0:3c4:bc23:82d9 with SMTP id
 c12-20020a814e0c000000b003c4bc2382d9mr7479828ywb.216.1672905477392; Wed, 04
 Jan 2023 23:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20221229071310.4111511-1-raj.khem@gmail.com> <8b9837c04e2f9bb684aa290761e00e9d072e3dba.camel@linuxfoundation.org>
 <CAMKF1sq-Nw9Mdzkg2c-rbmFfcVr4BG=ZikEs4pRr=Kn4URCh5g@mail.gmail.com>
In-Reply-To: <CAMKF1sq-Nw9Mdzkg2c-rbmFfcVr4BG=ZikEs4pRr=Kn4URCh5g@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 5 Jan 2023 08:57:46 +0100
Message-ID: <CAP71WjwpPDqD5Ro7QH4d7xdPCuArsXz4HEX9RiAD-h19M31L3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Update to latest on tip of trunk
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b91f1f05f17fa80f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 07:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175516

--000000000000b91f1f05f17fa80f
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 30, 2022 at 10:14 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Dec 29, 2022 at 3:10 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:
> > > Brings following changes
> > >
> > > * f47a8cdd ldso: fix invalid early references to extern-linkage
> libc.page_size
> > > * 377218cb pthread_atfork: fix return value on malloc failure
> > > * 29e43191 fix double-processing of DT_RELR relocations in ldso
> relocating itself
> > > * b50eb8c3 fix strverscmp comparison of digit sequence with non-digits
> > > * ad5dcd39 fix async thread cancellation stack alignment
> > > * 8f925945 fix return value of gethostby{name[2],addr} with no result
> but no error
> > > * 63402be2 clean up dns_parse_callback
> > > * 0a7b4323 dns response handling: don't treat too many addresses as an
> error
> > > * 41603c77 dns response handling: ignore presence of wrong-type RRs
> > > * cf76df0e fix missing synchronization of pthread TSD keys with MT-fork
> > > * 5ff3eea9 fgets: avoid arithmetic overflow when n==INT_MIN is passed
> > > * d8f35e29 fix AS-safety of close when aio is in use and fd map is
> expanded
> > > * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend
> > > * aebd6a36 fix potential deadlock between multithreaded fork and aio
> > > * d64148a8 fix potential unsynchronized access to killlock state at
> thread exit
> > > * 36b72cd6 fix potential deadlock in dlerror buffer handling at thread
> exit
> > > * 833a4691 configure: disable TBAA optimization because most compilers
> are buggy
> > > * e6e82132 disable MADV_FREE usage in mallocng
> > > * 25e6fee2 remove LFS64 programming interfaces (macro-only) from
> _GNU_SOURCE
> > > * 246f1c81 remove LFS64 symbol aliases; replace with dynamic linker
> remapping
> > > * dec8f0a4 dns query core: detect udp truncation at recv time
> > > * 8c408937 getaddrinfo dns lookup: use larger answer buffer to handle
> long CNAMEs
> > > * 759bf785 arpa/nameser.h: update RR types list
> > > * 51d4669f dns: implement tcp fallback in __res_msend query core
> > > * e2e95176 res_send: use a temp buffer if caller's buffer is under 512
> bytes
> > > * c87d75f2 adapt res_msend DNS query core for working with multiple
> sockets
> > > * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish
> NODATA vs NxDomain
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/recipes-core/musl/musl_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> > > index a72d87ea6f..7749495ec6 100644
> > > --- a/meta/recipes-core/musl/musl_git.bb
> > > +++ b/meta/recipes-core/musl/musl_git.bb
> > > @@ -4,7 +4,7 @@
> > >  require musl.inc
> > >  inherit linuxloader
> > >
> > > -SRCREV = "dc9285ad1dc19349c407072cc48ba70dab86de45"
> > > +SRCREV = "f47a8cdd250d9163fcfb39bf4e9d813957c0b187"
> > >
> > >  BASEVER = "1.2.3"
> > >
> >
> > I tested this with your 3 musl patches and it showed a few issues:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/6421
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6439
> >
>
> I have sent fixes for all the build failures seen in these two builds.
>

I am getting other failures since this patch was merged (
https://github.com/ndechesne/meta-qcom/actions/workflows/daily.yml). When
building e2fsprog for arm 32 bit targets. A snippet of the build log is:

| arm-poky-linux-musleabi-gcc  -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard
-mcpu=cortex-a15 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat
-Wformat-security -Werror=format-security
--sysroot=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot
-I. -I../../lib -I../../../git/lib  -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=/usr/src/debug/e2fsprogs/1.46.5-r0
 -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=/usr/src/debug/e2fsprogs/1.46.5-r0
 -fmacro-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=/usr/src/debug/e2fsprogs/1.46.5-r0
 -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=/usr/src/debug/e2fsprogs/1.46.5-r0
 -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=
 -fmacro-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=
 -fdebug-prefix-map=/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot-native=
 -pthread  -DHAVE_CONFIG_H  -c ../../../git/lib/ext2fs/lookup.c -o lookup.o
| ../../../git/lib/ext2fs/llseek.c:70:22: error: expected declaration
specifiers or '...' before '_llseek'
|    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned
long,offset_high,
|       |                      ^~~~~~~
| ../../../git/lib/ext2fs/llseek.c:70:43: error: unknown type name 'fd'
|    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned
long,offset_high,
|       |                                           ^~
| ../../../git/lib/ext2fs/llseek.c:70:60: error: unknown type name
'offset_high'
|    70 | static _syscall5(int,_llseek,unsigned int,fd,unsigned
long,offset_high,
|       |
 ^~~~~~~~~~~
| ../../../git/lib/ext2fs/llseek.c:71:33: error: unknown type name
'offset_low'; did you mean 'offsetof'?
|    71 |                  unsigned long, offset_low,ext2_loff_t *,result,
|       |                                 ^~~~~~~~~~
|       |                                 offsetof
| ../../../git/lib/ext2fs/llseek.c:71:58: error: unknown type name 'result'
|    71 |                  unsigned long, offset_low,ext2_loff_t *,result,
|       |                                                          ^~~~~~
| ../../../git/lib/ext2fs/llseek.c:72:32: error: unknown type name 'origin'
|    72 |                  unsigned int, origin);
|       |                                ^~~~~~
| ../../../git/lib/ext2fs/llseek.c:67:12: warning: '_llseek' used but never
defined
|    67 | static int _llseek (unsigned int, unsigned long,
|       |            ^~~~~~~
| make[2]: *** [Makefile:689: llseek.o] Error 1

The last known good build was with
acef849931c5ab14ede40c2ea01a22027e34a335, first failure was caught with
64625155eca8399f403b992ec536897f75956baa (both are Poky tree sha).


> Thanks
> -Khem
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175178):
> https://lists.openembedded.org/g/openembedded-core/message/175178
> Mute This Topic: https://lists.openembedded.org/mt/95933622/1279857
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> nicolas.dechesne@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b91f1f05f17fa80f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Dec 30, 2022 at 10:14 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Thu, Dec 29, 2022 at 3:10 PM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, 2022-12-28 at 23:13 -0800, Khem Raj wrote:<br>
&gt; &gt; Brings following changes<br>
&gt; &gt;<br>
&gt; &gt; * f47a8cdd ldso: fix invalid early references to extern-linkage l=
ibc.page_size<br>
&gt; &gt; * 377218cb pthread_atfork: fix return value on malloc failure<br>
&gt; &gt; * 29e43191 fix double-processing of DT_RELR relocations in ldso r=
elocating itself<br>
&gt; &gt; * b50eb8c3 fix strverscmp comparison of digit sequence with non-d=
igits<br>
&gt; &gt; * ad5dcd39 fix async thread cancellation stack alignment<br>
&gt; &gt; * 8f925945 fix return value of gethostby{name[2],addr} with no re=
sult but no error<br>
&gt; &gt; * 63402be2 clean up dns_parse_callback<br>
&gt; &gt; * 0a7b4323 dns response handling: don&#39;t treat too many addres=
ses as an error<br>
&gt; &gt; * 41603c77 dns response handling: ignore presence of wrong-type R=
Rs<br>
&gt; &gt; * cf76df0e fix missing synchronization of pthread TSD keys with M=
T-fork<br>
&gt; &gt; * 5ff3eea9 fgets: avoid arithmetic overflow when n=3D=3DINT_MIN i=
s passed<br>
&gt; &gt; * d8f35e29 fix AS-safety of close when aio is in use and fd map i=
s expanded<br>
&gt; &gt; * 26c76a90 fix use of uninitialized dummy_fut in aio_suspend<br>
&gt; &gt; * aebd6a36 fix potential deadlock between multithreaded fork and =
aio<br>
&gt; &gt; * d64148a8 fix potential unsynchronized access to killlock state =
at thread exit<br>
&gt; &gt; * 36b72cd6 fix potential deadlock in dlerror buffer handling at t=
hread exit<br>
&gt; &gt; * 833a4691 configure: disable TBAA optimization because most comp=
ilers are buggy<br>
&gt; &gt; * e6e82132 disable MADV_FREE usage in mallocng<br>
&gt; &gt; * 25e6fee2 remove LFS64 programming interfaces (macro-only) from =
_GNU_SOURCE<br>
&gt; &gt; * 246f1c81 remove LFS64 symbol aliases; replace with dynamic link=
er remapping<br>
&gt; &gt; * dec8f0a4 dns query core: detect udp truncation at recv time<br>
&gt; &gt; * 8c408937 getaddrinfo dns lookup: use larger answer buffer to ha=
ndle long CNAMEs<br>
&gt; &gt; * 759bf785 arpa/nameser.h: update RR types list<br>
&gt; &gt; * 51d4669f dns: implement tcp fallback in __res_msend query core<=
br>
&gt; &gt; * e2e95176 res_send: use a temp buffer if caller&#39;s buffer is =
under 512 bytes<br>
&gt; &gt; * c87d75f2 adapt res_msend DNS query core for working with multip=
le sockets<br>
&gt; &gt; * 85050ac5 getaddrinfo: add EAI_NODATA error code to distinguish =
NODATA vs NxDomain<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=
=3D"noreferrer" target=3D"_blank">musl_git.bb</a> | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb=
" rel=3D"noreferrer" target=3D"_blank">musl_git.bb</a> b/meta/recipes-core/=
musl/<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank">mu=
sl_git.bb</a><br>
&gt; &gt; index a72d87ea6f..7749495ec6 100644<br>
&gt; &gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=
=3D"noreferrer" target=3D"_blank">musl_git.bb</a><br>
&gt; &gt; +++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=
=3D"noreferrer" target=3D"_blank">musl_git.bb</a><br>
&gt; &gt; @@ -4,7 +4,7 @@<br>
&gt; &gt;=C2=A0 require musl.inc<br>
&gt; &gt;=C2=A0 inherit linuxloader<br>
&gt; &gt;<br>
&gt; &gt; -SRCREV =3D &quot;dc9285ad1dc19349c407072cc48ba70dab86de45&quot;<=
br>
&gt; &gt; +SRCREV =3D &quot;f47a8cdd250d9163fcfb39bf4e9d813957c0b187&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BASEVER =3D &quot;1.2.3&quot;<br>
&gt; &gt;<br>
&gt;<br>
&gt; I tested this with your 3 musl patches and it showed a few issues:<br>
&gt;<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/64/=
builds/6421" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/64/builds/6421</a><br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/=
builds/6439" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/45/builds/6439</a><br>
&gt;<br>
<br>
I have sent fixes for all the build failures seen in these two builds.<br><=
/blockquote><div><br></div><div>I am getting other failures since this patc=
h was merged (<a href=3D"https://github.com/ndechesne/meta-qcom/actions/wor=
kflows/daily.yml" target=3D"_blank">https://github.com/ndechesne/meta-qcom/=
actions/workflows/daily.yml</a>). When building e2fsprog for arm 32 bit tar=
gets. A snippet of the build log is:</div><div><br></div>| arm-poky-linux-m=
usleabi-gcc =C2=A0-mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dhard -mcpu=3Dcor=
tex-a15 -fstack-protector-strong =C2=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -=
Wformat-security -Werror=3Dformat-security --sysroot=3D/oe/build/tmp/work/c=
ortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysr=
oot -I. -I../../lib -I../../../git/lib =C2=A0-O2 -pipe -g -feliminate-unuse=
d-debug-types -fmacro-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vf=
pv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=3D/usr/src/debug/e2fsprogs/=
1.46.5-r0 =C2=A0-fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-=
vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/git=3D/usr/src/debug/e2fsprog=
s/1.46.5-r0 =C2=A0-fmacro-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neo=
n-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=3D/usr/src/debug/e2fs=
progs/1.46.5-r0 =C2=A0-fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf=
-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/build=3D/usr/src/debug/=
e2fsprogs/1.46.5-r0 =C2=A0-fdebug-prefix-map=3D/oe/build/tmp/work/cortexa15=
t2hf-neon-vfpv4-poky-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=3D =
=C2=A0-fmacro-prefix-map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky=
-linux-musleabi/e2fsprogs/1.46.5-r0/recipe-sysroot=3D =C2=A0-fdebug-prefix-=
map=3D/oe/build/tmp/work/cortexa15t2hf-neon-vfpv4-poky-linux-musleabi/e2fsp=
rogs/1.46.5-r0/recipe-sysroot-native=3D =C2=A0-pthread =C2=A0-DHAVE_CONFIG_=
H =C2=A0-c ../../../git/lib/ext2fs/lookup.c -o lookup.o<br>| ../../../git/l=
ib/ext2fs/llseek.c:70:22: error: expected declaration specifiers or &#39;..=
.&#39; before &#39;_llseek&#39;<br>| =C2=A0 =C2=A070 | static _syscall5(int=
,_llseek,unsigned int,fd,unsigned long,offset_high,<br>| =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0^~~~~~~<br>| ../../../git/lib/ext2fs/llseek.c:70:43: error: unknown =
type name &#39;fd&#39;<br>| =C2=A0 =C2=A070 | static _syscall5(int,_llseek,=
unsigned int,fd,unsigned long,offset_high,<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~<br=
>| ../../../git/lib/ext2fs/llseek.c:70:60: error: unknown type name &#39;of=
fset_high&#39;<br>| =C2=A0 =C2=A070 | static _syscall5(int,_llseek,unsigned=
 int,fd,unsigned long,offset_high,<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~<br>| ../../=
../git/lib/ext2fs/llseek.c:71:33: error: unknown type name &#39;offset_low&=
#39;; did you mean &#39;offsetof&#39;?<br>| =C2=A0 =C2=A071 | =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long, offset_low,=
ext2_loff_t *,result,<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^~~~~~~~~~<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 offsetof<br>| ../../../git/lib/ext2fs/llseek.c:71:58: err=
or: unknown type name &#39;result&#39;<br>| =C2=A0 =C2=A071 | =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long, offset_low,=
ext2_loff_t *,result,<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>| ../../../git/lib/ext2fs/llseek.c=
:72:32: error: unknown type name &#39;origin&#39;<br>| =C2=A0 =C2=A072 | =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int,=
 origin);<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~<br>| ../../../git/lib/ext2fs/llseek.c:67:12: warning: &#39;_llsee=
k&#39; used but never defined<br>| =C2=A0 =C2=A067 | static int _llseek (un=
signed int, unsigned long,<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^~~~~~~<br><div>| make[2]: *** [Makefile:689: llseek.o=
] Error 1</div><div><br></div><div>The last known good build was with acef8=
49931c5ab14ede40c2ea01a22027e34a335, first failure was caught with 64625155=
eca8399f403b992ec536897f75956baa (both are Poky tree sha).</div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks<br>
-Khem<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175178): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175178" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175178</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95933622/1279=
857" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95933622/1279857</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:nicolas.dechesne@linaro.or=
g" target=3D"_blank">nicolas.dechesne@linaro.org</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000b91f1f05f17fa80f--

