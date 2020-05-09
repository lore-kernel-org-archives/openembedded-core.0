Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.3625.1589052978114892861
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 12:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bhQoTfte;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e26so13636118wmk.5
        for <openembedded-core@lists.openembedded.org>; Sat, 09 May 2020 12:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WQm2O9ymouh7jl8ziGuro1WokXL0kt6Hmbi+V06EQSA=;
        b=bhQoTftex/8Rofrx77R2r/G2//cgeADKLZQWlxDpVr8yLlzob8a0TziMPaFfAhwhsT
         SHXnAuVAkXxQAiOV9Kg978Ehes+1G7izWByGKRUzKtAXBVMzyi0OvcGnZJefkAE62OeZ
         dvo1dlCQQL2kLD3t+/sTbifC/Nqs6rhiECrGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WQm2O9ymouh7jl8ziGuro1WokXL0kt6Hmbi+V06EQSA=;
        b=CjMVnNVKmCdVkQsI9hYozEuYLitUdT46lWlvNrJkcPsEsfZBlQcRSsD/0SrE8HkEsc
         mkxtb3+efI7vzYcz9ESVXwigksfvtrxE9vSZ+/OmwnrjH4SRMQ9tBldYv32gH0YoXuet
         N7J+BeWGbj5boVaeotGRHI1FzP+5GzhQOLTeQlL3FZk1yR1P1EtWw/U7vLGU604AL4XA
         6AIifjcar4bh6FhbBxI53Fom2l490VRZOP2xRJ4WtlTfMmHBMp52wGNUXH26hiz4YvwO
         om/ZNVINNS5dFPn7jvyAZXWsJ0DlfuYdNRwSY6Pm4NE6Ftg7XhtXVjseM0SDg3ZaL0VW
         q8kA==
X-Gm-Message-State: AGi0PubmOxBmiwHvz6bALErtzAkAauwY7wFnGthXLL7gOa4XfhsdC/NM
	ZWm0FltacHA/0eK3Qqzom8JQ5Q==
X-Google-Smtp-Source: APiQypJ8wFwKILv+HIBk5tPseYZ43nv44R9owJAs2MXsFTuahaWNDbwRh68B7P2EewgUD8zWCYjcgw==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr23178647wmc.67.1589052976611;
        Sat, 09 May 2020 12:36:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id i74sm9481569wri.49.2020.05.09.12.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 12:36:15 -0700 (PDT)
Message-ID: <017fe4f07474c789fcb15df550e18fd05e2b20be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] insane: Promote warnings into errors
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 09 May 2020 20:36:14 +0100
In-Reply-To: <CA+chaQdaOXJ694M2Tz8LAtcmW+Dj7VW5MZPvec1Vjb5MheVr=Q@mail.gmail.com>
References: <20200506134002.155500-1-richard.purdie@linuxfoundation.org>
	 <66e0d1d5-2b72-ce26-4b5b-709fbcfc7274@gmail.com>
	 <CA+chaQdaOXJ694M2Tz8LAtcmW+Dj7VW5MZPvec1Vjb5MheVr=Q@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-05-09 at 19:57 +0200, Martin Jansa wrote:
> Agreed, I would go even further and move all WARN_QA to ERROR_QA. I
> do that in all my builds already for few years, so oe-core+meta-oe
> status shouldn't be so bad and those few cases where it still fails
> can be skipped with INSANE_SKIP in the recipe - to make sure that no
> new warnings are introduced later.

I wasn't really sure how far to take this, I also wondered about this.
FWIW we've already cleaned up all the warnings from the YP autobuilder
so OE-Core should be warning clean and the meta-oe builds made there
are also warning clean.

That does mean we should be able to do that at least from the
perspective of those layers.

The best way forward may be to give this a week or so to settle and
then add an additional patch moving the rest over?

Cheers,

Richard

