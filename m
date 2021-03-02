Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.2029.1614724588034034144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Mar 2021 14:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c3x2BtwK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id l22so3541688wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Mar 2021 14:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NWL1y1GxBG5qyPY8nh57ACc469FmNQlzOQfkYnfJpqs=;
        b=c3x2BtwKQj1uSyA070IHzdoYBoRInueKJQrqOFr6IOaimlztdgvxsn8XQdLbRMjTKp
         2UBuxD3QuvDz7WSQHrZUP5BBMrMVlATLgplZ4i4q4OlSId0Yn6Gb2kxLmd5CIPCaEvI1
         kyxbbertFwqv1/DzMuxrPBm3s7pg/40TT+cBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NWL1y1GxBG5qyPY8nh57ACc469FmNQlzOQfkYnfJpqs=;
        b=XwX8aTQIbilCjojW8R9fRcT24M37D0/6W7u5Ibzuu2c7z/XA+woqH1oxl54nSf33vN
         z2k5a6oW299jvSjPdxhk2dV8uWVPtDNk/Y4ug+B16LCgPFNS84ljoJMaVLq1JFTg4FZL
         nGcwLcY+LwkJGCpUy65yvQpUYWkiZFECFurUvi+hDUorxA7rGVwVK668zBJYsFvkvlgK
         gEZ9fxFKa0jit12v7N8OGCCZH088mqh3+b2c8KI8P+zvnLmQ1pVC4fwrYsAtYOUTwFCK
         +x41ajLlA8Xw7Gp7LUmzAwesOi8LYvKIPsJM4WYotKi4u7++H9qfsEEM2hq1YHyFsDpu
         HJVw==
X-Gm-Message-State: AOAM5314ChTwG95/ybSd0ap3K9XGAitg5jQ7ITAnNKRZMK6WRvguvCji
	WtLbGgntcJbUxCBOyZRTApqBOA==
X-Google-Smtp-Source: ABdhPJxbl7qL+fzkwJAfS5Tm2wKmvb6IQK6wWe45wnohJCQjdZK0cGoC/5Xk4rYJDZ4CakOaNa/OCQ==
X-Received: by 2002:a1c:e041:: with SMTP id x62mr5859640wmg.95.1614724586258;
        Tue, 02 Mar 2021 14:36:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53? ([2001:8b0:aba:5f3c:fd4c:95a0:62b1:7d53])
        by smtp.gmail.com with ESMTPSA id b15sm5050826wmd.41.2021.03.02.14.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 14:36:25 -0800 (PST)
Message-ID: <c7f3edd6a0ba4a4f9dae5186cdc511ce072f9096.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] Edit DESCRIPTION of recipes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 02 Mar 2021 22:36:23 +0000
In-Reply-To: <20210302100734.114315-4-idadelm@gmail.com>
References: <20210302100734.114315-1-idadelm@gmail.com>
	 <20210302100734.114315-4-idadelm@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-02 at 11:07 +0100, Meh Mbeh Ida Delphine wrote:
> This is to fix the ParseError during the build.
> Fixes: [YOCTO #13471]
> 
> Signed-off-by: Ida Delphine <idadelm@gmail.com>
> ---
>  meta/recipes-gnome/libhandy/libhandy_1.0.3.bb                | 3 +--
>  meta/recipes-graphics/clutter/clutter-gst-3.0.inc            | 3 +--
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.3.bb | 3 +--
>  meta/recipes-sato/l3afpad/l3afpad_git.bb                     | 3 +--
>  4 files changed, 4 insertions(+), 8 deletions(-)

These fixes should be squashed into the changes which introduce 
the parsing errors in the first place. I've gone ahead and done that
to save them being posted again.

Cheers,

Richard

