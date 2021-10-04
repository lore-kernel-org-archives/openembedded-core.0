Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4065C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:11:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.9923.1633356684299893210
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RSUVzhnD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 m14-20020a05600c3b0e00b0030d4dffd04fso80030wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=7M7aDxh9mQPyJTGuFC8r9rHflxCNmBN7jFPZ71TgYG0=;
        b=RSUVzhnDHZT5ExfgrxCq/mqT0kkOEFa7lhuxQ4/0uAHNmOyz1PZtEASjzmS4PWYlol
         6efnbCe02crGTtj/LvgJfX61C9Ex6K2GyLZYP/AEG8wdaQe5NUgHoA1q9BS833QErFZz
         MNeIyYfBn45ZeVeISCNFEXKPDJ97b4oQOuims=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=7M7aDxh9mQPyJTGuFC8r9rHflxCNmBN7jFPZ71TgYG0=;
        b=dt7dQS5UARmlIXnePw8jPeFnhJ17ndUqP6NNlxyDjCTjAyr7yhB1Z5HX/BrWuBBSmG
         nsYg2rP299jJXhFs6QEtI8XWHMKaKUU6URYIj5DRoxcxH/aAhiMBnqWdMo1nvnP0I2UE
         qtOyGkVcnzCPzW4kS2g25A4fY8idNFjJvxTUnLIih1JnXG83LExX4WuqMgq0ci5wzQsc
         9IUfmiTXQwTYOTgvr7pbg5kkcsStM8s1srJC79XsMD5HjdYHeIxqSOdZI7VRDWTxyj7y
         Q5v0Es9DaHuLogkHByZVltopQ7ApE2/n0vF9DY8YJFlyXN8t9Hm5i27UoYoVxxFIYGMD
         vvIQ==
X-Gm-Message-State: AOAM530tnbd0drI7rWgd1umGLLNxQRrUnHi0j1+E3hIDwBy9O2DsjD/A
	KC7eOAK4TLKflNmWuDByf9u6Kg==
X-Google-Smtp-Source: 
 ABdhPJzkyeA8p5xfVjD4aicmEZwT75R3fDqH238HC/1ssLbH9SPanQrCE6rAKe5Y19/OJ9oYLBiS2g==
X-Received: by 2002:a1c:4c0d:: with SMTP id z13mr18407419wmf.58.1633356682651;
        Mon, 04 Oct 2021 07:11:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dd7:3f6:3509:4eb9?
 ([2001:8b0:aba:5f3c:dd7:3f6:3509:4eb9])
        by smtp.gmail.com with ESMTPSA id
 m4sm17231604wml.28.2021.10.04.07.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:11:22 -0700 (PDT)
Message-ID: 
 <c9839c9f3bda2be330b9ee6be281b9bee237411e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate.bbclass: adds warnings for the
 exceptions of os.utime in siginfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Oct 2021 15:11:21 +0100
In-Reply-To: <20211003213834.934065-1-quaresma.jose@gmail.com>
References: <20211003213834.934065-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:11:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156592

On Sun, 2021-10-03 at 22:38 +0100, Jose Quaresma wrote:
> When we can't update the access and modified times of sstate siginfo
> it is useful to infor the user about that.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 92a73114bb..2deecd8777 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -720,11 +720,15 @@ def sstate_package(ss, d):
>          try:
>              os.utime(siginfo, None)
>          except PermissionError:
> +            bb.warn("Cannot sets the access and modified times of sstate siginfo %s, no access rights" % siginfo)
>              pass
>          except OSError as e:
>              # Handle read-only file systems gracefully
>              import errno
> -            if e.errno != errno.EROFS:
> +            if e.errno == errno.EROFS:
> +                bb.warn("Cannot sets the access and modified times of sstate siginfo %s, read-only file system" % siginfo)
> +                pass
> +            else:
>                  raise e
>  
>      return
> @@ -1165,11 +1169,15 @@ python sstate_eventhandler() {
>              try:
>                  os.utime(siginfo, None)
>              except PermissionError:
> +                bb.warn("Cannot sets the access and modified times of sstate siginfo %s, no access rights" % siginfo)
>                  pass
>              except OSError as e:
>                  # Handle read-only file systems gracefully
>                  import errno
> -                if e.errno != errno.EROFS:
> +                if e.errno == errno.EROFS:
> +                    bb.warn("Cannot sets the access and modified times of sstate siginfo %s, read-only file system" % siginfo)
> +                    pass
> +                else:
>                      raise e
>  
> 

I'm not sure we can do this as there are some cases where this is unavoidable by
people's state setups and we wouldn't want to show warnings in those cases.

(e.g. think of a shared sstate dir between multiple users where the objects
remain owned by the user that created them).


Cheers,

Richard



