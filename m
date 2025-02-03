Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7595C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:11:08 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.85519.1738581063308238441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bfbmxHDk;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d92cd1e811so45203196d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738581062; x=1739185862; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sMYcYTqSpfpWJW0hNF27I4xHq9ilRHZX1P6BgP4lgxY=;
        b=bfbmxHDktzil101WcENzrtC2RomtqJYSAq6FS4Kd63p4ME3aEUCBLQ2GCNzDO0+ggS
         bxSU/6xJm2Y3Dr3ZWT/vKmr4seEaHyzn5dW3Jh0ybPj5tvSOHRJqFpmf5BTAC+Oouzdm
         S6UaXW+zr9C10rTHxhDc895bs6pJf+3Oq3YhBAK98VFqQklrnExad29MNz/6xVinZ19d
         eLbC9pm/3uIkCyY8v5LA3MEF0jKh08Fn9pl1BkOSJMMvxIWUvgkpk9sG9tPXPVoW1xZ7
         FyqsjLhKS3hcVfSzXZmiV3v0Mvmha+Zl3Jul/8rJIPcAJkVQS5nFKCsLOsFLDNTBfnbE
         OH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581062; x=1739185862;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMYcYTqSpfpWJW0hNF27I4xHq9ilRHZX1P6BgP4lgxY=;
        b=MGBZgbeaI8VWS+yjlzZ23LO171Hr4AZILv8w2q9/yIewLhm1PL/Dd6ZuK4fcfjtgjN
         87ifX0EGAllphpdSE5fHGCx1AKFX04fcKlfmgNLfznSuLdsyrX9oP5RmcLaW7/K7kwXR
         HuJmggVzFjbBeQmpkL3qw1pnbwbhz2pUSs1U6Jpv+/OciZZ1Nq1MjrqRl59fOGgll4IH
         7cEg3a/RZi0Noqndjl3xPvyjou4SzpZKhAW0hUn0/GyGOguesE7fkreys6QXhi4u0U2H
         zB2OCSVo+gLTj5GKSmNvvoj7KdNnQcX8u/wAwkZilQuYS3FfI6ceb60mv5ic3J7jU0Xx
         BGDg==
X-Forwarded-Encrypted: i=1; AJvYcCUeI+Xz8S7EXVoDlu3dnGNOkkd+c6A0FtMri8So9AAFuEQm1lmmIw2zKkzLsfckariAtxiSZMZafHzoeTG92ZIXcQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxnyPvGE+S99khOHMTV0S7bXZBFSJ/oBGTqT7RdxNtCQWI1jXk5
	3xZLUEUZlz997OIym15TE9WUkDwS4wcGhaI8IgGhZA8j9I77due8ll0EjbG4lTHNCl66nhXba3E
	5EltD6jHoWHZWpjONE2b907QIN/8=
X-Gm-Gg: ASbGnctA5YnBEi/2ooEL5zwT0Ho8AMPmLcZNtcUuUW+ipfh1K3ArTEReB3nSFP2R8MO
	0sGu+G9Ab89bTC6kSgegW8FIlydc7Nu2QOzzvRV2t/wvwp6N8Bsj621tikVCtwgTLXVDEAEo8ti
	7OZQFUTLmGFjYALPYpGDzhT7o8b0d9qOM=
X-Google-Smtp-Source: AGHT+IGTp1e+JUmxlAiUmTaxYWUX0n3CegRrJZb5Zr9ZtLhVac2J81RBJmTZF9kMkLSu4QPOcZ7RSy7tLC9OIC+YtPk=
X-Received: by 2002:a05:6214:ccb:b0:6d8:a258:68bc with SMTP id
 6a1803df08f44-6e251b5d6f2mr228055636d6.11.1738581062294; Mon, 03 Feb 2025
 03:11:02 -0800 (PST)
MIME-Version: 1.0
References: <20250130165359.137315-1-raj.khem@gmail.com> <fda5a12dbb22da458d6b0dbea2903f08442c70fa.camel@linuxfoundation.org>
In-Reply-To: <fda5a12dbb22da458d6b0dbea2903f08442c70fa.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Feb 2025 12:10:51 +0100
X-Gm-Features: AWEUYZkVWQGoTaQ8GdAJJFC1ff0GCA7otPnQGQOMHmQHzKfIS5ZRgRenSOKU4nY
Message-ID: <CANNYZj-fRsCoQFLFnvH9+cwvFPw8zWDvHM4eCv=3WoumAxdcxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.41 release
To: richard.purdie@linuxfoundation.org
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210639

On Fri, 31 Jan 2025 at 23:37, Richard Purdie via
lists.openembedded.org
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> Thanks Khem, this passed in testing, the only issue was valgrind ptests
> failing:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/851/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/853/steps/12/logs/stdio
>
> Copying Randy...

Let me bite: it's time we drop valgrind ptest. It's just a non stop
headache to support and I haven't once seen it provide actual value.

Alex

