Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C14C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 15:34:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.9760.1644161639101574620
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 07:33:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=H9DHpmjr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id v4so4584328pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 07:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=uteKGrF4lgSPWDseRSryhwO2JhJNeTa+SGKm87ayafA=;
        b=H9DHpmjrf3mLaBjtkLr8Wzp9KC1iF9QGsamNdH+/iQtdYTkdx2jpKv62+jUGLfWqm5
         rmsQkhSpQbjwx2JVNH/9Nmg42JStgIUacJvep80r/ChlBinkzDKT5KJT7uKhkU5x4xtE
         efDPev16JszVsRHLOwKcQy9oLC542cC7V16KojqxRUOOeHrLend6JBWQ2oZrTEoDaAE1
         ss48pYk9I21PCVyfqXmPhrTEni+7S+47PccYbOz9ITV3pZb4/N2NsiHTZLh2ecywqF/3
         quz8sLHoV6ZFkpXaYWIvkrphKYLSn9bsqTuWRT3vnO3twQv9c8cfCUsy//XgSsafq5yL
         Qx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=uteKGrF4lgSPWDseRSryhwO2JhJNeTa+SGKm87ayafA=;
        b=wH9rNhE4pkFlnJiEt5vqoREsUkvaiukoJUb5Gqo24A2MGsgnOQixQN0FZZVkdcIaMI
         q4TmkhlNonD0TjE3lOd6bEJNJY/LnmrLXQReFEJ2YGzF0VsUf3nmPgXa8Rsy47+EZtSg
         pt8OJondE6oTtZU6dRYNsOhl8oobh1yQMVzOo39egNMhcu0rFrhLzxWnp9fwUxBVc2tW
         NJZnVCQ7e3CCqn1OgbYcDttP1lLUbOhtPeG65ZtYEcUNL6fKdBaKAlv5wdBvmVP7986k
         6qK2eAhvnWh5mguQIEm+KF3LEc0Aqlh36lkag3LAAZpWnqClXI1RWQScloqe5RbQg3hR
         dovg==
X-Gm-Message-State: AOAM533L2hF+rk81Ztf1QcH3RD6TTMWuhb5ejRn+FsUOYdtll96E/s5a
	g2X8X0S+FDxFjk0IgCmCg/ywSM1dNEEc6AfJ
X-Google-Smtp-Source: 
 ABdhPJz89z8EWH0iYeBsmUQzSbF2wbgou/1RHVGzHFV87ieg7b3Di1BrDCKskzuOC7dP+YvAuXDkcg==
X-Received: by 2002:a17:902:e20a:: with SMTP id
 u10mr1689824plb.72.1644161637978;
        Sun, 06 Feb 2022 07:33:57 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 198sm6042958pgg.4.2022.02.06.07.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 07:33:57 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 70F4A962C30; Sun,  6 Feb 2022 05:33:55 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 06 Feb 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220206153355.70F4A962C30@nuc.router0800d9.com>
Date: Sun,  6 Feb 2022 05:33:55 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 15:34:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161401

Branch: honister

New this week: 16 CVEs
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *

Removed this week: 24 CVEs
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-45960: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45960 *
CVE-2021-46143: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46143 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
CVE-2022-22822: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22822 *
CVE-2022-22823: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22823 *
CVE-2022-22824: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22824 *
CVE-2022-22825: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22825 *
CVE-2022-22826: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22826 *
CVE-2022-22827: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22827 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *

Full list:  Found 42 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *
CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *

