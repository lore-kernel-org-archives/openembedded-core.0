Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.34115.1620050798859441945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 07:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bi6ydR77;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so3594249wmb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9fjXpGYQH+3ev2F18b/ZJh4xEyaRbu2v2RbHc2vAIpI=;
        b=bi6ydR77bFEJjRnygsT3sOyLSL/k7aDQsgOpzkIq9aahoOma3mk0weqvuhc321Ao19
         nyshKNgrtGuCd5xzihRanqMYC2o+uxj/oTxlC08mz+enJfYc8HZ31Uku10d55VYxUwfP
         yQRnXOKnf3p047d2csbRq8UsVdq4fyr6FxUPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9fjXpGYQH+3ev2F18b/ZJh4xEyaRbu2v2RbHc2vAIpI=;
        b=aCTfEltYymTjsoiB+/6n3dbrRDOWUrvjyraihKg0M2fEz3HK/l89SLDed9PJO4ePz2
         Cs6prcsJsireCJsdFPyi48q7SJA7dv9VWM52C8V8Lp8+DJdRLMsMzxYjw927JfNTqD6Z
         Oc+H7h354XXeeqgUQBX2ppAPjgXCBDBVZ0HrH2PdweqttKDL2oF0oGnw/qha5yD2xIP+
         1d2kY5hAE6l/GvylJsEf8Yi8DqHZzIRKaetayBHO7NDkNhIAzG1ERUWAjjEgi6t7X9wA
         Lh9HoJ3TDsIVAgnn6f1sxFsARLSUbTUEpXm2y3kS7da1wQqdGFYPDfk6LoYqMoxNHBK8
         owCg==
X-Gm-Message-State: AOAM5311jDt/5n3biNkDUNmC0pNP/zK2kc3F5fpoCqJu7pZSBw9iCyRn
	1p1AcxJ1QQEZAWYuj+xp9dkftA==
X-Google-Smtp-Source: ABdhPJyDOjmmiSK1r5/puR+QwaJCKh1YyMGyl2/ASR/BBgN/jWcHvnRI/9n46xXhpIMc8Yih5iM+SQ==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr33064117wmq.85.1620050797345;
        Mon, 03 May 2021 07:06:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2abe:bb29:590f:e028? ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id k10sm72869wmf.0.2021.05.03.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 07:06:36 -0700 (PDT)
Message-ID: <9fa68475197d0b0d6c0dfa250fc433e101d9ed9a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] gstreamer1.0: update ptest patch
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 03 May 2021 15:06:33 +0100
In-Reply-To: <CANPvuRnX=tSwOzFn3Vkx6JRg5rigu-Gy86SFpsXY5COLDpDvgQ@mail.gmail.com>
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
	 <167B517A343BA3A6.25516@lists.openembedded.org>
	 <CANPvuRnX=tSwOzFn3Vkx6JRg5rigu-Gy86SFpsXY5COLDpDvgQ@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-05-03 at 09:52 +0100, Jose Quaresma wrote:
> I have a question regarding the patches submission, what is the most
> appropriate option to submit them ?
> 
> 1 - send all patches as it is submitted upstream
> 2 - squash all patches it in single one

I think you'd done 1) and that seemed reasonable to me? It makes sense
to have the separate changes identified.

Cheers,

Richard

