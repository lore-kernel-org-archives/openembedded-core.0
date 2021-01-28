Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.5681.1611824564050712860
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 01:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JLcLM49T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id z16so1347147wml.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 01:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=318uETppF4p3JyWqrizXN+6Jbvp6gkz6yBc0q3FRvME=;
        b=JLcLM49TYT0qeSrRF1TgDakvo2d2zAB2/TVsdpwO5cNI33BfLS85idvxrKSJDDrqfC
         iB1XGfR3+ALEdlnJ3e4J3fOi0qj/V8z1lHdWG0xwCJzhHWUKglTtvxf6ONLPkoQUBNtx
         snKzCzYciFsbUEBDC2D5NmCLIJhkx6lf7F60s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=318uETppF4p3JyWqrizXN+6Jbvp6gkz6yBc0q3FRvME=;
        b=dcxbF6ssmgeyf/u9d0UxFG3U5W11wU33/pNz37DZ7C7HOCAr0WAGrgYEJJyXRIww0T
         slYSeYaWEJIQtvE9oEXgfISP1++kb/G5oZQh1vEC0HOunq1c9AAZDB12oZvZ7jz8WZza
         6nS3/FHbtH5fFGoaLDWMCZ4kEdNLiKJEkqeECvsE1Dea6oubU5rdncGLz8jPqG4GKAhr
         Q0+P9fuFlXhJHlW/pSCNtlWjwQbTTy6MQlvnZkALL6CwndxL10I93sw6AMIrFbeRyZCT
         Hj8VkpXsrfuLlHnNr6UNrnCWu2g8S1d4avXigdPVm5r+fV5MRkD4uesEdNDfd0CTD2Zm
         LFTQ==
X-Gm-Message-State: AOAM533tJ+Hudk/YCqYxoHOzL1Y+kX91gP8PZDAP5zYMkplzrM/Rc0OD
	QwD13Vhzvat5l5KkzylW9FMS0w==
X-Google-Smtp-Source: ABdhPJyLxmjC+vp6nOqg59sFUXAIXJB9YjH5hWzqGBz63s/FRXSJievp/VNVdKrur2OUDMoIDHxaoQ==
X-Received: by 2002:a1c:bbc6:: with SMTP id l189mr7911691wmf.187.1611824562522;
        Thu, 28 Jan 2021 01:02:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4bc5:547d:5310:bf3a? ([2001:8b0:aba:5f3c:4bc5:547d:5310:bf3a])
        by smtp.gmail.com with ESMTPSA id m11sm5064516wmc.15.2021.01.28.01.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 01:02:42 -0800 (PST)
Message-ID: <36ea418d5095cf5ab6f8949a7c07f28e310e8a67.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] ncurses: Don't put terminfo into the sysroot
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jan 2021 09:02:39 +0000
In-Reply-To: <YBJ5qanQrSxjhX6u@korppu>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <YBJ5qanQrSxjhX6u@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-01-28 at 08:45 +0000, Mikko.Rapeli@bmw.de wrote:
> Interesting series! Do you already have some numbers how this affects
> bitbake builds?

Not yet. I should really have split the series into two, the files
reduction and the native PACKAGES pieces as the latter is proving quite
unstable on the autobuilder and holding the other up. Once it does
build cleanly and merges, we will get build time measurements which I'm
curious about too.

Cheers,

Richard

