Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.14627.1613594777069986395
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 12:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cb8OhpS5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v15so18809750wrx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 12:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UhA+dk/XQ+yWqV++0qkPyJ13oSe7CpBpKI+zswBmOus=;
        b=cb8OhpS55BQJEEr9O/S8pDDlfuKaEkLqHc/x+OzLMHIqVcvSXXNm/a6f0RouaqqhmH
         0xTYseSv4CZyfEWBXXK2VpXYhD37S0OtemEIoEgLhpeJcwkyOp4KIqElZpx6d0JLgUfd
         8HTPzG+9Sd+Xwt9MH4v7tWDriJ13gZFZ2He+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UhA+dk/XQ+yWqV++0qkPyJ13oSe7CpBpKI+zswBmOus=;
        b=nH9WGZqN3aHQZSDiMiPWmz2YqeSSWJLGzKURNZ8SHKn1clbK0vq9NjjbLvDo0wywOp
         sss2mO2+Ev/CHTlUkLVuChC1C8uCUAzpL1SjtjQnFuiJvDFmx+4rNHFv0m4JiBgiqZiN
         3zUlRUb6lZjkpU4duS0sfrtVHwdJN7u3f83fi25Ez9oI1inSNfwI8bW+bDXdzmsP3zc4
         46DGBq/PZ9zaVXeu2h/G+98nECIsTXzhdqX32KN6X6WpcjOsTU+Xr0KC2Z6DG76VNtwO
         USk1qsrm486GekqPw1oa5/HocXfw49EG08Q+ZzAcAKMlvj9aDW6Sv8nDuxd+x6my7ogV
         iK1g==
X-Gm-Message-State: AOAM533dzvJkyI5UaOqrr4Y+8SVgMr4KDiiRM5GSsgSHuQraIZ9UHaKz
	/iNY1hUZ6do2Rr7ZDfsxqJsAsQ==
X-Google-Smtp-Source: ABdhPJwA09NAvleVV99bFXN7YiTjTACYY0v2U3JT3EWuGCgYim4mgW94NDG4Gagzm0gH4bIyNxVKPA==
X-Received: by 2002:adf:c54a:: with SMTP id s10mr990333wrf.58.1613594775492;
        Wed, 17 Feb 2021 12:46:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id k15sm4568993wmj.6.2021.02.17.12.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:46:15 -0800 (PST)
Message-ID: <cc0164c7eb45418117aca6b948116acc941ba464.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Refresh mmap fixes patch status/content
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2021 20:46:13 +0000
In-Reply-To: <CAMKF1spnShJ96Xo+Laj4-aCUEXizKWAMkgO+P1Fq=kTmLX2A0A@mail.gmail.com>
References: <20210216190600.2038009-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1spnShJ96Xo+Laj4-aCUEXizKWAMkgO+P1Fq=kTmLX2A0A@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 10:05 -0800, Khem Raj wrote:
> I am seeing musl builds are hung in qemu now, I suspect this change is
> causing it.

Are you using master or a master-next? I did revert this patch in one of 
the -nexts just to test the bug reproduced ok. I did test the revised 
patch with the change and things seemed ok.

Cheers,

Richard

