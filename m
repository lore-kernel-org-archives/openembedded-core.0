Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.7275.1596634315323885891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 06:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YRFCLPMk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id c15so4494553wrs.11
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 06:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3o4zySesyW5IDDDySP+NcDi0gTPyv+qaq7XNvBrcSS0=;
        b=YRFCLPMkhl4xMxim+014pVKPfgFnzlk9uXC+k+BZW4o1Ht4BN3atxgahAwbj2llKFr
         xj67YNMcCqh4VuSli8YG44Vi6SLs7+gQYUlL6Zfdc+fKiNs9TRfesgEcCDDCNHdyWnHz
         CqTPp2CY8z9oR7CJ/Vjs4Re1Er0ggKF8/bPW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3o4zySesyW5IDDDySP+NcDi0gTPyv+qaq7XNvBrcSS0=;
        b=mWFq4g6tyNIqKsJho2F2YyqKkFBOoXf/Hx957xlHIn0Rnt9K6p8uuZFAVyhgNlqRBe
         qd2Q7gjv3LOeTAjtCReJCoZoh6vBvbGkWgoGY9aNnsRptoT/HaFOk6rlaWayUK54ELWs
         nB2KFJ3+6T78D7pcLetFfDWBHw10E2KfzdFYzNtBXYCi/NPlXh60ofgFUhsLRqZ88azA
         NSCIoUYsEcvAvgEqo39I3b1TGvMS1jFEd4V6552o9frOK9ZuTIgwGzFkTh9PHgQUpbfR
         4uzwcKkREg05VnPgbc41mNMbKluy8PwQJHjN2J5ndRInxDX4/zqDvjGnJuWsc6tgvyfl
         9d4Q==
X-Gm-Message-State: AOAM531LwbA1lch+siPwxsHr/1ObQhjyZP4gebf1U5gw4P+rlCkrBWbT
	p3Ea9Fo6fzS48u/Wf2F9zQtMFw==
X-Google-Smtp-Source: ABdhPJwTx5LNa1wJMhFd2eaKsSeJBMXY2VHCnpuRYMMsXrYKLE2biyYfrRLF2iIDrV3GqvASMmplKw==
X-Received: by 2002:adf:a19e:: with SMTP id u30mr2776820wru.274.1596634313680;
        Wed, 05 Aug 2020 06:31:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id a3sm2749115wme.34.2020.08.05.06.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:31:53 -0700 (PDT)
Message-ID: <41aab2e8335492a1e8aed97ee75219a3461504b0.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] allarch: Fix wrong dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Daniel Gomez <daniel@qtec.com>, openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 14:31:52 +0100
In-Reply-To: <20200805132224.616205-1-daniel@qtec.com>
References: <20200805132224.616205-1-daniel@qtec.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 15:22 +0200, Daniel Gomez wrote:
> In all these cases, allarch is used but the package dependencies are not
> allarch. It generates a conflict when the same package is built for different
> MACHINES at the same time.
> 
> Here a build error for the ttf-ubuntu-font-family in a multiconfig enviroment:

This is on the wrong mailing list. I also thought there was code
somewhere to remove font dependencies from changing the task
signatures?

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/layer.conf

see the lines like:

liberation-fonts->fontconfig \
cantarell-fonts->fontconfig \

Perhaps meta-oe has some of those missing?

Cheers,

Richard

