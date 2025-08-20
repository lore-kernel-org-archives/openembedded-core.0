Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE313CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 07:14:28 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.14287.1755674064886690872
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 00:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l1WFDgkT;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70a88db0bd8so53066796d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 00:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755674064; x=1756278864; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I581cgvXQWdb0TN2/pEmWnpq1hKjR4c6QzDaOG2jl8U=;
        b=l1WFDgkTmxN9ggAjNOoeJRI9nlTmw3YkdYARo1FRZcY6c1tu/bTcBSQy5qg0QEnS8H
         vlh6tj2eL0kymS4Kmb2Ghh1kiIQ/sesfyc/iEbt1L8ibebjgK26QFGkqy53cjeC54MN6
         Im4BelcEa5YFMur18YRa9iqxCU4TbWbeSyYZM2o4R5fK+u5uDJ6BXvvTEDHWBhHbFMeb
         QPDauDnEke0zsqKryZGHY5BDxUs8IjNbIhYD3sxtUbMMYNBFhzd9BeW4+g3TdyLVHIEk
         TJOpqZG/7C9G7c//IfVbJyuuAHEmhsDiM2IvB5tfZw+BYv7w+s7qorXa1LJcrOZTZ647
         ex9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755674064; x=1756278864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I581cgvXQWdb0TN2/pEmWnpq1hKjR4c6QzDaOG2jl8U=;
        b=BKi5t5LOqC9Av8zMCQkUlviVnpSXgCblCQo7YExWU9ouCnwlBDwCWmyDhVEAr44Jdx
         ALREWxOl0wmFdrJwPALfcBNEDeZDanYBaZruGgtawDf8Xs3xJ3zCQQMbUBV1G6C2YRX+
         gJyyj2BC+S0OPNzEVWi7xw8ak3aCS8QunPdmNJldaItZG15vwWt1+8A4kRosjM6TQLim
         +YCeOuAPeiv+rodKJGt6VCcjww9w9DXtlppCBZkS5sYjs2PMDgf+nmfF9txypKbB885R
         XUK7TNRT8Y6Egwf7qKNNv50L5kTNsywTr7Gr26fVGFwnm7jwPh777lq5ZQQ/y4P9WhI/
         AoyA==
X-Gm-Message-State: AOJu0YxdSztql9z6Tff+oAjjf/YAb8mF1vHkNWvTZzajDOw3MIJgO+Xe
	BPCn3eeAJ0CxNkEBWEw3mzG2OObeaCviXlwheMI5S8+voxf3swn92ePbU9wqa+gZCAdbSuDWG1Z
	HFbj3vfr45QUdpCHZrHXUfQFemCn+hsQ=
X-Gm-Gg: ASbGncsazGioac2tKKc4mGLbFw9VapNDOtPPLs2J16Gqi2gRyKkZp+WruwKhiVY/1xi
	F1wLBiMkarS2+P8eD3UobGjq3ePf5uyMqyyHEy5LMk4gtku0mLlMPHnLjImuFSnEjaZzpPB3Hnh
	whDU84UBZqldueqt2G3GVcPgg1mjJhvu6HI0+T3YNzN5hp8GmIwQ3IBEK6lKRKIBqL+gnzb6scK
	4T/6xtSHcm4tgYKTFsuj70cGew+NAShGRsy470QvewGhDnFsMcJ
X-Google-Smtp-Source: AGHT+IGkTf8D5TCacVTnc7Du30bXyfiWI7Q72NF2hNd0VHunvRHK7PdZAuOsuBSYTtyJI/2SuUMHi+y5D6KSeMqpdAA=
X-Received: by 2002:a05:6214:1cc8:b0:709:f5a9:d053 with SMTP id
 6a1803df08f44-70d76fd242dmr17473636d6.18.1755674063849; Wed, 20 Aug 2025
 00:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250819221357.997067-1-a-christidis@ti.com>
In-Reply-To: <20250819221357.997067-1-a-christidis@ti.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Aug 2025 09:14:12 +0200
X-Gm-Features: Ac12FXxtFOb4YOgSuOV_AglLYjv4wt5ITLZSCofLDO7ymgUEjmyfw_6nzNNQ4uk
Message-ID: <CANNYZj91HOj3joAHdT0Z_JSxxgMmCeXaLb7NOJXsHqAqVZ+eVg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] libsdl2: Add PACKAGECONFIG option for tests
To: a-christidis@ti.com
Cc: openembedded-core@lists.openembedded.org, 
	richard.purdie@linuxfoundation.org, rs@ti.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 07:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222157

On Wed, 20 Aug 2025 at 00:14, Antonios Christidis via
lists.openembedded.org <a-christidis=ti.com@lists.openembedded.org>
wrote:
> +do_install:append() {
> +       if ${@bb.utils.contains('PACKAGECONFIG', 'tests', 'true', 'false', d)}; then
> +               install -d ${D}${bindir}/sdl2_tests
> +               cp -r ${B}/test/* ${D}${bindir}/sdl2_tests
> +
> +               # Delete any leftover cmake files within the sdl2_tests dir
> +               find ${D}${bindir}/sdl2_tests -type f -name "*.cmake" -delete
> +       fi
> +}

The PACKAGECONFIG is okay, but this isn't. If you want to install the
tests, you should also add run-ptest script, ptest package, and ensure
they pass. Ideally, you should also make a patch to sdl that does the
installation and offer that to upstream, rather than do it in a custom
do_install snippet.

Alex

