Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B87C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 09:19:52 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.54611.1686561581610518449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 02:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=n56gVirc;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2b219ed9915so46003431fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 02:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686561580; x=1689153580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cp0oSBw8YNb/DmItEfYUR6ppI784nmVDvoxhKFoUDHU=;
        b=n56gVircJiEaiHqxlkslrfI4dqzbkvxOcbCyPh0/cx4UQPkQRKgA1j7o6zSEv+TdcE
         WkgkHKbUZup1cHJcE9GJq0m94cdGhQV+zBXsDW22sie4La8jpUViPGcj3LwzzJWItQw6
         OUlv/46Pv5B8JR/jQHvQNU92OmUEO2eEpvlG4aCC2AYSd9d63MgI4mc7Eos7Gekp2T4K
         L8ihzq5PcpPMPiEfLWXEbWBXvPofMSskERXslcQ44epvMXnAz6KHHq6ekFzaqetirBjh
         ClvgZWn4QG4rytCcugDzDg4aR4n6NB0x90NoAN1y9gkt15GjIscZq4GYBjzsXfCdRgjy
         P0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561580; x=1689153580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cp0oSBw8YNb/DmItEfYUR6ppI784nmVDvoxhKFoUDHU=;
        b=T6zdhfCXoGIpNfdoo2UhOKVIKIUtP7pxa7yfi1q4aoVyneB8mKHVYQuvrkxJ6SSKPW
         g8XPIdRjXnb7Yqh6cLffOZOM/YhtvMiptJsqkzJ9oCNI4ZH70ZGsCQJUv88aSVpdrTJw
         xIl6JKN7h87G35GbQKtCPT0ZzHWG5FAdS8wk6gZxWgHO0GXFe1YFY8pzSFqqD8rd0VK3
         PsP7gGLZfkNY6kJhToHRhI3tYAQntxCtxlhezNvzzj8pjPgleqG9iLlDvbT0ESnzAZQo
         74nH69e5MNZBZ9Km2LRoqoLqdovquhKpVKrI1jhNmscVFtNkjlP01RUSlhffD3++dLDv
         B/nQ==
X-Gm-Message-State: AC+VfDxNEY1w4/ZEGESQQxcMAORG4EdOcZ/VDUjZW0V8pgLd26Mv1YnG
	h2qL1ivQhmOM44VYsfl3xcT6Eup4nv+jXwY9YBY=
X-Google-Smtp-Source: ACHHUZ4M67VwaAULzIubZHOuKb88sd47/8iAsTimoPgp7CDWbr+zArD4B6/TE5NsqXlAsyLfBsN+PMNJ0Vbgg85gwFw=
X-Received: by 2002:a05:651c:158:b0:2b2:3a4:4ebe with SMTP id
 c24-20020a05651c015800b002b203a44ebemr2233130ljd.48.1686561579465; Mon, 12
 Jun 2023 02:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230610011339.3716428-1-rs@ti.com> <20230610011339.3716428-5-rs@ti.com>
 <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB102136F50D6C9E9121C9FD08FEF57A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Jun 2023 11:19:27 +0200
Message-ID: <CANNYZj99QKDuDc7oPaytFOUAeaiSL9y6WMT2Dmo5nLUTNNOLKQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/6] weston-init: fix the mixed indentation
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "rs@ti.com" <rs@ti.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, "reatmon@ti.com" <reatmon@ti.com>, 
	"denis@denix.org" <denis@denix.org>, 
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 09:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182657

On Sun, 11 Jun 2023 at 23:25, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> > I know my text editor is going to get angry at me if this continues.
>
> Get a better editor. ;) At least for Emacs there is a bitbake-mode that
> supports the different ways of indenting shell and Python code in the
> same recipe.

Or we can stop caring about indentation, as long as it's consistent
with what is already there, and doesn't get in the way of reviewing
patches. That's my preferred option, and has been for the past 25
years.

Alex

