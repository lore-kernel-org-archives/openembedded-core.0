Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748A1C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 07:37:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9100.1660030672785525850
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 00:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GvLSpvFe;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id l4so13310153wrm.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=fqpbv42xuXGHhK/jsoCBKo9ZOPzlJx6ADhDaG/k6Ano=;
        b=GvLSpvFeaq1nrizcPLxexgzCzpM3anMhkG5E37MBbFnN6MjRLc3pONBW18teIy1oe6
         0bs2+9ZQ8J2OsPDI8crvJhzBVt+ZX24LIEHK7DNjxPwX81LDfssZrOUINZE06DD17tmK
         P5yLKdoukw91k7S+KTwi+kMaTv2aW2FnkUgz2z2kCzlQHBNF5KVzAx2PX1ITGhiRQ2NP
         ZJS5Nymn/83+VMbjL72S87SXxPXbDV/71+XIrA7w78JxmizsFD535rWLm6XuOMIzHeTY
         EgZQE2SnPjeG+tyJXoPRsN9FlXABX7roQpqGJ41T6PXJy+KCSnIGgDf6gL58osACYBzK
         CUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=fqpbv42xuXGHhK/jsoCBKo9ZOPzlJx6ADhDaG/k6Ano=;
        b=wYClkV4YPCJ+WAdiAcvaa8nTD6ZA0CJdvWEUE3KtzIVWFBBamcMTT6XtfaXCvOdp3y
         xaAcmuScK9aZ1mvyfpa2Y3sfzQ+zhsnAAdeSq0zgk3pMk+DwOnmNen6w7KvdHs24EbyM
         DEVqVhAD07apXYZG+ULrL6Er3RUbb9E6i10BCAlf1zRvCq5a+T1FgfRq+QV86YwLn36w
         e8iMLIROrXxZWC1AIMN7L1Ez0s4vptmeahJ7pYh3bWRrgddO9Je/9sMToPG6SWPtgcKD
         wrp/JC3ScM6w63d5dQG7FL5ucimM9ea4QTuE1DtB7UeSr2xW99huZyYCuluYpPVQiiud
         TDYQ==
X-Gm-Message-State: ACgBeo2duhO4c+pn4uF55l0eywasLtPf72bSyizNZ9B78MBGeRSLcN9Q
	03MF7gw16YOfId7lMQrFBlwE8WhTjGaOa9TO6fQ=
X-Google-Smtp-Source: 
 AA6agR4x+FS+WW7izyXL4i+YARmZ3AVxULSZqb0tFDNdJO4S1lj2LipW3u2xPkZlnTXJt735PxC6hTCNR2mMKZs/A1g=
X-Received: by 2002:a5d:6e8d:0:b0:21e:48a4:b267 with SMTP id
 k13-20020a5d6e8d000000b0021e48a4b267mr12545049wrz.507.1660030670754; Tue, 09
 Aug 2022 00:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220727072956.15438-1-kai.kang@windriver.com>
 <CA+chaQf7iEzXN-rH5HxjvaveHxg9mPtvh-q-5d_pxoWY=G01Lw@mail.gmail.com>
 <b2aea74e-f82e-c5e1-6d53-753d66360784@windriver.com>
In-Reply-To: <b2aea74e-f82e-c5e1-6d53-753d66360784@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Aug 2022 09:37:03 +0200
Message-ID: 
 <CA+chaQdk4NKJR9VWAw6OR5zunkTznpSfPakuSQs60ZEs_UgdkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] mesa: fix compile error when debug build
 enabled
To: kai <kai.kang@windriver.com>
Cc: Ross.Burton@arm.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007258b905e5ca021e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 07:37:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169139

--0000000000007258b905e5ca021e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No extra config, just nodistro default configuration and short local.conf,
the only thing which affects mesa build might be:
DISTRO_FEATURES:append =3D " opengl wayland vulkan"


On Tue, Aug 9, 2022 at 6:59 AM kai <kai.kang@windriver.com> wrote:

> On 8/8/22 01:35, Martin Jansa wrote:
>
> Hi Mark,
>
> Does this still work for you?
>
>
> Yes, it still works for me. Without that patch, it fails with "DEBUG_BUIL=
D
> =3D '1'" in local.conf for qemux86-64.
>
>
>
> With this change applied (now in master), mesa fails here with:
> http://errors.yoctoproject.org/Errors/Details/664881/
> <https://urldefense.com/v3/__http://errors.yoctoproject.org/Errors/Detail=
s/664881/__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGD=
FlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUn492GZ4$>
>
>
> and builds fine with DEBUG_BUILD when I revert this.
>
> Is there any extra config?  I saw the the error is:
>
> ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining
> failed in call to 'always_inline' 'src_is_ssa': function not considered f=
or
> inlining
>
> Without the commit, it fails with:
>
> | ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining
> failed in call to always_inline =E2=80=98src_is_ssa=E2=80=99: indirect fu=
nction call with a
> yet undetermined callee
> |  src_is_ssa(nir_src *src, void *state)
>
> Regards,
> Kai
>
>
> I've reported the same in upstream MR
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439
> <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-/m=
erge_requests/17439__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVl=
W8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUu70TdHw$>
>
>
>
> On Wed, Jul 27, 2022 at 9:30 AM kai <kai.kang@windriver.com> wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It fails to compile mesa{,-native} when DEBUG_BUILD is enabled:
>>
>> ../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In function
>> =E2=80=98nir_opt_move_block=E2=80=99:
>> ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error: inlining
>> failed in call to
>>   always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call wit=
h a yet
>> undetermined callee
>>  src_is_ssa(nir_src *src, void *state)
>>  ^~~~~~~~~~
>>
>> Backport patch from mesa merge request to fix it.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> v2:
>> * use patch from mesa merge request
>>
>>  ...ove-fix-ALWAYS_INLINE-compiler-error.patch | 65 +++++++++++++++++++
>>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>>  2 files changed, 66 insertions(+)
>>  create mode 100644
>> meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE=
-compiler-error.patch
>>
>> diff --git
>> a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLI=
NE-compiler-error.patch
>> b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLI=
NE-compiler-error.patch
>> new file mode 100644
>> index 0000000000..48fc1e37ff
>> --- /dev/null
>> +++
>> b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLI=
NE-compiler-error.patch
>> @@ -0,0 +1,65 @@
>> +Backport merge request to fix mesa compile error when debug build
>> +enabled.
>> +
>> +Upstream-Status: Submitted [
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439
>> <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-/=
merge_requests/17439__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMV=
lW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUu70TdHw$>
>> ]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From c69c6e7a35205557de73734ad4a1f411c8f99926 Mon Sep 17 00:00:00 2001
>> +From: t bettler <thomas.bettler@gmail.com>
>> +Date: Sat, 9 Jul 2022 09:28:51 +0000
>> +Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=E2=80=
=99
>> +
>> +Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
>> <https://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-/=
issues/6825__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvn=
GDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUf3T6WDU$>
>> +Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1 ("nir/nir_opt_move:
>> handle non-SSA defs ")
>> +---
>> + src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
>> + src/compiler/nir/nir_opt_move.c       |  2 +-
>> + 2 files changed, 9 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/src/compiler/nir/nir_inline_helpers.h
>> b/src/compiler/nir/nir_inline_helpers.h
>> +index 125dd8a537c..ec33f0509f7 100644
>> +--- a/src/compiler/nir/nir_inline_helpers.h
>> ++++ b/src/compiler/nir/nir_inline_helpers.h
>> +@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr, nir_foreach_dest_c=
b
>> cb, void *state)
>> +    return _nir_foreach_dest(instr, cb, state);
>> + }
>> +
>> +-static inline bool
>> +-nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
>> ++static ALWAYS_INLINE bool
>> ++_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
>> + {
>> +    switch (instr->type) {
>> +    case nir_instr_type_alu: {
>> +@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr, nir_foreach_src_c=
b
>> cb, void *state)
>> +    dest_state.cb =3D cb;
>> +    return _nir_foreach_dest(instr, _nir_visit_dest_indirect,
>> &dest_state);
>> + }
>> ++
>> ++static inline bool
>> ++nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
>> ++{
>> ++   return _nir_foreach_src(instr, cb, state);
>> ++}
>> +diff --git a/src/compiler/nir/nir_opt_move.c
>> b/src/compiler/nir/nir_opt_move.c
>> +index 81bcde5c436..051c3cc6295 100644
>> +--- a/src/compiler/nir/nir_opt_move.c
>> ++++ b/src/compiler/nir/nir_opt_move.c
>> +@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
>> + static ALWAYS_INLINE bool
>> + instr_reads_register(nir_instr *instr)
>> + {
>> +-   return !nir_foreach_src(instr, src_is_ssa, NULL);
>> ++   return !_nir_foreach_src(instr, src_is_ssa, NULL);
>> + }
>> +
>> + static bool
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc
>> b/meta/recipes-graphics/mesa/mesa.inc
>> index 710cacb09d..f02ef2dc2b 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -22,6 +22,7 @@ SRC_URI =3D "
>> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
>> <https://urldefense.com/v3/__https://mesa.freedesktop.org/archive/mesa-$=
*7BPV*7D.tar.xz__;JSU!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW=
8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMU7TXzo3Y$>
>> \
>>             file://0001-util-format-Check-for-NEON-before-using-it.patch
>> \
>>
>> file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
>>
>> file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
>> +
>> file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
>>             "
>>
>>  SRC_URI[sha256sum] =3D
>> "b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f093e3"
>> --
>> 2.17.1
>>
>>
>>
>>
>>
> --
> Kai Kang
> Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169132):
> https://lists.openembedded.org/g/openembedded-core/message/169132
> Mute This Topic: https://lists.openembedded.org/mt/92644854/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007258b905e5ca021e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">No extra config, just nodistro default configuration and s=
hort local.conf, the only thing which affects mesa build might be:<div>DIST=
RO_FEATURES:append =3D &quot; opengl wayland vulkan&quot;<br></div><div><br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 9, 2022 at 6:59 AM kai &lt;<a href=3D"mailto:kai.kang@wi=
ndriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <div>On 8/8/22 01:35, Martin Jansa wrote:</div>
    <div><br>
    </div>
    <div>Hi Mark,<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Does this still work for you?</div>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, it still works for me. Without that patch, it fails with
      &quot;DEBUG_BUILD =3D &#39;1&#39;&quot; in local.conf for qemux86-64.=
</p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>With this change applied (now in master), mesa fails here
          with:</div>
        <div><a href=3D"https://urldefense.com/v3/__http://errors.yoctoproj=
ect.org/Errors/Details/664881/__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJ=
fysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUn492GZ4$" target=3D"_bl=
ank">http://errors.yoctoproject.org/Errors/Details/664881/</a><br>
        </div>
      </div>
    </blockquote>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>and builds fine with DEBUG_BUILD when I revert this.</div>
      </div>
    </blockquote>
    <p>Is there any extra config?=C2=A0 I saw the the error is:</p>
    <p>../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
      inlining failed in call to &#39;always_inline&#39; &#39;src_is_ssa&#3=
9;: function
      not considered for inlining</p>
    <p>Without the commit, it fails with:</p>
    <p>| ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
      inlining failed in call to always_inline =E2=80=98src_is_ssa=E2=80=99=
: indirect
      function call with a yet undetermined callee =C2=A0<br>
      |=C2=A0 src_is_ssa(nir_src *src, void *state)<br>
    </p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>I&#39;ve reported the same in upstream MR=C2=A0<a href=3D"http=
s://urldefense.com/v3/__https://gitlab.freedesktop.org/mesa/mesa/-/merge_re=
quests/17439__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyv=
nGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUu70TdHw$" target=3D"_blank">https://gitla=
b.freedesktop.org/mesa/mesa/-/merge_requests/17439</a></div>
      </div>
    </blockquote>
    <br>
    <blockquote type=3D"cite"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 27, 2022 at 9:30
          AM kai &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_b=
lank">kai.kang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"=
_blank">kai.kang@windriver.com</a>&gt;<br>
          <br>
          It fails to compile mesa{,-native} when DEBUG_BUILD is
          enabled:<br>
          <br>
          ../mesa-22.1.3/src/compiler/nir/nir_inline_helpers.h: In
          function =E2=80=98nir_opt_move_block=E2=80=99:<br>
          ../mesa-22.1.3/src/compiler/nir/nir_opt_move.c:55:1: error:
          inlining failed in call to<br>
          =C2=A0 always_inline =E2=80=98src_is_ssa=E2=80=99: indirect funct=
ion call with a
          yet undetermined callee<br>
          =C2=A0src_is_ssa(nir_src *src, void *state)<br>
          =C2=A0^~~~~~~~~~<br>
          <br>
          Backport patch from mesa merge request to fix it.<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.=
com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          v2:<br>
          * use patch from mesa merge request<br>
          <br>
          =C2=A0...ove-fix-ALWAYS_INLINE-compiler-error.patch | 65
          +++++++++++++++++++<br>
          =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
          =C2=A02 files changed, 66 insertions(+)<br>
          =C2=A0create mode 100644
meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-co=
mpiler-error.patch<br>
          <br>
          diff --git
a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-=
compiler-error.patch
b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-=
compiler-error.patch<br>
          new file mode 100644<br>
          index 0000000000..48fc1e37ff<br>
          --- /dev/null<br>
          +++
b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-=
compiler-error.patch<br>
          @@ -0,0 +1,65 @@<br>
          +Backport merge request to fix mesa compile error when debug
          build<br>
          +enabled.<br>
          +<br>
          +Upstream-Status: Submitted [<a href=3D"https://urldefense.com/v3=
/__https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439__;!!Ajve=
Ydw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU=
_Mv0NvgxptSMUu70TdHw$" rel=3D"noreferrer" target=3D"_blank">https://gitlab.=
freedesktop.org/mesa/mesa/-/merge_requests/17439</a>]<br>
          +<br>
          +Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver=
.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
          +<br>
          +From c69c6e7a35205557de73734ad4a1f411c8f99926 Mon Sep 17
          00:00:00 2001<br>
          +From: t bettler &lt;<a href=3D"mailto:thomas.bettler@gmail.com" =
target=3D"_blank">thomas.bettler@gmail.com</a>&gt;<br>
          +Date: Sat, 9 Jul 2022 09:28:51 +0000<br>
          +Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler
          error<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +fix call to =E2=80=98always_inline=E2=80=99 =E2=80=98src_is_ssa=
=E2=80=99<br>
          +<br>
          +Closes: <a href=3D"https://urldefense.com/v3/__https://gitlab.fr=
eedesktop.org/mesa/mesa/-/issues/6825__;!!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHck=
Qo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwWpwCeU_Mv0NvgxptSMUf3T6WDU$" rel=3D=
"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/i=
ssues/6825</a><br>
          +Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1
          (&quot;nir/nir_opt_move: handle non-SSA defs &quot;)<br>
          +---<br>
          + src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--<br>
          + src/compiler/nir/nir_opt_move.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
          + 2 files changed, 9 insertions(+), 3 deletions(-)<br>
          +<br>
          +diff --git a/src/compiler/nir/nir_inline_helpers.h
          b/src/compiler/nir/nir_inline_helpers.h<br>
          +index 125dd8a537c..ec33f0509f7 100644<br>
          +--- a/src/compiler/nir/nir_inline_helpers.h<br>
          ++++ b/src/compiler/nir/nir_inline_helpers.h<br>
          +@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr,
          nir_foreach_dest_cb cb, void *state)<br>
          +=C2=A0 =C2=A0 return _nir_foreach_dest(instr, cb, state);<br>
          + }<br>
          + <br>
          +-static inline bool<br>
          +-nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          ++static ALWAYS_INLINE bool<br>
          ++_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          + {<br>
          +=C2=A0 =C2=A0 switch (instr-&gt;type) {<br>
          +=C2=A0 =C2=A0 case nir_instr_type_alu: {<br>
          +@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr,
          nir_foreach_src_cb cb, void *state)<br>
          +=C2=A0 =C2=A0 dest_state.cb =3D cb;<br>
          +=C2=A0 =C2=A0 return _nir_foreach_dest(instr, _nir_visit_dest_in=
direct,
          &amp;dest_state);<br>
          + }<br>
          ++<br>
          ++static inline bool<br>
          ++nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb,
          void *state)<br>
          ++{<br>
          ++=C2=A0 =C2=A0return _nir_foreach_src(instr, cb, state);<br>
          ++}<br>
          +diff --git a/src/compiler/nir/nir_opt_move.c
          b/src/compiler/nir/nir_opt_move.c<br>
          +index 81bcde5c436..051c3cc6295 100644<br>
          +--- a/src/compiler/nir/nir_opt_move.c<br>
          ++++ b/src/compiler/nir/nir_opt_move.c<br>
          +@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)<br>
          + static ALWAYS_INLINE bool<br>
          + instr_reads_register(nir_instr *instr)<br>
          + {<br>
          +-=C2=A0 =C2=A0return !nir_foreach_src(instr, src_is_ssa, NULL);<=
br>
          ++=C2=A0 =C2=A0return !_nir_foreach_src(instr, src_is_ssa, NULL);=
<br>
          + }<br>
          + <br>
          + static bool<br>
          +-- <br>
          +2.34.1<br>
          +<br>
          diff --git a/meta/recipes-graphics/mesa/mesa.inc
          b/meta/recipes-graphics/mesa/mesa.inc<br>
          index 710cacb09d..f02ef2dc2b 100644<br>
          --- a/meta/recipes-graphics/mesa/mesa.inc<br>
          +++ b/meta/recipes-graphics/mesa/mesa.inc<br>
          @@ -22,6 +22,7 @@ SRC_URI =3D &quot;<a href=3D"https://urldefense=
.com/v3/__https://mesa.freedesktop.org/archive/mesa-$*7BPV*7D.tar.xz__;JSU!=
!AjveYdw8EvQ!fJX82CjYkZXv1aLFsDHckQo9_SiJfysklCtNMVlW8GPSyvnGDFlKkBZpdNWKwW=
pwCeU_Mv0NvgxptSMU7TXzo3Y$" rel=3D"noreferrer" target=3D"_blank">https://me=
sa.freedesktop.org/archive/mesa-${PV}.tar.xz</a>
          \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          <a>file://0001-util-format-Check-for-NEON-before-using-it.patch</=
a> \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          <a>file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and=
-d.patch</a>
          \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          <a>file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDR=
I2.patch</a>
          \<br>
          +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
          =C2=A0<a>file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-=
error.patch</a>
          \<br>
          =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
          <br>
          =C2=A0SRC_URI[sha256sum] =3D
          &quot;b98f32ba7aa2a1ff5725fb36eb999c693079f0ca16f70aa2f103e2b6c3f=
093e3&quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#169132): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/169132" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/169132</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92644854/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92644854/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000007258b905e5ca021e--

