Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3ADC433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 08:55:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.6628.1633683327054365986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 01:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qy2CHXvJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r7so27418833wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nQxGGN4gOHKwd8xugatTMPSG59kFfypw7izQ+PckgFQ=;
        b=Qy2CHXvJxJc8aSTmdpC/wUAw0oQWaWCHcEDt0Cjs5y57BbOg63+SUmNiGFKRELFcUL
         3XpFTkusH3v3o8So1cbW/mRERz1hrmW8VJz9pQx8VkNN2FRtxLk8to8vtxjGbR2x2U9H
         gXZVQmSg7PPsR6KypqqZdRmKOE7ezVQ2ql4Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nQxGGN4gOHKwd8xugatTMPSG59kFfypw7izQ+PckgFQ=;
        b=73z3B9G5ZA6l9UeGebPRokG4Qx4SeMQ6mxXVGSG9V0SOcLxvcWkBMin2fgCdJklHl3
         juzJbaJpNICU1efKsuiebG7tB0aNlAo6xg9wIDWKKLrWlhmswa7T+EHUCHTLla9Cqk6u
         2f4Dtz7Dn/YbPnqUNOoaZgOqJWVew0V5vGF/YyEoQSlkWDVdvNXzjmNEXzucs76qgDLn
         wVvaW4vkDk75tQYQIRIxof+QNZEp/qgPBGtqOwLhqe9OAZV1yrg7LQhenJq4L6yFyebX
         v+WR4Snqzxq4yudYdHGpPv7Qyf3h6a6GbJltETX8BHNzUx806SdXB3ol3yXgetbUeH/i
         BEYA==
X-Gm-Message-State: AOAM532osb0fOJQGYh76eJouKz25bPOneZTCg+FWim2BgImGR7xqVaqc
	N6ViTr36qV43SJzyhBkol2qeag==
X-Google-Smtp-Source: 
 ABdhPJy6rRAcfNpdvWD9TfU/g6VOXNh2VrVG9UU5ki0ZY9td4ato7Wv7ssxWdZaB+jzzcs/yrEUiPQ==
X-Received: by 2002:a05:600c:2193:: with SMTP id
 e19mr2095097wme.38.1633683325203;
        Fri, 08 Oct 2021 01:55:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5719:ccd0:9969:333f?
 ([2001:8b0:aba:5f3c:5719:ccd0:9969:333f])
        by smtp.gmail.com with ESMTPSA id
 l16sm1991194wmj.33.2021.10.08.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 01:55:24 -0700 (PDT)
Message-ID: 
 <7c45856599d0602f115788604a07b0105cd762aa.camel@linuxfoundation.org>
Subject: Re: [PATCH] oeqa/selftest/reproducibile: Include rust packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, alex.kanavin@gmail.com, umesh.kalappa0@gmail.com
Date: Fri, 08 Oct 2021 09:55:24 +0100
In-Reply-To: <20211008083758.156759-1-pgowda.cve@gmail.com>
References: <20211008083758.156759-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 08:55:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156774

On Fri, 2021-10-08 at 01:37 -0700, Pgowda wrote:
> rust-llvm-liblto and rust-llvm-staticdev have been tested and generates
> same ipk, rpm and deb files for reproducibleA and reproducibleB in
> debain environment.
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/reproducible.py | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> index e4582cb82a..a147e933cc 100644
> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> @@ -27,8 +27,6 @@ import datetime
>  
>  # ruby-ri-docs, meson:
>  #https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210215-0_td9la2/packages/diff-html/
> -# rust-llvm:
> -#https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210825-kaihham6/
>  exclude_packages = [
>  	'glide',
>  	'go-helloworld',
> @@ -36,8 +34,6 @@ exclude_packages = [
>  	'go_',
>  	'go-',
>  	'ruby-ri-docs',
> -	'rust-llvm-liblto',
> -	'rust-llvm-staticdev'
>  	]
>  
>  def is_excluded(package):

Not sure how you checked this but here is a build where they were not:

https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/764

Note the lines:


2021-10-08 04:36:27,176 - oe-selftest - INFO - Reproducibility summary for rpm: same=8819 different=0 different_excluded=11 missing=0 total=8830
unused_exclusions=['go-runtime', 'go_', 'ruby-ri-docs']

i.e. it used the rust exclusions.

Cheers,

Richard


