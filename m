Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 491EBC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 12:29:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.40101.1666009762055427322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 05:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B3BhOaad;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id e18so8538189wmq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NMN+kQ8IrWAOHItuPqGmoqaUTxKMyhDE8dQI9rHgY50=;
        b=B3BhOaadqzSJnZWc1iSk+X0xtGSuCrLsVoV7ikusmYOZsDW6ZQOYfCuBh0uEFC0KbS
         99cxv5cp7nDAH8euOgFO7igiaH2u53AmOF96opvH2O+Sp0BEdMnXKXsOZMBTw4O1aBYR
         +E5ozBYyFFu7NR5lt4I+ebKxO4dhDCUXJ/xbrZ/C1xHjMvA+HcsXBhfGvP0P1STAeCqa
         2teOmz0lpTNGmI2oE93HNtlpH/rzMaRoZKr561FiNtS/1/l2My0/W0fHJBbbh8a+xsPE
         3Cv8nUVItVgreyWCr28iJLm21x7v2SCrC7RBujQAMAXKwiOkmXvy0ScThklYZPQz2h8d
         t4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMN+kQ8IrWAOHItuPqGmoqaUTxKMyhDE8dQI9rHgY50=;
        b=nGp3ZNhPSVGaUXESQMyMW9OceD6Wk88LoVmvYT1gvjqG8LqXCP9docgg3qF9P4R22g
         FhkH+C3k4dOlLYSOPoPpy/RTpYpndQYDXNUqhme0MPyi10G2TTE2noo5KD4NZeirwECw
         dwZ+NBjdmy7gWoejtm78I+LyAShtqntpGTqsr0BWxOeSdX6J74Q74gy/LL0BxuKqDcFQ
         32iqF/vMsoTAfnjSqqhvFBPd9n+BfuWSxsq5jm1qrx5CM3gGh1rNf4rhDEBb5BIpGEkX
         /EjXOI2p0TUSFVG6h4UFcr1n0rLcdaWSPI5bof1ghPAA+UBtLxMorJHEikfKIxZtm3Yn
         l+Hw==
X-Gm-Message-State: ACrzQf3eaS0ygmr24RqCd58+YN2w7YF+wJWUulA8LUqeHRfHARqPII7G
	BoGj0tw9jx4S6xukH3c98rPQf6B3w7Xja939e1U=
X-Google-Smtp-Source: AMsMyM58C04AG1+mySlgiKv5fnHPdvqMSo9/P4wOQ887yVHxgoCzqdyuQZ2c5dESkBl89/aPgpupBAEHpYcvbBoKaKQ=
X-Received: by 2002:a05:600c:244:b0:3c6:bc2f:421b with SMTP id
 4-20020a05600c024400b003c6bc2f421bmr7363715wmj.32.1666009760287; Mon, 17 Oct
 2022 05:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221016214357.596913-1-tom.hochstein@nxp.com> <8917BE00-005D-4ECE-BAB9-82EFC64F9544@arm.com>
In-Reply-To: <8917BE00-005D-4ECE-BAB9-82EFC64F9544@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Oct 2022 14:29:07 +0200
Message-ID: <CA+chaQewGSyDypShmVYKNBkcEZUHrNPQbmYpNfbn+Ph3g40bcg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main package
To: Ross Burton <ross.burton@arm.com>
Cc: "tom.hochstein@nxp.com" <tom.hochstein@nxp.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f4558405eb3a1ff9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 12:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171908

--000000000000f4558405eb3a1ff9
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 2:10 PM Ross Burton <ross.burton@arm.com> wrote:

> On 16 Oct 2022, at 22:43, Tom Hochstein via lists.openembedded.org
> <tom.hochstein=nxp.com@lists.openembedded.org> wrote:
> >
> > Since libvulkan.so is commonly loaded dynamically, put it in the main
> > package.
>
> Can you give an example?
>

I'm wondering the same, because e.g.  tensorflow-lite. arm-compute-library
were also trying to dlopen libOpenCL.so and we've patched them to
dlopen libOpenCL.so.1 instead, so why should libvulkan.so be different.

--000000000000f4558405eb3a1ff9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 2022 at 2:10 PM Ross Burt=
on &lt;<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16 Oct =
2022, at 22:43, Tom Hochstein via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> &lt;tom.ho=
chstein=3D<a href=3D"mailto:nxp.com@lists.openembedded.org" target=3D"_blan=
k">nxp.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; Since libvulkan.so is commonly loaded dynamically, put it in the main<=
br>
&gt; package.<br>
<br>
Can you give an example?<br></blockquote><div><br></div><div>I&#39;m wonder=
ing the same, because e.g.=C2=A0=C2=A0tensorflow-lite.=C2=A0arm-compute-lib=
rary were also trying to dlopen=C2=A0libOpenCL.so and we&#39;ve patched the=
m to dlopen=C2=A0libOpenCL.so.1 instead, so why should=C2=A0libvulkan.so be=
 different.</div></div></div>

--000000000000f4558405eb3a1ff9--

