Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.31391.1629151159698797814
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 14:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HY7Mj0cR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id x10so19305247wrt.8
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=czpYSoAV0axJJzm7wAwvNZkACdkJPqjSZrHvozXA1VI=;
        b=HY7Mj0cRoAzt9WNDLOw4a4b7K1FQVqCuOZYzDkRGpblGla1TlGs8s6mnuJRb1gteTv
         uTcQ4WnuhWjJ2CZpVpwT6pF4OXVZ+xy6j5tyUX5R+DyqxUFmAPHYb9EKGTvE3sWND2Jy
         oJRnXM+aZ0OawJ/S+0Y4c/+TpafJvqmtczG98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=czpYSoAV0axJJzm7wAwvNZkACdkJPqjSZrHvozXA1VI=;
        b=hnvFRvRxpTCiGQxWbN7vnoIt4ClIMRBtYkcpNohAKx2bHpSsDU6OTg5NwPHLFpHGzP
         Yt+WfEcp+HKSu2OV3u7Fg0Vk2uqQgCULzKoijTWi8Jq8D/dnEcnxbHRjDM6EOBvcjWq+
         FRiYolulfDquSyhQ8/fe8blg2/7P8LokYXJCqgC/hc+0/z1BDCvCpZ2cyYqY/cgkPrsM
         t1SbZvXaQEa5HyLny98ozTH5T/tFSiF1SjJnvrk0eO9ZQHbACVVu6N2kaIGbPCV/nsfR
         bEWwLlTb7DTJeju937+etXZhXHBZZPSN6Qwq0wLmbyjfgA2+UOjOLky7kPC4vpVLbyf7
         gW0Q==
X-Gm-Message-State: AOAM530Vpt2Sj7tdfTIWXUKlSVV5K4QYPOiUyCQX8UtCOPRgjkXJCx3W
	uShTXZH+WL7uawsK/EGAbuhjVw==
X-Google-Smtp-Source: ABdhPJyms0wUoZFZTFmXciKqF8zGOqs3eqixULm5phbdSQ3xXbW/hO/8NHhjQfrur+tVbZqdifdXLQ==
X-Received: by 2002:adf:f044:: with SMTP id t4mr224295wro.352.1629151158206;
        Mon, 16 Aug 2021 14:59:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f791:56b8:5572:9d45? ([2001:8b0:aba:5f3c:f791:56b8:5572:9d45])
        by smtp.gmail.com with ESMTPSA id w29sm67920wra.88.2021.08.16.14.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:59:18 -0700 (PDT)
Message-ID: <3fd323f691fe9f1a8786e811bf3253fe9aaebba1.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] blktrace: change shebangs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Joe Slater
	 <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Randy MacLeod
	 <randy.macleod@windriver.com>
Date: Mon, 16 Aug 2021 22:59:14 +0100
In-Reply-To: <CANNYZj9xLN5vDQ5vgHk1S7k8PfX_zM1+ThzfVF+Yw+Y4aQrpMA@mail.gmail.com>
References: <20210816182012.26458-1-joe.slater@windriver.com>
	 <CANNYZj9xLN5vDQ5vgHk1S7k8PfX_zM1+ThzfVF+Yw+Y4aQrpMA@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-08-16 at 20:40 +0200, Alexander Kanavin wrote:
> On Mon, 16 Aug 2021 at 20:20, Joe Slater <joe.slater@windriver.com> wrote:
> > +blktrace can use either python2 or python3, but we really want
> > +python3, so modify the shebangs.
> > +
> > +Upstream-Status: pending
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com.
> > 
> 
> 
> Please submit upstream first. Signed-off-by is incorrectly written, 
> needs to be added by git preferably. 'Pending' needs to be capitalized 
> (but please submit upstream first).

I very much doubt upstream will want to change "python" -> "python3" as it
is a distro thing. It is frustrating it isn't configurable. I think in most
other cases we sed this into scripts but that has pros and cons too rather
than a patch we have to carry...

Cheers,

Richard

