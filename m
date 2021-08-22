Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.9761.1629636672116223248
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H/YIvwj9;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id e5so5227459wrp.8
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B71nPGLK0XPVPVk/Jz2dWiqYuA+kPih2YUVqGn5Ldjw=;
        b=H/YIvwj9i2sHhYLwFvyXwAM6dnKqG9wlHzX9B3Jw5tTnxiUBHSjQG2KfkpA3twzgJU
         T6qlGMLX7Yt3Ka3z7ylBh4ZfXoCv67LPkGS9Utn4THpaFs5rhJS49t0WLT17TCrX0WYw
         Iy3ijCdCzGvOQhoilLemf3/n2LFVO8pUJOUMjnpG/c9bojYF+kyXiBho3Lv3wVwRqR5N
         HKQilVZMEyx0gbh7o3gNfp5TkoMeiU8BnwLFg0ZbIZPUnnDgIyPo3m62njlz2W/jXmev
         18oICLs07FWW8LR89xlZG4Il00CtGHjjcnftdez41G/Xksf5gB3PjgDCku0xlnJSYxfk
         9APQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B71nPGLK0XPVPVk/Jz2dWiqYuA+kPih2YUVqGn5Ldjw=;
        b=Gsf9Sw/7JpRuwF4Wng6LBDRcf75QmEbOSFmC3x1I6io2JfV1/TfiStMCcgVzMSFx0c
         8iUK+TiGtKYIw8QtcCd1zoQeNg6meVh/VF16Si+DVYyMaVcXwj17PpgoDrFdAvzTaaGd
         dyXvgXP4wwygzG6CJ6Vty0hGJozndJlosIUUAQ6wO+l13zphlijS6RaOfbPiPtus59wR
         IzIMNWbT7W/o9/hCOO2Bw7+usfHVsNxsNr1nsruPvMYCyKiiE3H4VXz2gigqoNaQJYw5
         J6fOtt4USVK/cx/0ifvwy6kAFt+gFM0ceEcXZORR0FHnJ2Mp/kmpxjzt60OFfFt9OpIi
         NEcQ==
X-Gm-Message-State: AOAM530we3KXfGYM8ub4e81kdXyLNgoxJa155mbeGQ3Z5GLqff40UtTe
	MmfRY17RUi6yncGGXpnUjwOYqyQmli6jWQ==
X-Google-Smtp-Source: ABdhPJwF9mpOQ2JC+v2t2ClKX5GWVp42NRHD2Zgy+vnX5mEJu8iJ9NR94TS5KELwiclUUPq+mks14w==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr8335525wrf.319.1629636670585;
        Sun, 22 Aug 2021 05:51:10 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/55] tcf-agent: fetching over git:// no longer works
Date: Sun, 22 Aug 2021 14:50:09 +0200
Message-Id: <20210822125103.310416-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 48e6e02f05..c186db6814 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent \
+SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
-- 
2.31.1

