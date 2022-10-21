Return-Path: <wltu@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA144FA373E
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 16:22:48 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web09.11825.1666369362728138961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 09:22:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=jndMGoRk;
 spf=pass (domain: google.com, ip: 209.85.219.41, mailfrom: wltu@google.com)
Received: by mail-qv1-f41.google.com with SMTP id f14so2155458qvo.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wBlMZhzipME2Sc3Wc6AN0ZThT4ee+RVc9rIzJYjSkCg=;
        b=jndMGoRkd5py80D37esNxFaxxKSRfEMV7GBiWnD4zZBMFNLK5N5rC7I+pKqJ/uvRhU
         gzmVrBLJnccjoQtVkT4/1uXsZEKyRNnfWl0Ua/+tjxNLdeJVXhl97y860ofrHCL0FPnp
         v6WHdGI+nenls9zfbrchpgNXzP48mlj0CuUQKBoe5S0ThdTGmLYBLp8TrAt2TFMJvK7A
         WxsmvkIwlthxX4NyK8Mr6x4sBx3Lz8LP1n5GeJAJ+z6trrSwdnhbmAtTdG8t1Iekec2G
         +nzU5qN4k+ATenKcOzXN0jL+8iqIYeyLrfn7yXQYw5S2Qo8VhGcMj/rsu0ZZKZGxbTxK
         HgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBlMZhzipME2Sc3Wc6AN0ZThT4ee+RVc9rIzJYjSkCg=;
        b=xmiDELHuhzGSO83UpWOVp92HlB1CsaxBuSqCWZrZOx6g1GA5xMeyz68ubBAmIpAOZP
         MrWndhbDoJ4de9IbZn/+Y+N7kiJSoKSkcCOm7nAGyzK3WTtCGwMlofNyCbEBtbqSywhz
         cyS3wbHlsh1Xk0F7dUGdYD9PtYTw41a3iBZ2aBdAkK/zoIzXunMiS11QJJb0eT2/R9dQ
         3oTs0Xj32NWJootnX6zB5Th/NYIE5d4lWG6dzQQf9+x776YmbvqsyUpQ2AnM0MrqD3VJ
         5/277LqGAKGFtpff7tshAZGbezUDxbpz8VuLw0FbubHAJIby2HMhmYwmDL2ikQ3blIDT
         roSQ==
X-Gm-Message-State: ACrzQf12+1Nf6cvT40cLyB7Ax9b1YYSK+aIsduMsMS2gKa6mSoHiXGM8
	prbFGv1mRR4uWS953JLLY2OBdy4Q8JYTHG52vvuy0g==
X-Google-Smtp-Source: AMsMyM5in4pz62TEOVHZ6ef7HbmCpG+2BFWVyR4GQ0dXWgqbBYCBdLUY5ZapQ3zcLVzbNz9vZTTAiaGTo84t9lUPWwo=
X-Received: by 2002:a05:6214:d0c:b0:4b3:36b4:c89a with SMTP id
 12-20020a0562140d0c00b004b336b4c89amr17830010qvh.93.1666369361674; Fri, 21
 Oct 2022 09:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <IAS2.1666358226748943797.wkAx@lists.openembedded.org>
 <CAHwn2Xni=DChyNRGfrQ=qVgrEK3b=0AhRMx+MAONYcWW9-V_=A@mail.gmail.com> <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com>
In-Reply-To: <C7082AE8-28B1-4277-BEC3-F7C6C14E7100@arm.com>
From: Willy Tu <wltu@google.com>
Date: Fri, 21 Oct 2022 09:22:30 -0700
Message-ID: <CAHwn2Xkgw-fAmy92oLWOUG8=K0-3dVwYXsLKEqR-WtGoHHdc1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssh: Install internal header/lib files
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Tristan Lelong <tlelong@google.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000de741f05eb8dd90e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 16:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172034

--000000000000de741f05eb8dd90e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Thanks for the feedback.

Can you point to the right repo to update? Just to make sure that I
understand the concern, you are not referring to
https://github.com/openembedded/meta-openembedded/pull/597, right? I am
making changes to
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connectivi=
ty/openssh/openssh_9.0p1.bb
which
I thought is part of oe-core.

@Tristan Lelong <tlelong@google.com> is the maintainer for hiba and is okay
with the change. Do you have any suggestions on installing it to just the
sysroot in openssh while using it from the hiba recipe? I was not able to
do that when I tried it.

Thanks,

Willy Tu




On Fri, Oct 21, 2022 at 7:59 AM Ross Burton <Ross.Burton@arm.com> wrote:

> Hi,
>
> oe-core doesn=E2=80=99t accept merge requests on the github mirrors, and =
you
> pushed to meta-oe, which is a different repository.
>
> >> + if ${@bb.utils.contains('DISTRO_FEATURES', 'opensshinternals',
> 'true', 'false', d)}; then
>
> This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide setting=
.
>
> >> + install -d ${D}${includedir}/ssh
> >> + install -d ${D}${includedir}/ssh/openbsd-compat
> >> + install -m0644 ${S}/*.h ${D}${includedir}/ssh
> >> + install -m0644 ${S}/openbsd-compat/*.h
> ${D}${includedir}/ssh/openbsd-compat
> >> +
> >> + install -d ${D}${libdir}
> >> + install -m0644 ${S}/libssh.a ${D}${libdir}
> >> + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${libdir}
> >> + fi
>
> So you=E2=80=99re installing bits of the SSH source into the *target* pac=
kages
> because one piece of software needs the build tree. This is clearly an
> unsupported use of openssh, as the hiba build instructions literally say
> =E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that build=
 tree=E2=80=9D.  If
>
> I suggest a better approach would be to have a bbappend in your layer
> which adds the files you need to *just the sysroot*, so the target packag=
es
> are unaltered.
>
> Ross

--000000000000de741f05eb8dd90e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ross,<div><br></div><div>Thanks for the feedback.=C2=A0=
</div><div><br></div><div>Can you point to the right repo to update? Just t=
o make sure that I understand the concern, you are not referring to=C2=A0<a=
 href=3D"https://github.com/openembedded/meta-openembedded/pull/597">https:=
//github.com/openembedded/meta-openembedded/pull/597</a>, right? I am makin=
g=C2=A0changes=C2=A0to=C2=A0<a href=3D"http://cgit.openembedded.org/openemb=
edded-core/tree/meta/recipes-connectivity/openssh/openssh_9.0p1.bb">http://=
cgit.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/open=
ssh/openssh_9.0p1.bb</a>=C2=A0which I thought is part of oe-core.</div><div=
><br></div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D=
"mailto:tlelong@google.com" tabindex=3D"-1">@Tristan Lelong</a>=C2=A0is the=
 maintainer for hiba and is okay with the change. Do you have any suggestio=
ns on installing it to just the sysroot in openssh while using it from the =
hiba recipe? I was not able to do that when I tried it.<br></div><div><br><=
/div><div>Thanks,</div><div><br></div><div>Willy Tu</div><div><br></div><di=
v><br></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Oct 21, 2022 at 7:59 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
oe-core doesn=E2=80=99t accept merge requests on the github mirrors, and yo=
u pushed to meta-oe, which is a different repository.<br>
<br>
&gt;&gt; + if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;opensshi=
nternals&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
<br>
This should be a PACKAGECONFIG, as it=E2=80=99s not a distro-wide setting.<=
br>
<br>
&gt;&gt; + install -d ${D}${includedir}/ssh<br>
&gt;&gt; + install -d ${D}${includedir}/ssh/openbsd-compat<br>
&gt;&gt; + install -m0644 ${S}/*.h ${D}${includedir}/ssh<br>
&gt;&gt; + install -m0644 ${S}/openbsd-compat/*.h ${D}${includedir}/ssh/ope=
nbsd-compat<br>
&gt;&gt; +<br>
&gt;&gt; + install -d ${D}${libdir}<br>
&gt;&gt; + install -m0644 ${S}/libssh.a ${D}${libdir}<br>
&gt;&gt; + install -m0644 ${S}/openbsd-compat/libopenbsd-compat.a ${D}${lib=
dir}<br>
&gt;&gt; + fi<br>
<br>
So you=E2=80=99re installing bits of the SSH source into the *target* packa=
ges because one piece of software needs the build tree. This is clearly an =
unsupported use of openssh, as the hiba build instructions literally say =
=E2=80=9Cbuild openssh, then point hiba=E2=80=99s configure at that build t=
ree=E2=80=9D.=C2=A0 If <br>
<br>
I suggest a better approach would be to have a bbappend in your layer which=
 adds the files you need to *just the sysroot*, so the target packages are =
unaltered.<br>
<br>
Ross</blockquote></div>

--000000000000de741f05eb8dd90e--

