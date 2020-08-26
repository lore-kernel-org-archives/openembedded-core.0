Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.10563.1598442271405409662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 04:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b0PAcNFA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id o21so1461730wmc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=znw4PiUSM54rTfHi7IMVYUOXczcCxewY0LGE38/azzo=;
        b=b0PAcNFAHUvEiub23WytcwgTsS2px/HqWJtpfOqLIoLYMOQIofO51yit7/MyUYClXa
         jAZjY3lcYm34TTQ/k3nIBZRmlOo4uxrG7R21yWP/ekm+PKTUn5P4zt4SlUTPzQzoi2eQ
         cCGEAxxnWTH8sqJOfUJXmo59/NI7IsrP5A4TE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=znw4PiUSM54rTfHi7IMVYUOXczcCxewY0LGE38/azzo=;
        b=r4sweWKJ07KLnKmzzZVKq5nd9V4QMh1DROYEq5braeO8HhUoqNmkNuhd93k9bsrFSq
         +hfzT/APJXL0yS6XefM9TMHmoM6r7m9iBaadatV3bgg45YZjuuIQj8v7TQiAnD1fD3is
         AeUvR4kx8QwEDz+AgSrjhRg08aJF+aRe+Zz90j5wPYVK2F4F36Yqyxo1aEwURyT7Xg+x
         WDuw11hq9xwoA5xfpeZpcQ1oNsW5A8lrdtFC3Y4jhLavr+EIcg2u715vFf34WJq+mrwh
         yzUfw1il3oMDxq0+pe2i8GvH+iD/sOL+6zlwp48GBZwmnvJ5xkup9+PloNlbEPPf6XD5
         HgAg==
X-Gm-Message-State: AOAM530TC0gG/eMcD5ARFyql3otJvxmtuyf8YSDGFTkICjfklPWOMTFS
	4AUVXla7euBLDiIO24deRczKtg==
X-Google-Smtp-Source: ABdhPJz70AdURAsZdN6TbSE9EJk45/1IFwUie/+ccOa++CxkcZxIDMt9bjCkb5rN5DSfqu2YtvFqZQ==
X-Received: by 2002:a1c:2808:: with SMTP id o8mr6380365wmo.108.1598442269736;
        Wed, 26 Aug 2020 04:44:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id g17sm5299798wrr.28.2020.08.26.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 04:44:29 -0700 (PDT)
Message-ID: <636477d3d55d52f18448d041669d2d6c590572aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH v2 4/6] package.bbclass: Move package_get_auto_pr to packagedata.bbclass
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 12:44:25 +0100
In-Reply-To: <20200826112733.52492-5-mark.hatle@kernel.crashing.org>
References: <20200826112733.52492-1-mark.hatle@kernel.crashing.org>
	 <20200826112733.52492-5-mark.hatle@kernel.crashing.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-26 at 06:27 -0500, Mark Hatle wrote:
> Running package_get_auto_pr during do_package is 'too early' when we
> need to evaluate the do_package output to get it's unihash to look up
> the right value in the PR database.
> 
> Move this function packagedata.bbclass (no changes yet), as 

The "no changes yet" isn't true as the new function is using
BB_TASKDEPDATA?

Cheers,

Richard


