Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E80B1C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 17:12:05 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.54679.1638810724604998850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZsgWRHJ/;
 spf=pass (domain: gmail.com, ip: 209.85.222.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id w23so21007487uao.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oOLP0DjhMMEWkEbhSLZ5T1NQwxTO2/Gc0SF5ce3BiTQ=;
        b=ZsgWRHJ/RGYRKtlowFjhCFFAgHU2Yebl83lCWe3iFDo7ytlhpGs8d4xKSvsCkMMQpo
         EsxtQP1gpjUytirqw6Q/2FbgSV75u4BvX0xgED7a/nCzbPLCV+8ODH1bC0vD0KPBg6Lj
         738ucipjDicrGy3LDO5q/wwmYmWG+uC4XLdovmOcOqli2nyQJID9BudnR4xd5EnyfXWJ
         RlIvVxkcChAGwTMMpYqWZUsb92++h23AiyVu8JXRzZkWwEl9HMwHC0E/bm9SsWOoqlvm
         pzq2UDRjM766FGhsGv/9IFQZp7x1xOF85EV8tD1F+ZLbQUwtREsCQOdN0kGkjHJ4y54c
         Iodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oOLP0DjhMMEWkEbhSLZ5T1NQwxTO2/Gc0SF5ce3BiTQ=;
        b=cKnGNViD3wlOfOEWJbnpl2/bv3GUj3/4gAnnIgFyxk5l1YoYvwY4CcUOIyGRg+a7Wf
         J2rRe99eoy6hVfJVFfWMh4zWuFlv55X85vgcWqIFpUlnr8P9eZ2uwt6YwgIwdoOpil9N
         JUjJar51dUfeIyVvnIHyRVQBHDCUJm4q2VseCyJmewyGIm1lPKm0LmUzZrjJ78ohGkgL
         yLD6sfmH2zpIFiMLcaqiFWZTp4MpZSqVVHW22uDw/rVItMaCRTIMBR6JdoAQswFvqUds
         wJFXXpLh2IJUdHcfvnp7rG5gyu7FlcVMT71TqxWd/+RZWNeFTwVbdmkAIgq9ZixLJGxz
         03kg==
X-Gm-Message-State: AOAM531xor+QXCtpSAZHKnVsLEC7UF/H7AQp3TPzoKP0uU5AyKfGsc1I
	EoE1RWimJbwK1WV8Fe9+qNgjDveluSwZIMo5kQE=
X-Google-Smtp-Source: 
 ABdhPJxXbts1fpM70xWzknWwgX7lnV+duGIizp7183uZXPHC3HuvzQ4FJlJ49B8adW8MVGbdDrlnHMrMwrRpRYD6wl0=
X-Received: by 2002:a9f:218c:: with SMTP id 12mr39578152uac.71.1638810723489;
 Mon, 06 Dec 2021 09:12:03 -0800 (PST)
MIME-Version: 1.0
References: <1638835602-3908-1-git-send-email-zhengrq.fnst@fujitsu.com>
In-Reply-To: <1638835602-3908-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 18:11:51 +0100
Message-ID: 
 <CANNYZj-ygh042JRPF2MAu+8mGrO1thb=UstQRCaT-422TLP66g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: upgrade 21.3.0 -> 21.3.1
To: zhengruoqin <zhengrq.fnst@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000007295d05d27d5b78"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 17:12:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159261

--00000000000007295d05d27d5b78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please do not forget mesa-gl recipe as well.

Alex

On Mon, 6 Dec 2021 at 16:06, zhengruoqin <zhengrq.fnst@fujitsu.com> wrote:

> Changelog from 21.3.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> Bug fixes:
> GPU Crash in Yuzu 6600xt 5.15
> [spirv-fuzz] lower_trivial_continues_block: Assertion '!first_instr ||
> instr_is_continue(first_instr)' failed.
> [RADV] Crash in Metro Exodus in Caspain chapter and Sam=E2=80=99s Story
> NIR validation failed after nir_copy_prop
> lima: Corrupted Android-12 UI on Allwinner A64
> RADV/ACO: Rendering glitches in Forza Horizon 5 windshields
> dEQP-GLES31.*imulextended* compiling fp64 glsl 4.00 shader
>
> Changes:
> ir3/ra: Consider reg file size when swapping killed sources
> ir3/lower_pcopy: Fix shr.b illegal copy lowering
> ir3/lower_pcopy: Fix bug with =E2=80=9Cillegal=E2=80=9D copies and swaps
> docs: update sha256sum for 21.3.0
> .pick_status.json: Update to 1ba231fb75be5bffd806cbd09ac285d1f8f15e3d
> ci: temporarily disable lima CI
> broadcom/compiler: don=E2=80=99t allow RF writes from signals after thren=
d
> broadcom/compiler: fix scoreboard locking checks
> broadcom/compiler: don=E2=80=99t move ldvary earlier if current instructi=
on has
> ldunif
> glsl/nir: Don=E2=80=99t build soft float64 when it cannot be used
> intel/nir: also allow unknown format for getting the size of a storage
> image
> iris: Make a helper function for cross-batch dependency flushing
> iris: Check for cross-batch flushing whenever a buffer is newly written.
> iris: Tidy code in iris_use_pinned_bo a bit
> anv: don=E2=80=99t try to close fd =3D -1
> intel/fs: fix shader call lowering pass
> util/u_trace: refcount payloads
> android: define cpp_rtti=3Dfalse because libLLVM is built w/o RTTI (v2)
> zink: block suballocator caching for swapchain/dmabuf images
> zink: set suballocator bo size to aligned allocation size
> zink: stop using VK_IMAGE_LAYOUT_PREINITIALIZED for dmabuf
> zink: always set matching resource export type for dmabuf creation
> zink: fix memory availability reporting
> zink: fail context creation more gracefully
> nir: Fix read depth for predecessors
> glx/dri3: fix glXQueryContext does not return GLX_RENDER_TYPE value
> aco/spill: use spills_entry instead of spills_exit to kill linear VGPRs
> spirv: run nir_copy_prop before nir_rematerialize_derefs_in_use_blocks_im=
pl
> nir/dce: fix DCE of loops with a halt or return instruction in the
> pre-header
> aco: don=E2=80=99t create DPP instructions with SGPR operands
> android.mk: Add missing variables to the make target
> radv: disable HTILE for D32S8 format and mipmaps on GFX10
> radv: fix emitting VBO when vertex input dynamic state is used
> radv: add a workaround to fix a segfault with Metro Exodus (Linux native)
> radv: fix resetting the entire vertex input dynamic state
> svga: fix bitwise/logical and mixup
> lima: disasm: use last argument as a filename
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc                           | 2 +-
>  meta/recipes-graphics/mesa/{mesa_21.3.0.bb =3D> mesa_21.3.1.bb} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/mesa/{mesa_21.3.0.bb =3D> mesa_21.3.1.bb}
> (100%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc
> b/meta/recipes-graphics/mesa/mesa.inc
> index ed60d98250..e99ec6961b 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -21,7 +21,7 @@ SRC_URI =3D "
> https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>
> file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>             "
>
> -SRC_URI[sha256sum] =3D
> "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
> +SRC_URI[sha256sum] =3D
> "2b0dc2540cb192525741d00f706dbc4586349185dafc65729c7fda0800cc474d"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>
> diff --git a/meta/recipes-graphics/mesa/mesa_21.3.0.bb
> b/meta/recipes-graphics/mesa/mesa_21.3.1.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_21.3.0.bb
> rename to meta/recipes-graphics/mesa/mesa_21.3.1.bb
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159237):
> https://lists.openembedded.org/g/openembedded-core/message/159237
> Mute This Topic: https://lists.openembedded.org/mt/87541536/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000007295d05d27d5b78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please do not forget mesa-gl recipe as well.</div><di=
v><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Mon, 6 Dec 2021 at 16:06, zhengruoqin &lt=
;<a href=3D"mailto:zhengrq.fnst@fujitsu.com">zhengrq.fnst@fujitsu.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Change=
log from 21.3.0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
Bug fixes:<br>
GPU Crash in Yuzu 6600xt 5.15<br>
[spirv-fuzz] lower_trivial_continues_block: Assertion &#39;!first_instr || =
instr_is_continue(first_instr)&#39; failed.<br>
[RADV] Crash in Metro Exodus in Caspain chapter and Sam=E2=80=99s Story<br>
NIR validation failed after nir_copy_prop<br>
lima: Corrupted Android-12 UI on Allwinner A64<br>
RADV/ACO: Rendering glitches in Forza Horizon 5 windshields<br>
dEQP-GLES31.*imulextended* compiling fp64 glsl 4.00 shader<br>
<br>
Changes:<br>
ir3/ra: Consider reg file size when swapping killed sources<br>
ir3/lower_pcopy: Fix shr.b illegal copy lowering<br>
ir3/lower_pcopy: Fix bug with =E2=80=9Cillegal=E2=80=9D copies and swaps<br=
>
docs: update sha256sum for 21.3.0<br>
.pick_status.json: Update to 1ba231fb75be5bffd806cbd09ac285d1f8f15e3d<br>
ci: temporarily disable lima CI<br>
broadcom/compiler: don=E2=80=99t allow RF writes from signals after thrend<=
br>
broadcom/compiler: fix scoreboard locking checks<br>
broadcom/compiler: don=E2=80=99t move ldvary earlier if current instruction=
 has ldunif<br>
glsl/nir: Don=E2=80=99t build soft float64 when it cannot be used<br>
intel/nir: also allow unknown format for getting the size of a storage imag=
e<br>
iris: Make a helper function for cross-batch dependency flushing<br>
iris: Check for cross-batch flushing whenever a buffer is newly written.<br=
>
iris: Tidy code in iris_use_pinned_bo a bit<br>
anv: don=E2=80=99t try to close fd =3D -1<br>
intel/fs: fix shader call lowering pass<br>
util/u_trace: refcount payloads<br>
android: define cpp_rtti=3Dfalse because libLLVM is built w/o RTTI (v2)<br>
zink: block suballocator caching for swapchain/dmabuf images<br>
zink: set suballocator bo size to aligned allocation size<br>
zink: stop using VK_IMAGE_LAYOUT_PREINITIALIZED for dmabuf<br>
zink: always set matching resource export type for dmabuf creation<br>
zink: fix memory availability reporting<br>
zink: fail context creation more gracefully<br>
nir: Fix read depth for predecessors<br>
glx/dri3: fix glXQueryContext does not return GLX_RENDER_TYPE value<br>
aco/spill: use spills_entry instead of spills_exit to kill linear VGPRs<br>
spirv: run nir_copy_prop before nir_rematerialize_derefs_in_use_blocks_impl=
<br>
nir/dce: fix DCE of loops with a halt or return instruction in the pre-head=
er<br>
aco: don=E2=80=99t create DPP instructions with SGPR operands<br>
<a href=3D"http://android.mk" rel=3D"noreferrer" target=3D"_blank">android.=
mk</a>: Add missing variables to the make target<br>
radv: disable HTILE for D32S8 format and mipmaps on GFX10<br>
radv: fix emitting VBO when vertex input dynamic state is used<br>
radv: add a workaround to fix a segfault with Metro Exodus (Linux native)<b=
r>
radv: fix resetting the entire vertex input dynamic state<br>
svga: fix bitwise/logical and mixup<br>
lima: disasm: use last argument as a filename<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@fujitsu.com"=
 target=3D"_blank">zhengrq.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.3.0.bb" rel=3D"=
noreferrer" target=3D"_blank">mesa_21.3.0.bb</a> =3D&gt; <a href=3D"http://=
mesa_21.3.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.3.1.bb</a>} | =
0<br>
=C2=A02 files changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-graphics/mesa/{<a href=3D"http://mesa_21.3.0.bb" =
rel=3D"noreferrer" target=3D"_blank">mesa_21.3.0.bb</a> =3D&gt; <a href=3D"=
http://mesa_21.3.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.3.1.bb<=
/a>} (100%)<br>
<br>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/me=
sa/mesa.inc<br>
index ed60d98250..e99ec6961b 100644<br>
--- a/meta/recipes-graphics/mesa/mesa.inc<br>
+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
@@ -21,7 +21,7 @@ SRC_URI =3D &quot;<a href=3D"https://mesa.freedesktop.org=
/archive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https:=
//mesa.freedesktop.org/archive/mesa-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-futex.h-Define-__NR_f=
utex-if-it-does-not-exist.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7=
bb62c2ec8736eb09ce1&quot;<br>
+SRC_URI[sha256sum] =3D &quot;2b0dc2540cb192525741d00f706dbc4586349185dafc6=
5729c7fda0800cc474d&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(?P&lt;pver&gt;\d+(\.\d+)+)=
&quot;<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.3.0.bb" r=
el=3D"noreferrer" target=3D"_blank">mesa_21.3.0.bb</a> b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_21.3.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_21.3.1.bb</a><br>
similarity index 100%<br>
rename from meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.3.0.bb" re=
l=3D"noreferrer" target=3D"_blank">mesa_21.3.0.bb</a><br>
rename to meta/recipes-graphics/mesa/<a href=3D"http://mesa_21.3.1.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa_21.3.1.bb</a><br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159237): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159237" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159237</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87541536/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87541536/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000007295d05d27d5b78--

