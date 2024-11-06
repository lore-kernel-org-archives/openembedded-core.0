Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD59D59F52
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 16:14:38 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.49761.1730909672201896369
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 08:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=afg66Pga;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5ec2798661aso3155563eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 08:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730909671; x=1731514471; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7FgnqcSOIOodBvU0wKikHoo4NRLYYLJW7aisDhMdnM=;
        b=afg66PgaV2pR7ox8t6Xb+WyPLQmB7/rB+bQg4n2RVbgqU3TehXmJU/Rhn97I33nq0b
         6/7UEFaaQ8JcqVrBEASy+YsbGpaWZevVjLOde/UHsLUZ3FO2DYDTV/oLeIPdQYYA7XZH
         ScUgzAU1CgBCHVDs6ppmrJ/qhYsJjR16j/vBJOUQ+oyPIUaS4JsRW7uEyiu86BCXBmlg
         Os4gmQjFeSmuWf8bOp8BhLUGy6zHYeC39zcIm8iVwns8DHMWpeuKit81hpAGJvdgyP2U
         7OXSNbmLIq9HZvQX1mKjge1iq6OACbfRbdlT0J1jn4oOaTkhzDzz5in7dvhAUX/FwoJN
         uAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730909671; x=1731514471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7FgnqcSOIOodBvU0wKikHoo4NRLYYLJW7aisDhMdnM=;
        b=czGxxyTK2s7c/oPy7HP2S1sbpcqMiuX2vWW+Jsa+2BAdNGX9JfZBUHSk7iRZj0jgEm
         n8dBhu6aTS4cnOtbbC1x/tuIGtUdRSeXwatXy63GMwO7Ll/FydDy57foOMtyzbdRKDGk
         ST87zWel/dQaEUwseQBjs43Z2edtGbQueiNgohYmyN1AXgAMOklBJcSLYTja5maG062J
         bRQT5q2fBAFJyb9jy0uDPjE75t4dWxNssUCcHQ9v3teediLZs04OCqdOm7ksn7Fi3QK8
         jYc/uR4pKvGdvA8hWX3aZF8TZ92DWlfGDs3Br2yvnM/QI+1EIFj/D7FuTH+nZL44LK/F
         NWgQ==
X-Gm-Message-State: AOJu0YwUfpblz8E16XjrOgIXnNECeC2FJv0qnlwQqbMdEZrtiV5UDLjD
	tq3yZVa4NhR1FAN4AhUv95x24oUO9v1AiYs0nmJPlszliWzcRD2vS0w7hQhw1O0HQ591RwYthC6
	l8n3gcFMNTea5MYOv/EOEhUiARDA=
X-Google-Smtp-Source: AGHT+IFQZ1nsAB6Svdpo2HG58PxOHbNw2kn5uB8NzotxiKdqyRqF2jYBtCmq7IuWgu6mmM9+79D5d7looleSFsDtlu0=
X-Received: by 2002:a4a:a547:0:b0:5ec:c22c:72db with SMTP id
 006d021491bc7-5ecc22c749bmr11943849eaf.2.1730909671488; Wed, 06 Nov 2024
 08:14:31 -0800 (PST)
MIME-Version: 1.0
References: <20241105184540.3450302-1-raj.khem@gmail.com> <21058861e2cf73d61abd16d6f29d5c7cbb22ffe3.camel@linuxfoundation.org>
In-Reply-To: <21058861e2cf73d61abd16d6f29d5c7cbb22ffe3.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Nov 2024 08:14:20 -0800
Message-ID: <CAMKF1soSd5UOYUJaTsS7dhdkVqETBZH5T39J8SuBnzBu-LDVoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 01/19] clang.inc: Global settings for clang toolchain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001b89ae062640d03e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 16:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206794

--0000000000001b89ae062640d03e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 7:54=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-11-05 at 10:45 -0800, Khem Raj via lists.openembedded.org
> wrote:
> > It is added to default distro include file
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/distro/include/clang.inc | 147
> > +++++++++++++++++++++++++++++
> >  1 file changed, 147 insertions(+)
> >  create mode 100644 meta/conf/distro/include/clang.inc
>
> Thanks for putting this together. Looking at the series, it seems as if
> it is a copy and paste of meta-clang into OE-Core which isn't really
> what I think is needed. I think in core, we can strengthen the
> toolchain abstraction and make some of this a lot cleaner, this would
> be the time to do it. I think the patchset is a good first step but I
> wanted to be clear that I think changes are going to be needed. I'd
> need to do a bit more experimentation to give more specific feedback on
> that.


That is good. I have kept in mind that there are lot of users of clang via
meta-clang shipping products and wanted to keep those usecases intact so
they can migrate to use this from core
Without a lot of changes least it should result in maintaining it in
meta-clang I would not prefer that. Within those bounds we can do the
needed changes I will be happy to do that


>
> Cheers,
>
> Richard
>

--0000000000001b89ae062640d03e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Nov 6, 2024 at 7:54=E2=80=AFAM Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;padding-left:1ex;border-left-color:rgb(204,204,204)">On Tue, 2024-11-05 at=
 10:45 -0800, Khem Raj via <a href=3D"http://lists.openembedded.org" rel=3D=
"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
wrote:<br>
&gt; It is added to default distro include file<br>
&gt; <br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/conf/distro/include/clang.inc | 147<br>
&gt; +++++++++++++++++++++++++++++<br>
&gt; =C2=A01 file changed, 147 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/conf/distro/include/clang.inc<br>
<br>
Thanks for putting this together. Looking at the series, it seems as if<br>
it is a copy and paste of meta-clang into OE-Core which isn&#39;t really<br=
>
what I think is needed. I think in core, we can strengthen the<br>
toolchain abstraction and make some of this a lot cleaner, this would<br>
be the time to do it. I think the patchset is a good first step but I<br>
wanted to be clear that I think changes are going to be needed. I&#39;d<br>
need to do a bit more experimentation to give more specific feedback on<br>
that.</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That is goo=
d. I have kept in mind that there are lot of users of clang via meta-clang =
shipping products and wanted to keep those usecases intact so they can migr=
ate to use this from core=C2=A0</div><div dir=3D"auto">Without a lot of cha=
nges least it should result in maintaining it in meta-clang I would not pre=
fer that. Within those bounds we can do the needed changes I will be happy =
to do that=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"a=
uto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000001b89ae062640d03e--

