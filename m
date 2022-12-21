Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C716EC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 18:54:35 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.27137.1671648873950602651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 10:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MqWLaCWy;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id r205so13187652oib.9
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 10:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sXLOULlPJ0hW42AUnXr6TMxYz/A08yYqo6QY27OMdBw=;
        b=MqWLaCWyncJywlKtONm8WypDANYb75Fk4cXgU/2qF1RLglVNh7ADdT33lqol8EWpRS
         9NVqBcFbUyc4+ndkXLpLH9aYfLA5eNdSJL+3KKKyQDSSJcn44F23oW5NaQFr0V8cRkPx
         HA2X7xaiZYqM25VjfTTfH4L73zW/fswJkIpTlOM1bEzZXaHAb8/bSre6Qfrz0pQ0wONf
         uJd0ID3ByBqXzYBYnuSy8w8Sqhy+l9q8ZfUuW3rdqJUSX3G9x3WoRTtVKzo64VvlH4FA
         ZIu4Hnq0Uxo9fJHY0ehUIr9vuGSixAYB2f8MOwjZES8EIFyyeT+IQZgiE4Tk7oK196i8
         EvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sXLOULlPJ0hW42AUnXr6TMxYz/A08yYqo6QY27OMdBw=;
        b=NyYfMZuAx7R2b8zTGtEP9DX/2kjyZkt49kDHep+32QUBkK/08EHrBpUBSZfZqSs9wb
         pdtQqJi9tLQAijJnYG24hOOVbxnoAiWhiep6wjW8M61ZgaP8p5ep+YeG9SFgWVUaeSOH
         MOGcM3jiXWm9cV4oth4c3TAIiIVnwx1KQlSVBrAD45r7kD4Im4+XXxFVgYsdLaMqbwEs
         djSHutlyjoJvNweshIoje3RTc+a3tZrKHboYfZJReor8Aa/1+jCP1Ad4ROikE29ggbjA
         0QycTQuzN1/UF37Nn+tBm5awG9bTxaHfUtoXELOTv3cJIkBuHgb15od5BLJ5XjqqLHFp
         3c4g==
X-Gm-Message-State: AFqh2kpu+CkMwQZo7rClLRHMUC0UwDvjlchrq+OmhMmyjLNzl/QyXRZm
	BtdMNsNzAbVjIJkQbcDgL1Z4nANSroEWqGNeoU4=
X-Google-Smtp-Source: AMrXdXsxNt3uapeihdPqjbCT3Tt9dZ28NA5OW6BI5galoqN0OXiqVYCYKZa/JyXrDNrP/v0S6++Eg1jZPUxbT/VpWEw=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr14716oia.262.1671648873102; Wed, 21 Dec
 2022 10:54:33 -0800 (PST)
MIME-Version: 1.0
References: <20221221125306.13779-1-alex.kiernan@gmail.com>
 <20221221125306.13779-10-alex.kiernan@gmail.com> <abe8931d3e41dae57f13ab07a8e016c2ded2827f.camel@linuxfoundation.org>
In-Reply-To: <abe8931d3e41dae57f13ab07a8e016c2ded2827f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Dec 2022 10:54:22 -0800
Message-ID: <CAMKF1sqJXFUnDZY8=HXNWXx2dag8Mn16WUWttFmJoy8=Op7RVg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 09/10] packagegroup-core-sdk: Add SDK
 toolchain language selection support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000045439405f05b15a7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 18:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174938

--00000000000045439405f05b15a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2022 at 8:39 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-12-21 at 12:53 +0000, Alex Kiernan wrote:
> > Use SDK_TOOLCHAIN_LANGS to allow different language support to be
> > selected within SDKs. Initially supported options are rust and go.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > (no changes since v1)
> >
> >  .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> > index d70aff22c725..0e480e6ac756 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
> > @@ -11,6 +11,11 @@ inherit packagegroup
> >
> >  #PACKAGEFUNCS =3D+ 'generate_sdk_pkgs'
> >
> > +SDK_TOOLCHAIN_LANGS ??=3D ""
> > +SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 =3D "rust"
> > +# libstd-rs doesn't build for mips n32 with compiler constraint errors
> > +SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 =3D "rust"
> > +
> >  RDEPENDS:packagegroup-core-sdk =3D "\
> >      packagegroup-core-buildessential \
> >      coreutils \
> > @@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk =3D "\
> >      less \
> >      ldd \
> >      file \
> > -    tcl"
> > +    tcl \
> > +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'go',
> 'packagegroup-go-sdk-target', '', d)} \
> > +    ${@bb.utils.contains('SDK_TOOLCHAIN_LANGS', 'rust',
> 'packagegroup-rust-sdk-target', '', d)} \
> > +"
>
> I'm a little torn on this. I created SDK_TOOLCHAIN_LANGS as a control
> for the SDKs from populate_sdk. Whether the target SDK images should
> follow that as well, I'm less sure.
>
> It is probably fine and I nearly didn't send a comment but I just
> wanted to see what others think.
>
> We could perhaps do something like:
>
> TARGET_TOOLCHAIN_LANGS ??=3D "${SDK_TOOLCHAIN_LANGS}"


Let=E2=80=99s go with this approach. It=E2=80=99s in line with other simila=
r variables


>
> in the recipe to cover the ability to separate the two if we wanted...
>
> Cheers,
>
> Richard
>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174922):
> https://lists.openembedded.org/g/openembedded-core/message/174922
> Mute This Topic: https://lists.openembedded.org/mt/95805446/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000045439405f05b15a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Dec 21, 2022 at 8:39 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 2022-=
12-21 at 12:53 +0000, Alex Kiernan wrote:<br>
&gt; Use SDK_TOOLCHAIN_LANGS to allow different language support to be<br>
&gt; selected within SDKs. Initially supported options are rust and go.<br>
&gt; <br>
&gt; Signed-off-by: Alex Kiernan &lt;<a href=3D"mailto:alex.kiernan@gmail.c=
om" target=3D"_blank">alex.kiernan@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; (no changes since v1)<br>
&gt; <br>
&gt;=C2=A0 .../packagegroups/<a href=3D"http://packagegroup-core-sdk.bb" re=
l=3D"noreferrer" target=3D"_blank">packagegroup-core-sdk.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/packagegroups/<a href=3D"http://package=
group-core-sdk.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-s=
dk.bb</a> b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-=
core-sdk.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-sdk.bb<=
/a><br>
&gt; index d70aff22c725..0e480e6ac756 100644<br>
&gt; --- a/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-c=
ore-sdk.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-sdk.bb</=
a><br>
&gt; +++ b/meta/recipes-core/packagegroups/<a href=3D"http://packagegroup-c=
ore-sdk.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-sdk.bb</=
a><br>
&gt; @@ -11,6 +11,11 @@ inherit packagegroup<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #PACKAGEFUNCS =3D+ &#39;generate_sdk_pkgs&#39;<br>
&gt;=C2=A0 <br>
&gt; +SDK_TOOLCHAIN_LANGS ??=3D &quot;&quot;<br>
&gt; +SDK_TOOLCHAIN_LANGS:remove:sdkmingw32 =3D &quot;rust&quot;<br>
&gt; +# libstd-rs doesn&#39;t build for mips n32 with compiler constraint e=
rrors<br>
&gt; +SDK_TOOLCHAIN_LANGS:remove:mipsarchn32 =3D &quot;rust&quot;<br>
&gt; +<br>
&gt;=C2=A0 RDEPENDS:packagegroup-core-sdk =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 packagegroup-core-buildessential \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 coreutils \<br>
&gt; @@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk =3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 less \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ldd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file \<br>
&gt; -=C2=A0 =C2=A0 tcl&quot;<br>
&gt; +=C2=A0 =C2=A0 tcl \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;SDK_TOOLCHAIN_LANGS&#39;, &#3=
9;go&#39;, &#39;packagegroup-go-sdk-target&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;SDK_TOOLCHAIN_LANGS&#39;, &#3=
9;rust&#39;, &#39;packagegroup-rust-sdk-target&#39;, &#39;&#39;, d)} \<br>
&gt; +&quot;<br>
<br>
I&#39;m a little torn on this. I created SDK_TOOLCHAIN_LANGS as a control<b=
r>
for the SDKs from populate_sdk. Whether the target SDK images should<br>
follow that as well, I&#39;m less sure.<br>
<br>
It is probably fine and I nearly didn&#39;t send a comment but I just<br>
wanted to see what others think.<br>
<br>
We could perhaps do something like:<br>
<br>
TARGET_TOOLCHAIN_LANGS ??=3D &quot;${SDK_TOOLCHAIN_LANGS}&quot;</blockquote=
><div dir=3D"auto"><br></div><div dir=3D"auto">Let=E2=80=99s go with this a=
pproach. It=E2=80=99s in line with other similar variables=C2=A0</div><div =
dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
in the recipe to cover the ability to separate the two if we wanted...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174922): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174922" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174922</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95805446/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95805446/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000045439405f05b15a7--

