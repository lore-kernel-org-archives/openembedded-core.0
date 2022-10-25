Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0719BC38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 17:42:20 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.1011.1666719732370334267
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 10:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U3naoqel;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f37so23452478lfv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 10:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kWQKEhfl67j91j4JcAzavMQDag7snbjRVLPz1oe3WYw=;
        b=U3naoqelcL9ttkS8RBONbycmwhL5Q8JdLjtEn3gIQ0gM1d+YsdBk5G3aHgOGZ0EPht
         eyxsIny4WcNbVURbmyuAU8hZu7Y5g31e2S2bXBhJPJaG9bl0LlAY1YbPS/TMvub+Ql5J
         yUDiGpoBE+tRLpOpUFsV1CKVlrBbni9VFEEa+r1gf+V3SKdIN32641mxiaGL04AGgbIU
         m6Tu261XnQfjLHL3u5H71wSzxwB1cr/SXYWIh2tNb5NcaHEBsSrr5SBY9F9zOFzWDDNC
         6e9PF9mJu0R40HMDlu6j6CG9JOL6MGJgq3UeWTI9RCN9Tqj0Hv9HixTF4z8WkPVYBTGR
         RItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWQKEhfl67j91j4JcAzavMQDag7snbjRVLPz1oe3WYw=;
        b=H6eseICzQCgzdH1S8bcupYiN964Jgtb43JbX3YoUoqlqBSnwn8hcx1RuRI/+phqK58
         ynjBf3vpTr8fClPq8ERCZC2LuThBR9+SSUnYi0oE6UNIb7QNiNjv9SpxQ4uu3PIRsFD3
         mg5nPR5ZDOYXS046pEGKTDAIm1dFHzXgniJpF+Xn+WNkwokW0mkBG2cbBHQJ8uUDloy+
         9Gs/loSRC/EbGHWGaxWbt8tkhAkJFdRie7kV4ogr8XRs4etU3PJLVvguykrWTg5SjGVL
         ADnB01WcqiiRRpCSbuarD7eG4V8z1AxbatrmQ6WA6s/eerVBLNNgGmetcAzEKZJuHdEv
         QlEQ==
X-Gm-Message-State: ACrzQf3lXonPY0hSpX0dTcUCTIcB1nm8ml4fgVSMn0ScDbPHcQ2nfgmV
	EX6PnbcnJOgpQ9XLij3RpCHdutmxG5V4SRpUemw=
X-Google-Smtp-Source: AMsMyM5HpOMUxEfe19HN2kCqQMvQ6gXmLaZ50e9WLL434/QWDt7jsvrprBAhfu8ZKbbGUUMuAonNkNsrV+fVJZ2SfBk=
X-Received: by 2002:a05:6512:4016:b0:4a4:6edb:8d6e with SMTP id
 br22-20020a056512401600b004a46edb8d6emr15460647lfb.393.1666719730133; Tue, 25
 Oct 2022 10:42:10 -0700 (PDT)
MIME-Version: 1.0
References: <C917DA2F-DB15-46D8-901C-B1AEF21AD347@arm.com> <27896.1666718567656134623@lists.openembedded.org>
In-Reply-To: <27896.1666718567656134623@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Oct 2022 19:41:58 +0200
Message-ID: <CANNYZj92ZRsMUOj41WFZsmhMggVi2OV0xQ=q2OwmrWNdwaVBaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: enable glvnd support
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000746daf05ebdf6de2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 17:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172140

--000000000000746daf05ebdf6de2
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Oct 2022 at 19:22, Vincent Davis Jr <vince@underview.tech> wrote:

> Yeah, but I couldn't find where runtime depend for libegl is set and
> libEGL_mesa.* gets include in image as runtime dependency without me
> directly setting it. A bit of confusion there for me. Feel as if I
> shouldn't need to RDEPENDS:${PN} = "libglx" in recipe that requires it.
> Should just be included in image as libegl is. Is there a way to avoid
> RDEPENDS:${PN} = "libglx"?
>

It would not be necessary if something that dynamically links with these
libraries is included in the image. Then the package task for that
something will find out that these libraries are needed, will trace them to
the packages that contain them, and insert RDEPENDS for those packages
automatically.

If the libraries are open with dlopen( ) at runtime, then yocto's packaging
does not detect that, and you need to add a manual RDEPENDS.

Alex

--000000000000746daf05ebdf6de2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 25 Oct 2022 at 19:22, Vincent Davis Jr &lt;vince@underview.t=
ech&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Y=
eah, but I couldn&#39;t find where runtime depend for libegl is set and lib=
EGL_mesa.* gets include in image as runtime dependency without me directly =
setting it. A bit of confusion there for me. Feel as if I shouldn&#39;t nee=
d to RDEPENDS:${PN} =3D &quot;libglx&quot; in recipe that requires it. Shou=
ld just be included in image as libegl is. Is there a way to avoid RDEPENDS=
:${PN} =3D &quot;libglx&quot;?<br></blockquote></div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote">It would not be necessary if some=
thing that dynamically links with these libraries is included in the image.=
 Then the package task for that something will find out that these librarie=
s are needed, will trace them to the packages that contain them, and insert=
 RDEPENDS for those packages automatically.<br></div><div class=3D"gmail_qu=
ote"><br></div><div class=3D"gmail_quote">If the libraries are open with dl=
open( ) at runtime, then yocto&#39;s packaging does not detect that, and yo=
u need to add a manual RDEPENDS.</div><div class=3D"gmail_quote"><br></div>=
<div class=3D"gmail_quote">Alex<br></div></div>

--000000000000746daf05ebdf6de2--

