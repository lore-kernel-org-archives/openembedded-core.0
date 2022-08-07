Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FCEC19F2A
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 12:02:41 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.12883.1659873757399333647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 05:02:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DLB/xLT5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f11so6331221pgj.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=fng6u05XsFkbHsEpUuXIaFweUV/ElukVtINGrQ7yFxk=;
        b=DLB/xLT5nLiANb+k1djGnZ9PA/iXMOM92Sk3Dx7/mdzOJ6VmFcHNdCQROx2herdEkz
         kCmk0oGRJC3d4EdAJB9Bz79MFkMfd2Ypsy3nwMuJgXlEuHqfjEFi2mijod5hx4bmbhAY
         OJieU1WxfoRfCT4BmoepXklYS0O+6w6ucIrOaf55pY3eHcY8npFmh6bZ+y8C9WviF+mn
         nb9hGR4p6FYcrl7BuvNOzj92btIrGg/9gzsjEDw03WjRnGCqhTnUuSJdpaQRAesaXVL5
         z3Ma74hC35H80pH/nonFbzsCy2F+AGqam9E4Ph1vV3bpdoQAlwIZVqs/hG5RYz//+SaS
         WCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=fng6u05XsFkbHsEpUuXIaFweUV/ElukVtINGrQ7yFxk=;
        b=rLO6Ppwum+7S5vr3kXagwVV5vxBqaCU5m5EeexE7uXNeRHoarsVN+m7fxzjTPnjN1I
         yAr6ZfjtX9dk0rKusHnK2BppGj5GGj1PFC1MK5dEeXqCFlkvO8EdrIX32c9r666a/Kqb
         jZKKOjJ7i95SdJQ8ub5xNjVZ0LlJBooQ8PMyVIiwte4Om+8juOmgyphW9ArfWgAXvcVC
         3Raaxx7NH+GDvwz15pMw8P02Viv98zmMl+cGNjnQ/w9Cw8+zOed62r4IUSwgP7FpH9N9
         xOgM8pZet2G64xZMdQaJzHGHXchXQFsY3Wo5NKxOySwIDufy8pjGLD3AQJxd698qULVz
         E+SA==
X-Gm-Message-State: ACgBeo3W8wn1FkVLtCQdivmHKpke0XSDfZtMTyxbrEo0XdC9HESGFGrI
	QflUAo1TJ96D5txB8WNSZURH0oOXS5rZVsIX
X-Google-Smtp-Source: 
 AA6agR5vyQTeAqIuWmlsUpZIFqP3rxFF97luAIlFylz1S1PUZds2x6+0tQJTnOyoAx7y/7xxxy/rrA==
X-Received: by 2002:a63:6b81:0:b0:41c:3a8c:b4fe with SMTP id
 g123-20020a636b81000000b0041c3a8cb4femr11933402pgc.84.1659873756008;
        Sun, 07 Aug 2022 05:02:36 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 mw11-20020a17090b4d0b00b001ef9479373fsm8864269pjb.4.2022.08.07.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 05:02:34 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 977F796249B; Sun,  7 Aug 2022 02:02:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 07 Aug 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220807120232.977F796249B@nuc.router0800d9.com>
Date: Sun,  7 Aug 2022 02:02:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 12:02:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168989

Branch: master

New this week: 5 CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-46828 (CVSS3: 7.5 HIGH): libtirpc:libtirpc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46828 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-34526 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34526 *

Removed this week: 1 CVEs
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *

Full list:  Found 5 unpatched CVEs
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-3709 *
CVE-2021-46828 (CVSS3: 7.5 HIGH): libtirpc:libtirpc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46828 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2509 *
CVE-2022-34526 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34526 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

