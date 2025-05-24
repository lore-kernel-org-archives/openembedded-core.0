Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2C3C54E71
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 04:12:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.1688.1748059948987088181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 21:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SprJi6d+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-310f3c7bd87so430362a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 21:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748059948; x=1748664748; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ubSI2XkkIwdZIbXcAlqwMS/ICvQUFZqeDXAPDugh850=;
        b=SprJi6d+9uVwe7t0wXfBbm91a+Eey9kv48K4G4mXhFJOzUQWsn0ZqogDLuXsfA7MXP
         KbdxCXvZEz95/pYmlkEAKvndBumun5pRH93pelVf5VJVfPB3jdk+uv5NnU/ObW9WY4kv
         /IxR9Z+9naAo/9vDcengsn8nbbZAstOLgLSx8+C5D5XmY8/TK2Q9Vb+3M054/fIOfHfr
         LZSF1c/2eJlpYyz7sj0bgd/Uf9MD5qPXPupjMPa896kgyzQhPPpmlR7/qSItD3Hnn6hp
         lw+rYjXWLBR2KixzdifCwvqiSXZYGcjOjzKBZ0N5aId8pzIwGphj7koutqHG6Ti5qECh
         ORww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748059948; x=1748664748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ubSI2XkkIwdZIbXcAlqwMS/ICvQUFZqeDXAPDugh850=;
        b=BbRZzDVK6rloEhCzycvsD6a44qH0X4TuGdvtl29krMZy+mpG6Nah0D8nFCoum2P/Bj
         0amOgmC66S7eF9Sjp+S1396zPS2bk7F4/nNAPsxguR1yHxYXH68AWCXgl+Qt7EXFukHB
         EK/SzebvUNyy4fg6h6Hkx+YLqAH4WwwAGpQwowmKF6DuEs3KsPe4Ip7MqImatYsc4JD6
         OIN58bAPTfn8u+5lMs9E4MyTw1b66k39gl16qRPnnDpLUA5fY3A36b46htY0R0oofIzt
         nHl/OhTjpvEy7RQt39+GULnwb+7SdvEnJPOx/CdJV3j6zJdrCvUYCm2KaPW8IPwmHPCs
         3ytg==
X-Gm-Message-State: AOJu0Yzw96QqGJ3NHnjcaqPlMC/wc4kFukADbEByI+7OSB1ThwkK2BXe
	/Iv3L/mho6rX68uOfaXbjy9pG7ePCPCzKGUwIOa7g5SLDG4FLVoBUjSlybA8cOuc8x1TLJ+ISRl
	VraeouBYZuLRJnA6PVT7ovr1s4yQv4kI=
X-Gm-Gg: ASbGnctIemK2htLNY4px9zbhYMPWTtBNVsPg4MVBpT+D1PO/fLqsn00ZehvJVtB6Nwc
	3h8bMSVQ0JCuMQciPDh21IG7JJtR3OtvvziwntnZPxV/woToBDxek8A4L0JdRHWtxBFVy27WkQI
	RGe3vpVF+ediKHGNB8FXb1+ErMV9J4b9sJ89w=
X-Google-Smtp-Source: AGHT+IH4t62Xl/b4fvKhh5h8hHT5V7Dxp/X4uXnWmIhNWM8y0kQ50LajW8qH3Zz4ETpk1P9gecyLCwSTmjmN5ifKQHY=
X-Received: by 2002:a17:90b:35cc:b0:309:fe2b:306f with SMTP id
 98e67ed59e1d1-3110feeb4d0mr2281816a91.26.1748059948077; Fri, 23 May 2025
 21:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250524035958.3809327-1-raj.khem@gmail.com>
In-Reply-To: <20250524035958.3809327-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 24 May 2025 00:12:18 -0400
X-Gm-Features: AX0GCFtCoyYcZssNT1IXxIE1VBBwr132P6wgLQDi_iTWNfqJ8CvFzEhK3PlJECw
Message-ID: <CADkTA4Ok10vyyr7hPK75=vj-GF47zf_J+RW1LKM+t2dS4_LioQ@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Remove debug-kernel.scc for riscv32 kernels
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040545d0635d9ec54"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 04:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217221

--00000000000040545d0635d9ec54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 24, 2025 at 12:00=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:

> modpost fails to process the debug location lists for riscv32
>
> | ERROR: modpost: vmlinux: local symbol '__asm_copy_to_user' was exported
> | ERROR: modpost: vmlinux: local symbol '__asm_copy_from_user' was export=
ed
> | ERROR: modpost: vmlinux: local symbol '__clear_user' was exported
> | ERROR: modpost: vmlinux: local symbol 'xor_regs_2_' was exported
> | ERROR: modpost: vmlinux: local symbol 'xor_regs_3_' was exported
> | ERROR: modpost: vmlinux: local symbol 'xor_regs_4_' was exported
> | ERROR: modpost: vmlinux: local symbol 'xor_regs_5_' was exported
> | WARNING: modpost: vmlinux: section mismatch in reference: 0x1560
> (section: __ex_table) -> .LASF464 (section: .debug_str)
> | ERROR: modpost: __ex_table+0x1560 references non-executable section
> '.debug_str'
>
> poky adds features/debug/debug-kernel.scc via distro policy and hence
> the builds are failing for qemuriscv32 on AB. While this should be
> fixed in kernel build system or tools, this makes us proceed until
> then

The question is .. how will we ever know to revisit this ? Can we raise a
bug
To track that this needs to be reenabled later ?

Bruce


>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> index fefed8c9c53..83be9fed428 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> @@ -72,5 +72,8 @@ KERNEL_FEATURES:append =3D "
> ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " cg
>  KERNEL_FEATURES:append:powerpc =3D " arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D " arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64le =3D " arch/powerpc/powerpc-debug.scc"
> -
> +# Do not add debug info for riscv32, it fails during depmod
> +# ERROR: modpost: __ex_table+0x17a4 references non-executable section
> '.debug_loclists'
> +# Check again during next major version upgrade
> +KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
>  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000040545d0635d9ec54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 24, 2025 at 12:00=
=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">modpost fails to process the debug location lists for riscv32<br>
<br>
| ERROR: modpost: vmlinux: local symbol &#39;__asm_copy_to_user&#39; was ex=
ported<br>
| ERROR: modpost: vmlinux: local symbol &#39;__asm_copy_from_user&#39; was =
exported<br>
| ERROR: modpost: vmlinux: local symbol &#39;__clear_user&#39; was exported=
<br>
| ERROR: modpost: vmlinux: local symbol &#39;xor_regs_2_&#39; was exported<=
br>
| ERROR: modpost: vmlinux: local symbol &#39;xor_regs_3_&#39; was exported<=
br>
| ERROR: modpost: vmlinux: local symbol &#39;xor_regs_4_&#39; was exported<=
br>
| ERROR: modpost: vmlinux: local symbol &#39;xor_regs_5_&#39; was exported<=
br>
| WARNING: modpost: vmlinux: section mismatch in reference: 0x1560 (section=
: __ex_table) -&gt; .LASF464 (section: .debug_str)<br>
| ERROR: modpost: __ex_table+0x1560 references non-executable section &#39;=
.debug_str&#39;<br>
<br>
poky adds features/debug/debug-kernel.scc via distro policy and hence<br>
the builds are failing for qemuriscv32 on AB. While this should be<br>
fixed in kernel build system or tools, this makes us proceed until<br>
then<span class=3D"gmail_default" style=3D"font-size:small"></span></blockq=
uote><div><span class=3D"gmail_default" style=3D"font-size:small"></span></=
div><div class=3D"gmail_default" style=3D"font-size:small">The question is =
.. how will we ever know to revisit this ? Can we raise a bug</div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">To track that this needs to =
be reenabled later ?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruc=
e</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.12.bb</a><br>
index fefed8c9c53..83be9fed428 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
@@ -72,5 +72,8 @@ KERNEL_FEATURES:append =3D &quot; ${@bb.utils.contains(&q=
uot;DISTRO_FEATURES&quot;, &quot;ptest&quot;, &quot; cg<br>
=C2=A0KERNEL_FEATURES:append:powerpc =3D &quot; arch/powerpc/powerpc-debug.=
scc&quot;<br>
=C2=A0KERNEL_FEATURES:append:powerpc64 =3D &quot; arch/powerpc/powerpc-debu=
g.scc&quot;<br>
=C2=A0KERNEL_FEATURES:append:powerpc64le =3D &quot; arch/powerpc/powerpc-de=
bug.scc&quot;<br>
-<br>
+# Do not add debug info for riscv32, it fails during depmod<br>
+# ERROR: modpost: __ex_table+0x17a4 references non-executable section &#39=
;.debug_loclists&#39;<br>
+# Check again during next major version upgrade<br>
+KERNEL_FEATURES:remove:riscv32 =3D &quot;features/debug/debug-kernel.scc&q=
uot;<br>
=C2=A0INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D &quot;textrel&quot;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000040545d0635d9ec54--

