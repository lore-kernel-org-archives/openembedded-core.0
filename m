Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.18320.1587076522597059050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2020 15:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GT3l/keh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id f13so539704wrm.13
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2020 15:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7AKaM9yVYIl+Po/SlVOrxiJOa/A+YOeO34r9pCpWlP8=;
        b=GT3l/keh1Ywn5o+CBHheH9HDDmJjFFe6w9kxb8//hqSK7vXLxiODiJxFYVY2DAfRbU
         qD1oCJghKWLXsvHkLhKsPALp4T6E9GCMxro1CG4bDlLvnk+Dh4nWqssCpSEnOenWbtRz
         lu+a+kSNGAAETaMI6ycxFas2gxi98Sz8OevyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7AKaM9yVYIl+Po/SlVOrxiJOa/A+YOeO34r9pCpWlP8=;
        b=svNaLK0DJYqLnXQo0LrRL/rY4KxgBPiW4igweqPs3ZlAZ3MEOBB4gkPSR1I3ALWYTM
         1F9nOX+OMTtS0/0oegBd6V4CWJbqBremEYp0oY4DdnM5LbDuLSaqCDmWynE3+3xguR93
         Y91aIS6lj+2WzzPLiiRt2fx3gWBHJ07YnBH9Ql7wd4VmDlwwMR1pAEa6B9Qsjtfked8T
         Bq2t+LJ4Qyj8853+/Jr2O0in8EJbGSVvrMmlPzAydG7xclPAlaJOV327xvfU7FqabPgK
         kVJ+fE0TpUdxzfrDJZwJ+5LNSf06t8fQ8nXHbnUD66KAB4qWRwhYvSCxBzwKwO0e/WlY
         XrgQ==
X-Gm-Message-State: AGi0PuYHIQWZTvztPtHVOu2G3nVx4gg3iPmFhwoOilJY2QarE7OR9HGY
	21T1lwTW1vGXpqK7+X1EC6wISQ==
X-Google-Smtp-Source: APiQypIJOwZcnhtKVuMBSr1KEtNpnUPb7GafLVlg+jfn9pTPNXOmXMSPBY1WuAPHKdTNZ8EAqzHEJA==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr524634wrj.372.1587076521147;
        Thu, 16 Apr 2020 15:35:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a24sm5169294wmb.24.2020.04.16.15.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 15:35:20 -0700 (PDT)
Message-ID: <e8c932bc18840d681befb3606076563ea5fbde84.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/weston: Enhance weston tests
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Apr 2020 23:35:19 +0100
In-Reply-To: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1586767753-29252-1-git-send-email-ee.peng.yeoh@intel.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-04-13 at 16:49 +0800, Yeoh Ee Peng wrote:
> Existing weston test available make sure that a process
> for weston-desktop-shell exist when image boot up.
> 
> Enhance weston tests by:
>  - execute weston-info to make sure weston interface(s)
>    are initialized
>  - execute weston and make sure it can initialize a
>    new wayland compositor
> 
> [YOCTO# 10690]
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

I think this fails under testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1785

Cheers,

Richard

