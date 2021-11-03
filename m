Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DB0C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 08:21:06 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.4735.1635927664634000214
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E2ITDqCo;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id b3so2909390uam.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5pHkaq7aZZBCJGnqzuCq2PXZWwhx2O6Y1+e8Ea6OOKo=;
        b=E2ITDqCoXgqi89ETdE9iZnewFnuwJBP1Gzfnu7LdTxZ8DEX0OgEZZ8uXFNlTlR9p+R
         V/qX+z+lDRTE+y8J2DdRh2C6i+hlS6c62rjcNJ34XFl1z0aiBPxvZYXFD+Ky9WDF2yPl
         xK73tvHZWNu+chwR2YN7tEvo0dVmGsw/bC3C9sRErseoLRTIRNdfQ6bF0xm6xlbENJZz
         q4u3fjuFrgLqvOufUl6Yrm8iXFFCzXXpJFVSQBl5FM6/+FWpbnXIKg1Jj2j0BXJXmMvn
         2+lmFdAg7jRZFAG6MAl/oRAQd8jDD9DTRG/5VkJc4gKIMBBAHWpb+XcuUQTLa1oUejTI
         0sqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5pHkaq7aZZBCJGnqzuCq2PXZWwhx2O6Y1+e8Ea6OOKo=;
        b=Wd5isSRLtx/vUIvdVaxR2ti9RDtWx6BtAli6KyfS82Ci3k/9RNvF2UIkq+QfV3jdYw
         ePdxA4Ou5sfU1eX7BlTeF6scIhvNXDBw66mgqezJR4ujl9h6TdWmT7US4sLubhNkLzGY
         lWy/W0L0jOzfn0mofvI/V5DAwH7iR080NH/rBY1H4eTc1v9j0WjKoJjZy6toNWyQRxlE
         /NVLXt3IKrzS7bnsIsmjciByt1k8YHPLdz0OxcosPUpBY/3k3Tq4N5PBMWLlfoApnSS0
         G8VnF3jyXeNAHmYDzRHPFJwrfvDluruNk89S0PxeHZkIH4sfynbz4aC5TfnxmvNPjBdg
         DzAQ==
X-Gm-Message-State: AOAM530utX1jLPgqSUgyPI5y2XHgkQ2qsAnnYuCJ/sOvcyfc13DvIY2+
	0yJxgL45gs93mbYtlzHC5/B5uqVPwUlQhrSZntw=
X-Google-Smtp-Source: 
 ABdhPJw0DlCjc/Yj4sjHoiWK+4O81Ao8GYDuNunStC7xZHZ9TXg1ck2g3nV3mh7UMlEQ4Q+9G4mOCSGavwylhA0nlLI=
X-Received: by 2002:ab0:30e1:: with SMTP id d1mr44810040uam.22.1635927663618;
 Wed, 03 Nov 2021 01:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211103054834.8003-1-changqing.li@windriver.com>
 <CANNYZj_O1AcmhHYm=uuOS74Ma=JU9MP7uXxWVE8Hy5apOx66DA@mail.gmail.com>
 <741da653-7ce5-0eff-83fe-7eb15f973c94@windriver.com>
In-Reply-To: <741da653-7ce5-0eff-83fe-7eb15f973c94@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Nov 2021 09:20:51 +0100
Message-ID: 
 <CANNYZj_+n-2v6XCjGdBqtrWcixEyJjPNyzL_z6pBUNr1f_8t1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ruby: workaround ptest hang problem
To: Changqing Li <changqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000044ae5f05cfde1744"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 08:21:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157823

--00000000000044ae5f05cfde1744
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Nov 2021 at 09:01, Changqing Li <changqing.li@windriver.com>
wrote:

> test_smtp hang problem should caused by openssl upgrade to 3.0. but
> ruby_ptest is moved into ptest_problems when openssl is 1.1,
>
> so I am not sure why ruby_ptest timeout in the past.   But after I remove
> test_smtp,  I can run ruby test successfully.
>
> if no objection,  maybe I can try move it out of ptest_problems and send a
> V2
>
Yes please. run-ptest handles hanging tests better than it did before, so
we can better pinpoint any remaining problems.

Alex

--00000000000044ae5f05cfde1744
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 3 Nov 2021 at 09:01, Changqing Li &lt;<a href=3D"mailto:chan=
gqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>test_smtp hang problem should caused by openssl upgrade to 3.0.
      but ruby_ptest is moved into ptest_problems when openssl is 1.1,
    <p>so I am not sure why ruby_ptest timeout in the past.=C2=A0=C2=A0 But=
 after
      I remove test_smtp,=C2=A0 I can run ruby test successfully. <br>
    </p>
    <p>if no objection,=C2=A0 maybe I can try move it out of ptest_problems
      and send a V2<br></p></div></blockquote>Yes please. run-ptest handles=
 hanging tests better than it did before, so we can better pinpoint any rem=
aining problems.</div><div class=3D"gmail_quote"><br></div><div class=3D"gm=
ail_quote">Alex<br></div></div>

--00000000000044ae5f05cfde1744--

