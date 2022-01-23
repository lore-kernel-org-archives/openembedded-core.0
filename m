Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86822C433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 14:34:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.9936.1642948463835017095
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 06:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qWKuBZ0t;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id v74so10183506pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 06:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=aVNR5xt3HbOzKo5Q/dCOafHA2Yi/uhe8RD2+xkaKYSA=;
        b=qWKuBZ0tjudPiSfacahNgQ5wQ0H2UVGXT9cbcbzh5t1EcX+lVUmFxBgoafrwAbpQW6
         MApqh2Uk7bcCWTm2wRczb1nQ8XwXOSdal1QMSljz78DQ6qM8jyr+wmv7MK2ZA0Iu3sr1
         Iz19RjsWgxI05NvoiBTbSbhPJNcDHgEcFzZptLfSyIq/eQv+/IG8nTW21VIy7wp39Okz
         oYkZX8W1W/Nl82ax1sYqogqeqANOd6o3Em5uqtXcnLFCPbld6UVhDzmlkH60JiCLGlNm
         haiSIptDbKiUXQ8XAyM8TKMxYWqVq923toSmS1sUf30eooMtdZsHKA3askupkggDEnmO
         nyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=aVNR5xt3HbOzKo5Q/dCOafHA2Yi/uhe8RD2+xkaKYSA=;
        b=FP8kPVnqNbd6pEAmNYkl7b3nmpH2OKjrI75L4SRQXNMNu0PbzSCZVDaCicbaIAA6kU
         JRaK2PXL3ymneRBcnBgNRdo4KS/1kA954IEuzzpmimu4DBXHIdvm0qMdUqwwC5VbvLhj
         aw6cJ4Hcvny1r33BNBAmuhD6UPos/sEOR7R2VLE6JOqQroXFc6LEBIidTqVSA8S6hdIh
         Znic2EWXTy56jaHktsbXno7xEAiuac87cc3Ranr4JS+x8Av0NS8ecr+lXVM+JrViZ7Rj
         aeocH3K109bNVYGfF+n30plEeZVTJip5Gd4Z4Gbb3OkZGImj1k+/DY+ixdDP/C1T0xc0
         kaDQ==
X-Gm-Message-State: AOAM5324c+U6dsh4oO/H1cmqdTc17N1UQkOCemXf2vsesd65lGfwCb46
	w3TPneq7OxecjLhxFt/FFZhQndxOAGw9ceiiRgk=
X-Google-Smtp-Source: 
 ABdhPJw5wcPCWnN8ufEMKHrR2m/3AugLJ5U1HS7jvpQJtLC9dREtdsFbv3DPsPlYbih/NJrgvfSMBA==
X-Received: by 2002:a05:6a00:2404:b0:4c5:ee63:f326 with SMTP id
 z4-20020a056a00240400b004c5ee63f326mr10439905pfh.42.1642948462661;
        Sun, 23 Jan 2022 06:34:22 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 b9sm12700064pfm.154.2022.01.23.06.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 06:34:21 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2ECCB962C85; Sun, 23 Jan 2022 04:34:12 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 23 Jan 2022 04:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220123143412.2ECCB962C85@nuc.router0800d9.com>
Date: Sun, 23 Jan 2022 04:34:12 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 14:34:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160864

Branch: dunfell

New this week: 7 CVEs
CVE-2021-3472: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3472 *
CVE-2021-4008: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4008 *
CVE-2021-4009: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4009 *
CVE-2021-4010: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4010 *
CVE-2021-4011: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4011 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *

Removed this week: 0 CVEs

Full list:  Found 101 unpatched CVEs
CVE-2018-21232: re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-13253: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-15469: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-16590: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
CVE-2020-16591: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
CVE-2020-16599: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
CVE-2020-17380: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25632: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
CVE-2020-25647: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27749: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29510: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20225: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27918: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28966: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33195: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
CVE-2021-33198: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3418: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3472: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3472 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36221: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4008: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4008 *
CVE-2021-4009: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4009 *
CVE-2021-4010: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4010 *
CVE-2021-4011: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4011 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-41771: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-44716: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2021-45960: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45960 *
CVE-2021-46143: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46143 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
CVE-2022-22822: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22822 *
CVE-2022-22823: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22823 *
CVE-2022-22824: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22824 *
CVE-2022-22825: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22825 *
CVE-2022-22826: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22826 *
CVE-2022-22827: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22827 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *

