Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.11557.1629557190219986394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 07:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gUnY8GLb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id n5so6220391wro.12
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4OWRbePsJ73DZHU/nu163u8p2ffxkTYyEb087l9Iuvs=;
        b=gUnY8GLbww2MBHnHZZWYFDUiBg2sXNCrF68Xj1V3JzHC2vZKZERk3sj6z4YtKAxAcP
         LOKFKqSqqgiomqtLZjJegjOtcL8nw/oAKzrMrRcRw3TqigqNbtxl9mlS6Mu8krSNmggU
         1ZNs7AW+H/QjkfO597G0h+3s0xmju0lxRVy78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4OWRbePsJ73DZHU/nu163u8p2ffxkTYyEb087l9Iuvs=;
        b=Te4sLiiMTkWfidAdv0eHms9do7uD6ymH4GCWYVrg20vhXo4htF2jKcT+kawB5o3EJO
         BXLqvo9ZuO/KwludGO0Q+aBUQFxA+kXDeiafXpwW2QsKnnMkFlJ+lOLep7fT4XQrmGI9
         5sTgxuPlgfO+DOcKKZ/8RZBju/QRL7FRHgld4XlZnS6slur4OadRc9o6s4dVnWprOxzV
         30UeddU0LRzslUvpgcPR0CPzdo7UHncUaOIkvxV1jtV8eDb7qiM/YOCYRwGIldeu0eO+
         WNUtx2KnSDxTa/OU8BpAUxsEkkvKiQtbI4RFrYHmImUz3Dv+YEzwiAGn6F5VVwH1HfvQ
         hZrA==
X-Gm-Message-State: AOAM530tJ65Cah5n6UQDokOh2OCKudsD7kF6HbR37nwoIzNYehm1NJbD
	+qs9X411DGaeTj2Om5LVh47FtA==
X-Google-Smtp-Source: ABdhPJwLwlv9xjXAqyl03GAjS2cQ4sXPwy3Q08LqOR9F7F+3iTPr2IQg/TBNzhMP8dv3NydSvBK52A==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr4157577wro.399.1629557188553;
        Sat, 21 Aug 2021 07:46:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:789f:44c2:e113:215? ([2001:8b0:aba:5f3c:789f:44c2:e113:215])
        by smtp.gmail.com with ESMTPSA id e2sm9746533wrq.56.2021.08.21.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 07:46:28 -0700 (PDT)
Message-ID: <1525a52d4968846b8a95e2db1ed2aa6230d448b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Fix ptest dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 Aug 2021 15:46:25 +0100
In-Reply-To: <CANNYZj8R=FhyEZ9kqnDPb9x-NYYOJOiaFimR2EJN1uoP2wbFsw@mail.gmail.com>
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
	 <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
	 <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com>
	 <db5afb6bf3b352bfc088a0fb91163e695102d14a.camel@linuxfoundation.org>
	 <CANNYZj8R=FhyEZ9kqnDPb9x-NYYOJOiaFimR2EJN1uoP2wbFsw@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2021-08-21 at 14:17 +0200, Alexander Kanavin wrote:
> Then let’s just go for it. 

It isn't that simple. There are member organisations who care about this and
would not be happy at that approach. We're probably talking a load of meetings
and discussion and a need to provide documentation/solutions and debug issues.
There will be a request to do this with a notice period, probably a couple of
years. I suspect a chunk will fall to me as I'm the only person officially able
to have tasks assigned and nobody else will want to do it. I guess that is why I
end up fixing it as there are other things that need the time more urgently.

> I think there are enough examples on how to make gpl3 free images without it,
> and mbition has a full infotainment build based on recent master with no gpl3
> and no meta-gpl2. It’s doable and highly overdue.

That doesn't solve the bash issue. Yes, it works if you can remove any bash
script from your target image.

Cheers,

Richard

