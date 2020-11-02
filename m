Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web09.1742.1604337559313843518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 09:19:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R0/UbkCv;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id s21so15444413oij.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 09:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=L7F/IuA+S02K1d7RJKJSzl3E5P1JNGhjC/Emz96PyxY=;
        b=R0/UbkCv5ie0wqRgJWOipemS4HeykS/ozos19DCg7LMc+W5xmjYAhtLD5UVBM2g19T
         d0xn9Kn31GCrp2Tw99Bej8AzyChMUqwq1HivQkuqMfA7/MQ6qz3JiQfb+9qw8z4dvmlY
         hq1oIAoQdEg9nq3iL+oV9Wg9CJbtRJJUKR6QeGeYdZY6pQQugKiw4FeqZ8lzc7tBvZy+
         aOXI+M4mKoMXVS+NyoGZciv0svfU+enpu81YnOG4zTuaVBIpclZTh/6unYfTLt1c1Ha3
         AqdmLGJHdT1NB7KwxRsVCbmgnnjX2j9+zHXqz7awHPshygDKKhaLfoVczeyjhnXn12u1
         OqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=L7F/IuA+S02K1d7RJKJSzl3E5P1JNGhjC/Emz96PyxY=;
        b=ikxAp1O2HJYwX3GYtBpj1ha9EOMEk6aDziN+PX7smt9WsIy/PwXEfig2VsfSNwx3z9
         5o20jxFzhchYZDWykeuqWhG70Ntyol1RfH9eM2VChz/Qz0GsJYQdb85Mv14fR1RY5PTR
         BL36cTqQDpZuouSf4KYhG7/wBg0ZrCjhcz5ANCRQ19VeomZZJZtQFjnrr9+RgZjxQqlF
         2T0N144drkqu9pQ40V89DRJ9r81zsvaSF7U6S8KL7do3vhzcqM54eR+LC5SJZ0PZjcva
         gq9KdIH5j9yHY/wMgBp+dzb3SMY6iJmZvUS0bvvcI0Yu+ahdH6IPlgpCxv5SQ9J3U7id
         Dp8Q==
X-Gm-Message-State: AOAM532wwOEShTXAlapihW/5sMvA+giVu49j44sdx44/Nzj2DgRHL/Y/
	HlZn6q86hhuDlXBQctuDh3hNezY6D6o=
X-Google-Smtp-Source: ABdhPJzw7cFWhh7wF6OilBwkrc96Fm/5ox1uVKZF/CqOEeP48hzxBbM7Wdic2VQ74K8m7NGYiQBaCA==
X-Received: by 2002:aca:1803:: with SMTP id h3mr10420351oih.148.1604337558416;
        Mon, 02 Nov 2020 09:19:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:2c84:880c:a42b:4489? ([2601:202:4180:a5c0:2c84:880c:a42b:4489])
        by smtp.gmail.com with ESMTPSA id s189sm3616313oig.46.2020.11.02.09.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2020 09:19:18 -0800 (PST)
Subject: Re: [OE-core] [PATCH 48/80] kea: upgrade 1.7.10 -> 1.9.1
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-48-alex.kanavin@gmail.com>
From: "akuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <3f8aa9dc-ef61-e498-2e3a-1c3efddad253@gmail.com>
Date: Mon, 2 Nov 2020 09:19:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201102164907.27572-48-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/2/20 8:48 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.9.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.9.1.bb} (96%)

do we care if we have a stable version or development version in core?

1.8 EOL's in 2022 Q1

-armin
>
> diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.9.1.bb
> similarity index 96%
> rename from meta/recipes-connectivity/kea/kea_1.7.10.bb
> rename to meta/recipes-connectivity/kea/kea_1.9.1.bb
> index c9a5819e47..9e7c08e792 100644
> --- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
> +++ b/meta/recipes-connectivity/kea/kea_1.9.1.bb
> @@ -19,7 +19,7 @@ SRC_URI = "\
>      file://fix-multilib-conflict.patch \
>      file://fix_pid_keactrl.patch \
>  "
> -SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
> +SRC_URI[sha256sum] = "ece8cc10fafa2aa8bf5cc18f95f4bfb05bd52f8ee6a152d1ee8b53c28a526999"
>  
>  inherit autotools systemd update-rc.d
>  
>
> 
>

