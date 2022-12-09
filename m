Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF851C4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 13:29:33 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.1024.1670592567600932079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 05:29:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LG0kpmL8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so3454369wms.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 05:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X5KmsuLt14RpduHDIgs5pYuWaAwTKei21tiVRpwk4HY=;
        b=LG0kpmL8P8v3QMOxONjm8soJ2WMb0iKBRqFfZmMNj6iTebDIEenpM1UKBlIOoble5T
         TC0Za/O1oQdArjtaWmNgrF+qo/Gi6d7fpZr+0nV+ESgTlEXEKgUpyReDM6bn2NjS/MO1
         lf8Y+pZwpXx6oZJc5XF0GClvR/iEU/Iuoe+x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X5KmsuLt14RpduHDIgs5pYuWaAwTKei21tiVRpwk4HY=;
        b=s7Ucuk1gJ+qBLQCG+46iIPQKQ/+RLPf0x8ut0rAqz7XuQHDVT5/zLpSaz3/5sE94SV
         tq8JQa5ZN9jD0rROxhAXVn1S9gooKoWM8Jw2Ctmqli7QaDjxixq4FNL081Xhytwawtr6
         BubQRf+o2bKub/vrYbh9SS/hULXN3xMwyYvyKXxzFlO5pXcyJOKdgOYvmO16YXaxzskT
         G4p3rBymZ65zEhDec5DO563csXlLInMYOU8Gq36yOpO1jx2NtWFn2kmU9Ft45WvhA9YQ
         cRRPLh3Qo8k4WqHEYUoUEmvzGuSLiFlSg/nVNrJNAs/MNYMHuT9HspV+yuL7dFA/ZhR2
         n5cw==
X-Gm-Message-State: ANoB5pnrD45hw3rTkRAzDMKi68CTU0q1HKNvABXefPZ4BMFKGI05yQmo
	xj7aNWhpghmXw2y9IP8vqOQ8Fg==
X-Google-Smtp-Source: AA0mqf4yU9shPQqF67F0dpM5aG3PFG19TSDsVpsLYmRypYtqBh3YPJelmk4sK2gGwIqXuO9w2HIVOw==
X-Received: by 2002:a05:600c:a54:b0:3cf:a41d:844b with SMTP id c20-20020a05600c0a5400b003cfa41d844bmr5107287wmq.5.1670592565979;
        Fri, 09 Dec 2022 05:29:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4? ([2001:8b0:aba:5f3c:9b77:8930:5aaa:e9c4])
        by smtp.gmail.com with ESMTPSA id m123-20020a1c2681000000b003b47ff307e1sm1768432wmm.31.2022.12.09.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 05:29:25 -0800 (PST)
Message-ID: <fd7d97aba72e232cf38bbdd92789c7355900dda1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 3/3] time64.conf: Include to enable 64 bit
 time flags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Cc: Ola x Nilsson <ola.x.nilsson@axis.com>, Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 09 Dec 2022 13:29:24 +0000
In-Reply-To: <CANNYZj8ND2kNUriNf7UrkJ38N5iGGLE2Nv9zOWszYoD-3wxk-A@mail.gmail.com>
References: <20221208071136.1967696-1-olani@axis.com>
	 <20221208071136.1967696-4-olani@axis.com>
	 <08c1f279-d446-bc7c-f01d-4ebfb1da51d8@gmail.com> <jwq5yekdg24.fsf@axis.com>
	 <Y5Mzg1VAbMREQ55k@mail.local>
	 <CANNYZj8ND2kNUriNf7UrkJ38N5iGGLE2Nv9zOWszYoD-3wxk-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 13:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174452

On Fri, 2022-12-09 at 14:13 +0100, Alexander Kanavin wrote:
> I'd rather not maintain a list of those that *are* affected,

This isn't actually too bad since these are architectures, not machines
or tunes and the list should remain static, nobody is creating new 32
bit platforms with the bug. So yes, it is a pain to write but once
written, it shouldn't change much.

>  even if
> we then include those that aren't. It's only build flags, and they
> should be ignored when the platform has already done the right things
> from the start.

They do clutter up the compile logs and I'd prefer not to have them
where they aren't needed, extra noise causes different problems.

Cheers,

Richard

