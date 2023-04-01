Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9475BC77B6C
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 19:58:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.30209.1680379104520239013
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 12:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=LTfa9UMQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id o32so14839296wms.1
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 12:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680379103; x=1682971103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tUoYPcpwWpX13r/GlF+jLwbzyFEM77Ghf1u5OrQeQpU=;
        b=LTfa9UMQ78zGbyJ+s8cKHUCHQfryntO8ZG455WZqKj5cNyFqiZ30ZoVkFtZWBukyXF
         Iq9Ygx2eP62lA1Dz9JgHsHTJWkGfE3ER40pGpyPZwg3EAn7h/bRErAdrql4K5BtzDQrJ
         ufi8j6aPRSPNUocLrobBfnCMN2xmWjZ9ZG2RE9Xxy0Um15aYxLMa+p/HD5JBlL9BjyW8
         a0NUU3o1Qz+7f/Se5AekieBH546HLiK7gpkwoHkboOY76bISVk5vLre5kePgwFQX5mWu
         XybPm0x1S8I32HSQLgzHR1Gn2MRIdVy7f7ybFTvD9L9v3elgJz7Jt/T4PT8I0Y61V/po
         AkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680379103; x=1682971103;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoYPcpwWpX13r/GlF+jLwbzyFEM77Ghf1u5OrQeQpU=;
        b=znI2A1ERpzk75c1/geLjRFYn0LiwKtvUXLE/DQ7er4Qe73rvM1TXwV2lHpURu01J35
         oLLBzTRuMwR637wUUicT7NJ4PFGQeo8W+StfS0AD6NmLqNwm6jj8wQjLdfihe52CM1yl
         yo/EpnevxAi9Y7N2mJswLjwpHeIh7ghn0USxZcQGPvOxOGoWU60r73NJs/U+MDDi41aN
         yBg+oGMIgEC8qLeJQD3Q1Lj7DI1byDc0Km3eeRTARyk6JBmC92TaaYFv5dwUPCwRYYeM
         VYDOApkvdFyqCdQlS03nJEq5WyObKfSKf/CW/Davw+dgGBJO8tIwijW4Mjac8JdljPSo
         wEpw==
X-Gm-Message-State: AO0yUKXY0o5xdHGVksjhXSt1Y8dUOgDZUIowwAC8aXceuPuWQ/hIznCi
	ZGGNw0/1zK5cOA9ZQDIx8fkr+xz4NQF7X2VROKs=
X-Google-Smtp-Source: AK7set/nl2dbgAYTtcSjGBjhcb8JBnZn0D4Tq5jYZpvMpMN+Ji71F6ozZ6pW3j8zTGgWqg3/8pzJ1nkGfqqfsspsWbA=
X-Received: by 2002:a1c:790b:0:b0:3eb:5a1e:d524 with SMTP id
 l11-20020a1c790b000000b003eb5a1ed524mr7251389wme.3.1680379102803; Sat, 01 Apr
 2023 12:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230401163241.354257-1-Martin.Jansa@gmail.com> <826207c3d7353efcd21b2d14301bf5ee1c0516cd.camel@linuxfoundation.org>
In-Reply-To: <826207c3d7353efcd21b2d14301bf5ee1c0516cd.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Apr 2023 21:58:11 +0200
Message-ID: <CA+chaQcbqFGLzDLko-h+e1H-nLjQ5A05ZuiRTMgdTj_-WYeJOw@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH] tcmode-default.inc: Add LLVM_PREFERRED_VERSION
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, khem.raj@gmail.com
Content-Type: multipart/alternative; boundary="00000000000082b88c05f84bbf87"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 19:58:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179472

--00000000000082b88c05f84bbf87
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 1, 2023 at 9:29=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2023-04-01 at 18:32 +0200, Martin Jansa wrote:
> > * Allow to independently set P_V for llvm* recipes and actual llvm
> version used in other places
> >
> > * This is needed for meta-clang which provides different llvm version
> from clang recipes, see:
> >   https://github.com/kraj/meta-clang/pull/766
> >   https://lists.openembedded.org/g/bitbake-devel/message/14521
> > * as reported in:
> >   https://lists.openembedded.org/g/bitbake-devel/message/14523
> >   the other places in kirkstone and langdale which use LLVMVERSION
> >   (which doesn't have to be the same as LLVM_PREFERRED_VERSION) are:
> >
> >   meta/classes-recipe/meson.bbclass:llvm-config =3D
> 'llvm-config${LLVMVERSION}'
> >   meta/recipes-graphics/mesa/mesa.inc:MESA_LLVM_RELEASE ?=3D
> "${LLVMVERSION}"
> >
> >   these were removed in mickledore, but there are other places which
> >   use LLVMVERSION as the actual LLVM version as reported in:
> >
> https://github.com/kraj/meta-clang/pull/766#pullrequestreview-1349170591:
> >
> >   meta-intel/dynamic-layers/clang-layer/recipes-opencl/igc/
> intel-graphics-compiler_1.0.12812.24.bb:
> -DIGC_OPTION__LLVM_PREFERRED_VERSION=3D${LLVMVERSION} \
> >   meta-intel/dynamic-layers/clang-layer/recipes-opencl/opencl-clang/
> opencl-clang_14.0.0.bb:
> -DPREFERRED_LLVM_VERSION=3D${LLVMVERSION} \
> >   meta-intel/dynamic-layers/clang-layer/recipes-opencl/opencl-clang/
> opencl-clang_15.0.0.bb:
> -DPREFERRED_LLVM_VERSION=3D${LLVMVERSION} \
> >
>  meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_VERSION_opencl-=
clang
> ?=3D "${@bb.utils.contains('LLVMVERSION', '14.0.3', '14.0.0', '15.0.0', d=
)}"
> >
>  meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_VERSION_opencl-=
clang-native
> ?=3D "${@bb.utils.contains('LLVMVERSION', '14.0.3', '14.0.0', '15.0.0', d=
)}"
> >   meta-riscv/recipes-graphics/mesa/mesa-pvr.inc:MESA_LLVM_RELEASE ?=3D
> "${LLVMVERSION}"
> >   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:#
> Check the LLVMVERSION defined in the meta-clang layer. Given Chromium is
> >   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:#
> developed using new C++ features, the LLVMVERSION has to be >=3D 12.
> Otherwise,
> >   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:
> llvm_version =3D d.getVar('LLVMVERSION', False)
> >   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:
>   bb.fatal("Your LLVMVERSION (%s) is lower than the minimum required "
> >   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:
>            "LLVMVERSION (%s). If you are using dunfell, make sure you "
> >   meta-clang/conf/layer.conf:LLVMVERSION =3D "16.0.0"
> >   meta-clang/recipes-devtools/spirv-llvm-translator/
> spirv-llvm-translator_git.bb:        -DBASE_LLVM_VERSION=3D${LLVMVERSION}=
 \
> >   meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bcc/
> bcc_0.26.0.bb:    -DLLVM_PACKAGE_VERSION=3D${LLVMVERSION} \
> >   meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bpftrac=
e/
> bpftrace_0.17.0.bb:    pvsplit =3D d.getVar('LLVMVERSION').split('.')
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index 30408e0729..2a3074b940 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -24,7 +24,11 @@ GLIBCVERSION ?=3D "2.37"
> >  LINUXLIBCVERSION ?=3D "6.1%"
> >  QEMUVERSION ?=3D "7.2%"
> >  GOVERSION ?=3D "1.20%"
> > -LLVMVERSION ?=3D "15.%"
> > +# Allow to independently set P_V for llvm* recipes and actual llvm
> version used in other places
> > +# This is needed for meta-clang which provides different llvm version
> from clang recipes, see:
> > +# https://github.com/kraj/meta-clang/pull/766
> > +LLVM_PREFERRED_VERSION ?=3D "15.%"
> > +LLVMVERSION ?=3D "${LLVM_PREFERRED_VERSION}"
> >  RUSTVERSION ?=3D "1.67%"
> >
>
> I don't think someone coming to this is going to understand whether
> they should set LLVMVERSION or LLVM_PREFERRED_VERSION.
>
> I also don't think someone is going to know which one to use if they
> ever do reference an llvm version in a recipe.
>
> Can we find a more descriptive name for one of them that would make
> things clearer?
>

I'm open to suggestions (and one of the reasons this was sent as RFC),
LLVM_PREFERRED_VERSION was the best one I found.

It doesn't help that the commit message says "read this, then read
> this, then read this, then things might make sense". Commit messages
> are meant to explain things in their own right. Linking to things for
> more information is fine but this is relying on that far too much.


The first line explains why this is needed, the rest are "details" and from
those referenced links I've tried to copy the most relevant parts.

I was confused at first why warning about P_V didn't work in this case,
that's why I've shared much longer description on bitbake-devel and then
meta-clang PR. Now after reminding myself how P_V works and why it needs to
behave like that, it's quite clear to me what was happening - and I really
don't know if someone else would need the same P_V refresh.

Is this better?

LLVM_PREFERRED_VERSION is used only to set PREFERRED_VERSION of llvm
recipes and you might need to change it only if your layer provides another
set of llvm recipes with different version.

LLVMVERSION is the actual version of LLVM used during the build (and it can
be different from llvm recipes, e.g. when LLVM is provided by clang recipes
based on PREFERRED_PROVIDER setting and meta-clang already sets LLVMVERSION
in layer.conf).

PREFERRED_VERSION_llvm doesn't affect version of clang recipes even when
clang provides llvm, only PREFERRED_VERSION_clang would affect that.

--00000000000082b88c05f84bbf87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Apr 1, 2023 at 9:29=E2=80=AFPM Ri=
chard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2023-04-01=
 at 18:32 +0200, Martin Jansa wrote:<br>
&gt; * Allow to independently set P_V for llvm* recipes and actual llvm ver=
sion used in other places<br>
&gt; <br>
&gt; * This is needed for meta-clang which provides different llvm version =
from clang recipes, see:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/kraj/meta-clang/pull/766" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/kraj/meta-clang/pull/=
766</a><br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/bitbake-devel/=
message/14521" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/g/bitbake-devel/message/14521</a><br>
&gt; * as reported in:<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://lists.openembedded.org/g/bitbake-devel/=
message/14523" rel=3D"noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/g/bitbake-devel/message/14523</a><br>
&gt;=C2=A0 =C2=A0the other places in kirkstone and langdale which use LLVMV=
ERSION<br>
&gt;=C2=A0 =C2=A0(which doesn&#39;t have to be the same as LLVM_PREFERRED_V=
ERSION) are:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0meta/classes-recipe/meson.bbclass:llvm-config =3D &#39;llv=
m-config${LLVMVERSION}&#39;<br>
&gt;=C2=A0 =C2=A0meta/recipes-graphics/mesa/mesa.inc:MESA_LLVM_RELEASE ?=3D=
 &quot;${LLVMVERSION}&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0these were removed in mickledore, but there are other plac=
es which<br>
&gt;=C2=A0 =C2=A0use LLVMVERSION as the actual LLVM version as reported in:=
<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/kraj/meta-clang/pull/766#pul=
lrequestreview-1349170591" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/kraj/meta-clang/pull/766#pullrequestreview-1349170591</a>:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0meta-intel/dynamic-layers/clang-layer/recipes-opencl/igc/<=
a href=3D"http://intel-graphics-compiler_1.0.12812.24.bb" rel=3D"noreferrer=
" target=3D"_blank">intel-graphics-compiler_1.0.12812.24.bb</a>:=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -DIGC_OPTION__LLVM_PRE=
FERRED_VERSION=3D${LLVMVERSION} \<br>
&gt;=C2=A0 =C2=A0meta-intel/dynamic-layers/clang-layer/recipes-opencl/openc=
l-clang/<a href=3D"http://opencl-clang_14.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">opencl-clang_14.0.0.bb</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DPREFERRED_LLVM_VERSION=3D${LLVMVERSION} \<br>
&gt;=C2=A0 =C2=A0meta-intel/dynamic-layers/clang-layer/recipes-opencl/openc=
l-clang/<a href=3D"http://opencl-clang_15.0.0.bb" rel=3D"noreferrer" target=
=3D"_blank">opencl-clang_15.0.0.bb</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DPREFERRED_LLVM_VERSION=3D${LLVMVERSION} \<br>
&gt;=C2=A0 =C2=A0meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_V=
ERSION_opencl-clang ?=3D &quot;${@bb.utils.contains(&#39;LLVMVERSION&#39;, =
&#39;14.0.3&#39;, &#39;14.0.0&#39;, &#39;15.0.0&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_V=
ERSION_opencl-clang-native ?=3D &quot;${@bb.utils.contains(&#39;LLVMVERSION=
&#39;, &#39;14.0.3&#39;, &#39;14.0.0&#39;, &#39;15.0.0&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0meta-riscv/recipes-graphics/mesa/mesa-pvr.inc:MESA_LLVM_RE=
LEASE ?=3D &quot;${LLVMVERSION}&quot;<br>
&gt;=C2=A0 =C2=A0meta-browser/meta-chromium/recipes-browser/chromium/chromi=
um-gn.inc:# Check the LLVMVERSION defined in the meta-clang layer. Given Ch=
romium is<br>
&gt;=C2=A0 =C2=A0meta-browser/meta-chromium/recipes-browser/chromium/chromi=
um-gn.inc:# developed using new C++ features, the LLVMVERSION has to be &gt=
;=3D 12. Otherwise,<br>
&gt;=C2=A0 =C2=A0meta-browser/meta-chromium/recipes-browser/chromium/chromi=
um-gn.inc:=C2=A0 llvm_version =3D d.getVar(&#39;LLVMVERSION&#39;, False)<br=
>
&gt;=C2=A0 =C2=A0meta-browser/meta-chromium/recipes-browser/chromium/chromi=
um-gn.inc:=C2=A0 =C2=A0 bb.fatal(&quot;Your LLVMVERSION (%s) is lower than =
the minimum required &quot;<br>
&gt;=C2=A0 =C2=A0meta-browser/meta-chromium/recipes-browser/chromium/chromi=
um-gn.inc:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;LLVMVERSION=
 (%s). If you are using dunfell, make sure you &quot;<br>
&gt;=C2=A0 =C2=A0meta-clang/conf/layer.conf:LLVMVERSION =3D &quot;16.0.0&qu=
ot;<br>
&gt;=C2=A0 =C2=A0meta-clang/recipes-devtools/spirv-llvm-translator/<a href=
=3D"http://spirv-llvm-translator_git.bb" rel=3D"noreferrer" target=3D"_blan=
k">spirv-llvm-translator_git.bb</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DBASE_LLVM=
_VERSION=3D${LLVMVERSION} \<br>
&gt;=C2=A0 =C2=A0meta-clang/dynamic-layers/openembedded-layer/recipes-devto=
ols/bcc/<a href=3D"http://bcc_0.26.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">bcc_0.26.0.bb</a>:=C2=A0 =C2=A0 -DLLVM_PACKAGE_VERSION=3D${LLVMVERSION} =
\<br>
&gt;=C2=A0 =C2=A0meta-clang/dynamic-layers/openembedded-layer/recipes-devto=
ols/bpftrace/<a href=3D"http://bpftrace_0.17.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bpftrace_0.17.0.bb</a>:=C2=A0 =C2=A0 pvsplit =3D d.getVar(&#39=
;LLVMVERSION&#39;).split(&#39;.&#39;)<br>
&gt; <br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc | 12 ++++++++----<br=
>
&gt;=C2=A0 1 file changed, 8 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc<br>
&gt; index 30408e0729..2a3074b940 100644<br>
&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; @@ -24,7 +24,11 @@ GLIBCVERSION ?=3D &quot;2.37&quot;<br>
&gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;6.1%&quot;<br>
&gt;=C2=A0 QEMUVERSION ?=3D &quot;7.2%&quot;<br>
&gt;=C2=A0 GOVERSION ?=3D &quot;1.20%&quot;<br>
&gt; -LLVMVERSION ?=3D &quot;15.%&quot;<br>
&gt; +# Allow to independently set P_V for llvm* recipes and actual llvm ve=
rsion used in other places<br>
&gt; +# This is needed for meta-clang which provides different llvm version=
 from clang recipes, see:<br>
&gt; +# <a href=3D"https://github.com/kraj/meta-clang/pull/766" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/kraj/meta-clang/pull/766</a><b=
r>
&gt; +LLVM_PREFERRED_VERSION ?=3D &quot;15.%&quot;<br>
&gt; +LLVMVERSION ?=3D &quot;${LLVM_PREFERRED_VERSION}&quot;<br>
&gt;=C2=A0 RUSTVERSION ?=3D &quot;1.67%&quot;<br>
&gt; <br>
<br>
I don&#39;t think someone coming to this is going to understand whether<br>
they should set LLVMVERSION or LLVM_PREFERRED_VERSION.<br>
<br>
I also don&#39;t think someone is going to know which one to use if they<br=
>
ever do reference an llvm version in a recipe.<br>
<br>
Can we find a more descriptive name for one of them that would make<br>
things clearer?<br></blockquote><div><br></div><div>I&#39;m open to suggest=
ions (and one of the reasons this was sent as RFC), LLVM_PREFERRED_VERSION=
=C2=A0was the best one I found.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
It doesn&#39;t help that the commit message says &quot;read this, then read=
<br>
this, then read this, then things might make sense&quot;. Commit messages<b=
r>
are meant to explain things in their own right. Linking to things for<br>
more information is fine but this is relying on that far too much.</blockqu=
ote><div><br></div><div>The first line explains why this is needed, the res=
t are &quot;details&quot; and from those referenced links I&#39;ve tried to=
 copy the most relevant parts.</div><div><br></div><div>I was confused at f=
irst why warning about P_V didn&#39;t work in this case, that&#39;s why I&#=
39;ve shared much longer description on bitbake-devel and then meta-clang P=
R. Now after reminding myself how P_V works and why it needs to behave like=
 that, it&#39;s quite clear to me what was happening - and I really don&#39=
;t know if someone else would need the same P_V refresh.</div><div><br></di=
v><div>Is this better?</div><div><br></div><div>LLVM_PREFERRED_VERSION is u=
sed only to set PREFERRED_VERSION of llvm recipes and you might need to cha=
nge it only if your layer provides another set of llvm recipes with differe=
nt version.<br></div><div><br></div><div>LLVMVERSION is the actual version =
of LLVM used during the build (and it can be different from llvm recipes, e=
.g. when LLVM is provided by clang recipes based on PREFERRED_PROVIDER sett=
ing and meta-clang already sets LLVMVERSION in layer.conf).</div><div><br><=
/div><div>PREFERRED_VERSION_llvm doesn&#39;t affect version of clang recipe=
s even when clang provides llvm, only PREFERRED_VERSION_clang would affect =
that.<br></div></div></div>

--00000000000082b88c05f84bbf87--

