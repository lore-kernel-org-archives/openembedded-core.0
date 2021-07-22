Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7224.1626958315332233538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 05:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZU5JncsG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t5so5805044wrw.12
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jul 2021 05:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=OHMUYK5IrJYiYrFwq/QknAioeDm9r9yGmcJeRM/hEm4=;
        b=ZU5JncsGjBj74ESQqle8NQ0u+ukdB5M4N5c3I3wx/e562CD+o7U4eqJK1w+hSLDLqb
         KZ0POIXXwCVFl4C90C3siipbma/Pqli4fLSJ6KYcUbHE0nG+0hho9cMsNp1daWanw4fY
         shbl+bnO2F0UF7IYZYlXlA+JTMSbz72T0DhWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=OHMUYK5IrJYiYrFwq/QknAioeDm9r9yGmcJeRM/hEm4=;
        b=Acd7hOs9Cjwax7VxuDwrrQBBcwJcYgIG176hna0FbjSirlAJgiXMqNylrTyEcLy2AN
         ns46UoMK5GTjdEOpDilFTyk71KXE7O97zmYA9uwbXgFb+AhjUG2hhTUYiUeqMdZXvbUO
         9McBzJFHgJQO527BToiw85T84Ys7XcKbmZ3p1sYQ9k20iH+73jXG+mQr3BypkeUO2Rgl
         WnNgsL3Odk8uOd9Kl2BqHqdguZ/NvHL4l65RiDs6UP66sbguXfOsIugyJo3InY+csgjC
         GLZuYcJ1WkAv0j+uN+JhkFBLSROaDvlKT77TMnQaGOeVZcJqTPEAHJQFN0p6XDu4QYrQ
         uRdw==
X-Gm-Message-State: AOAM532zSWC4l1Hdf+JcKO/pheb9ZBUFOn9vkYTa69OIWk1cv5YLxbhE
	IvPZue01uH1WRmjigCfg5NcspQ==
X-Google-Smtp-Source: ABdhPJztxCvkInbKOr4YO1nzNYTPMLRpT4pt0qZ/1LFoPkVgCNHa7BN+E3OuQ7q/1iWoMDJrcDqU7w==
X-Received: by 2002:a5d:408a:: with SMTP id o10mr47003099wrp.272.1626958313772;
        Thu, 22 Jul 2021 05:51:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:40b3:3f27:e412:a801? ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id i10sm16864377wml.31.2021.07.22.05.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 05:51:53 -0700 (PDT)
Message-ID: <103451053486f29a5fee270e987f9016f5572467.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] yocto-check-layer: add support to check for dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 13:51:52 +0100
In-Reply-To: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
References: <20210722124644.19962-1-nicolas.dechesne@linaro.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-07-22 at 14:46 +0200, Nicolas Dechesne wrote:
> It has been recentely mentioned to me by the YP TSC that a layer must
> not only pass the yocto-check-layer script, but also all its
> dependencies. These patches add support for testing dependencies
> automatically.
> 
> Patch #1 and #3 are not much related, but improvements I made along
> the lines. 
> 
> Patch #2 split the internal function into 2 parts, so that we can get
> the list of dependencies from the main script. 
> 
> Patch #4 is where the processing of the dependencies is done. I chose
> to enable checking the dependencies by default, and use
> '--no-auto-dependency' to disable it, we could decide the other way
> around. For any dependency of the 'layers under test' we will simply
> add them to the list of layers to test unless they are already there.

I'm fine with the changes, thanks for doing it. I think we'll need to add
this option to the yocto-autobuilder-helper config.json entries else
the current testing will take much longer. We're safe there to
assume that dependencies are tested separately.

Cheers,

Richard

