Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.9544.1629544423467977525
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Aug 2021 04:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JPpgvUGh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id e5so1462541wrp.8
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Aug 2021 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=vr9MAEfmfai+0WPMmqzC3PKVgdQuQkUN0wcd04a6J6o=;
        b=JPpgvUGhHkXSaa048ogpDj275uWHeYE24OyHaVK0msUtwfzEID0V92SN5Q97Cl0c5P
         v+1NvUKM+CC8OU0bqj7X5zWOiqLNoCMmhAHi0M4zlimMuEfAsUPeX5FAI8S3FW79zbo1
         jnT4TbjQf1mg3IlLQS0aDag027J6+thHdCXXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=vr9MAEfmfai+0WPMmqzC3PKVgdQuQkUN0wcd04a6J6o=;
        b=l0PDjUqw5fzuViQIgz17ToTM05oWyoB0UQfUi6E9XjbZDJesHazcuyIbV9TQO9b9MB
         ZvTHlS9n18kAyWAYWUIpPZ9OhnzaGGHXSczAzVObO+ERVXO52w8pIyRymVpeJbCErcDs
         sTTyCA4t3pCtjWGIJCpqKqz67h/wkt812U+sT5WUA1/uXWu+pr37roVN6hgrinFpgLx+
         IfM0zuI047E1Xu4VVqf9FlnZ0xXd2YeY1Yl7BHeclBrfI7FSICG8iaRX9V5R1gmZZWE/
         xsXGFM1mcBmOpeCNzUfmIAFsVFiPydqZcXydXzazdH/vamiBG7+QpvH0RlmejN8Ofz5I
         UUbw==
X-Gm-Message-State: AOAM5324QOS5Ire0iNNvxby6w58iU9YDO67WP68cSCx5+XhW4HXg5pR6
	cLeFaZUE+k7C2yV7McU6T1exUg==
X-Google-Smtp-Source: ABdhPJx8SCL9C9M/wHTQhReC/7Y5oKFNT7c3vTrSPF9P4dIHLY1TVBt1QW+dFeEqQgTxfvFplalITQ==
X-Received: by 2002:adf:eb4a:: with SMTP id u10mr3393331wrn.11.1629544421817;
        Sat, 21 Aug 2021 04:13:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:789f:44c2:e113:215? ([2001:8b0:aba:5f3c:789f:44c2:e113:215])
        by smtp.gmail.com with ESMTPSA id x6sm1163982wrp.49.2021.08.21.04.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 04:13:41 -0700 (PDT)
Message-ID: <db5afb6bf3b352bfc088a0fb91163e695102d14a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Fix ptest dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Sat, 21 Aug 2021 12:13:38 +0100
In-Reply-To: <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com>
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org>
	 <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
	 <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-08-20 at 15:48 +0200, Alexander Kanavin wrote:
> I think this is breaking meta-gpl2 somehow?
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3855

Yes, there are also fixes pending for it which have now merged.

I'm getting more than a little jaded fixing that layer as I really dislike what
it is doing and believe it does need to be dropped. The biggest problem is the
bash shell, if we had a solution for that I think the rest can be managed.

Cheers,

Richard

