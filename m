Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C4CC77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 16:12:43 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.60495.1681747955473323599
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Apr 2023 09:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zrkkvlLP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id fw22-20020a17090b129600b00247255b2f40so12793903pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 09:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681747954; x=1684339954;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTOynXKaC5CMsbhgQtznyuH+v2mOq6WWhSZibfavOPE=;
        b=zrkkvlLPH91EoOVkaK5JKsmlb9OE11oQtyXdOn+IkjxuLFJk50IbVGYe5VwUsFRuzn
         a2TcpiFRGT7Cmf7zZHGL+BFOTntX3bL5YeyatPkBB6Nhr84ULC6BmajHuISUfqzQ0zA6
         Cdvz7fiAZkxqELuALY6/U+MuE4US6zHB/rMxp0tFZ28N2yHGEKZrLTXnQOVw5BREZBWk
         l0E7ZtCKSBZs98ZuCchD4PLWFnjcV55oWJsr1h3IGrRvUlJitFMCVrID7ky8fZarJDB3
         kEObYMQS9HUB9K52VMTKgeUU63Sgmnq+0QP4c4dlPieOU2yBih/6msuE/XXyFf980QAK
         Ntqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681747954; x=1684339954;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xTOynXKaC5CMsbhgQtznyuH+v2mOq6WWhSZibfavOPE=;
        b=TK8rr7KRXk5iw9ECbUyUyM0DTeSv2NbNqZtwmhMBv0/zqK7sP2rmV4pBdMPHulVhTk
         EHAIX7LgdV0JKN5I1KWJoGbiXUcDYfYEqjLRIEoQ+3sdTlsfpIPcOCYUppZw7wQ/yCTf
         J076eSmbnToA6xs5f4gRETBnfPf3QhsSbvC5VXDH1FAlYus9yzWMiR1vMqkfXZlnkwqX
         vgikJqbbzbzvslJnd3Finy6AKYiiapG6WPtiziGyVTn4NLogGdj5+f/jFiWOPLylutQ+
         MoelDSbyci8tjWQW89ACQD9iAPelh7vEtWW9yhQNc5PCfa7UFps8yNNk9tpEAsmSpIHv
         v5Ww==
X-Gm-Message-State: AAQBX9dACbps3/sf4tQdqI1NbYQa8x/fTe+A1/hlGHD5Ok5G4bDD+Oyc
	nhnrd+HbhFqWEUIiQMAE43aAhhgK+FVVvPbKnCk=
X-Google-Smtp-Source: AKy350aTMIObhInqjRT4L1gqlj2K9ARqqw8PqbNpHPs3oln3Rb2PDLr1nVB8AVenj2A2wdCLQGEIcA==
X-Received: by 2002:a05:6a20:549d:b0:ef:4fa7:b1ee with SMTP id i29-20020a056a20549d00b000ef4fa7b1eemr7339600pzk.4.1681747954338;
        Mon, 17 Apr 2023 09:12:34 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15-20020a62ae0f000000b0063b8d21be5asm2618455pff.147.2023.04.17.09.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 09:12:33 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D84F6960155; Mon, 17 Apr 2023 06:12:31 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Mon 17 Apr 2023 06:09:59 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Mon, 17 Apr 2023 06:12:31 -1000
Message-Id: <20230417161231.D84F6960155@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 16:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180161

Branch: kirkstone

New this week: 5 CVEs
CVE-2023-24537 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24626 (CVSS3: 7.8 HIGH): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-27535 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27535 *
CVE-2023-27536 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27536 *
CVE-2023-27538 (CVSS3: 5.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27538 *

Removed this week: 7 CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-41723 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41723 *
CVE-2023-0464 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0464 *
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-23916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23916 *

Full list:  Found 34 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41722 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41722 *
CVE-2022-41724 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41724 *
CVE-2022-41725 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41725 *
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-4645 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4645 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0664 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0664 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24626 (CVSS3: 7.8 HIGH): screen https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24626 *
CVE-2023-27533 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27533 *
CVE-2023-27534 (CVSS3: 8.8 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27534 *
CVE-2023-27535 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27535 *
CVE-2023-27536 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27536 *
CVE-2023-27538 (CVSS3: 5.5 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27538 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *
CVE-2023-28879 (CVSS3: 9.8 CRITICAL): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28879 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

