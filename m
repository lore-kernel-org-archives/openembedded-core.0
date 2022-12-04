Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864D8C4332F
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 13:32:46 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.128624.1670160763588619540
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 05:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ckT7Nbtz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id c7so5626328pfc.12
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4lgawM94to+KwlJdnGD+fyj/ZAk8NuJ45YCeMHbRfo=;
        b=ckT7Nbtzz65ybjzbpH2OWYWGOMg5oyg2xxFuKBS8i4hy+Llw9V04ii4iQ67s3NORqr
         fM5ei7WRLqwL8YZkkQ8szmy4xDuzu4uQiJy3jP5kj3ybCxIY2dF+H14cjhYtGmoMGNdP
         f1cHatPbMmr7NIP2CAxOEReepfYNqY5k9Whe6VS7rCuBWz10JyhrfDxN6SCMnqVElTvp
         z4Ku9+f6miUBN53gazohi59a1XBmNml0ZJHejmp/hvfELnFYsR4f2kszVQYZNVVu5j1C
         XvdVbuCDaVEiRi2hBx4j5pz9sZmw4hzkG9bYUJB4XGSLik8NKMoQtA3eWsDSI2ZXzDGM
         vJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d4lgawM94to+KwlJdnGD+fyj/ZAk8NuJ45YCeMHbRfo=;
        b=djnBe+G4zNZoXpcJRKiWZIhGaNdz5at+vfSLO1Q0KMhlS3vgKjs5Eko7Jg1IJxqnXV
         hf91saaWsMDaxZqw+/GidE2Vbp9duLsaiBeCv7aVX75FfT77UAs36s/lvkITTna5JY6U
         SeAXyngWFxgfBOp1hw4iwHYu5mmw1iymjDJ/p8ByM4++7ly2n71VK3qObptmDXvgRkmJ
         Ue9obxy+SkbSypFX5c5KPrhzjVR5hBni3tDDnmpGUsEl+dEsCcqS3cMi+mQdsT8ZnR/h
         Pcu2Evw765plCoyM6JVp2fYv3lQvciuqBjjTd5VWPNNpMo5SKFQn2jy5uzF13MjEilOT
         TYkA==
X-Gm-Message-State: ANoB5pnuJY64wKzqq7Bs2054RQ1O7awOW3ja8H18guM45uSwfGYtBaau
	yFzEmhY5egRszcSPqniUe00Jc7dgm8E65Jz8sqvTaQ==
X-Google-Smtp-Source: AA0mqf5Ghj36GpPWO2COcd+af+XT4BncyP7SCGEO/gQmyulfqzUBE8X7tCqYkE6azAQUpB8Rc6zZ1A==
X-Received: by 2002:a63:1a13:0:b0:478:5420:d2c7 with SMTP id a19-20020a631a13000000b004785420d2c7mr20783421pga.105.1670160762412;
        Sun, 04 Dec 2022 05:32:42 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l5-20020a170903244500b00176b3c9693esm8798706pls.299.2022.12.04.05.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 05:32:41 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 039909602B7; Sun,  4 Dec 2022 03:32:40 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 04 Dec 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221204133240.039909602B7@nuc.router0800d9.com>
Date: Sun,  4 Dec 2022 03:32:40 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 13:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174253

Branch: langdale

New this week: 6 CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *

Removed this week: 1 CVEs
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *

Full list:  Found 13 unpatched CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

