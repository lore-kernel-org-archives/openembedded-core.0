Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C4CC32793
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 01:42:29 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.6274.1661305348219784719
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H4vf75q3;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id g21so11677843qka.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 18:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=yia23bZgHJWL6z99jqeLupqQ0d+SqtIw+3+xLtL+ZAM=;
        b=H4vf75q3QF13nXVre99yrXjEKSnrL1oOOr/EdwCgnLksIhy2MUd1UAHO3/SLOXgeh6
         BFBZu9XDjXn9tv4tEpnOFtIqhlArZrHXKANjVnIwvSp3ALtHjejBLYjf0UnxkRikj9St
         chWzPJzRoBSx6VgRcjImQU1ymwTqzoW5rvBqSgs8eGwzZRxBmybY7S6+JfoUiAD1tMcR
         mk8/RvaM73oXm68Ns9kDqnoGe95VzM+67PWwf2/zALB1kL8wU961UeZ158tl/T5TuPn5
         U3HpS7yyCTl2awVQMAouU0ABuzcZ3Sceg68QuaeHq+y+cqLMp42msJppWYa2+C7S2Ra8
         VkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=yia23bZgHJWL6z99jqeLupqQ0d+SqtIw+3+xLtL+ZAM=;
        b=gHGhzlyw+90WeoShkVNQtc2EjOW3lvrfXNCCFbXrhRdviY9LUxi2tmhC7UMOHM64Vk
         LfRxVzjqI1UedKl5g0kG3nCB0xhYKpKbRgYepyfBUzkDxe/a6YoCgecQS2yaWI01wEuR
         VIFFoW+ywqV5WEd5vjA/IejGQABNZf41gZ94AgCBb4XGEsSrFgXF0pzhdy0OSJ8zRndN
         MzKk1MzO26A5dW2QzR8F3DZEtCef4e2oprHesITUDtn6KvYBo2h1mqv+MUs0DggxMao0
         Q2v9JJ6sD7evtTdLlxIKKXuMu4w3+gi/WpEzAARFQ5i0EYzFmCu958qNMPXoNx3uDcoK
         iQvg==
X-Gm-Message-State: ACgBeo3Gd5o7/T3l56bbo5xOiY4qEuI1C06If1fVFMQ3qvm63v/x6AIk
	a7X6+95iNc0JgbkZFmttHTQ=
X-Google-Smtp-Source: 
 AA6agR7alMKNNv1nPYDL6mSjwhmMfDmLmRhsZqZ8SZYEHag7pTE7Z2UkZJiMUZK2iSvC97o1i1ScgQ==
X-Received: by 2002:a05:620a:f0d:b0:6a9:b3e9:dc3f with SMTP id
 v13-20020a05620a0f0d00b006a9b3e9dc3fmr18480131qkl.437.1661305347196;
        Tue, 23 Aug 2022 18:42:27 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 u4-20020a05620a454400b006bbe7ded98csm11110003qkp.112.2022.08.23.18.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 18:42:26 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: -stable updates
Date: Tue, 23 Aug 2022 21:42:20 -0400
Message-Id: <cover.1661305178.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 01:42:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169769

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

I'm mostly out of the office for the next week and a half, but
I wanted to send these -stable updates, since Kevin has a bump to
the reference BSPs that depends on some of the changes in these
SRCREV bumps.

I did light testing here, and nothing jumped out as an issue, so
hopefully it goes through the AB without issue.

If there are problems, it'll be a few days for me to address them,
but I still wanted to get this out.

I also have updates to 5.10 and 5.4, but I'm going to wait until
I have a bit more time for testing before sending those.

Bruce

The following changes since commit 5127df17c071b28134e6a77130824a58c191a7da:

  distrooverrides: Move back to classes whilst it's usage is clarified (2022-08-18 10:38:48 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.60
  linux-yocto/5.19: update to v5.19.1
  linux-yocto/5.19: update to v5.19.3
  linux-yocto/5.15: update to v5.15.62

 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.19.1


