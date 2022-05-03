Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51B5C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 19:57:41 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.242.1651607858209238663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 12:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iVszuFaD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 p7-20020a05600c358700b00393e80c59daso1757656wmq.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6FiNm/klgLKJW5JgF9W6ajJQDxMkEVUTgZL4nidrYzY=;
        b=iVszuFaDUyNqtbRUZEkBdGdXj28aNT22j1fXBOqFT4k2rzGxTa2mM/FYKZBcvHTY0r
         9bIF3sSJi3Wl31Eh4FIeYWu2GUYSxtyDlmuUOIhwIFFCDNQmHX7yJmplwjVdUdRuO9Pj
         3KyTLQCO5MTxux4DX1Vy5wkA2WHqbQq8TKEkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6FiNm/klgLKJW5JgF9W6ajJQDxMkEVUTgZL4nidrYzY=;
        b=TOO6/j0IGyYTemmTUc5zSRwmBPsD/lqx+CpWo/rKRkisyR6+Ux5rYfk29sgh+nSaVr
         mJktRJVuat1Q+4Vxd3mUjUVduHnfwe18NR+A7yYp+V6XVLgDE1mJkOS+JMVFIWjUCxjg
         lOIfZOA0cdbRsv6oxx2qDrdIF7WauIisLswiSQ9RgrvagUoQGNCj/wMGbO69hz906c3e
         b6VNjbx7sy0e/Fz+BNDeJPgcqlxl08bOQVpIx6IY/IYa8S6dSXA/BAwD8VCN1Qr3epn5
         rguTqpDjcqUa33YWsiMwrrdiPjFSWz3AP0e78GdFbYXLl7MzHj6l9V8c3bekDaYPkiuq
         z0vQ==
X-Gm-Message-State: AOAM531Qvt3VQUkdDH2uJFz616nyysFS8gdSw8uhOI+gcelTIKnC1UPy
	X7K7eI9F0c2q3x2htRCg7wPZPA==
X-Google-Smtp-Source: 
 ABdhPJwpFBJrtGUrI4XsS1ippRGSB1SfUQH3vkcYPY6wj9aL+fJUDyr+Tp+gCIb0Wh48F12MstUuZA==
X-Received: by 2002:a7b:ce08:0:b0:394:32df:2ae6 with SMTP id
 m8-20020a7bce08000000b0039432df2ae6mr4667631wmc.184.1651607856639;
        Tue, 03 May 2022 12:57:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d387:a418:2b62:bd29?
 ([2001:8b0:aba:5f3c:d387:a418:2b62:bd29])
        by smtp.gmail.com with ESMTPSA id
 v2-20020a1cf702000000b00394538d039esm1196676wmh.6.2022.05.03.12.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 12:57:35 -0700 (PDT)
Message-ID: 
 <0b661ac3e116f1dd5af0907a3250dc610abf8881.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] vim: Security Fix For CVE-2022-1381
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rahul Chauhan <rahulchauhankitps@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 03 May 2022 20:57:34 +0100
In-Reply-To: <20220502125012.11630-1-rahulchauhankitps@gmail.com>
References: <20220502125012.11630-1-rahulchauhankitps@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 19:57:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165206

On Mon, 2022-05-02 at 18:20 +0530, Rahul Chauhan wrote:
> CVE: CVE-2022-1381
> 
> Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
> ---
>  .../vim/files/CVE-2022-1381.patch             | 111 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 112 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2022-1381.patch

The security issues with vim have proven to be rather annoying and we've simply
been updating the recipe to the latest version more recently to handle these.
Would you fancy sending a version update for this instead? It isn't what we
generally do but does seem more appropriate here given the frequency.

Cheers,

Richard


