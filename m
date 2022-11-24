Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B23C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 21:01:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.33710.1669323660899651640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 13:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HrJXhOYJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id p16so2086989wmc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 13:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yjvuf8H7ZwDJ9d7yoZ6XWz7GghHxSvpT1Nz3uKeZuhg=;
        b=HrJXhOYJ2w0K0Q+2tcA08qIRRcFksdZWrJsmF7TrHRMvI8oKP+vDbsfqfcrdKASrx4
         JQ9TRIVWmLbLxvM7RsOI+kvuIEY09VVvG8lSIhJQFhqdrc6FGcZoNLG4c//tfNyKhbkP
         qmMn2KPdvedUF6Av2GzRDm90Wryk0nf6OB2EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yjvuf8H7ZwDJ9d7yoZ6XWz7GghHxSvpT1Nz3uKeZuhg=;
        b=I/V2V5TbH4Io0/VG+LGa0y0J0ybj4Mb5371g70BLBbNaEOTH6h50ZnouK4SdANuK3Z
         INKiZGwZIrf+q+4ViLJHR370p3MriXXw5YAxItZhIlTiczTsrIO3Nm25KtUGm+9WngrW
         VCrJm5kXtW4YOONqtCVswiWmH0xMDgArHgUq4laUVu4+TSvbgpqgTmrN083dGVaYT4mX
         AKoqSxbLWgp8UtiCEo1zx4jPhulHAUj8IKE+qeRu/05sxI107vzNWZcwihqTdduPinE5
         RXH/Zf65WUyOKm2CVNG4qJYThocrQE4Dqc52Nth1nJlktuBcEfP+ukihzHgVAcZ9qxjc
         LRCQ==
X-Gm-Message-State: ANoB5pkdINlh+j0Z0WupxsGuwyw18cc7gO1h47B2lieAibiGQCDCvmsg
	QRDJu59IUcU7u9oRi5REN7ZOBg==
X-Google-Smtp-Source: AA0mqf4p6h+ohVoYYmDXq6o8YOaQ9W6Odjbn4wvQhSu+jGs1TGa1p39/M4CWCqfPDpfjYp8xp1Elbg==
X-Received: by 2002:a7b:ca43:0:b0:3cf:ade4:d529 with SMTP id m3-20020a7bca43000000b003cfade4d529mr11619860wml.193.1669323659257;
        Thu, 24 Nov 2022 13:00:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c6f:7712:93d3:b3fa? ([2001:8b0:aba:5f3c:7c6f:7712:93d3:b3fa])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d5109000000b00241f467f888sm2124082wrt.74.2022.11.24.13.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 13:00:58 -0800 (PST)
Message-ID: <ff56dd20a02379f34932a49092d7c5f868de14d2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kbd: DEPEND on bison-native and don't build
 tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ola x Nilsson <olani@axis.com>, openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2022 21:00:56 +0000
In-Reply-To: <20221124165206.1020295-1-olani@axis.com>
References: <20221124165206.1020295-1-olani@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 21:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173757

On Thu, 2022-11-24 at 17:52 +0100, Ola x Nilsson wrote:
> bison-native is required if any .y-file is changed, by patch or in
> devtool.  Otherwise the build will fail with

The key point is that we don't patch any .y file out the box. I
therefore don't want to add this dependency.

If you do start adding patches you can easily add the dependency too?

Cheers,

Richard

