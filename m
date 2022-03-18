Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092EDC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 09:56:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.7876.1647597360915778158
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 02:56:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KXw9B0/i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id h16so3992575wmd.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Geug+e53XbDo3OJw08xOTafoD+74tDMBTz6A0f2mFnI=;
        b=KXw9B0/ibN6uZitMGJmXpNcN0bfwr4+++kq5PjQRKrTp4jouPXwhF1nYsa7D9V9Wbr
         tBPTN4atg3WmmMWMpkB6RYTkMIdqPtLfdyv2SS7xtkjPUs47QNNg3gl9hwqppJ8p5yGB
         Qao2GA2ZGK4tF+/oHtGqy6goBkN35twBsqMUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Geug+e53XbDo3OJw08xOTafoD+74tDMBTz6A0f2mFnI=;
        b=N3L5GcqWC++ADfr3S20JXMcNSI4WVxcedsKsXuQGmQ5CaGgs3cHtX4hBdD1YLz+4cJ
         mzoBFIiUXK8VBmxT03/IIphZmQdySuNCc8KYpPqCpSe+JJ1XGyDLdMot8+mdQaKMtu4J
         9GgLq6rcSgH76lZhZiavRtLSgCKr8dns+aXnRlgi9Ur0z0eEw4RFs/BVBumxonQ5NwvU
         3Etp8+rxOXtxov9z4gQNg/BhX9tNE0bQ4n4c/x1s6qoqYEiJ5UxpzAhMgOr6N2bF1gnd
         0dSB23sUkNDHUOrdND20tx4mBU3vDJkbRs7FYsOTBWxMwUIQEHvHzJeF0TMrFLqlqap5
         ohAQ==
X-Gm-Message-State: AOAM533EDWSnCQuuUNbKhFmdYQW/nSYBo8dhUgMY9SiKOQfAKZt9Mbv3
	ZrakZFYQV78uP52znA/qYygKkS7fmuQ3P0Db
X-Google-Smtp-Source: 
 ABdhPJyoqLe4btSi1Hy8rN0bthPcud62n2j6zCbLBtDB5JXg8sGu9gIKoRWrcLGwToWMtJ/Hg5NnzA==
X-Received: by 2002:a05:600c:3c89:b0:37f:aacb:cac7 with SMTP id
 bg9-20020a05600c3c8900b0037faacbcac7mr412698wmb.1.1647597358956;
        Fri, 18 Mar 2022 02:55:58 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm3275623wry.64.2022.03.18.02.55.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 02:55:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ptest-packagelists.inc: Add python3-pyasn1 to fast ptests
 list
Date: Fri, 18 Mar 2022 09:55:57 +0000
Message-Id: <20220318095557.1057406-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 09:56:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163443

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index c705b41a94e..ac3295d1aa6 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -56,6 +56,7 @@ PTESTS_FAST = "\
     python3-markupsafe-ptest \
     python3-more-itertools-ptest \
     python3-pluggy-ptest \
+    python3-pyasn1-ptest \
     python3-pytz-ptest \
     python3-wcwidth-ptest \
     python3-webcolors-ptest \
-- 
2.32.0


