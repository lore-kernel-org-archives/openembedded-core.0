Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.8117.1620220894404089183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 06:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fiAnBSVr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t18so1829448wry.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 06:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=VToYHj6uoxCnMQN+dLnn2kSu6hRM52sVGuEaNAIPgc0=;
        b=fiAnBSVrijwftr+t+oKAbPnFsKmgA2zu7PYvGaM/X/CtrbdJmYzk/xAx9AsFIfbhXr
         9QRWN0/4QuvvkZNee/jDpMsSTaXzX0Mohwwi4jkEI3NqaEkddIymGtG3vEsfEOybNEnV
         x+dvk7UiX5kQBTqVoYEbX3+C9JUULCfyUOubI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VToYHj6uoxCnMQN+dLnn2kSu6hRM52sVGuEaNAIPgc0=;
        b=fPh29rCbLhtz14igOW/DMfVKsiZYtK6a/AHLTuK6XN3eshjocVuDfk/g4uzjShZ1fI
         5rI+xjO4+VpqMRkjNoePgHnaE4kZ9/i3amEx/h8udTym2HJBG86+yHJCYQ3joMSpB4sm
         pZwmK3rfz0UFWp1+GV7gxcZUC0l0dBTFGu09M/YFnkFbSJjgAKKj+R0K85woLw6sXRJU
         j+QRQk17XClX+/Z0/RVWhMn9tJJZHXeD2xHB5p0Su8UaaxmoRN7vAYyaA9N1+JX6hrDM
         Yox6HwY1rFaHOyANd33eWBd67nsDNwl8seVYaSFOTtIyCfdF7wuwHuXDROWtgzECOsGe
         WqkQ==
X-Gm-Message-State: AOAM531GxfqjFpS+nP/wQ8qEvPVoAKqp72T7hUMGtz91TNiCG8ncxtIh
	wJyOyYoWCr2//nXDY3Nqh29Nzw==
X-Google-Smtp-Source: ABdhPJzp+scBBzt1GTNqg9sSvS/e9pBG3azwUGmlFQC1Z2hGfPmUg+IxBF59q6NRlGB0aA83z9dScA==
X-Received: by 2002:a5d:4521:: with SMTP id j1mr31643789wra.116.1620220892862;
        Wed, 05 May 2021 06:21:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:8041:e424:9226:62e7? ([2001:8b0:aba:5f3c:8041:e424:9226:62e7])
        by smtp.gmail.com with ESMTPSA id c8sm19456589wrx.4.2021.05.05.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 06:21:32 -0700 (PDT)
Message-ID: <94f2fcf456e059128fc7b4804a52b4c21ee9dfd6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [hardknott][PATCH] Binutils: Fix CVE-2021-20197
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vinay Kumar <vinay.m.engg@gmail.com>, Steve Sakoman <steve@sakoman.com>,
  "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: vinay.kumar@blackfigtech.com, Randy MacLeod <rwmacleod@gmail.com>, umesh
 kalappa0 <umesh.kalappa0@gmail.com>, Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 05 May 2021 14:21:29 +0100
In-Reply-To: <CANUMPcVfOziaV8Y3OW_XR3-Ysyjor6Ci8bA8y8kU2HYyvjSojQ@mail.gmail.com>
References: <20210429113046.172473-1-vinay.m.engg@gmail.com>
	 <CANUMPcVfOziaV8Y3OW_XR3-Ysyjor6Ci8bA8y8kU2HYyvjSojQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-05-05 at 17:02 +0530, Vinay Kumar wrote:
> Hi Steve,
> 
> Any update on considering this patch in the "hardknott" branch ?

Anuj is maintaining hardknott, not Steve. Also, doesn't this patch
need to be applied to master first before we can backport it?

Cheers,

RIchard

