Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65371C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 15:32:47 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.34447.1642347166196236490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 07:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kN2v9dPq;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 8so7487517pgc.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 07:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=LyIDVuUQ/BevoUvnCCvHuGy9PUiE07httan1Psv9Hh4=;
        b=kN2v9dPq/2BDC6JytiEAJLpFQ/W7LB3y/Ig5+QgRYRyzLq9qTC65ma3TybIqf9A2vG
         PDs5tm1pVgNEmpg957jaPO6HY1MkMnn4kTBGGCki6BLWYgVB8Ei8PRej2972MKqC04tt
         mAaJrlcgdFf7ngKw4SSTHST/jO30+Tm3vNDMfoQ1DeYvqgvuGR1xRN/objtXY3PTTLQA
         smVIDhetkbXYUb+Qq1w0Ka38hHUNGsyEfeU7s1eitvbB5oD1JqWKiUfBsYhaFMbahtaZ
         fMV6oo3G0VV2kH29w/4SdxU6Ua0ObZYp1Y/PWTpTBXh94EHXSfQ8KagvkT5zFQ1VqXOb
         6AJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=LyIDVuUQ/BevoUvnCCvHuGy9PUiE07httan1Psv9Hh4=;
        b=qmIBfEg0LpskvPDEtRVRsfFtgJCWTRTlt9t2CbhsrINyEDtcoALnipf64E7uxlwhZS
         ASPl0DDlkEBOBhLoXGfHg4Q5L62n/TMYDEY+7SPiWFG9Aw47rQRxdPkvWTEg/GJEBnoF
         Zxe5wL54cg2KhdJkxG8PJuH/BdzgpFcc7UAW3z/egcsCh4KhCX2oX2qIvHlXC2wJPOXZ
         j0ITazHP/A7EeuZTeUZ5iZE/r+cY8by7WUsBi+ScqqGIcZtaeiu2Vf+qSjrWXURd5x3C
         BOc0mxNhuKsvAOKaQ+H4e2LLu6S1d7ScvuGvM9tx0RggFxgJ21CETJA0I67F3o6egW2s
         0wBg==
X-Gm-Message-State: AOAM532LXpiO+f5LdP0FvdVco8xtBervGwNqHlwaOZ7maqEGQ29tNFpG
	S18f91LN7c+Jj55PkBbQJ9SSB/4kgJn0yPdZQQ0=
X-Google-Smtp-Source: 
 ABdhPJwC7A3+3kQAtynuVAs9xKwL3o6uyTluaUHB1T036t5RVSrRpqfTlhfLzqMl3uAtmX94XdnkPg==
X-Received: by 2002:a63:85c3:: with SMTP id
 u186mr12620719pgd.20.1642347165147;
        Sun, 16 Jan 2022 07:32:45 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 e6sm2020598pfv.170.2022.01.16.07.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 07:32:44 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6E6D69604F5; Sun, 16 Jan 2022 05:32:34 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 16 Jan 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220116153234.6E6D69604F5@nuc.router0800d9.com>
Date: Sun, 16 Jan 2022 05:32:34 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 15:32:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160613

Branch: honister

New this week: 20 CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-44716: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
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

Removed this week: 0 CVEs

Full list:  Found 49 unpatched CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-44716: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
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

