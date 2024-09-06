Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 624E2E6FE3D
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 18:02:57 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.5450.1725645770485126547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 11:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XjLuhCse;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4581d15c3e3so2609641cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 11:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725645769; x=1726250569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVEY4SH7TN05jBIu5/Sw58owtR7HWdg18f6ooduzeHU=;
        b=XjLuhCse8H/Jl4zYMXj/03A/pj5ziYaLIxJ5D684rNhTcNco9NeJZvJQ/ePHJ/OJGo
         6aIlWWJ6xK9kwHNVoHhcw3cJYpl1FAk/L7OdDTWcA4UPfF9uePghjy7YEqyOwr9P+N9d
         9V5HIPy2Koh6O+NRcnUNhqZa+lQVl7Yy3HyuCmi7W7bUL/et45CSU/k9mPFrzD/2N4qp
         N3j0B4d3uGPDTOW70Tk3AbnZm/bdF1Kp6NuKwTOabBunjv69ZwQH5xFVXX7iLfZ397wT
         YbM8/YcxgRMSKSSjbTBnF5TH1szjHpX88j0AtXvFeOaROGSLFJC67U9yiFARXzgpUu+X
         WPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645769; x=1726250569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVEY4SH7TN05jBIu5/Sw58owtR7HWdg18f6ooduzeHU=;
        b=YFpZ2CSlaXH3nNZgx5l0u2cDeykr1Vl9wCsiLEpQSne09BpU5pJKzpzXmzQ+iTcRCr
         S5ATPHYdMlJC2L0KzQ2QO9sXFwEXF0hm5ihnMW5LZiba2SY4oX+kXWC4vQjomtOTJw0J
         SQRdfnE7udN+9LSJv/8cLeIXB4okSF+SoadsIXLah3yxNQLWr6AVx7l73hHt0uUKOTIm
         R0AwqH+exIzW8lI25XTVy7p68DQmOBlCFDeDhcK+1vy1nrwLkXtCGna1I09NaWadOYHf
         li/HBEB+zTWGHYRANbXDkJSZcKJVdp2wvJ+Yw46QWuUaNFf/jxcpJFlTU2LvtyVEoVYt
         YApg==
X-Gm-Message-State: AOJu0YztOiHMHRushk65NHFT8KuRmJlXiP0XUiWSqbUgYsJCQNw9hgn3
	2tF0KWhBkdzf4EjasNTEq5NBMxuFE/NjoxBur7ODCudHWcZC9lTeNR75FA==
X-Google-Smtp-Source: AGHT+IFg1vvXOctkE3YMWuVjxub08HX222Kcu/AKt69agqc/Z23YESAFCoG9UGeT2sdi7NhDLKnvdQ==
X-Received: by 2002:a05:622a:1826:b0:44f:e108:2854 with SMTP id d75a77b69052e-4580c6d8925mr39463801cf.26.1725645769098;
        Fri, 06 Sep 2024 11:02:49 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801a15393sm18136871cf.3.2024.09.06.11.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:02:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] kirkstone: kerne updates
Date: Fri,  6 Sep 2024 14:02:42 -0400
Message-Id: <20240906180247.376758-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 18:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204287

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Steve,

Discard any old -stable bumps that I have previously sent.

These contain all of that content and should fix the configuration
warning you were seeing on the last set of bumps.

As usual, let me know if there are issues and I'll fix them up.

Bruce

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.216
  linux-yocto/5.10: remove obsolete options
  linux-yocto/5.10: update to v5.10.223
  linux-yocto/5.15: update to v5.15.165
  linux-yocto/5.15: update to v5.15.166

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.39.2


