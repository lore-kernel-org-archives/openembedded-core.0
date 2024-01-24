Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93044C47DDF
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 13:00:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.21687.1706101219401858745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 05:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ItqS9dGm;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6dd9e8f370bso129787b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 05:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706101219; x=1706706019; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSpwim+Xm9Vq6rb9BF9QXLGMR8egUMmc9yQQLPJbU70=;
        b=ItqS9dGm3Ds6x0DYXUIvBArduJb5Om2t3KFTWV2Nf6ZiepGW6YjFif5IaS7e1k4pky
         5AJ3qn5/hfqlll5tgEehaAdBrdX6FdIf7lQmgrn7MDF98JOXKw+WXAL7eJn/JnQS/EF5
         6y5a94SccFaFyZcIq/3encnbF8UjKByE45QHpmUpAZTUAqo+72d8sTN93zChtjfGMZ4H
         WkiR6HnuBNYCAJ8q4Nlcw8CyzVdj7lc0YjW5Op7ls1CI9kl4lP98WfwEfXV1tKyOvOKu
         SxCwpRKwJLBJWQHf3RPhZbcP/n3RcN5Q+Vy9LsMp2uKweztr5lSaJFc5FeL0XSJp0NwB
         tDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706101219; x=1706706019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSpwim+Xm9Vq6rb9BF9QXLGMR8egUMmc9yQQLPJbU70=;
        b=BYegGbgXG5rg7KpNSoJViBBf9y8ieqjKSHU9ZybVji017IhqvlZeMncG9n1Z+W1lOu
         C8FJ+s53fG6akv2QBbRqH5luP6ejxzesS1D8LQyi3Z5R6c0bNpg5SLibEdMlnLKzWblG
         sL/YSebraXyNhZv0gq6J0eFXAE7S6SMyCHwk2hgBvfuDUxEvsanTE0oLBnE7l9/4tpa2
         WibMGYam/7YXNpIqGPehncwyLLeCd1Hv7WZxJw995dMZiXd9IDO74HdDKzEfZpm+eU+V
         uORLsRGTzxJFU5W3nCRioPuxvkrPwiGMJeuYdvfmz7AgCX6FIsi3YiwGHbROf/CUJhSA
         yhJg==
X-Gm-Message-State: AOJu0Yy2ZjMUqwLLM5BUVAAoYTUXvbN4vpRYRCG30nuXkOkyeYaSgRdo
	uRZRG+geUS+n3VIXmwQM4LYZG2G9FFNvwvDbaN66Nlvluz2YcN+PI2Sm7nXMwkdyN6Z38ON58so
	LMsP3g5G7976sReNfGJY89p1SPM8=
X-Google-Smtp-Source: AGHT+IFENwZTSJgBMSy0PjpbsAWxb5gVb7ubMCVibxL5dmIvDm+L12mjxSa2AYRbUGPis+OLcPCBKJ+6fakav6pcL8A=
X-Received: by 2002:a62:8457:0:b0:6dd:7c3e:3434 with SMTP id
 k84-20020a628457000000b006dd7c3e3434mr2345952pfd.0.1706101218713; Wed, 24 Jan
 2024 05:00:18 -0800 (PST)
MIME-Version: 1.0
References: <20240123140833.1372704-1-festevam@gmail.com> <2BCFD2D0-00F8-416B-A490-1DA742DD93C3@arm.com>
In-Reply-To: <2BCFD2D0-00F8-416B-A490-1DA742DD93C3@arm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 24 Jan 2024 10:00:07 -0300
Message-ID: <CAOMZO5BCvnRuPXagXeDW+e-5Kh6Nwd+BS8iJsH38wWUj0x1Ovw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pulseaudio: Update to 17.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 13:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194270

Hi Ross,

On Wed, Jan 24, 2024 at 9:48=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 23 Jan 2024, at 14:08, Fabio Estevam via lists.openembedded.org <feste=
vam=3Dgmail.com@lists.openembedded.org> wrote:
> > +FILES:${PN}-server =3D "${bindir}/pulseaudio ${bindir}/start-* ${datad=
ir} ${sysconfdir} ${bindir}/pactl */udev/rules.d/*.rules */*/udev/rules.d/*=
.rules ${systemd_user_unitdir}/*=E2=80=9D
>
> It=E2=80=99s best not to add entire trees like ${datadir} to files, as th=
ere may be unexpected consequences.

Thanks for the feedback.

I will send v2 that only adds the specific file instead:

FILES:${PN}-server +=3D "${datadir}/dbus-1/system.d/pulseaudio-system.conf"

