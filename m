Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.15434.1592941612594260835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 12:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J7/v9ewR;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id u14so1926689pjj.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=kSDqQq8b6Q2QvbR6OnIZaO6PH5SMRqXVELniICb0l48=;
        b=J7/v9ewR+gTHJASVwQ8eS6WiErvHgUn2Qmy1sHSbO+8CD0W44+pjKYbztR2CkUc6L0
         EnmfvWJ3vKCMDjMwwwIAgHqOozRS/MoSmPrtV8ps1e2Tuja2lultSyuGG8L2wThe8Tjk
         giAxL7QNN+hV1mtRmWtzybSUZ7163zNdWful7TSR82mf6k5enE3MPh7l6XWLD3UISlV0
         jOv9dxcmV3esy2OP+6Ejvo9AVC+GFPCo6atpBhmvdqfweb25GIoxdjewNg921I4QgUp7
         G476C/SNg0xWxisYxNJAGP+sQtQw8Cyvwhx9eZXh4pRw0BdWeDCXyu8Cgs+6IObsoaUs
         xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kSDqQq8b6Q2QvbR6OnIZaO6PH5SMRqXVELniICb0l48=;
        b=QYrfqbt078Wf60wL9sjdqRQvICFrZejtJruU1E7wIIZ10lLBHb/oikNN66/3t5d4p6
         5RIrFMWmdcWobxKsHlGTi32hXZZYNUaEWKeI5PP26irKyGEB0wOkahBYKYn5dcctdrOc
         S95dZsP9KggKae7Egdm9egbG7VLmBscpT+HoP9EinVN9SbU4iKZtAP6BO6lOINZyYtLd
         Rtg9KTXXqXH3RWgfke/48u31YyV17dfaQv/LJ1Rr/s51EJmWuUcwECZAMyHghBmS6g44
         wzs4sm50BC42lBr0ZRfzFxOWOt4QPYOIXS1cM44NI3SnLFnCazidpSsOIxCzdoXATCye
         cwMw==
X-Gm-Message-State: AOAM530Zu6qlFfafx0HhUloHoGxTxkOfgmqkQPAoYxDFtmcAv2cr1VeD
	Xm4upW9nFvGPv8rXXr2O3BxQcucq7z4=
X-Google-Smtp-Source: ABdhPJyQRYPemca05LxodOyn4jadbS+MWzSSOKuAJbgG4yObwdNUAHuzIHQhzkcApiUGXqKFouxI3A==
X-Received: by 2002:a17:902:ea92:: with SMTP id x18mr25486006plb.157.1592941611139;
        Tue, 23 Jun 2020 12:46:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a? ([2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a])
        by smtp.gmail.com with ESMTPSA id i184sm17102294pfc.73.2020.06.23.12.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 12:46:50 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] vulkan-headers: Fix upstream branch deletion issue
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200623134150.603584-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <a9fe68d2-b2d0-4ba8-dca8-78dca19ebb6d@gmail.com>
Date: Tue, 23 Jun 2020 12:46:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623134150.603584-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 6/23/20 6:41 AM, Richard Purdie wrote:
> The upstream branch was deleted but the commit is in master so reference
> that instead.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> index 54cee96cce0..d21c3d62b90 100644
> --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
> @@ -5,7 +5,8 @@ SECTION = "libs"
>   
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
> -SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135"
> +# was sdk-1.2.135 branch but it was removed upstream, commit is in master branch though
> +SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
>   

perhaps better to update to SHA of latest tag ?
https://github.com/KhronosGroup/Vulkan-Headers/releases/tag/v1.2.145

>   SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
>   
> 
> 
> 
> 
