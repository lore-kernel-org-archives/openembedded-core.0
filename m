Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BA6C46467
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 11:08:46 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.35841.1669028924699752481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 03:08:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JW//HsxI;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id bp15so18255139lfb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXKPBhWN9Dx5rpKf5vTxVneNkdTKVSW29Rt7yoDpBw4=;
        b=JW//HsxIFjObk9OvpnR1+JTeTC9cVzFRZbmAQZJRWF6ZqQ9uXe+oHoU00Ehpp5yY3j
         DL/B9QpN5NIM5ZQG3RztpD5RfVd8jBYGeQtgV1L3dUPJWrO0MXaIhjv53iQYZRCWn6X8
         c2/G2BqONYVnlc3w0m64Bynl/DmqR7vst9tf0+zibzfJ5nVQCBSIGpyTkY4AEUsef8cA
         hkbMU4TWAObSaIqexSTfbjjWpKtbyFQ9CPEf+/QpCSdN7K+CGZ79V9bHqYol+tDLsbRp
         a70hlqGE+TULk27ZnTzwWpX11xlZZtNgUKVcIbbeyTZD+36oqGroqiJHs9PnT/0tjb1r
         t2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXKPBhWN9Dx5rpKf5vTxVneNkdTKVSW29Rt7yoDpBw4=;
        b=5YbeZA6hEB47sq5VrTKs3+ahlfRbg88AfIwlZnulc4vBje5rSRlUnooIHMyjV0oIKy
         p33SyXyRZ2ywEX6PSlfDF2qRVfhDVfR8LjutKOFxWh17hluv71WjOBtTWw3UFJyc0/Co
         Qh0BcI9OFee2uF7wXrRcSaxVkld8Lba0Y2NYunQ6K7/L3Jk5qsLHPrg1KY0e+iIZ0wqK
         nJpTS+2dTCd2s2VZtkST4k6ZKId/qS97gBpR2GTNAwt/ucUWNN+ZjA8OIwmWaBQ+iiYG
         pBJ9ruba5QsI1hX96sRJyop8EFCEE9fydGwAZYt+CW+7U3Cx3d72x5zETtvKaPU0gs19
         euLg==
X-Gm-Message-State: ANoB5pkBXpaq/NOYVnh1fx+xxCeNQkx3kWYDEiFHn+vAaVpPYTn30KZ0
	4kV1pVmleCDN5z0kaNJxlQLF21D/hOMn7G7iNVg=
X-Google-Smtp-Source: AA0mqf42OiCb/oDsvY/SVA8bSBvF0ISV7kslH+Dr0GfoST7DXj0/UbEvmm0lh6uqV3kYcuEfe0wX/YSvnPB697gnEK0=
X-Received: by 2002:ac2:53a8:0:b0:4b1:5125:2f14 with SMTP id
 j8-20020ac253a8000000b004b151252f14mr211334lfh.345.1669028922825; Mon, 21 Nov
 2022 03:08:42 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-YjKnAGcDzU6J9mkh9130L95+HgLt8ybs7iXfTp_cuNA@mail.gmail.com>
 <26677.1668994855182780181@lists.openembedded.org>
In-Reply-To: <26677.1668994855182780181@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Nov 2022 12:08:31 +0100
Message-ID: <CANNYZj_g16GDm-WcGW6pQjdhkJ0_49373e4DXEZwF5Szi1HHdw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe] [PATCH] rust-snapshot:add riscv64 toolchains
To: cp0613 <cp0613@linux.alibaba.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 11:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173648

Yes, but this needs to be of practical use, and not just an experiment
that you ran. I'd rather defer this until there is for example a
broadly available cloud resource where you can run bitbake and get
completion times similar to that of established architectures. Keep in
mind that someone has to update those checksums with each rust upgrade
for example. And test that things work and do not regress.

Alex

On Mon, 21 Nov 2022 at 02:40, cp0613 <cp0613@linux.alibaba.com> wrote:
>
> Yes, now bitbake is running on this board.
> The example TH1520 is 4cores, but Wujian 600 supports more cores.
> It does take a lot of time to run on this board now, and I don=E2=80=99t =
see the actual significance at the moment, but I think this is part of the =
riscv ecology and will play a role in the near future.
> Thanks.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173644): https://lists.openembedded.org/g/openembedde=
d-core/message/173644
> Mute This Topic: https://lists.openembedded.org/mt/95130600/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

