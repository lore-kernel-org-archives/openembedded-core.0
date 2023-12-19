Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CDCC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 15:07:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.15571.1702998413778487095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 07:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dQC7ASyH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40b5155e154so58740975e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702998412; x=1703603212; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TJHVBEgfQyadEgHjUMeA/KC8oPYxazZvnVMSciExlfI=;
        b=dQC7ASyHkhig0ZhStsWI9bP4zVMK5gbXzFzn7RgORP4Ngf8sUsntvSedX3xW6gxqDQ
         i/dDKrT5fPnYocIVFM9O70Kc3vGUJzB7iq7AHQIod082JAjhysmduo91af3UY1qOFZ81
         4/7T+GJoaHRR2UBuiMROKnEOsRKDB5+1jgP3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702998412; x=1703603212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJHVBEgfQyadEgHjUMeA/KC8oPYxazZvnVMSciExlfI=;
        b=Uz8wnVY5a5TpCfXnDtMwcvdclTbl5EQloXeKK+OK+d8ZnAdufkppOQZ6G+n1Wcqcy1
         hrLsqVmQFLMzodfFbMfWbnLrT+zMJZWdk7lTJ+4wi7105ww7CE9mXRWVtqQQ00Jl8E5E
         tDzckBbdl/Sn0Y/3qX4fR5bHp4ZEugeXL2M/zlz74gXBnD7jR034hEVkW3+4F6+a9Ycn
         BZCEa4+ePhkgI5/tGF4dRjoondXyr+AcHSIvnx8FS/yDtMjRuO8Cxf2XU/ZoFEe/g1fp
         rbk+5sj/frUiZU4O2orAntpGMiF+1OdDRnbsst2jSxczJQShjqzcRJYO8utaX2dDjzNN
         I9rw==
X-Gm-Message-State: AOJu0YxSJbPKc7CilUu7SsjfV/G9Uz14aqYJdDpdoNngUx5kP4kQJfMN
	k6UYiw1+N9YnmDVsXFEA86zsd45obFraN4TLvQ0=
X-Google-Smtp-Source: AGHT+IH29FlH/wL0yPmPsAN/m0xyxTk/3RpMxjGvB6kes24naL3uJNmtTRrC+JjUcge/PBC9IAmb1Q==
X-Received: by 2002:a05:600c:4587:b0:40c:6e0b:69d3 with SMTP id r7-20020a05600c458700b0040c6e0b69d3mr3422934wmo.1.1702998412230;
        Tue, 19 Dec 2023 07:06:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b87d:537f:7c6:e419? ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id c5-20020a05600c0a4500b0040c411da99csm3211370wmq.48.2023.12.19.07.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:06:51 -0800 (PST)
Message-ID: <505d6668951e0a730781c606273040fe2033ed31.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] oeqa/selftest/overlayfs: Don't overwrite
 DISTRO_FEATURES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2023 15:06:50 +0000
In-Reply-To: <CANPvuRkcAQPdRKmUekp5K77hrzi6mvEk+kUQt3Fbj0kym-vnNQ@mail.gmail.com>
References: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
	 <20231219143531.3514266-5-richard.purdie@linuxfoundation.org>
	 <CANPvuRkcAQPdRKmUekp5K77hrzi6mvEk+kUQt3Fbj0kym-vnNQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 15:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192746

On Tue, 2023-12-19 at 15:03 +0000, Jose Quaresma wrote:
>=20
>=20
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> ter=C3=A7a, 19/12/2023 =C3=A0(s) 14:35:
> > Whilst debugging an autobuilder failure, I wondered why it was
> > rebuilding qemu-system-native
> > instead of reusing from sstate. The reason was it was overwriting
> > DISTRO_FEATURES,
> > in this case removing opengl which caused much to rebuild.
> >=20
> > The test doesn't need that so don't do it.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > =C2=A0meta/lib/oeqa/selftest/cases/overlayfs.py | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py
> > b/meta/lib/oeqa/selftest/cases/overlayfs.py
> > index 4031ded0fe4..a20fa6acc2d 100644
> > --- a/meta/lib/oeqa/selftest/cases/overlayfs.py
> > +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> > @@ -79,7 +79,7 @@ DISTRO_FEATURES:append =3D " systemd overlayfs
> > usrmerge"
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0config =3D """
> > =C2=A0IMAGE_INSTALL:append =3D " overlayfs-user"
> > -DISTRO_FEATURES +=3D "systemd overlayfs usrmerge"
> > +DISTRO_FEATURES:append "systemd overlayfs usrmerge"
> >=20
>=20
>=20
> The equal sign is not there and also the extra space before systemd.
>=20
> DISTRO_FEATURES:append =3D " systemd overlayfs usrmerge"

Well spotted! I'll fix on the branch. I had confirmed the issue but not
tested the final fix :(. This issue was causing a cascade of other
problems I'm busy trying to untangle.

Cheers,

Richard

