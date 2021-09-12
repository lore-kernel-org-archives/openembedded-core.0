Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.17386.1631462235508600981
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 08:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=amzS8lpl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id b6so10653658wrh.10
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 08:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=waU0aZWRg6NphjEpWN/FY4NLB0p+YtIIimikaW//GRQ=;
        b=amzS8lplCaYtn/CRm/XbI78x4fCgbmCm9VQ1f8EchyupkSEDk9nc+/pd4edA6ZIDhK
         HrMsQwnWoGithpoRwM4SzRKQcMvGmiiWvnpdyW5snVkSfNnB/Xs9cGmYmQmlfF4WAZKl
         gtBC+GDTXaYlKgXZM/jXCiE0lZczSm9ebyDyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=waU0aZWRg6NphjEpWN/FY4NLB0p+YtIIimikaW//GRQ=;
        b=RijUWoopwpISBxmzxgBSl9ellztZkFXtfiwf9iesPDltKPpFspjo9SL28BqxjgwE35
         YuHk6HwoR2A5aN4C2gwnK9ZXOZgWEKoXVTvaBTPMzS+l76MZAzKVn/kcNvVp9UyT/mzE
         nZGqwqh5gxd+nEfBcIz6OVznCWv3buBy/iwuLss1yzz1+hbKNr4f0iDcGamVAwRRAa/S
         HO8h4fhFwzjDm70uEL+OxscOjoSjdUkv0jfWvaTctn6jNjDzLaboz1Luq51VA6j5UXpx
         CmZteVvBSCILk3AjSU5yUbpV3t8i4cEOD3VkV15oHS+P46EeZHJ3Qfz32zElGbpjs8eV
         fPnw==
X-Gm-Message-State: AOAM531BghGzNDd7uuNHBxS/MHPbU2XUSBytJVWqpCxVY0pwFrRTDbbL
	GkDDZDXF1FZ5t+rayo7NaAyK1g==
X-Google-Smtp-Source: ABdhPJxXUh0hokqGgfrdRmWjPoMPEqprNlKRlF8MZNC77Ig4DfyrgpjBfWs+XR3UJGgbp//z2RXySQ==
X-Received: by 2002:a5d:49c6:: with SMTP id t6mr7055257wrs.201.1631462233927;
        Sun, 12 Sep 2021 08:57:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:65df:1d9c:d97e:b357? ([2001:8b0:aba:5f3c:65df:1d9c:d97e:b357])
        by smtp.gmail.com with ESMTPSA id t17sm4820297wra.95.2021.09.12.08.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 08:57:13 -0700 (PDT)
Message-ID: <d6ad55b4fdcca27eee438031ea60b586c0f7f9da.camel@linuxfoundation.org>
Subject: Re: [yocto-security] OE-core CVE metrics for hardknott on Sun 12 Sep 2021 05:00:01 AM HST
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 12 Sep 2021 16:57:12 +0100
In-Reply-To: <20210912150121.8237296032A@nuc.router0800d9.com>
References: <20210912150121.8237296032A@nuc.router0800d9.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-12 at 05:01 -1000, Steve Sakoman wrote:
> Branch: hardknott
> 
> New this week: 0 CVEs
> 
> Removed this week: 2 CVEs
> CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
> CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *

I'm not sure I believe these numbers as tar CVEs which showed up for dunfell and
master don't show up here. Why? :/

Cheers,

Richard

