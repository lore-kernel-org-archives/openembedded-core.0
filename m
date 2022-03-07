Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396AAC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:29:13 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.25445.1646652552095809526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=gnMvKIiK;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id r10so22729061wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BP9bG50pELXqMW3zBDIeAFnwPTmqeWPfN5lJ83j2Eww=;
        b=gnMvKIiK31cPG6FzGPIydWmpqqjXSRhLrDms2BQbn5ZmyUOK4jTxEUMzFpCTHpwPPQ
         PFNkZ/wc/a+UlRicLPMwSZojT/g4aHXZc0VR+VMDXAtcZVGDlLr6qmAG0DqltacIdY38
         ttfDFJ0mEYafD0fsGmH4qThYoQNe/SZNcwLw0MSg7KJbHUXWtvAANBucg3KGDpOQ/MRU
         CECOXeLD+9QbU+630/wgIr1jfBtL0FeGKp+InteIWmreUJIOLfpj3YGDBGntqu+J0DTC
         Tg3KVOBxQLRXrLcZS9g4oNak/refjcrX+NSUAA2FHyB5d0Y+l7otTsaLzEMCeJ0zV1l4
         LyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BP9bG50pELXqMW3zBDIeAFnwPTmqeWPfN5lJ83j2Eww=;
        b=w5wRyFKoGaYZIpQhttauXsc8I2vHrt3/JqdJnxBTXj/oOMSio+ityEVUpXKOv7jzaa
         oAdut3PwGSBmr1cm6OGg3nubMV3HBK9fZThzmBeY2gthavqNSihUxzEGoGWnx3pwhkCP
         /rkwZzNR7d4ntpj6PwwlImt2oPepi8qE+iCov6lWerSWBi5WuGijwVvanMaC8G+D+U6O
         mikFpVcoohLWlaRNrprw9IFqabudzukMPYPGI48MaLHCYi558Bn89qd8L+XuEp4MobB1
         gBOBpQ7EpXHlLWzz+zR1yuocddB/8spIzOBg5NuiA779mYzThWV+dA5aH1fQJpFNFZRW
         gTjg==
X-Gm-Message-State: AOAM532Zx+2I4CJg94QW5uxDMCHOBQ2Mlu2Fte0pijuu2kGE/5naL9Vf
	pwuXvgpLUcdfhJM1HsxO+HEJat1Fk7EgLeujM1IZ2w==
X-Google-Smtp-Source: 
 ABdhPJyOB2NtIwYiwyhHEnlM/QHmPoGuUp7CDg7orcPS4ZldiZepcsXLtg8nqVANAlRK7GthBTdQ56kXZAPQZOkA8WU=
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr7836226wrd.451.1646652550622; Mon, 07
 Mar 2022 03:29:10 -0800 (PST)
MIME-Version: 1.0
References: <20220306140349.1F9EB961F2E@nuc.router0800d9.com>
In-Reply-To: <20220306140349.1F9EB961F2E@nuc.router0800d9.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 7 Mar 2022 11:28:59 +0000
Message-ID: 
 <CAAnfSTs9MLjLxV7j95Q2WXSKhFzFvjqnPsAxiqTe9Y9BvHTH0g@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 06 Mar
 2022 04:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 11:29:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162810

On Sun, 6 Mar 2022 at 14:03, Steve Sakoman <steve@sakoman.com> wrote:
> CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
> CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
> CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
> CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
> CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
> CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
> CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *

All of these are the same bug, fixed some time ago. I've told NIST the
correct CPE information so they'll disappear on the next run.

Ross

