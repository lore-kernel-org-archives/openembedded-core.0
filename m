Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1694.1793952832731831351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=c0gt8xiQ;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35829219da8so1505079eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 00:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952832; cv=none;
        d=google.com; s=arc-20260327;
        b=hii1GP4sXeSZ8bdUqmptcOhcGA0Lv+SDAbnaSMzX8S1l8OXPgKAkcDsZZFJLoYHWTl
         FzM5LzEUmv1sNuB3ePkGtBsc7i12LXHF4cvzAJ7+NAp/8v+NKNMKaKhvsJUq7mHX6v/C
         O0pjWGp4Jg6fkS4VaRyyTIv/R9Bb/8c6wTr7CNf/pNoy4V/rSPjAE8Gv9WFh6mx00N+T
         x4PL/5kAB4fW/ZOwydh2RNYhnuhcqbbXoVF3SW/7kzQVM3lXYv5r0iUzJZyRYbEbzubH
         PTJfZJAA853DC4c+7MrrmjMi4H3SNRVyViAC9WSZ8Ydbdq1ppdtBqwJm6qrwjEpM/PW4
         DASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=K0lPCLyQoL8URbAdWv8cDgNWkJPG+ngPYhcOGLPLLJE=;
        fh=3OmQg12qvWF+5JewJ/3VMCQWVsaFEGpmYcHdr6u40XA=;
        b=WgX/kRedj664ymnWoLW58gFug9NDSSaK2x0CIAVpUjbKsK2DtmYKdqEZFpMdCAzqih
         +pdLIpGKyGeXIR+65HAWtU7IsyccVh0Nao2tkx5Hn/o2hAblv4rq8Xe5XBRU0o3lpmY+
         Fr9mZhBK5B85DCAYzILGS4wFFxlDY7SwPEo3niT5hMQS9dGGk6jRhULLtB7n03xavE+y
         L8jaR/Ewyit9/qxFeHxLmI6F8NvJiq+OLyquVMFi6OWLMHBkTkXOYWwfZISQsUcX32oC
         OhZK9Okj+rULyQtjpo5bIWCMIM6ByWeLCQ/2rRHY4XFZfwaZpiuUnWdtqf6jR9wCIiEp
         BM4g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952832; x=1794557632; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0lPCLyQoL8URbAdWv8cDgNWkJPG+ngPYhcOGLPLLJE=;
        b=c0gt8xiQTO2O3y/p+KjWpd7FfptXuF7srDlW6SnJvvR+X1LWgTja18IfaJLwOXmB+b
         PYgP1TPkPzKKms5uJVCanW+X2gmUD2sopPpCTq2U0/ZmfpDhC67nsIRYMSs0rcB1hOJn
         fQ6qw+IdfAw6hYitMkKjpwg+HuMvStj2kOy8N6JweMddMklB/M4LiRtXdI0vQTLI6w/c
         rJqtheMVDbWTiPYFBVinB94yKhq6SFpA20AbovaITZ9wDB45bdp8YYTaP05P15lWcxYA
         BxrybPAN7kgxHGSpqB8EDcUwaD5RmVA4Y80S6dHWR9D/izLQR3gDk4q+L7qqepLIPNMq
         RzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952832; x=1794557632;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0lPCLyQoL8URbAdWv8cDgNWkJPG+ngPYhcOGLPLLJE=;
        b=13TkWnJvCISL8p0fQ86+4BL+vu67G46DIVE2oNBQiSs7MFA/xxK4TsPlsGTn2URcmA
         N6n3OgP67GhtM1MipsFZoQ8fBf79XSlXciexN0bAO3KZE7F9sI9W8JeMTZZKUJgo+8So
         qz+6DsBaqsa1N/qxIWSPwphQyT7IitC2I9HKMxEdMHxdWj8hZa6hd8jB1D7/b4OAZlWD
         5SyEnm0LPFZRyBLL+CLN2h44aay+gSZRpyDxgO/PfgRMTceyi6WqcNG4kmWumaZPallk
         C0a6AfCZ7/m9USn80rUbuvvlY6B4nbodIm9jOGRbd0Mr2vgQDyBmRnVSvgWl2uEm4J5c
         eHRQ==
X-Gm-Message-State: APuU4Z/J0qSeu0PyyjDB0umAvTb+cfsawp6h+symzVSh6e/UvVcEKN+D
	opzQYgWCHBMwZSyD1ZiYaUVyEVgvrrW2i/9XIx3hAYJ4viyWlIM4XoTnGaOEeT739imQsM7Aq+A
	SAsb7/at3L1Rn1dIscmZcU1ZbyDj4SPk=
X-Gm-Gg: AYBFou0YDEv3u3eQ48cNhOtMw9gEH2QZ6DImbArj1qOEoJB3dFyFoBfXwbycEWHkupZ
	m6zdSkWBm7c1G+TVfsBEOIl6TWtaAMH7Apliny9lPSIBYBuXHSQpV1W5Plrzt+yGd70p94NM8pj
	D2qWZVeX40JtcdYtOzYMwtheWf4BCZMAF5uYCJWXQvm+HO8Z2qzyvawO906No1H2lOO9qS62veu
	0nKpVFjVUdY9KtP4+hanrSMv09V7rVnHZOUozTaAVU42bW+DDCEYbTpmfQrR/MAVokZ7VVhybv2
	PpRmYA09DmsX6748Iu2JYDcOfHEUwg6wfZtA9h13czMZDFc0ikafCMfuCmcaef6NwotnOxK07OL
	0N5IdI7AAFbO64EQiE3WdnoV0oLn/z69MLzeCGuI=
X-Received: by 2002:a05:693c:68c9:b0:357:ee3a:267a with SMTP id
 5a478bee46e88-36f73893b9bmr806886eec.2.1793952831631; Fri, 06 Nov 2026
 00:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20261106011324.626292-1-ragaprasanth@gmail.com>
 <20261106011324.626292-2-ragaprasanth@gmail.com> <AS8PR10MB50735550B026B9C13DAB259DFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50735550B026B9C13DAB259DFD762@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Fri, 6 Nov 2026 17:13:14 +0900
X-Gm-Features: AclHuK_6S9elBRkVQKndDYmfzXATOKUZwzLGe9CWB3-3ERL2kQ7qRATHkuFM3Ok
Message-ID: <CAG7eodHrvRHJj8P5MGmAxm99Umxb12qeVDaRkggFOdw+sTfjNg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"paul@pbarker.dev" <paul@pbarker.dev>
Content-Type: multipart/alternative; boundary="00000000000045f99d065f97315a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:14:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249608

--00000000000045f99d065f97315a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Makes sense for 1.4. I think we can drop patch 2/2, as patch 1/2 doesn't
depend on it.
I'll add the CVE_STATUS to the backport branches instead, if needed, there.

Thanks,
Prasanth


On Fri, Nov 6, 2026 at 3:53=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.co=
m> wrote:

> zlib recipe version 1.4 does not assert this CVE as unpatched.
> I think it's not worth to carry patches which just switch
> patched:fixed-version to patched:cpe-incorrect.
>
> Peter
>
> > -----Original Message-----
> > From: Prasanth R <ragaprasanth@gmail.com>
> > Sent: Friday, November 6, 2026 2:13 AM
> > To: openembedded-core@lists.openembedded.org
> > Cc: paul@pbarker.dev; Marko, Peter (FT D EU SK BFS1)
> > <Peter.Marko@siemens.com>; Prasanth R <ragaprasanth@gmail.com>
> > Subject: [PATCH v2 2/2] zlib: ignore CVE-2026-76844
> >
> > CVE-2026-76844 is a webpack-dev-middleware CVE. Its record got the zlib
> > gz_vacate details by mistake; the zlib CVE for that bug is
> > CVE-2026-85091 [1].
> >
> > [1] https://github.com/madler/zlib/issues/1330
> >
> > AI-Generated: Uses Claude
> > Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
> > ---
> >  meta/recipes-core/zlib/zlib_1.4.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-core/zlib/zlib_1.4.bb
> b/meta/recipes-core/zlib/zlib_1.4.bb
> > index 18b27df878..2bc1967c0e 100644
> > --- a/meta/recipes-core/zlib/zlib_1.4.bb
> > +++ b/meta/recipes-core/zlib/zlib_1.4.bb
> > @@ -47,3 +47,5 @@ BBCLASSEXTEND =3D "native nativesdk"
> >
> >  # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
> >  CVE_PRODUCT =3D "zlib:zlib gnu:zlib"
> > +
> > +CVE_STATUS[CVE-2026-76844] =3D "cpe-incorrect: this CVE is for
> webpack-dev-
> > middleware, the zlib details were added in error"
> > --
> > 2.34.1
>
>

--00000000000045f99d065f97315a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Peter,<br><br>Makes sense for 1.4. I t=
hink we can drop patch 2/2, as patch 1/2 doesn&#39;t depend on it.<br>I&#39=
;ll add the CVE_STATUS to the backport branches instead, if needed, there.<=
br><br>Thanks,<br>Prasanth<br><br></div><br><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 6, 2026=
 at 3:53=E2=80=AFPM Marko, Peter &lt;<a href=3D"mailto:Peter.Marko@siemens.=
com">Peter.Marko@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">zlib recipe version 1.4 does not assert this CV=
E as unpatched.<br>
I think it&#39;s not worth to carry patches which just switch patched:fixed=
-version to patched:cpe-incorrect.<br>
<br>
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Prasanth R &lt;<a href=3D"mailto:ragaprasanth@gmail.com" target=
=3D"_blank">ragaprasanth@gmail.com</a>&gt;<br>
&gt; Sent: Friday, November 6, 2026 2:13 AM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: <a href=3D"mailto:paul@pbarker.dev" target=3D"_blank">paul@pbarker=
.dev</a>; Marko, Peter (FT D EU SK BFS1)<br>
&gt; &lt;<a href=3D"mailto:Peter.Marko@siemens.com" target=3D"_blank">Peter=
.Marko@siemens.com</a>&gt;; Prasanth R &lt;<a href=3D"mailto:ragaprasanth@g=
mail.com" target=3D"_blank">ragaprasanth@gmail.com</a>&gt;<br>
&gt; Subject: [PATCH v2 2/2] zlib: ignore CVE-2026-76844<br>
&gt; <br>
&gt; CVE-2026-76844 is a webpack-dev-middleware CVE. Its record got the zli=
b<br>
&gt; gz_vacate details by mistake; the zlib CVE for that bug is<br>
&gt; CVE-2026-85091 [1].<br>
&gt; <br>
&gt; [1] <a href=3D"https://github.com/madler/zlib/issues/1330" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/madler/zlib/issues/1330</a><br=
>
&gt; <br>
&gt; AI-Generated: Uses Claude<br>
&gt; Signed-off-by: Prasanth R &lt;<a href=3D"mailto:prasanth.r@lineo.co.jp=
" target=3D"_blank">prasanth.r@lineo.co.jp</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">zlib_1.4.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">zlib_1.4.bb</a> b/meta/recipes-core/zlib/=
<a href=3D"http://zlib_1.4.bb" rel=3D"noreferrer" target=3D"_blank">zlib_1.=
4.bb</a><br>
&gt; index 18b27df878..2bc1967c0e 100644<br>
&gt; --- a/meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">zlib_1.4.bb</a><br>
&gt; +++ b/meta/recipes-core/zlib/<a href=3D"http://zlib_1.4.bb" rel=3D"nor=
eferrer" target=3D"_blank">zlib_1.4.bb</a><br>
&gt; @@ -47,3 +47,5 @@ BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; <br>
&gt;=C2=A0 # Adding &#39;CVE_PRODUCT&#39; to avoid false detection of CVEs<=
br>
&gt;=C2=A0 CVE_PRODUCT =3D &quot;zlib:zlib gnu:zlib&quot;<br>
&gt; +<br>
&gt; +CVE_STATUS[CVE-2026-76844] =3D &quot;cpe-incorrect: this CVE is for w=
ebpack-dev-<br>
&gt; middleware, the zlib details were added in error&quot;<br>
&gt; --<br>
&gt; 2.34.1<br>
<br>
</blockquote></div></div>

--00000000000045f99d065f97315a--
