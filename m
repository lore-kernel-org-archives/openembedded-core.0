Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.1199.1611707357409776430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 16:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DWfoeaZq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id m13so184593wro.12
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 16:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CQX9m1t6FBtGH47RmmpCsWj0QJuxkja0GWRWzjdRb2I=;
        b=DWfoeaZqSZHStDetcPwcZO0/L3od1j4hMdKQ9oHbZsE5xbzISweuWoU4xBIX2dZCab
         P+9uqHkhl+kUqrz1TFisvuuc8jbmkMF2Sf9LGwT2fKSMvrqkoDQpibU0tv5UCNfw8eXt
         iZOY/FQx8UeYPkqsJ6FRKPjasHzU+KLVVR0es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CQX9m1t6FBtGH47RmmpCsWj0QJuxkja0GWRWzjdRb2I=;
        b=STNxYNSOOUaU2UQ6YWG9LDwd0XAYLCuDN4216Fi2nO58z/ixlCCvTzHR4j5JkEycC8
         Z1UYQMAnrJ7LNELRP1UDQtH827Y9UU0bHu8Y4Gylh8IzbfjeSifzIP7A60pbF7vaaAQa
         aervK2tkJt9o4gF0x58zSKrzdsfizoUxCdoxGyjhdY0XhqJvT7TQf/Z1btO5J+3NRtd4
         nlSg7aFBX5NrjdMgj9dgUhQhZNj2tw7S0rdIF/Et/FYrahGFJa7rSmwKqhXC5qSBS1kt
         3HZ1hPDmM/mG3X4tI/b+qz8bOw5KS5FuGHz0iFfb8sRW52j6u6ATgbK+hwFfGsVwVk7G
         g0Ww==
X-Gm-Message-State: AOAM530WYUaEsiqvSwGWdG+liNJCBPnya5hPFwgq7Mul9yMYz9guvlb5
	71iTv2GmAdAXBlVgAUGpoK3NFQ==
X-Google-Smtp-Source: ABdhPJwQ3lbXt8jdvV8SbNVQvLL2hunHg7RSmBZSRN2L1coRlRQvVGMR6Ukb95cAxHQ3/2qU+BWpjw==
X-Received: by 2002:adf:f747:: with SMTP id z7mr8494590wrp.384.1611707355874;
        Tue, 26 Jan 2021 16:29:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc? ([2001:8b0:aba:5f3c:52a7:b6a0:dca3:45dc])
        by smtp.gmail.com with ESMTPSA id i6sm532532wrs.71.2021.01.26.16.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 16:29:15 -0800 (PST)
Message-ID: <bdb74fdef4d9c72e72b73f9c1d343e63a582db80.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/3] elfutils: split libdebuginfod into its own package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Dorinda <dorindabassey@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2021 00:29:14 +0000
In-Reply-To: <20210127001045.6686-1-dorindabassey@gmail.com>
References: <20210127001045.6686-1-dorindabassey@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-01-27 at 01:10 +0100, Dorinda wrote:
> Added package options for libdebuginfod.
> Added GPLv2+ | LGPLv3+ license for libdebuginfod with reference to https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=de26af5bb26e187b51d9ea00d5826e199a96d01a;hb=HEAD
> 
> [YOCTO #13807]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v3:
> added YOCTO bug tag
> added LICENSE header
> changed upstream status
> edited typo error of recipe version from 0.181 to 0.182
> 
>  meta/recipes-devtools/elfutils/elfutils_0.182.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> index f63208d72b..823f0cab98 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> @@ -1,8 +1,10 @@
>  SUMMARY = "Utilities and libraries for handling compiled object files"
>  HOMEPAGE = "https://sourceware.org/elfutils"
>  SECTION = "base"
> -LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://${WORKDIR}/elfutils-0.182/debuginfod/debuginfod-client.c;beginline=4;endline=29;md5=f758740623cdf457eb76957eb50f0422 \
> +                    "

I think the above might just be able to be:

file://debuginfod/debuginfod-client.c

since the files are relative to ${S} if I remember correctly?

Cheers,

Richard

