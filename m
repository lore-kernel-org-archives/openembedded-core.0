Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.5417.1621168850075511909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 05:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SdR1hBTw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id o127so2049881wmo.4
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ESniOSU9EsV/OUIdX/98lYinGXXw0AG8HmSatrCOSk0=;
        b=SdR1hBTwP/B5c7zT1yEMTTUv5a/HCIncnH7zTac83IdmnXjVyBJxR/jwB55CpRM4/e
         4i47ymzDFCw/B0DWrfQOb4zZ7fCLz8rwLha//3W4jUiM6sFaaCEJGNaIj3GXHY40Mml2
         iP9+alJYtVR4P1ed2PBZcbI5RVmtyzQTJiDjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ESniOSU9EsV/OUIdX/98lYinGXXw0AG8HmSatrCOSk0=;
        b=LQd/kXW/CGOfqLTW0q0FTkTttb8VyxPSSIN6tLICODv4t8+2h2y7GjuWzoZNnBIJfP
         IG/GFM4S3U/bDAUlMQTfwLj9NIJT0cCwZTXKqXx94Z6cKwwzsqtSnEOVNgE346/fU60R
         rAKwrKcxceyKKfVhUJKg1JTb8pDKz34j81jzg3z2OHpagpSm1sDN9PQ16tQl3qexAn8s
         JLqCON7+m6PEN+z2svaz90TED/9aQb1AI7N4K6q4oKQbf7Tl0Bu3DcX9mQA6Oz7vxY9U
         MtOoflzsvAn2lvpEP4HWQOJTciSijTne9vdt+dHoBqW55oIU+VoMvDx8aBeHsu/twjJA
         AqQQ==
X-Gm-Message-State: AOAM5336uMTEDa9CimtXJ/3Pl4JTdcUrB4EfzDJ2kA8qXw5qxeyt6FAr
	KhrcLHk2+zeAuKnuiEUOR0yHog==
X-Google-Smtp-Source: ABdhPJwn9dUhyGsQNuIR0aEntCDL523Obfp417kZ6qzkOSNqiC7aYg7VwB7FderlBr7x+SoB8DtFTw==
X-Received: by 2002:a1c:e90d:: with SMTP id q13mr11109395wmc.163.1621168848520;
        Sun, 16 May 2021 05:40:48 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:22d7:8af4:80b5:c062? ([2001:8b0:aba:5f3c:22d7:8af4:80b5:c062])
        by smtp.gmail.com with ESMTPSA id c14sm13031949wrt.77.2021.05.16.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:40:48 -0700 (PDT)
Message-ID: <6ecd0c9a94ec2d2ab907dac32bae6bb6b47e3664.camel@linuxfoundation.org>
Subject: Re: [OE-core] [bitbake][PATCH 1/3] bitbake: fetch2/repo: add support for projects to be fetched simultaneously
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sourabh Banerjee <sbanerje@codeaurora.org>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 May 2021 13:40:45 +0100
In-Reply-To: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
References: <1621164193-9434-1-git-send-email-sbanerje@codeaurora.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-05-16 at 16:53 +0530, Sourabh Banerjee wrote:
> repo tool can fetch projects simultaneously.
> As per repo sync documentation:
>   Usage: repo sync [<project>...]
>   Options:
>     -j JOBS, --jobs=JOBS  projects to fetch simultaneously (default 1)
> 
> By supplying jobs=<some_number> recipe can choose to use the
> simultaneous fetch feature of repo tool.
> Example:
>   SRC_URI = "repo://REPOROOT;protocol=git;branch=main;manifest=default.xml;jobs=8"
> 
> Signed-off-by: Sourabh Banerjee <sbanerje@codeaurora.org>
> ---
>  bitbake/lib/bb/fetch2/repo.py | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Does this value make sense as a per repository setting or an overall 
build setting?

Cheers,

Richard

