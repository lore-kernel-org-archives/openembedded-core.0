Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.59012.1594045438604378541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 07:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h1dVDEJp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id f18so33104582wrs.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mBu9MM7ghcn1wuJ+wIM6JWxN3w0q6IHU7bebJO4vt4o=;
        b=h1dVDEJp9FyZCGtw7aAObKx1Xhbxg7nOH3YPd40Y7djIkwoQkL/ys5r/3zDHMIVtjf
         3SqAXTubHsVksLxfwRrqmjWUHTwPVAD4p24FuJ0TcAeWFkmBZUJZ9yfoiYQ46cO7f+R/
         duKMwVQ6smXstpTzaOr50nCUM43YNWttArBoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mBu9MM7ghcn1wuJ+wIM6JWxN3w0q6IHU7bebJO4vt4o=;
        b=oHYSMDpywgopMpvRIkjRSvdUVowN7ddw4/Z+i8LmwG7C5SNN1nuu9nkxad7FIZ+Uv3
         qpIZZhmoE13Tzvz0+We0ZlR6XsYbpl0Ku0W060Yo3VtOrqNB1Bc/wDErRNluyqthaBc2
         QVgmAAizmtHYCmb3Oed6rSW/B7jVRWsjfk/k6tZaJ2firDO/qUU2Lpf4u2nsIKlDmKTO
         Qa1BgsnW/glVfFc6YqZxzxDigCrnNoem2mSyy7KrWJhTO7N9NQQTpcFeKlGGutAHWFAM
         sM05Q630YDAZsTS09grQ24JHcz63UtKFfElcSvRKkQ8QuQFqiE8UfjW5ERYAroV2ydsq
         B7iw==
X-Gm-Message-State: AOAM532ksS0jxtoZHfq6B2/sWwAVT9lK1UjZORFfSMgsuaYfIO7s2G1G
	F2+3x2UMYYVeL2NmVr9vKC1aQg==
X-Google-Smtp-Source: ABdhPJy71wDh6GH2RFqJhYWA5IK5nUGuY0gxbvZe8qGNtzTw2cX5tGzIE9CDXLBNqNZlIZ3DuiBHfg==
X-Received: by 2002:adf:82e1:: with SMTP id 88mr28900521wrc.376.1594045437121;
        Mon, 06 Jul 2020 07:23:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h13sm23859433wml.42.2020.07.06.07.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 07:23:56 -0700 (PDT)
Message-ID: <5633aaae995abfaf660da080c920d4946e71b064.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/core/loader: fix regex to include numbers
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: patrick.vacek@here.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 06 Jul 2020 15:23:55 +0100
In-Reply-To: <a5e431f7887769d4bfa97b30193a78d9c7226e72.camel@here.com>
References: <161F23611A5F1482.17108@lists.openembedded.org>
	 <a5e431f7887769d4bfa97b30193a78d9c7226e72.camel@here.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-06 at 14:14 +0000, Vacek, Patrick via
lists.openembedded.org wrote:
> I think I need some help here. I got an automated email that my patch failed to
> apply, supposedly because I need to rebase. I'm on the same commit that it is
> suggested to rebase to, though, and I can download the patch and apply it
> without any problems. What am I doing wrong here?

The patch is queued in -next, I think the automated tests are lagging
behind a bit or something :/.

Cheers,

Richard

