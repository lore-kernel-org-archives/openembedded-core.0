Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80810C4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 13:33:03 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.117982.1671975182459171711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 05:33:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XsqHdoll;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id t2so8884132ply.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rjMhF9wXU91ye2uN3mguJOBxeRcW2vqG9vft5jg/vb0=;
        b=XsqHdollizs0pNS5GyRQlFi+hp2yOGzX9DsmjJECCII5zwRW2VHrck5zqydy53rE6d
         zRQqhU9atxjb3WKahIKfjoFKmubwMFHa4kBPBqUvNNiWULzFn6X87adU5bRZlXn1cYYd
         ViJzOnAe6S5kvC3HmT05krErRUKqq9NToVSZG8zpzozLWpuTHqo5BqsrLlofBBcUbKh6
         tFfEi0RunarkwkcHuu8BveY9M9NojuzycyQWfU2rAUjTugTMkichVwhQWXNNebHmTMnS
         irXUJ81k21bTkIkiyqKtcYV/ROMtL/qf+TzmJXQoJL+BYjt3VL72TEzNRojWqXt8OC/f
         qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjMhF9wXU91ye2uN3mguJOBxeRcW2vqG9vft5jg/vb0=;
        b=bEJK49glzz5jD89o2TX0PrRRF4+oddXVmnusU79zMj1hj12d+njnOY3+tWOAumgbqa
         cXhzRlfXwI05fpziOnjpNwyoyMkiiIIjitiqfB58jbO6MJ0MwI4DBImJuVHentCjSadT
         xvaj968vp0h2Yffa5aTf5NZ9Ot74JodlgiQ2+9ouJrbKRJ5m5FBCE2myZo+WOcmUOCwP
         t/4QGG8PLrNz2c51gPSue6+kVZYA6Jo9tDQJz9FvDlAFsdSHkg8Aa3ctHJL/9+9bvxkG
         mb4omQfrIf2RqS2ih0p7PsJA3tzV+zlRuQnuw0r00QtLzBKOMUtV3+Bj0BDPo8JhxpC4
         0o5Q==
X-Gm-Message-State: AFqh2kqCVHwRSllG3wV432W61GsMkFebMo18u1z9alBQaCeVc72h3ig7
	ElPEQAiral+Ds+SFnyuyoQiOWlHxhm32MhEqh64=
X-Google-Smtp-Source: AMrXdXsBNIKKpsbT1yaiWqyc5uEW/u9EVaGoGTnHCi5BLeh6CPeCc6VW62QuTyz+L7mT7YrLQfC+xg==
X-Received: by 2002:a17:902:ccce:b0:189:e577:c83e with SMTP id z14-20020a170902ccce00b00189e577c83emr19227262ple.36.1671975181124;
        Sun, 25 Dec 2022 05:33:01 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s16-20020a17090302d000b00186b138706fsm5441223plk.13.2022.12.25.05.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 05:33:00 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8FB1C9602C2; Sun, 25 Dec 2022 03:32:58 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 25 Dec 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221225133258.8FB1C9602C2@nuc.router0800d9.com>
Date: Sun, 25 Dec 2022 03:32:58 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 13:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174994

Branch: langdale

New this week: 4 CVEs
CVE-2022-42010 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42010 *
CVE-2022-42011 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42011 *
CVE-2022-42012 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42012 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *

Removed this week: 3 CVEs
CVE-2022-36227 (CVSS3: 9.8 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36227 *
CVE-2022-4141 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4141 *
CVE-2022-4292 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4292 *

Full list:  Found 19 unpatched CVEs
CVE-2022-2601 (CVSS3: 8.6 HIGH): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2601 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-42010 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42010 *
CVE-2022-42011 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42011 *
CVE-2022-42012 (CVSS3: 6.5 MEDIUM): dbus:dbus-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42012 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

