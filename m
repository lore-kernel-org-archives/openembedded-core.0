Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC021C433EF
	for <webhook@archiver.kernel.org>; Sun, 21 Nov 2021 15:33:35 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.11808.1637508815092329419
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 07:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7VM/fUyF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id r5so13054877pgi.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 07:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=9BXgukJdMQIjWrBLEpmQkNIFrSGz702lnp9O0pVH8G0=;
        b=7VM/fUyFpS7v/1Dw/yoPzt8YFiFhHCJ/fp8NF/hARIZ8iHjthj70ZiEIwTjrS5hD8R
         N8/TntIaWr8BG8q5Yt7o7FLy77E0+HdpfVWeAZWVqF+wuQyhr5VCoAiOOtwruQ8qSdpl
         V6dj4XejoCWIciWry2tK7FC1sbGVgrFVyCGMzJKrWsHHVT4GmbUan6Np4As5017a0Tcr
         sk+FBBicQAeT12OlO48HFduujowIHBwZNzSuxLSSDCRRXZ80lopEinZPFu6irfGPBu9M
         Ai4s4QIv3EuB26xMSmejziA/0cELV+MCVe+15Ebz/eQyo5E3cxdHVZG3YwUeEsPKbigZ
         P/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=9BXgukJdMQIjWrBLEpmQkNIFrSGz702lnp9O0pVH8G0=;
        b=Sl09jZAFUrAnBrPdUZI12DkRGXnPTGxU0jZNkzOzAcsHnmLsyCdpjPSajTYt4WC1qm
         GwMnCzZ9RrS9XY1pdRSlyjKjdxlAnAY3xBDGO3D+j0Cpft9/YZZsIpHzVZRhxnllc130
         MH6gqIFe9wXJs6PQdPHDT/dXCrH8wnEySsjbF1XzDB4MLQPLLtm8sEKPp/ubUrj2dezv
         nao8KICcy9FkGekLs7JjQU2nLJenVjex0d4biEQNxxj+OKfz3EEezjNB1lJQbtRD89eO
         6ebhVAY4J0LyEsRll4DEMkf14nr4DlmFzu90FX+wANm3MgarPn5uTA13sOzyqfWxcfjB
         gAXg==
X-Gm-Message-State: AOAM5321+I4b5KT2sU9uyLbBPEhw2Q0r5GMpVAjf9SatUx8lxZ0R36vr
	uOTIlJdYNfLMl++1knjObONc+PS9vIsIWCSkMKk=
X-Google-Smtp-Source: 
 ABdhPJzINTwzdd47tJBW3R+GCmBht9THTq2w3iUDRKNT+v/M8Sqq2gFik3eI9It9LWjgOES/4Yy4bQ==
X-Received: by 2002:aa7:9561:0:b0:49f:c8cd:ce6d with SMTP id
 x1-20020aa79561000000b0049fc8cdce6dmr78628123pfq.67.1637508813847;
        Sun, 21 Nov 2021 07:33:33 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 i76sm3963430pgd.69.2021.11.21.07.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 07:33:33 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3FFEC962D6D; Sun, 21 Nov 2021 05:33:31 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 21 Nov 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211121153331.3FFEC962D6D@nuc.router0800d9.com>
Date: Sun, 21 Nov 2021 05:33:31 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Nov 2021 15:33:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158535

Branch: honister

New this week: 1 CVEs
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

Removed this week: 4 CVEs
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *

Full list:  Found 21 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

