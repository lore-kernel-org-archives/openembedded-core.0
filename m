Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.7725.1603147332221172414
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 15:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XlFrJZ9j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id 13so38384wmf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 15:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=jorbGvFqQ4IuV5EVG/b2/GU5SB/ITbz/ZkCb+kldYUk=;
        b=XlFrJZ9j3bWNECVfb4h+E/D56dXNayz8+8N/Q7bEA6gosra1g00LcH/lvf7xKIfJhq
         q0GHJ9ojwzcvrYAeE2lG6EYoi+L/M46CfSJ6Tths9E2yaAmv+decTPMM6J1yG4LkF4YQ
         4wOtZWPKyBRupGqxhhYi++0DOezCBeOOOwG1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jorbGvFqQ4IuV5EVG/b2/GU5SB/ITbz/ZkCb+kldYUk=;
        b=M+XzH6BaQfCI8h8SGHdGLaaAfeZ3V7MtimeSR9io/UM9emLhVjWoI9IlescV8QkapP
         jp05o9MItjHeja2XctqdFwfp82p0lWYI6u+cGAvdSm++jsyofGZFgBqEJ81yVB6yFUR1
         VJDa/sNVcLAKg25PX7RijkY0iRW9AhgymLjbJsooVztaRCPpzcDH38TvuVfPKM2I9Z5U
         x/FnTd9bIZ4pZkqz1zZK98IQa1R6pf9af8VQrG1ivg2emJXKussgpYiRxnvJRpbT2ITW
         arxlzpawJe3acBkoNgyQ6CtkN8lQCsmnC1SyfzUF/gKF+78zHp8zG74KfDNXsvLpiVtS
         mNmQ==
X-Gm-Message-State: AOAM532+9459ConpGfUVxK51Ax90POm9UM0hhx7J/0UhOrhxOaO9dMi4
	qgEDXryKW+3EaMaaPivLgY/bJw==
X-Google-Smtp-Source: ABdhPJx1CfUqSaNE/ZMLEueflMOy2e3DMAvqam/yGSI6S4o+HBF4OBzBHBDtBotHsDhh250roI3OhA==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr41384wmh.143.1603147330533;
        Mon, 19 Oct 2020 15:42:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f1f8:2967:87fb:6241])
        by smtp.gmail.com with ESMTPSA id o3sm1500565wru.15.2020.10.19.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:42:10 -0700 (PDT)
Message-ID: <e11195f88dad3e69c4816963093bf124636d866d.camel@linuxfoundation.org>
Subject: Re: [PATCH 3/3] qemu: change TLBs number to 64 in 34Kf mips cpu model
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Victor Kamensky <kamensky@cisco.com>, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Steve Sakoman <sakoman@gmail.com>
Date: Mon, 19 Oct 2020 23:42:09 +0100
In-Reply-To: <20201019222146.29078-3-kamensky@cisco.com>
References: <20201019222146.29078-1-kamensky@cisco.com>
	 <20201019222146.29078-3-kamensky@cisco.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 15:21 -0700, Victor Kamensky wrote:
> Replace OE private qemu patch with one that got upstreamed
> and solves the same problem: increase qemumips CI performance
> by increasing number of TLBs in CPU model and reduce need to
> run software TLB refill code.
> 
> Signed-off-by: Victor Kamensky <kamensky@cisco.com>

Thanks, its amazing how simple this is in the end but very worthwhile!

Steve: This one should backport to dunfell without the rest of the
history once it makes master.

Cheers,

Richard


