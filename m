Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36709D2A543
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 19:30:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.31904.1729107015881141440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 12:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H1qVrcCe;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f72c913aso209058e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729107014; x=1729711814; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jjg+ZDgd+8F9EB41MJX36hr+d9rtF6+I0QFMKAGsG8s=;
        b=H1qVrcCeO7E32bsw13TxVDnOxVrtijdmMpYlxJ5q9Hfocppq4gRc4rYZRL6qpKjU6u
         tVYrfGJ/H7tC0FXqPuYvl62DGUhA/zR8x7GBdFnt2fPLz/IsVVnp6otIMY/fqMOAJJkk
         Kbohn0e1Z78vAmOgnPPgz5Mpu1oxgh2gNnQXfTtissgWjd7rv5IiRVVaIhmrDXHawHOu
         P42qLA2gfSDaiUjooxW9ig3K3kBXyDoB3JucdymTVpVKsGYSttV87vSMrti4tKpiXUZD
         1TD3DGdZrjGXn9w+NZ/tTf+8LbgIx5Uvr3plFKdjT/iJ9vfFvEH6D2BuUGioTPzLO75Q
         Dh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729107014; x=1729711814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jjg+ZDgd+8F9EB41MJX36hr+d9rtF6+I0QFMKAGsG8s=;
        b=mOFFPKXtpvodO/TUs3hbf/9KhXBmClZysId/+1Gb8HyFLBT3sYA7aI3AftR/HsRcoo
         yb2lOgy2Rjn/v+i9fyQtbpYBXGiC30b/KokPB/9yinBDDYQGqEh3bUEvEl/bCd+rb8nH
         IUOSsfC64Jyw8iBlR/eLCTDCK2g/teHYGfXSdWs2fBqrhLPNkLp8l/iEFLLyV1RPkH3L
         K0TlQtfOPFSZYC/urzQEOEcnJKpGiP2M4mvzM+UC9KE/4APxu7AfXYZQ7dLO6I/KXYGv
         8l2nmEGFdZ5ubuIf2a0v/Cy5QwENzq3PyBLRooJgTsfb8xvdlMFlc3YH+4m/o1EMu8TI
         wUnQ==
X-Gm-Message-State: AOJu0YzbUIO96dC7TNvwo1dUdyLo/3y/Y2cFXvI3qrTFqmzkeLEy5/iG
	5T80nOLTvxlBpV2CG/kB1C8iYE8Ts9lz/HtKlPw0qmEx2/JpOqRDCKkELCejS2QgQe0e0hZEZso
	eAQtY5ko3Ni/yUW3QsSQFBzhZoXI=
X-Google-Smtp-Source: AGHT+IFFC+wOB8L7jgQ0U7Kt6clm1P0Fuec6n7UvwaWuEwFanqDq+EIMjr+5jLFdtBV27OS7xVxRrIpYC35MqPGW/eI=
X-Received: by 2002:a05:6512:10c4:b0:533:3fc8:43ee with SMTP id
 2adb3069b0e04-53a03f1992bmr3454508e87.13.1729107013762; Wed, 16 Oct 2024
 12:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241016171652.5138-1-mail2szahir@gmail.com>
In-Reply-To: <20241016171652.5138-1-mail2szahir@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 16 Oct 2024 21:30:01 +0200
Message-ID: <CANNYZj-CChgtdb=ZjBM6Z_gM_thwtZV3YNf3xgeL93ziJL8rEw@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: enabling ptest for alsa-lib component
To: mail2szahir@gmail.com
Cc: openembedded-core@lists.openembedded.org, zahir.basha@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 19:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205971

On Wed, 16 Oct 2024 at 19:17, aszh07 via lists.openembedded.org
<mail2szahir=gmail.com@lists.openembedded.org> wrote:
> +    for f in control client_event_filter namehint
> +    do
> +        install -m 0755 "${B}/test/.libs/$f" "${D}${PTEST_PATH}";
> +    done
> +
> +    for f in config midi_event
> +    do
> +        install -m 0755 "${B}/test/lsb/.libs/$f" "${D}${PTEST_PATH}";
> +    done

Can these be wildcards, or maybe the output of the find command?
Hardcoded lists like these are prone to become outdated and incomplete
on version upgrades.

> +for t in config control midi_event client_event_filter client_event_filter
> +do
> +    if "./$t" > "alsa-lib_$t.log" 2>&1

Here you can simply use a wildcard as nothing else is installed. Again
avoids the use of hardcoded lists.

Alex

