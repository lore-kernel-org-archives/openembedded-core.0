Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43FEBEB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 22:59:04 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.849.1689029934069326396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 15:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P2vMU2FN;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-565f2567422so3313967eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 15:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689029933; x=1691621933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V86Gvin8Q8Kxv/awbqe4kwOgud8AdlmTEOmmhPyz+hw=;
        b=P2vMU2FN2ehT1HoviNB+geqGqyhFgU55wGyFNpgitl/KA8fmJqNcz+bSWCw+ciP6XE
         BuhRu51ccUo+S0ox+N97vqm05M6f45q+prScrkTz3jkMzyr7BLB+swhvk2b1rhT7xWIQ
         zm4+JoQQoJFJsT2uzThYThPKJL9eQjkhngglLHs+ASq7f1ITQtsJ9yJ1PTECzJJX1zJS
         SnCsUlY6Q2yzJoo+y3bZy8Sh6i8dveCO5LlUPA1iIp2D2lTIO3TUA9QsnvHYvyGwxd+4
         nH+4I5J2CqbhG6l8Zzn4JdtgrRC0t5SZwRopLGBxiNaZZmoJ3wdRWRtCR8EJEv/8Xzp9
         wdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689029933; x=1691621933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V86Gvin8Q8Kxv/awbqe4kwOgud8AdlmTEOmmhPyz+hw=;
        b=O8OdYlZZE8x5nUaixbuw59Vz1ODs283XeBvt7aK0G/aLWFnyKmofqA6saeDURM+iGw
         8nA4nSgX88yF8BIo/C19F8vdTTatls8BTf0hnKo4WmnaMwOyxzUOsElOMKi0TOKo0nsw
         6PFm3HVJO+iAb19WcULVUTOikkaGYLL/2QLY6gkuKRf0EQSSG7R52zg/yMbRm0e1X36X
         mAqH2+ThwxH+ultk0C38FTZlD8hYU35cp+BSKzXoYSV+iIjb1dtjzh/cZUYbkMjFBK8v
         GXaUBwPQo8HFJZN4rAHEYsnSIp1XNSVeq9ZYConHUxmpxIhESAI2LYsmdHKz+ceFPLj3
         GbnA==
X-Gm-Message-State: ABy/qLaE21uyCnXeF2pf01OBIo3qQOPeIPEcQAjyt9Fia9K2Fk7kxR3r
	aPvT98pQwLPdaiQvW4zp0MVgxjeT7i2RrYsPvfs=
X-Google-Smtp-Source: APBJJlFGiG6BSm//a7b8tTuvqoMdIx2SwbBC5ijD79SnFJUlyKU+c9lJUGexEPe+ttYhqwsLLKmacyASLaeY9s8UoPg=
X-Received: by 2002:a05:6358:2486:b0:133:c62:59f4 with SMTP id
 m6-20020a056358248600b001330c6259f4mr9961196rwc.24.1689029933102; Mon, 10 Jul
 2023 15:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230710171504.867425-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20230710171504.867425-1-alexander.sverdlin@siemens.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 10 Jul 2023 23:58:42 +0100
Message-ID: <CANPvuRkp4vJhTDADs93mBQG+keCsKBfz+N5E0tYr+TDYHBjciA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH v2] rust-llvm: backport a fix for
 build with gcc-13
To: alexander.sverdlin@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002d79d2060029ed80"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 22:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184106

--0000000000002d79d2060029ed80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

The uninative release with the gcc 13 was released a few weeks ago,
what is the reason for this issue not being found on the autobuild when
using the uninative?

With the clang toolchain this issue [1] comes right after the uninative
with gcc-13 was released.
[1] https://github.com/kraj/meta-clang/pull/816

Jose

A. Sverdlin via lists.openembedded.org <alexander.sverdlin=3D
siemens.com@lists.openembedded.org> escreveu no dia segunda, 10/07/2023
=C3=A0(s) 18:15:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> * needed for rust-llvm-native on hosts with gcc-13
>
> Based on commit 3382759cb6c5 ("llvm: backport a fix for build with gcc-13=
")
>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v2: rebase onto 2022-04.11-kirkstone
>
>  meta/recipes-devtools/rust/rust-llvm.inc      |  4 ++-
>  ...-missing-cstdint-header-to-Signals.h.patch | 32 +++++++++++++++++++
>  2 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-hea=
der-to-Signals.h.patch
>
> diff --git a/meta/recipes-devtools/rust/rust-llvm.inc
> b/meta/recipes-devtools/rust/rust-llvm.inc
> index 5c2ccdac9a..e645e7a7ac 100644
> --- a/meta/recipes-devtools/rust/rust-llvm.inc
> +++ b/meta/recipes-devtools/rust/rust-llvm.inc
> @@ -3,7 +3,9 @@ LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
>  HOMEPAGE =3D "http://www.rust-lang.org"
>
>  SRC_URI +=3D
> "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=3D2 \
> -
> file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;st=
riplevel=3D2"
> +
> file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;st=
riplevel=3D2
> \
> +
> file://0003-Support-Add-missing-cstdint-header-to-Signals.h.patch;striple=
vel=3D2
> \
> +"
>
>  S =3D "${RUSTSRC}/src/llvm-project/llvm"
>
> diff --git
> a/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-h=
eader-to-Signals.h.patch
> b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-h=
eader-to-Signals.h.patch
> new file mode 100644
> index 0000000000..6ed23aa9c5
> --- /dev/null
> +++
> b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-h=
eader-to-Signals.h.patch
> @@ -0,0 +1,32 @@
> +From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Mon, 23 May 2022 08:03:23 +0100
> +Subject: [PATCH] [Support] Add missing <cstdint> header to Signals.h
> +
> +Without the change llvm build fails on this week's gcc-13 snapshot as:
> +
> +    [  0%] Building CXX object
> lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
> +    In file included from llvm/lib/Support/Signals.cpp:14:
> +    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field
> 'CleanupOnSignal' declared void
> +      119 |   void CleanupOnSignal(uintptr_t Context);
> +          |        ^~~~~~~~~~~~~~~
> +
> +Upstream-Status: Backport [llvmorg-15.0.0
> ff1681ddb303223973653f7f5f3f3435b48a1983]
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> +---
> + llvm/include/llvm/Support/Signals.h | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/llvm/include/llvm/Support/Signals.h
> b/llvm/include/llvm/Support/Signals.h
> +index 44f5a750ff5c..937e0572d4a7 100644
> +--- a/llvm/include/llvm/Support/Signals.h
> ++++ b/llvm/include/llvm/Support/Signals.h
> +@@ -14,6 +14,7 @@
> + #ifndef LLVM_SUPPORT_SIGNALS_H
> + #define LLVM_SUPPORT_SIGNALS_H
> +
> ++#include <cstdint>
> + #include <string>
> +
> + namespace llvm {
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184090):
> https://lists.openembedded.org/g/openembedded-core/message/184090
> Mute This Topic: https://lists.openembedded.org/mt/100062248/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000002d79d2060029ed80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Alexander,<br><br>The uninative release with the g=
cc 13=C2=A0was released a few weeks ago,</div><div>what is the reason for t=
his issue not being found on the autobuild when using the uninative?</div><=
br>With the clang=C2=A0toolchain this issue [1] comes right=C2=A0after the =
uninative with gcc-13 was released.<br>[1] <a href=3D"https://github.com/kr=
aj/meta-clang/pull/816">https://github.com/kraj/meta-clang/pull/816</a><br>=
<br>Jose<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">A. Sverdlin via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;alexander.sverdlin=3D<a href=3D"mailto:siemens.com=
@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; escreve=
u no dia segunda, 10/07/2023 =C3=A0(s) 18:15:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">From: Alexander Sverdlin &lt;<a href=3D"mailt=
o:alexander.sverdlin@siemens.com" target=3D"_blank">alexander.sverdlin@siem=
ens.com</a>&gt;<br>
<br>
* needed for rust-llvm-native on hosts with gcc-13<br>
<br>
Based on commit 3382759cb6c5 (&quot;llvm: backport a fix for build with gcc=
-13&quot;)<br>
<br>
Signed-off-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sverdlin@=
siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;<br>
---<br>
Changelog:<br>
v2: rebase onto 2022-04.11-kirkstone<br>
<br>
=C2=A0meta/recipes-devtools/rust/rust-llvm.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 ++-<br>
=C2=A0...-missing-cstdint-header-to-Signals.h.patch | 32 ++++++++++++++++++=
+<br>
=C2=A02 files changed, 35 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/rust-llvm/0003-Support-=
Add-missing-cstdint-header-to-Signals.h.patch<br>
<br>
diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtoo=
ls/rust/rust-llvm.inc<br>
index 5c2ccdac9a..e645e7a7ac 100644<br>
--- a/meta/recipes-devtools/rust/rust-llvm.inc<br>
+++ b/meta/recipes-devtools/rust/rust-llvm.inc<br>
@@ -3,7 +3,9 @@ LICENSE ?=3D &quot;Apache-2.0-with-LLVM-exception&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.rust-lang.org" rel=3D"norefe=
rrer" target=3D"_blank">http://www.rust-lang.org</a>&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0002-llvm-allow-env-override-of-exe-path.pa=
tch;striplevel=3D2 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-AsmMatcherEmitter-so=
rt-ClassInfo-lists-by-name-as-we.patch;striplevel=3D2&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-AsmMatcherEmitter-so=
rt-ClassInfo-lists-by-name-as-we.patch;striplevel=3D2 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-Support-Add-missing-=
cstdint-header-to-Signals.h.patch;striplevel=3D2 \<br>
+&quot;<br>
<br>
=C2=A0S =3D &quot;${RUSTSRC}/src/llvm-project/llvm&quot;<br>
<br>
diff --git a/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-=
cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/rust/rust-llvm/00=
03-Support-Add-missing-cstdint-header-to-Signals.h.patch<br>
new file mode 100644<br>
index 0000000000..6ed23aa9c5<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint=
-header-to-Signals.h.patch<br>
@@ -0,0 +1,32 @@<br>
+From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 2001<br>
+From: Sergei Trofimovich &lt;<a href=3D"mailto:slyich@gmail.com" target=3D=
"_blank">slyich@gmail.com</a>&gt;<br>
+Date: Mon, 23 May 2022 08:03:23 +0100<br>
+Subject: [PATCH] [Support] Add missing &lt;cstdint&gt; header to Signals.h=
<br>
+<br>
+Without the change llvm build fails on this week&#39;s gcc-13 snapshot as:=
<br>
+<br>
+=C2=A0 =C2=A0 [=C2=A0 0%] Building CXX object lib/Support/CMakeFiles/LLVMS=
upport.dir/Signals.cpp.o<br>
+=C2=A0 =C2=A0 In file included from llvm/lib/Support/Signals.cpp:14:<br>
+=C2=A0 =C2=A0 llvm/include/llvm/Support/Signals.h:119:8: error: variable o=
r field &#39;CleanupOnSignal&#39; declared void<br>
+=C2=A0 =C2=A0 =C2=A0 119 |=C2=A0 =C2=A0void CleanupOnSignal(uintptr_t Cont=
ext);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~=
~~~~~<br>
+<br>
+Upstream-Status: Backport [llvmorg-15.0.0 ff1681ddb303223973653f7f5f3f3435=
b48a1983]<br>
+Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
+Signed-off-by: Alexander Sverdlin &lt;<a href=3D"mailto:alexander.sverdlin=
@siemens.com" target=3D"_blank">alexander.sverdlin@siemens.com</a>&gt;<br>
+---<br>
+ llvm/include/llvm/Support/Signals.h | 1 +<br>
+ 1 file changed, 1 insertion(+)<br>
+<br>
+diff --git a/llvm/include/llvm/Support/Signals.h b/llvm/include/llvm/Suppo=
rt/Signals.h<br>
+index 44f5a750ff5c..937e0572d4a7 100644<br>
+--- a/llvm/include/llvm/Support/Signals.h<br>
++++ b/llvm/include/llvm/Support/Signals.h<br>
+@@ -14,6 +14,7 @@<br>
+ #ifndef LLVM_SUPPORT_SIGNALS_H<br>
+ #define LLVM_SUPPORT_SIGNALS_H<br>
+ <br>
++#include &lt;cstdint&gt;<br>
+ #include &lt;string&gt;<br>
+ <br>
+ namespace llvm {<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184090): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184090" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184090</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100062248/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100062248/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div>

--0000000000002d79d2060029ed80--

