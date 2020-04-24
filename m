Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.4684.1587732004426986663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2020 05:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I+PH/sq9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x17so9873374wrt.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2020 05:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3uyEg4JF04NDaBD1OuQYwgZJ2kbI9KVpKXXuE9c7hs0=;
        b=I+PH/sq9A2fxmZVi85aBov1gF1fS/7SjGCVjNUI+JCT2Jjxc5ayVKdt1QzUOAWL6Bw
         WEOA9dE4ax4cLKl5mjTdA+tiQsdk1X50hM78JLRTOyue1SzUoPoWtHSfeSlJZnsHcCqG
         lKkD2dICdGFv+1lLVpaBvBIHRV9pgccjPoEIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3uyEg4JF04NDaBD1OuQYwgZJ2kbI9KVpKXXuE9c7hs0=;
        b=oGpahbFGEOi2wkzOxt8rL0mdF0puvnLYXLd5V8vZk0TNCk1YrmGptUFwKgEHkRhgPL
         TZFDpvA3+YbLYZv5JPp+lonHK4WY87DdJz6cVu3NOiu7NFeXyn9uGyA/OhBLoOdDSCBS
         DXICRH3BPFaQ1j8WMdt0Z69nbrSKuxMLjm6LaBDRJvpQ4epIXyGLHakyRTSvMMB3T76N
         XBFvbMvcgqF/cWP5lRA1+BHYGlyV+gI3SIS3am1W70dkdQUOQtvJ4FuKyyIFNSjM8avu
         cA0zxdqTQsUElk2ph6zwn7OZt6o4ZEYIlY0T1bhtmLp4HQzJsuow8jzCtnIip3jyLozs
         XUZg==
X-Gm-Message-State: AGi0PuY2S60635a14Xi/vwdnjLNicfTKMIKkZnnDmxB3RTgMDH9sT0Ib
	yTVCGVkPsWhq5lAxP3xvAf2ldA==
X-Google-Smtp-Source: APiQypIyarPLJIISo+K3ibqZBqDpqaJQAJQHUP6NY9d8dJizontWjZ/zZoLX5e2GWwc0N48ydWfC5Q==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr10725701wrc.20.1587732002898;
        Fri, 24 Apr 2020 05:40:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b66sm2834443wmh.12.2020.04.24.05.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 05:40:02 -0700 (PDT)
Message-ID: <6eb605a6c0ca7eb9a01a253da5ff1618a694da37.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] python3-pbr: change shebang to python3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Apr 2020 13:40:00 +0100
In-Reply-To: <20200424010941.191578-1-changqing.li@windriver.com>
References: <20200424010941.191578-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-24 at 09:09 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> we have offcially dropped python2, so it is possible
> that our code run on python3 only host, so change
> shebang to python3 to avoid error like:
> python: command not found

I worry this is going to be the start of a huge pile or unstreamable
patches. We may have to provide "python" on target but that probably is
a policy decision we should discuss.

Cheers,

Richard

