Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.41.1627682800429646574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 15:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BVJi+ctK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id b13so2189857wrs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rJqZ09cOAG3k6JDxMyFxiuoCrdtWvZzw6i0X0ToanWQ=;
        b=BVJi+ctKg7s1mqKWZ3jG1QCx0ZWCrjRI7xril8o0NzR9OaGu+piOOf+QCy/gQyELA/
         mPItNpNJTIUmzgrQSl3TdZI9PQqQ9prFSd9AMBg4+Qvh5nGVhG5ofxgzoOPbMQO9ACO3
         2dkcfkA8wPyqo3blnpvBjyi+G0b5IXiEc+gyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rJqZ09cOAG3k6JDxMyFxiuoCrdtWvZzw6i0X0ToanWQ=;
        b=bSECYYVsr5wF/iTUtrY1KikiokfHKS/NZt9LUyXe8cbyuU6si8lLDlVQZxXk+AnyLx
         ILap/mtNEvSrkOYevxxlja0VJoR+2SBQl6X7T5nYLzMN2x4jLtklvEYeriELMvRgBgWN
         TDuce9CbhFOqDKDtk4DSk1UrsJ3vEUazggDeG4d7Bc46RRKVBJMSl7dWUNq3iiraKr1Z
         iQ8FbWjlft1A2noZmcOLSMHD0DR84zw4kdQ4DKv6JxVgh2pJ1H8js8HJKd1qqOU0hXml
         ALiIsaHIVotEVUs93kOUCEggcNQNYivTiQs9YCp/UReOb0/icNaEuUBRDW6zUmOgELwL
         ndRA==
X-Gm-Message-State: AOAM530oJTk/tlBDVDYzGhwa98uRo9TuIOaO5gczRdPCL24vqdUbsOpx
	sFOfa1Iw2LR5T5zEsc33ZpiJLg==
X-Google-Smtp-Source: ABdhPJyE9+uvqNsafIXpVJ916Jx7+EdkDVmjlIJCVlvhC50X3a6+un5RBQUIuFDZro8TF7xOeZovbw==
X-Received: by 2002:adf:d194:: with SMTP id v20mr5304853wrc.126.1627682798928;
        Fri, 30 Jul 2021 15:06:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:c6ef:507a:8269:d07b? ([2001:8b0:aba:5f3c:c6ef:507a:8269:d07b])
        by smtp.gmail.com with ESMTPSA id l2sm2743116wmq.0.2021.07.30.15.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 15:06:38 -0700 (PDT)
Message-ID: <2151aa3f6f971841f94e3457cb5c733ca3518ee4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc-runtime: do_check should execute before do_build
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>, bkylerussell@gmail.com
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Jul 2021 23:06:37 +0100
In-Reply-To: <CABcZANk3YS-mnR8d0ScZA3E4coCa5Zze0UAueJxQjpwO1L1x6A@mail.gmail.com>
References: <20210730190357.369782-1-bkylerussell@gmail.com>
	 <CABcZANk3YS-mnR8d0ScZA3E4coCa5Zze0UAueJxQjpwO1L1x6A@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-07-30 at 14:16 -0700, Christopher Larson wrote:
> This will result in a behavior change, making it so `bitbake gcc-runtime` will
> run the check task. Are there implications to this?

We definitely do not want to do that. This is used to run the testsuite which
isn't part of a normal build.

Cheers,

Richard

