Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE69EC77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 03:26:05 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.11338.1682652361910351011
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 20:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PwaIN7o9;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-187ef4d7863so3584534fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 20:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682652361; x=1685244361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgaiCOf9bXC05LvhuzR7ZpgDZ5hzh77dA65RhdZYH8M=;
        b=PwaIN7o9Iqpu7n6OS+FoH9Xjfk0qCcIECHWOvS5Y7rmdH29JRmmNyoHLrOtxdITOXf
         BuxvGURyjBOsILMkWEx9Tcmq4+a+S8WqVKQg9blaIa9CcHUSlN55cFEpj3dYVuOBtXyx
         FMDnGHXeJS/t+Nt/WfbX53rRfLkfH6oKCknwJH/FkDM6I7QgTfb8PaK0qdvuA/6Hfu+H
         aeywHSjTw6t+clCEpJMyTfwCv7uS22mOVhQo4O+D+TtjxSftmnmX0zVcR3SHE7Ta2WhP
         EFFguI0dZms6vlBue9t1m77AdjEhjk4+abbhBvsjcPJ9sLtvggxGv0WvKbKhD0cQJ+hY
         dhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682652361; x=1685244361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgaiCOf9bXC05LvhuzR7ZpgDZ5hzh77dA65RhdZYH8M=;
        b=F9SE8mMp2/sKPiwILkPJWQkHvK2pTclbIQ3w7KqVk8609usH92YmRaP1n1CbRO7bsR
         1KLqoRraRLQ7SBJBYkwBdFez64hvGbV1fVNQu7MFniclGd6LXV4vncw4c3H6/2bblGed
         tiN4czmmpUcWXYf5/dY8lnkBimTkqJ70Y8UPPTTiOTAeZ6Kkk2T0H8zPdhxXKQlg1g8o
         9q9H/ltIkhZvWljU/Frk3XiEyNFq2ab4JMlQVXuKxFGzgBzV912G7KWnXwjBt3N31vVS
         5poTBnAEbGODniEK5UeVM57LPMRue6XsRlzNZo/Hkoo6sqvjz8Bv3H0tuIE36OdwThGj
         nLaw==
X-Gm-Message-State: AC+VfDyhMrcV0LN2IZ+oVUcyjpzjv3ps7v74gPmfqyVuHKc+qyY81zyI
	zyGMFJNE3vYfIP8XmDU3yUee9wE8OydND4P9+jfkLtvFjJg=
X-Google-Smtp-Source: ACHHUZ5m38IKmQPgqWZ3lAWjTq2Bp9XS6vh7j93K4qqflRxIFIKXAV80PCHM7CaForR2ier5MZluTpn6lIG6D5aOGVg=
X-Received: by 2002:a05:6870:85c4:b0:177:c2bd:3f6d with SMTP id
 g4-20020a05687085c400b00177c2bd3f6dmr1816768oal.45.1682652360965; Thu, 27 Apr
 2023 20:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230427185253.1519194-1-raj.khem@gmail.com> <50b96d45802a0cc846396b661795fd6915ca137c.camel@linuxfoundation.org>
In-Reply-To: <50b96d45802a0cc846396b661795fd6915ca137c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 20:25:34 -0700
Message-ID: <CAMKF1so7Qir6WTH-CG9wsiwFjtTR8rwUzWydukq=CXPBh38sPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Upgrade to GCC 13.1 release
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 03:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180505

On Thu, Apr 27, 2023 at 2:45=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-04-27 at 11:52 -0700, Khem Raj wrote:
> > > - Package libhwasan_preinit.o, its available on some arches e.g. x86_=
64 on
> > >   gcc13+
> > > - GCC 13 Porting guide [1] and major changes [2] and detailed documen=
tation [3]
> > > - Fix aarch64 cross build when S !=3D B
> > >
> > > [1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
> > > [2] https://www.gnu.org/software/gcc/gcc-13/changes.html
> > > [3] https://gcc.gnu.org/onlinedocs/13.1.0/
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Doesn't this need the prefix mapping parameter changes to bitbake.conf
> since one of the patches did merge but was altered by upstream?
>

Right you are. I have sent a separate for to enable -fcanon-prefix-map glob=
ally.

> Cheers,
>
> Richard
>
>

