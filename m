Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B394EC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 14:02:19 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.8985.1645970538785973461
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 06:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WXtP5t23;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 12so9255191pgd.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=kp9r/sZRlqR7QdOJISGB0SNjCuR7JtqhkC5vz1qCa3c=;
        b=WXtP5t23tqBZ4k6dj+JSGob19ZXMC3o6vK+xPKvcSPqMjoEt29A4BZCHItcOo2aq5t
         TmMVTbDytbiVeTTqg2qNDGkBxvlqYMrbLJMLswhYOzxKRhnZJbF+a2Vs/UEQGnWYka1+
         9ID6YXIsVm2gcYl4vTiJmQljQ32pNVxPQdSz1KaRQVnBJGMFXPx1OlxvaBgrTT8nv+BU
         w4rabQyQaHqHCFGrc+FAU74sGY5V4BRjBk7ienyKfYmH8EypkzQX9uC7dU4+yscJf564
         18C7SvIk+MWzBxXo0ivpP4z5taba5nF+zUt139JkVcJSuyfA8m1zeZmlwEvLDu8jwHad
         SE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=kp9r/sZRlqR7QdOJISGB0SNjCuR7JtqhkC5vz1qCa3c=;
        b=xNSkuKgAnk82QKN3Fiu8ByDLffJpwTG2KNY9IkFx8YMZ2RYhBeOsIFIaPhZiNpVokJ
         +Ua1dQbc5JpVX0nPlHzNUoQgigwWuifjQ0I2b2jKTe9Cv9wD/huVYk6qcvf7kyMfCYOf
         cW25561Xg5ZWzpZ4dFbkWVllkUkjtYv47AlzLFQiaVM8rXSba8Meu1R4YmbMl/PFtZC9
         OKp9dk4SUBLoLFOFWPEsTfERpIcH+1QeNtnOIPMw01KuDDOTSMR6OXxky8xpDZX1ekB2
         glRlU6OlfXW8/Q2v8u0vkdkhi9oPU2y1kNRlYkYqtylrizgjOwbwj7NrMM0v/ApghWWI
         i4uQ==
X-Gm-Message-State: AOAM531xSZ4oKT+O72wWqysJwBLIoMdew1zv6mnnETVn1wRePV6unZAd
	GgGn/3A9JaJ4r9HC2J7BkhlOrSTBLZEklLzt
X-Google-Smtp-Source: 
 ABdhPJxwr+a8sD+Is+9DqNi+jnljsJexdLuZlpGsERXe+qZhrnRvbZYKQBMJ+zdz+B/iCm+ZEms1iA==
X-Received: by 2002:a63:1952:0:b0:362:42ce:15ec with SMTP id
 18-20020a631952000000b0036242ce15ecmr13691380pgz.6.1645970537585;
        Sun, 27 Feb 2022 06:02:17 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a056a00125000b004e1e36d4428sm9567734pfi.104.2022.02.27.06.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 06:02:16 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id BF8AD962BE7; Sun, 27 Feb 2022 04:02:14 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 27 Feb 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220227140214.BF8AD962BE7@nuc.router0800d9.com>
Date: Sun, 27 Feb 2022 04:02:14 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 14:02:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162434

Branch: master

New this week: 1 CVEs
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

Removed this week: 4 CVEs
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *

Full list:  Found 7 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

