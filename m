Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA36C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:32:46 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.26722.1646663565764895801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kh6rf+bu;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id m21so14689738edc.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FX+ynw7C5n6kwdOGZzlYkPYvHkdTKqM3e/oKBF0I6yM=;
        b=kh6rf+bu+qwNXdGhZgWCd7eUNJTU7h7OjNnPhp8Kc+NbnAflZe172+s4hAVNuiqZhC
         tH92FSFpxwgMU5X2255t29/JwQXs/mGmwIVnrG1CSdl4Bs1WlZ8DH+c+Od4tAcigACzQ
         6GxUmFAHnsKALxAo6StP1fvDxZ4LKwmzZsNU5ZUfQxlbyEvjc9tJ4tEYxhj4anxX2Jm+
         HYAbL3PwDCN9nozTsYqEs8s+kCVr0vU/Ojox8b/ct9rQ2UfUXb9G2aFlIL607/bRv1fv
         PdJJtHoI4FfqJMrN+bxJe65F0n6PU9Nxj8/uqN9IZXI05pJf23byHa7AcdI+6xFVsClq
         dxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FX+ynw7C5n6kwdOGZzlYkPYvHkdTKqM3e/oKBF0I6yM=;
        b=zlJ3oPFcnxK8eFRmlqZw7nI9MkatJ2+BuPPAJSDlL0jTOyaJBW0mziMITlwOuVIl+3
         G/FwVA9i3fNBqv9LvMRIhwrHsZ4mmnlVB5kUGJjROB7AbX1neBMyIl2kgv87Jv6DC0XP
         KLIGu9/D3TCeWVIVpUMlIjgbB7MzaDi9VVgeADvZn2WZEy4CA8mzgBJXSMDJqLpQcUSJ
         IsW/XsGU1ypD3/wUmFCFqIkNG27mFg9FxcL7GSn1KhNdKxUEeXpo5cqtVW3BWqfv5nxZ
         Pa3+S1Qs7OPpEVIuo4AIy9k4vNzUF8DEiAYtmAWjbE3s8lSbg9gGPvoCNkjUyjeaWZ6s
         t1Ww==
X-Gm-Message-State: AOAM532mgje63k6URmO94YGH/lCq4EtjoV/2fikrAQr6FNagG2bO8R7N
	aAsmowCpC2VGHe2s5l7va5N/YOZ+IQ2VlgMKB+P33w==
X-Google-Smtp-Source: 
 ABdhPJyAP4ZSZR1CHeW8to3MUFtJIDj7QSDh+NaGEhGVInf6qZV6rrYpRtlyg7xHcJT6qw/yfDLJd6JG9SmOME073sk=
X-Received: by 2002:aa7:cb09:0:b0:413:2be4:c9fa with SMTP id
 s9-20020aa7cb09000000b004132be4c9famr11473529edt.106.1646663564015; Mon, 07
 Mar 2022 06:32:44 -0800 (PST)
MIME-Version: 1.0
References: <20220306140349.1F9EB961F2E@nuc.router0800d9.com>
 <CAAnfSTs9MLjLxV7j95Q2WXSKhFzFvjqnPsAxiqTe9Y9BvHTH0g@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTs9MLjLxV7j95Q2WXSKhFzFvjqnPsAxiqTe9Y9BvHTH0g@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 7 Mar 2022 04:32:31 -1000
Message-ID: 
 <CAOSpxdYBMo3h8axropEcjAbd5jE-Cb==h-THsvYQzx48gNJC-g@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 06 Mar
 2022 04:00:01 AM HST
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:32:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162847

On Mon, Mar 7, 2022 at 1:29 AM Ross Burton <ross@burtonini.com> wrote:
>
> On Sun, 6 Mar 2022 at 14:03, Steve Sakoman <steve@sakoman.com> wrote:
> > CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
> > CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
> > CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
> > CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
> > CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
> > CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
> > CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
>
> All of these are the same bug, fixed some time ago. I've told NIST the
> correct CPE information so they'll disappear on the next run.

Thanks Ross!

Steve

