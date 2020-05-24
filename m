Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.15111.1590333855394513560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 08:24:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HwmnyIU2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id j16so2482600wrb.7
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 08:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AjKFX9EmXXj6nzpGfzS/awxGnYqijGOS2ES4rqdRpdo=;
        b=HwmnyIU2NgMnLFuzoqIVGrOj/f8PjujvAf8lbEc/q78nsIC3xDVWNqDPYsbAX16mVo
         u2KxWeXG0KebJkf0JZEevtP55IQXcqfPVWuW4zjUjIi6ZI/+MXpVGWOGvwb0zzXM/BIk
         e0PYqVZfG1rcVZlkWxRjgeUUHiMrJ1RNZ03KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AjKFX9EmXXj6nzpGfzS/awxGnYqijGOS2ES4rqdRpdo=;
        b=MB9nL29fE0/foMfGroCBye6gnMi+nmgDwFhHUs+ScRsM00/bIhYnBXRbpkVPFuP0+O
         NeDwWCYB3yxJk5/FVo+dWdkLo+QZryGb44EeWRLcIPZxNAyt7XMUs65krI+iUPpsOI3Q
         4n7DuyG4z6s1XW7lPk4IADVKS+AET2MerPld3gn1NMKh8UrUkj7ySwCxD5G1TAwE5vM4
         U+0c6LA4lOVrQZP/kL6ctkfFwOV3MjdeM6UIRzYuqlvmmb0oRPotNch/geFgPh7bHxye
         DtB/JRzknaF060lrue25shxqMZO82/GRFl34C1veM56rwl5rPak5MbyAsXQNOWvIeAjc
         NeEA==
X-Gm-Message-State: AOAM532SVZBuujYehdn9YP3oFSlxabJHTsXwGTQ9iP69EIaTcQ5evOh+
	Du9mw6RDT2oBQNek53XwvgQ8tg==
X-Google-Smtp-Source: ABdhPJxdQm89cbLSDCaggDHko47SeSi96km+CHC0O1xLDPS/C6R373TThTfjwuUr9dNIsM355Sww2w==
X-Received: by 2002:adf:8563:: with SMTP id 90mr11177348wrh.74.1590333853936;
        Sun, 24 May 2020 08:24:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d4sm14821777wre.22.2020.05.24.08.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 08:24:13 -0700 (PDT)
Message-ID: <0f497fa917b7831dff5cf53553758d96c18e30a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] docbook-xml: update recipe to stick with the upstream
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Gregor Zatko <gzatko@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Gregor Zatko <gzatko@zoznam.sk>
Date: Sun, 24 May 2020 16:24:12 +0100
In-Reply-To: <20200523191238.1224501-1-gzatko@gmail.com>
References: <20200523191238.1224501-1-gzatko@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-05-23 at 21:12 +0200, Gregor Zatko wrote:
> From: Gregor Zatko <gzatko@zoznam.sk>
> 
> Until now a Debian package has been used as a source.
> This change just switches it to project's upstream.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13270
> 
> Signed-off-by: Gregor Zatko <gzatko@gmail.com>
> ---
>  .../docbook-xml-update-catalog.xml.patch      | 515 ------------------
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       |  65 ++-
>  2 files changed, 36 insertions(+), 544 deletions(-)
>  delete mode 100644 meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch

Unfortunately test builds failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/2176

Cheers,

Richard

