Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.5909.1631759513330953182
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 19:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FpxJS/4V;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id e7so4742696pgk.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 19:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=AP/laZWQVSnmasMyAqm1Nau7ffzRozNHPw9cWGI+Mk4=;
        b=FpxJS/4VYjeOjhMp3nClHUCeSyk9P20w/JqA5v/rf4tgV3dCNlvdMNO5bz0GkLmhoy
         AnZLB73qirnzxDtxrD7jzCeVvv3lYzDdrTw/OtD0Rk/mtrZF3CFkIgycQribZvFg1uH0
         qdNWmf4sTM4AFFRMyAf9NyBWXtMlx5e3vEcl5CM+ien9ko2Yw0QAlP5b644QYfHHAzAV
         Zqw7VjZJgcORb7IUC17Wk1ltyCaaweZhXa2hhX97QcFXGbpeophpfW8d8iTXeYh7nxnS
         JlGBVJz4GqC2KE7gK1LTS0tg4YAFRD/u4ZxG1D8Go8q618MQqladoSbof7iSNdDlj8IS
         iTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=AP/laZWQVSnmasMyAqm1Nau7ffzRozNHPw9cWGI+Mk4=;
        b=Tgxw+QAKxpQedZkKlVsPmaWi0zu/6gVy6T1G1sHv5VLWkYJr7zKGI/BtE5/nsxPNxa
         73jvL9RshIXnpG2OOepVNy0YD80dLJ9jv0mYx5yy1rkSCBJ+RMErzeUH/RzC6AhB+tK1
         Ber+0dHe+T3QtzKBl+QmUCEbVJ2HJMVRgC8bP8GrBSZAetxgVXz+5nZE0ZYgXnojXxin
         QW/11fh0d4y3fEWMov4PLcQeKBlR0BcOSgf/h5uD+volFjMMSJ6dwq/HgNJD8t5ct3ah
         KWq+Cmg7Ao8ttArQjZOvevUP/KR9atNpgFxvZIPy7XkB5bPl8bxG/18p9f2kX+Hl6W7R
         3C6Q==
X-Gm-Message-State: AOAM532SOFp3Df1HW65DnqvnPZxgZYIr60P2EOBIMuhlak0RfXfOCUSG
	ccULrzRZOPlaYrdJ2WGy9cqJIjenKF4=
X-Google-Smtp-Source: ABdhPJwODe7hBG2XQLf1rOaoNI1skJdpm7y6PRL7AK8H9eFNioepxPhnBygQUsALbuT8emfZGVg9WA==
X-Received: by 2002:a62:6384:0:b0:3eb:13e7:18c with SMTP id x126-20020a626384000000b003eb13e7018cmr2591859pfb.73.1631759512561;
        Wed, 15 Sep 2021 19:31:52 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:538a:dbbb:2df2:d1e8? ([2601:202:4180:a5c0:538a:dbbb:2df2:d1e8])
        by smtp.gmail.com with ESMTPSA id y126sm1058115pfy.88.2021.09.15.19.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 19:31:52 -0700 (PDT)
Subject: Re: [OE-core] [kirkstone][PATCH] wayland-protocols: upgrade 1.22 -> 1.23
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
References: <1631754397-46490-1-git-send-email-denis@denix.org>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <137620f2-df0b-58fc-6d47-89075626c844@gmail.com>
Date: Wed, 15 Sep 2021 19:31:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1631754397-46490-1-git-send-email-denis@denix.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

So we wait until that branch is created in 5 months before we can apply
it ?  Is this like post dating a check?

-armin

On 9/15/21 6:06 PM, Denys Dmytriyenko wrote:
> wayland-protocols 1.23 is now available.
>
> This release adds the new gesture "hold" to the pointer gesture protocol.
>
> https://lists.freedesktop.org/archives/wayland-devel/2021-September/041979.html
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
> Please note - this is meant for kirkstone(-next), as upgrade to 1.22 is not in master yet
>
>  .../wayland/{wayland-protocols_1.22.bb => wayland-protocols_1.23.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/wayland/{wayland-protocols_1.22.bb => wayland-protocols_1.23.bb} (90%)
>
> diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.22.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
> similarity index 90%
> rename from meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
> rename to meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
> index 4e8d390..60b6eb1 100644
> --- a/meta/recipes-graphics/wayland/wayland-protocols_1.22.bb
> +++ b/meta/recipes-graphics/wayland/wayland-protocols_1.23.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
>  
>  SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>             "
> -SRC_URI[sha256sum] = "96e7cf03524995a47028236c6d6141c874e693cb80c0be8dabe15455cdd5a5a7"
> +SRC_URI[sha256sum] = "6c0af1915f96f615927a6270d025bd973ff1c58e521e4ca1fc9abfc914633f76"
>  
>  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
>  
>
> 
>

