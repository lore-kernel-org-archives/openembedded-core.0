Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02892C433FE
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 13:32:07 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web09.29972.1665927116609518267
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 06:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=byiIqfSJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id 67so8896277pfz.12
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jXHFqgeQAY5CamU8jEqGwLn3gVjYVuhQkv+YTrzXUE=;
        b=byiIqfSJYbiv2BtConu1E0foNjXFoHYvrENG+mv0lDFbhrvm1gRESjJqzxkJX98LeX
         VH03G7LMAM7jrHFOQ/KPyDppvhrH6SbCrJfBeZxtbXDHefOVvEg+iM9uvs0WN4FtfpNT
         woq+pzmRlQetp2aEpgWpj8FbtchgaLkDQOkyRwCVINvy25GgytvOCw6HJqvmEoQKz2mU
         WvcXcJqrxGpVMdNcPBKwiSZCe8J8OLmBVqOCkYCobPknLgH/3WPhxG1M95RIyPgCbju9
         wlfGHkgNmiYoZlwiSo8X8DUV5AaGeAzGak2Rwzm+3K94gBjP7sDWvbVFT2d/3no5YOzg
         AmoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jXHFqgeQAY5CamU8jEqGwLn3gVjYVuhQkv+YTrzXUE=;
        b=Q+K+1Qe3zcMPuo13+tJQ7mmLoS9wNwCayAQBo3Gl8I86j2epvMBI9mEHHsc5fpPVJ2
         DB7gVzpZI2s5uWv2LREnQksgfR4EjCWYTa0TWk7z0XeXCmP+a2ebWnUJjEaJppkQ75hL
         wz9rSXI4UpnQIQX+8zMckHSH2njsc1/AYdzKHqJYz2E7waO2iiLIDOoRWwBn6MbFFa1A
         hodKtTBHVXNgVQwqBKpvPTvTLQViortGaqJR9/voCaeZJDOhIuV5WYaNpBfjpQcZeMmH
         /vcqPeFfj7CPjC4yi/qumJKNx8jNko3EYekRJUYuRtWiiM9kgdE619qY7EpqZ8Inl5M2
         21Bw==
X-Gm-Message-State: ACrzQf1xSQfmuoq7Ny0NhICLR5Jmmw2U6snOz76UDWkHOwlPoReijMM9
	6BwSPcdQj0UvszZhz1KNE7vzHhWjw+71f7Lt
X-Google-Smtp-Source: AMsMyM4I1AsvfNBlwXKl8rf6N1vRBTfrKsknSbMceHBk8SoVfaDLyzMp+vYE5Zh6t/Pq9MbVwA63Jw==
X-Received: by 2002:a63:d551:0:b0:452:87e0:73d5 with SMTP id v17-20020a63d551000000b0045287e073d5mr6348304pgi.488.1665927115532;
        Sun, 16 Oct 2022 06:31:55 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902ea1100b0017ec1b1bf9fsm4854322plg.217.2022.10.16.06.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 06:31:54 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 273199621B3; Sun, 16 Oct 2022 03:31:53 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 16 Oct 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221016133153.273199621B3@nuc.router0800d9.com>
Date: Sun, 16 Oct 2022 03:31:53 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 13:32:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171896

Branch: langdale

New this week: 1 CVEs
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *

Removed this week: 0 CVEs

Full list:  Found 3 unpatched CVEs
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

