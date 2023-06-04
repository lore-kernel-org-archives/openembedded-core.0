Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3329C77B73
	for <webhook@archiver.kernel.org>; Sun,  4 Jun 2023 13:03:52 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.16497.1685883823792744810
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jun 2023 06:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=2dRsgmE/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b01bd7093aso18854335ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685883823; x=1688475823;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C97v1FQoiWlkRhsBi2e9ePFbISWSzMBuz4HgjLHkUXU=;
        b=2dRsgmE/fIoTayDPMoL9qrZNeWPsuF1QH0CYMPkro5Ma2WDNlNslFbN8thyFCYilD2
         36KCE6rDIZHf91V/9GBVXVJNUs31CsATPMASDKiW/t14gFp7V9lYy87pAb11WB8V4sXe
         rpudqEHF3VH4umxpKGrAFuD9Qp9uEtBO6WGLsWu5Gp525HsPHO8vBp/B7tizfevyfPBf
         /in4FPxvAgCHZ3HMQEoIw1zUZ8D7syqd9JzSxLxxDG49RBrp7Bxq/mqosrEOhR0Hv5Jx
         fEj/eLO1Ml3f6W9r0xqpbhZZRsJ4rOCSo/uxjwW3xA0fgiwrv0C2UbNxn2VIWCU84cSp
         JW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685883823; x=1688475823;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C97v1FQoiWlkRhsBi2e9ePFbISWSzMBuz4HgjLHkUXU=;
        b=BPtplrFmWpe7MEttwZapI1EZF9g8xXqlpB6TiDK9zMvHNOB+e/27DmNDEwinx71taJ
         TLGgrcMXTf6H3WCUNw2b9vs2WI3yH8UNZDb1CQLeD3Q7lmKNuWjWKyPqIvwJLrFZdtvi
         AcEC+9fNotJWMtvmJfg8Bb7K5f+6u/zCpjP+KOvNszVbjf+tgaiG60dzzwNNo8IsRPWG
         tggVqL3TgRaIImKlarp/wYRuq7VW8/BLyz8DZEiaL07D23zHHAZ5QGRGPQV9jcq5Y6tD
         MTnPTHziJW5O5gDRbkXoZDsYzmI1NjNuU/JK+1RRIK3hzHZZUb74I0qEmSLp/ozRGAz7
         RLcg==
X-Gm-Message-State: AC+VfDzjBNEqXrR/3zROqxxJcMfQv4MplmUt7MyQJxukHFbkutVpkXIj
	0D/zfX3BolvnA52e5jgRWBi4kGFGerXLCC9jJFs=
X-Google-Smtp-Source: ACHHUZ6ub6CKjTZxScLPlB1p+A9a9Rah8WRNlqg7cekbntAeRICIBHem/ESj390tdraXOFqTgCxr5w==
X-Received: by 2002:a17:902:f68a:b0:1ae:626b:4771 with SMTP id l10-20020a170902f68a00b001ae626b4771mr2738064plg.36.1685883822646;
        Sun, 04 Jun 2023 06:03:42 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id be4-20020a170902aa0400b001a0448731c2sm4637074plb.47.2023.06.04.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 06:03:42 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6C0C7960397; Sun,  4 Jun 2023 03:03:40 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 04 Jun 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  4 Jun 2023 03:03:40 -1000
Message-Id: <20230604130340.6C0C7960397@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Jun 2023 13:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182363

Branch: kirkstone

New this week: 3 CVEs
CVE-2021-4336 (CVSS3: 9.8 CRITICAL): ninja:ninja-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4336 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-32681 (CVSS3: 6.1 MEDIUM): python3-requests https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32681 *

Removed this week: 1 CVEs
CVE-2023-24540 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24540 *

Full list:  Found 34 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-4336 (CVSS3: 9.8 CRITICAL): ninja:ninja-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4336 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24539 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24539 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29491 (CVSS3: 7.8 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29491 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-32681 (CVSS3: 6.1 MEDIUM): python3-requests https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32681 *
CVE-2023-33204 (CVSS3: 7.8 HIGH): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33204 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

