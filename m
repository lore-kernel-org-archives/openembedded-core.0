Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.718.1595008019853721511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 10:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JB/dSbXh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id 88so1741671wrh.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 10:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=27BWiFZSOy5PQnxaYos4IAttYkw3FALgCgJou1EuXP8=;
        b=JB/dSbXhjqkvRASlR6VkA+Sd4si7VThUcI84S51jqUjIqAAsWRdAneer6aQrVbN/O9
         HwKij5fJ7j+OTm8zurG4nYQg4lt8IuTUm5yimfDhgVujMaMzPzNe/p3Uhb4ypIGgpi2i
         m5n306pWn59mpyXbq0bnNkGwYzNBXRQdxh4/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=27BWiFZSOy5PQnxaYos4IAttYkw3FALgCgJou1EuXP8=;
        b=QSF2A+8ujAzEgFspLh6l8ZD1GJbQKzBkj7qxSbF39/dI29tYhkT5mwjQoQewmpxKlm
         67zjY7gO4a07nqe3PG6EBlERDXIY7NQBoCaBR/Zt2bAuiKZ5tDgb1vBQyIW/X/TUhFhm
         Y3tYB30xGEGfB69bwvegRgEesaQDLSx/SxTe6ZPzrvmWXczeqE3XFPnlT53JpRv3w2yd
         RQ4dw1VJYyf4flnQQqzbKehcax5Y5BpNtCrFmDGWMWDKEm37BAVkYSDGYlcb3d3SAeH9
         ozUJZER/BBZenniUEuDraVqjtP5dNZfEGwayZKEQJB5XbGpJaRMzo9IMdCSaWFg3rB1T
         b0KQ==
X-Gm-Message-State: AOAM5319mAfm4pFV9fiX21xVb2eyAQpVJH9wsyxA65+Odd1dUDXblKdV
	G5J0vecspQmqEtSkyEgPFPwbjg==
X-Google-Smtp-Source: ABdhPJwB5AL5FpF5mMwb9wXl3XqDamx6bI8GZVkax9OKByMPySQAMA7u6T6ZUfSldOJU7p96kjDJTg==
X-Received: by 2002:adf:f34c:: with SMTP id e12mr11036054wrp.46.1595008018321;
        Fri, 17 Jul 2020 10:46:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id c194sm15267305wme.8.2020.07.17.10.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 10:46:57 -0700 (PDT)
Message-ID: <4d8f36dd9075958747ff4b0194b6df750c313dc0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] Upgrade status: 2020-07-15
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jul 2020 18:46:56 +0100
In-Reply-To: <CANNYZj8VV-OHJa6epGPvUsQb=29ezhACQ8bop+oD2GNn9ADsDw@mail.gmail.com>
References: <20200715164441.DDD23E01EAA@yocto-www.yoctoproject.org>
	 <CANNYZj8drAJ8fvTC_KPhQ3yZr7KN7iaB-616DnQHmf43TjCFmg@mail.gmail.com>
	 <09ec097fc3cd3f5bb1ebbc7248cc52e56716fbfb.camel@linuxfoundation.org>
	 <CANNYZj8VV-OHJa6epGPvUsQb=29ezhACQ8bop+oD2GNn9ADsDw@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-17 at 12:15 +0200, Alexander Kanavin wrote:
> Thanks - obviously, the most appreciated work for volunteer upgrades
> is taking items that AUH wasn't able to handle, and resolving the
> issues (most often patch rebase conflicts or build failures - AUH
> tells in the email exactly what the problem was).

Absolutely!

I think there are some there which should be relatively easy fixes. I
just wanted to ensure people saw what was in -next and what was not.

Cheers,

Richard

