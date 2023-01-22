Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A364C25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 13:33:53 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.18071.1674394430519126430
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 05:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=iPbagOO/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id 5so3810177plo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 05:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKVqlonGF3DuUOXW3rgBaGabAa3OaEDXl68wrdvZC8g=;
        b=iPbagOO/oGSvLrNd8gKj2GTUsQa5blrsyfi6Kc3aSG52WP7DAngNNKMuBkzifnFx4O
         ctO3MaQrlUDtD03RchiQs9mr6Zkt1x0l6zu1cNHHv7fyFQlI4c4mTH3ZQQq8rHeps+eR
         6ZWbLrN0QSuCZ0ZRM90zQi4EpXG3suxSPpzrXD5qXD/NutUUaaQabRlfGOfPXIRoc8K2
         9Ddk71Dm3DYHiei3KN7JvCPNdUR0xwJvqv68XA2cDaE0c5hxBaa09KTFXJFfPtPm5zVT
         8bpoox6B1pzGIOyDV5hIH+HV7I2zet2yGuEWrCZJznt7zkO7BeY3RdnqK6QEDaNFw5Op
         Evqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKVqlonGF3DuUOXW3rgBaGabAa3OaEDXl68wrdvZC8g=;
        b=DyjRfrq8KUainzkReMtDuYbU9NiaA7gaWdMmxIypg4eToAQauIyg1gPT2Mf2IMIjEr
         /0oRgiWrrCs0MlhS2ST381Px0RMWJLGX/aAZA5PAifa5DNILYi0rjC1K7MXwQoi3/p9x
         oAk4qHt6U3cKiqDOpyhknjl6xjQlr4spd52XSaeaqCnmv0DAO0DLAtWCtcIbUIJqFTAF
         NqNNfU8ll+URiH6KHuhrWCvT1EQZQFcFMfgRtKlfIoOfjywYkiMEZlhx6hCnjRfescvU
         Ak9IZBzMU3Zw4fmOr/nD0Pk3mJkFGKRXDds1Ma3A/a+ivzmCS3GoFoy5jRJ3KAH8CVQN
         6SjQ==
X-Gm-Message-State: AFqh2krCAS4os6zqEb7jB6DhxCYCd0xaynsThq5fplH24ht5gpNAORAP
	qVlPJSAUyno2bwbDVBrZ2CmlL18KYwqpdir5wxs=
X-Google-Smtp-Source: AMrXdXtmhk6XDICoPUmeForrgYBji0oQbC3G3FpEVmgjvFYO00FLJ+35FOliN6Ofqh71F7KEVivjPA==
X-Received: by 2002:a17:902:da86:b0:188:6a62:9d89 with SMTP id j6-20020a170902da8600b001886a629d89mr58607833plx.54.1674394429340;
        Sun, 22 Jan 2023 05:33:49 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v17-20020a1709028d9100b0019602b2c00csm677040plo.175.2023.01.22.05.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 05:33:48 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DDA7096035B; Sun, 22 Jan 2023 03:33:45 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 22 Jan 2023 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230122133345.DDA7096035B@nuc.router0800d9.com>
Date: Sun, 22 Jan 2023 03:33:45 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 13:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176262

Branch: langdale

New this week: 3 CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native:libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2023-0288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0288 *

Removed this week: 0 CVEs

Full list:  Found 22 unpatched CVEs
CVE-2020-10735 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10735 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native:libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-37454 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-37454 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40303 (CVSS3: 7.5 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40303 *
CVE-2022-40304 (CVSS3: 7.8 HIGH): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40304 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43551 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43551 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-46908 (CVSS3: 7.3 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46908 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *
CVE-2023-0288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0288 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

