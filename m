Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.87.1626988172183869298
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E63B5FGE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id z7so95767wrn.11
        for <Openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 14:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=d+JXMsTqZVtjZFn0LKogICcJts7Rj7N/FDovMxcSuFc=;
        b=E63B5FGEG9UtfLHFCIV9AIPGhMUuJl3Ph2GvDq8iuPehYhhzPQuhr102hBMbjZ0nuG
         pN2vysbKqIHIyhWeANgeIfWj95W+F7I7tzo7ApwjATM1kbSZqkp5/fx23zM1yVKFvYAM
         KSELdO5QIQpgwIzORAnYLviMemmfANAun5oSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=d+JXMsTqZVtjZFn0LKogICcJts7Rj7N/FDovMxcSuFc=;
        b=lWSE+UyecebJCUjCraSURjVMoXpmewbDRHnlWsthPNVdNQewWs+dcryQojJdRVOYJd
         3yk/4sIHpTaFV+OcaqHU8UlZRKL+fvLdNHhXn1upw4JtybMWQGXVu3NLoGy0nTwsvrsW
         R2X0af8Cj/k+TLFUKujVrQ+BpWjh6LObCyEhKI5Lc46xkQCh3R5tsHrDG+9QM80jy+MU
         Gv0YX3MgKjWsJ+HQB7YKH3BhmeLIizjaeG79F5kcwmA0cxqZkTXynyFL8q26DePr8nQ8
         kde2DfL1133PB0+mkyraSQ0U/dn5x0WcO40sIPJi+Uo3RnAhwQUki9lRbk89tSQaJrN7
         NrJg==
X-Gm-Message-State: AOAM5338SDelFJOQHThdjUTuYvCLDDxz1bFNWruSmNKfkczWBgr8tZUI
	S9sEoQKa1+5g7mEzyH/p5sGhkA==
X-Google-Smtp-Source: ABdhPJxRpwPr3kiQ4SgZZcK0/wAQqDF1oo2D6TXRaWGtI2EZGq1f3gQKtbdaV3S+GhT4jys41fKZPw==
X-Received: by 2002:adf:90e2:: with SMTP id i89mr1917241wri.338.1626988170653;
        Thu, 22 Jul 2021 14:09:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8? ([2001:8b0:aba:5f3c:e1dd:b42c:9243:6ba8])
        by smtp.gmail.com with ESMTPSA id p11sm30355547wro.78.2021.07.22.14.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 14:09:30 -0700 (PDT)
Message-ID: <1f209e074fe0fd5b39d1149e654794ce7065da7e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/8] maintainers.inc: overlayfs bbclass maintainer
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>, 
	Openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 22:09:27 +0100
In-Reply-To: <20210715193933.66120-3-uvv.mail@gmail.com>
References: <20210715193933.66120-1-uvv.mail@gmail.com>
	 <20210715193933.66120-3-uvv.mail@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-07-15 at 21:39 +0200, Vyacheslav Yurkov wrote:
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/conf/distro/include/maintainers.inc | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index e59f01d66a..90b20c9223 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -808,3 +808,5 @@ RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
>  RECIPE_MAINTAINER_pn-zstd = "Alexander Kanavin <alex.kanavin@gmail.com>"
> +BBCLASS_MAINTAINER_overlayfs = "Vyacheslav Yurkov <uvv.mail@gmail.com>"
> +BBCLASS_MAINTAINER_overlayfs-qa = "Vyacheslav Yurkov <uvv.mail@gmail.com>"

This variable doesn't exist. 

I've been trying to figure out how to better establish maintainers and 
there is a MAINTAINERS.md patch queued to create a maintainers file. I 
think this entry could be better off in there? Could you create a follow
on patch for that file instead please?

Cheers,

Richard



