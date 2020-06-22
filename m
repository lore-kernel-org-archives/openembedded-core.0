Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.5992.1592864221593298686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQZXuIaX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id g75so1110786wme.5
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VCm8jEoUDTo7xO3w48s9xQZs9tga67FWw2aTmw0FSvw=;
        b=CQZXuIaXVWhVSJk2zj3GViKAeJaTo1tHxiuJxtkxrbb+59j/FoYUJ6OWuyvfO1RCoI
         p3lWj0s891rAzhYUb/dGsedek+ZMfprB1/KC31FDZYa02y8IHtTluZnbTSZP9TbdfyzF
         C4DTXfR1nOMFgqw3AM2czbvvideBGAl04Vltg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VCm8jEoUDTo7xO3w48s9xQZs9tga67FWw2aTmw0FSvw=;
        b=Yi1AX6QHDQRCUYCaffkqfXQ2JxGqGtVePUeIWuU6FE1jch8ShQvfpkSIUpz9Q6VYdf
         wRYll6hpC/YEHnddD5kD2cw1we28dpz95MqEzwEKky38r1dDB9HO0S/P5fbi+XpL7l5H
         NeE7HKZfD7YxZ86GWJ/pNsToMt9WbJTmPamEZWLrOPGArXmi1okNYz2zpbubCWddheGO
         XMeg8BLUDY77MbQ5gst0S1jHrOrRwEIPMl5KtcoJebee+/06vuWGp6+zIi7UakhVnC7R
         9fgavDW0vc+uILvwODZhBfwaO4hRa+M+fzE1S8m4hurnMx81d9gLI07mTRrWoeNbXWrM
         3ibw==
X-Gm-Message-State: AOAM531VVO6QtMLmlQB1eztYoLFC5UC5JkTRkqdtqBAr6JEdfK7104VD
	LZ5ek6SkJj9P66jNdxh+UZB8Ig==
X-Google-Smtp-Source: ABdhPJyhWpxcu/4id9WefmFStphSs35QvnqQ3/J8/MOlyqYPkyLrYCz4yIRpSXK5/RnhNFXvaXAbbQ==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr222357wmh.130.1592864220154;
        Mon, 22 Jun 2020 15:17:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a22sm1075579wmb.4.2020.06.22.15.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:16:59 -0700 (PDT)
Message-ID: <41da1ae0040e0444e80ad544c5cf064061b195c0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] Update bind and replace dhcp
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2020 23:16:58 +0100
In-Reply-To: <20200622141915.31932-1-akuster808@gmail.com>
References: <20200622141915.31932-1-akuster808@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 07:19 -0700, akuster wrote:
> Move to the latest Bind ESV and replace the depricated dhcp with kea.
> Three packages need to move from meta-oe to core.
> 
> The new bind is not compatable with the dhcp

Thanks, I'm keen to see this happen. check-layer threw errors:

https://autobuilder.yoctoproject.org/typhoon/#/builders/39/builds/2057

so my build with this in may be doomed :/.

Cheers,

Richard

