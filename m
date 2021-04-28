Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.3210.1619646180353495170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 14:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z5NGsK9e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id b19-20020a05600c06d3b029014258a636e8so5449614wmn.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Apr 2021 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DKJPHGMiLxBZcFWr293sAi95Ck8orF2F8nuHqI5Asx8=;
        b=Z5NGsK9eh2FwLEd+VQ3xgVKke8b6F0HRxDX8nm1xOW4Rw9opxsKKPX5toOH9oJkOvs
         PwtclquiNcRIKC8344iLMfNeByQ1owbTlJKkJ2Y7HRulyrkl+g2RBit7Xy2/AFsi75QP
         kETYxXe/+t0yNlG08I0VKl6e5H4qKefddG598=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DKJPHGMiLxBZcFWr293sAi95Ck8orF2F8nuHqI5Asx8=;
        b=qW9F4vXRGV7tq5dUnG85+bxFYqNhHL68/bY2gWTQMLc/7q17q9NI+ZoTXAf3QzRJxx
         xwzOdmptVxMA7W48/+tVCmaDGKSmRk3Rc/CEucSGKHMiGfJoksres+RvH28HOFH2JgA/
         mHCXEf+ryBFqee7AUTzVrQ6pe7LyF1MkkqX//aXkmx9C0jT6x/hIHVbn6a7ugeOsccer
         sS6uY7QX3rtsJ4oiBa7aj16R5Pk5GIHzHHhm19BkJo3/BxkM8+gvlKIA0n91W5Ks/BHA
         +zqznEkrmfZeXis012EH/4MF3/YVgmuvXPiQ07aYytdqL3I1hSlHc5aZzF7u42v4+95M
         dCJA==
X-Gm-Message-State: AOAM533zGN8DPqSx0FXHWyfmu/ktAaR3tx2mST5RIYf86S0HHEft/nt+
	ayux8ZeHZy8YPVvnOXl/zP8MvA==
X-Google-Smtp-Source: ABdhPJzKMWCoVezlwy5dZ0oLBaOH91i1ZJomFgymeYUxBSmCE4XEXGnWO85JmXu/KC4syvRtPHWy0w==
X-Received: by 2002:a1c:f313:: with SMTP id q19mr32888192wmq.142.1619646178836;
        Wed, 28 Apr 2021 14:42:58 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:89c2:a4ad:446:e40? ([2001:8b0:aba:5f3c:89c2:a4ad:446:e40])
        by smtp.gmail.com with ESMTPSA id d10sm1480803wri.41.2021.04.28.14.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 14:42:58 -0700 (PDT)
Message-ID: <162f49616d345a02d2633ae51e2e09b3f08de158.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Devendra Tewari <devendra.tewari@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Andre McCurdy <armccurdy@gmail.com>, OE
	Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Apr 2021 22:42:55 +0100
In-Reply-To: <42E76009-F583-4E55-BA29-1C989B25BD73@gmail.com>
References: 
	<d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
	 <F32A7470-A864-41C0-BA9C-FB611421DC0F@gmail.com>
	 <aebbbcf8d29afec37b4a9c459eca8ab24112137f.camel@linuxfoundation.org>
	 <4538E61E-9CE7-4346-877F-FA6CEAEB5074@gmail.com>
	 <61C98407-3B1A-4C8D-9969-7D3EEAE3B75A@gmail.com>
	 <3F33A9E1-ED6B-4728-A0CE-49EAAB2CFAC1@gmail.com>
	 <a825b895707921ccfb5a2d20a0def7982963de21.camel@linuxfoundation.org>
	 <7C3B49FD-7C8F-4C64-B847-F84BEA35ED94@gmail.com>
	 <5CA188E2-24EB-4FE9-8F31-84DD73F92C1E@gmail.com>
	 <42E76009-F583-4E55-BA29-1C989B25BD73@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-04-28 at 07:00 -0300, Devendra Tewari wrote:
> The gist of it is that Docker uses the overlay2 storage driver by default, 
> previously it used aufs. Both drivers have the same limitation in rename, 
> where file rename across layers is handled by moving, but directory rename
> across layers results in error EXDEV. It is up to user space to handle the error.

I'm still struggling to see how you're going to patch all the various pieces of
software out there used during a build to handle EXDEV correctly.

We have handled some cases of this for a long time where we're moving files
over to different parts of a filesystem, e.g. /tmp/ to WORKDIR or vice versa.

This new docker case triggers for renames even within a directory, e.g. 
/some/path/a -> /some/path/b which is not something that would often trigger
this.

I need to say clearly now that we are not carrying/taking patches to patch
every bit of other software to try and avoid this.

Cheers,

Richard



