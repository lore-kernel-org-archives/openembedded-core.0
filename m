Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10035.1792509088619075781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yc/WHwAQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a01933b584so24032135e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792509086; x=1793113886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=awZI/RxmEOtndQ88kEFfQ0/OWVAI4Frczyiw1E2wVPk=;
        b=Yc/WHwAQgURkwmSraqru1WpeJiU49QgcEZqNJgyPL/PX8uvvkQmDo06UgtHhIjgHO9
         WDDJ9LAnVFrYwloONfFhFMmZM3a393sktVzEiEPsa7kZie+86FKdR9lQu8GCSsIoYc0G
         zHm0MBYvw0fW/QYeE9qOa6UBZihGuKrJ7LxGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509086; x=1793113886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=awZI/RxmEOtndQ88kEFfQ0/OWVAI4Frczyiw1E2wVPk=;
        b=0wEpPj3sTInpFiK6NzKTmJE8hHm1FAciFINleGQORqHPRaIGrhfXzSA24pTI4AlRlK
         vQgkugoUvw4PBzX4N9d5HECUaH6rPWuly8UUHaOGBiYo1zkWh7XIANFxuw1XBZ/azN9U
         qXk4jRnaPL6ofNELbyiN4lADX7rRbB9Wm+5TfUl8qizi3PNXb/fA8T6fyR8RhTiSLipP
         CDMxHsXgnzsuIlm/DmxKLDnTPa3R1l5/g24vhGbvupqZY/obaNoTTMV4ehWA1GcDbp7t
         7Q899nUPD4oDlz7T4WkUML+tyqyjCejOBAp72XqxyBIW5lQDNjQCyFb0hrLkVJsDpLk8
         uq5Q==
X-Gm-Message-State: AFq9FYKyA5L+cD/IhiddFreOza545zFbRNgxXXIf4/+lTDupQVG+SsKO
	iqJSZIPYS0xsRrvs878IgpCs0bpJhyRhbhzu8B8JFNWkjBjSQG9iqiGl7Nni43FwOe12+d1dRow
	apC0u/e0=
X-Gm-Gg: AYBFou3+uovgRK7nxwJglRJqO69toy//xc9Rd+AHX71w/ntv8f/jFR2dwVZfe2HWGM0
	RigW+Ht6LVYwaGUwBGt+BuX6k+YHpaPGS12leO7czPTgkoIPRiKqa5LvAVmas/+OZ0Eo53WSUVZ
	NkH4YBdGoi1xy4g3otAxU9jEIdY0XPuI35Of0stieSAETFgOHSS/+CvYMNUp40vCy5r/ZRtBcC7
	buEVV07U++fpBsgI14Pbuu79nH3GI4bUh/qGyGEm3vvEoIbm4Ns/czYwxa2CyUNsOLDWMPYyvDk
	VAb6X2KavGW6Y0HoodmAV+ZEQizTMKFwLdYNeWSWRS6IFUaUVfYenMy9wYswoKdcxJDHHUB/SGb
	2s2yLcUDDxFobvcLAiQQcSo697690Xf0RtTyR7jMpkLREYBtUixUYgch/O9P4Pq3Ih9qdF22ZVB
	W5Q1ZNV1P4+SmUTK1hrJ/UDe3AQLX7uSmDaSIWi7eSAAdKQ6q6vZ4f6sZBIBjSg4Rl9acn9iqsq
	ERFFkNpgpwttgTgp+BoC8NcRrXaM8klkWyBNg==
X-Received: by 2002:a05:600c:8b6f:b0:4a1:d307:d578 with SMTP id 5b1f17b1804b1-4a1d75e6d1amr212633325e9.11.1792509086345;
        Tue, 20 Oct 2026 08:11:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:afe4:94a7:60b4:8f6e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb95b390sm1773185e9.14.2026.10.20.08.11.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:11:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Update to include a header fix for ubuntu 22.04 hosts
Date: Tue, 20 Oct 2026 16:11:23 +0100
Message-ID: <20261020151123.1839050-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248301
Content-Type: text/plain; charset="utf-8"

Add a missing include so builds on Ubuntu 22.04 hosts work.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 15d90b4acaa..935f69fb038 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "6347db607e9560421a75af6bcc246179eea428b1"
+SRCREV = "3eeecd50244b6f2267a993992010849d7a0e9847"
 PV = "1.99.0+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
