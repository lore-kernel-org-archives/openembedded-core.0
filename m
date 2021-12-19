Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CD3C433F5
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 14:03:01 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.16809.1639922580752946769
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 06:03:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ExZNW+sG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id t19so124781pfg.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 06:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=SA416w0ZeZT6/kkFxe3LhYdY8gURfGxxeh1hDzm5XUQ=;
        b=ExZNW+sGR058yotv09f/Ep22MR7E3gtl/b2UGOkpa8p6foz8KFfkzdcxfFDlAIcbpF
         V+aOz1AwNucbvIXL2I/mlJIwLACdUqoN3W+8B9LrEKxK2wMyuhoVu/l5QD9v5pq05j1M
         szoT6KY12RAegZwqCd9use7yv5ssEJD2ZusxkIzaviw6fq6peVSwQAvsjybxFMBm2K7b
         5htrt3wT4EUi4ITercqRNSOV/lvj10PFLH4MCLPvx4WIBdZ+dkn4rzFxMJSTfLma4IJd
         vG2OwciQk48ocVxaStpZfclQuWjfCTDeAVr9n8NHem9V2+ELhwapwXyv0iQSSU3bWftr
         0pXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=SA416w0ZeZT6/kkFxe3LhYdY8gURfGxxeh1hDzm5XUQ=;
        b=EobqCvsN8d13TWEznUgvw4q9rbGexvvcQij7vsN9CtGC0UEtIeLcrp7QEqFgo5D+SZ
         FBnd2xIT1kARRL7ZD78iCXns64kF8e6u1O8t+Ss1l4P6OOZoMK0trKir0Wehv7nXU0MZ
         5u1JwI3NTLph3oN1qJMAdcBfIoj7/BSASaUDmksOtrOzboMMt+HcT8tFrujZgM3CYkG1
         9Zj2ISkumdcAhX4Ff8g57wDedgIxgkolwwdOhO/WD2tiFWDq2JFZb71dMjYvpWl2AaCv
         hjjOjqs9zcs9v0i6WtrJsIfKSvh6OaBMRYYLdFsEnVuLqt1ImRgkYsYbzLcGIUsEZ3aE
         stRA==
X-Gm-Message-State: AOAM533XKWh62R/MRYevW8w9raOCKZ2zCgg1KB8971Zg/StXKz3opJu1
	wxIkobEG0qW2JvE7DGNnLz3YeMgK8egqVvOt
X-Google-Smtp-Source: 
 ABdhPJwO3nNbb7ArhQkrvv3RzuZFqWXZ/3n3gMVxSYaYKIjXmGuCSefLmKQYRhzSVeYrcxfU3BLbaA==
X-Received: by 2002:a63:114:: with SMTP id 20mr7236523pgb.342.1639922579197;
        Sun, 19 Dec 2021 06:02:59 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 h14sm4949802pfv.33.2021.12.19.06.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 06:02:58 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 624FF962C6A; Sun, 19 Dec 2021 04:02:56 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Dec 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211219140256.624FF962C6A@nuc.router0800d9.com>
Date: Sun, 19 Dec 2021 04:02:56 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Dec 2021 14:03:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159846

Branch: master

New this week: 4 CVEs
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

Removed this week: 0 CVEs

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

