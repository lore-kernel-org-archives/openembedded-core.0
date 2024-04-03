Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDA8CD128A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 16:01:18 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.15307.1712160072102112004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 09:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KpmrvYAw;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d6fc3adaacso93048681fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 09:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712160070; x=1712764870; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pFmHbTTBDwYDtk6godCzNIBi0rh1ZybUmnoPXOBqBNA=;
        b=KpmrvYAwDReJaSoW4+SpnWel/jizA2y0jGn/wqvUNaAXH+mmzHXybFECNQQdXQAQnX
         XkXgGsNo/wNP2fPL7FK3GYoZcKIjwNMVsgJpswjNAY8l6iL4/D47vsSJO9Rnn9CvjiYX
         3VLUVlnv5j6+YR4dMmUEC5YJATGJmLrxLFX7uSf0PsyMWrSbVDwGoCjpSqFSK8rThv+N
         JaRU1jtivBH915h69cVoBVf2kmHkFKnuO1HgRLHHem58r0nJMrYTVBMy1mHjIaZNIl63
         KeNnkD/JanjF1CruxbX850yWvflHa9WeexKw3uBZvsxztyGV7G/ZsDmSssbYAFisoG9O
         ZsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712160070; x=1712764870;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFmHbTTBDwYDtk6godCzNIBi0rh1ZybUmnoPXOBqBNA=;
        b=Htsx6xvInXsZKWtY5+DDy/FlHzfrXZv9PGI5NyFfDRC9eMxremr86IuvltCAmT1Myy
         2xqnmMcIx/GjQuKgSTsl0dK6ur2/lGeyrXxPItkYhxkhd7Lk24JCtF5OrEwGAxasGF0x
         I2R6dxTaEhdY7xzgYiv4SAsChvMUNfkf51cnHTGOSiVY0dBDhBtlsLvwuGdnh9IA+BA5
         4f+8DovepXn0o40braQrnA22FCMzrIe9c25Q2PzCrNkhkvnttbIG3FqaqMhWyg5q2lvj
         epo3u/m6ZVrbGWLoUUmAnHfOZv+VaP2qJ71bNxi40UZUdoTYc9uyUJs9qzwLsytWNJ75
         78zA==
X-Gm-Message-State: AOJu0YxUSelj1sZ07DDGmKhBRunXDAS4BAAAQvtYCf7RTokmSbrfBGwg
	gH2CZAw9NWNeKGCswKrRbCSDWKjDthDRuf0sMj4CI+X4WDCkGnunSm9IQseJyYpU0JNCI0NSr5D
	P0eZ/mRnnGvih694HzkmGaUQ+cEw4DHT7IGM=
X-Google-Smtp-Source: AGHT+IEi81GHwXeiH1jVOun9JICCA1lPKiC5PpsQMBhJKeo2/OG1eURjws0VDpa/w1fs3N49G0DWxSDYVKZgEGRwFJU=
X-Received: by 2002:a2e:be28:0:b0:2d8:330b:2cf1 with SMTP id
 z40-20020a2ebe28000000b002d8330b2cf1mr42521ljq.0.1712160069923; Wed, 03 Apr
 2024 09:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240403152727.2247873-1-jdmason@kudzu.us> <20240403152727.2247873-2-jdmason@kudzu.us>
In-Reply-To: <20240403152727.2247873-2-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 Apr 2024 18:01:01 +0200
Message-ID: <CANNYZj-+BiPg5QrR01Ut6cshG9uwo_TfeU7U3vwUpyMHDXZX9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] acpica: use github for SRC_URI
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 16:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197931

On Wed, 3 Apr 2024 at 17:27, Jon Mason <jdmason@kudzu.us> wrote:
> -UPSTREAM_CHECK_URI = "https://www.intel.com/content/www/us/en/download/776303/acpi-component-architecture-downloads-unix-format-source-code-and-build-environment-with-an-intel-license.html"
> -UPSTREAM_VERSION_UNKNOWN = "1"
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases/"
> +UPSTREAM_CHECK_REGEX = "releases/tag/G?(?P<pver>\d+(\.\d+)+)"

It is not necessary to add these lines. By default git upstream check
will get all the tags with git itself, then sort them and pick what
came on top, subject to UPSTREAM_CHECK_GITTAGREGEX if that is set.

Alex

