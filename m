Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3866C3DA4A
	for <webhook@archiver.kernel.org>; Mon,  5 Aug 2024 15:06:27 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.10225.1722870385036047580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 08:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PExSb3y3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42819654737so66385915e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 08:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722870383; x=1723475183; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8YSX+LA+jcGgx9bf+j6M1wQkOiTTzB9axeoVQg0NdM=;
        b=PExSb3y3+RTDdakj0DWMSk7125VfNBcQ4YsBVV/Cwlj/FClhsLcGfEez0Cr2oNB7Jb
         JqsC1NhSJ2ASwgkWlUV7naegcE8srN3FgrnMHyk82tyGGLadPWK9wCv03F72N64lHZ9j
         bjR1hTRoqIiztPcKmZIatTsGFuqdLgJllSDqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722870383; x=1723475183;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8YSX+LA+jcGgx9bf+j6M1wQkOiTTzB9axeoVQg0NdM=;
        b=UK4xcEe6lhyz/KBAv07t1l2sW/w2IWfUsVBQPwP5OEY1WCu5dGjalmwo7jAstcM0Lu
         Pa1i0x3rGhB131NpFWYvE211++kCcIxip6vgW61YnebMzylTc3zIZjVNWG8oggpVI+Gh
         3W6m9gIcAewSQ2oepC9vGvnrMtMLGC1XQcJMrpmo08RHR/ceDgps7wPHi5KxEdboEbBb
         VXfATbI2KDhaA4uJoJFPhMt8XiS5vAiJfrJPcJ0u313NrlU4nyIU0bQIgD69CeONZt+o
         tWgewPrT8/DscMm2KRcSfWe2DKxY1itjAr+0xn9LtP3soICylFaqXHw/12E3uVG9yf7K
         q6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4bYi7Ho42PduvqoE6Ebe59vE488lJrDf4ERvjUHjmNgoL29mhPzu6hRIc4dt7301DgOpJc4Z6DHLLVeVVUK/5p3BUEpOX8zkZX8/w0S93WyqlMNKqakIJ
X-Gm-Message-State: AOJu0YzLHDb2Y4+xysxkzCbD0aCizZBkh6fYnarNEM6ws/PTxS72oB7r
	BnEsF1iUdSuveKKmPdF0yA2xP8ITUwS5F1RSu77UXy5pLMs+idS97dhTRjH53gs=
X-Google-Smtp-Source: AGHT+IEv7OudahPWoDRZrtSKMbwIvNzZLDKNZLRSA1X99viVdwXPlPP9NYk1ZqGc6SrP8LjEWbVc1g==
X-Received: by 2002:a5d:6a4a:0:b0:368:5b2f:67b5 with SMTP id ffacd0b85a97d-36bbc0dcf54mr6860845f8f.20.1722870383052;
        Mon, 05 Aug 2024 08:06:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7? ([2001:8b0:aba:5f3c:e8f5:87f4:f4e7:7ee7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01ee30sm10092443f8f.50.2024.08.05.08.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:06:22 -0700 (PDT)
Message-ID: <2176204fcb13ff8f1f5ad68e8032ee8d130c4324.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.43 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 05 Aug 2024 16:06:22 +0100
In-Reply-To: <17E8CBC4C71D809B.2861@lists.openembedded.org>
References: <20240805044317.4104470-1-raj.khem@gmail.com>
	 <17E8CBC4C71D809B.2861@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Aug 2024 15:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202997

On Mon, 2024-08-05 at 10:41 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Sun, 2024-08-04 at 21:43 -0700, Khem Raj via
> lists.openembedded.org
> wrote:
> > Detailed changelog [1]
> >=20
> > [1]
> > https://sourceware.org/pipermail/binutils/2024-January/132213.html
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> pixman failure on beaglebone so far:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/8313/s=
teps/11/logs/stdio

There were further failures, all looking to be the same issue. I've
backported a patch from pixman upstream that fixes it locally. I'll re-
queue things for testing after maintenance.

Cheers,

Richard

