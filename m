Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.4899.1589287567668788617
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 05:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YSmIQUA1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id z72so13501034wmc.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 05:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=RL4s58D5oZMJWfuWrUDNygt48lnVemyXbxGdRCShAYY=;
        b=YSmIQUA11AslXzdx2oAhjj5h4o1OK2UkNHFlpWcQNroDh0jtrpILbKT//g6YAyty7N
         XqtPPT52QmcXPEXTBLXDKgEBk9LacyRfdtAlScCOLe9+mpOa34kA+MYrFf1QZ1rJHyAC
         KdSR3Dk0oawSfSVCG1nxEH0lC753bQS8HpaEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RL4s58D5oZMJWfuWrUDNygt48lnVemyXbxGdRCShAYY=;
        b=Ar3dfpgsBsh+/x/vymV9WKW9TobrFeY58085cL9Fqra0vKOUtKNXpw7rGD3PfWCHbZ
         exD7CnFDvKZe8G5usPjCf2FlEsDC4FsYkZvhqGw4yizdQYhTrI9zRjjPW88oV0r6bTMS
         qQXOvg+v8PM0RlqgdmUC4RHh/f9lnNs4QJO0SbAeg30cYVudherPdrfIL1d2EX6C2CM/
         XZAKsMgJRZ2a8Dm0YU6/iFVJHDZbDDh+5I2J0LlkxZDQ2pcZvR3SmrAjxbZcH5i+qVWL
         WK6okaIn5tSQknhuHklufIyd7ilIC28SK0LuK8Yz6mis+ATkFpAd78Av+G1H91hDak/D
         OT5A==
X-Gm-Message-State: AGi0PubEgWOVIbf2cE1qubAmS2RZFLp+1IYqOXV9nQDTqiTj9asCFwTO
	p+Wr2Tw8cmPLDz+OaSXt3iQW0g==
X-Google-Smtp-Source: APiQypKKK8NK/BM5L8CRefctXV2uaYMk24CKQS5uIDSx4lr6ckXD+RbFjtlQa0I8RhOKnK2u+bahKw==
X-Received: by 2002:a1c:384:: with SMTP id 126mr37589198wmd.58.1589287565943;
        Tue, 12 May 2020 05:46:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c193sm4880218wme.37.2020.05.12.05.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 05:46:05 -0700 (PDT)
Message-ID: <421093a7d57d548c1dcbb4dfc070bebaa0ac203b.camel@linuxfoundation.org>
Subject: Re: [PATCH V4] gcc10: Update to GCC 10.1 Release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 12 May 2020 13:46:04 +0100
In-Reply-To: <20200512070546.255409-1-raj.khem@gmail.com>
References: <20200512070546.255409-1-raj.khem@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-12 at 00:05 -0700, Khem Raj wrote:
> * Package new gomp header acc_prof.h
> * Package lto-dump which is a new tool in gcc10
> * All Changes are here [1]
> * Porting apps to gcc 10 help is here [2]
> * Backport a patch to fix CET errors on cross builds
> * Add patch to fix mingw libstdc++
> 
> [1] https://gcc.gnu.org/gcc-10/changes.html
> [2] https://gcc.gnu.org/gcc-10/porting_to.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> v2: Correct SRC_URI checksums
> v3: Drop icu change
>     Backport a patch for CET cross compile
> v4: Do not delete icu config but restore original one

There is a new meta-mingw issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1892

also a typo fix in maintainers.inc needs squashing in:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=47de13d4d208aa6a5ca89e4e0ce566990e208e96

to avoid selftest failures.

Cheers,

Richard

