Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.11488.1590149079489135227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 05:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OCq0SwDQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id f5so1328191wmh.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 May 2020 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=R2G3ZhdP6OTxjlikvkBG8CbMgmtZJXdk1gxAqVeoq14=;
        b=OCq0SwDQRQRrITLwtwHnaqfQsiinxVY/dmn4YwaMPGjADAHhg3ed0DZCvQo3vSGJmZ
         nF+QRbM33DiDSVBAT+kUNPQw8+qxFMfsvPEevzYTmHEBrdFjocC7WOEkgA2T2QbAAd95
         6jWCH0D76uz7CzWRSyT3v7Jrr6NDaQDB+tvEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R2G3ZhdP6OTxjlikvkBG8CbMgmtZJXdk1gxAqVeoq14=;
        b=lJupA2GHZqaWhpCxyIvZAiovLFLYjcDSsUI97brX0W8FlVa18kVOflBRxMkZPZ5f80
         V0ZMuc0FDca8vc+Gjndm9slJj6coMl/7wJXFlLGrny6m8GkXsOZJcN9h7yIKlB+ziOo+
         Mco+dcrHwyML3F4cf3fQhDaJnucTE4pjovi9rekZc/Bk1YwCB4qIJm+PAaAiHRl35cJv
         VrbvPL2tunl36gW4rxXg4Y2ksa6Lku+NBEDODlkkTC2aiFzoNsHUxchlGDoXTF6yWHs0
         2wSyI1KY86zIMTY5caSqMmW/TsW7mYBX5hkQXmTRClt0KJpNd153HJeQ0230pDtyCeJY
         sRYg==
X-Gm-Message-State: AOAM533Yc9aZ7VFhHkOIQdtQD/D3NxOq00uwYuRWSK9/LuL96wHRcJJa
	lLJTwBGrjaMf9g+1yuBRy2ryyw==
X-Google-Smtp-Source: ABdhPJxui3Aop8d3rls0nGZZX3zmifJHa6i0Va8QdVG0g+r+1S8wKisk1K8wX6bGN3pmkH+ZBGDkKQ==
X-Received: by 2002:a1c:6706:: with SMTP id b6mr13061160wmc.54.1590149077899;
        Fri, 22 May 2020 05:04:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a21sm9115401wmm.7.2020.05.22.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 05:04:37 -0700 (PDT)
Message-ID: <8e2dfbd8f03e3390dbeb3f02036c502b02b39169.camel@linuxfoundation.org>
Subject: Re: [OE-core] Send bitbake cache (from recipe parsing) to another server
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: krzysztof.taborski@nokia.com, openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2020 13:04:36 +0100
In-Reply-To: <8RAg.1590148747627277253.zv1v@lists.openembedded.org>
References: <8RAg.1590148747627277253.zv1v@lists.openembedded.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-22 at 04:59 -0700, krzysztof.taborski@nokia.com wrote:
> I am wondering, if it is possible to archive bitbake cache and send
> to another server.

Only under very specific conditions. The paths and timestamps for the
metadata would all have to match perfectly. The cache is not designed
to be moved anywhere at all.

> I tried to archive cache and tmp/cache directories and use them on
> another server (configs and recipes/workspace name/user name and
> build server image were same), but for some reason recipes are re-
> parsed by bitbake.

Not surprising as there are timestamps stored in them.

> First of all, I am wondering, if I have even chances to success in
> such scenario. 

Low. Its not designed to do that and you should never need to. Why
can't it reparse?

Cheers,

Richard

