Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.488.1621543749630599097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B2yGHIYC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so6000640wmg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4q0jPcOdHiXB69A/uw3uuOgBBcQ2/DxAGn4h2kfdcn4=;
        b=B2yGHIYCtucCE12FHKuT8rRvwux9vajJk9OAIKHEhyEoRwSb1tGgLxKK8hfLodivLt
         uHubVA1/WUlk7PV9wrsE6OkbSliIyuVLCnLeOWUidE4mtkrUKTAPqa9QrkBo5W05PogF
         B2zBk28MSmJotqcdKXbVuwJXMNkpam3rW0oKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4q0jPcOdHiXB69A/uw3uuOgBBcQ2/DxAGn4h2kfdcn4=;
        b=GvCg9uW0a9qgmj9kMElsQwEKbFDKYwdFtvRCk77LDG2Yja/ul9O9vgukRGun6AUNn3
         hIVLc9BXNAXTBScr7DVu+KklxGX7VIAykWvJ7zwlWI0UhKfc/NrUpGiHMgEHD1pG9ZRT
         inRaZA42hFxs5s7KN8145BFmiEkqx7/K+N23i+0EjMGX/T5OQmBkiMeKdhXcunBrKa6O
         FwEvBB2s6mitwtj7orGsJYgjwFSvyXTPYP/yMKtYqCXBV7cajBs0piz32F1XU2XMZZac
         mKTQ6BXxr/TKcYeUpmn1XBoR3w/LRIbtLSzHY/ClG2Rvo1zVoWLKbU0HID1z07mkjFxt
         mxag==
X-Gm-Message-State: AOAM530/wF5nO45qnWfHFrSCMeg65qAkssJqNTPusFRrhu8n6VbBdmD/
	Y6dW9m8yHZTM0DmGmttata4ctK0QfYOK5Q==
X-Google-Smtp-Source: ABdhPJw28Y3wF5wkUJsEFSMw/2a1gPKTYg1i/9FqFvdB0Fbus7okmn9iwq0EAMVNXeJ48oeEhlpO4g==
X-Received: by 2002:a7b:c0cf:: with SMTP id s15mr4628456wmh.134.1621543748163;
        Thu, 20 May 2021 13:49:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:07 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [hardknott] [PATCH 10/28] libnotify: whitelist CVE-2013-7381 (specific to the NodeJS bindings)
Date: Thu, 20 May 2021 21:48:44 +0100
Message-Id: <20210520204902.2527687-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/libnotify/libnotify_0.7.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index 1ff4b2e15fe..bbbd72193e2 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -30,3 +30,6 @@ PROVIDES += "libnotify3"
 RPROVIDES_${PN} += "libnotify3"
 RCONFLICTS_${PN} += "libnotify3"
 RREPLACES_${PN} += "libnotify3"
+
+# -7381 is specific to the NodeJS bindings
+CVE_CHECK_WHITELIST += "CVE-2013-7381"
-- 
2.30.2

