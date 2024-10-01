Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62C2CEACEA
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:54:10 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.86822.1727801644301749908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZtuyU9Bk;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e28ac7b12bso3199830b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727801643; x=1728406443; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF3lw2Oh9LtbNo5PKiVNujRv4Y24sUO3VtxqiUgBx+Q=;
        b=ZtuyU9BkyuXBDGWTgkiw6tpR9y0qaT1+On9JqjPmClMg3ZjzeyZy2WJz8SQ4qM+ruy
         IFv0lhAMvb3LKOUuRsdmVKLAFN8/iNSWD0YqUoHY5z/xWGIxHKH7nMTErHBEpNxVSyPi
         js4iTgjbRqh+wlDaJAND8kCU6xQnXWTK2Q3o4n1HDNCHiSyhnE4XVt2Dvpz6OD3Rs8Oz
         e+B+iCZ9un+9jCZxGSaLk5Hsag8sIDsnqrQKswNpNLDy0ux6JdUKKr7uX2dYcdaFdNNT
         HYKnO6SENeZhgAskwXf/FWh5dtAkJZ90odw6UJ9RKsVgHI+yWRmB1GPww/l3JzsQJE5b
         MkGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727801643; x=1728406443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF3lw2Oh9LtbNo5PKiVNujRv4Y24sUO3VtxqiUgBx+Q=;
        b=gFm80tVs49Sn9fyQCL5rpIXDkgobgddRsUorNKfhW1C3DZXlQE/CYo3nfgh/2ifXMm
         CwRzEe3pEV2JuL6z4sZG+nJgIVbwISDHxoDh2OsGX2s0K7TYt27zsNnVratMzbPVi1Wc
         b/0NSMX/rwTQZ6X5M19D7yJwRT3FGvSEqcbdN5fvkCz74Wba1vQXl6paCz8Jvsn/Xn1V
         KQwmd2oQuNzziisCs0qLAclr6p9oP2M3XV4nPcNjPrZ1W4CFr4pvNvPsMSjqShznWeXr
         RmrmLI1j01SwjiutAuE/eDHmOxu53VYCPRrl35b8tq5NVwHomTa0qEF4EIHP2kxBUKnM
         xPXQ==
X-Gm-Message-State: AOJu0YxIxaZMXOqhA0xLwhrb9Kd4hEKkKwQWLVxmfopWojfL+1Z1I3qs
	STkWJqPg5kgq9gBJUVenz9eZU1Pewq9B18Ws78SO1XurYWp4FJ7R2NyDb18cC8WiflrE1w7eUbn
	i3qvxNlcZXVLjNCbDinYGVjSAZG8=
X-Google-Smtp-Source: AGHT+IEfeAwYcTX9COlTzSOYErHINhWGPraLNJOyus+hH68ULcPf8PxmC0SxZHqA1eXnYY++WIXdfq/PT5WWFBOo7Tc=
X-Received: by 2002:a05:6870:b30a:b0:261:164d:685e with SMTP id
 586e51a60fabf-28788f11e14mr95035fac.43.1727801643446; Tue, 01 Oct 2024
 09:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241001114855.363065-1-Deepthi.Hemraj@windriver.com> <1702.1727783699519791904@lists.openembedded.org>
In-Reply-To: <1702.1727783699519791904@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Oct 2024 09:53:37 -0700
Message-ID: <CAMKF1srn_t6Aohpd1DvWQ4XX_uAab_kG8bxy6ubwPtu+FW02UQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH V2] gcc: upgrade to v11.5
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 16:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205176

lgtm

On Tue, Oct 1, 2024 at 4:55=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Testing was done and below are the results:
> After update
> PASS - 154678
> FAIL - 206
> XPASS - 0
> XFAIL - 854
> UNSUPPORTED - 2293
>
> before update
> PASS -  154218
> FAIL -  208
> XPASS - 0
> XFAIL - 854
> UNSUPPORTED - 2292
>
> Diff
> PASS - +460
> FAIL - -2
> XPASS - 0
> XFAIL - 0
> UNSUPPORTED - +1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205159): https://lists.openembedded.org/g/openembedde=
d-core/message/205159
> Mute This Topic: https://lists.openembedded.org/mt/108756157/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

