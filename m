Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B165C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 13:23:46 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.22245.1752672224873826845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 06:23:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LAqniI2u;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso5994126a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 06:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672224; x=1753277024; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8/acVRaWyBN79W/uHGSeE2udcK0kegii0feX6Lx+StM=;
        b=LAqniI2ujZa+HMoJ9bxat4CHFJ9FXXxoeKmK7Z+mdv+HX8joPlZ/xbTLkRzuWP4Zhs
         EpsOiv/0c6Oyv/kViOYt3z+m9GHEIw+7X0H6ZE+/SSk+Sd65yHG2Z+BBB4RV8Zwj0rhO
         LV1R76s5IEYdxqMt+HG7TQSvoL9mCefk8TnWbjqphFYx8Mib0dfkUMY7+pa0m7nTzVvo
         ObmpRxXOW8Sp93SzGegjJpW8/QPbWMwSBpCLCG2ghzK1zQd7qSrs/Hq80avPAdPAFjHY
         /3DFN2FoBaatrq33YL6aooSsiCX+fPg5IhxoqJhFZqwqMhk6pKp1t8yBnMTPXVIS86Pn
         o0sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672224; x=1753277024;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/acVRaWyBN79W/uHGSeE2udcK0kegii0feX6Lx+StM=;
        b=E8+KG+TennfpoMtxKs8WrHvaHpk6+rVEloV1GM6ILz4yGOJo0wfb57qipj0YxrQ5fX
         rqPvrtB1Ki6a5VAyBjgquTofgKIDNxE6W22/X+iSs8eDSEldJHhZO1GcD5YgN8A/ozxc
         A4+I0w6zX+R+rwwANHXy/rtUezrrgNbBx6h3l1Acvx+qtpm0OqFkug+zcOg3/lDtPQJ5
         fbhSoWJD8rtyy069w4UzGJXbL2tV4vTiJwHk/6vs9bitX/PSSH4YcXfvf1Qz2IL//JUE
         L+AdAMpYIiGHSE78ne9zolQALMo0gmsKlYgqrM7naJsmsafWk7iJ9ZlIPgo6TSbhvAdI
         qQtQ==
X-Gm-Message-State: AOJu0YzPigg2GlAXQv7W21k7DZ0ttqoMKIG0ds6Slo0U743EymyoEi7v
	Z6a8YRE3etaWEDAj9Ma4OcYj2U0CJxt1Srw9g7+LK0gXfRCUO2paBYwUoiJ6YV6+Vm07eqHHFDV
	yiI/x0mKQaE5quBpsyfJUwW9rCMdH26IhQGxq
X-Gm-Gg: ASbGncs87Xx9KPyVhOf+t3+9VBdTHAMMZWyzUKwdiIuDA6LheEcboWbFpA4DtMan2Q3
	dAMu+X7s1CgfwBYzQoTB7FVk4EVH8fDOzRZJJMYkKrUIRLoKFrRebL8Vn0Hk56pESaAVHA/Lju5
	N3qALIWMquYelz5Mz6+tgtJCxsC1XDzrxcQ0rS0+xJa5s8Cpak1jyZYAsPm/Bfp21pfP5mYDNqz
	OcA1xbxPDgNZMDysiw=
X-Google-Smtp-Source: AGHT+IFnu536/012pThL91I+gUeiSHGDaIxad8aXysEXlqOEk7KYhKsx11PiwegRmqWzLF7/W+itPkwTvhxgbevE/ow=
X-Received: by 2002:a17:90a:dfce:b0:312:e76f:5213 with SMTP id
 98e67ed59e1d1-31c9e77ab0dmr4298461a91.28.1752672223940; Wed, 16 Jul 2025
 06:23:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250716072129.1041493-1-Qi.Chen@windriver.com>
In-Reply-To: <20250716072129.1041493-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jul 2025 09:23:35 -0400
X-Gm-Features: Ac12FXzi5trSCn_GMMneSAV7lHy0puuyTBsbOLhVreSRyfpeOzweHtYDrXnhwpE
Message-ID: <CADkTA4O247D2r7dQgXTKWPgSBv76uuREBep_nn-FK5-b71RWkQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel-devsrc: copy arch/powerpc/tools contents
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000050d671063a0bcdce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 13:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220452

--00000000000050d671063a0bcdce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 3:21=E2=80=AFAM Chen Qi via lists.openembedded.org =
<Qi.Chen=3D
windriver.com@lists.openembedded.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> For now, using qemuppc64 as MACHINE and building things inside SDK,
> we'll get the following error:
>
>   ERROR: modpost: "_mcount" undefined
>
> This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/
> contents to do the check. This in turn affects HAVE_OBJTOOL.
> """
> arch/powerpc/Kconfig:   select HAVE_OBJTOOL                     if
> ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
> """
>
> The current MPROFILE_KERNEL for powerpc:
> """
> config MPROFILE_KERNEL
>             depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
>             def_bool
> $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC=
)
> -mlittle-endian) if CPU_LITTLE_ENDIAN
>             def_bool
> $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC=
)
> -mbig-endian) if CPU_BIG_ENDIAN
> """
>
> If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then
> FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Dabba759796f9b73eb24df9b734dd063839fc62e0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 3d2eb3929e..c4b5d0e5a6 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -208,6 +208,10 @@ do_install() {
>          fi
>
>          if [ "${ARCH}" =3D "powerpc" ]; then
> +            # 4.18+ needs these files for MPROFILE_KERNEL, but don't
> error if they aren't present in the source
> +            # See
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Dabba759796f9b73eb24df9b734dd063839fc62e0
> +            cp -a --parents arch/powerpc/tools $kerneldir/build/
> 2>/dev/null || :
> +
>

We don't copy the entire tools directory, just copy what you need out of it=
.

Cheers,

Bruce



>              # 5.0 needs these files, but don't error if they aren't
> present in the source
>              cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl
> $kerneldir/build/ 2>/dev/null || :
>              cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh
> $kerneldir/build/ 2>/dev/null || :
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220434):
> https://lists.openembedded.org/g/openembedded-core/message/220434
> Mute This Topic: https://lists.openembedded.org/mt/114181303/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000050d671063a0bcdce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 3:21=
=E2=80=AFAM Chen Qi via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.opene=
mbedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
<br>
For now, using qemuppc64 as MACHINE and building things inside SDK,<br>
we&#39;ll get the following error:<br>
<br>
=C2=A0 ERROR: modpost: &quot;_mcount&quot; undefined<br>
<br>
This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/<br>
contents to do the check. This in turn affects HAVE_OBJTOOL.<br>
&quot;&quot;&quot;<br>
arch/powerpc/Kconfig:=C2=A0 =C2=A0select HAVE_OBJTOOL=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ARCH_USING_PATCHA=
BLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32<br>
&quot;&quot;&quot;<br>
<br>
The current MPROFILE_KERNEL for powerpc:<br>
&quot;&quot;&quot;<br>
config MPROFILE_KERNEL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on PPC64_ELF_ABI_V2 &amp;=
&amp; FUNCTION_TRACER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def_bool $(success,$(srctree)/arc=
h/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_=
LITTLE_ENDIAN<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def_bool $(success,$(srctree)/arc=
h/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG=
_ENDIAN<br>
&quot;&quot;&quot;<br>
<br>
If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then<br>
FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/commit/?id=3Dabba759796f9b73eb24df9b734dd063839fc62e0" rel=3D"noreferr=
er" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/stabl=
e/linux.git/commit/?id=3Dabba759796f9b73eb24df9b734dd063839fc62e0</a><br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 3d2eb3929e..c4b5d0e5a6 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -208,6 +208,10 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;powerp=
c&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 4.18+ needs these files for MP=
ROFILE_KERNEL, but don&#39;t error if they aren&#39;t present in the source=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See <a href=3D"https://git.ker=
nel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dabba759796f9=
b73eb24df9b734dd063839fc62e0" rel=3D"noreferrer" target=3D"_blank">https://=
git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dabba7=
59796f9b73eb24df9b734dd063839fc62e0</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents arch/powerpc/too=
ls $kerneldir/build/ 2&gt;/dev/null || :<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">We don&#39;t copy the entire tools directory, just copy w=
hat you need out of it.</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">C=
heers,</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 5.0 needs these files, bu=
t don&#39;t error if they aren&#39;t present in the source<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/${ARCH=
}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2&gt;/dev/null || :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/${ARCH=
}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2&gt;/dev/null || :<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220434): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220434" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220434</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114181303/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114181303/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000050d671063a0bcdce--

