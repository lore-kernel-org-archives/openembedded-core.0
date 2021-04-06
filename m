Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.10112.1617705967909766067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 03:46:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MadLk8eJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id v11so13667075wro.7
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Apr 2021 03:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wvGNkM8N2L0oRG6yjAk9xjtNso5nKgDY2ZLXAAKx8Nc=;
        b=MadLk8eJruQoih0c/OkwNn13AXfziV5AuRsAxvS9r9J620ImVTLoL7XA+9gTBnzhOo
         fdjvQj9FvixcXheyMnny6twXOVKq+kcxFpz2OrAranZOedecmNjznXb4uxtbeYxZmcOc
         ex0Zn0AKn9z2wPhxV2SQhEREIwz1JryzBylOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wvGNkM8N2L0oRG6yjAk9xjtNso5nKgDY2ZLXAAKx8Nc=;
        b=LbuYdxkaP8os/FfdZ2U72btLgysY/IrP9pxEtcqRsGbf0UTUqO3q8Sj/8X9VneOr0y
         dsSFx84vysP1C7cnyJ2UbPBRSXt3SAAE7M1692yI2cwBbx5xy0+23c0TmVOiqyTRTWCG
         jaBV5bbQSZIBYkqMBApdaW17/DeJG35SJO9FcDXWGLFiHcI9ouXt/vFysqWhFFIvxWKk
         mWA/cq8eA5sH2ah6GE7/cZeQlURADWu1i1d75FxBJOWPR7aFdUqYTtcpYOZBOsJBXs7n
         7K/V/vaIEwlFK3prEX9dIgjjVh3jD8O6qb3cvtByf7ckvOk3iW0+5slh4Le9dRpnqPdu
         gQQw==
X-Gm-Message-State: AOAM530y2mjyl7BVmFfBkGH3MY9qLWSD2FpOq/FNlwoOSXmGIqILpJsQ
	yM+YRJBsZ2Hc/Hz1N+NmlYvAxQ==
X-Google-Smtp-Source: ABdhPJylMXY6Xb/1tyEoprhGD/VTwPSRFmG6uGQXqorPdlck4p1o3R9BX/MR5d7bYpH3Rb+SOmgGiQ==
X-Received: by 2002:a05:6000:1204:: with SMTP id e4mr8306069wrx.266.1617705966476;
        Tue, 06 Apr 2021 03:46:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7a9e:d3b:5548:6469? ([2001:8b0:aba:5f3c:7a9e:d3b:5548:6469])
        by smtp.gmail.com with ESMTPSA id o2sm4119777wry.4.2021.04.06.03.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 03:46:06 -0700 (PDT)
Message-ID: <cbe5c99c22843b74999ac88d244337faeaff8f34.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 0/6] RFC: Enable world reproducibility testing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 06 Apr 2021 11:46:05 +0100
In-Reply-To: <cover.1617633691.git.steve@sakoman.com>
References: <cover.1617633691.git.steve@sakoman.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-04-05 at 04:53 -1000, Steve Sakoman wrote:
> This patch series enables world reproducibility testing so that we can begin monitoring
> progress on reproducibile builds for dunfell. It also includes a version update for
> diffoscope to better enable debugging failed packages.
> 
> The main downside to merging this series is increased autobuilder load to run the world
> tests.
> 
> I've been testing this over the past couple of months and have updated the exclusion list for
> dunfell as I've encountered intemittent reproducibility issues (see selftest/reproducible:
> adjust exclusion list for dunfell)

Much as I hate loading up the autobuilder, improving reproducibility in dunfell
where we can relatively easily is a good thing.

It could be we just don't test it on as many targets as in master?

[which means I'm in favour of these patches]

Cheers,

Richard

