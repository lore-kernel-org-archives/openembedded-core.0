Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F0AC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 14:06:26 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.21299.1644761185621910326
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 06:06:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OX1FTv+n;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id 10so8561514plj.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=0D+BXDx9YoXmSnXqvcMbQa9AFajOa14VtMHbCxmFSGw=;
        b=OX1FTv+nWsznNvfcNjN+tgPGixZ++RKNe00zJf8Pqdj5/7dGw0tX5g816JMD/bgowi
         9IETbVRxi/XSSzWojto0gp9SGHLSmXKh7z1/mjvxjvXHjuaZIyG66icr9RFfvf1jgmg0
         jYuooIXk+PL6R2VQuTo7V6oJ3Vy6CYjbh/e69+IgwsGTvNTZ7Imag5MkrBrsODDQxtIB
         vjm5wlG9/7XzCYahnOiqmhRTVYQkebgF+Vn1Jtm2s2Oh+UXQGZ2baw42vkq9RewABO7p
         usvJkmJJxvX9DaxwXlq3iHwR6oOSXwurjHRDt4yakNiFCfxuckJGPussj9PdGXmNpD8u
         yOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=0D+BXDx9YoXmSnXqvcMbQa9AFajOa14VtMHbCxmFSGw=;
        b=zCm2qpFJu6B0CQ6qYCm/XX3JqJHzYTdIgOwQmpPHCr8y6QmYAyPj6eZ27AlzJ/RKVF
         H70u1KnGAa6/Ya+roZPnKeurbJCHHKokWzH85PgAE/azdTcmUkNlyUMHa/sak+NxeCmh
         pJdR5ywpHNkVmp0QYlSgXr3HnTm3ivKVkcNDziWIKZYUbh5itivpPYJnVMfsWgIlmA8e
         2/SXlUHWHaLlRCbnhpW1zvvZFHPRR4TIOLA1BkKK4nTJv/2ZZojIvgwfh8dbSxpsLnKr
         bqOh+apcSlpQ05mI2nN+o8jozfFN5wJs24z30RCZ4gGxLXhQksQkuC80ppS1qlkS9DHI
         qHCA==
X-Gm-Message-State: AOAM530dYaMYhU6BijLDMRUx6l/Le43AiznEzGy/qSOanKNLdMTR+xD9
	d+xhVpxBPtdVBFpXzEBvLGkDgtSih0Bv0sFV
X-Google-Smtp-Source: 
 ABdhPJwKsVPIsBWxKznBQmu4f3v1QWV6XDFPuDUICocmY7WPAGx7U0hKjiGcmWE+2tRzaY02ZNkB1w==
X-Received: by 2002:a17:902:fe0c:: with SMTP id
 g12mr10040511plj.90.1644761184495;
        Sun, 13 Feb 2022 06:06:24 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 j8sm8765764pjc.11.2022.02.13.06.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 06:06:23 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A751896070B; Sun, 13 Feb 2022 04:06:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Feb 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220213140621.A751896070B@nuc.router0800d9.com>
Date: Sun, 13 Feb 2022 04:06:21 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 14:06:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161682

Branch: master

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *

Full list:  Found 5 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *

