Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A68CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 14:33:22 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.13338.1697121197911625711
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 07:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mD0FxxsO;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso1962273a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697121196; x=1697725996; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2CpRFC6H3HQYjKIjFiTS5LI0uZEhfAzBPXPqILU51k=;
        b=mD0FxxsOa4UnS/S2Zg/W/5+BREWkEdF7z0PtQ3K+Kx6zB1UzB7aRL2r5IBunwAnpsC
         DQ2r9jkFU3Gd/DqyVFuSnbiZWpFDP8Pw1Fv7esF7/wghrAeyNycInmp7T3Fr1H6cFess
         msGGwnENnDiGOWRpp6V7WeNOn4GxUlEq+ELKcRd8uw4G/GXNZDR+unn+3riORUKJcQ70
         QcnqNxPThCLNib7/yZOJrnpo2L+D/TxlhymxOtWnWtYdcAzjMwV8UkQgLeQukclhIwQ2
         TCHxinnc0vlu64oUEOLK4DckiyAODiC/GafAZFiW5+38ScBEhscKqyR5tkB8e59C2WQw
         0Qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697121196; x=1697725996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2CpRFC6H3HQYjKIjFiTS5LI0uZEhfAzBPXPqILU51k=;
        b=aQTnDRLNg5U++8b+iNpGpQAxzYyoCOxAsDDojPiiKmui4Kxbk0+qzmDUNPXHUX4MHT
         +iOzttiKsd1hS55Tfl+V5w+bE4SbsM2eCySKUWgaMKBNK3CaSE2z2o3/Ebd2OnevScre
         XSQiuCYhmglzby2WPGEt6h59XF3KhLZf+0dpDjlStDHLzxZa0f0slnlapUNAh02gJ09s
         jjqUZX4BYYoKVt2NBP/Uh2+ljOYaqmw9oHuQBPRmz9aBCvzp1isdOxbFQN57UskaFnL6
         fBPQlkjcT0jo96/c5vTQDdAeMc6jQyeR9MNMidT8iHatIba3/X0rpO6hUh4AsWN3W1rW
         wTMg==
X-Gm-Message-State: AOJu0YyTO9fxmfV1WoEH1NLnDYh7uImb2T42a5HBNwHWgJ/nL7AF5S4M
	s38W4q32Wob9BPiEyLy6z02uFzdDwZvmG+27AVig2A==
X-Google-Smtp-Source: AGHT+IErperQDOgdPQR7rc7KmvOrsYvWqF22jvyGlNz2M+q8x3Y5/iVs2Jx0MDt4KPUxxQlugJuPy69R5Zb9hKwlEWk=
X-Received: by 2002:a17:907:6c14:b0:9a5:cf6f:3efc with SMTP id
 rl20-20020a1709076c1400b009a5cf6f3efcmr16764180ejc.77.1697121195842; Thu, 12
 Oct 2023 07:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20679.1697091557461045335@lists.openembedded.org>
 <20679.1697091902505998029@lists.openembedded.org> <178D6163664B05A3.21112@lists.openembedded.org>
In-Reply-To: <178D6163664B05A3.21112@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 12 Oct 2023 04:33:05 -1000
Message-ID: <CAOSpxdbWYeAYLDOJPxDUEM-=cTBYxWyk=gGnLbo8kiawdJUV_Q@mail.gmail.com>
Subject: Re: [OE-core] [mickledore] glibc: stable 2.37 branch updates.
To: steve@sakoman.com
Cc: sundeep.kokkonda@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 14:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189002

On Thu, Oct 12, 2023 at 4:08=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Wed, Oct 11, 2023 at 8:25=E2=80=AFPM Sundeep KOKKONDA via
> lists.openembedded.org
> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > Yocto bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15231 rai=
sed for failures cases analysis.
>
> I assume that I should wait to take this patch until the analysis is done=
?

Sorry, I mistakenly thought this was a new patch!  Please disregard my
comment :-)

Steve

> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189000): https://lists.openembedded.org/g/openembedde=
d-core/message/189000
> Mute This Topic: https://lists.openembedded.org/mt/101774187/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

