Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9838C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 13:50:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.54828.1699278631065931759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 05:50:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C7Wg6B+Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4083f613272so39449195e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699278629; x=1699883429; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aM+X1bUQ5aC+RzARRVTh4G4/nb9SnMT4xT13HrBrQgQ=;
        b=C7Wg6B+QK5UzeQuId/oXa5vUiy+WiFIyAchh1/k1luObJozfapsu89gU6WhKF8XB0x
         wfdwzpCT7GYqluY8ITPaPlJot+I/EF2sOYj8/+WplRO09zHvKmEoHQ4ATSipPPaz9wif
         Imh/zmjF4JJvBp64X7Xdje/lL7JPa95FOfqOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699278629; x=1699883429;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aM+X1bUQ5aC+RzARRVTh4G4/nb9SnMT4xT13HrBrQgQ=;
        b=Lx4ONV6Ow+QQIiW4ZR5AVN4++o/WIiQ4VAqLFszn/idE/wQKvJ3d0+bezBrDkGuZx+
         8EQ1n/2uGbh1jDLtsmWyBy+SfSD2YO0HLa9EBUHqbL0hyNXVH4H0BjIhaU2Cc6dEt57q
         TecUIK0rVX6KSPtzM3dZHBKDqsbezd8Bgw7Y4anpY/YoawsxRCXhopPV0rQ/r2iwlayX
         7duhsBlKwUPm8f5KrXit4kjVNGmWgrZYMiUxGRSN7D5D6bxDRdoQxW9gGbzHxv0p76Gf
         qdXsz/mrR3SK+LNlwTxuxBNrMQIW5hXGaHcNvQuhwOCQzFpcZddSAxbMtC4N8tnSJlt2
         JTUQ==
X-Gm-Message-State: AOJu0Ywt/TAkcZw9duxdcrlfhMixsozmOd1fKebkiIv1wm68kdn2eysk
	EuXxL8/K7IC+In31JhPDQ+dLww==
X-Google-Smtp-Source: AGHT+IF0znU/FbPU0WrKhGe0wPTGL0wpBAfNwMvIuJDsDES6L6rUuBP85DPirYGQEabWeC5dZkjnFA==
X-Received: by 2002:a05:600c:20c:b0:409:4823:57d7 with SMTP id 12-20020a05600c020c00b00409482357d7mr16157035wmi.14.1699278629405;
        Mon, 06 Nov 2023 05:50:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c4f8300b004064288597bsm12390171wmq.30.2023.11.06.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 05:50:29 -0800 (PST)
Message-ID: <41e4a23f7b8fcbc1da06d9414646aed6d9a33f1a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v8 3/8] image-combined-dbg: make this the
 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Mon, 06 Nov 2023 13:50:28 +0000
In-Reply-To: <20231101110129.647878-4-adrian.freihofer@siemens.com>
References: <20231101110129.647878-1-adrian.freihofer@siemens.com>
	 <20231101110129.647878-4-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 13:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190217

On Wed, 2023-11-01 at 12:01 +0100, Adrian Freihofer wrote:
> Remove the image-combined-dbg.bbclass and make this the default
> behavior for the rootfs-dbg. A rootfs-dbg with only debug symbols but
> no executable binaries also causes problems with gdb, which is
> probably the most common use case for the roofs-dbg. This change
> simplifies and improves the user experience for a slightly larger
> rootfs-dbg.
>=20
> If the rootfs-dbg contains a complete copy of the rootfs, it is also
> usable for booting the target device over the network. This in turn
> simplifies other use cases with e.g. the use of perf on a device
> booted over the network.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

I'm being pressured for review on this so I'll just say what the
problem is. I struggle to review this as off the top of my head, I
can't remember the difference between "rootfs-dbg" or "image-combined-
dbg". I understand the patch gets rid of one and the argument appears
to be that gdb doesn't work well with the case that is removed.

What isn't here is any reminder of what the differences are, or a
pointer to the history which lead us to have two different modes in the
first place. We presumably had a reason for adding it.

That means in order to review it, I'd have to dig into the history and
work out the differences, then work out why we added the two modes and
then determine if they're still needed.

What would help speed up review would be a pointer to the original
commits and/or a summary of why the were added. A summary of the
differences between the two modes would also help/

Cheers,

Richard

