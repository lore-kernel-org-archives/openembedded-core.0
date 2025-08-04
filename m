Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D37DC87FDA
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 05:52:02 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web11.11509.1754286713853851269
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Aug 2025 22:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lwjb6W1r;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e8fd59485d8so2365993276.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 22:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754286713; x=1754891513; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRJ4I3FmNNGDmhHln+nbKUb7P4ExspYWzCcEsjBzdRA=;
        b=Lwjb6W1rLxdhlrUZI9Aj3EmqfQK4jNpTkYiwnx/xh8mn50Z5Kr41/FPAkhmG7v+LWW
         5tTmQx97kEDGwp2PwCvFy3AaBXMu/EPcasn3XtpCig4e7cPrBbvEPGylet6A/4Op8DTF
         mxRAGg23QTXtztIT8iV/MqL/pwL4QPYmXqDURYw8CtCIXmvcyfAeYxYA2RD8YCse/Zp7
         aLk5BDj6JFHs30zMWp6eiuJ+RueNE5CGiEfirB7m5vIgUWgRS3JmhKFi2y0Ui+UTlvKK
         DNvXYTyl4K3sr2mYvcfYF4PiiIRP0YDZ3i3Rba4vaw1wMdV/Qk+LRSFMozMBTrOYhG0D
         wLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754286713; x=1754891513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRJ4I3FmNNGDmhHln+nbKUb7P4ExspYWzCcEsjBzdRA=;
        b=NSG7jIXWmiTlpgnEkOiqlXBgm7xSvYQ15+dCyXkjPeZHK1wzgLn3A2VyjbtsHXLSmN
         xzQUPfeBpDjw7ACmVk2Gf+2Hs5B5ea11kTVJi/ZDwAgtzDguRmoW60B63cr9FmXqvTEH
         TWTtUN1+rI269g/5ORMYBdQRD6BAGIcoGxMAJJMClvNETrXUmqdXh4OdFl0sdXSCenSP
         qye+75YBgFhANqwsT74SZ0YK1ovYim4dQkiUa8DNpWl9DATWNTTrcitzgtL8aqedda1e
         NWeGr1WmU2eg6RdNs38Kf9KfDzJoQP2vw4gfl/ek6Jg7mjwnwjXq5IR7+3m4i3XgpFd8
         2k1A==
X-Gm-Message-State: AOJu0YwhbNbcphx6MB1Ldwz9hy7fWC76n/Ogjf7ZTCYosJgtp6x+I1oh
	AuNUbbnFrWaIdHPPP2ZTiXN+jkLKIGt1WYXZTpuTDim4nxHjgYvFtN7jTngN9JJhQo2YxHotpHY
	6nzt1HZMVm5mIFJSze64nZe98DmOylMQ=
X-Gm-Gg: ASbGncufBPf01z4q18eYh/VA9ICvRmUz0FTSFPZyziE5VuwUc4FBjHSmxDjB+bJ0iC6
	YA4c2HLzy6kMfvU0BHsdjKYqtJos5HNJMnE3aCpG+omDfV7OBOZ1XjnLGdYtZPhF8g+FXPsz4iY
	nxXx52DLo5BvEjSyXwp807QZ2KwvMIH2rU5oO1DX/2yi80pxKNWe7Y/zQgGu+jN4hth966MzQdS
	p5khiMgmF8awQQ/n+6bTEz1NSfY6mZ1cGipKInZtGrxI+3svQ==
X-Google-Smtp-Source: AGHT+IFgFDsZAnH/HXdCtoNQ8f+KqiyOkVSTwMnsjK2nf4drbNqrZoRCyFJ6309EP4F/SkxoGyzCtTXHF9oMzRTChVs=
X-Received: by 2002:a05:690c:fc1:b0:71b:6ab5:1db3 with SMTP id
 00721157ae682-71b7ecea04dmr103429987b3.6.1754286712648; Sun, 03 Aug 2025
 22:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <8b79c84e-99df-4b5b-a43a-467dc65364bc@windriver.com>
In-Reply-To: <8b79c84e-99df-4b5b-a43a-467dc65364bc@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Aug 2025 22:51:26 -0700
X-Gm-Features: Ac12FXxUctR0JnUJdURh39hRps7dcf9tCHh0bJUE3iYQyuZLnXtN3SuAHThDtIs
Message-ID: <CAMKF1spU5YnX9qyG8yhs6yv+-EeczaKQy9KtkA2M+3hNVUtmXw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Clang_Testsuite_Integration_=E2=80=93_Initial_Progress?=
	=?UTF-8?Q?_and_Next_Steps?=
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Aug 2025 05:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221415

On Sun, Aug 3, 2025 at 9:53=E2=80=AFPM Sundeep KOKKONDA
<Sundeep.Kokkonda@windriver.com> wrote:
>
> Hello,
>
> We're currently working on integrating the Clang testsuite into the Yocto=
 Project. As a first step, we've implemented an oe-selftest for clang-nativ=
e (we understand this isn't the final goal).
>
> The changes are available here:
> =F0=9F=94=97 https://git.yoctoproject.org/poky-contrib/log/?h=3Dskokkonda=
/clang-native
>
> We are now working on enabling support for testing on target systems. Bas=
ed on our initial analysis:
>
> The lit framework used by Clang doesn't natively support SSH-based remote=
 execution, unlike DejaGnu which provides built-in support for remote testi=
ng. So, additional customization is required to enable remote test executio=
n.
>
> To enable remote testing, a lit.site.cfg file must be generated and confi=
gured with SSH access details and target-specific parameters.
>

This approach seems right to me. something like below might work for
ssh'ing into target and running tests.

ssh_cmd =3D f"ssh ..."
config.substitutions.append(('%run', ssh_cmd))


> Currently, QEMU is not launching after the build completes within oe-self=
test, which is a blocker we=E2=80=99re investigating.
>

like ssh case you should be able to run with
config.substitutions.append(('%run', launch_qemu))

> Once QEMU is successfully launched, we'll establish SSH connectivity and =
begin running tests on the target. This will help identify any missing runt=
ime dependencies or other causes of test failures.
>
>
> We welcome any suggestions or guidance from the community on this approac=
h.
>
>
> Thanks,
>
> Sundeep KOKKONDA.

