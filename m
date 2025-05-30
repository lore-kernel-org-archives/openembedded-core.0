Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3661BC5B552
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 11:19:55 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.4052.1748603988770404008
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 04:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXSixP7E;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-73044329768so1501720a34.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748603988; x=1749208788; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=icSeNUt3Pvjq4zMwu3HhvyRA9sCMAGodHvgrqxcqUSU=;
        b=BXSixP7ENPQYCc0xzPL6DkClof+xaK4uP0p7yggrlF2Cb1TXtB26cfMRM6viz/me2S
         Tinkoal6037+b9xOJ8r3Vr1nKDKI9mMGKOmtw8MUjagOpGYJFRx9wI9KpRl3M+tox8SF
         i07JNRcYMkVnI+nkOp9SLdTIKdA9WthQTXDKMIeaGCVAw19rlqe2exlURuaOtV0sLDEL
         Ag0G/ZLgw2QRdvZ3PwKWz25ch1v66ljGVedR64n+njTD+oXyYZAIVWQsWez78S6EVO/A
         po9aMgcnO4+VXwZWk1zMgQXGo0rfYM3EjQKc/9pLEOffqXJAhTFCKjxLqEoZ/4TCASII
         NWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603988; x=1749208788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icSeNUt3Pvjq4zMwu3HhvyRA9sCMAGodHvgrqxcqUSU=;
        b=R2CSubFKScYtTKw14MrBF1rHcnHKXkeq0dKHy6DqrS5x/DduY89jJwY5vSvJ4Xtvs7
         kgrMjlnl5fOm4Zdvg0YkopQJ+5xOjvvw4IHBY5QYNELftShLPmoir9PgEgOWgcZpw7gd
         03vCrstT36CMJsGrCb2dqha1qg7SKJYJ9KUp1RXpGA0mOY8FXodYNFL0CAaVlTk4wQXi
         sivVKjFCIr5pZpQKZt82s66iLiFrPBbY66gumE6u3BPScJoTDaXlWHwKOYvmObTl9Xf7
         g06VkndPZe2kKxYKSLPc9UOIClJYFnJYrNTXxXRwrQwcmDpn96zYLV8OYg65WUt/ztEA
         JHQQ==
X-Gm-Message-State: AOJu0Yzx/H3/YdHVJz05Ldu47U3I84mYuvO5QL8rKSqDKRHUrTyc5RXz
	chFwui2kh27z9J0C+vZmSfbkwdL722wUknZVfyJ5Z3zIaAJwl8dUoLc7sKQazHuMoerdcAko9UR
	vu9l2UA0E2lfGn/1TBKI7PHCLB+mlHIlSCQ==
X-Gm-Gg: ASbGncuP+fjwaCU7g6JimP1Ox7gPzrgua9Fd3ygMVOoTqEgIJZRNu9XiDkI4MonUWYy
	pX7+uz9Jp5ZSoIUdXlO6YhxaBW+/qxCb30APd91YQuF23U6scFIPAXVKOfpasn91tTicj3fXtX6
	Uxej2dBKBT0qvzHCVAYeV0SpIOi8m7m60MhTT22v+70A==
X-Google-Smtp-Source: AGHT+IFbHppw5hekepy+BknhEtF/XFwmVYYHfcg3AvOLTAzeT37v6ObXjDj6/KQhdMsbib1OkxHdEtUprmyH8NlF+2k=
X-Received: by 2002:a05:6214:d43:b0:6fa:c41e:cc6c with SMTP id
 6a1803df08f44-6faceb8cb3amr50375326d6.15.1748603976907; Fri, 30 May 2025
 04:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250528035625.1262266-1-patrick@stwcx.xyz> <CANNYZj_5Wbvx0p54pqvnpHuOAX+nhpQenZKzn1YEduDs=tf2ag@mail.gmail.com>
 <aDdoTVtCmElpURYD@heinlein>
In-Reply-To: <aDdoTVtCmElpURYD@heinlein>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 May 2025 13:19:25 +0200
X-Gm-Features: AX0GCFtIyQC6QZNbgOozx0CMn81uUwmg54gdgJfEEAa-SKyG-f4O3HSg32xK52c
Message-ID: <CANNYZj90G4sbA7LY06DjmqXnnU9UQ=vMKD22XzcRHbvDu87m4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd.bbclass: fix postinst for real systemd-systemctl-native
To: Patrick Williams <patrick@stwcx.xyz>
Cc: openembedded-core@lists.openembedded.org, 
	Martin Siegumfeldt <mns@gomspace.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 11:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217491

On Wed, 28 May 2025 at 21:47, Patrick Williams <patrick@stwcx.xyz> wrote:

> Walnascar is currently broken for template services and so is master.
> My suggestion would be:
>
>    - Revert 7a580800db39 in walnascar.
>    - Improve systemd_create_presets to handle template services in master.
>    - [Maybe] fix all the services failing per Mathieu on master.
>    - [Maybe] apply this change so that `systemd_postinst` runs
>              as it use to.

Thanks, I appreciate you digging into the issue.

That said, the plan to fix it needs to be reordered. We have a strict
policy of fixing issues in master first, for good reason. Also,
backporting the fixes to stable branches is much easier to get
accepted than major reverts like that.

Also, if something currently quietly fails in poky-altcfg (it wasn't
entirely clear from your analysis), then the fix shouldn't just
address the issue, it should also make any possible fail a loud and
hard one. So it doesn't quietly regress again.

Alex

