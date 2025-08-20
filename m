Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04B7CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:34 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.500.1755722970559472933
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 13:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jt5RPVZb;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e94f7232b30so347011276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755722970; x=1756327770; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PqFH1eIv8EH2hHsVAgJKXxHeeKT5pqwuzf6Exb89x7c=;
        b=jt5RPVZb0vzt+89fuSvRnhJWsw9hKZwszI8TGuOlGTGwqtZBy1QRLdK0vXCgkqoE30
         sGbF2KB6SOyQWyXE5AwnK1MLWkKnXdtXDVtkWNGTC06De0QgoVo9w9NxufXGkWkHylyr
         XfoDlL2fwPWYJAp3cwqz3RF7Llo9qg1jWd5lf9E3FJqGEsoGNMdAqag1QVwkrHHnWR7X
         ecaCBVlcsPE9L1W74u40lEvZknRYJzRxhtPZ4PjHPDcrNSiygRNy4osNZYLxGTD10oxT
         Wk2Ju840IAyuwhYP78j2dThA8hT6lTT5fwVkmV2nkmyhf+mMxFsfwfsee9Cuifxj8lRe
         9kUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755722970; x=1756327770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PqFH1eIv8EH2hHsVAgJKXxHeeKT5pqwuzf6Exb89x7c=;
        b=vswRaEcNmlNwqiKvgehdJUAAHU8KDgcZPCBs0RucKn/qftQ0YIPX1l/1p9rz/++54G
         WcO6+J1axf/F675ebFLEmhhIdJ2hX4/soeLYIluv2i2u3AspM13mP4UEgFcDRG7/VgA3
         s4ACXmHrRuU8RPtfZ9F6bGxLLBUYg2b9asqKkMobhZmGOwZ5mUFxA/xt0ivyX+D6TMS4
         ZgDKx3m6U9zj7rHkrc527XmaeZOz32gSUCwT7YBHfCU/BMKdv15CwZGtg4Zvf7/iN9MN
         UWpgNw/csYzbJwiILKrEsM2lcgQKi9hWQB6WZE3ofutRVD4y6eb1HX/UhSaWvfm/O3f2
         7bOg==
X-Gm-Message-State: AOJu0YwYgZ/a+KVHFEFW33KeMv12ahGSkmoYGOc+iVjDTluHyafDEXCt
	KCtLjnrJDWemkVbqxx9RkHM4LrrvwWdbD9FTv5alOSUkr29saxYGJS5HX0R9FYZZHoscdTIGyF4
	JtoPVVYQm33ofjszh8rKgpmWfti22YTDn+3dR
X-Gm-Gg: ASbGncv8ermf7GwL/m22KgEXpvmaSikTBwJRss+neSJqK/UkUfz/F204xhmVCbcx4ig
	AClzgbcLPYabhOShR23868GexaTCYcwADJC5iaNpiJ4c7WtJxTeDmLWB3Ekw5zcD7toBu/D0BJm
	RJTDbzjARBb9zG706seTIhJEkN3YLjdV9gY1R1qxZGxqf9Fdpnva0+SZtF4K1E/McBL+i0l23nl
	CEzA6ljHpOWdff2QRuSVzUCqJZxoVMRB5AJ
X-Google-Smtp-Source: AGHT+IEnI0QKcw9Ri3S5qAIpamJsEaTc7RE7bdTXnLUH4DFeJKKwaEqFyMi9xEaE97erMMB8437zmssZYokukpkLvSY=
X-Received: by 2002:a05:6902:cc2:b0:e94:e537:22fa with SMTP id
 3f1490d57ef6-e9509a6906dmr210171276.41.1755722969490; Wed, 20 Aug 2025
 13:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250820132929.2644708-1-ross.burton@arm.com> <CAMKF1so0oZt04POpvabf3k1J0WNk_7eRW1wYQ5uwt4xOT61X2Q@mail.gmail.com>
 <A3413038-010C-482D-8ECE-D501ADA44842@arm.com>
In-Reply-To: <A3413038-010C-482D-8ECE-D501ADA44842@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 13:49:16 -0700
X-Gm-Features: Ac12FXznr-ue8govxgpnGjLZAdn0xmWkHbezbDK10mXtxd6oEzcFhB9viGgoHvg
Message-ID: <CAMKF1sr1=vx9uB=8+70BDc=g5AomZKQTir5WOGRzb8qZDgcgzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe cleanup
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ebab34063cd21bfa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222197

--000000000000ebab34063cd21bfa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 12:50=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> =
wrote:

> On 20 Aug 2025, at 18:17, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Aug 20, 2025 at 6:29=E2=80=AFAM Ross Burton via lists.openembed=
ded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >>
> >> - There is no need for python3native, as this recipe doesn't depend on
> >>  other python modules.
> >>
> >> - Inherit lib_package so the llvm-spirv binary is in a separate packag=
e
> >>  to the libLLVMSPIRVLib.so library.
> >>
> >> - Remove obsolete CMake options that no longer appear to be required.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@arm.com>
> >> ---
> >> .../spir/spirv-llvm-translator_20.1.4.bb               | 10 +---------
> >> 1 file changed, 1 insertion(+), 9 deletions(-)
> >>
> >> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.b=
b
> b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> >> index 64a73ce55aa..3a090b7b5cb 100644
> >> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> >> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> >> @@ -15,18 +15,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D
> "v(?P<pver>\d+(\.\d+)+)"
> >>
> >> DEPENDS =3D "llvm spirv-tools spirv-headers"
> >>
> >> -inherit cmake pkgconfig python3native
> >> +inherit cmake pkgconfig lib_package
> >>
> >> -# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> >> -# for CMAKE_SHARED_LIBS=3DOFF see
> https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868
> >> EXTRA_OECMAKE =3D "\
> >>     -DBUILD_SHARED_LIBS=3DON \
> >> -    -DCMAKE_BUILD_TYPE=3DRelease \
> >
> > Is Release already the default ? Usually this option reduces the debug
> > info size, which may not matter
> > for this but would be good to know.
>
> The upstream cmakelists don=E2=80=99t set it either way, and changing thi=
s doesn=E2=80=99t
> change the output.
>

Ok


> (I also need to finish off the branch which makes our class pass
> RelWithDebInfo by default)
>
> Ross

--000000000000ebab34063cd21bfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 20, 2025 at 12:50=E2=80=AFP=
M Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 20 Aug 2025, at=
 18:17, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; On Wed, Aug 20, 2025 at 6:29=E2=80=AFAM Ross Burton via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; - There is no need for python3native, as this recipe doesn&#39;t d=
epend on<br>
&gt;&gt;=C2=A0 other python modules.<br>
&gt;&gt; <br>
&gt;&gt; - Inherit lib_package so the llvm-spirv binary is in a separate pa=
ckage<br>
&gt;&gt;=C2=A0 to the libLLVMSPIRVLib.so library.<br>
&gt;&gt; <br>
&gt;&gt; - Remove obsolete CMake options that no longer appear to be requir=
ed.<br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.c=
om" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; .../spir/<a href=3D"http://spirv-llvm-translator_20.1.4.bb" rel=3D=
"noreferrer" target=3D"_blank">spirv-llvm-translator_20.1.4.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +---------<br>
&gt;&gt; 1 file changed, 1 insertion(+), 9 deletions(-)<br>
&gt;&gt; <br>
&gt;&gt; diff --git a/meta/recipes-graphics/spir/<a href=3D"http://spirv-ll=
vm-translator_20.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-tr=
anslator_20.1.4.bb</a> b/meta/recipes-graphics/spir/<a href=3D"http://spirv=
-llvm-translator_20.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm=
-translator_20.1.4.bb</a><br>
&gt;&gt; index 64a73ce55aa..3a090b7b5cb 100644<br>
&gt;&gt; --- a/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-tran=
slator_20.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translato=
r_20.1.4.bb</a><br>
&gt;&gt; +++ b/meta/recipes-graphics/spir/<a href=3D"http://spirv-llvm-tran=
slator_20.1.4.bb" rel=3D"noreferrer" target=3D"_blank">spirv-llvm-translato=
r_20.1.4.bb</a><br>
&gt;&gt; @@ -15,18 +15,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;p=
ver&gt;\d+(\.\d+)+)&quot;<br>
&gt;&gt; <br>
&gt;&gt; DEPENDS =3D &quot;llvm spirv-tools spirv-headers&quot;<br>
&gt;&gt; <br>
&gt;&gt; -inherit cmake pkgconfig python3native<br>
&gt;&gt; +inherit cmake pkgconfig lib_package<br>
&gt;&gt; <br>
&gt;&gt; -# Specify any options you want to pass to cmake using EXTRA_OECMA=
KE:<br>
&gt;&gt; -# for CMAKE_SHARED_LIBS=3DOFF see <a href=3D"https://github.com/K=
hronosGroup/SPIRV-LLVM-Translator/issues/1868" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/KhronosGroup/SPIRV-LLVM-Translator/issues/1868<=
/a><br>
&gt;&gt; EXTRA_OECMAKE =3D &quot;\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0-DBUILD_SHARED_LIBS=3DON \<br>
&gt;&gt; -=C2=A0 =C2=A0 -DCMAKE_BUILD_TYPE=3DRelease \<br>
&gt; <br>
&gt; Is Release already the default ? Usually this option reduces the debug=
<br>
&gt; info size, which may not matter<br>
&gt; for this but would be good to know.<br>
<br>
The upstream cmakelists don=E2=80=99t set it either way, and changing this =
doesn=E2=80=99t change the output.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok=C2=A0</div><d=
iv dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
(I also need to finish off the branch which makes our class pass RelWithDeb=
Info by default)<br>
<br>
Ross</blockquote></div></div>

--000000000000ebab34063cd21bfa--

