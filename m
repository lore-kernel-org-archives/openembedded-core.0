Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF16C433F5
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 16:22:42 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.200.1633882961779689651
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pbwszxIJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 ns7-20020a17090b250700b001a0937b87b7so320688pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=DqkCi5d759O/P2YFtTIPtpRuz+3WH1amQCaGG303qxI=;
        b=pbwszxIJoKVSH7L3ct11hG2WEh3/ndqTzBU/w2yYlqehFAe3T0QaVJUqih7bGTVy0b
         BdaUzzTN1ErW5lW3pdqDcIDuw256O4ASElHisZiVFFqF+4S+e1lxVFtUqxluy8PkIiKn
         DnkrjREZySoAJYKN70eND9ZbR3p1F+Nw35TcRMN4vD60GOFPe3BPuj2J5PPyDsnk82BM
         hVAvG9KYJOymypupnTR4Zc06BVGgu1voUg8XGif5TO80DU5YtCqDyUk0Ka+UB5PLjxyx
         umWiZslpswKs/4C2J9CAYBoaX29/26Vyz3cg7CWPCkFzeh1C4+uO/8Jf/iQaWEUSHtGv
         jBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=DqkCi5d759O/P2YFtTIPtpRuz+3WH1amQCaGG303qxI=;
        b=t43dbmXgAohKT8VDSC/zFTus+rSEfVT9pxqT0dT1gfhiZMMruT0qqYZvUkc/xZ2fb5
         RFY3SRw1HOGrfLCkghm32K47KZJQF4qaGzEHznyPQNUZqWVTMalzp+iY10RC2b0LoyKa
         +02HAsmq3St2EA6bl7yrje9K27e9kPG4gy9Jcpv4499Py3SHmiuYCovdnniJ9ZNTALZg
         UCP/YmG2Sg4etGGRjW5EcKR3syt/yCeCI6XHSHfFMulCOLpDCL2PJoMdZpdd3nIlE4KW
         xQ3jUDuiqK6StjWK8w0Tch6Ka3WsUeKvz4l+Y9NPKoFnBTkb67jXa4Ua8KnrFZypxXta
         e6Iw==
X-Gm-Message-State: AOAM531pnyq5ZJYdKgYb2uQqtUKiSqj8UXO29voX1yF9djMZ41TVacLm
	c+Drc2mK4wKxP35P+zqquu+oc7n6gAffFCUkad4=
X-Google-Smtp-Source: 
 ABdhPJx+BlAEpLNspltL1If4pmWjTND0O+aQVTl8jMzy5OIGEWVyS4psIFAcQq5qmVx/HMpoBibD7w==
X-Received: by 2002:a17:90a:1a02:: with SMTP id
 2mr24585993pjk.6.1633882960409;
        Sun, 10 Oct 2021 09:22:40 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 x27sm5049784pfr.181.2021.10.10.09.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 09:22:39 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id C44FF9601DC; Sun, 10 Oct 2021 06:22:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 10 Oct 2021 06:19:07 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211010162230.C44FF9601DC@nuc.router0800d9.com>
Date: Sun, 10 Oct 2021 06:22:30 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 16:22:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156789

Branch: master

New this week: 3 CVEs
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *

Removed this week: 0 CVEs

Full list:  Found 15 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

