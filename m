Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50727C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.11313.1649773408958986898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cbmHqKaB;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id bg10so37703283ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 07:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLRiD9uUVa8E4NXJgGYUJ41BADxMz79H9Qqq5l6xi0M=;
        b=cbmHqKaBBzbN0kIGeAvfrlm+OoirHaytZpotrN6mSqkSszO0GFKxFfDwjcT5IsoJtv
         tmXo2+8AfhvDrnqKumOiCsGGm6CRaQ+CegSlNGbTTzCv1bP8n3kALXP1sXO9BbvtPNd/
         BVq7pWr1iYQq4gUsg5jhCZrka0Ire4V/Xp5IAVr5UdPZ6v9NNS1spnd79NFAnapMbboJ
         8qZuJhvs5mKt2+SW6udcl8bEMYbPHRfBYK+82kCwR6mnjXETbSIHAkxx57tgQs1GJLhw
         DbasL3nsKt0qNVAsPMcYSTUkps5MeefHirVZNgHrBdB4JJjHK6UVYDVxHDdL6ej/03mM
         kgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLRiD9uUVa8E4NXJgGYUJ41BADxMz79H9Qqq5l6xi0M=;
        b=mXw/KNDPZ21UAv2U7mIsDzEGPX+ejE+Xg56xfaZKVDClYiDKc7tQPz9K7pzTL2E3mB
         GkliHuVvg05Nj79f+iGBVUcE149BbF+qpB/b0gp219EP9Lkb7PLOnsxYSCeipyvscTb4
         MkAbIFZmnb2F8BpxfPuJMe3YgPB2+JDPSDnQtZhnV76ykdjqryJnyqvdla4+Ecj34S5L
         BMhL9ZBrkNty3dMQ0O2vmofjtmxr/lHi2rg47HYedyHSnc3/R7AJvM8QzeabF9beHryX
         ngK4+6mLRLz/EiZ1FFSGJusdwI04huuyTdiB/azo2VjOCpNKHgMwM4HBHQN5jQrkojfr
         Ve2Q==
X-Gm-Message-State: AOAM533QJj/tMU2DW8//FrSYLH2nKH8JhBRLX5AuDKojqD47lhuD+HNH
	HUIX0fsM3/GEJOGdmbTla5Y+QMsPE73GT2bL5nAnGw==
X-Google-Smtp-Source: 
 ABdhPJzyUNadYqENNwgk5gBInU9VKky3S1176yjddEa/shUTLtXhlOcDtYNH89dbZqW5/yAIo3ELr4Hwpp/cv1eTUWw=
X-Received: by 2002:a17:906:7304:b0:6da:9243:865 with SMTP id
 di4-20020a170906730400b006da92430865mr34883995ejc.665.1649773407226; Tue, 12
 Apr 2022 07:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220410120234.AE7F69627FC@nuc.router0800d9.com>
 <e6b5684ec20a4c5c0cca18a5c443c28dfe15c69d.camel@linuxfoundation.org>
In-Reply-To: 
 <e6b5684ec20a4c5c0cca18a5c443c28dfe15c69d.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 12 Apr 2022 04:23:15 -1000
Message-ID: 
 <CAOSpxdaP=67srs9_a2C_6o2ySZ8W9w4f8FXR1qdMkm3_0Z2oaQ@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 10 Apr
 2022 02:00:01 AM HST
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164275

On Tue, Apr 12, 2022 at 12:52 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I thought I'd update on a quick check through the status of the CVEs this is
> reporting for master/kirkstone.
>
> On Sun, 2022-04-10 at 02:02 -1000, Steve Sakoman wrote:
> > Branch: master
> >
> > Full list:  Found 12 unpatched CVEs
> > CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
>
> Steve is questioning the version restrictions on this, we don't think it applies
> to us.

After a little back and forth it appears that they will be updating
the CVE affected versions this week.  So this CVE should no longer be
an issue for master and dunfell.

Steve

> > CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
>
> No movement upstream, not a priority for qemu maintainers.
>
> > CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> > CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
>
> No movement upstream, not a priority for qemu maintainers.
>
> > CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
>
> I believe this is fixed in lua 5.4.4, have requested a version restriction on
> the CVE.
>
> > CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> > CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
>
> RH bugs are restricted, no public patches to fix, not much we can do.
>
> > CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
>
> Have sent a patch for this.
>
> > CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
>
> Already fixed by patches we apply, have sent an update for our metadata.
>
> > CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
>
> This issue isn't particularly relevant to us, sent an ignore for it.
>
> > CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *
>
> Have merged an upgrade for this containing the fix.
>
> > CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
>
> No patches for 1.17.X and upgrading to 1.18 not an option for kirkstone.
>
> Cheers,
>
> Richard
>
>
>

