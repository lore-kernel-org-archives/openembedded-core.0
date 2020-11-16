Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com [209.85.219.193])
 by mx.groups.io with SMTP id smtpd.web12.32782.1605523659467181514
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 02:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SallOcZm;
 spf=pass (domain: gmail.com, ip: 209.85.219.193, mailfrom: wonmin82@gmail.com)
Received: by mail-yb1-f193.google.com with SMTP id o71so14921272ybc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 02:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OOsOv3L8NIo3wYMvnTWKQ+V8Rz5dDv2XmrEstn1d9Ks=;
        b=SallOcZmzAjl9ylhUjZYv4gFelRGw63NF6VzAMt0Yjflgpkl4XMKuo3I+z3A8WNZQk
         ziGHRyHAZ6u92dDBLDr/dfZSlqO3BK0hByfamu9bx/qGokKT3PXneh6lJWZaujUlzrcU
         zv+IDbVZ3i+IPCv1M6l7+bnHj6R38bcGeMANm5T7hEZuq3NbpEGGVDb1MH1Q13B7Ddi4
         7eDpPJI0zaOkPvhphtG8Jyj3aPSCMwGVJ+DVQPbTyluEfkCDaFVNq1dMtoY4cfXy5+4W
         Jr674hlVCTNzqt/xUIAm77oVw1N4ut/bve7gJYL9w1ATS/gkeBgzyCDM3/Z6ZgU3s4kH
         3cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OOsOv3L8NIo3wYMvnTWKQ+V8Rz5dDv2XmrEstn1d9Ks=;
        b=gVEwTj0owFTdEh4ElJnhn4QJ4GWv/bc5allFazJ7HWmukB7xIENUtitLv7u9uPvTiV
         EG8T5g4hclzlc5QsegK6YT58gEjBRoitIDIbrYYSIzFugZ3h9+slHBT2rBEcqs3MHKaL
         PoaGC3ziSX3BancXqa7xM3xxPGZDr+fqQCP1kqIqbhiUPk2zJHZ0ZssW1KeE5uIGZ66v
         UCb/qn7RJVT9L6h7gUlI7UNHgQXaEX/FXJkLs2DV7Ui244B+pUyPEDNNwIIVPNmr/xk0
         yltXynTVO6lMe18Dn9yNOCXqrrkMHHyCHJxxI2nV4jYVxDakOew1hAlKlwTNuYjOGIyL
         Fnfg==
X-Gm-Message-State: AOAM533NYbA6tLS9kITR4fmbVIlyvfLllud/VS1csvDzMmP0gge3HjxW
	oQk99/VppwyCpKX/GAldezSO60oQrTc8VvSLN8M=
X-Google-Smtp-Source: ABdhPJzN+0cs1yCKlbfQxHNq1Gikd4UpNPGl9HL8GJlL3CIRixPQY6LAKnZn2IoMOcHDWPqyMdSNOIIwA9JWu81QS+Y=
X-Received: by 2002:a25:6a84:: with SMTP id f126mr13980540ybc.271.1605523658331;
 Mon, 16 Nov 2020 02:47:38 -0800 (PST)
MIME-Version: 1.0
References: <20201116094542.4688-1-wonmin82@gmail.com> <CA+aJhH0gFx118Ync4w5Gie+4YxMPELOo3DGSHNOsNKQDtYZUMA@mail.gmail.com>
In-Reply-To: <CA+aJhH0gFx118Ync4w5Gie+4YxMPELOo3DGSHNOsNKQDtYZUMA@mail.gmail.com>
From: "Wonmin Jung" <wonmin82@gmail.com>
Date: Mon, 16 Nov 2020 19:47:27 +0900
Message-ID: <CAERc5vcw_UQrFXFByFzPovwFkGvwRd07eMuttUPWH8bXDU_tfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cml1: Set proper LD while during kernel menuconfig
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000555bd705b4371b14"

--000000000000555bd705b4371b14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good point. I'll submit another patch after build test.

2020=EB=85=84 11=EC=9B=94 16=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84 7:33,=
 Nathan Rossi <nathan@nathanrossi.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1=
:

> On Mon, 16 Nov 2020 at 19:46, Wonmin Jung <wonmin82@gmail.com> wrote:
> >
> > With 'ld-is-gold' and linux kernel 5.4 or later, menuconfig
> > task for kernel recipes will fail with:
> >
> > $ bitbake -c menuconfig virtual/kernel
> > ...
> > scripts/kconfig/mconf  Kconfig
> > scripts/Kconfig.include:43:  gold linker 'x86_64-poky-linux-ld' not
> supported
> >
> /OE/build/tmp/work-shared/qemux86-64/kernel-source/scripts/kconfig/Makef=
ile:29:
> >  recipe for target 'menuconfig' failed
> > make[2]: *** [menuconfig] Error 1
> > /OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:606:
> >  recipe for target 'menuconfig' failed
> > make[1]: *** [menuconfig] Error 2
> > /OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:185:
> >  recipe for target '__sub-make' failed
> > make: *** [__sub-make] Error 2
> > Command failed.
> >
> > This is because that the KERNEL_LD variable already set in
> > kernel-arch.bbclass isn't used by do_menuconfig function of
> > cml1.bbclass.
> >
> > To fix this issue specify LD variable while calling the kernel
> > menuconfig command.
> >
> > Signed-off-by: Wonmin Jung <wonmin82@gmail.com>
> > ---
> >  meta/classes/cml1.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> > index d319d66ab2..02cd058fc5 100644
> > --- a/meta/classes/cml1.bbclass
> > +++ b/meta/classes/cml1.bbclass
> > @@ -48,7 +48,7 @@ python do_menuconfig() {
> >      # ensure that environment variables are overwritten with this tas=
ks
> 'd' values
> >      d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_DIR PKG_CONFIG_PA=
TH
> PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
> >
> > -    oe_terminal("sh -c \"make %s; if [ \\$? -ne 0 ]; then echo 'Comma=
nd
> failed.'; printf 'Press any key to continue... '; read r; fi\"" %
> d.getVar('KCONFIG_CONFIG_COMMAND'),
> > +    oe_terminal("sh -c \"make LD=3D${KERNEL_LD} %s; if [ \\$? -ne 0 ]=
;
> then echo 'Command failed.'; printf 'Press any key to continue... '; rea=
d
> r; fi\"" % d.getVar('KCONFIG_CONFIG_COMMAND'),
>
> I don't think this is the right place to be setting this, since cml1
> is not only for the kernel. I think a better place to set this would
> be in kernel.bbclass, alongside the existing HOSTLDFLAGS setting
> through KCONFIG_CONFIG_COMMAND.
> (
> https://git.openembedded.org/openembedded-core/tree/meta/classes/kernel.=
bbclass#n589
> )
>
> Regards,
> Nathan
>
>
> >                  d.getVar('PN') + ' Configuration', d)
> >
> >      # FIXME this check can be removed when the minimum bitbake versio=
n
> has been bumped
> > --
> > 2.29.2
> >
> >
> >=20
> >
>
--=20

*Wonmin Jung*
Senior Research Engineer
Software Platform R&D Lab.
CTO Division
LG Electronics Inc.

C/P: 82-10-2793-5301
E-mail: wonmin82@gmail.com, wonmin.jung@lge.com
Skype, Google Hangout: wonmin82@gmail.com
<http://www.drjung.net>

--000000000000555bd705b4371b14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Good point. I&#39;ll submit another patch after build tes=
t.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">2020=EB=85=84 11=EC=9B=94 16=EC=9D=BC (=EC=9B=94) =EC=98=A4=ED=9B=84=
 7:33, Nathan Rossi &lt;<a href=3D"mailto:nathan@nathanrossi.com">nathan@na=
thanrossi.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">On Mon, 16 Nov 2020 at 19:46, Wonmin Jung &lt;<a href=3D"mailto:=
wonmin82@gmail.com" target=3D"_blank">wonmin82@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; With &#39;ld-is-gold&#39; and linux kernel 5.4 or later, menuconfig<b=
r>
&gt; task for kernel recipes will fail with:<br>
&gt;<br>
&gt; $ bitbake -c menuconfig virtual/kernel<br>
&gt; ...<br>
&gt; scripts/kconfig/mconf=C2=A0 Kconfig<br>
&gt; scripts/Kconfig.include:43:=C2=A0 gold linker &#39;x86_64-poky-linux-=
ld&#39; not supported<br>
&gt; /OE/build/tmp/work-shared/qemux86-64/kernel-source/scripts/kconfig/Ma=
kefile:29:<br>
&gt;=C2=A0 recipe for target &#39;menuconfig&#39; failed<br>
&gt; make[2]: *** [menuconfig] Error 1<br>
&gt; /OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:606:<br>
&gt;=C2=A0 recipe for target &#39;menuconfig&#39; failed<br>
&gt; make[1]: *** [menuconfig] Error 2<br>
&gt; /OE/build/tmp/work-shared/qemux86-64/kernel-source/Makefile:185:<br>
&gt;=C2=A0 recipe for target &#39;__sub-make&#39; failed<br>
&gt; make: *** [__sub-make] Error 2<br>
&gt; Command failed.<br>
&gt;<br>
&gt; This is because that the KERNEL_LD variable already set in<br>
&gt; kernel-arch.bbclass isn&#39;t used by do_menuconfig function of<br>
&gt; cml1.bbclass.<br>
&gt;<br>
&gt; To fix this issue specify LD variable while calling the kernel<br>
&gt; menuconfig command.<br>
&gt;<br>
&gt; Signed-off-by: Wonmin Jung &lt;<a href=3D"mailto:wonmin82@gmail.com" =
target=3D"_blank">wonmin82@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/cml1.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass<br=
>
&gt; index d319d66ab2..02cd058fc5 100644<br>
&gt; --- a/meta/classes/cml1.bbclass<br>
&gt; +++ b/meta/classes/cml1.bbclass<br>
&gt; @@ -48,7 +48,7 @@ python do_menuconfig() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # ensure that environment variables are overwritt=
en with this tasks &#39;d&#39; values<br>
&gt;=C2=A0 =C2=A0 =C2=A0 d.appendVar(&quot;OE_TERMINAL_EXPORTS&quot;, &quo=
t; PKG_CONFIG_DIR PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR&=
quot;)<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 oe_terminal(&quot;sh -c \&quot;make %s; if [ \\$? -ne =
0 ]; then echo &#39;Command failed.&#39;; printf &#39;Press any key to cont=
inue... &#39;; read r; fi\&quot;&quot; % d.getVar(&#39;KCONFIG_CONFIG_COMMA=
ND&#39;),<br>
&gt; +=C2=A0 =C2=A0 oe_terminal(&quot;sh -c \&quot;make LD=3D${KERNEL_LD} =
%s; if [ \\$? -ne 0 ]; then echo &#39;Command failed.&#39;; printf &#39;Pre=
ss any key to continue... &#39;; read r; fi\&quot;&quot; % d.getVar(&#39;KC=
ONFIG_CONFIG_COMMAND&#39;),<br>
<br>
I don&#39;t think this is the right place to be setting this, since cml1<b=
r>
is not only for the kernel. I think a better place to set this would<br>
be in kernel.bbclass, alongside the existing HOSTLDFLAGS setting<br>
through KCONFIG_CONFIG_COMMAND.<br>
(<a href=3D"https://git.openembedded.org/openembedded-core/tree/meta/class=
es/kernel.bbclass#n589" rel=3D"noreferrer" target=3D"_blank">https://git.op=
enembedded.org/openembedded-core/tree/meta/classes/kernel.bbclass#n589</a>)=
<br>
<br>
Regards,<br>
Nathan<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d.getVa=
r(&#39;PN&#39;) + &#39; Configuration&#39;, d)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # FIXME this check can be removed when the minimu=
m bitbake version has been bumped<br>
&gt; --<br>
&gt; 2.29.2<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">=
<b>Wonmin Jung<br></b><br>Senior Research Engineer<br>Software Platform R&a=
mp;D Lab.<br>CTO Division<br>LG Electronics Inc.<br><br>C/P: 82-10-2793-530=
1<br>E-mail: <a href=3D"mailto:wonmin82@gmail.com" target=3D"_blank">wonmin=
82@gmail.com</a>, <a href=3D"mailto:wonmin.jung@lge.com" target=3D"_blank">=
wonmin.jung@lge.com</a><br>Skype, Google Hangout: <a href=3D"mailto:wonmin8=
2@gmail.com" target=3D"_blank">wonmin82@gmail.com</a><a href=3D"http://www.=
drjung.net" target=3D"_blank"><br></a></div></div></div></div>

--000000000000555bd705b4371b14--
