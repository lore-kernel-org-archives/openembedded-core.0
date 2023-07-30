Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963DEC001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 12:37:10 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.71776.1690720624653191820
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 05:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=S/fXWALV;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: luca.boccassi@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-d2b8437d825so1310699276.3
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690720624; x=1691325424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NG4GEUoB7dfaFy5azjFFVnfCzU41c0UvBOjL7AkBd5A=;
        b=S/fXWALVr0DlFGCspYQbAChksdQC0c8mEGMQsbjqV9ThW+RxoRSAo4LWP2t1jc8UAH
         6Njhau74aAF+z1ClYVldD3kk1KCTpX9ZfLVlMFqEEU+DE1Y15cpWl2+ksBE0/QSrwJtS
         0/RL3CTC53Hm9MvNPrd7LFUBBwdHl20ks34qOO5H/nadvLPLA9ndZWO+qM0EaBtEjLU5
         NuaIqHZMcbqPDvZLwozouLoSAcCTn4j0fipjzVoXGv365CrzaQlFQ856jaC5mAp1y4Or
         Ax0Kn8bFNtGxjBbY1ZbGw+qaFLmKvdTJq7DqDI+f54YE3bx8Q3PQ2/dqmejW9cu/LGWb
         W3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690720624; x=1691325424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NG4GEUoB7dfaFy5azjFFVnfCzU41c0UvBOjL7AkBd5A=;
        b=Tx4F7hDZArxOaThJd/u0NSLKKgK5W8a0rw7XlA4Jt0D0o4gpp+NDMLXGYy156fLYDc
         xJTI1me6aNos0JlVQ+EPHGulP27jDu8DKOZtzfyK9J3Kj1lly6oh7IJC/KtTkgviKPHu
         DoWotkDElCCAUXncmzBSqo+0ZQpkQX68q99EjVyQceZVtUtkMOo8oZnVUZfxeA5n5Xun
         NQhANIMQgbbQrJqK4AZ/oZb5RuJHRWqRGaVVPFDf6MV4iyY5FrcuS7HOZHzBtqCOKAWw
         IV1MdljuY8Iav09n5bt+gb6pRcMkIqimpQJ3dq6f416euj9CUYN9o6GUuEi/Q8gMPSbA
         FBGA==
X-Gm-Message-State: ABy/qLZQyvdrO6RqQrutTV97szRNNXwgsAek8D/8M6FCjQxXRZsTQUhL
	AN5/FyJ954rEzJp3/QzwbOn0G4m/43dN3Cbr8ng=
X-Google-Smtp-Source: APBJJlHi4PZchRhRWta5yLFhQKbBIGDdQ/dS05KqSUE2y5E3M1wqDJbR7efvXSj2BGB71d9EP/yBAuMjmbT7HrmEVus=
X-Received: by 2002:a81:54c1:0:b0:576:a603:e733 with SMTP id
 i184-20020a8154c1000000b00576a603e733mr7176192ywb.22.1690720623787; Sun, 30
 Jul 2023 05:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com> <20230730080658a80a3cdf@mail.local>
In-Reply-To: <20230730080658a80a3cdf@mail.local>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sun, 30 Jul 2023 13:36:52 +0100
Message-ID: <CAMw=ZnT8J66vOCJbVwez=29+=HUG0R1Wy29E9-Vv1oz6O3Dejg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: update to v254
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 12:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185066

On Sun, 30 Jul 2023 at 09:06, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> I have the following failures:
>
> ERROR: systemd-1_254-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any package:
>   /sbin/mount.ddi

Fixed in v2

> and
>
> Jul 30 00:29:43 qemuarm64 systemd-logind[240]: New seat seat0.
> Jul 30 00:29:43 qemuarm64 systemd-logind[240]: Watching system buttons on /dev/input/event1 (QEMU QEMU USB Keyboard)
> Jul 30 00:29:47 qemuarm64 login[263]: pam_unix(login:auth): user [root] has blank password; authenticated without it
> Jul 30 00:29:47 qemuarm64 login[263]: pam_unix(login:session): session opened for user root(uid=0) by LOGIN(uid=0)
> Jul 30 00:29:51 qemuarm64 systemd-logind[240]: New session c1 of user root.
> Jul 30 00:29:51 qemuarm64 (systemd): PAM unable to dlopen(/usr/lib/security/pam_umask.so): /usr/lib/security/pam_umask.so: cannot open shared object file: No such file or directory

That's an optional module, it just means it's not installed. Not sure
which recipe provides it in yocto. It can be ignored, or the module
can be installed, or a custom pam config that removes it can be used.

Kind regards,
Luca Boccassi

