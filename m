Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157F5C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:15:21 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.5503.1671275711422003387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G31ccrgO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id m14so4719672wrh.7
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hFZHdYKjkY2Eis5dRJicxqYX3j8x1EW7TTphHy3DCkk=;
        b=G31ccrgOPR01//7Sy+c/lOAYhlogYLe6tc4u6eGC4o5gOfKRE3ICPCip8PV8ZY3CtO
         T++f6Fdy8Dz0mkiJdCx5fVT9OV8eTQBOPj6LPV5tX3ukZAgeMj8wmw9dbrNXPsIKHDdr
         6OC0qY9+mHGnofTvFY2nglRGUHViKoLmWELeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFZHdYKjkY2Eis5dRJicxqYX3j8x1EW7TTphHy3DCkk=;
        b=30x8epNV3WsqntGzzD9hpaNYRFAC/MfGFmbFdY0wDLV9xKm9Su7OZLDVA6vIbzx/KU
         K5HM9Fn0a7V6B1TJPqHxAZ5reWFcWyRxLBdWi/AedXUJlplldfmszJ7VhmA5hc1BzUhk
         UZTNSHSnfP+7IS+b/BgM8dizamU5SENliPk52VsI9tXF0rAN3aBDka0E36G43mvsCIlH
         NGnSkET+uT6U8bjmpDuZUrNfTBtg15KJfDg7pY213I7UdZqqZh1TPFMRoJM6CKtyVE+n
         xiEHGhEgeB4HEP6W2adU/cy/EnzntSmuN75wYMWCJXQCVb3fR8ls+wF3vYYG1pNy5yI2
         F5hA==
X-Gm-Message-State: AFqh2kpE2ZHBvm+om2PPwK1YGN7vlh7SYH1emGseRzaF2Y6JXiOvprSI
	WR4NJW2kKtFSRXaviPw7aKREbw==
X-Google-Smtp-Source: AMrXdXv9oHEuZX6N/VTBqKXtW3+TfzCr+oUtAr00RH/X+fhW7I2eVAxR4oYzNfhuksnamLa32zIyQQ==
X-Received: by 2002:a5d:6f1d:0:b0:25d:4dfb:7a31 with SMTP id ay29-20020a5d6f1d000000b0025d4dfb7a31mr1609854wrb.49.1671275709795;
        Sat, 17 Dec 2022 03:15:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b002366e3f1497sm4770398wrb.6.2022.12.17.03.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 03:15:09 -0800 (PST)
Message-ID: <0090c1aed404443ef9981c57cbe29142054286b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ola x Nilsson <olani@axis.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 11:15:08 +0000
In-Reply-To: <CAMKF1sqAsU91XHhhN=JkpSX-EZ3RWmbFs+x8KkejRzyfwPnLLA@mail.gmail.com>
References: <20221208071136.1967696-1-olani@axis.com>
	 <20221208071136.1967696-4-olani@axis.com>
	 <CAMKF1sqAsU91XHhhN=JkpSX-EZ3RWmbFs+x8KkejRzyfwPnLLA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174771

On Thu, 2022-12-15 at 08:32 -0800, Khem Raj wrote:
> On Wed, Dec 7, 2022 at 11:11 PM Ola x Nilsson <olani@axis.com> wrote:
> >=20
> > Signed-off-by: Ola x Nilsson <olani@axis.com>
> > ---
> >  meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >  create mode 100644 meta/conf/distro/time64.conf
> >=20
> > diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.con=
f
> > new file mode 100644
> > index 0000000000..99eb06dc0f
> > --- /dev/null
> > +++ b/meta/conf/distro/time64.conf
>=20
> I think this file should be called time64.inc to make it similar to
> other distro fragments that distros can use.

Agreed, it also needs to be in the include directory as it isn't a
distro called "time64". I've merged this patch but I moved the file to
distro/include/time64.inc. We can improve it from there with further
patches.

Cheers,

Richard



