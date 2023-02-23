Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376B5C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 20:10:54 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.10.1677183049994847010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 12:10:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bC8u6U+j;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id by8so7101637ljb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 12:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677183048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LReVrzxhoGTexQjnUZW1mZzVbBQPmR8iU8rIGWn/tXk=;
        b=bC8u6U+jABtcq8W5AXBd8aZCOvIQa7YF7Vy4RBtnrLaHVQGIp0wzNmusrAw1Zu00q5
         UVX1RFHp+cLo6CS9kOHiWS86u7zieLH40PYhWTEJ+K/v4LKXiFOVaDESKJFx12RZf38x
         tIOMMpslsMztUb9zVYz1dws+5+C0urBWR4sKSNuCXOPaDNH+ps5maJ3C7ujVZys7wyOw
         BN4EPXO97xNabUFhBQnY/GMzUux2ymodTXsNkdys03rDkl4LvOIEJfadVePou66mLoaY
         kzeSZX9Yg1RLdMtZJHtNFq0ebWeY7OsJxximp8Wf3oCAzStPWboiuw22EaUF59FO5lY2
         6p8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677183048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LReVrzxhoGTexQjnUZW1mZzVbBQPmR8iU8rIGWn/tXk=;
        b=Kpd52yahpHs8ypk8Yld+PhQbLK1ZrZxuPWkviIEhSm8o+HaY7ZlRolva4Iep+6B0YR
         h4v0dTKZG6hSRYLthvbHeGcHDWLJ/bcXxZYIm4HJU9FIBdlPSCy27GKVBFz59uWwETBq
         4EPQNjdyBzu+/uk9u/+JEmRzACgbKHmdp9knDKORxJ387GWXKAaQbaVZNaWCRDMHXuNZ
         rzIKeiIXAJT5PskNuXe7o7cRCni8KOxk6hWKVqFixudHTdcO3sK/VAsqAmzdUuBCaTRH
         7An+BQBmaTMoLLdGSDxNnBtuPSxz/gKXfHLAuqEqakugHpR6D2xJZBsycNPwb4Y03MEy
         LP9A==
X-Gm-Message-State: AO0yUKWXkFClPD/ugDZtJ3HU8XAHx77hd0xdj+RtyQ5VreLAUdxjMB4r
	WkrAie6S0w3IFTUTsQ5jxvPhO4R09+HeeDx1VP8=
X-Google-Smtp-Source: AK7set8HT47ZX8ZZJYE/+e61cs/mVDMuPUM80ZNaqKLFMWiL8+ZkahXaZtrw7/zFnHp7Rlti/JgDIeY2ZyRuR/3ytH8=
X-Received: by 2002:a2e:b812:0:b0:295:8918:9d52 with SMTP id
 u18-20020a2eb812000000b0029589189d52mr3251016ljo.5.1677183048106; Thu, 23 Feb
 2023 12:10:48 -0800 (PST)
MIME-Version: 1.0
References: <20230223191937.1215699-1-f_l_k@t-online.de> <CANNYZj96mFc9LN_R-Mn+6tzrNwW1TKr14bf6+1PaModzF+8gWA@mail.gmail.com>
 <HFUJQR.91EYCKKAYQ3R3@t-online.de>
In-Reply-To: <HFUJQR.91EYCKKAYQ3R3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Feb 2023 21:10:36 +0100
Message-ID: <CANNYZj8bg9srORG8rcOfqsmy420ZfFmSKAaZtJ7_D5eTibddDA@mail.gmail.com>
Subject: Re: [oe-core][PATCHv4] vte: update 0.70.2 -> 0.70.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 20:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177627

On Thu, 23 Feb 2023 at 21:04, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Do, 23. Feb 2023 um 20:46:03 +0100 schrieb Alexander Kanavin <alex.kanavin@gmail.com>:
>
> Why does gtk4 need to be removed as well in this case?
>
>
> Because gtk4 is not allowed to build for nativesdk yet, only for native. I've tested that it'll work, if 'nativesdk' is added to BBCLASSEXTEND for gtk4, xkeyboard-config and libxkbcommon

Then that would be the correct fix.

Alex

