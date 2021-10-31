Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A49C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:37 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.33509.1635699516620739232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nj8FzdnM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id b4so7995707pgh.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WtxmjY4HRXWQUQBzLRcRUPD00v+2Nzfr2tUrHpuKiZA=;
        b=nj8FzdnMmaz62DUQGiADBAWOU2kMRaDFJdFXwOmbr+EcGNH/dPbaxmSCACgQcf4svp
         zQ06v+Aoa2faG9SOEHNc/cAJE71EIHJamuhtjyNFPXfAniB2C4VbyBMlWsmT40Lv6OuX
         EF5IHLx3+/SudRJeYtssA3dpOX0qn0V4wvpnG97HP0gpBRkSJp7ywK1k9fPf3fwXDaWq
         5fp8OC15MFWGGfzrU+8FX2F6YwIHDT1MSEWIRUyUJq+Y5Me2nIQ4XNFZ1jNnBRs8fQo3
         TUoxa0zYVPqS4Mh6XDaGe0mRk5E3LHjm0FxXPiytJesf2HdL2OV9uuoE7PfxRkpImsJV
         WxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WtxmjY4HRXWQUQBzLRcRUPD00v+2Nzfr2tUrHpuKiZA=;
        b=0aV5VmLo0uGEM//Zi1ciS7609fgSiB9lDBAlf/oibdCoKVmD3ZF0SFdtnLhZVlVVY0
         rIGupHT9KkPMWrqRRQz+whXX27EPejTTJPSIem/HkS6fFaoPReQ6SX5otmPxanWHznbY
         GvdxwEYCDzotyKtPxFe8UEdMGsk49ypOp8rNjvRfhmz5gug+z006ToqgoZn5aHBrZjp/
         BvimrVWeTJgzCEsHpvg+/srqpAQ164bLZIhlE4FD3sX7z7D4U/5WSXQwpBbLW2SO511y
         h7zguN3q/1j+XhdGn6f1XECHW4jP/rFtpTYdp1026SwOdpM1ePyuboU9LGypUnc+8vcG
         po2g==
X-Gm-Message-State: AOAM5332G/z5ieWOEprKsA3pgjSoFTjHLobXNAiePRxgwmRhgsFGSncG
	B8dfYWmdEIQX0Yn5mJ98E225aQ5l0MZ8m4NTT5I=
X-Google-Smtp-Source: 
 ABdhPJxRvNkwi6PXMWytLepjLPK5g4QwfGI2+DjjR0+hU4eSuHILv8xkkAgK1mneaoW39nunKghxpA==
X-Received: by 2002:a05:6a00:1897:b0:47c:3554:52eb with SMTP id
 x23-20020a056a00189700b0047c355452ebmr23227770pfh.22.1635699515730;
        Sun, 31 Oct 2021 09:58:35 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/29] oeqa/runtime/parselogs: modified drm error
 in common errors list
Date: Sun, 31 Oct 2021 06:57:36 -1000
Message-Id: 
 <e60a4a831a427b43975edb8fcbf3eb662a79ecff.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157675

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Changed the following line from:

  [drm] Cannot find any crtc or sizes - going 1024x768  >  [drm] Cannot find any crtc or sizes

This will expand the coverage of the failure to also cover the case when fallback size is not set.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0569fa735458512d6e15aa3315218ecbdf8510a3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index 138fc306fc..30e42ed9d5 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -32,7 +32,7 @@ common_errors = [
     "Failed to load module \"fbdev\"",
     "Failed to load module fbdev",
     "Failed to load module glx",
-    "[drm] Cannot find any crtc or sizes - going 1024x768",
+    "[drm] Cannot find any crtc or sizes",
     "_OSC failed (AE_NOT_FOUND); disabling ASPM",
     "Open ACPI failed (/var/run/acpid.socket) (No such file or directory)",
     "NX (Execute Disable) protection cannot be enabled: non-PAE kernel!",
-- 
2.25.1


