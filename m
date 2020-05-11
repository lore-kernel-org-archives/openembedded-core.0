Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12225.1589204723422528731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 06:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FAzdRsR6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id m12so13199617wmc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IiH2N1zggF8AIi2wlv8t5qC4ZCRg6Za8To/v6KXiLPU=;
        b=FAzdRsR6ilQAZU/rylxAwApdi5gmuf9ivGhANrrFi+z6Y/duwQTCJKhmvX6HR7JFy7
         5smcu3Wwcm7Ani/4CEWAG+AiEsCaWH7OW4QRSyumUY1emV6uH1OK+f6T0NpWFMxerKnh
         0nHQ4DRsXP884NIlqHmVZPYy6NGZUq4K7LefU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IiH2N1zggF8AIi2wlv8t5qC4ZCRg6Za8To/v6KXiLPU=;
        b=APnz3uey9E5l8mbKR1XhAZAfbQxLdIO4xx/PLQ7noaUF7NPDOuRXJsGXCrwMYUrplx
         WvuUOT/2RcCvb6LfnKO+QVVh1ZWxeFLLXxsBStiWVrVSZ3upj9HtHBuXhEWNg1v5ADhB
         LH5qBw6M4iJnh5pmNRjnA/hIZ8PfpNF1nYv2aY47eg2Ns24LN6TT5962CuO7MFG2cJ6E
         Ipa2CDXjVDRhrgR/yvC3xfzBsgvsyQzdQnG2WGwW/RWpKxjICX+9iz9tbIVJUxDDJLso
         hnMOAE12zVIFx+TtNzc3sVCiPI2CszI25St5zOr17BojszwJ70vAzjOp/edbyqB8piWs
         11Xw==
X-Gm-Message-State: AGi0PubtaUemTJo4tV0+pI+6hT1tmn25zyduag/iywCu1uiEefNkN94g
	AsIbY0gJS7jqsovAf+hJ0gnJCQ==
X-Google-Smtp-Source: APiQypKnNNQ9c/Vaov/AyIeYI1VQUM8kQK1S3TtVxsm12aj4qraCz5j+n8il5uGPDnwWcrdPa/UBFw==
X-Received: by 2002:a05:600c:22d6:: with SMTP id 22mr31569890wmg.121.1589204721991;
        Mon, 11 May 2020 06:45:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id i74sm17890260wri.49.2020.05.11.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 06:45:21 -0700 (PDT)
Message-ID: <3af1478455588f44639685593b92752ddf784c8e.camel@linuxfoundation.org>
Subject: Re: Pending GCC 10 -fno-common fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Richard Leitner <dev+oe@g0hl1n.net>, 
	openembedded-core@lists.openembedded.org
Cc: richard.leitner@skidata.com, bunk@stusta.de
Date: Mon, 11 May 2020 14:45:19 +0100
In-Reply-To: <20200510093148.GA3697@brokenbit>
References: <20200510093148.GA3697@brokenbit>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-10 at 11:31 +0200, Richard Leitner wrote:
> Hi,
> just a friendly reminder for my pending GCC 10 support patches:
> 
> https://patchwork.openembedded.org/patch/172350/
> https://patchwork.openembedded.org/patch/172351/
> https://patchwork.openembedded.org/patch/172357/
> https://patchwork.openembedded.org/patch/172358/
> 
> With these patches applied building on my Fedora 32 hosts works again.
> 
> If there are any open issues or things which needs to be discussed on the
> proposed patches please come back to me!
> 
> Thanks & regards

Thanks, we've had some fun sorting the last round of patches but got
there eventually. These are in the next batch and seem ok so far.

Cheers,

Richard

