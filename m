Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9000.1627563309491105114
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 05:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VOMegbGF;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id b7so6828607wri.8
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 05:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FHSaNgh3rDG+PibircMVYIKIJBtUuGvXf2vGf+y3K20=;
        b=VOMegbGFFAaIrOddzuP2ZNyPxsE/IkEC6EpSs8zpfs4VmCnrjAfu4sYR/4D616q71y
         +RbKJCQvsLWnChvM7euTLuDC/LxYJbG04zNqL9DYlt8tMzdtdSNiqA6vZLJ+dqgD/6a8
         JxkQ2AFAjOrpPZdwJ52l6YQIfgd3wxWDkTnVcwqVrPUKM/57u0WNuc7mXX9z2M6jVqPa
         Vk/kkfWzqHmdldsawGxENE4ngC0zvVCcPhnNTd+8T709vYgx3FwsJfl/ljDahSr/MOq3
         6NkpQnAoBtacOI5P/3TUnPM6fSQEhaT3F1gJioL2RQgKfb7Tw0YecXZqUJ/sd7b2JdjR
         lkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FHSaNgh3rDG+PibircMVYIKIJBtUuGvXf2vGf+y3K20=;
        b=g6moEDaZ8HGlTkYM9TsohaHGfjs8KRMqTIdPY4M9iPMjmGtZ1tSMAoBfxT7Q26XWSc
         ehhld/LV8kknfvCRcC+rg3VEsWNYnsKfT37AgmfKXGrwZbz2J0rOI6+XK9UpvdYlAaJu
         nXOXss+tisq/Iu2D/+rBtLvR3+kW3SoSBhXL5AIoSzpRQrH64JezruN66h8x8bX0zuO5
         5TOYKaRuquh9RLEeFQPYdJY2EToGEIo4lRbwvDJNL0UWC9FJgNalMpWI7+SEUDSQN2HE
         5Egfud9jhJlOQqhhF0mbcfHldgwe3pxP8ZyfY4AWIHM8GTdmPFKTrMsC4W9iAYLjIU7R
         +6Hg==
X-Gm-Message-State: AOAM5313/rrtl6/LAtTTwfeY2dc3JztSClbr9k/U5Axhw0ul1wXjDGBx
	PfwaFTBpiJa2l4aMtnbAtb4=
X-Google-Smtp-Source: ABdhPJzEovpRyiZKIQEvPzoriZCJjHhQUybvnSTTP3Gj30yi1ZDhRbKXnUp5w6tZlrw2qToywTg5ww==
X-Received: by 2002:a05:6000:92:: with SMTP id m18mr2155135wrx.277.1627563307923;
        Thu, 29 Jul 2021 05:55:07 -0700 (PDT)
Return-Path: <oecore.mailinglist@gmail.com>
Received: from [192.168.42.52] (ppp-2-86-139-252.home.otenet.gr. [2.86.139.252])
        by smtp.gmail.com with ESMTPSA id n17sm10279869wmo.18.2021.07.29.05.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 05:55:06 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] systemd: Fix build on musl
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Luca Boccassi <luca.boccassi@microsoft.com>
References: <20210727201325.2215487-1-raj.khem@gmail.com>
From: "Robert Berger" <oecore.mailinglist@gmail.com>
Message-ID: <48ff0915-6b83-bf8f-5331-d399c8ae3d84@gmail.com>
Date: Thu, 29 Jul 2021 15:55:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727201325.2215487-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Does this mean we have musl and systemd working together?

Regards,

Robert

On 27/07/2021 23:13, Khem Raj wrote:
> Latest upgrade to 249 broke a working build on musl, this is incremental
> fix to exisiting patches adapted to 249 release
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> 
> 

