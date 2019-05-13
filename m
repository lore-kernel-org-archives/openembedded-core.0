Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
	[209.85.222.171])
	by mail.openembedded.org (Postfix) with ESMTP id DD3607DFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 15:43:34 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c14so8307556qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 08:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XgqXFhDs/JxU7B0UPqkDdT4W2VmyA0lX5zi5le6b/Zg=;
	b=nC7Rs0NW442jlcKyVav8+cvOoixFVBk9ib0/D85f8b8BdL06aKiD7IfyHEKBPqubDD
	EfRE6dmfKIWfjxCfgpQIt3YTSx00FG6ORwq6ZcQsb8gE8BgNcuZI0prgDLA05sAEtcjg
	ML7crzSLXCxaYhOx2EN0+gyOJvE1JTarFFoRY/TzGM/i8fHlbwKhRyvZAUa4vS5WhNIf
	nqMMUzlQMoiJcTUVm6IhEevlkmjwcBxZlgi3ndVW41Q6jfWdV/vbY3khKLhM9ogibhJf
	+cFoL0c8q/G4b16T2M//uaWvTTTzmJtgCYcXLVyLsNQfbbDFDDZia8zhNjQhg+q20BIR
	6OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XgqXFhDs/JxU7B0UPqkDdT4W2VmyA0lX5zi5le6b/Zg=;
	b=EktLxYxrkTTZ2lSuZcb61NgCLACqL1JxXzc/sunhsH+3e4Z1Wd8KcRwd4U2mqY21Op
	IR94N+Ob97QPYzmia39HJdUezmktp4/zSd16AB0gpw3ggmx5C+GRobNtVrQBP1ydbDxV
	wAsJNGkwAP9Ew28Dp2bz8BqMQF8LO/luuA0aJXlOSk9VfC9X34EYoKTLFAc2lCDc/SPL
	rQ2D0Ddbb2kXeoBrc51RssOMy6EcmaPYJVtQlO/kbiMaaFgBzje245TnSqHFSd6vcej9
	vp5fZ2UMSwS0/ykESvHHsdn9PXkjMcz9HJnqVcdoOf5gsC2gOER/Tt+DglaLL2/LTfXj
	6myQ==
X-Gm-Message-State: APjAAAVSU5KhwYKxjIeVtsbWvpo1Zm+ZrAD6uyH6GF/REqcl+FXhSnio
	XGaNeQj+rDy01GsoUb1lMM1/34mboCFYFEYoUsE=
X-Google-Smtp-Source: APXvYqwuZMbgK6pBGUip4feT8nTwPUz4kCOcFUl/C6aYtQDt6z9cKtW8rjjNNmVkXj28YDq7LCdn2JvVt5LtiSJhdqY=
X-Received: by 2002:a37:6445:: with SMTP id y66mr23836118qkb.102.1557762215611;
	Mon, 13 May 2019 08:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190513095255.157287-1-kai.kang@windriver.com>
	<20190513095255.157287-2-kai.kang@windriver.com>
In-Reply-To: <20190513095255.157287-2-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 08:43:24 -0700
Message-ID: <CAMKF1spxtnvC4VvwbecRijr=_H7pKDzFzQ3vj7PnBytUAByGRA@mail.gmail.com>
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] webkitgtk: fix compile error for arm64
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
X-List-Received-Date: Mon, 13 May 2019 15:43:35 -0000
Content-Type: multipart/alternative; boundary="0000000000008190fc0588c6c7c0"

--0000000000008190fc0588c6c7c0
Content-Type: text/plain; charset="UTF-8"

Can you test this on say rpi3 in 64bit mode and see all is ok ?

On Mon, May 13, 2019 at 2:53 AM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> It removes function JSC::AssemblerBuffer::data() for ARM64 in commit
> https://trac.webkit.org/changeset/236589/webkit. But the function is
> still required by Cortex A53 and fails to compile for arm64:
>
> |
> .../tmp/work/aarch64-poky-linux/webkitgtk/2.24.1-r0/webkitgtk-2.24.1/Source/JavaScriptCore/assembler/ARM64Assembler.h:3769:100:
> error: 'class JSC::AssemblerBuffer' has no member named 'data'
> |     if
> (UNLIKELY((*reinterpret_cast_ptr<int32_t*>(reinterpret_cast_ptr<char*>(m_buffer.data())
> + m_buffer.codeSize() - sizeof(int32_t)) & 0x0a000000) == 0x08000000))
>
> Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the failure.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.24.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
> index 771a893a6b..a57a3c058c 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.1.bb
> @@ -98,8 +98,6 @@ EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
>  EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
>  EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
>
> -EXTRA_OECMAKE_append_aarch64 = " -DWTF_CPU_ARM64_CORTEXA53=ON"
> -
>  # JIT not supported on MIPS either
>  EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF "
>
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008190fc0588c6c7c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Can you test this on say rpi3 in 64bit mode and see =
all is ok ?</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, May 13, 2019 at 2:53 AM &lt;<a href=3D"mailto=
:kai.kang@windriver.com">kai.kang@windriver.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@w=
indriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
It removes function JSC::AssemblerBuffer::data() for ARM64 in commit<br>
<a href=3D"https://trac.webkit.org/changeset/236589/webkit" rel=3D"noreferr=
er" target=3D"_blank">https://trac.webkit.org/changeset/236589/webkit</a>. =
But the function is<br>
still required by Cortex A53 and fails to compile for arm64:<br>
<br>
| .../tmp/work/aarch64-poky-linux/webkitgtk/2.24.1-r0/webkitgtk-2.24.1/Sour=
ce/JavaScriptCore/assembler/ARM64Assembler.h:3769:100: error: &#39;class JS=
C::AssemblerBuffer&#39; has no member named &#39;data&#39;<br>
|=C2=A0 =C2=A0 =C2=A0if (UNLIKELY((*reinterpret_cast_ptr&lt;int32_t*&gt;(re=
interpret_cast_ptr&lt;char*&gt;(m_buffer.data()) + m_buffer.codeSize() - si=
zeof(int32_t)) &amp; 0x0a000000) =3D=3D 0x08000000))<br>
<br>
Not set WTF_CPU_ARM64_CORTEXA53 for arm64 to fix the failure.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.1.bb</a> | 2 --<br>
=C2=A01 file changed, 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.1.bb=
" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.1.bb</a> b/meta/recip=
es-sato/webkit/<a href=3D"http://webkitgtk_2.24.1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">webkitgtk_2.24.1.bb</a><br>
index 771a893a6b..a57a3c058c 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.1.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.1.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.1.bb</a><br>
@@ -98,8 +98,6 @@ EXTRA_OECMAKE_append_aarch64 =3D &quot; -DUSE_LD_GOLD=3DO=
FF &quot;<br>
=C2=A0EXTRA_OECMAKE_append_mipsarch =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<b=
r>
=C2=A0EXTRA_OECMAKE_append_powerpc =3D &quot; -DUSE_LD_GOLD=3DOFF &quot;<br=
>
<br>
-EXTRA_OECMAKE_append_aarch64 =3D &quot; -DWTF_CPU_ARM64_CORTEXA53=3DON&quo=
t;<br>
-<br>
=C2=A0# JIT not supported on MIPS either<br>
=C2=A0EXTRA_OECMAKE_append_mipsarch =3D &quot; -DENABLE_JIT=3DOFF &quot;<br=
>
<br>
-- <br>
2.20.0<br>
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

--0000000000008190fc0588c6c7c0--
