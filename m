Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id 002647DFB2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:55:01 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id a39so14507979qtk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oyKckn2bzRpwmBJGvIEl5MqoIV7okB+ZAbmrvWTOr9s=;
	b=PGqePLh/PPvvb8v7OaCFOPOXaEhM+AhxLFozA7W1uDXAmh7Fc5jL57F8giq4V5WiGP
	3zfx4zVtPF04u7i0/CnpKC1n4DzJkvQtNEAec14DT9q2qbk3IaFvodPS/VgDmY2+Vn7s
	VM30X/ilZoozwD9Y/36Ztf7VOvp9GWwdJzM5dO9X+dPS9xJzj8OnfbOsOgW1aVB7g9Po
	SJ56Brhim09Ae0mh+U4y1B4LZV/DXaGXl4yJOasz7pP32M+50oYwr6HWgxHV3A+Lnwl2
	mF9sb9Cvuc/IITrkdDBk0x3a/PJILT8mqKix66w2AHhDhEHts+dNX0Oesmice5BTxMlB
	Yh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oyKckn2bzRpwmBJGvIEl5MqoIV7okB+ZAbmrvWTOr9s=;
	b=Q4m5tmh48fQf77dTU9M3+2aJkC62/ds/w3PLHxh8Jbuk+uxAoRG4DM7d4TrTRTE0zJ
	L3tMgFdU3AwQEf+i/+/hMP7h1vFtzsQuRvHxcAgIv4DQaxApS7JdOdtUJ1p+PmYgnBdx
	39Pe+yxsaocIKW9+IyzsVE9XfiFowEopIJ+9JK1LW6YdDNoIG5PrtJeT7RJG2C4IVYrw
	cTNxS1FEyLsfI1bzyTtS2jyQRnaBmF3a84yvLw818LVhoOct/VrD2dVJUIzUNZKptAmo
	AMoZQvjx7vbPN0EP8N6GBRo0GiXoPk/h3Dr3I5bEVsPLPgzP8VY3fAjTlOAHsAbGtFgP
	rWLA==
X-Gm-Message-State: APjAAAXRylzpT1gL0lM1JjvONAtPHOULX6S79M0jMWsAVMS/YwpC0HzE
	Dkia8ByEZ2CKf3TKSUocbHmaYxwA8bT5Kkcr1VO/hvgS
X-Google-Smtp-Source: APXvYqwU01FD4GAJo8tslISHtG6NbDXMcnzwCcfVLfs92nBDC2pCSCv7NVoMHMCEpkfOnw/Uq5tX74P5CuF0vW07UX4=
X-Received: by 2002:ac8:22d3:: with SMTP id g19mr2812406qta.236.1557762901844; 
	Mon, 13 May 2019 08:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
In-Reply-To: <20190513153303.50095-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 08:54:50 -0700
Message-ID: <CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 15:55:02 -0000
Content-Type: multipart/alternative; boundary="00000000000068a7f20588c6f0f0"

--00000000000068a7f20588c6f0f0
Content-Type: text/plain; charset="UTF-8"

On Mon, May 13, 2019 at 8:33 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This matches what the qemux86_64 is currently using, and
> will allow testing the instructions added in the meantime;
> particularly various SSE extensions are now enabled.
>

While I like this change I also worry if we are leaving out any significant
x86 implementation out there in embedded space x86-64 is relatively newer
compared to 32 bit which was long stable

>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/machine/include/qemuboot-x86.inc | 4 ++--
>  meta/conf/machine/qemux86.conf             | 3 +--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/machine/include/qemuboot-x86.inc
> b/meta/conf/machine/include/qemuboot-x86.inc
> index 5fdbe4df50e..82ce46d8604 100644
> --- a/meta/conf/machine/include/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/qemuboot-x86.inc
> @@ -1,8 +1,8 @@
>  # For runqemu
>  IMAGE_CLASSES += "qemuboot"
>  QB_SYSTEM_NAME_x86 = "qemu-system-i386"
> -QB_CPU_x86 = "-cpu pentium2"
> -QB_CPU_KVM_x86 = "-cpu pentium2"
> +QB_CPU_x86 = "-cpu core2duo"
> +QB_CPU_KVM_x86 = "-cpu core2duo"
>
>  QB_SYSTEM_NAME_x86-64 = "qemu-system-x86_64"
>  QB_CPU_x86-64 = "-cpu core2duo"
> diff --git a/meta/conf/machine/qemux86.conf
> b/meta/conf/machine/qemux86.conf
> index f2434a4b5f5..272ad1e1870 100644
> --- a/meta/conf/machine/qemux86.conf
> +++ b/meta/conf/machine/qemux86.conf
> @@ -8,8 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
>
>  require conf/machine/include/qemu.inc
> -DEFAULTTUNE ?= "i586"
> -X86ARCH32 ?= "i586"
> +DEFAULTTUNE ?= "core2-32"
>  require conf/machine/include/tune-corei7.inc
>  require conf/machine/include/qemuboot-x86.inc
>
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000068a7f20588c6f0f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, May 13, 2019 at 8:33 AM Alexander Kanavin &lt;<a hr=
ef=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">This matches what the qemux86_64 is=
 currently using, and<br>
will allow testing the instructions added in the meantime;<br>
particularly various SSE extensions are now enabled.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">While I like thi=
s change I also worry if we are leaving out any significant x86 implementat=
ion out there in embedded space x86-64 is relatively newer compared to 32 b=
it which was long stable=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.c=
om" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/machine/include/qemuboot-x86.inc | 4 ++--<br>
=C2=A0meta/conf/machine/qemux86.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 3 +--<br>
=C2=A02 files changed, 3 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine=
/include/qemuboot-x86.inc<br>
index 5fdbe4df50e..82ce46d8604 100644<br>
--- a/meta/conf/machine/include/qemuboot-x86.inc<br>
+++ b/meta/conf/machine/include/qemuboot-x86.inc<br>
@@ -1,8 +1,8 @@<br>
=C2=A0# For runqemu<br>
=C2=A0IMAGE_CLASSES +=3D &quot;qemuboot&quot;<br>
=C2=A0QB_SYSTEM_NAME_x86 =3D &quot;qemu-system-i386&quot;<br>
-QB_CPU_x86 =3D &quot;-cpu pentium2&quot;<br>
-QB_CPU_KVM_x86 =3D &quot;-cpu pentium2&quot;<br>
+QB_CPU_x86 =3D &quot;-cpu core2duo&quot;<br>
+QB_CPU_KVM_x86 =3D &quot;-cpu core2duo&quot;<br>
<br>
=C2=A0QB_SYSTEM_NAME_x86-64 =3D &quot;qemu-system-x86_64&quot;<br>
=C2=A0QB_CPU_x86-64 =3D &quot;-cpu core2duo&quot;<br>
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.con=
f<br>
index f2434a4b5f5..272ad1e1870 100644<br>
--- a/meta/conf/machine/qemux86.conf<br>
+++ b/meta/conf/machine/qemux86.conf<br>
@@ -8,8 +8,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?=3D &quot;mesa&quot;<b=
r>
=C2=A0PREFERRED_PROVIDER_virtual/libgles2 ?=3D &quot;mesa&quot;<br>
<br>
=C2=A0require conf/machine/include/qemu.inc<br>
-DEFAULTTUNE ?=3D &quot;i586&quot;<br>
-X86ARCH32 ?=3D &quot;i586&quot;<br>
+DEFAULTTUNE ?=3D &quot;core2-32&quot;<br>
=C2=A0require conf/machine/include/tune-corei7.inc<br>
=C2=A0require conf/machine/include/qemuboot-x86.inc<br>
<br>
-- <br>
2.17.1<br>
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

--00000000000068a7f20588c6f0f0--
