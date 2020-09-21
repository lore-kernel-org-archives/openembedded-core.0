Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.49673.1600717572694975240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 12:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IMAeB/tU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id o5so14048216wrn.13
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 12:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tKnZQ04Lnatq2qNUeh9MkJuXC9Ag19IU5/4trbMLIW0=;
        b=IMAeB/tUs0m3n482MH3q5Qz7vRuNOiuh2Qcru9qjGMRCrWOF+5NihVKjQ7Anubol9X
         Gy6sDoi1TgFJMTS0KP02FsQWeINN2s1DiQmU6AKcvVEZhV9YLT2/c0YyUw8HOtzKTptH
         NMsKh5GVZBHZrvSwxTcDmYDmIx2JXVqJkWcnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tKnZQ04Lnatq2qNUeh9MkJuXC9Ag19IU5/4trbMLIW0=;
        b=THq2yPtfr9n4y4glFLsyD4iAG5uD6YhvrqjYMYhrWg9mnPCnV4ksB7iebIJTcH95qe
         8/xRPvmHwB0gLroTzAoa/Xkre27VIBJQFVT9PvV6IUHWZHvPMPPwd9WfACVAkCeVjN9B
         2jSPXBQqSkEEMsGMIW897zd94/7vN6ZANdoNRj9rEFXV+aeLX4Qr9UMMOQGJjJzwNfB7
         KVzR9E5biK8axipzWZgq2vKFAc7A44RniGw4lIHnvd/sQgQ958VEahb1Q8u3EyQibtz7
         gBQva12C3UhK/h8BSBEYazZOVNgBkBcpj2ndQdvVgZYjC45O1L/wcn/lo/7tsAuz1X6F
         YCAA==
X-Gm-Message-State: AOAM530rIOjd1QfPF1wu0BT8XG+c8iBslMgxMZsW7StEnHA9DeOKND0Q
	nUwGIdFHWLgreMULYc7AyHiLeQ==
X-Google-Smtp-Source: ABdhPJz4LTuDEk8UZV1ZfatMnT7VE9k0OI3fdL9hJRWkastCIWXVgKmVbFO/XTMe0vv+qqvzi6eJTw==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr1403466wra.344.1600717570949;
        Mon, 21 Sep 2020 12:46:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.c.9.a.6.a.b.7.4.d.7.f.b.8.3.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:38bf:7d47:ba6a:9c04])
        by smtp.gmail.com with ESMTPSA id f14sm23912801wrt.53.2020.09.21.12.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 12:46:10 -0700 (PDT)
Message-ID: <1c41fc0d0f0928baeacb628812cafd66de745b75.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 8/8] New systemtap.bb class, and systemtap-demo.bb to illustrate it.
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yann Dirson <yann.dirson@blade-group.com>, 
	openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Date: Mon, 21 Sep 2020 20:46:08 +0100
In-Reply-To: <20200921141544.3145189-9-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
	 <20200921141544.3145189-9-yann@blade-group.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-21 at 16:15 +0200, Yann Dirson wrote:
> From: Yann Dirson <yann@blade-group.com>
> 
> ---
>  meta/classes/systemtap.bbclass                | 74 +++++++++++++++++++
>  .../systemtap/systemtap-demo_git.bb           | 71 ++++++++++++++++++
>  2 files changed, 145 insertions(+)
>  create mode 100644 meta/classes/systemtap.bbclass
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap-demo_git.bb

I'm afraid this patch is going to throw warnings all over the
autobuilder, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2488

(and there will be more).

We are trying to ensure all warnings are solved so that any that do
show are real issues and this patch would significantly distract from
that.

I'm also wary that we're now in feature freeze for release so perhaps
these changes should wait until 3.3?

Cheers,

Richard

