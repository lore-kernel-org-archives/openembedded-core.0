Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.13907.1588458040265374408
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 15:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CPjl+jNl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id x4so4126361wmj.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=izxjfRRYWg+UhmJe5+cGN19VQV+We60hBJdSHvcRztI=;
        b=CPjl+jNl80RP+EUys+TXKGNc9DEnfWmlqcTKZwBlwm6wo1IhrZbw4KA8rLZFUMq6Vr
         o9cBzs0Se+Oe1hAzTu1d+BVjl+ZX6fyBvUltk1bYslG6MzyxdbYsNBU/2DaW5F73Q55N
         fFE8/7HMV4PZa/Bk+KkK6HhRC2ITBmYNLRYkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=izxjfRRYWg+UhmJe5+cGN19VQV+We60hBJdSHvcRztI=;
        b=Jv8qwKAKmzz6x9dWCZ37sih5JkkNHBNHnnVVfGJOQuKABnxxneA1+vr42+WDNFAhUp
         ucevQ3zJX+AM1wrjOSioOLRpvLWVrFxvlDSDtD1zmHCwAGNEM372XDO2S4PE9KDcag2O
         aJqWwTDP4Y4zmJazO4olZiXS1V5hedaFjvVA6o59VOHCVZzYcUpgU9Hq62ch4nCzBA7+
         FhXY4h7lv//IO8KOaPptDBm9GObtTbfAEr5sAHjhnwYwjQmWe7kC/UFseB5BkxgrohzO
         hu9INXoOaNWkgBec/lCyrsF+aNkivR1Otryh3t5ok0XmeCFkV4FRadF4wiI0Bf5UadfX
         K0OQ==
X-Gm-Message-State: AGi0PubcLmbz1l5HwVEotgW8S+3EP3dRe2YoKPLC2tMkSnzQT6YcnI6E
	29ltGl16yJ6YURISh1wPQvSp7Jmbvb0=
X-Google-Smtp-Source: APiQypI/9G07umZj6WVKp4B9SfUk0aBSXG/LOGQ8Xnw/zR4GElvo6+pLBkl6ck84Q92cRhVUNW/m3A==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr6872980wmi.51.1588458038348;
        Sat, 02 May 2020 15:20:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d13sm5909170wmb.39.2020.05.02.15.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 15:20:37 -0700 (PDT)
Message-ID: <ada377a3b9425b11bdd3d95dbf825b29f390f7f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/17] libinput: add ptest
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 02 May 2020 23:20:36 +0100
In-Reply-To: <20200430095815.2824-1-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 11:57 +0200, Alexander Kanavin wrote:
> The test takes about 17 minutes, and fully passes.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/conf/distro/include/ptest-packagelists.inc  | 1 +
>  meta/recipes-graphics/wayland/libinput/run-ptest | 9 +++++++++
>  meta/recipes-graphics/wayland/libinput_1.15.2.bb | 8 +++++---
>  3 files changed, 15 insertions(+), 3 deletions(-)
>  create mode 100644 meta/recipes-graphics/wayland/libinput/run-ptest

Still has a reproducibility issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/900
(and the other selftests in the build)

Cheers,

Richard

