Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FF5C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 08:41:31 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.83514.1684140081400731582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 01:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VXRssLcz;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4effb818c37so14372548e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684140079; x=1686732079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HF1w+BflsnWPiYEGcyHTyX3r1tjxBqNvLAIsPEjFz4c=;
        b=VXRssLcz0YpDL7mXNSiqxrGPmnGV9uCObCeNFvBk+MDr5BkvAMGGL3j1xloIVMIUFb
         b9gsrJyjYoIT1ZnIlyPUkcIEmnNAlLG765qQooB/+FabnmItH05hxJ3SnPIj3PhKxpBO
         wPokVveQs62wDTe3K1mwfERzkvbRTBdNGYqL/8m2lksDbPw1D17p0OmgHST07GkU91d8
         rrsFv5ih0uSvHJHzRbiQ8jSYC9dR/QHOhv7VZc4HlHir75+ag1Nw0Jaazw0E8YoLW7Ac
         Qruo9jiIi76uoc/X/yB31GcKVFNYR3slfv83wQXgqXZSFUxI3QjKBN/byGCgYEZw2pBk
         xS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684140079; x=1686732079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HF1w+BflsnWPiYEGcyHTyX3r1tjxBqNvLAIsPEjFz4c=;
        b=k+4YVVm1iyeZn7sEYEts5fBc7ZR2P+fmDyqu95aX5xedGEGyBcX2NLdO+1StZVNaEd
         mZMDkbSwaODjiudyITOmmnXXOR0TCN0CjQe0NrfMOEf5cJOyaCuOxp9O+V3vNgujjiJV
         Uuf0Wi70HCRXxu0FrpYloJ49KxXPKU29+z4eFQ9utuM88gwFnllSzCSLWbm/xbLpOXdv
         T92InB97XMkppPp2r8cyUrw8O7QwC2COnCsET7zHZkSaBP7EDAkFUpd9nDwmva7JSbkH
         sNuAFPTaIqzOB5r4h2HCS58NIASCq4KiP/9V5jlqHlbQ/rL39/CFGI4IK7XDHNQm08VJ
         qBOA==
X-Gm-Message-State: AC+VfDz7AAwmD3ynJqb9dQ/vV1zAoCA7YXx+Rr9WIaPIOwege+4pNc3t
	/Oe0wCsYkde+pf6ZYNCnu2G9m3OGVkWgEFggXi+wxvC8
X-Google-Smtp-Source: ACHHUZ7D5n/rA7pnc6lXiA7S8nbWXQMN0ZamyZFxJv8ydiqbByTDF7AcBy37aFrVkPCwnMNpwb84+pgRcxrW+ZjpR48=
X-Received: by 2002:ac2:55a6:0:b0:4e9:59cd:416c with SMTP id
 y6-20020ac255a6000000b004e959cd416cmr5908750lfg.0.1684140079240; Mon, 15 May
 2023 01:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230514112915.DBC579603D3@nuc.router0800d9.com> <12aa7d8d-4207-46d1-e74e-58fb9942a701@bootlin.com>
In-Reply-To: <12aa7d8d-4207-46d1-e74e-58fb9942a701@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 May 2023 10:41:08 +0200
Message-ID: <CANNYZj8aKLbU9ixmYKtzZxQk3iOFe-i4KcXMNjgy6Z6Ye1upgQ@mail.gmail.com>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 14 May 2023 01:00:01 AM HST
To: michael.opdenacker@bootlin.com
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 08:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181234

On Mon, 15 May 2023 at 10:17, Michael Opdenacker via
lists.yoctoproject.org
<michael.opdenacker=bootlin.com@lists.yoctoproject.org> wrote:
> > New this week: 3 CVEs
> > CVE-2022-21227 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21227 *
> > CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
> > CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
>
>
> The number of vulnerabilities coming from vim week after week, year
> after year, is always striking to me. Could it be because of lower code
> quality compared to other projects of similar complexity? Could the
> situation be better if we supported neovim instead?

They have some kind of bounty program going.

nano please :) I tend to agree, there is no reason to carry
specifically vim as 'an editor for quick config file hacks on the
target'.

Alex

