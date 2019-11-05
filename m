Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id DEFE46C109
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 20:08:32 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id m16so22049989qki.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NMkSWJSiyjNxPZHmsvW4evtwMxNz6IfGqCMuKJDOHyw=;
	b=L9pgHffpqNIs/TPyUbZdNoomTbapGKm+r56uue7KzHxqSNi3sg8SRP9QaSMmsnucVx
	OBhRPhuUuum67V2fmmitbfYJ2C0qGXWt+/Tgd9uKQjRr+i7+hI04P0mb4ho+0DDtTTOI
	zf2d8gDDEcmMPXWsVj0phGbXkI/s44JScx/uXkWFWqVxZRam5zflzTqSh3UGBDFbPWHN
	+YQcu5jfz2km4q9kVlP7i3x8I+PfjrZwAAyAGzcwRXPg0kx1E1Q7jTRmWp545WiW/Ro/
	jr224fyToVoDfOUxy1+iQQ5qHvQhD4uzDjKSr8hedGdpzY0gwHt2AjUiTDoBfQVjTxiI
	Dx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NMkSWJSiyjNxPZHmsvW4evtwMxNz6IfGqCMuKJDOHyw=;
	b=JxwpKdM9d925+sCwIvubdlwMiDKNfIIXXjgc90QhWHKRv10vjFdV9pxV7TnhdOtJk9
	prwX47b9P/h8yzAC4QWCk9yZBqo+pB7l7nHWY+fj6Py3ZZ1lS+vzAnoNSYK6xCTVDq0c
	eeXqYgLmHXxAGzx3zvq3UHVwMDay9g9C05HiVf4nkrGzndD0r3OjGq8fNSRHzmZrUVNF
	aixRvRCKh+8Go+IVQGX7/LJUElfNMnT4c0AvB+j5jbc2jjaGvTGwUWi0Rj96BT0k40HS
	ZQSrxoF9BBk8Dz/vcLACFlDJt4Fx6nBN8cha9guGUNiGcAvCFIFcpXK2p78ZNhLQU3vh
	EizA==
X-Gm-Message-State: APjAAAXRpwBPaRQiLmODrYtiQ6eO8duv/XgoFSoqrGF3Fwf4U0JUZECm
	kFsikmBOWqcMTdsB6kK6mPX8ZHLD+GnMq9fOR7g=
X-Google-Smtp-Source: APXvYqzY5sX/gdE98RYTQLtc6Zv0eabf3R7YCtG9VBCNXvCoZuncq0BP1AhoQbzEWSlRD7gVZZKAjpRQFdjkxZI4HcY=
X-Received: by 2002:a05:620a:a9a:: with SMTP id
	v26mr23784854qkg.71.1572984513185; 
	Tue, 05 Nov 2019 12:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20191105180348.2868-1-alistair.francis@wdc.com>
In-Reply-To: <20191105180348.2868-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2019 12:08:22 -0800
Message-ID: <CAMKF1socKE+qHxhe8qFN_q0TvMtjgGdG2C1q-0s1J+bSF+E46g@mail.gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] machine/arch-riscv: Fix newlib and baremetal builds
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
X-List-Received-Date: Tue, 05 Nov 2019 20:08:33 -0000
Content-Type: multipart/alternative; boundary="000000000000254d5405969eff14"

--000000000000254d5405969eff14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2019 at 10:10 AM Alistair Francis <alistair.francis@wdc.com>
wrote:

> Fix the following errors for newlib and baremetal libcs:
> ld: unrecognized option '--hash-style=3Dsysv'
> ld: unrecognized option '--hash-style=3Dgnu'
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/conf/machine/include/riscv/arch-riscv.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc
> b/meta/conf/machine/include/riscv/arch-riscv.inc
> index 19f8f3e211..8ed9874389 100644
> --- a/meta/conf/machine/include/riscv/arch-riscv.inc
> +++ b/meta/conf/machine/include/riscv/arch-riscv.inc
> @@ -8,3 +8,8 @@ TUNE_CCARGS .=3D ""
>
>  # QEMU usermode fails with invalid instruction error (For riscv32)
>  MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D
> "${@bb.utils.contains('TUNE_FEATURES', 'riscv32', ' qemu-usermode', '', d=
)}"
> +
> +# Fix: ld: unrecognized option '--hash-style=3Dsysv'
> +LINKER_HASH_STYLE_libc-newlib =3D ""
> +# Fix: ld: unrecognized option '--hash-style=3Dgnu'
> +LINKER_HASH_STYLE_libc-baremetal =3D ""


Change is good. However comments could be unified into a single one where
It says =E2=80=94hash-style is unsupported

>
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000254d5405969eff14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Nov 5, 2019 at 10:10 AM Alistair Francis &lt;<a hre=
f=3D"mailto:alistair.francis@wdc.com">alistair.francis@wdc.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Fix the following errors for new=
lib and baremetal libcs:<br>
ld: unrecognized option &#39;--hash-style=3Dsysv&#39;<br>
ld: unrecognized option &#39;--hash-style=3Dgnu&#39;<br>
<br>
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/riscv/arch-riscv.inc | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/mac=
hine/include/riscv/arch-riscv.inc<br>
index 19f8f3e211..8ed9874389 100644<br>
--- a/meta/conf/machine/include/riscv/arch-riscv.inc<br>
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc<br>
@@ -8,3 +8,8 @@ TUNE_CCARGS .=3D &quot;&quot;<br>
<br>
=C2=A0# QEMU usermode fails with invalid instruction error (For riscv32)<br=
>
=C2=A0MACHINE_FEATURES_BACKFILL_CONSIDERED_append =3D &quot;${@bb.utils.con=
tains(&#39;TUNE_FEATURES&#39;, &#39;riscv32&#39;, &#39; qemu-usermode&#39;,=
 &#39;&#39;, d)}&quot;<br>
+<br>
+# Fix: ld: unrecognized option &#39;--hash-style=3Dsysv&#39;<br>
+LINKER_HASH_STYLE_libc-newlib =3D &quot;&quot;<br>
+# Fix: ld: unrecognized option &#39;--hash-style=3Dgnu&#39;<br>
+LINKER_HASH_STYLE_libc-baremetal =3D &quot;&quot;</blockquote><div dir=3D"=
auto"><br></div><div dir=3D"auto">Change is good. However comments could be=
 unified into a single one where</div><div dir=3D"auto">It says =E2=80=94ha=
sh-style is unsupported=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
-- <br>
2.23.0<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000254d5405969eff14--
