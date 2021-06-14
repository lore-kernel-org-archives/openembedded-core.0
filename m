Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.32001.1623685537547858612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 08:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s3ATgRnE;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id l184so8968239pgd.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=aK+CRd0lUGGs3IVzeCLOwhGtjNW3Uc3T6jVDXAmxZEk=;
        b=s3ATgRnEmEAksczMdY6V6NvbnmX6hs8Lrz3AkQ1ZTUcPMDSt00Z8iBQ3m6v6VkprbQ
         fysPVm0U30qN5KB3tbrhuUbSWToPIE55i30DXqjUOkSCmu883dKsFM2cyM8+z9krsbYQ
         +JOS2f3215PBBLclU+oCV7rHLIhnqu6guRz8RGhgj/BtryZANUWHsp59mIrEY8TCjuul
         ZwRk91lusTz06LCIkX3pi7tRE2836ID2fB1A7L5TwUSK2kblgvPKk6SxwgzvlMOIy4WI
         6YQs8gGPHyS8oTr4aCltLDBywyQkAF6M4E8/CQkBMFuEtAaVtk7yi2KW6qE/Lj86pLhm
         m9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=aK+CRd0lUGGs3IVzeCLOwhGtjNW3Uc3T6jVDXAmxZEk=;
        b=uAs8Dt8TPmHKuQ8X5KqeNso8g7sf9ppR5tM8zn2pYyfly0ht6Rv2MXROnulK5Y36SC
         DpFoiRpnP91DwgDmCIbLsLFjIeiaBativ9o1JV8RPSUNRwECaA0jwAAt3tp0gl1X3gVK
         Ry5iHxTcYsyJntaFhUslDr+1W4KfbbQMdDSv3pTZOL2YkFYPoBBvbMDGD/Kly9rn9Gen
         gHc3j3QeHUHtybTaht/aBNVzrmMzCQ0xxLSSxB8UwPhs5t1aM3dIzSpNGni2DFTT64yk
         YDNn2QHwKZ6wAbd6n8W6RRgeveVfDuWDcauVRuQVOUE3n8i7f45BD6eEgrridFuKgH7S
         sR9w==
X-Gm-Message-State: AOAM531XQ4oPZJAA6bRSSqg6UNm6XauhTR5oakFhLoqq/jT3J4vnhQ7O
	A461OpQ2SJ1A3SiqkHOzgJ0=
X-Google-Smtp-Source: ABdhPJwv0uSvAVfWuqi5pogo3e6Qn7juLGgpBq5GXAxp5G2l9CnCGBYKbn5HxSMjAutVPAeUcD2z1g==
X-Received: by 2002:a62:1e82:0:b029:2f9:aad3:b368 with SMTP id e124-20020a621e820000b02902f9aad3b368mr6150599pfe.79.1623685537005;
        Mon, 14 Jun 2021 08:45:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:ed93:eb87:6dc9:a518? ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id w23sm12769297pfi.220.2021.06.14.08.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 08:45:36 -0700 (PDT)
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
To: RAHUL taya <rahultaya96@gmail.com>,
 openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com, purushottam.choudhary@kpit.com
References: <20210614104631.3190-1-Rahultaya96@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <2f2de529-721b-b561-ef3d-ac93a7da3178@gmail.com>
Date: Mon, 14 Jun 2021 08:45:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614104631.3190-1-Rahultaya96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 6/14/21 3:46 AM, RAHUL taya wrote:
> As per below reference links this CVE issue seems to be minor and
> harmless and as per upstream this is not a real issue in practice.
>
> And as per red hat this issue is marked as low severity.
>
> 1. https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> 2. https://security-tracker.debian.org/tracker/CVE-2015-5237
> 3. https://ubuntu.com/security/CVE-2015-5237
> 4. https://github.com/protocolbuffers/protobuf/issues/760
Thanks,

Please use the openembedded-devel@lists.openembedded.org
 for meta-oe patches.

-armin
>
> Upstream-Status: Pending
>
> Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> index 4d6c5b255..f845a72a0 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> @@ -88,3 +88,11 @@ LDFLAGS_append_arm = " -latomic"
>  LDFLAGS_append_mips = " -latomic"
>  LDFLAGS_append_powerpc = " -latomic"
>  LDFLAGS_append_mipsel = " -latomic"
> +
> +# As per below links this issue is minor and harmless and
> +# as per upstream this is not a real issue in practice.
> +# https://bugzilla.suse.com/show_bug.cgi?id=CVE-2015-5237
> +# https://security-tracker.debian.org/tracker/CVE-2015-5237
> +# https://ubuntu.com/security/CVE-2015-5237
> +# https://github.com/protocolbuffers/protobuf/issues/760
> +CVE_CHECK_WHITELIST += "CVE-2015-5237"
>
> 
>

