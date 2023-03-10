Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB29C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 10:15:38 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.15865.1678443329126624968
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 02:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kJsHCnfK;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id g17so5962733lfv.4
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 02:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678443327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3oDRjCmMwaOslBf9fTot5kcddKwzkOLHm5Qdjrn/QMU=;
        b=kJsHCnfK6XmqhavOHkgFQXfgIN/5mt9uYXgWzO+0VfmJsXTTqzqFu783Xn+Wngkix+
         eup6vy1BBcHVriHslpU+c9kfKnKvhB1qZUpWuNhCjYXKJ0+PeKqKggk858kr0qGIpvtK
         n0a/8bzv8ttko8PUej1mYqJ2vENUm6AJR52atEvJEE8Q9zhV+W8LxtFIVMkih+pfxMBx
         XX6Y5AEVYfcIPdOfLuEddNdbX2Z7FNcb6P/W9vtxe5XWH0eysi4i/ArxUNR+9w3g0vc3
         la/v+c0Sqp+WB0J5UrHWP0B5klNTWcTrsyBVRh23kCP51Te5Csg/swxuNmDzrFFD3gFI
         MtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678443327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oDRjCmMwaOslBf9fTot5kcddKwzkOLHm5Qdjrn/QMU=;
        b=58ZluKIy6H9rSuZt36Nn7Jc2UQn9E7zZqYBLJb7UB45VhtpT7eqkLZpOr3oQ0T4qdt
         CTlSN5bYIj0vjPZLIiEGAOFA9gil9dikHU6rwe4HEsLW+Q3cGwNyootz6Hf1khvJ9XEj
         YhA0DntQ97e/wfgGA+zl4G/WtRjfhRLrEqJoW8MBYpF12S+3iaumakzOQNXDfZPXZDjd
         gS9jGOLbpUsUdWL1nVt5mlGuxk5jBtMSFGIQYurasFoeCxsHxD3YB2L8cDJQgYLfVjgW
         JT4lWizvPTHac//jZrHuvDKMV9x1wFxTkSjsA3iYLflTjYcRzj8VRPyNcat+toxpgDC6
         01UQ==
X-Gm-Message-State: AO0yUKUp5zksRI5k2jKlYd9iPmD6ha20ieqOKEibtJZyhzU+QAcnW9kD
	Io9uljpcA75FmBDeRvczwjBU3zaF/pfI58gHJKs=
X-Google-Smtp-Source: AK7set+F5Vb67ZUFTgU4Q3dsynxnkAQAEluy3AEP1XEVu3VMScur/9LVn7qUKPeXJSJdkX4C9pOyqzD7oTkyuEoj6lI=
X-Received: by 2002:ac2:46db:0:b0:4e1:d025:789e with SMTP id
 p27-20020ac246db000000b004e1d025789emr8015474lfo.13.1678443327289; Fri, 10
 Mar 2023 02:15:27 -0800 (PST)
MIME-Version: 1.0
References: <174B040A85AB843D.27660@lists.openembedded.org> <20230310095419.3487056-1-zboszor@gmail.com>
In-Reply-To: <20230310095419.3487056-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Mar 2023 11:15:16 +0100
Message-ID: <CANNYZj8S7WnPM265Z39fi-wjqK_1r6XJK87DAfkTumesj8qGMw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] Add new python modules for building others
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178325

It would be good to actually test that these new recipes work
properly; if they don't have consumers in oe-core, then such tests
will not occur. Maybe meta-oe is a better place for now?

Alex

On Fri, 10 Mar 2023 at 10:54, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
>
> Some python modules use "import skbuild", "import cmake" or
> "import ninja" during their builds.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178315): https://lists.openembedded.org/g/openembedded-core/message/178315
> Mute This Topic: https://lists.openembedded.org/mt/97516343/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

