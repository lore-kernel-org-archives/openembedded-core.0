Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E371CC433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 15:15:09 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.8886.1652973308748836034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o9jlsR69;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id u3so5005168qta.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 08:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNYW0Az2yL8zf4vXrUSxRtHMGePmThSHLiGWnEn8i3g=;
        b=o9jlsR693c4E3QdWXX3vrnnG/D5YGK9/mpvbnHxPAdIG8GfdKhIpYTyw5k6Q3fEwcz
         zI/8eLIyvGpw6wyWF+Zbz7V8bjxHrPa75mxMcGqwPbK+8Intrn3TjKYcNVSe8Z0bRTHj
         HCCoxCIJ46B+1hrsm5gSmnsMAJI+lCkP30QQIQFr8ybx/LwH4OIRiz59tDJwokHtGlVl
         hPV1vgdsTadOUxKOTGCjoyVPCp0NtKYxzEag/6eNzIrWKO60f1owzuHEcVZWCc2zxCjU
         XR+H3lEsuYehdLLYkoruSQjHE/D58PoxqwPZh48mZL8BHjU7/nPMHFlS1AaFcyKJsraY
         r9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yNYW0Az2yL8zf4vXrUSxRtHMGePmThSHLiGWnEn8i3g=;
        b=QE5X/S/H76iIeiU0UmXWxUseJKci6Mgy9u/RUd/cDIwJbP/pGkunBSdTLjc5lJdl3W
         PcQ3CrlGA9QKm5UCzwdOI8HVaeHcKUE3AjUcClJ0kAz8IF42DrBsbIPOY+XUwF4VeKKJ
         vNZHasYY1H2DCVltclAQ+YrXkHfqGoSVJfzqM1y9tXffLPajfnbrqI4BwkcZ9Gi2l3eF
         Pqb/qC33vSx9NomCpT7qo4LL5s+ZPm6dNfkd3zuCrcQGuJKS6pS1cgxuom1ZctZc4jmD
         LegMlRTzCfiTx6vlmmnm+Cgp4d6VOxcHDJ4jPFZTQequSGmD5IesWRYJpFvJMxiFGUaO
         TkTQ==
X-Gm-Message-State: AOAM5332jXu4E9Ivpn57RN3GvUPdlCj2aF+5tyVIQIJVuMLAUTOcT+iG
	Ja52EtOQXPBm9iotZLQVGXc=
X-Google-Smtp-Source: 
 ABdhPJzMyIZCgNLxtx/nwQn7Eqg5S9V5bnOKrLbnub5l+tgzc0t9ZzUuSQwVHWJqMEtLRFso70lQ1A==
X-Received: by 2002:ac8:5e0c:0:b0:2f9:145a:ddd with SMTP id
 h12-20020ac85e0c000000b002f9145a0dddmr2223323qtx.34.1652973307581;
        Thu, 19 May 2022 08:15:07 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 he17-20020a05622a601100b002f39b99f6c3sm1354898qtb.93.2022.05.19.08.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 08:15:07 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] kernel-yocto: consolidated pull request
Date: Thu, 19 May 2022 11:15:00 -0400
Message-Id: <cover.1652973084.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 15:15:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165895

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable updates, and a lttng-modules fix .. just
because what fun would it be without some lttng issues :)

Local testing has passed, but we'll see if the AB manages to spot something
that I could hit.

Bruce

The following changes since commit bd66a18eaa463c2eab291fea68039bf0d61c7b8b:

  openssl: minor security upgrade 3.0.2 -> 3.0.3 (2022-05-15 08:57:16 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.37
  linux-yocto/5.10: update to v5.10.113
  linux-yocto/5.15: update to v5.15.38
  linux-yocto/5.10: update to v5.10.114
  lttng-modules: fix build against 5.18-rc7+

 .../linux/linux-yocto-rt_5.10.bb              |  6 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |  6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++---
 ...x-__trace_sched_switch_state-5.18-rc.patch | 88 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  1 +
 8 files changed, 127 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-sched-tracing-fix-__trace_sched_switch_state-5.18-rc.patch

-- 
2.19.1


