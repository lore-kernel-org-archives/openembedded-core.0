Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.27579.1603637523265668302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KiqABJGs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t9so9616119wrq.11
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Jnphon4Focr46M6AonHKUsn1yY2R7N3NVhoVLKLiIiE=;
        b=KiqABJGseyBcTpJ3jraZXzgnsS2hbqhzqHokhxJowfexDRSlAz4YfKo7y68HlMlg2r
         F+r+/PEl65bXSmnBpYmd3b4+8sTmfCb0KHDBOsNTYms31IGKc+YVODLTwe//J1CMSoSR
         S2lbLpsDNehL1DcMgT9tYw0ozrZhLlaQfa7XQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Jnphon4Focr46M6AonHKUsn1yY2R7N3NVhoVLKLiIiE=;
        b=pGkp2g2HPCN4w9Px/dRT1OtQzEpxIwUZoNM4TTDlJ/EoBwNyjxk1v/Nq4jIKDFNIP8
         friVX/gAIqP5+qVQkasdQkD4goU3Gs3bR/zLbeEWdpy3nX5d7TKO68d7C8HNxBVps4Bn
         i4uoy3zpZ4LvqBgPjonKtGbBe6hYKUzKOUfwqbK0WCLcDBlFfvgFZqcC2/+dBj9TJ7+D
         UuQYLbPevDSlaYsblS8Fsvys0CpxmoriNKvUgJkpWYXcXExBCIUqxLBmtXZ2Qu6FVT18
         /SlF78Bj3wTipmXHnLPVImo+R4csQmb3g6eikoqZWgHqPDHRvdGpknuDQLC5JEtMNpbI
         garg==
X-Gm-Message-State: AOAM533h3vEgDihZauGOeH9WVp8URDNCFlyu3R5tIyD8C14rkJcLkdG1
	dPBwJSH/+bDYsEPEtYDPEfPVGQ==
X-Google-Smtp-Source: ABdhPJwmRqzVbxMgewlt+ir1NDwXsy3aXZFuFuZT7R/NUm5LJ9bgdx2YUjNyFHPXIp39lSWNk5c/dQ==
X-Received: by 2002:adf:e4ca:: with SMTP id v10mr13935457wrm.53.1603637521662;
        Sun, 25 Oct 2020 07:52:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.f.3.3.a.5.1.9.5.6.b.0.0.2.c.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.f.3.3.a.5.1.9.5.6.b.0.0.2.c.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c20:b65:915a:33ff])
        by smtp.gmail.com with ESMTPSA id l26sm15560858wmi.41.2020.10.25.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:52:01 -0700 (PDT)
Message-ID: <436d7e8c6bb8f34052c59924eb8020145e413dfa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/5] spirv-tools: import from meta-oe to OE core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 25 Oct 2020 14:51:59 +0000
In-Reply-To: <20201017142935.3605756-1-quaresma.jose@gmail.com>
References: <20201017142935.3605756-1-quaresma.jose@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-10-17 at 15:29 +0100, Jose Quaresma wrote:
> This receipe is needed to build the new shaderc
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  ...0001-Avoid-pessimizing-std-move-3124.patch | 50 +++++++++++++++++++
>  ...STALL_LIBDIR-in-installed-CMake-file.patch | 35 +++++++++++++
>  meta/recipes-graphics/spir/spirv-tools_git.bb | 35 +++++++++++++
>  3 files changed, 120 insertions(+)
>  create mode 100644 meta/recipes-graphics/spir/files/0001-Avoid-pessimizing-std-move-3124.patch
>  create mode 100644 meta/recipes-graphics/spir/files/0001-Respect-CMAKE_INSTALL_LIBDIR-in-installed-CMake-file.patch
>  create mode 100644 meta/recipes-graphics/spir/spirv-tools_git.bb

Hi,

I did run some brief tests on these, I noticed there is no maintainer
set for the new recipes. We need to set one for recipes in OE-Core,
see:

meta/conf/distro/include/maintainers.inc

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1490/steps/8/logs/step2d

Cheers,

Richard

