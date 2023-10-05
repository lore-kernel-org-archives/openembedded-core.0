Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064F6E7C4FC
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:54:56 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11081.1696496090394784632
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:54:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eCvo9QTq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-406402933edso6132095e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696496089; x=1697100889; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VxKbd05/mVHG2xmLulL16R4oDntEusZ29/5JCgjvr7U=;
        b=eCvo9QTqUpzp0VmCZEnu/1yaqTPtN5PQOhD5WXtgZQ6SsGUn4LZojR3n5ultomQ0kr
         39ux+yGzrcfoy/ZF157tEFfqQSOx7nYvGr0ioFXY8ejrTfqePpbJvKf1mHEeXOijuCVv
         YeQKULKFsxb1c8gfIIaGOwvh0/iEFGpTjlgEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696496089; x=1697100889;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxKbd05/mVHG2xmLulL16R4oDntEusZ29/5JCgjvr7U=;
        b=SKkIqQ+MmIw+UYN/WRnY80DsJp3k8dE3pcg6BK6z8ThW4WTIHyicgd6qFmk/C96BYa
         +ynjNlArsY7vda/rTPSvE12QjZF76bNCmErNkX182estD7kytd1r/zWMu/Kr0jv7PYBK
         1U9TlcDFifiDrgwm6qF0InknmgklJ7JUcfAgIOSBB8iNemKrK720j9Go8dl1GH39hWsI
         JGX5jt0oV2JLCf8C7mPWhV0vhuTyUzuDtPIEobxsMfETnP4oUQFd0nGNnSRylSaChHsi
         r86V0z2JyriMUBpyDXFmRM9JR6zLTmJ8HJVbQiHEtLKAOckvusaZ7w3Au+gpBsSJh2cC
         QBIw==
X-Gm-Message-State: AOJu0YyS5YIAHVkequ3Bhozr9JWe5EdTjka6xLHUY/m63Nq56BkOJwra
	nIANMVfya5p0Y2RH/7fIbiOCRw==
X-Google-Smtp-Source: AGHT+IFwlmOCzlgNGVBTbPJm5QFPXL3DJ2JtqTkMX4rV8kXZ9TfH67nKxyEUaxbskzcG03FO5FxDsQ==
X-Received: by 2002:a05:600c:3786:b0:405:359a:c965 with SMTP id o6-20020a05600c378600b00405359ac965mr4738292wmr.4.1696496088673;
        Thu, 05 Oct 2023 01:54:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd34:260d:44d4:25bf? ([2001:8b0:aba:5f3c:bd34:260d:44d4:25bf])
        by smtp.gmail.com with ESMTPSA id p15-20020a7bcc8f000000b003fee6e170f9sm1012919wma.45.2023.10.05.01.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 01:54:48 -0700 (PDT)
Message-ID: <128f46d313e3768642f023490d98a189483e0103.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 0/4] insane: Add unimplemented-ptest checks
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal
	 <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 05 Oct 2023 09:54:44 +0100
In-Reply-To: <CANNYZj8ZHKMXWbiG_wRTPm3Za4bYJXhg+19F=PO4RD2BWX35aQ@mail.gmail.com>
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
	 <CANNYZj8ZHKMXWbiG_wRTPm3Za4bYJXhg+19F=PO4RD2BWX35aQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188709

On Thu, 2023-10-05 at 10:47 +0200, Alexander Kanavin wrote:
> On Wed, 4 Oct 2023 at 14:57, Yoann Congal <yoann.congal@smile.fr> wrote:
> > Currently, this check find:
> > * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
> > * 827 unimplemented ptest in meta-openembedded
>=20
> Does this mean there will be this many warnings in everyone's builds?
> If so, this cannot be enabled by default; any new QA warning must
> either not be triggered at all on the current revision (and is added
> specifically to prevent regressions), or come with a realistic plan to
> address the warnings. Implementing hundreds of ptests in a short time
> frame is not realistic.
>=20
> On the other hand, the output could go into some kind of report, I'm
> just not sure which one.

It isn't enabled in default builds and can't be for the reason you
mention so I think the intention is that we can do reporting using this
periodically.

Ultimately we might have it as a new "log" or "report" level and just
generate reports during the build. We did used to do that for previous
"insane" tests. We just need to think about how that would work with
sstate (warnings are already an issue with sstate).

Cheers,

Richard

