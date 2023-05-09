Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD75C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:09:23 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.38898.1683652159267418997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 10:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BN8Fa09m;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-54f846d251fso1128074eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 10:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683652158; x=1686244158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+z10B84RejRELXc1u3e/sW1VTrFzZj6LpliATd4eDQ=;
        b=BN8Fa09mPE8nzJE+ORtYU0P61yM9j32PzZs5T8t0bz311unSTYcoiAH7FXCFAgVgp0
         nxeTFun8OVssDWd5pLeHhoenkzhJDHiAmefxMp1SEG7YC4Ri72swZQ9T6v1lwg761GhQ
         eTTzV4bNEBxItmZ+VqrXHJnr0XjjKYHquvA2HGz9D5wockz8p/26umfYxqi9QDWP2Jtk
         2VGRZGRdAKNmCnHi+g/5gp3U0PGQ6hUK9FYvwKrmClbHUOg0rJgUdO4pVXWZdQppai2I
         AB3XzKWyZ0UcJOjJOttCZgkskeeVMFYmx8Yog/5Hyn6UNnBobZJ5oAUA2Mp5OTJARQRd
         X5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683652158; x=1686244158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+z10B84RejRELXc1u3e/sW1VTrFzZj6LpliATd4eDQ=;
        b=UkyVL5dIrvpSuWfGr03+mrEDwYTafJz5jq42oNNJ8et5Clbxa8HZyxG9Rvcwup2c0h
         ZfJdVJM+efTctzFc8kUXHjg38bYc8a7Ft4l3M8HnfoRiBdqJgQnLPU0ri1My9mdkiS2x
         73oYpm3yM3m5GvR6CDZ44u9KabBSG5dWfd0gFXTEyxIGGggvZ4EUFqk0bDgkvhsVaCfZ
         XZcFuwsIeUIsF99l69IuudhRpUJJSIql8MIDhNMn+i9jG5JD3ZNFoCqsE3+T4Mn3sz9x
         Gq7PkWGNzKQDwbSOzr/gscVdA0M3oq8Sd6e7mwXDE8Q+CVw8udPYHf0mFe3I5e+KYMHL
         AJ4A==
X-Gm-Message-State: AC+VfDxYShJ4Dh529stpha83YrZUR804LS8wfo4NSCBC21yslOQBM9yK
	EzjS0d2ZGT8FaOHJFQAv2oPmKEtcW0Y+4NYONNg=
X-Google-Smtp-Source: ACHHUZ5ZJmue1HDK8M7pn3vZvaS/cKnGJ4W7K98WtXNdPE7avqk0Qu9NKfCMunvquS79gsPBHEgxdrBjx/U7zSA/p2A=
X-Received: by 2002:a4a:3042:0:b0:541:f986:637f with SMTP id
 z2-20020a4a3042000000b00541f986637fmr1434628ooz.8.1683652158342; Tue, 09 May
 2023 10:09:18 -0700 (PDT)
MIME-Version: 1.0
References: <PR2PR09MB31000C5F306D2D3B69099E23A8769@PR2PR09MB3100.eurprd09.prod.outlook.com>
In-Reply-To: <PR2PR09MB31000C5F306D2D3B69099E23A8769@PR2PR09MB3100.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2023 10:08:52 -0700
Message-ID: <CAMKF1sqjb63ip3J1ms0-SCC2MqRLVJiozRCP4RYyKeu9AoSUXw@mail.gmail.com>
Subject: Re: [OE-core] python3-requests broken after urlib3 update
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <ticotimo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 17:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181054

Thanks, this was the reason why I was seeing regressions in
meta-python ptests for python3-requests-toolbelt, I have sent a patch
to upgrade python3-requests to 2.30 but that doesn't fix the problem
for
recipes which are not yet ported to use urllib 2.0 - see
https://urllib3.readthedocs.io/en/latest/v2-migration-guide.html, I am
not sure if we are ready to use this yet. So perhaps sticking to 1.x
might be good
for a while.

On Tue, May 9, 2023 at 9:03=E2=80=AFAM Konrad Weihmann <kweihmann@outlook.c=
om> wrote:
>
> FYI:
> https://git.yoctoproject.org/poky/commit/meta/recipes-devtools/python?h=
=3Dmaster-next&id=3D4641605c794db6648311b931fb3a36fe9e5dea56
> breaks building python3-requests (as of version 2.28.2 in master).
>
>  > recipe-sysroot-native/usr/bin/python3-native/python3', '-m', 'pip',
> '--disable-pip-version-check', 'wheel', '--no-deps', '-w',
> '/tmp/tmptsmcl2c1', '--quiet', 'urllib3<1.27,>=3D1.21.1' --> exit code 1
>
> Tried with native variants.
>
> An update to python3-requests 2.30.0 should fix the issue.
>
> But I'm not sure how that could have passed CI - so someone with more
> knowledge than me of the autobuilder might want to have a look.
>
> Regards
> Konrad
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181048): https://lists.openembedded.org/g/openembedde=
d-core/message/181048
> Mute This Topic: https://lists.openembedded.org/mt/98787186/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

