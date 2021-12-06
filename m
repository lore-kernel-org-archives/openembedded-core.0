Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E632FC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 10:25:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.49824.1638786349397281619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 02:25:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=CZn9MqCl;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id i12so7708777wmq.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 02:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=14KhmoIEK4FmazzXNyAHiUFyc8TbsPQsPGW1FwBevgA=;
        b=CZn9MqClDzg2+oc7sGiQICgfI6RBL97/san9hkp5VqjeKKoKq4d1k/Lsu2E7p2Lbbi
         oHQD7eXLuEzVExutCzWU1i6GpKTTPhj/Q6q6+dFyAIpwTok2pFailjA4DhKYrqMi0Ltj
         1cRPiAsmuMcpoHEiNU6bcT1LHoTnncyKA6C1SPGM7wbCC3Q7kdJTnRaPIDUMEYNncncn
         mx12SHLw+EGcEKwtAK9A+5cgicDZyJSPVoQ1KWAOAqwvKb+eeKjEA3O1PeVcvKEZoKG9
         DoqYDknfq8TZ0MVu+jbMrAYtuafrZspb0JpqPNZSEENE2Chu7AepuvCwrKRFWDzr0w+I
         qiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=14KhmoIEK4FmazzXNyAHiUFyc8TbsPQsPGW1FwBevgA=;
        b=XVKyknFf70BHxLQq/M0NIyCj1T8UYWErU6xuodTF/ki/mZdwQy+/GPYrVnk6xB6wub
         ++ZvlAJu25kabNZN4LJXtoSbaUojeU5WmudoVUoyvHqvgjssbZ521Q8c2cchPyS+Sje6
         cIkK616BdltNs09omj+ZVsoI+4+pzJcM4QFig3J99x+S6U8X9iCjp9MYxa2VkJbMiwEV
         Pk/ykOP5PkFR96klkJLjN9w/678gwsw5dQSPD/4z5OGp3aJHsZRtfKJ7cpp1EkL0/5JW
         q8VX0R0B1dV4PclYSM/W995ijiMdHeUilo/rr5l1morsoZ+HxtSCoseC6gbyu4FLf+Ox
         CjaA==
X-Gm-Message-State: AOAM530X5YDR5z5/bTYGTpPbL/SkpApbius+n4O7r/mHC3sBU9WTnAyJ
	HKM/h3VWAiqYe4Bm63oWQ5POs60+iScXXxGArSHLtA==
X-Google-Smtp-Source: 
 ABdhPJyPdmrW6Nyw0reTUVL7OVxyFVeC2dked5jqVqJO6rkSMvBgcG1D1ltJ3TL0s2pAfk82zTLnsCXrGL90xV3TT7g=
X-Received: by 2002:a05:600c:350a:: with SMTP id
 h10mr22613303wmq.62.1638786347829;
 Mon, 06 Dec 2021 02:25:47 -0800 (PST)
MIME-Version: 1.0
References: <20211204071323.2480163-1-alex@linutronix.de>
 <20211204071323.2480163-26-alex@linutronix.de>
In-Reply-To: <20211204071323.2480163-26-alex@linutronix.de>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 6 Dec 2021 10:25:37 +0000
Message-ID: 
 <CAAnfSTu4iCqOneHeDgTKvG5ao+rOnxV5EWXN6pfFaRVRhPv_3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/26] serf: mark patches as inappropriate for
 upstream submission
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 10:25:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159215

On Sat, 4 Dec 2021 at 07:13, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [last release in 2015, last commit in 2019]

If someone picked up Serf maintainership tomorrow, would these patches
be suitable upstream?  If so, then they're not Inappropriate.

Ross

