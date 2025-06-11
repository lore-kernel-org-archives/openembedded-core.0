Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94568C71141
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 18:35:48 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.2944.1749666944434576006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 11:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lPF0NdEb;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607ea238c37so481943a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 11:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749666943; x=1750271743; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVg0hE0PI9Z+Om0YlYBBB54tRhlqwmyz5fAQ3WYvuL0=;
        b=lPF0NdEbSwVYB3rUz5YcQGM6gY3SljvgMwcJvoUBkKEfNjrOhl3VkKTKg7LsI3jk1a
         YSZiDw6VxymDVsTIUh6WkDEmXPrPqbA77+DVvfITUIqmhaWmInwUZVtvipJr4ZEbZ7In
         MbPiUohEBBtBcqSz1Igxs09tgdYB1YUjJ4ymKacaZf8aMHUu1oMN3c8areMZuiaFH5E0
         Eji+oGePu8s3kzCvuc0XjZPUFkwLEtx2kbCrPh5vLyMddmfcGoiWY8b4DcYJkP066Gyc
         vR++HBOsQjtQNdMRsl8oroF3dxtM9CWYbfixDdSlc1yr4nEDqPUQ20OfUNNmc/Cj5Wm+
         ORxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666943; x=1750271743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVg0hE0PI9Z+Om0YlYBBB54tRhlqwmyz5fAQ3WYvuL0=;
        b=mGO1iId6LDAQmzOXKRDZwV1Y8gvbjq11U9rX/ucFnkycXMx/iBC1kdU62bOYeuK/iL
         VsujX+X2LHAJpptj7a1SIxOfMNPra4mbrep3dgAmepCp5Mbw/YmyEJ1b4jyuGR4Mebuf
         mGUpzrnudpM18951aWgohUY75ietkHBUC0M23O0zEt/c41uIBFnhdt7akaQ2At4EtESi
         sO9f3nQxXI+x38Oj5nU1lsJxAaZzJxRb4N/PQpkDCcZO994nNQ+xbmyu8iigGxX6O2DY
         KjYAhHkiS2xNqZRukB2Tozcv14YEp0sBjNgALOIGIgD6fc+dUd90J8RgZLPRhkGGaXIy
         i0fw==
X-Forwarded-Encrypted: i=1; AJvYcCX2bW0c/RtO1tyq7P2PsCsIhyRU2JM0srYatbl4EiKSegGWBqr5oVhsQOCy0ZckdEs6gsCKZBiVqOg8tFOHtbrtWw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTzO8L8i/ljkoare0qkjKcWnvp6O36LSfB9BnPQ4aSnExV/XLP
	Wvt74N/lSCn00FKVY+RdJ9nhlPZE66/X2k6o5akFv8gr4SHpzq2bL2Zk
X-Gm-Gg: ASbGncvlln1vWinP9fROhhMB2pKF0A3DAuDiKmcIvyStWvrrMiDCCkMT6URW3VGneBD
	dXSQ+hWUP9MNcMfhs9TJ57lY0jSC5WRzrcfsXxXCH3gEA7LTz8iH07lR4CHFHnTkQc5BnG8tIvK
	3ZcoeK6qQAtFClVrQq9bZNiyiD+clnrmzoJ6jY7D5w5QLunNH9CiV6gOoLnFgZk87XKa1izB9zH
	ONB4oja5KrO+VoxVhiSay2RZN/wt00PL+zvfoMSW0GmNieTliBhmZKr0p6b06uZ9DLi8PnS0eJD
	Pj48esvUD8RfkwvNIc06V1zKLlROhnyfnDV1GCiYxHIS2i8FLrBtGqaPCGi8PF8lOIU=
X-Google-Smtp-Source: AGHT+IEnqMNbJ7zXW/A2UGljsG/dd2cyLGbitSUyyA32Aw0BggAoaTOZDCusEeqDbkAtKYzVAiilig==
X-Received: by 2002:a05:6402:1e89:b0:606:adda:4f14 with SMTP id 4fb4d7f45d1cf-60846ace9a2mr4115482a12.11.1749666942641;
        Wed, 11 Jun 2025 11:35:42 -0700 (PDT)
Received: from [192.168.1.2] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783dccbdsm7734995a12.54.2025.06.11.11.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:35:42 -0700 (PDT)
Message-ID: <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
Date: Wed, 11 Jun 2025 20:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set
 BB_GIT_DEFAULT_DESTSUFFIX to match default S value
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 18:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218467

Possibly the recipes would need more modifications than this, especially
the ones using default ${S} (maybe?).

I tried to apply it on the current master and build some base recipes in
a clean build dir. I tried to build git recipe (was curious how it
behaves). First gnu-config-native failed to install, as it couldn't find
some files due to the move. I fixed that, but right after pkgconfig and
binutils failed to patch - the src is in .../sources/git folder, but it
is trying to patch in .../sources/${PN}-${PV}.

Or am I missing something?

