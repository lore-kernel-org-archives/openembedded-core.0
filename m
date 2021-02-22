Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.36758.1614009767222490240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NPyQtDdE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id v62so14852651wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 08:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XVwSjc/yCEbg3+KDG78d5TUKFtF9TkKb9W72g8P+IRE=;
        b=NPyQtDdENQWl35Hl10JqA8Thaz00ZPhaZ76rw1KifoGAHZXlEEuh2OFdm626PzBCk6
         pJ7UOqGbS+j1XdVceTItrDmuAtlUhbq6Q3bum/1vsmSj2Mqh1HcDWA/5mXk8NFQGxtgX
         FhNaFsBRxEpxU3VjCeNdxLuYjg7zByE0Ou27I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XVwSjc/yCEbg3+KDG78d5TUKFtF9TkKb9W72g8P+IRE=;
        b=WpCmDjwDPii3hw2DWzOBvI/tzmkGvXqXqrG7xXpQnfvD3zQcmP/YkaFhC0YMsZ0dwW
         nq5I/SQ02Xt4e6s8YlUwDdyi0YX8nIawnDC3bsHY3/20PgwXWqhCbZ0Fquo8SK8Ga1JF
         AWQMZZ2YIcjE8aiB+LZZvml+ldNR49iZdknNaYEQhSvB5zZRlJAVBmNTPURykoIMjgbY
         z8XdUVKEaHIFMUqZ6leEspm0HWElgxfct9+bJStbu8/a8ByLJHzzxS7cn4BW3rqJQ/Fu
         lQCyLuOtgnCBotvP8Lj+CYP1a+OWB8vL70aiQMDcigubSg3ESx1sJ1bHXMhqxA+bopks
         vKKg==
X-Gm-Message-State: AOAM532+k9pSxQePPMOlEajNCZ2Hsfdaci6veDvPgzAVWD/aodXKAjVC
	pzKRIH3ySpGVfCAOH4e//BQsmD0RJOafeA==
X-Google-Smtp-Source: ABdhPJzV8kWeLOoMaDOzmp0HS0GmaK2E/XGC0kzKokdxBU1FdD7q+EG86kD/LY8H8++j8jBZePxTCQ==
X-Received: by 2002:a1c:e483:: with SMTP id b125mr13387959wmh.185.1614009765802;
        Mon, 22 Feb 2021 08:02:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6747:849:8224:46bc? ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c11sm28124325wrs.28.2021.02.22.08.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:02:45 -0800 (PST)
Message-ID: <4462ffe940c0fa879486300e5d7d358045604133.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] busybox: search stable versions for AUH
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: open.source@oleksandr-kravchuk.com, alex.kanavin@gmail.com
Date: Mon, 22 Feb 2021 16:02:44 +0000
In-Reply-To: <20210222154956.27267-1-andrej.valek@siemens.com>
References: <20210222154956.27267-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 16:49 +0100, Andrej Valek wrote:
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 47fcb59302..253168e2b9 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
>  
> 
> 
> 
>  SECTION = "base"
>  
> 
> 
> 
> +UPSTREAM_CHECK_URI = "https://busybox.net/"
> +UPSTREAM_CHECK_REGEX = "BusyBox\ (?P<pver>\d+\.\d+\.\d+)\ \(stable\)"
> +
>  # Whether to split the suid apps into a seperate binary
>  BUSYBOX_SPLIT_SUID ?= "1"
>  
> 

I just realised/wondered whether:

inherit upstream-version-is-even

would work here?

Cheers,

Richard


