Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105F3C87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 07:04:34 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.16365.1754377468415787976
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 00:04:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dy56Qxqc;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-af93c3bac8fso541569766b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 00:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754377467; x=1754982267; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5uWfI0yQknrsVtmKRs0enH+CQsKt7wQ4hMz1arvOXbQ=;
        b=Dy56Qxqcd3IM7RgbV3w1e/SJZYy1Db55vH9ffMhbxemzWLrwJ0qdTRX1LHKDCymvvx
         f2rTRw3pnlRsxdRPz3zRvvJT3g5KqwLFOubaymn3m3cqbuzLP4dCYXc3HeOZdArq6tA0
         aqavKNmppBPua+3gc0g58m2RrNsDikqWFkZdsiL7OY+BkqNqszNqNKdx4LaSxH1xpcmH
         5UF4YC3SdC4ReGtJlKwj9cafrIlRCQ1aNkGl/FSJQfW/D4sfbywXP3gc60FE/DSlg51C
         qMXq7AbtPzft/XOiMMV7MXKQ/nMsZNuY7MT77efgZMk306wO3r+neTSv4Srb4FhqnJ27
         G4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754377467; x=1754982267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uWfI0yQknrsVtmKRs0enH+CQsKt7wQ4hMz1arvOXbQ=;
        b=TXN8fJve9mE33j2uyB1CaI+lvl8Ce++pR9Ds7wooixAbR3ORTQ4NUYdhwvUi2lavrZ
         10ni22Lyd06KOq9ayjbLXpnOhqTEU1JiPCLo5GuVXfW7q6KN3dheg9oPp0A8aMb+Kmgy
         Qc0e55j7F1qzPYROblZcq58dZis0Jbtuw6Vo3eq+w6Uhq2uU9byHJgEmLvf1dueRsq5Z
         P3Dh2IClQsfcvGxoN8hd3183xfgSdUHIxKTXNzG8YFBHtIfcl7IhHlumVfjYQT5DVlvR
         FlD1vIn3WWBwI4KhYL6Nhvq7GOZy04pK40G18mS0flErSlsDh82ix7bEQzzQ9jxDPEQ6
         qRPA==
X-Forwarded-Encrypted: i=1; AJvYcCUZrWQZ89zLxA79DQq6jibnZ8dSq2ng9KL/fKDRI4MvCWuEES72tdI6oFGTvin5tHJmpCjIUlimCrx657RJrCXPnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxO7rzkYar0DqL80Mew39RcMncbSbVuu47VMI3xdZXqG+FbSSKx
	DCdcSjnNO8C4IZaHNXY5KzE6pcAy+x5/QCbgSlxgbATUWVrLnNm94PDa
X-Gm-Gg: ASbGncs1pmQfLAUF2AwJK/sjsAADYFBsY8uFc7n/k3/Q8c9a1lL5jSPjbuFhTcKBmuq
	X0cuxCFrOtTJ76cOd1SEgCFWsAfAqI1OQvy1dUKD1zhrWOgUutsVNMsmukUedtnUUKSrdgzHtVS
	CpB6vVQWmykYOWQ7c5GpUig8eCb4yMISCrs8bFg1lqbYPTXIMavmwYOjtv9vwkh8wXg8ngYM9lh
	86EuoZFOwsLz5irPM6+wKp8iZby4Sg3+s5Pv9NFwxHKju+lcWtklby48WwHeFvYkzNE4QOhoDZU
	raKOnaiuucfz/6Q2FzIdYB9F+WzK7b58J49Px3WRjjlz+xusnga8+i8/Q/Zzf5FCUfHsRRvXq7X
	a3VtxThmzIIEES032ugDv+U4+PKmREA==
X-Google-Smtp-Source: AGHT+IEPMhwkQn2UPTcC9659adpXSIm46xFRZkR2XlllPsb4Q8RFuOkdJ8WPnQWUkFtSGYvxG3p9yA==
X-Received: by 2002:a17:907:3f99:b0:ae8:4776:fbb1 with SMTP id a640c23a62f3a-af93ffb9359mr1438604366b.11.1754377466546;
        Tue, 05 Aug 2025 00:04:26 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af93b4d4c27sm595033966b.66.2025.08.05.00.04.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 00:04:26 -0700 (PDT)
Message-ID: <4745a7a7-2a3e-4d71-8bcc-0d9b26088e01@gmail.com>
Date: Tue, 5 Aug 2025 09:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][master][PATCH v2] cmake: Add PACKAGECONFIG option for
 debugger support
To: nikhilar2410@gmail.com, openembedded-core@lists.openembedded.org,
 nikhil.r@kpit.com
Cc: Nikhil R <nikhilr5@kpit.com>
References: <20250805065716.614266-1-nikhil.r@kpit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250805065716.614266-1-nikhil.r@kpit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221458

On 8/5/25 08:57, nikhil via lists.openembedded.org wrote:
> From: Nikhil R <nikhilr5@kpit.com>
>
> Starting from CMake version 2.27 support for interactive debugging of CMake
> scripts and configurations was added. However, by default the `nativesdk-cmake`
> is compiled with debugger support turned off.
>
> This change adds debugger support for cmake
>
> Signed-off-by: Nikhil R <nikhilr5@kpit.com>
> ---
>  meta/recipes-devtools/cmake/cmake_4.0.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> index 7d8b8cac65..b47494f274 100644
> --- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> +++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> @@ -46,6 +46,9 @@ EXTRA_OECMAKE = " \
>      -DCMake_ENABLE_DEBUGGER=0 \

Since you are adding CMake_ENABLE_DEBUGGER from PACKAGECONFIG below, it
doesn't need to be present explicitly in EXTRA_OECMAKE anymore (the
cmake class will add it, with the appropriate value)

>  "
>  
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[debugger] = "-DCMake_ENABLE_DEBUGGER=1,-DCMake_ENABLE_DEBUGGER=0,"
> +
>  do_install:append:class-nativesdk() {
>      mkdir -p ${D}${datadir}/cmake
>      install -m 644 ${UNPACKDIR}/OEToolchainConfig.cmake ${D}${datadir}/cmake/
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221457): https://lists.openembedded.org/g/openembedded-core/message/221457
> Mute This Topic: https://lists.openembedded.org/mt/114544863/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


