Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.9283.1608628735435186417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 01:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NLANBLx2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id a12so13783711wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 01:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+o/0znYw64KzSaRppZspPCJ0QGoVscCFQTTu7gZX7Ss=;
        b=NLANBLx2PmKDoF1FLrNA1HvM7sHLrs27N9WP8JGXubb2yd5a0Rz9zecjOC6rnz3YCi
         xEPqKpkxMR3psDDh1eFjF+T3jK5IjJkyGgPFeTZ3E68aySzigtlu9PSpaI9YZIQyOc+0
         SUtWGPYLfJpE8AWSrd963N3hhSrNS2ld93lUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+o/0znYw64KzSaRppZspPCJ0QGoVscCFQTTu7gZX7Ss=;
        b=OmrbCaW1mTkZQUc7Yy3Lwr1UTnO6nMKnYDf+8CapbQNP6le+wS7JlUN7vL8XME6eMj
         iBtK7V42mh3kFMRngzY4ky9eelpbK07saSjc35cf5GLiqm2FWznEX55t0yKo8qmrrTn/
         2KQ/N2pTdKAw7OaNMRadcmP2cWq34AfzHTAy/L9UgO0qGpcpPZcEgNT+/aWWt3jcr3YR
         oxKGBzs4ozPMhy6s3U82c2OOmuMC05c4ZekIFxSNpnOHw7sDcdTw5RUrsHQimP2Gp64Q
         xn/91x0n9Whv5gZr0UgwpssO7cv9uCw1jK2b7Sw4L9ftvT9esDiJK0LwnZQeWr4HTKrj
         V4Ug==
X-Gm-Message-State: AOAM532rMbEhuwqYXKi+/WBp2XsWto/bjZLSC4ikpg/RJ49UgmYPvhRr
	HEQPh42ydovVv5Xtfcht4/vOkw==
X-Google-Smtp-Source: ABdhPJysFF45j2kYyl0JRBDwpFHvTE5TUHf5ZMIEOGh+Jb06COuMqjTqGkRATfQrzGAKQsUgI3ZFZw==
X-Received: by 2002:adf:c986:: with SMTP id f6mr23892165wrh.361.1608628733948;
        Tue, 22 Dec 2020 01:18:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (b.b.4.9.2.e.e.0.9.c.7.7.e.d.7.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:67de:77c9:ee2:94bb])
        by smtp.gmail.com with ESMTPSA id c20sm22449712wmb.38.2020.12.22.01.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:18:53 -0800 (PST)
Message-ID: <5291abffce231a5dbec49fa24d68a12b07c2c4e9.camel@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IFtPRS1jb3JlXSBbUEFUQ0hdIG1lc2E6IHVwZGF0ZSAyMC4yLjQg4oaSIDIwLjMuMQ==?=
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2020 09:18:51 +0000
In-Reply-To: <20201218045245.18876-1-twoerner@gmail.com>
References: <20201218045245.18876-1-twoerner@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-12-17 at 23:52 -0500, Trevor Woerner wrote:
> Two of the patches have been applied upstream:
>         0001-meson-Add-xcb-fixes-to-loader-when-using-x11-and-
> dri.patch
>         0005-vc4-use-intmax_t-for-formatted-output-of-timespec-
> me.patch
> 
> The 'surfaceless' platform is now enabled by default, therefore it is
> no
> longer a valid choice. The meson build system is intelligent enough
> now to
> decide if 'drm' needs to be enabled based on whether or not gbm is
> available.
> Therefore 'drm' also is no longer a valid platform choice:
> 
>         ERROR: Options "drm, surfaceless" are not in allowed choices:
> "auto, x11, wayland, haiku, android, windows"
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

FWIW this is missing the rename of mesa-gl to match the mesa recipe.
I've queued the missing piece for testing.

Cheers,

Richard



