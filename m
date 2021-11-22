Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E5CC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 11:56:24 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.5420.1637582183352635912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 03:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y/Hr5cuh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o29so15060230wms.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 03:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=2j33lF9P84qXtC+FxztixQOXUQZPYIvhKQSEx+wOH5Y=;
        b=Y/Hr5cuhk/LPXP0VFq51/xK4rOSsAQF1H3WP37SXxxpFO0+RIt87kM2/+7nzT4VPr5
         EQ7xNW0trAYn07/8NNKY3qObgYSvsF5l73eVqRK3ULuAbLM1p3CZwGABKoz0CbnyDjTP
         kNHr7Op3dmsZGQPZe0lMCGSwnO7WTIx7J1gSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2j33lF9P84qXtC+FxztixQOXUQZPYIvhKQSEx+wOH5Y=;
        b=qxmu7KRX1WuNkQlfNEyFjW3fC+/sOkXv6u5YYuEEa5Zwimu7SmnLLRDwndCTldtcXG
         kDDwFZJVDKJKe9/m+VWkSbczsVd8FO65YjExHs6ua+Q6WF4BN3u/ps/+53vGXLj89Q01
         oqOUZJP43+udpK2lKnmAqNhr/9yYQywAasqHdrF2xBt6/05Z0lMrSzZrFox2YWDuVDfz
         UkOzSvgOV2vjZLD7XQtULyd4+kZo2WYXj2JsOZ4mAxmylx3V+VSVmGv9l9+sxQq2+gYS
         KVKzgr/jyJbumeDrSimkLkW1WT382+Bj1p8bfXVOLRpSPP5f6ojF/IpOcEO9ShrdghUa
         t8kA==
X-Gm-Message-State: AOAM531y5FXWlCg/fqBpY7eJvSkUce8uBAp4BrgV8Svz8Totvr0xCB21
	gOURGxXkZ7Z6du9+oG2FhxAsPw==
X-Google-Smtp-Source: 
 ABdhPJzN291lr/v4/EmDlRc2aWr7HvomeJ9aWrGUfFYh9qg3JJRJxqTp/0KWXqbfyg2dTHOustR7fg==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr29629853wmk.135.1637582181723;
        Mon, 22 Nov 2021 03:56:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e31:269d:c208:4e1f?
 ([2001:8b0:aba:5f3c:e31:269d:c208:4e1f])
        by smtp.gmail.com with ESMTPSA id
 j40sm24804866wms.19.2021.11.22.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 03:56:21 -0800 (PST)
Message-ID: 
 <db2638a45928ea0d875de1cc62c9fc4ea5dc9149.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 4/7] systemd: remove volatile-binds
 RDEPENDS for nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
Date: Mon, 22 Nov 2021 11:56:19 +0000
In-Reply-To: <20211119113429.502652-4-luca.boccassi@gmail.com>
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-1-luca.boccassi@gmail.com>
	 <20211119113429.502652-4-luca.boccassi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 11:56:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158564

On Fri, 2021-11-19 at 11:34 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Not needed for SDK binaries
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v2: remove dependency instead of adding nativesdk to volatile-binds
> 
>  meta/recipes-core/systemd/systemd_249.5.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
> index 9993036aac..2928a85c93 100644
> --- a/meta/recipes-core/systemd/systemd_249.5.bb
> +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> @@ -644,6 +644,7 @@ FILES:${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
>  RDEPENDS:${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck"
>  RDEPENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
>  RDEPENDS:${PN} += "volatile-binds"
> +RDEPENDS_${PN}_remove_class-nativesdk = "volatile-binds"
>  
>  RRECOMMENDS:${PN} += "systemd-extra-utils \
>                        udev-hwdb \

This patch raises a few questions like how this is being tested?

The override syntax changed so the avoid would never have worked with master.

Also, I have a strong preference for not using remove operators in OE-Core, you
can usually rearrange things so that it isn't necessary. The reason for that is
that it is very hard to override these operations. I know we do have some but
minimising them is good.

Cheers,

Richard


