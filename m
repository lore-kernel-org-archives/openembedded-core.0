Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.1111.1590094519797056182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 13:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PsaXJXP0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id w64so7773126wmg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=zx/VV91KjhMyvcjIJn4jLm/5VWFc5uyTdSQzCNUnlCc=;
        b=PsaXJXP09ukMoWZvZt5u7uILTXzWLYaGjbUOsa0g6FTAiuaGiNlc9IpT3xzsTNWXaa
         XohAsLJto+94IgnsTp84QKweCFA2Gnekv+l9YBC2VpBRbZqxxF1gu4S1rjtnA4lF3Jw9
         mgLRUSQnDoClNk9kDwD0vhbE/O3z2li97y9pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zx/VV91KjhMyvcjIJn4jLm/5VWFc5uyTdSQzCNUnlCc=;
        b=H18tSf1dCHWW4VmztwVdpONX9Yx0gRkAgOlBOQKwPDimoPk/KWX3TPFPm5yDxBXCV/
         /pf79h2RgOFZqCqqHRx7rw2EUXYMiztqOORFlQPndTTEgacs8Ho4NgerLiyMp9vFBmbJ
         ye0jI0gTS4zeq9FfNQpjPBPLFACnjBir4d6rcTPuEByHbWHekCxSIHvjSNC8Vcsj2S4c
         /u2ExOCNxOSUoT3zGdb1d9ancMV7amd8e3nsZqXQq/cioUMVXGss9kduGcL2Krr76V3x
         M6vVY1WvBzFUDMDxtXNws8FUkpSUxNgAer4an/d4i6w1D/EKefSm0WHrA2EPt1tUG0lL
         mznw==
X-Gm-Message-State: AOAM530CWAtMBmWArgYi+AVHF2bVHwQI/aHKZwv/7Mim+gBQuQ6vKJxL
	lAkXul3t490S8/qdISW2L5qs+g==
X-Google-Smtp-Source: ABdhPJyTQbMg4ggSuQS7VQEJ9XTtcQJVAb/pGMIdKdGSjsaaa05Eic1YQsFdJ6kL82VD6Z+vfsJP1Q==
X-Received: by 2002:a1c:3d83:: with SMTP id k125mr316752wma.61.1590094518253;
        Thu, 21 May 2020 13:55:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id x17sm7467709wrp.71.2020.05.21.13.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 13:55:17 -0700 (PDT)
Message-ID: <784e607801a9c3f0acfbcaeb1634872ef5ab5f80.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] terminal.py: do not stop searching for auto
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Joe Slater
	 <joe.slater@windriver.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2020 21:55:15 +0100
In-Reply-To: <b10310e2-e33e-eef9-d070-a3bbab96a8a1@windriver.com>
References: <20200521184107.103889-1-joe.slater@windriver.com>
	 <b10310e2-e33e-eef9-d070-a3bbab96a8a1@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-21 at 15:52 -0400, Randy MacLeod wrote:
> On 2020-05-21 2:41 p.m., Joe Slater wrote:
> > If a terminal fails to spawn() we should continue looking.
> > gnome-terminal, in particular can be present but not start.
> 
> Do you mean that it doesn't start on the first try but that
> it may / usually does start on subsequent tries?
> 
> Since the user has set the  preferred terminal,
> this change could confuse them and therefore seems wrong.
> If we know of flaky terminal implementations, why not look
> for specific versions, issue a warning and either retry
> or tell the user to try again? In a few years, we can discard
> the code when the flaky terminal version is no longer used.
> 
> Is there a bug open with gnome-terminal to track this?
> What distro/gnome-terminal do you see this problem in?

I suspect the issue is more like gnome-terminal is present as a binary
but no X desktop is running...

Cheers,

Richard

