Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912D2C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:09:56 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.18031.1691676588496795986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=nWMWI62v;
 spf=pass (domain: gmail.com, ip: 209.85.166.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-790cadee81bso31255139f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691676588; x=1692281388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkFjsFkuOzNtzbDD6oHNmyeeMNfvjVvli8nw0eROczQ=;
        b=nWMWI62vruKnkK0pLPEdMafJrquphKIcCv8H4YWDltUaZPGkGeEZOuG1286NxXO+n4
         QyAqSWU7uUwQY7O9oxUL3xxqBueLlTnNxtd7iqAp502x7ujfgMnzvnMcGt4LgNhjM6hs
         9rK4o9I6ZmVAQZfohi42yWCebeMJqxWk1zlYjCfN6XcK/flrJm1oX9p/HsOUpUN13+c/
         6d45elhXQu0znl6ZX0gDmq4PIdKqFbrDohfOceefK5smlH+8AtKAUHM70s+EDRlGxPpi
         E9jwS98BTJ2KhA7PQXB5gLUUZPNAvCtacyFMhi2rmZWgDkeenz3bsiP3GSoAcRopHM9s
         MJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691676588; x=1692281388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkFjsFkuOzNtzbDD6oHNmyeeMNfvjVvli8nw0eROczQ=;
        b=dkeDqVOniRLDQsNmYbEt9AFZG5omWlJ6SeN9qjORAmLsNnjfA7MO5+5nstYDG1zZer
         h8Vf6HhQRejlHsK768IKs6SMEyf4YFztxx9R74MwNPYn8oWdMF2ELi/gYtHDKWTdAzMT
         vm1iRdF6GccgoA8XPJTaRqT/Dtcqlikf9cjnajU8T7wSINxL61D+kCAFsdw3au/HxCu3
         KLs5d9gj8F653zrYAm5vLehybDeb+cardynv4v11mcxc6GQ+pI9kXJYApYhNwKpAox3W
         KLwGWcxTgtzpNhHrp5fBGZnOsO+X/9hCVvuwWLEWLH9ffVGDddcpjiJnT6nzegoBrY2t
         SFlQ==
X-Gm-Message-State: AOJu0YyAY3TUIPW6I0dhXIKC4yeit3iRJXIGoEHTUROd6dn2VxWLyGhx
	78Tei/XsoAj5MNAi2mf9869Ud6TxeqDrxztKKBo=
X-Google-Smtp-Source: AGHT+IFiHL6Ay/RhyzOYch1nll85usch+71pbBXupNTHsfjZPJHfv6R1oZQiOQUXBhzON3zACBowRjpN3uXCqoNJvz8=
X-Received: by 2002:a5d:9e05:0:b0:790:9460:6304 with SMTP id
 h5-20020a5d9e05000000b0079094606304mr3347708ioh.5.1691676587645; Thu, 10 Aug
 2023 07:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
In-Reply-To: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 10 Aug 2023 10:09:38 -0400
Message-ID: <CADkTA4PUSq22Ct4qg50VaAtY79Q9o9FgtDmziry7QwyAqqi3qg@mail.gmail.com>
Subject: Re: [docs] Keep scripts/create-pull-request and send-pull-request ?
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185750

On Thu, Aug 10, 2023 at 10:04=E2=80=AFAM Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
>
> Greetings,
>
> I'm reviewing
> https://docs.yoctoproject.org/next/contributor-guide/submit-change.html#u=
sing-scripts-to-push-a-change-upstream-and-request-a-pull
> and trying to simplify it.
>
> Do people still use scripts/create-pull-request and send-pull-request? I
> see some obsolete URLs in the first script, and mostly old commits to
> their code.

I use create-pull-request for all my series, so the scripts still do
work and are in at least in use here.

But I send with git send-email directly.

Bruce

>
> I'm also asking because I'm wondering whether it's better to document
> how to create and send pull requests from standard git tools. This way,
> people also learn how to submit pull requests to other upstreams.
>
> What do you think?
>
> Thanks in advance
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4135): https://lists.yoctoproject.org/g/docs/message/=
4135
> Mute This Topic: https://lists.yoctoproject.org/mt/100663723/1050810
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [bruce.ashfield@=
gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

