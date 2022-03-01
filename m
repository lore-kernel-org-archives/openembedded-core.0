Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34664C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 17:40:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.62.1646156442653449563
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 09:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DY3IkeeJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so1719150wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 09:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=nxe9qqQMHtmtXSUHb3ZwCrAcxf9PJSEm32lT7u+iuOA=;
        b=DY3IkeeJb/LWLzd9fYkBPay70zMEJfLSMEff84zDErgk6RwWXU1/9hzPlLrGm0hiJO
         kLkbw7KCGMREUuans3u8sM3Nq2M8ENtX7kVOTIVgC4I6rtMLkZRqdOohhq9MPDiH7LaD
         u7+lQm4PKGzadC1ACKbMYbvYN+cfw/nsbFKTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nxe9qqQMHtmtXSUHb3ZwCrAcxf9PJSEm32lT7u+iuOA=;
        b=3vtMdyjBHbhhSsBQ/lG9nXkiL1KwUZJzs/GuS/zCfL+8CAjVzLGeE9rFHBHGw2VJ8p
         eFq+6yvGSNc89j01+LfsHmiJQ+y4eh3DILwY4YwnxkCmh0sdQ191ItCtHblYy+zxI63+
         w3NfzVzgTBChOe+5xAlSkd5YGOMefVewb38vqIRKXCOfzFV7EWeSJnxgPDKyjeAFamyH
         L/0ah4wmx7HKGxKsQ4EHltUm4wocuciCnpp/nSybcJbCHB1mgfQM75FGhC23j8dfW3wA
         Yw1DuApyxsk4Z11XPsR/KyX/eElf+dDRgD/NBEld+mBNYfn0APqQykvfouc3GHSuZa39
         +4hA==
X-Gm-Message-State: AOAM532dHRBjb/+4vRb2ZM4HH+CgEYA95z2KiEYKT6QV0QJec2xYq+iD
	6hm+q56eWIFzskTftZmuBdAsIA==
X-Google-Smtp-Source: 
 ABdhPJzkcz/6Bh/6y23pB9CmWqA9LBZpztTvSnz380NZxPv0uJZLNr2O7MXSrsMP+2kmMa9jz0YDqQ==
X-Received: by 2002:a7b:cd96:0:b0:381:201e:ba06 with SMTP id
 y22-20020a7bcd96000000b00381201eba06mr18031080wmj.78.1646156441096;
        Tue, 01 Mar 2022 09:40:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f88:ec89:14b:c380?
 ([2001:8b0:aba:5f3c:5f88:ec89:14b:c380])
        by smtp.gmail.com with ESMTPSA id
 n5-20020a05600c3b8500b00380fc02ff76sm3451397wms.15.2022.03.01.09.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 09:40:40 -0800 (PST)
Message-ID: 
 <93d63f085b91f10d0e4b8c3cc54155d0d5baacf2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.37.2 -> 3.38.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Tue, 01 Mar 2022 17:40:38 +0000
In-Reply-To: <1646140075-39370-2-git-send-email-wangmy@fujitsu.com>
References: <1646140075-39370-1-git-send-email-wangmy@fujitsu.com>
	 <1646140075-39370-2-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 17:40:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162567

On Tue, 2022-03-01 at 21:07 +0800, wangmy wrote:
> Remove invalid PACKAGECONFIG : json1
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-support/sqlite/sqlite3.inc                        | 3 +--
>  .../sqlite/{sqlite3_3.37.2.bb => sqlite3_3.38.0.bb}            | 2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3.37.2.bb => sqlite3_3.38.0.bb} (86%)
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> index aa5dc0974b..b89f509c12 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -23,7 +23,7 @@ CVE_PRODUCT = "sqlite"
>  inherit autotools pkgconfig siteinfo
>  
>  # enable those which are enabled by default in configure
> -PACKAGECONFIG ?= "fts4 fts5 json1 rtree dyn_ext"
> +PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext"
>  PACKAGECONFIG:class-native ?= "fts4 fts5 json1 rtree dyn_ext"
>  
>  PACKAGECONFIG[editline] = "--enable-editline,--disable-editline,libedit"

This triggers:

WARNING: sqlite3-native-3_3.38.0-r0 do_configure: QA Issue: sqlite3-native: invalid PACKAGECONFIG: json1 [invalid-packageconfig]

but I fixed the patch in master-next.

Cheers,

Richard




