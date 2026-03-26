Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9DC910A62CC
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:26:30 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47356.1774531585302343413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 06:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HW+kEgHh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-486fb112c09so9927325e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 06:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774531584; x=1775136384; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HZYi2owkm9V2t89H2jVy6ltpeA9kTuq7S5ctx5M1MRQ=;
        b=HW+kEgHh2UrVrCQtZufjspb1+fbfXeNP0H90wWZH5JfwicEk9Lw1iRPrGjV2lfxqXc
         2jcYH7NSyEFLBlv8/zU933knT59zLsjwMzw4JE2mTgWb84aXa78MKHfkcCTimKv30DSe
         TY8MXZ7ogPpbug3WCvhhvFPx4CjA/qxrZlCblaWULqJidfNYEbrvsKsfF2wjbUFmWqo2
         sDtz0RXp2jvEkAFG/BdEDgjJuKE5AITtWsykpykoi4Q+PxMYyRmGc0VdU8PBNPTa8UIM
         qXIjQElK97ippQGNdKlUUXTEcvEbhlCnnBz4bMzIhdLJDh1r8IpL4Kd6UI0BFVjMRCjv
         4uaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531584; x=1775136384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZYi2owkm9V2t89H2jVy6ltpeA9kTuq7S5ctx5M1MRQ=;
        b=fD2lYGKpewpU6GfLQ+CWEEXN2syfDejnyydkMrOw5IN50xuJyamb9y6HkVuS8K2dmA
         g97/mYXx/ezpe5WwvTeevOJAS13g6heGXakjj+y+cGD7SbOtIs2S7BhI96eB3TrwmrI8
         hRE+LMF2mh808ijpTHpUN7XLDN+EVdSUelv5F2Py9oDKjrlmdPwFI4rqm5Cv5NO5/beG
         OPkUi6McCWjC/xbgqj1tSV0LGOfDqpXBGQ9Josx5P6Rgcwm5qBIL4hnJhxBCjayb454X
         rt33czgiwpnkXfHWgOzuMTrrMkBGzdiZdBFOdI0neEE0d9eQn4pS6Ub34vUsE7cgvUdc
         NDdQ==
X-Gm-Message-State: AOJu0YxcWEcOezvkJU0ZjrrMWxKc4oreVTe8QvCsX0WKEKKx384270W4
	6nFIDlff4LDJKuwvEVe7L3rC2RKX60+qTNshU+qdcVXJOyROB+/c8Dfa
X-Gm-Gg: ATEYQzw6ZWoUT9MEuHlRAIRHjVwOuk6ICtlFs6XzXBvPWmQrLY/ACj+cBDB6GmJeZ+P
	ss2Chx7kEhBcHmqWCdzXnvhb+hgS7L2u5ft2+CTvZn/4KnvYs7D0Jegz0VWHc8oxjf9Qx4j18qF
	itsp1CP45RnmzRBJE48D9dxykwIVrMsn7qLxZH0IE//Lu5iNXsSATgUXpmd6CY0hQo43Bg2ZWKR
	0qJ+Xc29UqfartcWMkOElOMQOSOrdGnFGBWDjOCILSU4qsLdDt726e9PeYVUOs11gUc0G50ipeh
	8Y6rFfjmqu/t18xqupRfXCKwau7amhW0Wo+YyJWiHKun8MUx5u9mKwj6dTproTgO4gqZjpA5CQY
	sptHzlasry7kkbUVJTd8RoDwLUpN6Kik7S1PBZ2NaKuxpUmQvn3unkOJtECmWPO0v42q+lckPcG
	cxa/zJ3F7XRku2SKOzIGcK6MKpw8tT5Wyb/jUI+kObT3wnfUGCBINIZ7GUaZEWDVKc5Q==
X-Received: by 2002:a05:600c:c490:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-48715fc7437mr113078345e9.1.1774531583457;
        Thu, 26 Mar 2026 06:26:23 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872438891asm11051415e9.6.2026.03.26.06.26.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:26:23 -0700 (PDT)
Message-ID: <75ca1547-14db-4cd3-a6d5-974d5f2930ad@gmail.com>
Date: Thu, 26 Mar 2026 14:26:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 13/13] libxcb: inherit python3native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin
 <tgamblin@baylibre.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
 <20260326125113.1853869-14-zboszor@gmail.com>
 <CANNYZj9__EU9=6DyLviLss6vXmX52Vf1Rk1i5REobSkbRDq5Uw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9__EU9=6DyLviLss6vXmX52Vf1Rk1i5REobSkbRDq5Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:26:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234001

2026. 03. 26. 14:06 keltezéssel, Alexander Kanavin írta:
> On Thu, 26 Mar 2026 at 13:51, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>> Instead of open coding, use python3native and xcb-proto-native
>> as an extra build dependency.
>> -DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
>> +DEPENDS = "xcb-proto-native xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
> This change isn't explained.

I will move this commit to the free-threading enablement RFC series and
add the explanation to the commit message.

The problem is that the build failed with ModuleNotFoundError
for xcbgen when free-threading was enabled.
No idea how this is satisfied without the xcb-proto installed on the host.

>> -inherit autotools pkgconfig features_check
>> +inherit autotools pkgconfig python3native features_check
>> -export PYTHON = "python3"
> I'm not sure this is an improvement? We try to avoid using native
> python whenever possible, and use python from the host if it doesn't
> cause issues.
>
> The rest of the patchset looks okay on first glance, but it does
> include a breaking change, and you need to at least try to fix meta-oe
> (or ensure nothing breaks in there which is unlikely).
>
> Alex


