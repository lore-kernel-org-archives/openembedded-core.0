Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.2703.1612473218610650063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 13:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ss/mySwS;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c1so3553370qtc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWYIihtx0N0FQHoycskE9NsjIusLp9Mc4DPZ9fZPyXQ=;
        b=ss/mySwSWXp0lsxZvITML6wPN2XR1i1pbXSMQZgNFrEgs+EJBaNnAL+YrZYwm2joiH
         HPqWfBindOfIHlIlhoynRciYz1Uq9616XpMwXfbcFUaQf0cXRJuU8Fm7vgpOiVvEIaVH
         1K9GqyWo5t3ezDyx5HEsiw60gy1fLBsKEKpbvYjPcOTlaCQeNiLComSwVGlykT+56INV
         8xNb3YUv5NPnh89mKJeWFMPfaeQdrf7JT7Ch6cRi0VGP8M8Qfgw1i5/EoC3PoLZuQzR9
         BSQPdGqV1o3VPlJmW38XtkM8F6nJ1No/qfUdMyrzdjC/65nttTYh4WwAzuiiOo3NxwOs
         0eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWYIihtx0N0FQHoycskE9NsjIusLp9Mc4DPZ9fZPyXQ=;
        b=LoJBz+/LKvgZci45s0rUbh6T2qAM8uYFrdQ5z7QmzSVnoaY4Z70UsF1wMLFZ90pVQz
         3NqIrBkFPCnB+qwKxsTAuNYjdX5JIWuf+F1/d2NdAt6E/Fz4+3C3sF+SyMF5i0KicO2c
         WnOnYF6/lZKTbRQsAATobCsndKFeHAeF9gA6QMROlShIa4DRnUvHgAjERmhi+pFgBif3
         zcItk1T1uFnEOn4Hv19vyWZ9KWSWCSX7g/7hTQMCUhk9DgGYDnJtfoMYP8tTgw6vdTXl
         OkXwv0Dlt3YqCeNMmyaAbppYEb3KpywLBu6xO8RRybxXfKXJ5eGnJBLhST7k4v1gHffc
         O+Xg==
X-Gm-Message-State: AOAM531Fbl0FDVARRDZwIy3zwrD7CZmeADep8WcDxCRETWFCO8s6HRQs
	R4kkIQ33DvpYfq3lwL6RuJtYPkS+8pJUA9QQMwE=
X-Google-Smtp-Source: ABdhPJyhIFX05SU1wTLCdoQ55dL698hmmx29B6OjpQ+8lt7miF24prHrBVBDAz6CCDZZVYt0fMAwEoJeqXZKdfbPTBs=
X-Received: by 2002:ac8:5bd1:: with SMTP id b17mr1493302qtb.53.1612473217621;
 Thu, 04 Feb 2021 13:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20210204203451.2143587-1-steve@sakoman.com>
In-Reply-To: <20210204203451.2143587-1-steve@sakoman.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Feb 2021 13:13:26 -0800
Message-ID: <CAMKF1sqnSRuN4VUVtLe6YOTsBSYZYV9YddkDYJ6Zsd+45BLxEQ@mail.gmail.com>
Subject: Re: [OE-core][master] glibc: update to latest release/2.32/master branch
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000058a41a05ba892d24"

--00000000000058a41a05ba892d24
Content-Type: text/plain; charset="UTF-8"

Looks ok although you should be deleting the unused patch files too

On Thu, Feb 4, 2021 at 12:35 PM Steve Sakoman <steve@sakoman.com> wrote:

> Remove patches for CVE-2019-25013 and CVE-2020-27618 since they are
> present in the branch now. Add both CVEs to CVE_CHECK_WHITELIST.
>
> 760e1d28782 gconv: Fix assertion failure in ISO-2022-JP-3 module (bug
> 27256)
> d3cb8f6222a aarch64: fix static PIE start code for BTI [BZ #27068]
> 082798622d8 __vfscanf_internal: fix aliasing violation (bug 26690)
> 33dc30bc838 aarch64: Use mmap to add PROT_BTI instead of mprotect [BZ
> #26831]
> 46e1e64fe3e elf: Pass the fd to note processing
> b6eae83717d elf: Move note processing after l_phdr is updated
> c6090dcebd1 aarch64: align address for BTI protection [BZ #26988]
> 610e2c51504 aarch64: Fix missing BTI protection from dependencies [BZ
> #26926]
> 4c619b3eed5 x86: Check IFUNC definition in unrelocated executable [BZ
> #20019]
> 87450ecf8a8 x86: Set header.feature_1 in TCB for always-on CET [BZ #27177]
> 2b4f67c2b33 Update for [BZ #27130] fix
> 1a24bbd43e4 x86-64: Avoid rep movsb with short distance [BZ #27130]
> 0d9793e82a1 Fix buffer overrun in EUC-KR conversion module (bz #24973)
> 1d49bede4d8 tests-mcheck: New variable to run tests with MALLOC_CHECK_=3
> 050022910be iconv: Accept redundant shift sequences in IBM1364 [BZ #26224]
> ac0a6929c5d sh: Add sh4 fpu Implies folder
> 3ea24955bff struct _Unwind_Exception alignment should not depend on
> compiler flags
> 5c36293f067 resolv: Serialize processing in
> resolv/tst-resolv-txnid-collision
> 2dfa659a66f resolv: Handle transaction ID collisions in parallel queries
> (bug 26600)
> 05c025abca1 support: Provide a way to clear the RA bit in DNS server
> responses
> f688bcd83de support: Provide a way to reorder responses within the DNS
> test server
> eba0ce60588 Remove __warndecl
> 5337b2af4b8 Remove __warn_memset_zero_len [BZ #25399]
> c6e794640c3 aarch64: Add unwind information to _start (bug 26853)
> 70ee5e8b573 aarch64: Fix DT_AARCH64_VARIANT_PCS handling [BZ #26798]
> 8813b2682e4 x86: Optimizing memcpy for AMD Zen architecture.
> e61a8fd8fad Reversing calculation of __x86_shared_non_temporal_threshold
> 0b9460d22e2 sysvipc: Fix IPC_INFO and SHM_INFO handling [BZ #26636]
> c4aeedea598 sysvipc: Fix IPC_INFO and MSG_INFO handling [BZ #26639]
> 9b139b6b81a sysvipc: Fix SEM_STAT_ANY kernel argument pass [BZ #26637]
> 81c5484d93a AArch64: Use __memcpy_simd on Neoverse N2/V1
> 0f8f0ed25c1 AArch64: Improve backwards memmove performance
> 23482f78866 Set version.h RELEASE to "stable" (Bug 26700)
> 69beb5cbf85 string: Fix strerrorname_np return value [BZ #26555]
> fe62c4d173f intl: Handle translation output codesets with suffixes [BZ
> #26383]
> 386543bc449 NEWS: Update for [BZ #26534] fix
> cebc01cbfd6 x86-64: Fix FMA4 detection in ifunc [BZ #26534]
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.32.bb     | 5 ++---
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc
> b/meta/recipes-core/glibc/glibc-version.inc
> index 1566056297..586b2e207e 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.32/master"
>  PV = "2.32"
> -SRCREV_glibc ?= "3de512be7ea6053255afed6154db9ee31d4e557a"
> +SRCREV_glibc ?= "760e1d287825fa91d4d5a0cc921340c740d803e2"
>  SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb
> b/meta/recipes-core/glibc/glibc_2.32.bb
> index 2d9c707a0b..249f59176e 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -1,7 +1,8 @@
>  require glibc.inc
>  require glibc-version.inc
>
> -CVE_CHECK_WHITELIST += "CVE-2020-10029"
> +# whitelist CVE's with fixes in latest release/2.32/master branch
> +CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618"
>
>  DEPENDS += "gperf-native bison-native make-native"
>
> @@ -45,8 +46,6 @@ SRC_URI =
> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>
> file://0031-linux-Allow-adjtime-with-NULL-argument-BZ-26833.patch \
>             file://CVE-2020-29562.patch \
>             file://CVE-2020-29573.patch \
> -           file://CVE-2019-25013.patch \
> -           file://CVE-2020-27618.patch \
>             "
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.25.1
>
>
> 
>
>

--00000000000058a41a05ba892d24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Looks ok although you should be deleting the unused patch=
 files too=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Feb 4, 2021 at 12:35 PM Steve Sakoman &lt;<a h=
ref=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Remove patches for CVE-2019-25013 and CVE-20=
20-27618 since they are<br>
present in the branch now. Add both CVEs to CVE_CHECK_WHITELIST.<br>
<br>
760e1d28782 gconv: Fix assertion failure in ISO-2022-JP-3 module (bug 2725=
6)<br>
d3cb8f6222a aarch64: fix static PIE start code for BTI [BZ #27068]<br>
082798622d8 __vfscanf_internal: fix aliasing violation (bug 26690)<br>
33dc30bc838 aarch64: Use mmap to add PROT_BTI instead of mprotect [BZ #268=
31]<br>
46e1e64fe3e elf: Pass the fd to note processing<br>
b6eae83717d elf: Move note processing after l_phdr is updated<br>
c6090dcebd1 aarch64: align address for BTI protection [BZ #26988]<br>
610e2c51504 aarch64: Fix missing BTI protection from dependencies [BZ #269=
26]<br>
4c619b3eed5 x86: Check IFUNC definition in unrelocated executable [BZ #200=
19]<br>
87450ecf8a8 x86: Set header.feature_1 in TCB for always-on CET [BZ #27177]=
<br>
2b4f67c2b33 Update for [BZ #27130] fix<br>
1a24bbd43e4 x86-64: Avoid rep movsb with short distance [BZ #27130]<br>
0d9793e82a1 Fix buffer overrun in EUC-KR conversion module (bz #24973)<br>
1d49bede4d8 tests-mcheck: New variable to run tests with MALLOC_CHECK_=3D3=
<br>
050022910be iconv: Accept redundant shift sequences in IBM1364 [BZ #26224]=
<br>
ac0a6929c5d sh: Add sh4 fpu Implies folder<br>
3ea24955bff struct _Unwind_Exception alignment should not depend on compil=
er flags<br>
5c36293f067 resolv: Serialize processing in resolv/tst-resolv-txnid-collis=
ion<br>
2dfa659a66f resolv: Handle transaction ID collisions in parallel queries (=
bug 26600)<br>
05c025abca1 support: Provide a way to clear the RA bit in DNS server respo=
nses<br>
f688bcd83de support: Provide a way to reorder responses within the DNS tes=
t server<br>
eba0ce60588 Remove __warndecl<br>
5337b2af4b8 Remove __warn_memset_zero_len [BZ #25399]<br>
c6e794640c3 aarch64: Add unwind information to _start (bug 26853)<br>
70ee5e8b573 aarch64: Fix DT_AARCH64_VARIANT_PCS handling [BZ #26798]<br>
8813b2682e4 x86: Optimizing memcpy for AMD Zen architecture.<br>
e61a8fd8fad Reversing calculation of __x86_shared_non_temporal_threshold<b=
r>
0b9460d22e2 sysvipc: Fix IPC_INFO and SHM_INFO handling [BZ #26636]<br>
c4aeedea598 sysvipc: Fix IPC_INFO and MSG_INFO handling [BZ #26639]<br>
9b139b6b81a sysvipc: Fix SEM_STAT_ANY kernel argument pass [BZ #26637]<br>
81c5484d93a AArch64: Use __memcpy_simd on Neoverse N2/V1<br>
0f8f0ed25c1 AArch64: Improve backwards memmove performance<br>
23482f78866 Set version.h RELEASE to &quot;stable&quot; (Bug 26700)<br>
69beb5cbf85 string: Fix strerrorname_np return value [BZ #26555]<br>
fe62c4d173f intl: Handle translation output codesets with suffixes [BZ #26=
383]<br>
386543bc449 NEWS: Update for [BZ #26534] fix<br>
cebc01cbfd6 x86-64: Fix FMA4 detection in ifunc [BZ #26534]<br>
<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targ=
et=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc | 2 +-<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.32.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.32.bb</a>=C2=A0 =C2=A0 =C2=A0| 5 ++---<br=
>
=C2=A02 files changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core=
/glibc/glibc-version.inc<br>
index 1566056297..586b2e207e 100644<br>
--- a/meta/recipes-core/glibc/glibc-version.inc<br>
+++ b/meta/recipes-core/glibc/glibc-version.inc<br>
@@ -1,6 +1,6 @@<br>
=C2=A0SRCBRANCH ?=3D &quot;release/2.32/master&quot;<br>
=C2=A0PV =3D &quot;2.32&quot;<br>
-SRCREV_glibc ?=3D &quot;3de512be7ea6053255afed6154db9ee31d4e557a&quot;<br=
>
+SRCREV_glibc ?=3D &quot;760e1d287825fa91d4d5a0cc921340c740d803e2&quot;<br=
>
=C2=A0SRCREV_localedef ?=3D &quot;bd644c9e6f3e20c5504da1488448173c69c56c28=
&quot;<br>
<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/=
glibc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glibc.gi=
t</a>&quot;<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.32.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.32.bb</a> b/meta/recipes-core/gl=
ibc/<a href=3D"http://glibc_2.32.bb" rel=3D"noreferrer" target=3D"_blank">g=
libc_2.32.bb</a><br>
index 2d9c707a0b..249f59176e 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.32.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.32.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.32.bb" rel=3D"nore=
ferrer" target=3D"_blank">glibc_2.32.bb</a><br>
@@ -1,7 +1,8 @@<br>
=C2=A0require glibc.inc<br>
=C2=A0require glibc-version.inc<br>
<br>
-CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-10029&quot;<br>
+# whitelist CVE&#39;s with fixes in latest release/2.32/master branch<br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2019-25013 CVE-2020-10029 CVE-2020-276=
18&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;gperf-native bison-native make-native&quot;<br>
<br>
@@ -45,8 +46,6 @@ SRC_URI =3D=C2=A0 &quot;${GLIBC_GIT_URI};branch=3D${SRCB=
RANCH};name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0031-linux-Allow-adjtime-=
with-NULL-argument-BZ-26833.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-29562.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2020-29573.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2019-25013.patch \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2020-27618.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
=C2=A0B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--00000000000058a41a05ba892d24--
