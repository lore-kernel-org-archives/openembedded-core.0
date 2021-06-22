Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.10127.1624372230191689007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 07:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yza5bM47;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a13so2136770wrf.10
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=oXg7tQdu69mBthNnu2/UKWnowuj9YjF4F1LWNHg7eho=;
        b=Yza5bM47RK4jfao0ziWcNpQX33Q3nBViurHP1d6RmQW79re39/Bx/sqV+asDc2Uc9P
         peFU2sKdaIvgEL35Gae8UGFl15e5A5XlhiihDsNX9yUTPcgrvBz5w3QjuMPfiX3KpOdD
         +fV0lQa4fEpnHk1jb5IgB8rDERAvFoCLB6vmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=oXg7tQdu69mBthNnu2/UKWnowuj9YjF4F1LWNHg7eho=;
        b=Ubp7BqLDZSRiYAZZ2inbixaY8+0JHiPfqkzKLk16bgApJiUpTL0ddCSjqfo3b7hl0a
         ji/CQVRgvzHjiMb/9Y3iVzCepQha5sX+YDpoMUiFr/KxULPlUq1epZSsqeG74nHSiJn+
         FLPVf+aC/m9HeAiv0UOn1hL/MxHJB9JUduIAFmvy9EqcmPq0fBKy3GgktTtw+GxJIoPg
         uIHCns9Eg3vkQY1uOi94/bDbtO8dFcm8YUHIKCrJ1AgSFfLbRW+kWyYUz5p0qkDl5xvj
         73ce1iHja+b4vGIMH2CBJkC4UNGMKXe+numH5mdCr4PKKNX6VsB+wegc1zvugKIx49a8
         QUyA==
X-Gm-Message-State: AOAM530kqH5muOXdvy/2jNxW2j5nmjBOyKHTt5HRojql2IYjDu4wnzpM
	uj/yEArndOiyAmcveqVJQizj1w==
X-Google-Smtp-Source: ABdhPJxDUpdWKXnv3PZ1OBFg+8oNxVRnxcJexjQtkBLTr9H0281rBuJ+WniNunHnanNq+F8dWKUb1Q==
X-Received: by 2002:adf:f706:: with SMTP id r6mr5065314wrp.280.1624372228680;
        Tue, 22 Jun 2021 07:30:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9ff1:dbee:2c00:96a7? ([2001:8b0:aba:5f3c:9ff1:dbee:2c00:96a7])
        by smtp.gmail.com with ESMTPSA id d15sm22612037wrb.42.2021.06.22.07.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 07:30:28 -0700 (PDT)
Message-ID: <7f71e01f08587aadb7032ab157d5341132b772ca.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] ca-certificates: revert mktemp patch in update-ca-certificates script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Date: Tue, 22 Jun 2021 15:30:25 +0100
In-Reply-To: <20210622121531.13424-1-andrej.valek@siemens.com>
References: <20210622121531.13424-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-22 at 14:15 +0200, Andrej Valek wrote:
> - revert f3eabbb5c15fb55ae3d46b2377c09bb58226d965
> - mktemp from busybox does not support '--tmpdir' option
> - coreutils is usually not possible to use because of 'GPLv3+' LICENSE

I suspect the better long term solution here is to submit a patch to add 
--tmpdir to busybox since we're likely to lose deprecated options from 
coreutils and upstream already moved to the non-deprecated options.

Cheers,

Richard

