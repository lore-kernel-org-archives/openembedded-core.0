Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.9334.1610460555448660914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 06:09:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=R1x5w3po;
 spf=pass (domain: burtonini.com, ip: 209.85.167.53, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f53.google.com with SMTP id m12so3532957lfo.7
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 06:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3VBvO00zFOOt4n/oNsSDcmeE/aPh5vkmmSeOaQbmenY=;
        b=R1x5w3po069D0zbU11Sy86vmAOibtkkWQT3c6JYGHhBySO2vVJXlk344v+sPmBztnq
         M7V/rIP+3aDPqiQWnqWsssMiYFgV3UTH4BVSNAoonZ+gDenAi8PKKWZerRz9bNgQ0vXG
         1FfovvOz9VER/MWuCABrmi2nULry/Eq7dwzR5U9sAxcuVfGUIYM4lF6CvWJpTF7StGWP
         6As9ejCKhJJ0gEBP6/BOjXZofEqgkAaLXSpd8017QqlRPQa6KD89JjAIrqPhTrMPlH4K
         lKJ1FX/TWPGFGkaQSZKAQpXPl2kjq0jz1JvHA27H2NhcJxZYyb8D/0XVCqMDiK3dy5bP
         P30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3VBvO00zFOOt4n/oNsSDcmeE/aPh5vkmmSeOaQbmenY=;
        b=E43MfozoI+74c4GYz9cp+0Y58l/mwVuE3zc9ax1ZD4tyGViTPfj0GRlBsmpx7IzTs+
         kcdVSvYbksXRd4NEzHYlVHpljxR9ovpRWBBR7As9/XQVpZoYZjMgxsVEI5CHugMIa1sM
         b+t4Bu+6TsCuW/x/H7a/z8mKPfXXoLf+sg3leD6eGjTgxzWiuW4ibI9pLgpYlMlUn3j2
         AnSn8lLAkOJPFC8XqKJDiqv3S1oTY5XWeFYGyEnpaNCAKovu3KsLaQg9CWCp41hDAMbo
         JgsStECU1UiRZaI0R7l/ICJbFTcmqyd46fKTFPm2/Uc5FPi76lDlO2EpB0x81BYvK6KV
         /6BA==
X-Gm-Message-State: AOAM531fUu6lUVeOUnXKRb63ZaWHm94i6HBrHqOr4cRbGUPI41vV4ehN
	zNT8VC4TgjgV/zwexsVDpyS1YG+xOXpYFNOdKZxjcA==
X-Google-Smtp-Source: ABdhPJzMCKm2c+qE49SfrZloL/FQKga6u1HfqlHqKC9AMFYLqg5mzRchQgzWhfEKB6kXVsPv4WYXKareeMDkJze5tas=
X-Received: by 2002:a05:6512:20c1:: with SMTP id u1mr2277419lfr.549.1610460553565;
 Tue, 12 Jan 2021 06:09:13 -0800 (PST)
MIME-Version: 1.0
References: <20201216221622.14171-1-okaya@kernel.org>
In-Reply-To: <20201216221622.14171-1-okaya@kernel.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 12 Jan 2021 14:09:02 +0000
Message-ID: <CAAnfSTubexeYPZeexc5xTnx2sz3BiYUj4un=FmtaucDwPNOZXg@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v5] procps: split ps and sysctl into individual packages
To: Sinan Kaya <okaya@kernel.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Dec 2020 at 22:16, Sinan Kaya <okaya@kernel.org> wrote:
> Move the ps and sysctl tools into its own package. Useful for
> size constrained systems that only want the ps and/or sysctl tools.

Both of these are part of busybox.  If you're in massively size
constrained systems, why not just use busybox?

Ross
