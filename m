Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.14726.1590679934856538474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 08:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U0q/Tf2P;
 spf=pass (domain: gmail.com, ip: 209.85.210.68, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f68.google.com with SMTP id 69so2687189otv.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=P84BV52WhexJCoSA8l6IRvtfqzvgr8C2F7DNwwol2wg=;
        b=U0q/Tf2PPvsOY1tzPP9E0UhcauyROgIb009QsGoYNWBzAN3pszv4kNW4Rnh9ja+cGz
         Ycy7IEBDNrzEpOHWMsSKlLWZy1k50dAn0bnA0rxelNgFU/BkOO8T2g4uyDQ5+wLANyzt
         WgqXA9kDtQggPWz7nRncX4+L+/TxcTpzsjbbyh0IF5VPio50riHsD5Tibpcdtgl1pPi8
         GQfnrZ3ioBQfRKBosqcaTRhvci85D2C7yqZKSqvDQCklLxc+MdDj0mixX5R05xvaKaL3
         ZEZXnx2GKDiR5C/AflPQ/ACIrQ2hVtkx9h3Bo0OUpYkrlnvSJsiYEGmSj/fTL+m0/bgZ
         DBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P84BV52WhexJCoSA8l6IRvtfqzvgr8C2F7DNwwol2wg=;
        b=VCWxwcYJQ51pW74y9M2JBiBZYO1Urr0tWUX4W5uoazhVFUAx3M67tIAHQFZxqlzkEG
         OAzGjF8nYfZxwXyROzdZHzC2ODidOgeHPAewClZgIq5qtMjW3Nqwhdkr/eSLruy9aYQT
         mp7dtz47ohyvWlIEiRJaIp4dQKSObUT6/ITTf7dYqB7pOkvtKJ+bU3dccdUOixJJ8VXb
         dO5PZmJhF71ZuRqPK4KM1D+KoqruiZFO5nDBmzLBalX+ax/ryi0vDzhBrfPY2mie+DLg
         AeHkoAEdaUrbB9DGcT6aToSkPox7Zqp4pdE6sBhC5Pb4hYnAY7ZLb3+Pa9O5hLmFK879
         vCZw==
X-Gm-Message-State: AOAM531v67VyoAkJTkhY4k6WcmnDBjfi/q834KeoL6na/kWBN3kAd7kv
	aN9FHtLrnQBMQ3+0fZcyWUDovv/inKs=
X-Google-Smtp-Source: ABdhPJzavsFt/jblzZpcQ16L5ORR8wUe03ONG8zkH8SJOYnx+7mRkXxooryYvWc07cO3gzCV9OqRUA==
X-Received: by 2002:a9d:768a:: with SMTP id j10mr2912600otl.188.1590679933776;
        Thu, 28 May 2020 08:32:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:5cfb:80e2:2942:9b65? ([2601:646:9200:4e0:5cfb:80e2:2942:9b65])
        by smtp.gmail.com with ESMTPSA id y5sm1891983oia.30.2020.05.28.08.32.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 08:32:13 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] at-spi2-atk: dont inherit features_check
To: openembedded-core@lists.openembedded.org
References: <20200524162528.23693-1-liu.ming50@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0da4a6aa-15f5-6801-820b-40cbcbb68d7a@gmail.com>
Date: Thu, 28 May 2020 08:32:12 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200524162528.23693-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/24/20 9:25 AM, Ming Liu wrote:
> From: Ming Liu <ming.liu@toradex.com>
> 
> In commit be18dabd:
> [ at-spi2: Make X11 support truly optional ]
> 
> REQUIRED_DISTRO_FEATURES was dropped, so it does not have to inherit
> features_check.bbclass.
> 
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>   meta/recipes-support/atk/at-spi2-atk_2.34.2.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
> index 107d312d14..02a4d4712c 100644
> --- a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
> +++ b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
> @@ -9,7 +9,7 @@ SRC_URI[archive.sha256sum] = "901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216f
>   DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
>   
>   GNOMEBASEBUILDCLASS = "meson"
> -inherit gnomebase features_check upstream-version-is-even
> +inherit gnomebase upstream-version-is-even
>   


do we have x11 as packageconfig ? if not perhaps it should be done here too

>   PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
>   
> 
> 
> 
> 
