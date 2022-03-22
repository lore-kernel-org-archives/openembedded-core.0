Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B30C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:27:56 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.14521.1647977275052195722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bMOzVmTI;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: flowergom@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id p9so24812501wra.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nF0SkjcbN3AF/tsaNVqgUcln1F2aVB4sWR1uoRA/zOE=;
        b=bMOzVmTIYKD6wxLD/kyfrMhguDXjDuwQ6IuD1F3kR6GFIELSlBCHc9S2u3UXFj8YYb
         CI2IPe6bDFPk8FEpLnLvoBeFZnz9zmvVlrtXX+havPOH/VPo39U4gZomK2r55D6TN4K1
         jMZczDa++ZyQ/lt6KcSDStg0Bq2zs4rpD0bv80sqJhYDbKGZlu4c+aHV+NZIl2GkVo5j
         At0R+p4L4zpU7w0aVBpLPQ7ri9Qv8dkDyj0rGWWLUCIZ2VgxFPyytJW6FBAY6yqk427n
         Y32G99HvBahSb+t5lvrcXQKrQKGk+5FRqWS0CrotFV/1aHisMJncMqWye2sCPd/7J4HU
         6jtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nF0SkjcbN3AF/tsaNVqgUcln1F2aVB4sWR1uoRA/zOE=;
        b=QyGfMMeYxwIVqXfrqbAJnxF537xBICV5AkBiIovKlN9iNn8CWPcZQR+KjuzYb+nzUr
         x4UxlKvFiiZ/V/huK/pMh9KEey4qVApPH/rT+M6RCKzRxvaBdcAuq/kY2AK3+7rMHIEG
         HVuFpjgX8POKit8afwqspjTBA2OK4ZrNsj6zKWW5bk1IJ55gZp3qxXDQWnnx6oiylZ+C
         QLRXd7ffAQ33x6aM93ctofIiA5/UbS5lCWnjo0WgsXpVXlfHWwmxf6mmfLn4IElYUboN
         pEwJ1DRaRxIGHRyE/JFNA7PEUrsCcLlNZ8l4xa1GhtzDO7z9L1UknPW7TExzjOfHl04z
         +JgA==
X-Gm-Message-State: AOAM532kTdvLWqLU/5PdNmaG/Uj67w4Wqo73CgCaGfUYmF/O3pJgeVdc
	87/psB3nwe1q3HcKQg8A+kXC/yZTNvtjMX+p
X-Google-Smtp-Source: 
 ABdhPJxm6I0sXbsW2YAwud9YrZOKNrYyAkjCM+ryN/8qtMKWNbLWrMfWYDSUbQSkBKmUwF4Zy8gN7g==
X-Received: by 2002:a5d:624c:0:b0:1f7:4b77:becb with SMTP id
 m12-20020a5d624c000000b001f74b77becbmr23294590wrv.594.1647977273133;
        Tue, 22 Mar 2022 12:27:53 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a5d638b000000b002048a77636dsm2249442wru.97.2022.03.22.12.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 12:27:52 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH 1/2] gnu-config: update SRC_URI
Date: Tue, 22 Mar 2022 20:27:37 +0100
Message-Id: <20220322192738.13527-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 19:27:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163568

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index df8947e425..05cd6a1e63 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "5256817ace8493502ec88501a19e4051c2e220b0"
 PV = "20200117+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1


