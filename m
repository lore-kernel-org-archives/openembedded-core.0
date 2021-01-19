Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.10667.1611060127817440320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:42:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ll6BTz10;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id d13so19551031wrc.13
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 04:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yG4TdI6HqWDvZykOeFtuWjiow91BvdFPKmlOYH8E9Xw=;
        b=Ll6BTz10/p0az/fjGs7ErtRf/v0182wsB+Bzma0eLfyntuRAIzJcROpoyM41v3CztK
         eDfqMnmCEiXmG8fDD8mHA71NXU0jII3UrCcEnr6kvhaSkaxaVClT2j4XzRUV8yYMKKec
         2kXmKlgrJG5S+53KppNEbT+hDgAQtd3jXrZPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yG4TdI6HqWDvZykOeFtuWjiow91BvdFPKmlOYH8E9Xw=;
        b=VtsyQcMqlsUYqpAJBn40d53vPNX15WumfqfyM4xrI2td81uPa1LcFHX3Wo4rwzkT2A
         NWL7Ms3wDRBW7zQd/2UGz1X+MYukcZX8HeUM9plqhuD3ZXiF2zVUuIlJ7R5XOG6Cb6gG
         CQUmGJkEYniiFdVElA2iBPANFjXRG4MIB6FIw+NTV4NwT2R+FBYTm2pQmIDdxwHm4CEo
         Y4i9012kENBnXznTX9D3etqKtvnjTNqEqptwwoCbROv3BpgSxttdEyIkeSHKoNXQND/U
         1bn9FBszrMCP8NE0Sn8z4Ka87pZUSD3Aexsm0e4IcS9DsnekbPSBKJSYYam6ngwaPxvU
         bfvw==
X-Gm-Message-State: AOAM533i5u623kzXYSbYWzApi7JEPaaE42ctzmLpvGPs1hrtoLXLvX+f
	F07Vu3sFM9RAWRDD3/xMLXenxg==
X-Google-Smtp-Source: ABdhPJxGk3CMQ7SoaRCzNFxPqP/EiksQ6Ux+fOlt0zQ3jR1IJo9C7E0IrOmuUXduJjaDjHFfbRdr3A==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr4177813wrq.75.1611060126432;
        Tue, 19 Jan 2021 04:42:06 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id d13sm35803802wrx.93.2021.01.19.04.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:42:06 -0800 (PST)
Message-ID: <2373028965f82731c9ed64b4366ba8ba85c8f35b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/30] enchant2: upgrade 2.2.14 -> 2.2.15
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 12:41:50 +0000
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 14:45 +0800, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../enchant/{enchant2_2.2.14.bb => enchant2_2.2.15.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/enchant/{enchant2_2.2.14.bb => enchant2_2.2.15.bb} (90%)
> 
> diff --git a/meta/recipes-support/enchant/enchant2_2.2.14.bb b/meta/recipes-support/enchant/enchant2_2.2.15.bb
> similarity index 90%
> rename from meta/recipes-support/enchant/enchant2_2.2.14.bb
> rename to meta/recipes-support/enchant/enchant2_2.2.15.bb
> index a5080d9c78..05e84fc726 100644
> --- a/meta/recipes-support/enchant/enchant2_2.2.14.bb
> +++ b/meta/recipes-support/enchant/enchant2_2.2.15.bb
> @@ -9,7 +9,7 @@ DEPENDS = "glib-2.0"
>  inherit autotools pkgconfig
>  
> 
> 
> 
>  SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "bf7cc9a410b54c29648c7711dc8f210e7b13768508aaf43cc9c4527d5a9c7a8e"
> +SRC_URI[sha256sum] = "3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03"
> 

Hi Anuj,

There seem to be a lot of point version upgrades in this series. How
sure are we they are all bugfixes?

Cheers,

Richard


