Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9132C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 18:58:19 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.159197.1669748291414657823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 10:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UVNV8MYB;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id bn5so18364488ljb.2;
        Tue, 29 Nov 2022 10:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UYO33c/7xkV+dqprY/Rm1LITIVeoy4SesHSHqtwCvr8=;
        b=UVNV8MYBxv5Oj3HvlbWCJRskNACBFRqU6Vc8P4Ag+6nc2zXnnos6yCAmJyhWxoS763
         VtcA08vrWumbnx6w3gIuvrs6DvdwMgkkGlqWjdcRJ+vJFLf1i0Voaeva1G4M3CJBrb4+
         7mzSnQp21IxOVjtB7lA1Jtem+iXn74geeKO5NCqmt3M0MLkpiaG3mPFQIhlP04iuKm+O
         MBjfLfJYTr8INUiGfULDVrQ1yrfDocllr6pNQfi0V7bV4nd63YGypH0jUTTQUZmj8WqA
         3JSpATVbWU8dMEzjbWokg7E4mi5CrDiXVj/vejpnuAlPF2+/KkdbXeyY5jR/SMK6CYns
         TTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYO33c/7xkV+dqprY/Rm1LITIVeoy4SesHSHqtwCvr8=;
        b=dvNm3Zm51hCRWbFhWqZOLyBlSCCt4HHHEUvUoFMVlQ+5WSBCxQG0pKvHrqufXlkBDM
         +tLevGA94YprPykU0cESO8lUkXDc3/uvrhxYanzVTtmCeOKEmShUrWTtcdUa9G/OiBpl
         +oqrJZzwRwIoG4hE441fz898fYbLdhPlYMW9wkEoroVwI/X3SKCTs7IDIw1BPNPAgwBH
         nZx3zGV7hSHUVOzeQvs/wXdLCSu4oaP/LeECFH7LwyBlNJwfPyd7C/Z6rKVt8X3Aphgj
         JYEw4X2F0OEJqNeYtJeft7OmimTk42DFU+rHNrCM6EeA8KONTJIFQRByQbPWxmI6vKo7
         SACg==
X-Gm-Message-State: ANoB5pnKswATtjqTlQfC7DwJ+G3COqcalYavcIbf8Ebmm8EY+yTj6cDw
	kpwLeCgAebQeqdXiNN+CzeFlbDPzqzLgYEWx2AU=
X-Google-Smtp-Source: AA0mqf5g4a90fstxlN+9gDP7LG/AxbLtOw0TL7D3QI4SussaGxIytvnAWBwWLbD+rhGQkbDybsbBVYIAfd6GRSM88sQ=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr18455883ljr.222.1669748289250; Tue, 29
 Nov 2022 10:58:09 -0800 (PST)
MIME-Version: 1.0
References: <20221129131520.GP22689@denix.org>
In-Reply-To: <20221129131520.GP22689@denix.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 29 Nov 2022 19:57:57 +0100
Message-ID: <CANNYZj__wodtcJzx3q7JTh15r9oF8RfSU_2XpgZ6aRvXVcTmvQ@mail.gmail.com>
Subject: Re: [OE-core] OpenEmbedded Happy Hour November 30
To: Denys Dmytriyenko <denis@denix.org>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	Yocto Project <yocto@lists.yoctoproject.org>, openembedded-members@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 18:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173987

Isn't that clashing with YPS social slot?
https://summit.yoctoproject.org/yocto-project-summit-2022-11/talk/UBXLG8/

Alex

On Tue, 29 Nov 2022 at 14:15, Denys Dmytriyenko <denis@denix.org> wrote:
>
> All,
>
> This month OpenEmbedded Happy Hour coincides with the Yocto Project Summit
> and will be held on Wednesday, November 30 after the sessions are over,
> aroud 1800/6pm UTC (1pm ET / 10am PT). The usual Zoom link is in the Wiki:
>
> https://www.openembedded.org/wiki/Calendar
> https://www.openembedded.org/wiki/Happy_Hours
>
> --
> Regards,
> Denys Dmytriyenko <denis@denix.org>
> PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173966): https://lists.openembedded.org/g/openembedded-core/message/173966
> Mute This Topic: https://lists.openembedded.org/mt/95333631/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

