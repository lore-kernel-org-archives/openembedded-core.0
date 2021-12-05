Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8885BC433F5
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 12:39:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.37016.1638707979749174971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 04:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OBKhlsFR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id i5so16421904wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 04:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=CzUn11DL/mKcrsRClq0uyVxWpHLkKpSKT22uLiEydhI=;
        b=OBKhlsFR1xcWNt8/MDvUK4IUEVKTgfuiPq++Z+TVukao6Q4bibL11L7E1UAW2Yb5nf
         TClE5zQW0PZCYZd0l6PFEIqq65zZEwsLKCePSboLKf+5nmo3fA2NS5VC56LDzl/5gnj3
         qsnZ5tVqhcEdOPmn7UB9t4Qn+36wliNBeuWtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=CzUn11DL/mKcrsRClq0uyVxWpHLkKpSKT22uLiEydhI=;
        b=stInTwGsVQm2VkdVhogSqc/Ai0JQKF/WDNHwp7bA+MwDnNZMezRsZtBA1u4nP0Aq2C
         7BRTVttOmFIf2Zjc0eMLQRjAfSdZrVb3qAZrngfnLN5ylPxg0aO4JXoSikBjWV4rgBR2
         MMJYTZP0YALvWLrZV+xiSA3IE89f7C3GBop8JJEZzLVdGKNvyu8xQuniWNSlaTJlugy0
         laHDvdX6cddh+M+EhcLgVsAMMT3aAQpzR/AjuwIJBcLIU1TqxchtOTluk2kFGdFSbVN3
         YdJqpUIWEpgKxo54n6F9ar78Inzis8E0umu8c1EXO2PQq2gkf2PHGroCVF7hWEEKFj/1
         oaHA==
X-Gm-Message-State: AOAM531oEF+NcXJn0rB0DJgc66ld9iiiryKKm2uqWvLnTsYM0gf5cxEc
	m4kufjw8wj3Dl8NLNW8HAC12xg==
X-Google-Smtp-Source: 
 ABdhPJxQhvz3kcbF5It5/MjKwcXpIh+TT2Si9uytKvK0oepZliSCLXXnyUh1OamPvwOSa9bK9HYAIA==
X-Received: by 2002:adf:d225:: with SMTP id k5mr36171959wrh.612.1638707978034;
        Sun, 05 Dec 2021 04:39:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:685e:e95e:8e62:a31c?
 ([2001:8b0:aba:5f3c:685e:e95e:8e62:a31c])
        by smtp.gmail.com with ESMTPSA id o9sm8337401wrs.4.2021.12.05.04.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 04:39:37 -0800 (PST)
Message-ID: 
 <778109a1ac6465c3639a8e794cb9613ef472a908.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 01/18] cve-extra-exclusions: add db CVEs to
 exclusion list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 05 Dec 2021 12:39:36 +0000
In-Reply-To: 
 <2a157263e5632146b28fb3c0678c18c21f357d34.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
	 <2a157263e5632146b28fb3c0678c18c21f357d34.1638555254.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 12:39:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159191

On Fri, 2021-12-03 at 08:18 -1000, Steve Sakoman wrote:
> Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
> supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
> 
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/conf/distro/include/cve-extra-exclusions.inc | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
> index a6f52b5de7..e02a4d1fde 100644
> --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> @@ -44,7 +44,14 @@ CVE_CHECK_WHITELIST += "CVE-2010-4756"
>  # exposing this interface in an exploitable way
>  CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
>  
> -
> +# db
> +# Since Oracle relicensed bdb, the open source community is slowly but surely replacing bdb with
> +# supported and open source friendly alternatives. As a result these CVEs are unlikely to ever be fixed.
> +CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-2015-2654 \
> +CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
> +CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
> +CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
> +CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
>  
>  #### CPE update pending ####
>  


Do we need to fix this in master first?

Cheers,

Richard


