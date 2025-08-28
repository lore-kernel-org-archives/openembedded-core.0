Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD26C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 18:17:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.4506.1756405026735864894
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 11:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ni5s4lbv;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61cf8280f02so602765a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756405025; x=1757009825; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s8QXujeKTvTQ1RHqDMJeAA1dzHp6kxlcxZWob0wSfRg=;
        b=Ni5s4lbvJ0aYqLTsGpJ2RmxowzUq7EqGvZOdup0hTQMZqzPcVSULaG3UoKaI2uYbK/
         dqzjwJhVNW07p/BMgGYWu0z/rGv4skHlyODdVzqGs/3pcwjkx9Kye2u3kev/i0gcFsBR
         ABuHtd8FKYlEs2YtTcPrxZjcvTNvJNVK9kxrQ5nq3kmWy4gkriPu/VmznHLkpC9hlE1t
         HWMFJV3ArV2+BZn5KMccMXe6mvuxSoi05tatvjccpBURQWGJ3JOhuPVahFHd4q5fzneT
         zcnxrf4L7xcp56Fl+gSYRzwnpphunvVpkn9uQBSUsnywGAdIEVNEXqcxvhdXmI5Z/nY2
         ESpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405025; x=1757009825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8QXujeKTvTQ1RHqDMJeAA1dzHp6kxlcxZWob0wSfRg=;
        b=KCpxIHiB3iA6aJx4rWoGrAvsctoZWYenJtRx1dN9qOdE50ZOZh4CmhHyP7lqsz67Oj
         YA1oHY9NE6GkF0T9Vf0AjEAxy6xBg51k4zboV0t2DMHUbb7S0SV2lTiAPhcz7byBgYNP
         pNJxT4wNI5cCpamnTHmn6Uta7a1E18SnLTO4wbJT5osDvMm5K/szJcTI10rOA74rGcHT
         UV7Pd4rVsymCC8AsMuJcu7VdZRa9LmPJURbKCtptX0Ek8rZCZfRuRGZxAOMql0Sx/ByB
         aHNSq5xdKRiSNnQkXgk0LUFHdfb29eRMbkbAL69QasQ01ri7d1Gt+70AhV5K88ZBm/P2
         l3dg==
X-Gm-Message-State: AOJu0Yzh9ICuK51j4SaTSfI+tTeiS9P8ZF9LgW7zgGCt6LcBVLjAA+sG
	PL5A7O8nTFxqbG4qR2+j7Wt1S0dXIrTTnhbMgMna3iXJIoGmgTEOTdySejFTHQ==
X-Gm-Gg: ASbGncuUbCIm6YzYbeTyB3rapxcAYbgAxGeTnpGXRAx8zX0ElWCj3kXgKM5o8QpsVOB
	NyXdn8HRjASDPlXHXkM9wbZ0NqyKC+rvsoHij9BTXM+gitGR4yJu4EB3b0alRmeQhAImEHvg0No
	MG05RYymYE3Io8/DmD7lzjzIKJZrpiKixzPO6uhIeymEKTSHmcGbMCodBOLy3Ynqz33qWfcTGcC
	/cX1V8cU6DAoZFIc5SHSl4cbpCcy5ffXaUNqrvGiw4RxZyvadUzQUGDxH1rC22eMMbjoCdLgD09
	OiUndnUzKX+5dMio0+GJn2NMhvBFSSC0BEUVGDym0D1irsoahO05VhglKAOSyqWJ5weHFWxRWCQ
	nFynE0LqGfqGQ+nWHG+Eylo+gwiMhjcc=
X-Google-Smtp-Source: AGHT+IFSvDPbK3qOUXU0T8pV+ybMn2OAV4mbmxd25enOd0hKdPJENJFrmo/U78crMbg3NEzKAEVdbQ==
X-Received: by 2002:a05:6402:4312:b0:61c:7a9b:21d4 with SMTP id 4fb4d7f45d1cf-61c7aaa67e8mr10020526a12.18.1756405024969;
        Thu, 28 Aug 2025 11:17:04 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc579ba9sm125925a12.52.2025.08.28.11.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 11:17:04 -0700 (PDT)
Message-ID: <484de6a6-5b98-408c-98ef-e357565e6003@gmail.com>
Date: Thu, 28 Aug 2025 20:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] xf86-input-mouse: stop checking for new
 versions
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250828175323.858522-1-skandigraun@gmail.com>
 <CANNYZj_OZWmGvYmpRP6Ve28MKmmUYhU=gjdwFtfCabwi+oV4Pg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CANNYZj_OZWmGvYmpRP6Ve28MKmmUYhU=gjdwFtfCabwi+oV4Pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 18:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222591

On 8/28/25 20:02, Alexander Kanavin wrote:
> I guess the recipe should be removed rather?
>

Okay, we can do that too.

> Alex
>
> On Thu 28. Aug 2025 at 19.53, Gyorgy Sarvari via
> lists.openembedded.org <http://lists.openembedded.org>
> <skandigraun=gmail.com@lists.openembedded.org> wrote:
>
>     The application has dropped Linux support in their latest release[1].
>
>     Keep the recipe in the latest supported version.
>
>     [1]:
>     https://gitlab.freedesktop.org/xorg/driver/xf86-input-mouse/-/commit/d719d0588c580ac0ffb8546e864c05c521b1ab9d
>
>     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>     ---
>      meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
>     <http://xf86-input-mouse_1.9.5.bb> | 2 ++
>      1 file changed, 2 insertions(+)
>
>     diff --git
>     a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
>     <http://xf86-input-mouse_1.9.5.bb>
>     b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
>     <http://xf86-input-mouse_1.9.5.bb>
>     index 92e54d9701..6f578155e1 100644
>     --- a/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
>     <http://xf86-input-mouse_1.9.5.bb>
>     +++ b/meta/recipes-graphics/xorg-driver/xf86-input-mouse_1.9.5.bb
>     <http://xf86-input-mouse_1.9.5.bb>
>     @@ -12,3 +12,5 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;md5=d213a69053dffe9bcab94abf60013d33"
>
>      SRC_URI[sha256sum] =
>     "4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968"
>      XORG_DRIVER_COMPRESSOR = ".tar.xz"
>     +
>     +RECIPE_NO_UPDATE_REASON = "new version does not support Linux"
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#222584):
>     https://lists.openembedded.org/g/openembedded-core/message/222584
>     Mute This Topic: https://lists.openembedded.org/mt/114939437/1686489
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     [alex.kanavin@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>


