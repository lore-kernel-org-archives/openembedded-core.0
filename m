Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.13885.1614270857649930850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SvWKR+fY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id o16so5407167wmh.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=7hEIllm04fYGIOq9GT1UrdybLOZJs9tlkYHy7lSy29I=;
        b=SvWKR+fY6CLZGzrbDZJESCrc3rA1browNSlyJBOcdkUVLso8CDEJur0aHJrdg4z7gu
         N45XhI9unaDmY0aumT7kpQuVnS4FCP2ZOKi4lyK/Bc52p+X4umRnoO4Y9yMj8wT2pQzD
         Jqy98mfDHjNVZHdrj0BuIvnsWZrVS37ExQlkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7hEIllm04fYGIOq9GT1UrdybLOZJs9tlkYHy7lSy29I=;
        b=keQTxffYgedtsVed3cyHBFTYWn/1Z/dtmHbce+Jz+ft9E9oIILYw8AfCOGBUO+eOsi
         uote5aZ9lK+kA49QCNZ+R8YO4QeJBWpOHW8dAQA3dBZayHXjz7lGG1IcKeS8kSaswBx7
         TgfZGE0MlzPOFcf5RTsloxGg1PDkox3iXloEfh2E3/Q9BsSACPhhqpnJbl2n2QEa8dm4
         /fuZyk52i41jv6WYxJgFMfp9gyro6BCwC6+WC2oVzARNH21tfamzVi6j/IDK2FCZzgkF
         I9GqK1NIp4Wbz41JcdmKd4d7VUSYCdR4B9lM7ZjoIVzZHiGaSq6mGG9AX7i3eLE070no
         bfWA==
X-Gm-Message-State: AOAM533lxEoV20QJHU5DWUGgKz7PTZSUXEpVVe+pwq6g3mXxqmD8TOMw
	DnDa9FGv/78Ob8mOvQr/DysKVw==
X-Google-Smtp-Source: ABdhPJz4r1ctbIC3ckyPyIXw6zWIwdcSPYcD7+gnGRRCz+h3G2SFUKOt+vyRD9mAl1/ZMU6ZtAmNYg==
X-Received: by 2002:a1c:4904:: with SMTP id w4mr3996188wma.47.1614270855938;
        Thu, 25 Feb 2021 08:34:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472? ([2001:8b0:aba:5f3c:4258:f6b6:9d0d:f472])
        by smtp.gmail.com with ESMTPSA id k15sm11234702wrn.0.2021.02.25.08.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 08:34:15 -0800 (PST)
Message-ID: <ab58b76c651be9de47b026386d7c5f5dd92218e1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.36.1 release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Date: Thu, 25 Feb 2021 16:34:11 +0000
In-Reply-To: <20210225050709.1900936-1-raj.khem@gmail.com>
References: <20210225050709.1900936-1-raj.khem@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-24 at 21:07 -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.36.inc | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.36.inc b/meta/recipes-devtools/binutils/binutils-2.36.inc
> index ab0760621b..489a72fa16 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.36.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.36.inc
> @@ -16,15 +16,15 @@ def binutils_branch_version(d):
>  
> 
>  # When upgrading to 2.37, please make sure there is no trailing .0, so
>  # that upstream version check can work correctly.
> -PV = "2.36"
> -CVE_VERSION = "2.36"
> +PV = "2.36.1"
> +CVE_VERSION = "2.36.1"
>  BINUPV = "${@binutils_branch_version(d)}"
>  #BRANCH = "binutils-${BINUPV}-branch"
>  BRANCH ?= "binutils-2_36-branch"
>  
> 
>  UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
>  
> 
> -SRCREV ?= "fe0e833171513c1d89668bc5f454192d2db39bce"
> +SRCREV ?= "7b7c7090a2bf33812762a06a02b1719c94d1c3d8"
>  BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${BRANCH};protocol=git"
>  SRC_URI = "\
>       ${BINUTILS_GIT_URI} \

Seems to break meta-mingw:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/3121

Cc: Joshua too

Cheers,

Richard

