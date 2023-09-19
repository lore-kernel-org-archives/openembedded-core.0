Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B309CD54A9
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 08:36:20 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.3382.1695112572213716048
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 01:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTlusXt9;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7983b202929so204019939f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 01:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695112571; x=1695717371; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSjBukrnN326s1BM2nbhLe8LNN+5b+ImZtOUVuRLwO8=;
        b=fTlusXt9qO5Nob3GEQS0P0pwbcgqTJAWrrjts5FZG6hSFHm6T3oCtNHboLRDmQdVD/
         6L2OPbY85r4O0ZauNZS65v+IyL1zm3B1Xri4eYMsMEtgPxADyAhFc/5fLtWpNsdgj0MV
         FuUeiNLWRunBl55SI1inRHgEE+LPTQB4dhRtuIS7M/hOZokL3h6pF4Vdr1AB5kV9PFUh
         QJDUZKm7LucThAmuso1KR/Z7QB5Fj2gbhXFrKHTlCVwKFMvbl5INzOczY5zPM1Xz3lyj
         Tby3xCTpTqd46Z/sa68j6Ct8j2U4xGg3JC6TwBfZaOizSnLYdHZOOiYYrn05L8eVkSVX
         6ysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695112571; x=1695717371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSjBukrnN326s1BM2nbhLe8LNN+5b+ImZtOUVuRLwO8=;
        b=IiJgS40X77qYDfHwnQMT29m68BB+wzY1i1kZ80vCOZO+9dLfFi3aZ5GqSD44wFsR0O
         zIMYxyUSIp+Up+uJzQi1oW4vHETIKk4Z7IG2/9E84i8z6Z6wxkwjbUSpu5r5e84p+BNP
         L1/YmNAqM3ZiOb2PZzUCxHd/JelTgOIoDfNuf27Xweh0Rdlzi4/2tC/5svFRV/m6UcLR
         YRXdOnCDfme02ern0j+nXG+27qTf5NmMep7jM8+6stRtE5BVn7X0X0V/VJgyzlWm48uN
         QC4o0tBb/kEJEXTCl7IWJMJmChXyw2hc8Pgb25K0GCk4A5hVUfIJnOLBLaAEi8RxIwzK
         gG+w==
X-Gm-Message-State: AOJu0YwA7Lr/WWOYM4wDlBvW2KQMDl/Y5SeR0wA5SGOaQxaUaq2mMgiF
	eouTFmMpulvB46ck/mxuukb3yNptZQkrss1c+Fc=
X-Google-Smtp-Source: AGHT+IFLY4R0+y9u0wkhhwE1f8MXBBfDEG1rzJMh2Id+NScf9EG9689/2PJ8lfx+dhcEUq4DEhdQUdDbSHfogm+z+qc=
X-Received: by 2002:a6b:f30b:0:b0:790:fa58:69d2 with SMTP id
 m11-20020a6bf30b000000b00790fa5869d2mr12807124ioh.20.1695112571393; Tue, 19
 Sep 2023 01:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAO5Uq5TsXmkBsmBgyDJEaUszCncjuFbhjYWJUX_L1BBycyyxLA@mail.gmail.com>
 <31570.1695020078376931640@lists.openembedded.org>
In-Reply-To: <31570.1695020078376931640@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 19 Sep 2023 09:36:00 +0100
Message-ID: <CAO5Uq5Q5cZS9pd+mwxbPtz0KA3BxkMx=wQK2rhBqy7FNFnq3ow@mail.gmail.com>
Subject: Re: [OE-core] [openembedded/openembedded-core] openssh: Move
 sshdgenkeys.service to sshd.socket (af38a39)
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 08:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187851

Honestly I can't remember what systemd does for this... I don't run a
systemd world anywhere anymore.

On Mon, Sep 18, 2023 at 7:54=E2=80=AFAM Pawan Badganchi <badganchipv@gmail.=
com> wrote:
>
> by removing the dependency, restarting the sshd service or starting it ma=
nually will it generates keys?
>
>  recipes-core/openssh/files/sshd@.service
>  @@ -1,14 +1,12 @@
>  [Unit]
>  Description=3DOpenSSH Per-Connection Daemon
> - Wants=3Dsshdgenkeys.service
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187819): https://lists.openembedded.org/g/openembedde=
d-core/message/187819
> Mute This Topic: https://lists.openembedded.org/mt/101341184/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

