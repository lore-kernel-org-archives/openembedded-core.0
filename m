Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC5AD6554C
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 10:47:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11527.1765968418622276037
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 02:46:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KP2yu78K;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8ba0d6c68a8so610586685a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765968417; x=1766573217; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OE0mMs+nfSL6Ca5BkIKLavoz4vNP9lQpbcyPbUFovxo=;
        b=KP2yu78KJXxJ2/YVw5EsY0w5F3S6RuqMI7WfSUqceZxLe5i8OGHSBcmJA3H644WpUA
         rci2vpXSdcXVGqez+3xj3LRVMirJUrixaS+Cra89Do1jU01ihCCsF4TGz2RYXyjCwhzc
         ZCOZ4JHqJs7z9zORslDL+wxxYoPBI63iHEWVDQK/gAIE5j+mkbx1Z+NHEXfzsFA3XxFo
         jTWi4x1vODwCVIuONqsk5uAxeRklBfU5mOepIAtVeKb+wTtaEjyEQ94C1qNiDXMTbIqj
         /BtvTaqd/UjDKnpm2Un9Itor4c0MS/0+Gm7vFkE4CtWeL65hyb2GMgBY+lQkdHXop/CW
         Dctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765968417; x=1766573217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE0mMs+nfSL6Ca5BkIKLavoz4vNP9lQpbcyPbUFovxo=;
        b=YabcmTgtq1BXKn1nxacdJTiH129UbTE1IlCEmAnkyaTSW7eHE3ZnhEUfEncrSgZGrz
         87hi62g4nofY7XY4TZo0aPwslIxzY1pdJTnlWsxnUzGLSDrepXLubL7HG+IcVIhyakZ9
         F5uwALVFZGxyQ/Sfli0z9hcR0KMgZpUaUDS0+NRXc4NbiKWpEYw88yyZnQaIAAfPjb09
         VHBMGeW7QWw9ze5s7HfLjYu2GIypoPyAqLm9IMTTxxg7zU0SMPsKESm6fLYsaR4/uaO2
         UcXc4/8hZgXWB+d/OOGSqSoiLhBjfB97Fr4CEf9XPNeuTgDvTXZYbCP9rL3sKR3ZKapm
         uf7g==
X-Gm-Message-State: AOJu0Yw83RMAqmSB4zoz3ZE91F9SoQ+Wvw4Pd4h8TmZZ59FQisYpPS3w
	FXXYu1FsKJOHZliuhR25py9IlrdG2m/094JrHFdgHMNCg/OU/MHZNCaTyOEB15Kaf4Xo9gsJVgo
	3dYNbqCxO21Ub/5r9abx/P5AqgDJ0xvp5EA==
X-Gm-Gg: AY/fxX7Lywd7waME6clvL271F1/o6KkXvdsN0WhoGTl3gSrwYyXZtfA0bldUwZHXewM
	br8UOPSVYE6Yl0O+PUYx9Ah8fkOBwHF3Aa5/jnf/M5Kc9a+wXL6T707Zkt83dJFUFK2m7JxP0dZ
	ZktEso85PgLeUASjLwu0uHkuu2b3eAv+nHzZHN+oqMOA20Lwt8evdTeolOKpkJ25vq+mdx6zuJR
	/tUwZsO7/PjH8kGAOat+m55VwSIQuWRwkAyRQ23Jf4ZCCM6tsl4PURQvj/eGon7DteO0wbo9S2a
	uK6FnSys9aTmlKavWvkzFWsMHBFM2Q==
X-Google-Smtp-Source: AGHT+IGWSYM6xiU7vFyhwSOO+awF0ptFWCaLaQDi7wlIVztR6jyEEfnnJJmRQ9TRU2t1TBXXE9jJU2/L24RavCml4J0=
X-Received: by 2002:a05:620a:172c:b0:893:b99:711a with SMTP id
 af79cd13be357-8bb39faf5dfmr2606108985a.19.1765968417567; Wed, 17 Dec 2025
 02:46:57 -0800 (PST)
MIME-Version: 1.0
References: <20251217072654.326736-1-hongxu.jia@windriver.com> <20251217072654.326736-2-hongxu.jia@windriver.com>
In-Reply-To: <20251217072654.326736-2-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Dec 2025 11:46:46 +0100
X-Gm-Features: AQt7F2o9ih_owu1IwwOjTu1CvnsaZAGUZuXyzW38wFYQzOytHnZr6hWvKo9PZbU
Message-ID: <CANNYZj9KkDgBPB1AoJxk0F3nfZ+Mv6h48d9ssuFrFXxzJ5eGbA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] webkitgtk: workaround compile failure for
 large debug symbols
To: hongxu.jia@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 10:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228023

On Wed, 17 Dec 2025 at 08:27, hongxu via lists.openembedded.org
<hongxu.jia=windriver.com@lists.openembedded.org> wrote:
> +# Pass -g1 to massively reduce the size of the
> +# debug symbols (4.3GB to 700M at time of writing)
> +# workaround error:
> +# qemux86-64: "relocation truncated to fit: R_X86_64_32 against `.debug_info'"
> +# qemuarm64: "relocation truncated to fit: R_AARCH64_ABS32 against `.debug_info'"
> +DEBUG_LEVELFLAG = "-g1"

If this is set unconditionally in the recipe, it should be removed
from yocto-space-optimize.inc at the same time.

Alex

