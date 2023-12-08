Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E62C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 19:28:35 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.19188.1702063707620155152
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 11:28:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4TpeUc3;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ca00dffc23so29553821fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 11:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702063706; x=1702668506; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Shnvx+P7Iw3FUOWPunRUfLznWlNaRzyYeYZ23h4BfB4=;
        b=V4TpeUc3DzOE5jHn5Y9wTNJCszUPDFGLZoJU/uQ/7JuuPlO5W5zG6IHO5ekdnqCxl8
         OG5Zg3ZbLSHTlFpyojMRkdG7UuqHx6fyLGnxw3klr+egw7kSf45X7fvlj8feSen1u6YP
         1amqDIgo3EwAPyYpxu93zqcNSTCuAq5N3/oFcfoxPUDqTlUATcTLmptswKdk0ZOUPYH4
         o/3hiMaBPFtu6vptmXMU55EMpT+okWbb2ZbSOv52WSMjDX56xT1xjph1qNd7JAebPccg
         Huil15vctLuObb7YPlfWR8m0vp695OVQDhqxOvaATPo2chWv5cuQO1D56VsKR7pJv1gJ
         fkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702063706; x=1702668506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Shnvx+P7Iw3FUOWPunRUfLznWlNaRzyYeYZ23h4BfB4=;
        b=sE/CqQlB9NIsI5BQpOmP/+zwOuMtgiuIhw4uS15hkK4sl/NTOV1WPIjC6/y1LCMfHc
         9Onrr8rUFCWhVYeraupdjdQGwkQYxZjBp1IRVePiY7mgThCsDueaIqel3IHOyH/BGcJ1
         dfpWaExwzAtF+YHTJEh2IcnlB6uyGQ+xQOZes9wxxecdXReNU0iAovanftgGG1g0MP88
         wreGldNxogrLpAQmsDFpnjEz8vqwbCSQB/RAxVXLT2IdisqTZ9c54k5bydcJLoDM8qOu
         1UJAyzbTCO81nWSSZeQVrlHguIn52/5NNeP3Fprz0+olwDhwwBBvOvKiXbp5ZNFlr4VA
         1xhA==
X-Gm-Message-State: AOJu0YwUx4KVgci03D7mf9H12nwfXXgTsHMgmNz2IyBT0FxrReT35E0B
	vK/UV9JP8HxwA1LZI1Btiy/IjOwy0V8RtP3QBJ8=
X-Google-Smtp-Source: AGHT+IEGHzRwgVBNO5Cm7dyH9+Qm20fA0xwb3nf09Atr17n5cHaXOFF6gMOBBbF6mQ7MSOzMNpw58XN5xlJWxUoA22E=
X-Received: by 2002:a2e:83c2:0:b0:2ca:24c:e25c with SMTP id
 s2-20020a2e83c2000000b002ca024ce25cmr201600ljh.99.1702063705363; Fri, 08 Dec
 2023 11:28:25 -0800 (PST)
MIME-Version: 1.0
References: <117ae053-969d-47ac-b0dd-f75d4c4198ac@ni.com>
In-Reply-To: <117ae053-969d-47ac-b0dd-f75d4c4198ac@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Dec 2023 20:28:14 +0100
Message-ID: <CANNYZj-N6iSpgLuWfkBqnpW1L5cqTJhOJq85mgYC3K4RtJctcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 0/8] Add new packagefeed recipe class - RETRACTED
To: 20230818174754.988128-1-charlie.johnston@ni.com, 
	Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 19:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192083

Perhaps you can publish the final version somewhere like github so we
can easily refer to it, should someone express interest in it?

Alex

On Fri, 8 Dec 2023 at 17:56, Alex Stewart <alex.stewart@ni.com> wrote:
>
> Hopefully, the reply-to has worked here.
>
> This patchset was originally submitted by Charlie Johnston while he
> worked at NI, and was then adopted by me after he left. Now adjustments
> within NI have left me with much less bandwidth and I cannot continue to
> support getting this patchset upstreamed.
>
> https://lists.openembedded.org/g/openembedded-core/message/186383
>
> So unfortunately, I'm retracting this patchset indefinitely.
>
> Thank you to everyone who has helped along the way.
>
> Thanks,
>
> --
> Alex Stewart
> Software Engineer - NI Real-Time OS
> NI (National Instruments)
>
> alex.stewart@ni.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192079): https://lists.openembedded.org/g/openembedded-core/message/192079
> Mute This Topic: https://lists.openembedded.org/mt/103058646/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

