Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.966.1601561561133353984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2020 07:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OXGDVWN4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e2so3283758wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2020 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nKiamzua9ewCwA1xU9p1VspVRb4yloN9U+x3Y8JbwdM=;
        b=OXGDVWN499swwrwdCl6OctOu7g6Ad1qD4fhU2k4ilZrEp6QIEcWgtSYFzSn7mrK+k6
         2wR1/qAWxo+P4kP/TVlFUZWmodVtEgo12a/VxUY7g1poKDrbTtWkQaqmIrRjGiTtQCfD
         2+cxOwWv6r/tbR2hQ3f9/QYy/cwVpizWVpQ8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nKiamzua9ewCwA1xU9p1VspVRb4yloN9U+x3Y8JbwdM=;
        b=mXgynLwyBfh7uRVShyHYb5mPCYpcy7bPRxagQ0f4oS4lE8djp74EnnC+FvjR32vfNy
         j45PrGwFY9RQzIGrWKdQqb1aKUPBn3mLq2o2FVqsO7InSuS5hOyRFAAVcizbCQev5qSc
         grHpbpOKcLYwPkk68aM1o9xIAVIukDlvWK4+GOMb42xllZEDCHKfEJs5cg2J41yeYRLJ
         bZXummKXxFPrL5QDAAPA1h8l/1lX1rH88tdcpU/YJGwWNnDq4b631Lv9ajOpJrbdvP44
         YAgacVD/Kpi9ASbd2x4fOD51rBe0KKd5XZst9+DztgKPP1+CQBvPiVX+CaZyU8YESfvf
         +prw==
X-Gm-Message-State: AOAM531sTUuWD4iA4iY9RR4pvCyIKSsq8PEAq4xY0hJFv3Ch0OsBN1B7
	JrgWdr3LKsSDwuZpZOtgkpuJGw==
X-Google-Smtp-Source: ABdhPJzIHYQW76yWck5ky+rhXOHNCXriZEB4q7sjTh9yrjDYyAmrV8Po2+1INuHs4fjJFPriDZ7vdA==
X-Received: by 2002:a05:600c:2283:: with SMTP id 3mr195372wmf.37.1601561559502;
        Thu, 01 Oct 2020 07:12:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.f.c.3.4.0.2.3.2.2.3.7.e.3.c.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:9c3e:7322:3204:3cf7])
        by smtp.gmail.com with ESMTPSA id n66sm120741wmb.35.2020.10.01.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 07:12:38 -0700 (PDT)
Message-ID: <2e70af274150b6f2749ead2c567af02c807c42c1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemuboot: move QB_MEM to default in qemuboot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, brett.warren@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Oct 2020 15:12:35 +0100
In-Reply-To: <CANNYZj9BAUa_JHrUMci_kMOje1_7hsH7pBENW+9TG8u_xVRWtg@mail.gmail.com>
References: <Po14.1601556389979380134.H3Ii@lists.openembedded.org>
	 <CANNYZj9BAUa_JHrUMci_kMOje1_7hsH7pBENW+9TG8u_xVRWtg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-10-01 at 14:50 +0200, Alexander Kanavin wrote:
> I believe something similar was previously rejected on the grounds
> that the need for 512M of RAM is not about opengl in general, it's
> about Xorg failing to start when using glamor unless there's at least
> 512M. Otherwise, we should continue to verify images with just 256M.
> 
> Therefore it is image specific.

Right, it makes no sense for example to need/want 512MB for core-image-
minimal.

Cheers,

Richard

