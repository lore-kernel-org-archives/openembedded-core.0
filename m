Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web12.20560.1621847647428116897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCCMXsjq;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id h16so31055093edr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvOErP0g8kHgEdFPWrX0Sl2prJjbkvaRSK/ztITjqNE=;
        b=DCCMXsjq42EqtPqP9njEPjMLS2MSmeAVkfX7QMePcWhrC/wIzztuDlpruNlCsHGI8m
         S5K5fLXXcLXA3K8bs45yiD0QnsXbSptY5QpptWLVhfcshCvHMOHJs2mwhDssUl4ZvQ1S
         cKIL9+zZXkJSRU1OLRNxdNoeGI6bFmZwFEt1JMi+r8yOAjZLeIQl0yUKfIpTtETuYeBV
         /S0+GMgzT6Ov0SWZ78hWg6emRakPX0qeveHsEhtGVN49Zjh1ChUrx8bff60Vtcp8GKa5
         qkrZFE23+xEc6afSB3ONu2nWmZmrlsB0uDgl+fj8RIAu9S4ru6eGMHiA38Aq1aGVT8v5
         yzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvOErP0g8kHgEdFPWrX0Sl2prJjbkvaRSK/ztITjqNE=;
        b=XwYy+w44JigSlBmX0b5v6GGNMJvWhVLBuT8eo1t2DSIchZrkfMsbp9X7oMTHKD7TP9
         mmOGUruZZfBp/b9eHJhjqii5mPAwaZASm/p0u1MVpnUBflUhhynPR3FNWS2mZx9y6Umx
         UYkiEc9f93SqCR4caqZztYbL6UzVEzQIIBpZw5YZm9pG6fUkNLGWGp/vVsomDu5W9Moc
         p6BRVQeIIAIILsb5u1kH3ZidWIPDVAAULiLkY0vsJBsQKgLBS0MJQ3n1LmJhWU9mVTDT
         /dR7U5sKwyjwdo7asTIoeSUOyWNfTDTaDLa0PF/Wv8iSJq2TFXEZDfaseya/SJWXPVDO
         GDSA==
X-Gm-Message-State: AOAM531IqOYyY6PcxawrthZNTZoUtzW8qva5JAWhE3WfrNKxVosMlNHm
	KQmqVRBIe8oQN91VALE31pJAvRzf3Sk=
X-Google-Smtp-Source: ABdhPJy1sESZxxIdPk+0wCIGppBE7lWEDK8b4Taz8LZ3CxZv8iyrPoVd6ZpR3LeWnyvQQbyta6sFVA==
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr24362813edr.181.1621847646065;
        Mon, 24 May 2021 02:14:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/21] gnu-config: update to latest revision
Date: Mon, 24 May 2021 11:13:30 +0200
Message-Id: <20210524091347.419253-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index d4ec4593fa..8d7d6ac3ee 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -9,8 +9,8 @@ DEPENDS_class-native = "hostperl-runtime-native"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-SRCREV = "277b4ed1776f721145b2649d888f1deb445fecc5"
-PV = "20210424+git${SRCPV}"
+SRCREV = "92fac9b5ceb9f111a04d7f8f98831570e77886c6"
+PV = "20210522+git${SRCPV}"
 
 SRC_URI = "git://git.savannah.gnu.org/config.git \
            file://gnu-configize.in"
-- 
2.31.1

