Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.125.1631657371168453128
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 15:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lqeto/uF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id x6so552771wrv.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 15:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=967oBE3rw6QPyHOrL966ZG22I+ZcXWx1Tu/Om6kx2lI=;
        b=Lqeto/uF02X9X1zKW5Ncl7uSsMgTuufHNwmUZ5ghyuRjOqD/25AICtZgZjOcqV1brJ
         vh0+WjwJDwyDhr+MH6ytWPQa3BkgX1Tibd4wP1sezr1ZsecEmJbfTu/ylnftPDssAsL6
         +LBilystp2Wljs/8H4cVTOTWOIsbUyhggAhbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=967oBE3rw6QPyHOrL966ZG22I+ZcXWx1Tu/Om6kx2lI=;
        b=Ya+8gHpaLRUHYuNWZAGOpmkHbzArLcpF4yd/eKVQMAPR3ltLwKsX+Tu8JhbsGy9R66
         fvVcKmv1tfoTDkTNgErRu3VtD/dNGdasXq+a+W+nUK4tj2jvq3EkL50GuULMubfKwDzo
         rocF17kRoYkm6HxdFMFtSgYPDO7nWj0al0qz0aR+Xt6OFQhPjmKaO+R3G6UqvYSwswok
         t/9EOBj6eQ9v7Gt0VItOtCqvcQkwpOpEVSeL21jegSoqCKooPGg4m2LHmpNUKrM9MMCO
         J88jnum6JbBTd5iYwp24sgSR5xLTmHzG+pUmXyQV+Nw2h8ntVjRM8IBzD3OwWdMwh5Ho
         fKmA==
X-Gm-Message-State: AOAM532OKxgaS11P81XD+hoyZTK6AKw0Hi36CVtBcK5qLyl+3VXMZOlo
	hTv9nftAZuCHIp3G2ahphVE8vQ==
X-Google-Smtp-Source: ABdhPJxMBnpETxLvFP+CMv4JPnh4gSAscGBYAeEK7NPm+nCkPx2yic+/4Dy/Edie4ffYtI4jof875g==
X-Received: by 2002:a05:6000:162f:: with SMTP id v15mr1458392wrb.118.1631657369452;
        Tue, 14 Sep 2021 15:09:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:cb98:b99:6df8:dffd? ([2001:8b0:aba:5f3c:cb98:b99:6df8:dffd])
        by smtp.gmail.com with ESMTPSA id d5sm12277615wra.38.2021.09.14.15.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 15:09:28 -0700 (PDT)
Message-ID: <e9b196f7bee3f5ba03aced27cb1228aa9d46662a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/1] oeqa/sdk: assimp.py -> cmake.py
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, 
	openembedded-core@lists.openembedded.org, ross@burtonini.com
Date: Tue, 14 Sep 2021 23:09:27 +0100
In-Reply-To: <02077d8206a44e96485ac7006e8e044dd755a269.1631518973.git.liezhi.yang@windriver.com>
References: <cover.1631518973.git.liezhi.yang@windriver.com>
	 <02077d8206a44e96485ac7006e8e044dd755a269.1631518973.git.liezhi.yang@windriver.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-13 at 00:45 -0700, Robert Yang wrote:
> The downloaded non-free sources, now download expat-2.4.1.tar.bz2 to replace
> it, and also rename the test case to cmake.py since it is used for testing cmake.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>  rename meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} (81%)

There were a couple of failures so far on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/3979/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3989

Cheers,

Richard

