Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.28711.1629975662316522640
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 04:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D11DPLDi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id x12so4317774wrr.11
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 04:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=h2T096OoskOlrP2B4Lpj6v8EGtF5g7UU6lolJumrFvk=;
        b=D11DPLDiDIyila8iOAzPCzTRc0Xa/EzAZrwdwkgvYG9jRKdVbuavjzjFU8GpGsHUCk
         vXHGfOBUSLcoo74EsSvgfSyNMsxYr1EK67jJ5GQVQJTl4jtp1U0N4b9PV8bIM9rEFJEK
         x+jlbkmq7lqHV8Dpy1Zx4E1QK7odHCAWIm+oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h2T096OoskOlrP2B4Lpj6v8EGtF5g7UU6lolJumrFvk=;
        b=qzMD8lyxpYN1l2z/iuzwcuqp1BHGeEraYSvjgLOeyfSZha1xSCooq7BwpNyDsc8xDL
         Ibi5KGeICzRvUvIlJHmhwypui31Uu5l3Ewbc9/T71BFflgqwV7xWRntB0lWOSKOXJd6Y
         WyU5QCAeOyqjp1T5d/oaXpjyW9c07jyM9LZPJie8eOxhoxbFQ4EZr79L2k/I1kz8WKmW
         VBhkmPt56dWX3E14kKV23xPg6bUyVD7qKb/+algPLMLF/v5AKMInHqkZP7cBnaRtgImf
         hPY3RhrQXxBGMhayQ1+oPc5/JNlnx1fA8RNGuxYTNBYsUea/aY+FZqLfgN5wsgvrOFks
         Xipw==
X-Gm-Message-State: AOAM530NpM6vTB0DSZ/CqPF2x7uvCKjoKQ8xUjwHNC0WJvaPbgAZNBP9
	aWDhI1dlxp+0PSf33IkK1L/XtZDevC7Dzg==
X-Google-Smtp-Source: ABdhPJwF0BdhBwT+TvgnKHAO2YoFjaYxVpRtxayOEDnv5gtU2eHRc+4S/m271aIW4sHhKf3/xcynXA==
X-Received: by 2002:adf:ebcd:: with SMTP id v13mr3177785wrn.400.1629975660920;
        Thu, 26 Aug 2021 04:01:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4? ([2001:8b0:aba:5f3c:a9d5:4a4f:480b:62d4])
        by smtp.gmail.com with ESMTPSA id c14sm2742759wrr.58.2021.08.26.04.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 04:01:00 -0700 (PDT)
Message-ID: <72bd8d1222282938f5f4166a803dae1e087ace52.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemurunner.py: print output from runqemu/qemu-system in stop()
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Aug 2021 12:00:59 +0100
In-Reply-To: <CANNYZj8SadPjAYW=tUNwsA-TV3vyJNGcD+2WoiXu_vGTKn-G1A@mail.gmail.com>
References: <20210825223552.802130-1-alex.kanavin@gmail.com>
	 <8a31a69ce20c28685294a1e3c6b289f6f5c38629.camel@linuxfoundation.org>
	 <CANNYZj8SadPjAYW=tUNwsA-TV3vyJNGcD+2WoiXu_vGTKn-G1A@mail.gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-26 at 12:45 +0200, Alexander Kanavin wrote:
> It’s not a real warning, just that the print itself is issued as a warning. I
> think it just needs to be issued as info instead.

Agreed, I realised that after replying to the patch. The current build is going
rather orange! Will you send a v2 or should I tweak this one?

Cheers,

Richard

