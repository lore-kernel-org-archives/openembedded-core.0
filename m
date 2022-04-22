Return-Path: <komal.pal2904@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FC4C48BCB
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.7046.1650624413982413611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 03:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tj6X/8U0;
 spf=pass (domain: gmail.com, ip: 209.85.222.178,
 mailfrom: komal.pal2904@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id s4so5555377qkh.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8xaxIZs74bNHWwoZ4eCtq03cTUruwl1iaB718W+zMH8=;
        b=Tj6X/8U06ObFW5PXJkbd2UhDFJ7lzvR12hOMgXZykMzAhbYz+x3izsVf/xOIoZj+wa
         i0ie4oSjxHyoOH3kJsXhxkPQH6gBaPniyFNcb2AwZ8CVycihwEM4oeuvWhmHZTVEvsMz
         t+DLAQsJrCdzTOK3wC0jNfcNE3+Q5fg2JN+DzNG4i+juRUmHzzGe66xGoYysH2YMghYu
         DG3H3KvMp9RXajtDifWh14tNQYdwBfaTLA4j1wlB5MxIiokAJXHFFZ78TajhXdAR8y1P
         obeBVkc/BCioXoMD/zOw3opdFRoHmtdQGpTzwWdPtDpW9pYn+7ptEDSa3E+qXJbAvFrM
         I6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8xaxIZs74bNHWwoZ4eCtq03cTUruwl1iaB718W+zMH8=;
        b=l215Fx3aATwBk3SG09m31+oqa9bA31RoGXYHdG9r8WECdRjg++23OCJgclD5t5U6zu
         GUoTKy3fU8uPz66UkHWCZiBYcq8d4mLkXTnpPuowHMFILqPegekmxIVansxfVmh6kxxR
         LbKgFj6YMm1/OgW2LgJO106w0GbX09xRG5+MVBcyvkDM7zs55Yf3CTCybJvJWjn7FbNa
         JOC22PvIvcBtqbPqvFEAymaH3GUZpCgs5NeHGPgN6rR+dJCnC9jT7SVXnuRkH+Ahdpoj
         T8OGaXxhsfHgv4pXB5lxlP6L+Q7Q2axXm8+sSMQNZfv8FG26f1ZbIf9PFqpvYhS4QC/E
         wNKw==
X-Gm-Message-State: AOAM533eqtZxZBPC3PzpY5ul92iqV13qRsQqBFYyFjkFjVPSSvqtrN5/
	EGVcb4u4+6TPyGjUebGG6UCIgVuSglQHPA==
X-Google-Smtp-Source: 
 ABdhPJx1hawypyJqzOIW8FO214S6aOnPe+YlUdRIt69U42uzrompyPiGlNt5prqnx9p9YNLpOzTi8g==
X-Received: by 2002:a05:620a:1495:b0:69e:6de0:e8f1 with SMTP id
 w21-20020a05620a149500b0069e6de0e8f1mr2159390qkj.426.1650624412906;
        Fri, 22 Apr 2022 03:46:52 -0700 (PDT)
Received: from ubuntu.blr.amer.dell.com ([14.141.145.218])
        by smtp.gmail.com with ESMTPSA id
 u129-20020a376087000000b0067e401d7177sm765780qkb.3.2022.04.22.03.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 03:46:52 -0700 (PDT)
From: komal7209 <komal.pal2904@gmail.com>
X-Google-Original-From: komal7209 <komal.pal_7@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: ross@burtonini.com,
	komal7209 <komal.pal_7@yahoo.com>
Subject: [PATCH] ptest-runner-curl
Date: Fri, 22 Apr 2022 16:16:18 +0530
Message-Id: <20220422104618.3714167-1-komal.pal_7@yahoo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164785

---
 meta/recipes-support/curl/curl/run-ptest | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/run-ptest

diff --git a/meta/recipes-support/curl/curl/run-ptest b/meta/recipes-support/curl/curl/run-ptest
new file mode 100644
index 0000000000..4435f7dee4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+cd tests
+./runtests.pl -a -n -s | sed \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...OK|PASS: \1 \2|' \
+     -e 's|\([^ ]* *\) \([^ ]* *\)...FAILED|FAIL: \1 \2|' \
+     -e 's/Warning: test[0-9]\+ not present in tests\/data\/Makefile.inc//'
\ No newline at end of file
-- 
2.25.1


