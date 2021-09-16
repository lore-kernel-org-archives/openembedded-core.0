Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.926.1631806404327376919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Sep 2021 08:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hWVPO4YU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 196-20020a1c04cd000000b002fa489ffe1fso7674334wme.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Sep 2021 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MrunQ0WnZqIwBY9pPNulFY8RB1UMzrlEi42sz5OyGnY=;
        b=hWVPO4YULB9KynftlzMk3GjW9dhrNRbaWVIToYXhV/uUPDw9qpWUX5gPrjR6/gilOx
         cbVSWod/O9xU27nUqsmwkiHcPHrdIgUgHSRXHV+nwuqREQGvraR1ggrMfFrX8gW1r3uy
         SO9oq8jUJHAhvcHnKcCJKmtoicaDrH96KUHbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MrunQ0WnZqIwBY9pPNulFY8RB1UMzrlEi42sz5OyGnY=;
        b=ZCtDtglrVu61fH0LqlZquR5qhiVwLQKyB8Dini1JPPNJ5LlvW0KG7+yYdVI7smUtur
         LXn0+O3L7y5oH4jCGRiLvJ21RmX12t9t3OzdcijiAlDRnnoL08jnsq9CJ5RSnUYkOy8g
         qf7aTrwu+ZlvZPl9drM0J2wyPvUugEs2YkJIXp8o7uuTYf0X9+SGO4iKd9efSRvP/Uzk
         6OdKyXGLkn80VBJ7HLFJKiSNenfbZBwptqFHEbj2RUIUQ0hVGI/+rX3U+2Jujnc2z7fR
         rbvS9X0yacfs/iB85sSjMdP/0Xrp4HxD8AoEzaMngGnzDtuQIxv+b3v3R6lpUnottMPV
         YhDA==
X-Gm-Message-State: AOAM532GVKRo177kK76MraILJCiT5sMbKSpD3V2MnvsL6bRA7xjHuW3r
	hTzxWEQ0R2OPJk8ykTvDYAvBaQ==
X-Google-Smtp-Source: ABdhPJwhmrVh6JtcdLEza9GK82WDvZELFGqQB7yaomyEh1HPQ8IN5dXe3MVYuOzQq0yBD9VrdB754A==
X-Received: by 2002:a05:600c:3b19:: with SMTP id m25mr5726159wms.135.1631806402828;
        Thu, 16 Sep 2021 08:33:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c? ([2001:8b0:aba:5f3c:f11f:8fd1:42b2:e87c])
        by smtp.gmail.com with ESMTPSA id c135sm7935472wme.6.2021.09.16.08.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 08:33:22 -0700 (PDT)
Message-ID: <ced09b1bfecfb02318f8498e2e8b95d46966c8c1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [kirkstone][PATCH] wayland-protocols: upgrade 1.22 -> 1.23
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Sep 2021 16:33:19 +0100
In-Reply-To: <763e63d1-0f1e-3c5a-2d8e-a2b91bca3545@gmail.com>
References: <1631754397-46490-1-git-send-email-denis@denix.org>
	 <137620f2-df0b-58fc-6d47-89075626c844@gmail.com>
	 <556d590b620342703897becbeda6ebfa4d20aef3.camel@linuxfoundation.org>
	 <763e63d1-0f1e-3c5a-2d8e-a2b91bca3545@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-09-16 at 08:26 -0700, akuster808 wrote:
> 
> On 9/16/21 1:03 AM, Richard Purdie wrote:
> > On Wed, 2021-09-15 at 19:31 -0700, Armin Kuster wrote:
> > > So we wait until that branch is created in 5 months before we can apply
> > > it ?  Is this like post dating a check?
> > Alexandre and I are using "kirkstone-next" as a place to queue things for the
> > next release so this does make sense.
> 
> I know why you and Alexandre are doing it.  Should there be a note added
> to the
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email
> Section "Backporting fixes to stable releases"  regarding an exception
> during code stabilization to use the next next stable branch name
> instead of "Master" ?

We say "don't sent these patches" and people do. I don't really want to document
that it is "ok", I'm just trying to handle the reality of the situation since if
we don't do something with things, we end up in a really big mess after release.

Cheers,

Richard

