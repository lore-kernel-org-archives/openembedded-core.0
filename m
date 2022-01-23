Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E549C433F5
	for <webhook@archiver.kernel.org>; Sun, 23 Jan 2022 15:34:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.10668.1642952052840797218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 07:34:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=deTGIyN4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id e8so13210918plh.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jan 2022 07:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=494ssjPUp47sHduQ3GXyuBLkHVtUoJwTtpLqRxGQKTA=;
        b=deTGIyN46NG6CuzP1nbFXea/+bE+s4buTD33hHN9sD0X1grjWa6/qsHeoetdx2/jSC
         xtwFqcKnlcgJBneENhp5CVQgfRyrMRI3XcQYs0HHAHvy8GNc0VYNNQVAksrw/VmROlKx
         9psA5CoIuOow8sCpyAIGrgvLse4yBnKG+kmyivpQ+TrpL4tXjA/gEP3efTXk9mg89hpy
         vYDLvtyrVb76XhuqFdo1e9F9SzoA8wrGxRPfZ/lONJZ+HLfboaMyv3MWo0m2HpbqetZb
         S83JxOy8ZPTiizEWjWGjdrbStuLMkXtAjO+xthYUgBFk0IqRA30ZknKafTxbVijqzH7P
         8orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=494ssjPUp47sHduQ3GXyuBLkHVtUoJwTtpLqRxGQKTA=;
        b=wYQrcd6tUTg0GRI0ry1LmQ4hXLAXwtzwj6jMVILNAO+0M9YiCST74UP+ZhCs8y71ze
         9qlWzJFLwd0mpHJQIZabBrM+c2s6MiUBwcAyXArgYbad7xn/nFvi8yYd5R2WH9Fwu29t
         BX5VG/OSA0HVW4770zARUvTkF3LdV59eVIRvdVGdGdiE/wUE4/O2WGp0zXbPtSlDLJzP
         zG0GxR0vld76jiA7oMEIenq+Z+j79oEqAhOTx8l/dlLTSB60yX+Ey9B0Cp7IqCGqH7uK
         7/iCVDxshlq86YlHVjNy1NjLF78LHocsV71qfUzo+sUZuSmasTU63c5IEIkmQqW088Eo
         Yydw==
X-Gm-Message-State: AOAM533u+uTnpvKz2pEy/wTHxiErjprlHz1SWXem5eWLHhIMNqR1Zrq0
	juRbP4T3KDO6My1vedkbOymwxnXudzN6eiOiVa4=
X-Google-Smtp-Source: 
 ABdhPJxF3m9Q2CAeVC+HjDlIjO94V9T/v+aMynIGmSK5GVekKY0fIFuwPAPnCwSaXM1gXa0KICYFjA==
X-Received: by 2002:a17:902:8544:b0:14a:bea3:1899 with SMTP id
 d4-20020a170902854400b0014abea31899mr11184995plo.143.1642952051784;
        Sun, 23 Jan 2022 07:34:11 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 g9sm9821010pgi.84.2022.01.23.07.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 07:34:11 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 5B583962C85; Sun, 23 Jan 2022 05:34:02 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 23 Jan 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220123153402.5B583962C85@nuc.router0800d9.com>
Date: Sun, 23 Jan 2022 05:34:02 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jan 2022 15:34:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160867

Branch: honister

New this week: 3 CVEs
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *

Removed this week: 8 CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2021-44716: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

Full list:  Found 44 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
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
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
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
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *

