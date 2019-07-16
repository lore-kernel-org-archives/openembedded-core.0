Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 483837ECB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 15:33:13 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id t8so14937560qkt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 08:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mAWKvVP2zP9P8jLh/J7HnD/byAdn9+mYJ/ydymJqQBc=;
	b=haD9jzLSPeR+iUEXZhrxubePtt7/QrL+aOtxxFIJsu5FLr0D3LrjmzrPNSY4mIzlSe
	y+eek/gtHIJXlYPcu4xXh0lnFwDCr8Smlyk5SG+eJlqWrlreVwPK2DnlazaKTWZtr7oY
	NmR97OVAFwOlWN+DW/scH2vzSEkIPBn597sRnJNr77WcM5IePHuyrFXhElrcO+csUgmO
	edTj3BM4LwOSyNO9tslv6YNCc5H0Vf3vKQhZhEkcq+0vm/C1cOJjAJp9D7yv6iHrErI9
	wm6lim/kHNOfBFYp6dji7pnMb68dz68ifOkYw0o0sECb4ZBW0f7pgiWmiDTPBo3a5MLE
	9Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mAWKvVP2zP9P8jLh/J7HnD/byAdn9+mYJ/ydymJqQBc=;
	b=O96CbSeLb7WoI8fQk/Bf79R6mOGWwV+SFI0Tg4xuAXFXel8mpQfm2sK2KW8MelJOcy
	a2G2iHG7/A6g7PJrBm4f6FBZvhhGbLLS/FcmV8ogYVAPujE8scw6WjKyjijKf3tSKfik
	6jbyKI0cSeDA3Z4by3+ZaiC2n3e78hoMPIe+cxvALm+t5A8aeKHhbJ359j6GkE/Fldfw
	bdSEp1yIaqxYgUrdilLff9naPGF52MMacJ7xYd740hon+bNWR7/U8vZ7cWTglOiuPaoe
	aKAc27ya7qeBn5DliTELW4EMGWau3EQDy9psWyl0xIJR+uSQMv9EiqIW0ANoI/MrbvOJ
	APdw==
X-Gm-Message-State: APjAAAVkmy7+ahJsiH6EmP79yux7BNotnec1GQybHmjzZoRXN6BNjWgg
	pk9KoKQPN3YneIUrTcXfXxwzPNxOCqhLRYpPqZ8=
X-Google-Smtp-Source: APXvYqyVHVYlYI9z88WwJFLGMUkW9LHT7dtSHlhKgxeTMsM0s0BnpkShuiWBOGHfQlbIc25rS5x6AqWbOOE/yKYq91U=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr22029960qke.212.1563291193948;
	Tue, 16 Jul 2019 08:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190715102016.114264-1-kai.kang@windriver.com>
	<CAMKF1sq8rpdxdH2Yr8bHze06-R3hsmLTDdSLkX-TEj4utY2VYQ@mail.gmail.com>
	<0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
In-Reply-To: <0f664af2-cea3-aaa2-2a7c-74c43d58ced4@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 08:33:02 -0700
Message-ID: <CAMKF1spSOgaLYgy6U3r=wXNPcMA+qyy1Oigpob42xFAOFugbvA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: set incomptible with tune mips
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
X-List-Received-Date: Tue, 16 Jul 2019 15:33:13 -0000
Content-Type: multipart/alternative; boundary="0000000000004bbf53058dce1831"

--0000000000004bbf53058dce1831
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2019 at 2:33 AM Kang Kai <Kai.Kang@windriver.com> wrote:

> On 2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Raj wrote:
> > On Mon, Jul 15, 2019 at 3:21 AM <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> It fails to compile webkit when default tune is 'mips':
> >>
> >> | .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-2.24=
.2
> >> | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:
> >> | error: static assertion failed: CLZ opcode is not available for this
> ISA
> >>
> >> So don't build webkit when default tune is mips.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   meta/recipes-sato/webkit/webkitgtk_2.24.2.bb | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> >> index 056334fff5..891266b220 100644
> >> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> >> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.2.bb
> >> @@ -43,6 +43,8 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo
> libxslt libxt libidn libgcrypt \
> >>             gettext-native glib-2.0 glib-2.0-native libtasn1 \
> >>             "
> >>
> >> +COMPATIBLE_HOST_mipsarch =3D "${@bb.utils.contains('DEFAULTTUNE',
> 'mips', 'null', 'mips.*-linux', d)}"
> >> +
> > this disables is for all kind of mips. I think thats a broad set, it
> > would be best to narrow it to what you saw it failing for
> > e.g. it should work for mips32 and mips64 so maybe mips1 is what you
> > want to disable for
>
> I tested with qemumips and qemumips64. When set
>
> DEFAULTTUNE=3D "mips"


How about using mips32 and mips64 for default tune and retest

>
>
> It fails with the error.
>
> Regards,
> Kai
>
> >
> >
> >>   PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'x11', 'wayland' ,d)} \
> >>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl',
> 'webgl opengl', '' ,d)} \
> >>                      enchant \
> >> --
> >> 2.20.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Kai Kang
>
>

--0000000000004bbf53058dce1831
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jul 16, 2019 at 2:33 AM Kang Kai &lt;<a href=3D"mai=
lto:Kai.Kang@windriver.com">Kai.Kang@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">On 2019/7/16 =E4=B8=8B=E5=8D=883:19, Khem Ra=
j wrote:<br>
&gt; On Mon, Jul 15, 2019 at 3:21 AM &lt;<a href=3D"mailto:kai.kang@windriv=
er.com" target=3D"_blank">kai.kang@windriver.com</a>&gt; wrote:<br>
&gt;&gt; From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; It fails to compile webkit when default tune is &#39;mips&#39;:<br=
>
&gt;&gt;<br>
&gt;&gt; | .../tmp-glibc/work/mips-wrs-linux/webkitgtk/2.24.2-r0/webkitgtk-=
2.24.2<br>
&gt;&gt; | /Source/JavaScriptCore/assembler/MacroAssemblerMIPS.h:418:23:<br=
>
&gt;&gt; | error: static assertion failed: CLZ opcode is not available for =
this ISA<br>
&gt;&gt;<br>
&gt;&gt; So don&#39;t build webkit when default tune is mips.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.c=
om" target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2=
.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a> | 2 =
++<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_=
2.24.2.bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a> b/m=
eta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.2.bb" rel=3D"noref=
errer" target=3D"_blank">webkitgtk_2.24.2.bb</a><br>
&gt;&gt; index 056334fff5..891266b220 100644<br>
&gt;&gt; --- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.2.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a><br>
&gt;&gt; +++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.24.2.=
bb" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.24.2.bb</a><br>
&gt;&gt; @@ -43,6 +43,8 @@ DEPENDS =3D &quot;zlib libsoup-2.4 curl libxml2 =
cairo libxslt libxt libidn libgcrypt \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gettext-native glib=
-2.0 glib-2.0-native libtasn1 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt;<br>
&gt;&gt; +COMPATIBLE_HOST_mipsarch =3D &quot;${@bb.utils.contains(&#39;DEFA=
ULTTUNE&#39;, &#39;mips&#39;, &#39;null&#39;, &#39;mips.*-linux&#39;, d)}&q=
uot;<br>
&gt;&gt; +<br>
&gt; this disables is for all kind of mips. I think thats a broad set, it<b=
r>
&gt; would be best to narrow it to what you saw it failing for<br>
&gt; e.g. it should work for mips32 and mips64 so maybe mips1 is what you<b=
r>
&gt; want to disable for<br>
<br>
I tested with qemumips and qemumips64. When set<br>
<br>
DEFAULTTUNE=3D &quot;mips&quot;</blockquote><div dir=3D"auto"><br></div><di=
v dir=3D"auto">How about using mips32 and mips64 for default tune and retes=
t=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
<br>
It fails with the error.<br>
<br>
Regards,<br>
Kai<br>
<br>
&gt;<br>
&gt;<br>
&gt;&gt;=C2=A0 =C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;DI=
STRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#39;, &#39;wayland&#39; ,d)} \<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opengl&#39;=
, &#39;webgl opengl&#39;, &#39;&#39; ,d)} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 enchant \<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.0<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=
=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.o=
rg/mailman/listinfo/openembedded-core</a><br>
<br>
<br>
-- <br>
Kai Kang<br>
<br>
</blockquote></div></div>

--0000000000004bbf53058dce1831--
