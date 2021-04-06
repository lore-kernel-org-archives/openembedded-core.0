Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.10284.1617706149894107024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 03:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RpS1AGfw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id e12so637724wro.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 03:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rayQWN0hBcsUPdU7zsze8m71jka4sho8qgJxJKcrH4Y=;
        b=RpS1AGfwkb16Mc+1M16FwK1xPYAV+thWN2qZqlT8XVqIFs9PYJDLQbPNhoLfSJz2DG
         MOoR4uxcH0E/WSpX/1x3waJZEilxu5siXj4uvluqMN8ugssdahW7Gu7T9gvFvt3levDW
         /yISUt7twRZhTclQVA5uDT2Syz/9Yr38OwHSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rayQWN0hBcsUPdU7zsze8m71jka4sho8qgJxJKcrH4Y=;
        b=UEYNIhUwc3Gozo12idpyzukfdsjQhu589cD7xeM76JqhG0mfa7RhV7S5vw95lYRBc7
         JgZJ9VY6lZqC5xIlzO9wPQ5qyajenHg+II0h+6tPQ0RHHsm7uxDZVBrnWuHudpC8Ep6s
         lEMo5i7VDxtGI4Okx9B3asnsGEbvnljY9dl0VE92ne/lVuEijz52WOTCbOOWDb1Z0WkS
         F0I7IEw5zse6qUTHMriqweRUlc/84ag5HKaMJoxrwVOBHgw97dRUKCmKubb/Go8A3J+j
         WgOik1QXrKBkHNnIxlnoJRerFDcmUBKvgPU6+yrBBr5r0WkxilyTNyDVJvK+wMmCfkEP
         xsLQ==
X-Gm-Message-State: AOAM53309/1PIsbyMKkW7fg1C7Ta7ei/UPdfHw6GZvgBCVqhwHth6QyL
	9E63MyPwaHfTwPgvYnZvybT79g==
X-Google-Smtp-Source: ABdhPJxiV/IaALa8TvvVAT5HCk9gPg8qMpJ6r0T2FcjgaIqs0LkTYsOAZ4RFaD/B5W5efIjJglwuRQ==
X-Received: by 2002:adf:f88a:: with SMTP id u10mr3352549wrp.162.1617706148592;
        Tue, 06 Apr 2021 03:49:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id e13sm36128962wrg.72.2021.04.06.03.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:49:08 -0700 (PDT)
Message-ID: <3e693a34b87c151c4672fcd59b23aab3bf6b55de.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky][master][PATCH] buildhistory.bbclass: store MAINTAINER variable
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Purushottam choudhary <purushottam.choudhary@kpit.com>, 
	openembedded-core@lists.openembedded.org
Cc: harpritkaur.bhandari@kpit.com, nisha.parrakat@kpit.com
Date: Tue, 06 Apr 2021 11:49:07 +0100
In-Reply-To: <1617262550-10558-1-git-send-email-purushottam.choudhary@kpit.com>
References: 
	<1617262550-10558-1-git-send-email-purushottam.choudhary@kpit.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-04-01 at 13:05 +0530, Purushottam choudhary wrote:
> The maintainer declaration in the buildhistory
> is useful for tracking the maintainer of recipes.
> This change adds the MAINTAINER variable for
> recipes and packages to its buildhistory data.
> 
> Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
> ---
>  meta/classes/buildhistory.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)

We could add all kinds of things to buildhistory but I'm not sure
there is a compelling case here. The idea is buildhistory reports
changes in output such as size, changed dependencies and so on. A 
change in maintainer is pretty much always going to be a conscious
decision we've made and clearly visible in the commits.

What justification is there for adding this? Which kind of change
are we trying to detect and report to the user as a potential
issue (which is the point of buildhistory)?

Cheers,

Richard

