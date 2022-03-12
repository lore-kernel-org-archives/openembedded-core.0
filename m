Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0064CC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 13:32:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.4670.1647091965380281961
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 05:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PxRWm58s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id e24so16927457wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 05:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=06XkTuODjnmmy3mD3FVz02BcuiKa99jRIyRiLEf8X4Y=;
        b=PxRWm58s6bQx0oRcdPpdUz5ExjM/FS//7EGj34QC03QZ/HdnQdUkOe1j06jwgDFV0X
         sCosHiiTmCrL9KLdCl9kn3kCVcJATc7/B0Eb9U8HTRxtSuCgJDrydJxqiNcdb2WBJ2eT
         3nNrCyD0r9BDoYqT6jUdDmS/oCu2S5S2AgtiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=06XkTuODjnmmy3mD3FVz02BcuiKa99jRIyRiLEf8X4Y=;
        b=MttpkFv5hMgLfXBc9e0jVJ4V1QVZ6fOXb7tAdklUe4VBUXz5r9zS2mx2ymFXu8j/xB
         fpnavgwLOUw638usQ5dwZ24qws6+6kBwvjfCxUl1ixcrO8EbX4MoQoLzBzY2jjxNvl8F
         GuTHhSeAfzFg49QxJ1M06j8ZICPW85tVXHnpLYKuzUCUEWmX6wKfL3vMAd6ByR17+Kmc
         y4/KaIUHWwAE7KmAf6oQ1mQSYqSx8n45iedXWLOthCx8JYiu/UiNEKW4V3Phq4Zjvfdm
         cjPMSEuxropEQA4LAu3CEH3R8civnUIPDYW16So4Xy2bpOvyPqgjT47eF7b9q+tIX3cm
         65qw==
X-Gm-Message-State: AOAM5307jMUhtMklU5EgdFr6AQo3m+t+ncvOd31ChSB3LZRAzVCI27DL
	3d1ptEtsVhdHz8JXikw4yuIX6Q==
X-Google-Smtp-Source: 
 ABdhPJx2PjKFV66OzXcyikHAh+3zfHmiMeUZOm52V9FgyYVymVmYsfRUX6ECNGUE9Qysorx3I+kPpg==
X-Received: by 2002:a05:6000:1d85:b0:1f2:197:60fc with SMTP id
 bk5-20020a0560001d8500b001f2019760fcmr11210443wrb.316.1647091963692;
        Sat, 12 Mar 2022 05:32:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7?
 ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 e10-20020a056000178a00b0020393321552sm5103060wrg.85.2022.03.12.05.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 05:32:43 -0800 (PST)
Message-ID: 
 <8ee120c2a797e8cb2b9fe011312b932fe8e83b6c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCHv3 3/3] librsvg: inherit vala
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2022 13:32:41 +0000
In-Reply-To: <20220312073022.2894-3-f_l_k@t-online.de>
References: <20220312073022.2894-1-f_l_k@t-online.de>
	 <20220312073022.2894-3-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 13:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163088

On Sat, 2022-03-12 at 08:30 +0100, Markus Volk wrote:
> this fixes a build error about missing vapigen and enables vapi build
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-gnome/librsvg/librsvg_2.52.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
> index 1279c663f7..ede6454c2b 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
> @@ -14,7 +14,7 @@ SECTION = "x11/utils"
>  DEPENDS = "cairo gdk-pixbuf glib-2.0 libcroco libxml2 pango"
>  BBCLASSEXTEND = "native"
>  
> -inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection rust
> +inherit gnomebase gtk-doc pixbufcache upstream-version-is-even gobject-introspection rust vala
>  
>  SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.patch \
>             file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \


I'm curious whether we've just been missing some functionality in librsvg or
whether the recent changes exposed some new error?

Put another way, how did you see this when the autobuilder does not?

Cheers,

Richard





