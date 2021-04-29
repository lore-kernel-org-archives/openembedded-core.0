Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.346.1619719372675614504
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 11:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d5ZwAEVc;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso48080102otm.4
        for <Openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 11:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=b66//f00/WfU/lICwEiQvTz88/SMm6TWDatYRW5mYXo=;
        b=d5ZwAEVchBz9/I+Th2oWi9SR6Rm0bqkLKkjrFsb/WrKzCE8OMwIAdyIc6ovQ/wTkAI
         nwsk6AkGQGSO7Aw4BTvtPUFuXBK0lzjlGP0nHO+SxCVUYH0A+wqCmmUzlau7EBNcZi/v
         Zrnx20xXSjexG8PFyO+CZPL88UOPI3jvXek6jJEXXARBOL+c3UhzJ7tsbk/HMG3A/Ej+
         EPdceMld9627iYEqHYehZIyGwHDbm7845tj2o1NG214OC7bAlmzDdOWB7V+A1UQSuHP7
         ZfDfNse67EpeiTmUHTEgXGv4wp0DeIZd3l49vmB2jkuiKWmPyQS9psKEwqIr0FXWj2bx
         77+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=b66//f00/WfU/lICwEiQvTz88/SMm6TWDatYRW5mYXo=;
        b=NKhxSiqBcer4FyAtBfB/IN2j0EvZT8ol7OJSyhIlYMFbx03zg2Zae8mIPB6k9Ck9//
         x2P1k61jTonsIhl0x8x1+68RVmeNaQ380giRBPt5ZWdJZ64ieLyIsP3eZxDeSb8VrWq3
         tMzWtesMQzbhElIE0+yxKrRDdFL47NswsRCm5vabfYVrl59jzwLjvPL5FSPIbZNmu0/q
         FrjmkeyzNDXrvOUOdaqTzFEzykHg9iuv4TJ+R6K/GBeCUQJXHmeMsd15F0QtiDcqyGhR
         Al7bVBjXOVnCak2mfznQUc7rIU+AUcYUBySvj6dIMQ++ecatd+FTLRko7SbT+BBV9D5Z
         LwWg==
X-Gm-Message-State: AOAM5300h/wWUR6iIWVejHqwFw8WsvOsKCuOCe5jhP90KlOQoAWcH/N7
	jz7ifzRY3PxfRe+dLuWqFyY=
X-Google-Smtp-Source: ABdhPJw6mDO/DrlIy39e/EBnyZA6jSZSosBsDaUTK5jKefSPhfDcSGikMKzoZ2ZV4SB5egdVcRomDg==
X-Received: by 2002:a9d:6c95:: with SMTP id c21mr472041otr.85.1619719371994;
        Thu, 29 Apr 2021 11:02:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:a862:d97f:9823:714e? ([2601:202:4180:a5c0:a862:d97f:9823:714e])
        by smtp.gmail.com with ESMTPSA id v3sm111481oov.47.2021.04.29.11.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 11:02:51 -0700 (PDT)
Subject: Re: [PATCH] sshpass: add package recipe
To: Vivien Didelot <vivien.didelot@gmail.com>,
 Openembedded-core@lists.openembedded.org
Cc: paul.eggleton@linux.intel.com, a.kikin@tano-systems.com
References: <20210429153638.1077559-1-vdidelot@pbsc.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <1e3f7ea0-3e22-a92d-7344-e6f29636df8c@gmail.com>
Date: Thu, 29 Apr 2021 11:02:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210429153638.1077559-1-vdidelot@pbsc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/29/21 8:36 AM, Vivien Didelot wrote:
> From: Armin Kuster <akuster808@gmail.com>

I see meta-networking in the path. Was this change meant for
meta-openembedded? if so,
please use "openembedded-devel@lists.openembedded.org"

If I may recommend having it live in meta-oe rather then meta-networking.

-armin
>
> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
> ---
>  .../recipes-connectivity/sshpass/sshpass_1.06.bb   | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb
>
> diff --git a/meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb b/meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb
> new file mode 100644
> index 000000000..707a41879
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/sshpass/sshpass_1.06.bb
> @@ -0,0 +1,14 @@
> +DESCRIPTION = "Non-interactive ssh password auth"
> +HOMEPAGE = "http://sshpass.sourceforge.net/"
> +SECTION = "console/network"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/sshpass/sshpass-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "f59695e3b9761fb51be7d795819421f9"
> +SRC_URI[sha256sum] = "c6324fcee608b99a58f9870157dfa754837f8c48be3df0f5e2f3accf145dee60"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND += "native nativesdk"

