Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD8EC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 16:17:26 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.8352.1665418639709178222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o5Fx9Rmo;
 spf=pass (domain: gmail.com, ip: 209.85.166.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id u2so5867180ilv.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DWngRlmqEkmnwQq33TINqe7KKLyuUB5fGisyhY8ZeTA=;
        b=o5Fx9RmoGq7OGOBESCE1ZItLoefsqLio7XnqzqUOzLgjnpiKleL/WvXN5BrmbY3yyx
         0XgVkMD3vwuXRPV+QNGnMQg4tK/3r/JIAYEn8k0M6Mbc4EKS39rmQxT6GVqxaYJoLQ9R
         TecBsdHMtO7s7FyCUjFjOQ76n5qqv/zA2Cu5IXZuDEjQyQZaFQ3JDdgEQcyU1dYSy9eY
         0PNNBDaJLmZ3621cd0cDzOy2ULRzR9UV8B95wSLFxBHT6pf6FYFehn4ugSmgZq2RlEo9
         T23ANh1owL7WQ459DZqlkqRQONgYDb7OOZpuUPBQBnVeDVqWKjwSOsHIrj+qSoENjJ/G
         /3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWngRlmqEkmnwQq33TINqe7KKLyuUB5fGisyhY8ZeTA=;
        b=Ha/8ujg7KJogKsDmN/f6Ev9yeB9d7U6h2DusLgJdUi/5SBJzljudnNcVqKrSndcGR+
         F8L+9VpUO6KYjv/LcutkTPZa0056m/KYOrNVkfG2H1gEkNnRBduFBxaagJPr0DsJ+5Q1
         BGYuZq24aZB99tD7BUBXYEcMCVL9AKx+3kPRPpKSop0hB2I8ekVcrb5MNPSDYqW3agwT
         gxV8DiCiuoJ7Fc7h6vAyD5+0lIX7olysEWfxDExv+OZB9yKQPIlPcAhRFUy7UcfKyrBy
         o1vy8MfPxb8cewHFUo+rviMhpS5RR9LFro1ixcMTBTlG5bCc5dJt7q2/wt8hwyFbwD8K
         BOkA==
X-Gm-Message-State: ACrzQf1Bl7O2qPk71K1wk1fBs58bbhC/A1aqz3oqRZM5Y240S1Vk02Nz
	j6vzBWvHOn3fkeNsnfKSQubJ1Oje6W9CrCuZRM5wFQKs
X-Google-Smtp-Source: 
 AMsMyM4KPMr8a69vZd05gOV4n9vH42t5UlfKztx3vKp6TvRoeJHrNCH68CYeA0jM1M+glz1dANWXgUIQHqNA+8D9dZo=
X-Received: by 2002:a05:6e02:1054:b0:2fa:a73:cfa1 with SMTP id
 p20-20020a056e02105400b002fa0a73cfa1mr9824799ilj.203.1665418638985; Mon, 10
 Oct 2022 09:17:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221009120238.87F82960832@nuc.router0800d9.com>
In-Reply-To: <20221009120238.87F82960832@nuc.router0800d9.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Oct 2022 18:17:07 +0200
Message-ID: 
 <CANNYZj9_xNTPNam-Dw1VyJsOWktk+z=FAgROAYz_hqsjLG=HMw@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 09 Oct
 2022 02:00:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 16:17:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171579

On Sun, 9 Oct 2022 at 14:02, Steve Sakoman <steve@sakoman.com> wrote:
> New this week: 1 CVEs
> CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

This can be addressed through a regular version update.

Alex

