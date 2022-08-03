Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AD7C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 09:08:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.6295.1659517695812260777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 02:08:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZlBd3wdq;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id u1so15238106lfq.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 02:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VU7+62+BLssVCfCatPK64EhFDASdNeT2oxEenbNcfWU=;
        b=ZlBd3wdqgF7YbpT1NorIqnhpvu58XJouf5/lEEUqMwDde/UGTMICgEdVWFtruInywv
         8WAfol4mXu67vs3yZAO71Qd95ENJ0JMm7M77U3v85fS0ygfToclfUXToYDAD9VrlBRIS
         eFZIrnH9mnSDNLIhV01JiW+2+h+/HEZ2r/OkwL3dtKmR8FndyStxvMM8yyKBKb3Y6dFu
         hK9o2KhweWgByQESCmq0n0yW0XfrBazGomIyx9h3OTEwnsqTGf6OtxPiTzT3BQyd6ccT
         qSC7S6kKKDW7vTpwqkojLxanaDwlamXL98G+zXyPl559/OWFscU4b+fbnh6a1tG7cfb4
         GQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VU7+62+BLssVCfCatPK64EhFDASdNeT2oxEenbNcfWU=;
        b=XOTE2E/YQFVFcIiC9R7OSpZ/PQLM2PJ3Rn7Hh+3Qq9P8EAqRsyLx7RYDyCK/l6Hdgt
         qcJFRm9RpNioUTkKN9+vWUY85q1wx+8PNJXJ7Wl0ur253Tq69SsVo/+i64ljSzYUM6q/
         QsSfjFIyH0HsDjvUsXDrmW/BCfNvVammrUoyP5jCRjsmb3cYaAmO69ew43jlJY0bkCJx
         ZFIA9d5x5+S9g1Su8AVJ1q2r1ymcEiPYZkgur947tnMq6yh7/So8XzzrfuRzjvARyJrb
         71tTOBVbnmHZOnufVfCo4+HciANlousgCUukZs3oZdpBfksoJovrH8NKuG8JRSpcwcix
         Nvdw==
X-Gm-Message-State: ACgBeo2iucB15cQQvZs6l5Kr/3VW0MD0FdsGqlYw5mEaADy1B0+o7dG9
	0acTt1XIbFQIUaJ84MWEAFOvKZk3cKxRmZyC9p0=
X-Google-Smtp-Source: 
 AA6agR4D2Np4ySMdA7DQeNptTNzC/NPag0LITJtlxhSJFyXHO41yu/CRslYbjtAO3E3ajmOwvNc/A/1rDulAjrONRlM=
X-Received: by 2002:ac2:47f1:0:b0:48a:ea6e:b8fd with SMTP id
 b17-20020ac247f1000000b0048aea6eb8fdmr6474941lfp.26.1659517693929; Wed, 03
 Aug 2022 02:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <1659516246-31185-1-git-send-email-wangmy@fujitsu.com>
 <1659516246-31185-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1659516246-31185-2-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Aug 2022 11:08:02 +0200
Message-ID: 
 <CANNYZj97A-ZRD3EjejTvAwiCDii880O1XMjiNsHj2pME=Ky2LA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-pip: upgrade 22.1.2 -> 22.2.1
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 09:08:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168812

On Wed, 3 Aug 2022 at 10:44, wangmy <wangmy@fujitsu.com> wrote:
> -SRC_URI += "file://0001-change-shebang-to-python3.patch"

The patch file needs to be deleted as well, and explanation in commit
message added.

Alex

