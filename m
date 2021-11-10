Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF00C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.329.1636573184465671629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FkLHSsjS;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id d27so5892121wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=znCY8DJR0FSe1+ATTC1l7wU9dBTill4ipElMWyevR6Y=;
        b=FkLHSsjSAS4Mrp37B7QHtrPia3v5QUrg5c9wnFmRnievj0mJlHeNqqBhghpDD3OaCm
         4MQ4l7uLG/vt1AvQMDZfqJZRZuc3v9AU4vhq8Sa+KXQ+VFVJ5ErAviFqyZKhcmrUBIQb
         R9cPc40/TirL5wnJekVgzmx2lrrrFBrUOg0aWoWqEF/UQzoxtvV8pVNq6lXrvbpicqhL
         xqV6VY9bU5KK6/vGOm57gr/Da5X3E7bqePYNG1fEen62v+kOuuLN9ERt3A3nXuPEVCfT
         Ap1cbkLxWjhDdI22hKnQQekCCsuMf5kBf6JPC0i+uj/mJ6u5SHZF612Grr/pbZ4E4b7S
         hiNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znCY8DJR0FSe1+ATTC1l7wU9dBTill4ipElMWyevR6Y=;
        b=bqP+YWCgmaldOjGZIvYEMIJWN5f2bX2bXcfVq/HIOmpt6o0aqVp8U78rsMu/7Qowt7
         FievVODFdMIIUKNRPli+obgYy0/5XWUdq2vuqV96EJ0Gv2qskjhqc+3FeVKxeGAcHZov
         8CcnSLCoMKFNN7Sno/OI/qLGk76RJZebFsqjY+uLGNXyteBfjKXWx4Z6yaj11ko2WDPR
         tgC0BTyqBdOVi/zT9Pu+4uqt/fik2fFzFeX5HqQ6AVHdt8/tGxhIj3grW5len5/pRmRJ
         vKgq6FhwZtKQQRQe3H3JnooxSAsuqKSBhQ24KRT49pFrmbC8Bfhnv2X0h9p0xEFK54KQ
         sBrw==
X-Gm-Message-State: AOAM53050yGkcUIgC+D7XBTob/z3eJlF8zDl6Ge2oZSLJEmKdhmB6LFc
	CReLH/AefH+Qm1AZpWFZrm41SdhT8Zg=
X-Google-Smtp-Source: 
 ABdhPJyY1b8y4HEcbCh499VyZ58dkxyIvzjZ86aa0FsOIPLfgFCG60DLyZQ50Cf8ZXmbxsW3Dg06dg==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr1969556wrq.16.1636573182960;
        Wed, 10 Nov 2021 11:39:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/24] mesa-demos: mark glew/glu patch as non-upstreamable
Date: Wed, 10 Nov 2021 20:39:16 +0100
Message-Id: <20211110193937.2606747-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158087

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...figure-Allow-to-disable-demos-which-require-GLEW-.patch | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
index f6b59a11fe..e31827d4a3 100644
--- a/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
+++ b/meta/recipes-graphics/mesa/mesa-demos/0003-configure-Allow-to-disable-demos-which-require-GLEW-.patch
@@ -6,7 +6,12 @@ Subject: [PATCH] configure: Allow to disable demos which require GLEW or GLU
 * in some systems without X11 support we don't have GLEW, but
   mesa-demos are still useful
 
-Upstream-Status: Pending
+This isn't currently appropriate for upstream submission as glew has
+been replaced with glad there; glu situation would need to be re-assesed
+when upstream makes a new release, requested here:
+https://gitlab.freedesktop.org/mesa/demos/-/issues/22
+
+Upstream-Status: Inappropriate [see above]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-- 
2.20.1


