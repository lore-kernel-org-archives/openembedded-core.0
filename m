Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B19CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 14:44:42 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.102713.1755096278630818992
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 07:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YIZL5qwq;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-af93c3bac8fso942770566b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096277; x=1755701077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kF4fMth3FsMyimbQxGztf0fMbKWyK6KOa6YVg6Wojzc=;
        b=YIZL5qwqxuXXbQGbFIlJ2Uxq2S/lkKCcKMcDLptEtVSvHm/Wo+j5MKqUD66cxxZ2Mc
         X9l7BS60HVGxT1KwQyjqjvTFFciz7Ys4ox0Xw5CfPhVfWxcl9prUPaKSln7uUEo3jFnQ
         9dCPAEQ+CyIEFbPfDb/kzSETxeH2hBu5LQoQsg7n30jyfCrfZ0vrtrAdOxJkQGs7MBJx
         S1x5r8zsi3zA4ykvikpGrPHGj4cNHvTshsSb9EsORYYW/vMLTVug0NcVuaYlMMldAmqJ
         Eiu1w3FQwTY+coK64XxW8P2OfRMsMP/hz+Rbg1jWl7vt2+/Y8dNTVqmclG7/+NMQe1tM
         n4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096277; x=1755701077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF4fMth3FsMyimbQxGztf0fMbKWyK6KOa6YVg6Wojzc=;
        b=oyrl6pqSM8N3yquQR/QfhOcSvfsRiEo8SjTWBj5Sz+rLGME37oCHGmPy8VIFo13kvk
         dkR7zkwC6vRaoZqmiRhRFOxKpW/6nScDlnIWIkTGsKbHj1E8MHikut39ekAvlwrXvb7x
         CF5f4JPi2BBU51jmJ7EPdiyaMIPzx06PY2NGTmB8F3/FFxxa+FvoPx9N4dW34bnbrD0y
         I+c3OVQ48QlBkA7hhaXdsnEFc4oFudcu8OyuuJEOI6R91zbgEXwVt1mcWlEqtLlfFZxg
         74QVFoChIMSV8cRxSro0y88u/SJX7xe2n8fhSAMpWLo8rOn5bERVDCj4LpBkA4DOSaPG
         /TtA==
X-Gm-Message-State: AOJu0YyrKkA755raPKGtlXvDBafkQQipVSm9F6RT9X07TTEIfsxSu+4T
	rlP99+JX1pny+NVxktvKHQ6X3BWqPex1Vq0kiZDv7YcboZD+JVs7yZXrezZ/Pw==
X-Gm-Gg: ASbGncsUEFKjvwsVGrbI4J5pWJkZpSMKwN2JiemeKrCeFQWhDGlHh2BMZwUOcqvQHvr
	BJd7IqckPZ57d/Vm7YPLUyIyFLXqpVnq3ZtVV9ASXYkeEx6MmmOvHwUGZQwLhN2816AKQYFDETT
	lqzMGUNbAGxLnwwdEhMGaLHplhKZZjFYIY3iRvLPrE7KO4TcMYRBo7G0boMIcr8I65WFerYVCGz
	f6RID31WnBefkBkgo8ysagR0HI8wk8ZXX/idcwOK7F20IfR9ofsXUkVH1i3vExbrl8ec4ixR6TU
	2fNFiqRVy5GeFvPWI1vmM0Kym6Pik5ZI4miplTwhKFkdxEzb0pFGYq65nKHSyOYXux3MagQS1xl
	YpFd65nGrkdt9tEEWXIkVDOE5OMYMLQ==
X-Google-Smtp-Source: AGHT+IHbdEXkDW3AF+DxL/7hOS9esQnJEe67j/KEbJV6yLFnSmdE0HiCg76nQUqfF412wdiQ5VXYcA==
X-Received: by 2002:a17:907:72d4:b0:ade:3bec:ea30 with SMTP id a640c23a62f3a-afca4ccbcdbmr304853166b.1.1755096276586;
        Wed, 13 Aug 2025 07:44:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a243619sm2411996966b.129.2025.08.13.07.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 07:44:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] kmscube: update to latest revision
Date: Wed, 13 Aug 2025 16:44:35 +0200
Message-ID: <20250813144435.377780-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221813

Changelog:
https://gitlab.freedesktop.org/mesa/kmscube/-/compare/311eaaaa...afedb425

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 013fdfb6bf..fbc7751830 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
-SRCREV = "311eaaaa473d593c30d118799aa19ac4ad53cd65"
+SRCREV = "afedb4255f380bb2041dd2100ed7fb75487a96dd"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            "
 

