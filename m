Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A381ACCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 12:42:32 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.19284.1761223346915634174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 05:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICT3N/ik;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-791fd6bffbaso9191726d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761223346; x=1761828146; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0aeWdD1ld8lYVQ7SU+4N7HJwd/lW+ULr053QgaWsSo=;
        b=ICT3N/ikSm10BMZmr6X9WlZ8G/9Qq6uWnHxzz5frHgz5kCrg5LwDDZeWHODcDM3CEP
         ztMfnSmsf8Qwt+vkrDjr5PBDN8lBDwzJigpK+m5vcE/uUhSpm7b0RtKlx8Da5O2j392n
         OEPpLzWHIbDd/ezT2p/8hGJgD6z3QloKUTA9LYctUSZKzV5DTYw5lqfRKmYddksU4QUf
         GIZEVvaWllGK2VZQzhflO/2OR548nSqyHSuf5me9ajqjDkL6sVldmRQg0zVCMTa9MG+T
         hkUv8cWA7UGpDc34P67N659nXwsJvO3tJehbiUXYmufdOAUnU3VRdyvw8wpnua4QGWOb
         l2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761223346; x=1761828146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0aeWdD1ld8lYVQ7SU+4N7HJwd/lW+ULr053QgaWsSo=;
        b=u+fK1EApoFGjv5ipaod0GouFR63CSpCWVNVSpNcl7mkO9UfLrHOfoNK8HsDGUuQBdr
         blq/At/DooNu65f0b1IGONQ+G7GTY9FQMp3aHabw3UnVyA347jCo9Smb9p1hE+d5GCXY
         DFRMg63OVorexjXUGmkKxnG0OzY8ww/eV15triy5Io6nrz7zib1D0gbld3DIzDI/YeCL
         R8m2UVXWE09Ymm6ZLM3Kz1VFiXNbHPXGLYlHak2BbU3Za5WWYY8hXHyeaXvyzPez3Ua7
         5jsCZGQdJ321IuBx1t/DBmZ/UttuwMYk0d/RVZwvk1T0SxYLgWbFBAP3u8a09UpJUgxb
         ypsw==
X-Forwarded-Encrypted: i=1; AJvYcCUdGP292X+HGzf9t67uW2dadESW8yisQMfyBcop+J40Hp3q260bI81jSG2BsKCvhVs3FWmePrf7TT/rAO3N67IjDQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyHdgm9qBaczfjoHyFScMd396NslruQFG6v35bWD3SWywY0d+PO
	qq0DboGWo2/EtLkZ0gNhbpvRu9wJukgiZV1QEdGtL278f/zQuMzsR0W78eMaux2bQ5Tzaje11AU
	ucADei6RO4JUymd+em4/wfEzCy2Q7WueJKA==
X-Gm-Gg: ASbGnctwiZzCBmuR+MGmG2y/hOuVZB7yIPoP17nDpshivgtM3yDkgYXcqXmUe8at3Il
	bW/pu4A0fPsepdwMNY1dIVFxNYWdTw53pdAsuMo62fQO11OasVxTozt5uklKbBMZOFm8I4BuhNb
	qydj6VmuJqa2oh8FTA72GQyah+56A5wnFLgd+ZpCnSaXJ/IA8L1wWKsrpX3CJ61cmAmvRPEBAZU
	urp689dDzjH5ZGoWWp+9fv/lI3dASpzUNEWjMqES0NY7d7mn/avFyWgB/5LbRKoN6g+/V7KpS3p
	El78pHXDucsUYJTWGcPNDz06GrrTlsfiLcNxec9tvli5jZ+Xb5ND9j3eafjC3/2mL6JBnSDE5v2
	cdNZ3Gf35lWOLQieqa+ZyvD1C
X-Google-Smtp-Source: AGHT+IGN9iOUyjXVy//IBWyWQKBqLwtidoHBe/8ehNVGW+SQwJhH/TLMNW8XInUU03LNok/Bq08ncDOmXWrm/UC7ywQ=
X-Received: by 2002:a05:6214:c8e:b0:87c:1a11:18f4 with SMTP id
 6a1803df08f44-87c2055e675mr352416456d6.14.1761223345861; Thu, 23 Oct 2025
 05:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20251023113444.882980-1-Deepesh.Varatharajan@windriver.com> <DB5PR02MB10213E4328893EEA9261CDC5BEFF0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213E4328893EEA9261CDC5BEFF0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Oct 2025 14:41:55 +0200
X-Gm-Features: AWmQ_bkavl1rUxvMBcopve26QQW9smM4Kt7G99zkrAjfeI82A-kqUD-acwmdfX8
Message-ID: <CANNYZj-mn6jTeUV4Q+vRk_Nrpo0A2ob5qywceU5o=d0dGH-8Mg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] conf/bitbake.conf: Remove debug flags for
 native and nativesdk builds
To: peter.kjellerstedt@axis.com
Cc: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000e677e60641d2c30d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 12:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225254

--000000000000e677e60641d2c30d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, absolutely. You=E2=80=99d be surprised how often something native cras=
hes or
exhibits unusual behaviour and then debugging it in gdb is absolutely
essential.

Alex

On Thu 23. Oct 2025 at 14.00, Peter Kjellerstedt via lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Varatharajan,
> Deepesh via lists.openembedded.org
> > Sent: den 23 oktober 2025 13:35
> > To: openembedded-core@lists.openembedded.org
> > Cc: Sundeep.Kokkonda@windriver.com; Deepesh.Varatharajan@windriver.com
> > Subject: [OE-core] [PATCH] conf/bitbake.conf: Remove debug flags for
> native and nativesdk builds
> >
> > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >
> > The native and nativesdk builds were previously using the '-Og -g' flag=
s
> > during debug builds. This resulted in increased disk usage and few link=
er
> > memory issues due to the large debug information generated.
> >
> > Since native and nativesdk components do not require debug symbols,
> > update the build flags to use '-O2' instead of '-Og -g' for these build=
s.
> > This reduces build size and avoids memory-related issues during linking=
.
> >
> > Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 5406e542db..d8f9f6c312 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -663,7 +663,7 @@ DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
> >  SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> >  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZAT=
ION
> DEBUG_BUILD"
> >  # compiler flags for native/nativesdk
> > -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g',
> '-O2', d)}"
> > +BUILD_OPTIMIZATION =3D '-O2'
> >  BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
> >
> >  ##################################################################
> > --
> > 2.49.0
>
> I am sorry, but I must be missing something. If I enable DEBUG_BUILD for
> a native recipe, I definitely expect it to be compiled with -Og so I can
> debug it in gdb.
>
> If what you really want to do is enable debug for all target recipes,
> then use DEBUG_BUILD:class-target =3D "1" in your local.conf instead.
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225247):
> https://lists.openembedded.org/g/openembedded-core/message/225247
> Mute This Topic: https://lists.openembedded.org/mt/115908796/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e677e60641d2c30d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, absolutely. You=E2=80=99d be surprised how often som=
ething native crashes or exhibits unusual behaviour and then debugging it i=
n gdb is absolutely essential.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Alex</div><div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu 23. Oct 2025 at 14.00, Peter K=
jellerstedt via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;peter.kjellerstedt=3D<a href=3D"mailto:axis.com@lists.openemb=
edded.org">axis.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,2=
04,204)">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Varatharajan, Deepesh =
via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"=
_blank">lists.openembedded.org</a><br>
&gt; Sent: den 23 oktober 2025 13:35<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: <a href=3D"mailto:Sundeep.Kokkonda@windriver.com" target=3D"_blank=
">Sundeep.Kokkonda@windriver.com</a>; <a href=3D"mailto:Deepesh.Varatharaja=
n@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a><b=
r>
&gt; Subject: [OE-core] [PATCH] conf/bitbake.conf: Remove debug flags for n=
ative and nativesdk builds<br>
&gt; <br>
&gt; From: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Varatharajan@=
windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.com</a>&gt;=
<br>
&gt; <br>
&gt; The native and nativesdk builds were previously using the &#39;-Og -g&=
#39; flags<br>
&gt; during debug builds. This resulted in increased disk usage and few lin=
ker<br>
&gt; memory issues due to the large debug information generated.<br>
&gt; <br>
&gt; Since native and nativesdk components do not require debug symbols,<br=
>
&gt; update the build flags to use &#39;-O2&#39; instead of &#39;-Og -g&#39=
; for these builds.<br>
&gt; This reduces build size and avoids memory-related issues during linkin=
g.<br>
&gt; <br>
&gt; Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh.Vara=
tharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriver.co=
m</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/bitbake.conf | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
&gt; index 5406e542db..d8f9f6c312 100644<br>
&gt; --- a/meta/conf/bitbake.conf<br>
&gt; +++ b/meta/conf/bitbake.conf<br>
&gt; @@ -663,7 +663,7 @@ DEBUG_OPTIMIZATION =3D &quot;-Og ${DEBUG_LEVELFLAG=
}&quot;<br>
&gt;=C2=A0 SELECTED_OPTIMIZATION =3D &quot;${@d.getVar(oe.utils.vartrue(&#3=
9;DEBUG_BUILD&#39;, &#39;DEBUG_OPTIMIZATION&#39;, &#39;FULL_OPTIMIZATION&#3=
9;, d))}&quot;<br>
&gt;=C2=A0 SELECTED_OPTIMIZATION[vardeps] +=3D &quot;FULL_OPTIMIZATION DEBU=
G_OPTIMIZATION DEBUG_BUILD&quot;<br>
&gt;=C2=A0 # compiler flags for native/nativesdk<br>
&gt; -BUILD_OPTIMIZATION =3D &quot;${@oe.utils.vartrue(&#39;DEBUG_BUILD&#39=
;, &#39;-Og -g&#39;, &#39;-O2&#39;, d)}&quot;<br>
&gt; +BUILD_OPTIMIZATION =3D &#39;-O2&#39;<br>
&gt;=C2=A0 BUILD_OPTIMIZATION[vardeps] +=3D &quot;DEBUG_BUILD&quot;<br>
&gt; <br>
&gt;=C2=A0 ################################################################=
##<br>
&gt; --<br>
&gt; 2.49.0<br>
<br>
I am sorry, but I must be missing something. If I enable DEBUG_BUILD for <b=
r>
a native recipe, I definitely expect it to be compiled with -Og so I can <b=
r>
debug it in gdb.<br>
<br>
If what you really want to do is enable debug for all target recipes, <br>
then use DEBUG_BUILD:class-target =3D &quot;1&quot; in your local.conf inst=
ead.<br>
<br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225247): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225247" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225247</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115908796/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115908796/1686489</a><br>
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

--000000000000e677e60641d2c30d--

