Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90492C433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 18:52:23 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.21414.1647802342822819307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:52:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aQ6vORWl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id t187so8840296pgb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Mar 2022 11:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=aQ6vORWlDY++qMCokapO9QCkcFriuRfXrI/nBqst3i99XM3pD+avR9HIbZEJXhp09i
         aZaLFWStItDsuesEfEU1a8OqF4zARak4fYbco5u9KlqEreOuFskBYvVPZUQJW17Uvhxk
         ziIs3l++fnQ9eRXXp+C7NndS2QP8Foq7sdS/j2HPFd72vQhVDU/aYw7P0q/RZnEZjZo2
         j82WegU/4ndHvhc6hMV0IeTSZNGi72Ly1+j9Cr8LOK8a1ks47xQH5CQyV7AuuUAzphZT
         xTwSW84ERcXB6okC//ubrWO1+YhXK3Gb4tCdEMhQ9hp8RXQpcH6upL+4o5eCTSr5RnFG
         SENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ez3lT8Ri/l3iT0eYH6XQpSXMo6sxrdBarw8hpmQKN84=;
        b=rEmryTXWaFUkRDQImQ+dck9xxdMlr6G5QWJp5gl9ozBlJ4WqotsOQ+IhC7v75+8dvx
         ozEzSjORsC/9Bsq51qZOqX8I8vsdq5tY6VoWDkFSwjp4Y7NkrG38it8cs0RFdAGxizaL
         O7MTnhRQoi6iTH+Lg/Epy3j6ntRiS1vT+ao/7uQu0H4xI6MkQeRAeo3Lw/KYYsT8/CXe
         6uBvUExV3aAnkdD2jOoiDF7rjmcnNnzXAkQmc4iTAdLPK/TEF7RSh2c1SSZNv9NpdCw7
         zRio+0vFuUxS9zaVApfedxCraPtYmCUNlB119K0QiyFHcjnQyeiEtprxG+YwQRKUvRmh
         w8/g==
X-Gm-Message-State: AOAM531KyQeUhEryFHG6iUTaRABIK2QXsarEgVpnjeHUx5/2asuFyHb7
	Mj2sNi4FAcgNTOEiElHycz7irbS3tHC3M5c5LGw=
X-Google-Smtp-Source: 
 ABdhPJwoDGCJZvxVBgXW38PLMwWYsCAwW40B31u31zBfYNvxJeLlJiNz1jeo2yYdqamsrG3l8zQbFg==
X-Received: by 2002:a05:6a02:283:b0:342:703e:1434 with SMTP id
 bk3-20020a056a02028300b00342703e1434mr15618206pgb.74.1647802341794;
        Sun, 20 Mar 2022 11:52:21 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056a00140a00b004c55d0dcbd1sm16490825pfu.120.2022.03.20.11.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 11:52:21 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 98B5D962ADA; Sun, 20 Mar 2022 04:04:29 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 20 Mar 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220320140429.98B5D962ADA@nuc.router0800d9.com>
Date: Sun, 20 Mar 2022 04:04:29 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Mar 2022 18:52:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163488

Branch: master

New this week: 7 CVEs
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

Removed this week: 0 CVEs

Full list:  Found 14 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0865: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0865 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0907: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0907 *
CVE-2022-0908: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0909: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0909 *
CVE-2022-0924: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0924 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *

