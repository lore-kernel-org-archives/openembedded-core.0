Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209AFC87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 19:23:57 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.8031.1754421831822946275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 12:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NsQEJhIM;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af96524c5a9so396223566b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 12:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754421830; x=1755026630; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHM2RCrvi8XnuKb88YJiM5fNxqSv6jJL6ANef8Y3fQo=;
        b=NsQEJhIM3foX9I2pTBhCcmVNMtkax0S/bOZEqQuB6tON4Yw0h17jXyNzVxcA0YHeUr
         KRnMiBSSWd0N1nkqoNfE2r6jxkx8AiLF4uHe023g0xy5vHiKHvAx37eDMicqymdolCdl
         G23iLCVhWgn4vs8dTwJuGDvQPYyp9f/q67dotvKQ5jzqMdNriX94BW3+XObfb1e49pvR
         zTcnsoXc4r7HfG2duQJTGiyeet3x+f4bjA6lkRJz43m0h1+lNqL2pYwYk2mF3Njwov0t
         mnWevcW9b+7KJ7c3clC6euURNaiRJplZ3DDDTqA+HtUj/mSgin84tI6NngKUnGR9hTLU
         1zMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421830; x=1755026630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SHM2RCrvi8XnuKb88YJiM5fNxqSv6jJL6ANef8Y3fQo=;
        b=qcHykwrOMI7doRpcvxgcNDgbPzs7B2tno+XufvT3bbzEoekkYUtUU1JvzGQOHvzOMN
         7L5YIXHsdCmUMAQVUwsDvhuTKnzzgBl3oswToCJqI/EPg14YjlOJTYdV2UFbJirzPbUD
         4PlP+aj5YqPLFArdUt9+RGQjwFxJjfnhuPGE6lLoCiwgU//1VhtLcGGuBD6mVtBofuOR
         KWRw5foGoE9xDslYZ+T3TZ3R+z5XqWH9L9WDfmc/aP6IZNyxjqAf5KWwazDquC8ARa8T
         lPY+EDJQ69x6ZDvXh6aXptR45iePy6noI3JbGQv8coMnwVfLJ7z7oZwUa7+o62qVg+hd
         FYlg==
X-Forwarded-Encrypted: i=1; AJvYcCWE67O1zVBxABx2uin9Q34BqfMrceSOEQPdRTTuJvkEEII3pfME0hkZb8lniH0dCk5mNYIymzViHM8wraNOchj8vA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyikyA3Z/hP+W2L6AXwRH5TsWBs5eFxPkNAvV5hQ6qPjol0eHKV
	EqbJxTuOTilpZLWz2/JbIEB95tbXnFkRa998TWr7ygXKXujOhjLWQo7q
X-Gm-Gg: ASbGncvCUipTUZnfKFthgRUYWwLlDPzqpCu17O5q9vwp9I+/+JMi6nDyD6IhJI0bHKy
	c+2BhA9uyBefCGqhGlVax4R/0pQE6dePoySdFxT80GUbEglzqHxQMXpEG3qwD54TtW7ECZ12xYB
	tFqGlHBQiYC4f4fU1BoUoHJPI3C7TUxandubp7tu7oqPpo3qvdKi9HUXGwSOa46so9wsBRFs9s1
	vjYsZ7tZd5X3KIoC3Kw7FXR6wFDX40h7ZE3ybGvHvMvB+k3Glv4G/1h47FUvUXRM3SnfHbvQ4Ca
	0+F+aGp1/NYOa9FbGHwHTYh3qiBRJfJqbw7rf7Ls84trKTaQbhhfS3hB/oi4TjKuLtZqdkYP4QW
	qNudLGGbG1RuA9STkRmeOLz0bAuDluA==
X-Google-Smtp-Source: AGHT+IH/sFeBLnY9XH20efh1f/r6t7f+3ej8/9Qgn2XipD7GkEG3ywvibd/z/1JPcqQ8GAKoz0Bivw==
X-Received: by 2002:a17:906:478c:b0:af5:3172:ca80 with SMTP id a640c23a62f3a-af9903c6851mr19769566b.38.1754421829678;
        Tue, 05 Aug 2025 12:23:49 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm963839366b.12.2025.08.05.12.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 12:23:49 -0700 (PDT)
Message-ID: <dc1d93ac-23b0-4d79-b8b6-73b0d22720e9@gmail.com>
Date: Tue, 5 Aug 2025 21:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] librsvg: upgrade 2.59.2 -> 2.60.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250805063925.771875-1-skandigraun@gmail.com>
 <1858D393D35BC4B4.28357@lists.openembedded.org>
 <DBUIS9SGNETD.1OJZHA0Y17QRS@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DBUIS9SGNETD.1OJZHA0Y17QRS@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 19:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221491

On 8/5/25 15:14, Mathieu Dubois-Briand wrote:
> On Tue Aug 5, 2025 at 11:04 AM CEST, Mathieu Dubois-Briand via lists.openembedded.org wrote:
>> Hi Gyorgy,
>>
>> It looks like the build is failing with this patch:
>>
>> ERROR: librsvg-2.60.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/qemuarm64-alt/build/build/tmp/work/cortexa57-poky-linux/librsvg/2.60.0/temp/run.do_configure.832057' failed with exit code 1
>> ...
>> | Program /usr/bin/gdk-pixbuf-query-loaders found: NO
>> |
>> | ../sources/librsvg-2.60.0/gdk-pixbuf-loader/meson.build:40:29: ERROR: Program '/usr/bin/gdk-pixbuf-query-loaders' not found or not executable
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2147
>>
>> Now, as this is in the configure step, it might be related with the
>> gdk-pixbuf commits from Ross, but they look like fairly straightforward.
>>
>> I will first drop this series and keep you up-to-date.
> Hi Gyorgy,
>
> After dropping this series, the build is all green. So the issue is
> probably here.

Indeed, the bug is here - it is trying to use the build machine's
gdk-pixbuf-query-loaders, instead of the one from the recipe sysroot. I
have it installed on my machine, that's why it succeeded for me, but
when I remove it from my machine, I finally managed to see this error.

Will be back with a new version.

> Best regards,
> Mathieu
>


