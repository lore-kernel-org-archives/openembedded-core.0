Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.502.1621543754686192287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eFsH4YBs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id o127so9946379wmo.4
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Os33RxecYswPqABWKBIq1ENxiT7WIN48J46xg2KwDx0=;
        b=eFsH4YBs8JLrPsj00adZnsGjjmJ+gAI7coJar02sjk3nwuRAblGlUOY/ZkF4NTnlIN
         F0fpMsfSDyY6gEYA3Sdv5ZUKfJuyeRhZjmV6lm7Vv2vW4ZYYS6ez1cBHSwM5OrFsJZDg
         f8jtU6k61IomeDW1OlSwkTiUAOox3nXSoeMvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Os33RxecYswPqABWKBIq1ENxiT7WIN48J46xg2KwDx0=;
        b=C8PZv0LRXCnPnAbP8qggeNu5Vg3gZ35WCuF5GKORrdfPIsZU6qX4qCcOk64fE8eeFk
         qtV4d2KWs2bws24y3Wu8ubkF+OOzyL95ckF95IS8yoAzksXU4r2ufj88chAPqMIHLSeZ
         H+OcZcYK0XvvZp2FLguyRlLIVj7QeUJEVPeCVcjRii2q0W+b5TSEE/SS2enyCPKQ/dxM
         fM+427Tcznt2hTJrtCxf4BBp4Wv9X+qmqkivtgh/irsKD28QzoYFG7f83MCFmrB2KcVR
         6RgGp3y8Tw541LzXu8EbNg0DW67FFzJuXLZJhRfrYZqtWbt8X9jojyXKGdfZwJoJKWqh
         iCag==
X-Gm-Message-State: AOAM530a0jQO8rlFuARlxYkTDMGvVh9XnU5VhloX+l59SrWLCDUeDqSg
	2B4Tawbmm+HzZUYHIh7CMq1Sai3d9nbNVA==
X-Google-Smtp-Source: ABdhPJwnZJT44yNSjVNstF1F/kHyKx+rpZGZz0rAcqa0uwKTP9lRtJKEXtPsX/KUW6u/mbSkb5zmWA==
X-Received: by 2002:a7b:cb88:: with SMTP id m8mr5443792wmi.154.1621543753061;
        Thu, 20 May 2021 13:49:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 18/28] openssh: Exclude CVE-2008-3844 from cve-check
Date: Thu, 20 May 2021 21:48:52 +0100
Message-Id: <20210520204902.2527687-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CVE only applies to some distributed RHEL binaries so irrelavent to us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.5p1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
index 41ac303d38d..c6de5198849 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
@@ -34,6 +34,9 @@ CVE_CHECK_WHITELIST += "CVE-2007-2768"
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
 
+# CVE only applies to some distributed RHEL binaries
+CVE_CHECK_WHITELIST += "CVE-2008-3844"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.30.2

