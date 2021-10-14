Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E0DC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 21:40:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.1349.1634247628450998572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fvw6DD1v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id k7so22610694wrd.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 14:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jRGkzit9vdhGab/XXXV72as9egXvTA5PHefYencKZEw=;
        b=fvw6DD1vr1SaskvV4FcoujxLkQligK53EAgXg+u00PIIl8rwra449oUIEwACoNDLaI
         rbg9eoorSeD8RzqzypyzCCzoCOjorlhMGdTzh+QnkDVzmZb1Q6Ivdh8AJ/cvgLHo/lCD
         BZhdHo5vKoI4cZHIaeCI1ZIjZ541CqoDkf/a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jRGkzit9vdhGab/XXXV72as9egXvTA5PHefYencKZEw=;
        b=FpgzJFLJ+RP2kQEqGi1X+2QjtXqMuIJj86IowUdNd3lGwdy0XTx6pJLeoZrMDS43LT
         78n4qP/mA7r1eiSqIVeZLj6yFklkU2/28y4VVNuf9X6pjECVjpl4+9vKZB2VFhRKJb0M
         nCm7eBEVd91O+rMeKYZK6EXjU/V4iA8SOprXBV28VHKSLqDAvya0W3CTBFqDrPyapgl5
         xYJNNkKn7e98+Gt05AXE3rBwZoIKfqPniwD4Xw8JDxPwMjG+rjJhHZxRm5LKTDk2YScL
         1OwEMt2Z68/BSqHsYTPzcuc9voogJE/n5gS72A3yOPSUQyVCvAivqsFhJj9iSgCvxsZC
         GVWg==
X-Gm-Message-State: AOAM533/AXCsaEbTTe/Dqi3zKv/zfzT79am6WbjqJfjtTMVCjbhNjvWu
	W74hhX709DKxjaspeHNgJUScWw==
X-Google-Smtp-Source: 
 ABdhPJyWQOwCxFhmbJMG+zpcvdkEzEwDncEa9pJW+cZ4h6xwIpz5gUj4/OemQqqa/VExSFwW5ZYnwA==
X-Received: by 2002:a5d:6943:: with SMTP id r3mr592862wrw.267.1634247626942;
        Thu, 14 Oct 2021 14:40:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1?
 ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 h11sm3097671wrz.5.2021.10.14.14.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:40:26 -0700 (PDT)
Message-ID: 
 <abb979abb8b4397550022bd5194e500ec58f9fa7.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] scripts/autobuilder-worker-prereq-tests:
 jinja2 check
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Halstead <mhalstead@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Date: Thu, 14 Oct 2021 22:40:25 +0100
In-Reply-To: <20211014175543.85257-1-mhalstead@linuxfoundation.org>
References: <20211014175543.85257-1-mhalstead@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 21:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156974

On Thu, 2021-10-14 at 10:55 -0700, Michael Halstead wrote:
> Ensure the jinja2 module is available during bringup.
> 
> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> ---
>  scripts/autobuilder-worker-prereq-tests | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
> index 5d7e6e2601..82e9a77bd5 100755
> --- a/scripts/autobuilder-worker-prereq-tests
> +++ b/scripts/autobuilder-worker-prereq-tests
> @@ -35,6 +35,11 @@ if [ "$?" != "0" ]; then
>      echo "Please set git config --global user.email"
>      exit 1
>  fi
> +python3 -c "import jinja2"
> +if [ "$?" != "0" ]; then
> +    echo "Please ensure jinja2 is available"
> +    exit 1
> +fi
>  bitbake -p
>  if [ "$?" != "0" ]; then
>      echo "Bitbake parsing failed"

Looks good, thanks, I merged it. Should we cover rsync with a test too?

Cheers,

Richard


