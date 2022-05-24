Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F487C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 14:20:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.9996.1653402022062629236
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 07:20:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZLCf0fMV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 oe17-20020a17090b395100b001df77d29587so2232068pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sK9vPpDb6hbgKqXyKHg8rlNvOqvlRLv/bQkozzhc84=;
        b=ZLCf0fMVMQFKM/VAlJe9/+SMw+tiDEDsLUoLTQWim2fRS5eKt8lrLH4+noC0LtJ6eu
         tayQy5jjMqFrkImtrID8xsA3jWzn7Q5qhfuDiW0/TR0TTOCoZxT6/0UXC0oE2H0rTcha
         yPGMkZ64x9tQuD2A1p7/QbEjd1e2VIu5agBy+G1NUC4p4uRNUzFQTeP2rZq2ZsU8mJOg
         8EJR0vL1O/Doez/j4BPig1lgN0a5wqwB1X2+nvOu5r0KhHArBX2QUgL+ymEC3w5IEQ45
         GitR/mcwtab8akMKCH/lCW/uMibI0iXmbCjcmy29+Gxu0Rq/IciSVBL7/lNLAqjtdwsF
         OfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/sK9vPpDb6hbgKqXyKHg8rlNvOqvlRLv/bQkozzhc84=;
        b=6nvLDCesxUGcl0/zrc6PgDe2USe26e+L6gyMhNab49W25PLQTxTq0P438bZDXnXv4E
         rOflrL+ZCCQzg+OqnfmAM/scFDIRFFrndOe1kcuqzYt4myLXvSaffb1sJ3wah938dnrp
         41OTBlJBkbLvBwzps49B+Par3m5HaqgicGEnAefEm9MKSI6VJnF2Sz2rXL3fC6rJ2dxZ
         ubuPsuRn7NcSCkBl1cNzluE50x3O1pRBsVcQtXzPJ26CEz9ND+6QCagoj9G7FyxpMaj/
         TAUkfhZpZLgjnjd/WQ+3LQBMJXPgCZaaDPYccAznQ1R0x2c9sh7zm4VyIfj5de1nW95T
         9P+g==
X-Gm-Message-State: AOAM530g4pPPy7kRcM3/xAkre7HTL1eKC/BQw7sH01A26YQQH6fvnwD/
	eOG9lerelpWPOgd8sii9WW4ur1oFmavUfy0T
X-Google-Smtp-Source: 
 ABdhPJxYpmI18S5+iJQJpdT45+wy7u9BffDrfgdP1SAKFQ8JYayzyFrWsgwccSKtvIXVBbTvjmk4ZA==
X-Received: by 2002:a17:902:ec85:b0:161:cff5:17c8 with SMTP id
 x5-20020a170902ec8500b00161cff517c8mr27766448plg.62.1653402020417;
        Tue, 24 May 2022 07:20:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w12-20020a1709029a8c00b001615f64aaabsm7180227plp.244.2022.05.24.07.20.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 07:20:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/1] Pull request (cover letter only)
Date: Tue, 24 May 2022 04:20:09 -1000
Message-Id: <cover.1653401900.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 14:20:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166066

The following changes since commit 48ce924dc82aa959fb897ec36873db7dc3813b71:

  selftest: skip virgl test on alma 8.6 (2022-05-17 04:14:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Marta Rybczynska (1):
  cve-check: Fix report generation

 meta/classes/cve-check.bbclass | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

-- 
2.25.1


