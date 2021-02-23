Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.7247.1614069141865926392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 00:32:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VskVqDAB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id b3so21644952wrj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 00:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=uijsOLCJMRCjjLcO31sRgYL1xSn5YSOQlMa7/dzKSxA=;
        b=VskVqDAByQnCwc+93sj79XJIbJD6bqc67mDHjzi3QSzHaisfxgYrV/gHG+VjJz8omi
         W81RVbor4AmAeSmZBqWd9Obx4VVv/ZvVf9Xrn1nf6EyG5wz8cthhl7Mz7rcli4fLAf9i
         f4Y0K+nyfIa+SBxfg2+LCjJ5+z0rqw5fl42gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uijsOLCJMRCjjLcO31sRgYL1xSn5YSOQlMa7/dzKSxA=;
        b=RXMnNSChyWT2+svxFQ4dNaxq/bCt506v/ssIvKYBwlXetNnpmLgkHC5KoUOHGIQIsj
         uwslnLDLOpmXOjLJYLIU6tLV8vKx4wngfDjf0bCb9K9SgEVPLAji8kw6RODBh3ZxKBHz
         9Re2pr46dPCa9uznOEE3NQhCC8FG4RpUXkr44+gP9TQHPM4bgb3HoK9b+hPuraalcxK6
         S745R+F0339Q6yk2GddfkXjyrEpm1jWMuSOjFBHS3KaRmhWC+pozT84c2zy03vKjyp+3
         H9OcMGzsvTRUSQ6YmalHoqqKXerVWxpdBolnwFjmIIXcMRxp7/irq8rZozN9WHUlVU0h
         x+dQ==
X-Gm-Message-State: AOAM532YbwV3NlQd4fbuarIBA0jX2n8C1DNfEWNx7ZP1sBoo+an10jV5
	RR6YqZSkHO4pMhYHlNwANJG0Cg==
X-Google-Smtp-Source: ABdhPJywcfXAU2OR2JEapoSyWiK6UxQ7lBGRfj53dooNrX4lVpFd7pOjRjS0hhFiRA3aHVo7BcV+UA==
X-Received: by 2002:adf:ed87:: with SMTP id c7mr12072722wro.113.1614069140447;
        Tue, 23 Feb 2021 00:32:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9491:94ce:53e1:ca3c? ([2001:8b0:aba:5f3c:9491:94ce:53e1:ca3c])
        by smtp.gmail.com with ESMTPSA id a6sm1888759wmj.23.2021.02.23.00.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 00:32:20 -0800 (PST)
Message-ID: <1ca08dfc36b0642e70bc57997db157deaddfd410.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] vim: Improve reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: oobitots@cisco.com, openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2021 08:32:17 +0000
In-Reply-To: <20210222164211.23449-1-oobitots@cisco.com>
References: <20210222164211.23449-1-oobitots@cisco.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 08:42 -0800, Oleksiy Obitotskyy via lists.openembedded.org wrote:
> Override awk and perl path to avoid
> using local absolute path.
> 
> Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
> ---
>  .../0001-vim-Override-perl-and-awk.patch      | 34 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  3 ++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/0001-vim-Override-perl-and-awk.patch

Fails in vim-native unfortunately:

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/26/steps/13/logs/stdio

Cheers,

Richard

