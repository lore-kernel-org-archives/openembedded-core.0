Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E77C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:46:04 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5071.1682631956742728015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 14:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=GHKJO/zR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3047ff3269aso3396405f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 14:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1682631955; x=1685223955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzKf18GRw+/8UoW7vbkqRAKYc3IxeHc3PSnaVwwBO00=;
        b=GHKJO/zRvDFaNe1JhI/m+xZ6IiHBH6gMyXbr71JxOqY9kXvc3WVycRI5+yIbMO2N26
         xvEgFPELhyWdG2/PHqQYRmW6ZVFQGXMECE1gnBNuUnjP2ElOuT9Sj/WAEQUC+iqwz60T
         kOZ1M+remz/8CKiAhwHvGTbTbk/Yb+timYQkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682631955; x=1685223955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzKf18GRw+/8UoW7vbkqRAKYc3IxeHc3PSnaVwwBO00=;
        b=StqB9/ClQqDtEfF/93wAGcFTIujCuL+P70mKvmtVlvKHxsN9c3T/Pp3VOzSqmJPtUo
         2MLTGkGFrgDtDUuidAJKUT8myx0Pl/DhjAsM333+R/hMTpKyzjZ2wRaGMCil8xPqIUy8
         ZwWFpKOjgzbWI71319EoS3OSKd8WHHgiG4RRj0SWEbWbeI1HdRqifAYQokBwnBa4xmML
         kvxcVjrD/TW82C0/QUHeFI1CA3YsOPZMKU1HDKsbr0hDPWTU5KChA+HaGe8Wu3ScDhni
         m5IQqJ2tVqEn04DENsrE3LlVoA+pzqdGxqg6saMsC8vwIZAY2a7ARXF2TEIE+aW985MX
         wJ1Q==
X-Gm-Message-State: AC+VfDzwZE4/6d/ekqDZqX9mooWUv+VJN40WbUJh87+zvGwDHIq21y5J
	OpflCfrm5i0wai75MRLRJ1Xshw==
X-Google-Smtp-Source: ACHHUZ4b4CLTGITKFC76WL8pQD4D1D04UFw/hd83jShQY5qjxyshTs+FFXgCKKQY6CuVmo7A/LW8xA==
X-Received: by 2002:adf:f0ce:0:b0:2f0:69c4:3900 with SMTP id x14-20020adff0ce000000b002f069c43900mr2422225wro.54.1682631955140;
        Thu, 27 Apr 2023 14:45:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad40:2df6:1598:4079? ([2001:8b0:aba:5f3c:ad40:2df6:1598:4079])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d5950000000b0030490c8ccafsm7472207wri.52.2023.04.27.14.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 14:45:54 -0700 (PDT)
Message-ID: <50b96d45802a0cc846396b661795fd6915ca137c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to GCC 13.1 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2023 22:45:53 +0100
In-Reply-To: <20230427185253.1519194-1-raj.khem@gmail.com>
References: <20230427185253.1519194-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180500

On Thu, 2023-04-27 at 11:52 -0700, Khem Raj wrote:
> > - Package libhwasan_preinit.o, its available on some arches e.g. x86_64=
 on
> >   gcc13+
> > - GCC 13 Porting guide [1] and major changes [2] and detailed documenta=
tion [3]
> > - Fix aarch64 cross build when S !=3D B
> >=20
> > [1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
> > [2] https://www.gnu.org/software/gcc/gcc-13/changes.html
> > [3] https://gcc.gnu.org/onlinedocs/13.1.0/
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>

Doesn't this need the prefix mapping parameter changes to bitbake.conf
since one of the patches did merge but was altered by upstream?

Cheers,

Richard



