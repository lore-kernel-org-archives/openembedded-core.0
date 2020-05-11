Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.1193.1589222138259221848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 11:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aQ6TcO04;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id j5so12265519wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=k1PRLjo2u9M6UWCXPvi/BkZUZRFynhIWL/glN2pPqhU=;
        b=aQ6TcO045jN+VXX5+fH60MWO1zHeJFlFSqx0O1QYU2zWPYcxfgyFRwBpHeOYqILyhJ
         dpRTmUgRhdIrtXWsWLzo1AzTXMcr1LeQkaN3VD+KO3c+Dg3is4TmA/2W3Xbf1veU6q2Z
         K7P7S3+YXpzwVzH4g9N/kpGV6cbR8tMogHQnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k1PRLjo2u9M6UWCXPvi/BkZUZRFynhIWL/glN2pPqhU=;
        b=CWmYPm6k1KS/AHUGEKPD1N7v8brT83b4awgu5d8li70t872iTOfQ4vK4yGAm3WQAiG
         dPdt3YTGxPX1AKaFt5aaijlzfkXA8dreP7wbKZh00cVNRoiVIfkl8Zgh4GBSK6rCNOdm
         qOwadUvsxp9OrmO50RFgFfrp5tWpgvUg9XAmLCXaSmU1vb58/YML8Ht7A346IHs4s2IE
         fSNx+evan7rvrN0C0WQdSvmLbA7vpRNSB+gUJ6nUG8CvMrpBZMmdww0PQ9sSPSVmWocS
         YeG+Ezc5bGVPZLrJ4Ydeurp/87CD1+29nlpJbnfZGy8P2eSqNZEej03w1njvF6vU6R4+
         1srQ==
X-Gm-Message-State: AGi0PuYkT/wvlrsb9b1YNVfFGEJ0/ZdbTb8x+au8QAvmQT4w6csNGWjA
	jP0MB6dC71gLvT3fhm16UU8zGo4M5Ow=
X-Google-Smtp-Source: APiQypLmktyyBBnkpZ9M8gNIE6+2jp+jZP7X9bBA/mOwb5te9QhGWsHJe/RDz9wfWylCcW0QCTuFtw==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr8835113wrx.36.1589222136492;
        Mon, 11 May 2020 11:35:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u74sm28269255wmu.13.2020.05.11.11.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 11:35:35 -0700 (PDT)
Message-ID: <fd392f76b502df31e9a99cfde714487c55d13d13.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 17/17] gcr: update to 3.36.0
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2020 19:35:34 +0100
In-Reply-To: <20200503162559.946-17-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
	 <20200503162559.946-17-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-03 at 18:25 +0200, Alexander Kanavin wrote:
> Convert to meson build.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../gcr/{gcr_3.34.0.bb => gcr_3.36.0.bb}             | 12 ++++----
> ----
>  1 file changed, 4 insertions(+), 8 deletions(-)
>  rename meta/recipes-gnome/gcr/{gcr_3.34.0.bb => gcr_3.36.0.bb} (75%)

Seems there is some kind of race issue in here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1881

?

Cheers,

Richard

