Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B443CC5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 11:18:52 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.29875.1724584724062245134
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 04:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P1ruuvnt;
 spf=softfail (domain: sakoman.com, ip: 209.85.217.47, mailfrom: steve@sakoman.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-498de7a11b9so1155795137.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 04:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724584723; x=1725189523; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aXlwGVkyp2IMvgILxg/8IUNP0E2LGGurWB4FMmL0mY=;
        b=P1ruuvnt7Jov7Ick9xw1lPcUJy/9Kh5M3r45AoM7yvwNsZIt3slCUUY+3cLtSSyhm6
         wLK7eLCFjl+hzAZegGYAN3aQtgaGdIlDviZZbdh1BbVBX/kycn4S9Vbyh+SquW/ez2kr
         bmyVN3NPeAn9LrdFS6gprS5NNF3qgeGtwLPzkChTUK3MZv1spHpHf6ODUBgsqCKevaU4
         Qsrf2SH7uyIZiy5dhPlt25Qm0adoOEiABl9+4JFzxfQzwZ2CIzJ7hZEKnSbzKen0YXp5
         EHU4oRRtJFznLGxLjSRM3Zrs0wXbzrFEboBNa7Hv0/3TBOora9RnRO1eH42W0cWRwsqQ
         lQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724584723; x=1725189523;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/aXlwGVkyp2IMvgILxg/8IUNP0E2LGGurWB4FMmL0mY=;
        b=UEwsrE1Wgy/z6vlvwLS9Tg14tzwqbRQS4lbXsPurEeIWkMep28KI76hexpWkWJlLO/
         lOgJcZkUFLT5mKR2B02NwaLiTrWadprBHCNCB3Fc341S6ztXbLVjYMpIhBXgGAwrrcF7
         7oHvci035rkvXONcuBgzCl1ErrhuX9Z05vmidfMMT7+mrdJk/dpZQBngzhXpHJcm8zGe
         oaSwFTy9X3edYRLkeDPqlWPhSG456/vZI5cSZeQnmBPhsfPuSdfLUvRPis3DOYnkweT4
         m3kqMqY1QS/n6lXcbeMpES/C40rpTTihdK1UWZrGQoUPOie959Pc6+Vd5IYm63Uih9ss
         N0Wg==
X-Gm-Message-State: AOJu0Yzk++CSp7zd84EargR1m1CcTYrw+JqAtRzcZ3d7hclgXKt98AJR
	/orA1UDRWkFqkXi5xkW+p6ObS0az7+5huZE2Sml5iNaETKb1Del+L/uPGRDchXw+sPljJ4LrE5B
	h
X-Google-Smtp-Source: AGHT+IHldB9mM5a7TjeNna5BoSi0KLBZV8mqTZRGbo7tLCQUF21khlEISXv1flRdpDsz41pHp2MsTw==
X-Received: by 2002:a05:6102:c88:b0:493:d69b:78c0 with SMTP id ada2fe7eead31-498f4c3fdaemr8008085137.27.1724584722754;
        Sun, 25 Aug 2024 04:18:42 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f3fbdafsm356855385a.119.2024.08.25.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 04:18:42 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 2EFFA1003B4; Sun, 25 Aug 2024 01:18:41 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 Aug 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 Aug 2024 01:18:41 -1000
Message-Id: <20240825111841.2EFFA1003B4@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 11:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203717

Branch: master

New this week: 9 CVEs
CVE-2024-32928 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-32928 *
CVE-2024-35325 (CVSS3: 9.8 CRITICAL): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35325 *
CVE-2024-42262 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42262 *
CVE-2024-42263 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42263 *
CVE-2024-42268 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42268 *
CVE-2024-42269 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42269 *
CVE-2024-42270 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42270 *
CVE-2024-42271 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42271 *
CVE-2024-7592 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7592 *

Removed this week: 2 CVEs
CVE-2024-41957 (CVSS3: 5.3 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41957 *
CVE-2024-41965 (CVSS3: 4.2 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-41965 *

Full list:  Found 25 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-32928 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-32928 *
CVE-2024-35325 (CVSS3: 9.8 CRITICAL): libyaml:libyaml-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-35325 *
CVE-2024-42262 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42262 *
CVE-2024-42263 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42263 *
CVE-2024-42268 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42268 *
CVE-2024-42269 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42269 *
CVE-2024-42270 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42270 *
CVE-2024-42271 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-42271 *
CVE-2024-6505 (CVSS3: 6.8 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6505 *
CVE-2024-7592 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-7592 *

Summary of CVE counts by recipe:
  linux-yocto: 19
  qemu:qemu-native:qemu-system-native: 2
  curl:curl-native: 1
  libyaml:libyaml-native: 1
  openssh: 1
  python3:python3-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

