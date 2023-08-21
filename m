Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81620EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 08:35:18 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.6631.1692606916534612754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 01:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ldeIIgWS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe4762173bso4564117e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 01:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692606914; x=1693211714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sD1b6RVzw+BpYdzj7rZtRevtfO0S6cqz1rOSFhUQRwU=;
        b=ldeIIgWStu1R7mpdXMcKfZPiL4Z0Sh87rn66y9W3O+Rzyi6rvlDLmk/OMKMY4iSncE
         z0eSFYpeu/stHX6X3TJ/2okxQ7i+4iXNPYMyXHbdDPla/DwBPVgqQuoOr5k00Ivrkq0C
         7cXz+ZUXYTnBKBWKCsZk84LleIl8kcpxGfVbgdnVt9SdOHN9fOiVcn193sKIvoRSukRQ
         qDP3z0y5/gfNRRw5mpyMoKuwiiYVkTugg6Yg/Hmnbf3TnAvCmRjNE3VkKDuLj2V1qlOR
         fQYPKRdlph7rXSdW8WCC5ge3b2sNJt+KXRej10fXsfZE0eaCHAN2uFkkulYTVPLNdTwr
         8AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692606914; x=1693211714;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sD1b6RVzw+BpYdzj7rZtRevtfO0S6cqz1rOSFhUQRwU=;
        b=O1I3+VFDo8Dt15ye1g4poxh6dIXoJ1w2ixwZoZTY7jybx49LkpLDMbMlQrS04lhtJ1
         bf3BcGdsDdWACYZWVlwzyGo6vVqlALga0ZHFYRGlnsfrQCZZUCAYZjnME0t+59AuClAC
         8/gQuUOrNo/X6Pn2Ec4tO576Arg3AdhjkHgYaBvlK0UaSyYxJCdQxDIkvsfZVoMn8way
         Zd//XIPy//3AoA8yhVGJNL18HbdOu0Dzkru7yy944HAkCMgjyWdpbp+6VE5Lf4oOrgUx
         awk+LwM3APtKRq2YFtL4gAhfiGmyPxtnvh27/RMCAgMA2pOYhGp1fzAGLKolr+spRZ3g
         paiA==
X-Gm-Message-State: AOJu0Yws1wLeF4t1s7MsxM06gr9YpmmLJw3b31L8qqHwpdkkxfJoxNhy
	uPScdnUdMyyCHFl9eY1cPplZooh7HRYPuAI2S+M9e+zn
X-Google-Smtp-Source: AGHT+IGCrmnqIuVWaI1/A8C/kZrIqFUKEwSofwde32rImeBe9hwqqcghflPl8Apof4iJZUb+Lpy69vEXk7m7JhwP7PM=
X-Received: by 2002:ac2:5bde:0:b0:4fe:63cf:6048 with SMTP id
 u30-20020ac25bde000000b004fe63cf6048mr3283814lfn.43.1692606913846; Mon, 21
 Aug 2023 01:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230821023652.47360-1-kai.kang@windriver.com>
In-Reply-To: <20230821023652.47360-1-kai.kang@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Aug 2023 10:35:03 +0200
Message-ID: <CANNYZj9DBLh3h-Jo699v-K-m8ds-5r_perA95K9L-7Z0ZECNMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] llvm: remove libLTO.so.*
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d8203706036ac159"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186422

--000000000000d8203706036ac159
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But shouldn=E2=80=99t this be backwards? If building llvm results in instal=
ling the
item, then it=E2=80=99s other recipes that need to ensure they don=E2=80=99=
t clash with it.
Patching out llvm after the fact in do_install seems incorrect.

Alex

On Mon 21. Aug 2023 at 4.37, Kai Kang <kai.kang@eng.windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Remove libLTO.so.* from llvm which should be provided by clang and
> packaged to llvm-linker-tools. It could avoids the error:
>
> ERROR: clang-16.0.6-r0 do_create_spdx: The recipe clang is trying to
>        install files into a shared area when those files already exist.
>        Those files and their manifest location are:
>   /path_to/tmp/deploy/spdx/core2-64/packages/liblto16.spdx.json
>     (matched in manifest-core2-64-llvm.create_spdx)
> Please verify which recipe should provide the above files.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/llvm/llvm_git.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_git.bb
> b/meta/recipes-devtools/llvm/llvm_git.bb
> index f3d6f24bd2..ce9ebfa997 100644
> --- a/meta/recipes-devtools/llvm/llvm_git.bb
> +++ b/meta/recipes-devtools/llvm/llvm_git.bb
> @@ -106,7 +106,7 @@ do_compile() {
>
>  do_install() {
>      if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false',
> d)}; then
> -       DESTDIR=3D${D} ninja -v install
> +        DESTDIR=3D${D} ninja -v install
>
>          # llvm harcodes usr/lib as install path, so this corrects it to
> actual libdir
>          mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
> @@ -117,6 +117,10 @@ do_install() {
>
>          # reproducibility
>          sed -i -e 's,${WORKDIR},,g'
> ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
> +
> +        # remove libLTO.so.* which should be provided by clang and
> packaged to
> +        # llvm-linker-tools
> +        rm -f ${D}/${libdir}/libLTO.so.*
>      fi
>  }
>
> @@ -134,7 +138,7 @@ llvm_sysroot_preprocess() {
>         ln -sf llvm-config
> ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
>  }
>
> -PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm
> ${PN}-liboptremarks ${PN}-liblto"
> +PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm
> ${PN}-liboptremarks"
>
>  RRECOMMENDS:${PN}-dev +=3D "${PN}-bugpointpasses ${PN}-llvmhello
> ${PN}-liboptremarks"
>
> @@ -146,10 +150,6 @@ FILES:${PN}-libllvm =3D "\
>      ${libdir}/libLLVM-${MAJOR_VERSION}.so \
>  "
>
> -FILES:${PN}-liblto +=3D "\
> -    ${libdir}/libLTO.so.* \
> -"
> -
>  FILES:${PN}-liboptremarks +=3D "\
>      ${libdir}/libRemarks.so.* \
>  "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186419):
> https://lists.openembedded.org/g/openembedded-core/message/186419
> Mute This Topic: https://lists.openembedded.org/mt/100866486/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d8203706036ac159
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">But shouldn=E2=80=99t this be backwards? If building llvm=
 results in installing the item, then it=E2=80=99s other recipes that need =
to ensure they don=E2=80=99t clash with it. Patching out llvm after the fac=
t in do_install seems incorrect.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon 21. Aug 2023 at 4.37, Kai Kang &lt;<a href=3D"mai=
lto:kai.kang@eng.windriver.com">kai.kang@eng.windriver.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@wind=
river.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Remove libLTO.so.* from llvm which should be provided by clang and<br>
packaged to llvm-linker-tools. It could avoids the error:<br>
<br>
ERROR: clang-16.0.6-r0 do_create_spdx: The recipe clang is trying to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0install files into a shared area when those file=
s already exist.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Those files and their manifest location are:<br>
=C2=A0 /path_to/tmp/deploy/spdx/core2-64/packages/liblto16.spdx.json<br>
=C2=A0 =C2=A0 (matched in manifest-core2-64-llvm.create_spdx)<br>
Please verify which recipe should provide the above files.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">llvm_git.bb</a> | 12 ++++++------<br>
=C2=A01 file changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=
=3D"noreferrer" target=3D"_blank">llvm_git.bb</a> b/meta/recipes-devtools/l=
lvm/<a href=3D"http://llvm_git.bb" rel=3D"noreferrer" target=3D"_blank">llv=
m_git.bb</a><br>
index f3d6f24bd2..ce9ebfa997 100644<br>
--- a/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">llvm_git.bb</a><br>
+++ b/meta/recipes-devtools/llvm/<a href=3D"http://llvm_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">llvm_git.bb</a><br>
@@ -106,7 +106,7 @@ do_compile() {<br>
<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;l=
ibllvm&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D${D} ninja -v install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 DESTDIR=3D${D} ninja -v install<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# llvm harcodes usr/lib as install path, =
so this corrects it to actual libdir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv -T -n ${D}/${prefix}/lib ${D}/${libdir=
} || true<br>
@@ -117,6 +117,10 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# reproducibility<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &#39;s,${WORKDIR},,g&#39; ${D}/=
${libdir}/cmake/llvm/LLVMConfig.cmake<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove libLTO.so.* which should be provided =
by clang and packaged to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # llvm-linker-tools<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}/${libdir}/libLTO.so.*<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
@@ -134,7 +138,7 @@ llvm_sysroot_preprocess() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_c=
rossscripts}/llvm-config${PV}<br>
=C2=A0}<br>
<br>
-PACKAGES =3D+ &quot;${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${P=
N}-liboptremarks ${PN}-liblto&quot;<br>
+PACKAGES =3D+ &quot;${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${P=
N}-liboptremarks&quot;<br>
<br>
=C2=A0RRECOMMENDS:${PN}-dev +=3D &quot;${PN}-bugpointpasses ${PN}-llvmhello=
 ${PN}-liboptremarks&quot;<br>
<br>
@@ -146,10 +150,6 @@ FILES:${PN}-libllvm =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libLLVM-${MAJOR_VERSION}.so \<br>
=C2=A0&quot;<br>
<br>
-FILES:${PN}-liblto +=3D &quot;\<br>
-=C2=A0 =C2=A0 ${libdir}/libLTO.so.* \<br>
-&quot;<br>
-<br>
=C2=A0FILES:${PN}-liboptremarks +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/libRemarks.so.* \<br>
=C2=A0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186419): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186419" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186419</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100866486/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100866486/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000d8203706036ac159--

