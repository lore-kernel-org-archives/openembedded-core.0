Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.6580.1588431365506054851
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 07:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BwYfVF8m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id d17so15331351wrg.11
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=6FGg6kV1em51f8nXKGSGW8U0p9kb5m6wKtRHUH+hQ5Q=;
        b=BwYfVF8mDt5RRafo3qyLi1JFgvw8PwDsw6BcZLpOaGX1cQEdvtz16MRTdZmgjw33dl
         C3immxOX+JW+P9o3lrnhco8mWcKafUTRWyPEahjCTeunZ/ZSWdE04z6tPVnvdR3ejiDV
         NzU+HmptGDD2xvcziV6m2PRCvnt90s5eB+mBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6FGg6kV1em51f8nXKGSGW8U0p9kb5m6wKtRHUH+hQ5Q=;
        b=ayu8KFgz8W3t7+tR5DoKuQ/vP3W8fsxZuu4U65rQBrSpiwlLeYLRbka8jt+JYnZcxg
         AyLEm7b2QG8JcdAtA2F8VBfW/r1iQ3KMk5kZtVxz3A3U3a/XwI3EECN2qxrZH079xvTC
         T0+chTeAfag3Q7+px9eXuv6j2ykjt65LPvU3O9IgIZfQqIyKc4HRbp1PpTdeaAMlw8sA
         vGD+TVrsnrCAFw3vv9UZ+aGjyZzmy73m8rxWbjqqNXwwsJXkxJCyX+bGAeKTJVZMuJhd
         QdGEGtrEUoi5Bi+dsPs6GADUe3Z2AI8907v938Ls0guD9n5+sc10c4sN1zyh5pzjj8Pq
         A3Qw==
X-Gm-Message-State: AGi0PuZTkM93I3Q+PTiac+DdDSjKeeGHH4z1jhXzYvJ4kU2sC3VlFKm7
	UVZlSdxtZUOlF1lhZWL6PR/7YFG4UQs=
X-Google-Smtp-Source: APiQypKN9cl+UV0zK1//kRoXuGtmVbm84VbwS+UqTFsq0IwY4YCJBRBD2Vk/AEHd8rhjDJJkd5GeNw==
X-Received: by 2002:adf:f887:: with SMTP id u7mr9218320wrp.369.1588431363574;
        Sat, 02 May 2020 07:56:03 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a67sm4681768wmc.30.2020.05.02.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:56:02 -0700 (PDT)
Message-ID: <2058bd0e1f6f323dcc5e191c39c092435dea9f99.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 14/17] coreutils: update to 8.32
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 02 May 2020 15:56:01 +0100
In-Reply-To: <20200430095815.2824-14-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
	 <20200430095815.2824-14-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:
> License-Update: copyright years, http changed to https
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../coreutils/fix-selinux-flask.patch         | 13 ++++-------
>  .../remove-usr-local-lib-from-m4.patch        | 23 ++++++++++++++---
> --
>  .../strtod_fix_clash_with_strtold.patch       | 10 +++-----
>  .../{coreutils_8.31.bb => coreutils_8.32.bb}  | 11 +++++----
>  4 files changed, 31 insertions(+), 26 deletions(-)
>  rename meta/recipes-core/coreutils/{coreutils_8.31.bb =>
> coreutils_8.32.bb} (95%)

Fails to build on arm hosts:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/1833

Cheers,

Richard

