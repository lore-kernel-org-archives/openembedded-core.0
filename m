Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F484C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:22:30 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.20992.1647800549318236198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oY1eXzZh;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id a8so25983302ejc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xaOAC5b+lSWUYXhCZKGkYVgpXR+coHPOAQit2LHXyQ4=;
        b=oY1eXzZhHABqX72F9ODEZbMd3UWYaUIJ9TPbV8ZrA85Yv9rwFj4IwYp1feVSHeTOLw
         aopfnOOrRlAnzPru57DE1i/JSVu97JD46J+2InVGtXD/pfO3QDuWtCTUPfqAIfXC2SYB
         Ij4hBOJklIL1x5YE2Xy5qpu5o2DekJnWu0ByJSlgjORlcj8unKCsT6wfP7zKIC97oWGg
         IiWzBKMXoMJ85F1LuAZ3HeEApfMxy8e72PZFhBxNFsC2RpA4u8b0qZMmNm8lHkL2WUgU
         I6Qvw+mQcUl8HDjfTpYLIzs48hblhHhL3ZICqCkeejpkFCxiC8N1+XpwMRQ5fzglJe+4
         P/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xaOAC5b+lSWUYXhCZKGkYVgpXR+coHPOAQit2LHXyQ4=;
        b=An+IKsAI1uJbXah0Z14mESEJiZ40GvgKXqzQCQsg7W6O1nk1iZ7CQraATOdkvXKB77
         Bqw0EnTP1FZVC0WskIisH6Zw0CxI0uE5zosY7CsRlQkzc84XblH7EwdexJsmQ4zAtjNr
         BlEmp3TXswlx6e8nrTf/VrWQn/To3MOzm3hK442KeG0j9ZeRyKEhGTZsH3OWr4VkUlUv
         d8yB5A+jPo8MONbuKSHDbL3JGIpAh+Ne5LdHJWht9iT+QsuYBXn8fRP9OFA6fDMm4+2s
         L08UKjQtqkBPSTwY4Jrtf10t240O6f0Xw2c5QSkcgaNN+jGXf6+PzGaO0IuEAcrOEFoy
         bSOA==
X-Gm-Message-State: AOAM530ytrIDK7qcBHnj3DWDDHUziqjgOytohlxb3ordHc0dbFPW3XY8
	LUhftswjg8HiUSNu1CdDvIVGrGJzzs/Z0Qrsq/W8qw==
X-Google-Smtp-Source: 
 ABdhPJzeTQ3Ed/inOe/7G7G2dk0yW1f8TcCA5p1z7BfscsbDXD9ugjPnQ7vXj7OfysHbQgARw+s/5rten+u3lg+Vjs4=
X-Received: by 2002:a17:907:1c0a:b0:6da:7ac4:5349 with SMTP id
 nc10-20020a1709071c0a00b006da7ac45349mr17440467ejc.596.1647800547580; Sun, 20
 Mar 2022 11:22:27 -0700 (PDT)
MIME-Version: 1.0
References: <16DE29C4DF124B62.27547@lists.openembedded.org>
In-Reply-To: <16DE29C4DF124B62.27547@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 20 Mar 2022 08:22:16 -1000
Message-ID: 
 <CAOSpxdbWJd+uUm6Kwur4hx0oqW+JmOvHpk56EWtiJEpsLn-i5g@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for master on Sun 20 Mar 2022
 08:19:01 AM HST
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 18:22:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163485

Sorry for the duplicate, didn't catch it before it went out.

Hopefully there will be just single reports for the other branches :-)

Steve

On Sun, Mar 20, 2022 at 8:20 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Branch: master
>
> New this week: 7 CVEs
> CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
> CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
> CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
> CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
> CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
> CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
> CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
>
> Removed this week: 0 CVEs
>
> Full list:  Found 14 unpatched CVEs
> CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
> CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
> CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
> CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
> CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
> CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
> CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
> CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
> CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
> CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163483): https://lists.openembedded.org/g/openembedded-core/message/163483
> Mute This Topic: https://lists.openembedded.org/mt/89912064/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

