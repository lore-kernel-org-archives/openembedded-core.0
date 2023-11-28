Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFC8C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:14:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.6013.1701209652883768268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:14:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VKAjodRx;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.171, mailfrom: steve@sakoman.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c9b5b774f0so15084211fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 14:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701209651; x=1701814451; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eJs2oIu2KkKR9pmmYE5oR5JlA6u2AQh7udLP7sTalg=;
        b=VKAjodRxmUXbU102ZYJDzrcvhDvmU2XLlKHDuZVwF0BZ8wcazcjofI5/sCu1fOtPMk
         Y4EnKZqBgrCJFlvlmUs6+rZtxCz9NSyR9zb+s5IOZf5UE7YIzOpXgjc6a6j79Tqmc8hq
         QIvyXNsfNcxXflS9WwnOnhwld5aDRd7up7/AwM8ITt36QxM4hz/iPLkODka7RVC3PVUL
         HDAEfBxehKllplNwJ82rYkEHZSHD+6XhZM77SF0vHnQJNmo6PsfAvDYUHsgWUO8jtu0B
         jBA8sWh9WCoxo3fJgWGbIOMigxtsHoKM//FVQPcHSAal7XDvOInPqUr6rIJuqC48cH1g
         IDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209651; x=1701814451;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eJs2oIu2KkKR9pmmYE5oR5JlA6u2AQh7udLP7sTalg=;
        b=taWGx7swPWgJ6Qqufabe8rnErg1cM5BhwnPGFoGPYnD9LPXCr9OnSQS6wypUNh75sH
         5qRKqVncRxpP1DBLLvoAawEfDCh1eyPwJkeYBMSvHEncFozo0/6EEQwRRF59D5QS8QGt
         FytBx/A6NTi1prYKVNewRse4NcAENUfFZpjfdjKzfxtmA2wd41WR6KRX9Kh3MkrkIRXu
         jZxgYTV/cGNwVImMTOY5wY18GjRank99+vPC1wTb0w+nM3fOSs9riU1gE0YntwvUylX3
         pZPQOcXQN5+CKn5IDfPRH3uO8V2vS1iwmlUOtZvyMD9KQOQC4FmJFhdWt8BI9YXMj0z4
         rkzg==
X-Gm-Message-State: AOJu0YxDN632RvBPTQxbnQCqxMS0TqI71V1V6CrlB98jRi4IJtSU7CfY
	SyQGkaFlueXLkMqNlMbeTQNDR2R/IiG2Y2V6Y0uX2uSdIYnKk58DiA6ijA==
X-Google-Smtp-Source: AGHT+IEed2Jo6EXc12gjlQDMTLIvd18lfYwkDssMoojovu5LS/xSXCsKhnP4TRYqsxDTq4C5K7jCgII0a20y2MUqSng=
X-Received: by 2002:a2e:a692:0:b0:2c9:a08a:9872 with SMTP id
 q18-20020a2ea692000000b002c9a08a9872mr5281262lje.42.1701209650981; Tue, 28
 Nov 2023 14:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20230403162723.695380-1-badganchipv@gmail.com> <9575.1701067981108130823@lists.openembedded.org>
In-Reply-To: <9575.1701067981108130823@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 28 Nov 2023 12:14:00 -1000
Message-ID: <CAOSpxda=4b6LJy1ynO_6kcDJH0SNVERt36hK5R4UWDXR_iCkew@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] json-c: Add ptest
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:14:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191389

On Sun, Nov 26, 2023 at 8:53=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> Hi,
>
> Could you please take this change

???

You previously asked me to ignore this patch!

Steve

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191254): https://lists.openembedded.org/g/openembedde=
d-core/message/191254
> Mute This Topic: https://lists.openembedded.org/mt/98039591/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

