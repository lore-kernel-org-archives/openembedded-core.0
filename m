Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25BCC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 11:08:30 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.43495.1636369709913261287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WCdSxz+H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id z200so12663349wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V9ElD44KAqsbi0XLhyNBELxI4G//k4Eni98W3IyaeAs=;
        b=WCdSxz+HgcU3C44h0t9rK4QPPQzioH8kAmMfbe3tJgQBHaKdfeLzM0i/3FnimW9lIt
         EQunvfalsA5Vo0VKn+TsTDxlxwJB9lmpl9HYIzoKlHtjUENjkYT2gMG8Ogkrwiy+6D71
         44aqqwAgAvHRFVQe2N+j3KliikqrTfffJWq8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V9ElD44KAqsbi0XLhyNBELxI4G//k4Eni98W3IyaeAs=;
        b=7rl1ogZ2SLZqWVfEtFJA8XsR0ZpwPlCfuqFRioWJlW/pDUuBTOqXmPUvWLLyWuR1/y
         LUXNii5pTeinbWqxXGCiOE/p9Vce3F8E6cdfRxBh5AE2F61cRWGVTgw9awJQJ/QsSq1O
         l+Y9Ccg2Wy6qAyJgYA9cVZIkgCPyu5rz82qRafMoKQ+odHKlWPkbVUbxd521uKE93buF
         DeBKe3Hc04Kcvdt7faza3cBvNJnzB41B+IyE0K0qF8fSUIMn9v2PLHZ5JVl5baYMBqXP
         WxULKwwltudPX5RIVR6V6Yi4W6c9euP+NxTA5nIIlyggtKtR1V+Rzi8ImPyBl7vv8hJx
         9Xcg==
X-Gm-Message-State: AOAM531+oSNvkJvAcz7JVM2VVay+twyCYFAr5JpwQPPQ7dVPFLMsFro1
	FfCqjO0rTTe6a4CG+4vF/HfrOw==
X-Google-Smtp-Source: 
 ABdhPJzcW3R8QSH1sKjNL82EKre+XC6Yx6XLFp7ErR9rklLbM3q3DwrenzDRu9stcHHPpAs8daa4iA==
X-Received: by 2002:a1c:20cc:: with SMTP id
 g195mr52172991wmg.42.1636369708330;
        Mon, 08 Nov 2021 03:08:28 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c39:dba0:779a:3673?
 ([2001:8b0:aba:5f3c:5c39:dba0:779a:3673])
        by smtp.gmail.com with ESMTPSA id
 o9sm16501663wrs.4.2021.11.08.03.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 03:08:28 -0800 (PST)
Message-ID: 
 <7fc00066616717818068558463b78a300cdb5e6e.camel@linuxfoundation.org>
Subject: Re: [OE-core] broken dunfell
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Belisko <marek.belisko@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: maira.canal@usp.br, akuster808 <akuster808@gmail.com>
Date: Mon, 08 Nov 2021 11:08:27 +0000
In-Reply-To: 
 <CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
References: 
	<CAAfyv37SVDPteJkaLzZB7bYRdCPGK4ndKJ=gZig75GoxYAvR-A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 11:08:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157970

On Mon, 2021-11-08 at 11:53 +0100, Marek Belisko wrote:
> Hello, latest commit in meta-openembedded on dunfell branch raise an error:
> 
> meta-openembedded/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb:14:
> unparsed line: 'RDEPENDS:${PN} += "    ${PYTHON_PN}-logging
> ${PYTHON_PN}-fcntl "'
> 
> Seems new syntax is used in this commit, fix is simple:
> 
> diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> index 1ba2c6f..7ebaa45 100644
> --- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
> @@ -8,7 +8,7 @@ SRC_URI[sha256sum] =
> "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba334
> 
>  inherit pypi setuptools3
> 
> -RDEPENDS:${PN} += "\
> +RDEPENDS_${PN} += "\
>      ${PYTHON_PN}-logging \
>      ${PYTHON_PN}-fcntl \
>  "
> 
> Thanks and BR,


Whilst that probably shouldn't be there, I suspect if you upgrade bitbake you
won't see that issue.

Cheers,

Richard


