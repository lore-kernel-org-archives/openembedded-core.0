Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.4867.1622787778291249462
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 23:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BdnrbDct;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j14so8093605wrq.5
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 23:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fjGPFNbVDtfDAoK3KudJW9lJ0PVG44u/GLXeZeNNBJY=;
        b=BdnrbDct11UihL1+Og9c8RgS0BixdzU+/5mDuxTwxXAB3Id/TlmAC4ExvJs9fCyyHk
         d42aJrLt2Tno/upkG+dx5nLNgV5tHu9DCkPeaPPIsBp6AqD827oM0T07XWETdwA50Yda
         FKfwYzRcDSfNlRbHdr3yhJJfASVY/t/ToyVic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fjGPFNbVDtfDAoK3KudJW9lJ0PVG44u/GLXeZeNNBJY=;
        b=CNB8JSV5cLKtMgX5bYKjQr0R6wDS0nPYGfKvQHfjfgNiDDkNoj3AjCaEaz7VXKyqoy
         LE7pjD2B2PcMoL5fiEPNHgK9qtiG1ZmAotQ3ioKk+VJvBMbvqfWIX6qLHCjHoZfVldck
         lu1tC216xA1VlyX2MJ+QhH/QIgGWj8lvGd/0JAlGIndPgV1LF2RAy2GFeguGF5PzkmU6
         /jyqD55v9mE3+RuoaCrfmlFi+sX89JjcGEzZoa8i8RHHpas7Uoy/58hJpGHqrOqas9du
         ymv3AxBqEG/jHmUsrmsIqJo9yzoWt1rO9QUjzXPVYOzjbN0SNGofu2B0Fl8Cwt3qgBYM
         j5FQ==
X-Gm-Message-State: AOAM531ksz+Od9P/oJ04jnV/AwUcgrK4SGBFHjzpdrB9iGJF2TmvE+Gm
	pJY6WJCCcQy/7MKyMtpbf11/Ow==
X-Google-Smtp-Source: ABdhPJx0MuJ7z24i+jPQ8Cz0uRpo1/+fh8kU43luKjbYr5dLHBXbKPqhhWhVywjArS9kkQmxfyQfyA==
X-Received: by 2002:adf:a441:: with SMTP id e1mr1997695wra.227.1622787776895;
        Thu, 03 Jun 2021 23:22:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1fce:265d:903f:2948? ([2001:8b0:aba:5f3c:1fce:265d:903f:2948])
        by smtp.gmail.com with ESMTPSA id l16sm7944740wmj.47.2021.06.03.23.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 23:22:56 -0700 (PDT)
Message-ID: <365c322ec3e86e105dac95b3916d7bfbc2ccd4cf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] m4: upgrade 1.4.18 -> 1.4.19
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Fri, 04 Jun 2021 07:22:55 +0100
In-Reply-To: <1622704403-26153-2-git-send-email-wangmy@fujitsu.com>
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
	 <1622704403-26153-2-git-send-email-wangmy@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-03 at 15:13 +0800, wangmy wrote:
> 0001-Unset-need_charset_alias-when-building-for-musl.patch
> 0001-c-stack-stop-using-SIGSTKSZ.patch
> 0001-test-getopt-posix-fix.patch
> m4-1.4.18-glibc-change-work-around.patch
> deleted since they are included in 1.4.19
> 
> refresh ac_config_links.patch
> 
> License-update: URL of license changed
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../m4/{m4-1.4.18.inc => m4-1.4.19.inc}       |  14 +-
>  ...4-native_1.4.18.bb => m4-native_1.4.19.bb} |   0
>  ...charset_alias-when-building-for-musl.patch |  33 -----
>  .../m4/0001-c-stack-stop-using-SIGSTKSZ.patch |  84 -----------
>  .../m4/m4/0001-test-getopt-posix-fix.patch    |  41 ------
>  .../m4/m4/ac_config_links.patch               |  24 ++--
>  .../m4-1.4.18-glibc-change-work-around.patch  | 130 ------------------
>  .../m4/{m4_1.4.18.bb => m4_1.4.19.bb}         |   0
>  8 files changed, 20 insertions(+), 306 deletions(-)
>  rename meta/recipes-devtools/m4/{m4-1.4.18.inc => m4-1.4.19.inc} (79%)
>  rename meta/recipes-devtools/m4/{m4-native_1.4.18.bb => m4-native_1.4.19.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/m4/m4/0001-Unset-need_charset_alias-when-building-for-musl.patch
>  delete mode 100644 meta/recipes-devtools/m4/m4/0001-c-stack-stop-using-SIGSTKSZ.patch
>  delete mode 100644 meta/recipes-devtools/m4/m4/0001-test-getopt-posix-fix.patch
>  delete mode 100644 meta/recipes-devtools/m4/m4/m4-1.4.18-glibc-change-work-around.patch
>  rename meta/recipes-devtools/m4/{m4_1.4.18.bb => m4_1.4.19.bb} (100%)

m4's ptests don't work after this upgrade:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1865/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2156/steps/13/logs/stdio

Cheers,

Richard


