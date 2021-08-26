Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.28163.1629970760377242964
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 02:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bM0bQvoD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n5so3955556wro.12
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LBP5k6zofuJ8SnlIDE4ivSbGpGba41fnz06NVnu/wGI=;
        b=bM0bQvoD5vJguA7S0qXDImBA4Su5/JliWtwOeRB7q1w72yKZDRVFjjEmliZalu7jhZ
         TrCR0VX9u8e9mfWexlfdoCrU70o4fYGw7Og32IcxcolEBwL3VfOxD3PfP+gVlG9/DCmG
         74oV7y3hPnktUw09tGFKXNwsLP5XT9TIGL6hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LBP5k6zofuJ8SnlIDE4ivSbGpGba41fnz06NVnu/wGI=;
        b=S6DUC+XEeATqczgws4ohe2EEfBfDhenhXUJdixjIXCsC+LxLNHP8YbzqDb3/zd3ShF
         6h70NbwebYo1ZGSkQmQEJrxdqFcQSyqVl4pA2mrXCfB1E7UhVSCJJ92Xd9uzRPt3/AdS
         Bh5CEcvHxImES046pIgvWbtL+q1wwM6UBM3GZpRNMVPooCfJn+8+Z7O/Le9bPhNqyRmv
         wO0TZpF88cQ4UooWHUTDCszIdIzaX8axVSD7DoiAfFJgQR0qgY/M5B2vnMTBi7mN9i3v
         kOnWMwtCELFkleDQ8Et4gSBYH4FihnDNpGmKPeWQ7CsAzi3piaxwCdF+Mmz4cje016kH
         fkHg==
X-Gm-Message-State: AOAM530Cn9JtVbmIUIXyYjMU+OPUSH5x9KmznnQdQOBYv0SVTwR5HfBi
	D6STXrrx3o3Fk96m/51CpoXpSQ==
X-Google-Smtp-Source: ABdhPJyHRURi4Rvp/BTL/S9CY/pxzTfhWPu80pDrAHH502I60UHaeQyZ2ebud3NifYwhyo1EKtqpIQ==
X-Received: by 2002:adf:f101:: with SMTP id r1mr2760350wro.355.1629970758870;
        Thu, 26 Aug 2021 02:39:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id e2sm2888643wrq.56.2021.08.26.02.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 02:39:18 -0700 (PDT)
Message-ID: <a8785fb579a1573f0f383167023cb7425c3a17fb.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/4] kernel-yocto: -stable version bumps
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Aug 2021 10:39:17 +0100
In-Reply-To: <cover.1629907508.git.bruce.ashfield@gmail.com>
References: <cover.1629907508.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-08-25 at 12:06 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Nothing too exciting here. These have all build locally and I haven't picked
> up any issues (I've stayed off the AB, due to the extra load you mentioned
> it has been under).

Thanks, the AB has been under a fair bit of strain. There does seem to be
something wrong with the versions in the series:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2150
https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/4179
https://autobuilder.yoctoproject.org/typhoon/#/builders/122/builds/118

I stopped the build as it was clear it wasn't going to end well.

Cheers,

Richard

