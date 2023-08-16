Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB16C04A94
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 06:47:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.155556.1692168453945342114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 23:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WKU/fgRA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3179ed1dfbbso5405162f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 23:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692168452; x=1692773252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nxuVc0fPaTO5LOTP/Z7XHc6LqD2OSJPWiwIwus3f36M=;
        b=WKU/fgRAsjlaEPzLHs1N3pvBp2vR7UTM0Uuz8v6wNIJ9j801PSj98oEGqt2XdLsxc6
         EzsGfq2v4qUo0PPxW25KCJoImOnUAwIpoWtlrEYI38qhSrKCbIvzJEP0ABrRwKn3kc+E
         VGSvIUr4uQdqJYcrUoyihZvkmN1bTI7vRiJDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692168452; x=1692773252;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxuVc0fPaTO5LOTP/Z7XHc6LqD2OSJPWiwIwus3f36M=;
        b=XqLywohdraziIh+p+Infl6voePyDMkthI+6gqi50mtEToz9FnsH4tp0/GKCbA+LqAA
         U1U9iA00EK2WxxYTbn9+KyXtfw0uPiTYHYcuEGO8AVG6llliFrQL6A9gxsbbkAUsIL19
         +QjC3JM0iC7FOvjaLllt0YWslr/pQ++IhiIUY68xI4ofKiKTTKKwgoELqLLdOs4CBmNb
         uQB2gI0neAUexbwKfiuyc/J36pBfDbWvo7cPqVOCmJFrtXbJUX7c/Rcpw5KooWiS9bkG
         81Fau9KCWdzW2fIXg5NlCVunSV0yCSt1RpwIymDWwZUAdgdipXxZuSU7ct+KT4uDgZUs
         MT+A==
X-Gm-Message-State: AOJu0YzNXHsFArjZsanY/LSyaLKwIS8D37DLcoFNSXhm+NPHiz01nsln
	bZIHDrUIyksjtuElvFVH330WMg==
X-Google-Smtp-Source: AGHT+IE0Z8R/j5lWGUw94cTxVxas99ioXJlME+MWhc28/TsfJkADfHH/IyRwTB9dW7JWA8mnR+gzsQ==
X-Received: by 2002:adf:f3c6:0:b0:319:84b3:70e6 with SMTP id g6-20020adff3c6000000b0031984b370e6mr781516wrp.48.1692168452299;
        Tue, 15 Aug 2023 23:47:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b782:7711:f696:663e? ([2001:8b0:aba:5f3c:b782:7711:f696:663e])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d4281000000b00317a29af4b2sm20032975wrq.68.2023.08.15.23.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 23:47:31 -0700 (PDT)
Message-ID: <65fc0948436d0ac2753e213664bc44afa629ddbe.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/image_types: Add vfat image type
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Joshua Watt <Joshua.Watt@garmin.com>
Date: Wed, 16 Aug 2023 07:47:31 +0100
In-Reply-To: <20230815161126.1513219-1-JPEWhacker@gmail.com>
References: <20230815161126.1513219-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 06:47:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186115

On Tue, 2023-08-15 at 10:11 -0600, Joshua Watt wrote:
> From: Joshua Watt <Joshua.Watt@garmin.com>
>=20
> Adds support for creating FAT formatted file system images (useful for
> boot partitions on some SoCs).
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-recipe/image_types.bbclass | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

This causes a selftest failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5616/step=
s/15/logs/stdio

[in other selftests as well, a consistent issue for a change!]

Cheers,

Richard

