Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F069C282D1
	for <webhook@archiver.kernel.org>; Mon,  3 Mar 2025 16:31:16 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.58209.1741019470956044590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Mar 2025 08:31:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1G3sntlK;
 spf=pass (domain: smile.fr, ip: 209.85.218.54, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso666799566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 08:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1741019469; x=1741624269; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LvRDgozOnf8NmkZxl2yAvbH8zfQU2QvtZCnC7E5HbMA=;
        b=1G3sntlKZWTEmBBcalbTl4t0P/rqnorz5Buin4De0QdMfYbtyZOuFOjI1hWuXca59k
         sFRVb104uqXe20uUhywk2/wHNoWfT5r/yVVOqiitozdzPiL6lAjdlZmA5E7wUfGQBe3k
         wZhAzffaYJ0WJzO+3zNVm3OWdV5G6gKTn57Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019469; x=1741624269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvRDgozOnf8NmkZxl2yAvbH8zfQU2QvtZCnC7E5HbMA=;
        b=BtvVykhKdkdA3dno3Q3ePTaibv9G3X40OtsjN1zk7LPT9/6d2PMLMFFH999LxquxG5
         qFWq/YN561J8qI8OxmvEvrC8ETkAlbhlq/Md3P7pMuEovioIlrsfbOdPNFXOiA5t5GOw
         pKo3Si+DRquNZPIIHLvYR3mqxvJkCBLyAnoILLMumQ0LF70JE1PuBv5Xbtqo6gPKwA6p
         A9wQJt23FA7YS6437GSFDZPT0hgn88GfiXZAh4qmb+MzVC7+N/v/NvxAHjYm8bswg+Zx
         Fa7GcrMr/oRiTb+0nsEkACdNDZJhhVWId6TmwMdf2GlhLM1Snn2IYBU97Z8VeTC3Fu+m
         vYNQ==
X-Gm-Message-State: AOJu0YxR4FF7k3G5CDEXrH2Okuwsrtrg93miuHpNIsoPjyWRKSQ0RFHf
	OEXZ9LyN4G6QwvzrosVHq5r57ELx7n9Q19qSGmB+SxGI6AmvtawAMJAJRF7TCDWZc2SM13J50fp
	Y2yp6Rfy3kL4kRFkFnwoCwHMRAfsQo3kd6dsT5A==
X-Gm-Gg: ASbGncsBJhD5CC58eicbsn2bNDKh9oA6scB7HPUG1kVrocJnIMA3aYifO7vQflK1L5P
	NEsCez6irwjhk/QkgGgNiEqBUyCjeiNImZxq8trsZJj/KDHAnMxwBvGQQhFxfZN7EvW+i94lOHA
	XfOJqeqEKZF+XUE+Wfm/y4Q414vSU=
X-Google-Smtp-Source: AGHT+IGVnIZdAgApQ8TWP31CoAL1mKK3vH46dgsM73JiPK2aBJrk+yuYnMz1F5EETUBtmJqrj8+affOG9HvCWfQjXiA=
X-Received: by 2002:a17:906:da88:b0:abe:fed3:9eb8 with SMTP id
 a640c23a62f3a-abf2687fe85mr2043486266b.41.1741019469340; Mon, 03 Mar 2025
 08:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20250303134038.102355-1-alexis.cellier@smile.fr> <c33ab1f9-9235-4076-98bf-c8bd163c6464@cherry.de>
In-Reply-To: <c33ab1f9-9235-4076-98bf-c8bd163c6464@cherry.de>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Mon, 3 Mar 2025 17:30:58 +0100
X-Gm-Features: AQ5f1JqHqZnR8-GCjS08JwMgb-MYGKwC9s3ruKXUw638Fr_jctztv8LJM4qnWqw
Message-ID: <CAEs58j5nztU=uxm5d7xsyOLghaQWbno8xsG7KWTFQefWsbYAKg@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] systemd: add libpcre2 as RRECOMMENDS
 if pcre2 is enabled
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Mar 2025 16:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212221

> Should read RDEPENDS I believe instead of DEPENDS, with the automagic
> mechanism that detects shlib dependencies and insert their packages if
> the recipe building those packages is part of DEPENDS?

Yes, I did a typo. It should be RDEPENDS.

-- 
Alexis Cellier
Smile ECS Developer

