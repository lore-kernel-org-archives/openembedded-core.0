Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.25171.1591602527347520573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=O4qPWSA8;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id q13so12602672edi.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q0vwt/tGmQoO6dAmA1EjZddYMtuQ7bKpgnFYuZ+bsXw=;
        b=O4qPWSA8Dpe5dVKJy58ZIcsfC0Sr/ivSgBP0svnwjUaeLdKfxVYLSK5dDm2Nf8nv72
         Hiut2L9EgbSlHUYSHzLLsIXo6vDCENCT8nDS1WYcSnRbzYAJl9YhAUDO69pP1gmBCefm
         R7xaX4t0RlDjFq6gltld8vnvh2I74hKF1GhTdcJtVGTS+EnASspi+ItsRqHKWBPggYk2
         LU8VjO+tH16xk/gZ0fi0WCz0IKJ2FId0iMF64JNQx5vtMdA4NgrfPTqNdkYIK6oNM4/W
         qnOHDPasT8yKqvfyT0YDnf08XvILYXWEfkPtlgJhkuLhUwHZ+0jCfgP20jUKhQRgRnjW
         C3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q0vwt/tGmQoO6dAmA1EjZddYMtuQ7bKpgnFYuZ+bsXw=;
        b=adv5KwtzoJWxF7qacq3AJUCGJsvDvAipNcD0IQ/K4MAWVUFsWVffc+c/IaWdOxBdnt
         nnqui0zrc+mMwaWX/G2EC2SS6DFOmMs6vMt1zWoKZ/30kM4eHyT+tVUU9EqSxVcWyKAE
         t00qVyl10SOFwFDYOfFDozV+2CeA3XvfMaJii3EC9ZXLBKzPK9PwvxaQ8289G2bSPamI
         F6zw0lV9YOhcDqnW5M2nwRSdnDGevlq/7L1P4KMKQABAKXGG1isroBw5vI5X8WdKUbT4
         DwLJ+SeTH7GcKqlU9n0rrCkvMnIHGaRcqaiW+LRxReExUw7VA9S9D++wXnPzEO9rkuR6
         OUng==
X-Gm-Message-State: AOAM531dia2VJcUKVzwJ0mBsGWvQujrrShnsIVWjE8yat7JuxjwPQjkn
	e6j0nmP1yIRsQRE2M4ERUldUw1ZLkXQ=
X-Google-Smtp-Source: ABdhPJzB0dBh2HxUzcMcLzk5+pLiwGY+Cf7uNk4lZBR0U/KPzMNo6GcaZFhgt+aED9f2NFoYeOo/Nw==
X-Received: by 2002:a50:d785:: with SMTP id w5mr20223959edi.212.1591602525647;
        Mon, 08 Jun 2020 00:48:45 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 36/42] ovmf: update to 202005
Date: Mon,  8 Jun 2020 09:46:53 +0200
Message-Id: <20200608074659.7051-36-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index c089627822..91c1b6ba14 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -19,8 +19,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0001-ovmf-Update-to-latest.patch \
         "
 
-PV = "edk2-stable202002"
-SRCREV = "4c0f6e349d32cf27a7104ddd3e729d6ebc88ea70"
+PV = "edk2-stable202005"
+SRCREV = "ca407c7246bf405da6d9b1b9d93e5e7f17b4b1f9"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.26.2

