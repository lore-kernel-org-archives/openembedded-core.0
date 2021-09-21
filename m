Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.6637.1632226694776222535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Sep 2021 05:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eKxl0jL6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id d21so38495144wra.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Sep 2021 05:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=0JLMZKVJPFzC8ASCjqT6UiD3fvWn00OppWXE6o7miqk=;
        b=eKxl0jL6+BMF4pKTLrod69Ks+jEXxrckhooXevchseRlxe/njY95ipxrMnWiaBWvE+
         q3JQr82OuN7Y0u4MtoCEbx79hQ8Kc6mv6vIWpOWbW4bRrHlOzhsSbNXPJqC4cBfxWp82
         JV/eWKzRprhgE7EWMc/1LbJ3ck5OEFD4PPBAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=0JLMZKVJPFzC8ASCjqT6UiD3fvWn00OppWXE6o7miqk=;
        b=j/hTcwFZvA9xfzLjT5IO6F/duA/lymzyOK4arJ3Uv38D4iooYUqMt+vmiUwNt/0fZ9
         twMwT5O0SQD1ROy8fo0WLM4URdqQOMeXBF2uzFNGX+T/tupIbPEkdCQ3tqI/4lrhsyeS
         gdiBZja5EfWjfsfmKEzarj2zK3Sh4l5Qyuam/UtCIoq1tSRnwlV2/vC1GYziWDFcZQdD
         LvTQTKktyi7KVLzTDUDy9g7stp6XYZKEP7EleeO1xWQ9N0w+ES6D52Qk2pMG/5P8OWO2
         5JS2wp5RQVJoSJEx/kIF3GhdanTeuCs/5HMktIDlDXkE/pjSWuA0AxNttYfmwpBf9B3C
         Yd7A==
X-Gm-Message-State: AOAM532HZHBgocW/0IDSxMoKnfioH7fr1GQMlxSjhIbUfm45QTIVVNGA
	9kmrXqjTiZjIQDrxNfYigtznOKjjDkGOZhIX
X-Google-Smtp-Source: ABdhPJxsEtc3AwSR3gIysEgvGaqX+SDvZ2U+RPm7M8n+bCaOdq2O9FVtgezl4JzYu6PbfoZXYiOt9g==
X-Received: by 2002:a7b:cb4b:: with SMTP id v11mr4306433wmj.155.1632226693246;
        Tue, 21 Sep 2021 05:18:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:97b0:b8a0:39a5:2c93? ([2001:8b0:aba:5f3c:97b0:b8a0:39a5:2c93])
        by smtp.gmail.com with ESMTPSA id i203sm2224740wma.7.2021.09.21.05.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 05:18:12 -0700 (PDT)
Message-ID: <6c5ca68319e216177b75f0e3cb6ad8da0bcf8c25.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] archiver: Configurable tarball compression
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ian Ray <ian.ray@ge.com>, openembedded-core@lists.openembedded.org
Date: Tue, 21 Sep 2021 13:18:08 +0100
In-Reply-To: <20210921061517.8235-1-ian.ray@ge.com>
References: <20210921061517.8235-1-ian.ray@ge.com>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-09-21 at 09:15 +0300, Ian Ray wrote:
> In order to be more efficient, we use xz as compression method
> to create GPL sources archives.
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.com>
> [V1 was https://patchwork.openembedded.org/patch/155985/]
> [Rebased]
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---
>  meta/classes/archiver.bbclass | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Would it be better just to move to zstd and rather than making it configurable,
just switch to the better compression format?

Configurability is good but where there is a clear good choice, it may be better
just to do that rather than giving too many options if they aren't really
needed?

Cheers,

Richard

