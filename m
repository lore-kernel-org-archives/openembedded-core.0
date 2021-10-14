Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BCAC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 10:32:11 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.7607.1634207529897373554
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 03:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F5SO/wfa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id o20so17981503wro.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 03:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=WjGruTkVs+QdP9rTWflfzNjbZm7IRqse/yy3tumvgqI=;
        b=F5SO/wfaeoTftdtPNfogD5oDpnfa7p4f6z6jdY5MnTvQin+Q94wUZ1uttWbLCwRzEG
         7jLvUCq+pu5BuXJ9SsMJ4BoWZCe11uhUfE/TYgGhnyTSJB8zZm3GIBzQLAlasbstf/UH
         w7Xu1LR3u7iHLHxN2Hy8gZQLdjhsnZPBMZZ/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WjGruTkVs+QdP9rTWflfzNjbZm7IRqse/yy3tumvgqI=;
        b=vnCiHCPKcQYULHKOexrxVzoc4ZLRZdN18fmqAfu6HEcxCpKNiVMkLqAsNiclOQuCh1
         XTFXFoZy1AidgYi8NvKn/yAZs+1wSJLZvhT9l0EAxrOsBtYd4/NrlQ6jfYFvOeOa3yxt
         CANH6v3l0+NeztnSbDNyptMihj7rnkuCbCnKlk9Q5MwXcXfgrdGi7Qom5I+Qdq+5zeI4
         427ehRlZiRARBjqVNVZijvFhSxbkwSJXb2z+eQaL+/xB2OOpjc96UrH4QUWi1lNjHloY
         yOdLcR/2lL9JU7wazEJGwSfDsqeA20HqKxjOSm/uJcYqQCGyY3W34Za5bkD1rOFeMJ91
         baOQ==
X-Gm-Message-State: AOAM5317Gf3ez7oWPAe2xQVr3LbYUIR0aQbc0K2lKYNRLdvWD1i6qONk
	qFz0L4EO3B0AXIHvk22RG6G7qA==
X-Google-Smtp-Source: 
 ABdhPJy1/HJqAWYcsjkUq8ZSVtBiVusqKDeUNpunB18+iRB8xL0u4QTAEOPFgxFvzW+xtpEGzPRV0Q==
X-Received: by 2002:a05:600c:1c10:: with SMTP id
 j16mr19009077wms.12.1634207528351;
        Thu, 14 Oct 2021 03:32:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eb5c:837c:62b1:b238?
 ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 f18sm2007378wrg.3.2021.10.14.03.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:32:07 -0700 (PDT)
Message-ID: 
 <f0a609813dfaff7347e80b4e6106b0fc25f555ee.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/1] ltp: Update to 20210927
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Petr Vorel <petr.vorel@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Anders Roxell <anders.roxell@linaro.org>, Naresh Kamboju
	 <naresh.kamboju@linaro.org>, Daniel =?ISO-8859-1?Q?D=EDaz?=
	 <daniel.diaz@linaro.org>
Date: Thu, 14 Oct 2021 11:32:06 +0100
In-Reply-To: <20211002172555.22829-1-petr.vorel@gmail.com>
References: <20211002172555.22829-1-petr.vorel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 10:32:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156933

On Sat, 2021-10-02 at 19:25 +0200, Petr Vorel wrote:
> New patches to fix functionality:
> * 0002-lib-fix-MemAvailable-parsing.patch
> * 0003-lapi-rtnetlink.h-Fix-include-guards.patch
> * 0004-lapi-Create-if_addr.h-and-reuse-it-in-rtnetlink.h.patch
> * 0005-lapi-if_addr.h-Define-IFA_FLAGS.patch
> 
> Removed patch from this release
> * 0001-syscalls-ioctl_ns05.c-ioctl_ns06.c-Fix-too-small-buf.patch
> 
> Rebased patch
> * 0001-Remove-OOM-tests-from-runtest-mm.patch
> 
> * Updated copying (reduced files in 5eff445d4 ("Reduce LICENCE/COPYING files"))
> 
> * Updated removed musl incompatible files in
>   remove_broken_musl_sources() (process.c was removed in 926d3b906
>   ("sched: Remove process.c")), also update link to CI file.
> 
> 
> 
> diff --git a/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
> new file mode 100644
> index 0000000000..4a9a5b2363
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp/0002-lib-fix-MemAvailable-parsing.patch
> @@ -0,0 +1,36 @@
> +From 29a096fe2bd356f419bd8a8404d5b652c996b92f Mon Sep 17 00:00:00 2001
> +From: Ralph Siemsen <ralph.siemsen@linaro.org>
> +Date: Mon, 27 Sep 2021 22:18:50 -0400
> +Subject: [PATCH] lib: fix MemAvailable parsing
> +
> +The amount of available memory was not being returned correctly, which
> +resulted in tests being executed when they should have been skipped.
> +
> +Fixes: 8759f4 ("lib: adjust the tmpfs size according to .dev_min_size and MemAvailable")
> +Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> +Signed-off-by: Li Wang <liwang@redhat.com>
> +Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> +[ upstream status: e42149e28 ("lib: fix MemAvailable parsing") ]

That for the upgrade. Just for future reference, the format for these is:

Upstream-Status: Backport [XXX]
or
Upstream-Status: Submitted [XXX]

I've tweaked the patches in this case.

Cheers,

Richard




