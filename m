Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.5038.1594360948479058583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 23:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=akJhoYsy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id z2so4651071wrp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 23:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=8Wm+06n6YI5nvra09scsHcRu5oRir/p/D+mzyu7rr58=;
        b=akJhoYsynDP/RP5V8xhnz1aRYeBkzABz6lMniB7SBPgEHFNyr7xxKtHKHo8/bjzdBf
         dqxIKN6IYQzgqN9YNTlpmC2os55fiE50nLXL0SxcHClPStFlgUIgtA2TMJjgk73sEsok
         x4MB57FiUK3+OzD5X9DvhVpLQFV5B3qA3OOZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=8Wm+06n6YI5nvra09scsHcRu5oRir/p/D+mzyu7rr58=;
        b=SSwF0jleFPkmKGNJm4IyLFiTivkbZ1mEDIt8NF8n9DSTbZu4BYEA9af5JZs5msg6dg
         HXB+V6F1DFegnsdoxATvwpMgujzLNqyl+CZboJ2wXDNpKCupcfSB+wuHTIbDQPagx8PD
         Fu/XgnJEsP4F9iyQXdQZ9wHGTHB72hH4T/LTuC+QPPAWrd+jlk1mSJ/wB6smaW8f2LDC
         lpw/RWGONJfqCiNbaR+YuiTP6GMZzezTvbtglUt2JT0sjroGZUW0VAARp57MaEJsDpJQ
         rvsJYu5TlojT+oTlXAH03+oxx+75hlmHQ7EsCqp/5Ka939GztWFAnjb27wE3B1grs8I1
         MfRQ==
X-Gm-Message-State: AOAM532vwzolf7perSEaTFSUtiW6Kb+LCGYYWQHRZX0EWbTHlOI2gmhB
	kwydKU/lqvTC79Ix3OWHGnfaYQ==
X-Google-Smtp-Source: ABdhPJxn0MwykNEBSLYmhjq3EI7leAeNJH3TrM9ncSZYutIHWA3F3pigRZRkT5Yv7TIvGdkfQ4hlQQ==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr36481000wrt.24.1594360946872;
        Thu, 09 Jul 2020 23:02:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v5sm7530981wmh.12.2020.07.09.23.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 23:02:26 -0700 (PDT)
Message-ID: <25e55eae36e535e68c9bea43f0e7a0a80c04c7e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] dpkg: change SRC_URI to take dpkg from git
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2020 07:02:24 +0100
In-Reply-To: <20200710020828.76717-1-changqing.li@windriver.com>
References: 
	<CANNYZj_5-Sd-zww=bL8=_sDSL8P19iPB59w=+6c-tyCwBVY3rQ@mail.gmail.com>
	 <20200710020828.76717-1-changqing.li@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-10 at 10:08 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> tar.xz on original URL have been removed, switch to use git
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc       |  9 ++++++++-
>  meta/recipes-devtools/dpkg/dpkg_1.20.0.bb | 10 +++++++---
>  2 files changed, 15 insertions(+), 4 deletions(-)

The autobuilder didn't like this change :(

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1143

Cheers,

Richard

