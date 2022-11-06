Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B411C4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 12:02:51 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.15756.1667736168417505511
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 04:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wKkA3sHL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso12145199pjc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 04:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jktWliktB9fsMIDBrFmZq3o+mi4UCMJCOAaQyY2xz0g=;
        b=wKkA3sHLDdTajHKt7E6gHyHTkFmBMmFszUJ6PjrCNgP6Espthh5nUAqQO5kKPn0STY
         kfxhtWCPz9prFaJcaBUuTRp1owmNxQvqOP8JiPXAtUfeHhk6t/FAFyhVGDK/CC1dYCsj
         FKjvMHSwCv8zkV+ZBW83wvPd3sDiF2tztivzDKHIea/b2f+p95Ha1algHXLGATpMBqVG
         LVqnUtWX5OURqmV6uEBxDe3g7HMmp0jvED73KOW7AahwkTbFI0Xd/YWn1o6bgHVclcKq
         LRn+Twnjs6oYcJVkYm/tDRIcYUa/K6f7NBzj++G7fzYyW1NMDsaQVralL/ylQ0nWFyzD
         79Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jktWliktB9fsMIDBrFmZq3o+mi4UCMJCOAaQyY2xz0g=;
        b=e+ya7DwqlJIdLLYlNNflLAqzFcEt4Erx0ehzvm+pu1IbyihCOSY7XyuvwkIgratWFK
         wNPTLbTAEpYUVlItM/8oiZhhroqwHABfV7llTTzDKTs5/UuqP6gWo8CGkPMx5yy7jBYI
         gs6a/Zn37QAQ/t3zZ7hhCTbWPOltPhUFAQuRcttVmiIgh/7zej0+LucF6DKGStEhLqH2
         hBh+/bZ26BH6yiIFJBBiPHzf3vnvDJw0un+e9XTid9oySFyjDJfH2TUAbm5xEBtwDVpU
         B3eizLdEovIIxjf/ecHdwS0HoMO5+VnHDjyHvMohNkOSciGHmGabmJCVBn5Jlr7v2iJp
         B9Nw==
X-Gm-Message-State: ACrzQf2MJ15NLJvEQGED8phMQJbo9w8e84i5zU6SYstN94DFcKT/l1qM
	QPyiRQlH1bbyZtvJK/7h8x9/r4HESpcMI0kH
X-Google-Smtp-Source: AMsMyM5/4XnGX+LPy47HKzVnl37TbemCpk3VGMaw+AKMKfrTGg9h+eoVvNO2eHChHjGhFa/p6J30yg==
X-Received: by 2002:a17:902:ef85:b0:187:85d:bd2e with SMTP id iz5-20020a170902ef8500b00187085dbd2emr42673622plb.31.1667736167304;
        Sun, 06 Nov 2022 04:02:47 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q23-20020a170902bd9700b001784a45511asm3041648pls.79.2022.11.06.04.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 04:02:46 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 019EA9602D6; Sun,  6 Nov 2022 02:02:44 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Nov 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221106120245.019EA9602D6@nuc.router0800d9.com>
Date: Sun,  6 Nov 2022 02:02:45 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 12:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172762

Branch: master

New this week: 2 CVEs
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

Removed this week: 5 CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

Full list:  Found 2 unpatched CVEs
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

