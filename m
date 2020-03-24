Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web11.3368.1585011821748792172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 18:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista-com.20150623.gappssmtp.com header.s=20150623 header.b=YuqQfWJk;
 spf=permerror, err=parse error for token &{10 18 websitewelcome.com}: parse error for token &{10 18 _spf.google.com}: parse error for token &{10 18 _netblocks.google.com}: limit exceeded (domain: mvista.com, ip: 209.85.210.66, mailfrom: jpuhlman@mvista.com)
Received: by mail-ot1-f66.google.com with SMTP id 111so15468707oth.13
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 18:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=VDeGD8d9koBH2DAlD7OmIN2zhZPpszEywZpbba5dU3A=;
        b=YuqQfWJk0+LVi1ukB+FIVbRVP2GYPdXYYL5YVbVI/1q32bf9XD1yhM6GKOlP3/W02h
         /n9qdSxAzbj5L8hGNAeb2WgufuX2ZMlnRIOv1ZOq7IVzktDme/JkqXR3TE9EICy9/zGB
         1UmGf62LKy6hUm0W8iOo360Ba/ryk20cCHa/AMpvn41PxNdB6iZ94wLWRUnuBfgXpkZW
         F29SKQFUuPIPlP1mqFkproY3Q1EgXVeleFPgCbOxj9VBjLTGQIO6MvOW6Y8DrJO7zGgT
         KydC0Us7yONSQG0fRser6hA1Koo29sPtFtVkEeAQzcBbD4cewVRB6joGBLuzQd4g3eqP
         VxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VDeGD8d9koBH2DAlD7OmIN2zhZPpszEywZpbba5dU3A=;
        b=Jb3kKYbOIXjqXpuZubKoUjEJZ6R1qN+IOh9DZ9o6XjWCBlf4BOD7bPC8S5mVqhEj6h
         AswApAFfCEvRvcogdzxkq8UQvxmgkewAP0gduwEKVctUSUwqcl9d/tBKs3QwHW1vKUCW
         1kPOm2ZR6yAjYOU6st8gQznqeDPrWaXYY5JoxnLbms5MKjXmKgs9n7GisC2fm25T6ESB
         ThY/1enXti5r9k5in6xjfJG2WC52GWBNCZZ78k4pIEXqYrBffobAfvGonvqzoSmKQKJ3
         BJZ/1h3YYVpFe/4rQqnGPJIDgttQQeEVdDK1pnWivi2CyyBInYdyrjp+hdBHg0IZp8Al
         Doyw==
X-Gm-Message-State: ANhLgQ1S8m299bwsBSSu+CReLEPWy6uJp02p6/SGmqKyNjEDOVA3UC6a
	/rtQvW7DKWgid1nhTuCG5grbLCWWM3w=
X-Google-Smtp-Source: ADFU+vvU/CNCofodx/JOcSSdxzm0L2Fh4PB3L9HTMUhTrzSj8CiqLFUlTb1SbJ9LvOmnervDYsnolg==
X-Received: by 2002:a05:6830:22d1:: with SMTP id q17mr4556352otc.194.1585011820751;
        Mon, 23 Mar 2020 18:03:40 -0700 (PDT)
Return-Path: <jpuhlman@mvista.com>
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e? ([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
        by smtp.gmail.com with ESMTPSA id k11sm5541329otj.25.2020.03.23.18.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2020 18:03:40 -0700 (PDT)
Subject: Re: [PATCH] glib-2.0: update ptest multilib fix
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
 openembedded-core@lists.openembedded.org
References: <20200317060305.25237-1-jpuhlman@mvista.com>
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
Message-ID: <28ca0bc3-532a-8eae-9233-db949f52f8cd@mvista.com>
Date: Mon, 23 Mar 2020 18:03:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200317060305.25237-1-jpuhlman@mvista.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping.

On 3/16/2020 11:03 PM, Jeremy A. Puhlman wrote:
> From: Jeremy Puhlman <jpuhlman@mvista.com>
>
> The updates to the tests are done in do_install instead of do_install_ptest,
> so the changes need to consider ptest not being turned on.
>
> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> ---
>   meta/recipes-core/glib-2.0/glib.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index edecc51fdb..7ebed0e5fd 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -128,9 +128,11 @@ do_install_append_class-target () {
>   			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
>   		fi
>   	fi
> +	if [ -f ${D}${datadir}/installed-tests/glib/static-link.test ]; then
>           if test "x${MLPREFIX}" != "x"; then
>                   mv ${D}${datadir}/installed-tests/glib/static-link.test ${D}${datadir}/installed-tests/glib/${MLPREFIX}static-link.test
>           fi
> +	fi
>   }
>   
>   # As we do not build python3 for windows, makes no sense to ship the script that's using it


-- 
Jeremy A. Puhlman
jpuhlman@mvista.com

