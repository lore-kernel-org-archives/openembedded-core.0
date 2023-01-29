Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377F0C05027
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 13:03:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.15372.1674997414171559373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jan 2023 05:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=n9Xcl6VZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so12950669pjq.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9E2L+OrBcALJnkMibVyBJJTOYuHi76efjPeGBj+T6Ck=;
        b=n9Xcl6VZyxODmnpiPBxzNrcdQy63dd3bWU4D6ALJWbJqds3Bss/liNSZwoSKTIzN34
         SF3PZRjG1DDJeVukhRilRyLHVU4PtMhDtJaAmhHfP4AR6kAOPZ7oqrVsPAimoPuM8xgy
         Jt6nEyLX03oUC7MngdxmjsZcyw09+0bsdzEBZALEGUV8Orfceuv5UZOIH/8ExcvWgIAR
         +0rXnse5FU9DD7BDWXejeNVuI/pBLT8ogqzUEgW0xBxWE1Jvwr6flyGMTSpcrm1Y6EVH
         V6RcDuPnETXoC1Xu39RdsRzyG8SAJb5WmgC5+by72xKGFFPl7btw+aDdwc0I2Necir7t
         IuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9E2L+OrBcALJnkMibVyBJJTOYuHi76efjPeGBj+T6Ck=;
        b=RkfdmCwDgxTdla+VhCqQRQHEU3EgyKZZWsJGlnj4tfr1eVgr2votQblMTVkXBy7KWY
         eF/IobfAKkVg3DnN7sW+DVabWTFQADMZEgzv+e36QeXRVKfntBISUeNdTMKFdbkz0Pa3
         wa5/VzD2RmozjbHopkbLnFnboZKaD4BrqvZm5ZXDmfzAHpYpyxaXFPixQXIljIfWk3bb
         rtXA1GQaP+540UU7PWyhdKcUiKIdyCHN3utATFKChGqn1hWcfCuBwBKv162YUpGejyWJ
         eTgEnR1trJT+kfFdnhgHSua+5irG2B+VC1+CRS36sFnas+XeLkLXoy98Jq7ASokmZALK
         pyMA==
X-Gm-Message-State: AO0yUKWHkYwrPpxxNLHLfSBY5Bj7IXwEpq+cvZRwpTZ5tKrCQTorumfH
	jNlyfcfbi6B/Fe6bheevXe7jApaW7J/GWgnYdoM=
X-Google-Smtp-Source: AK7set8+kFmiyCpu158RUTLo0c/Z6BJSfkYBgokj87iZ2bItyT6pBv1PqWohD9QaAsYfkvJud5WKBQ==
X-Received: by 2002:a17:90b:38c5:b0:22b:aeff:ee42 with SMTP id nn5-20020a17090b38c500b0022baeffee42mr5922880pjb.46.1674997412999;
        Sun, 29 Jan 2023 05:03:32 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb16-20020a17090b009000b0020dc318a43esm5604139pjb.25.2023.01.29.05.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 05:03:32 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 20BCE960377; Sun, 29 Jan 2023 03:03:30 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 29 Jan 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230129130330.20BCE960377@nuc.router0800d9.com>
Date: Sun, 29 Jan 2023 03:03:30 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jan 2023 13:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176474

Branch: kirkstone

New this week: 7 CVEs
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *

Removed this week: 10 CVEs
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native:libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *
CVE-2023-0288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0288 *

Full list:  Found 17 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

