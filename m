Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3722.1793405745368731196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=jwcWHwtD;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so10155525e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405744; x=1794010544; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GhzQq20hDoGDDs7hMeXH99a3kdjWOo9os2Se3IBuYwo=;
        b=jwcWHwtDDGKFrmAzsJmdpMRLt180nvXybiBsXw6XDjOSapur35rbe6GGrZg95xfDGS
         aFnRcK+t/DO1J1sxexWILHvGJk77jNbQNJJhictXMT4BVqjUlc//ob6vlC5GPqfJLht+
         Afs+S2Vf3iMqc9WSdMG7RUgiH0gU/jCsG6lSP15bwxkSKYGufmHCTyvTi8F8R8P/Porz
         6qzKnWauu1nENSih91r/Rhh8rmQNh/9E9p0Bc9eSoMTcLB5UOu8SmuL4XgvBh3qbJm+R
         0eLnvhIyTn49amYfhksmRwAHhyfmZOFS/HFHVI4PmkFKUzhe8jxsDNB6SEzhDtmcMS+m
         O7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405744; x=1794010544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GhzQq20hDoGDDs7hMeXH99a3kdjWOo9os2Se3IBuYwo=;
        b=qhr+DSv4t7CWzflDj3Gn1pTJgPPYVbi5VbKuvNiqxM8jP8p/hsF6YOBhrW5b3dq4qg
         8HDF7eo+JU5QuYS64bOFayeZFgn4i640u7hguYRDa7uwP7v5B4j50SC7Z8ARSBdrFx+y
         dCGx5MQvMepV3s3RHsf0Z4TCR3h2HbpjH5IOa/DiRwY7X6CrYfgBLQRmf5vadhLGP3ee
         iZEyBtYIbp9mdYpu8mloQ+rVnG6lpt9/ZbYcM9aSJX06EdsesEacdPmDDZzKNkym4LD/
         DtJ+o1ofEEPbKkmmPQa1vpld7KNx4EBCwduLWC2dlcCuiSnTMFUF8dK0MiW8yDOrk60d
         076A==
X-Gm-Message-State: AFq9FYKFhMnMnGu421Yz8WB2TzfbRQS5AcYFPXsmVVKLfwXPv754wqko
	hVpTFRXzGzID1JHR1gnhLpotSutUESacXO4wVVnpuL48qpVytPuZIjJUo5CW5SAkhjGczWIiO9B
	01lazPC8=
X-Gm-Gg: AYBFou3jvPWEfSNoYTjBEBk1k/AmoYLZUqKnlAXoYvcI/nXhOFLTiLXlwoGrn8opS7U
	G8mbRnOLCpgQi18WSNoOOFOdjTwOe0lX/AiPm4Dt1q4WNjZIS7lO+GKpYGcdUZLNR+t4Uqpcp6j
	QNUcF+yWIQg6in4cVE+Ng/oifh7NmXvRIxf0uOZHJBCntdhSewHUeF5NXmCFep+f6iWWS4Yinxq
	6MtPafsn0eEzxa/ZrQVT5mu4edNc2aBLbjPprg++wM76mk+PhXhkx/yXdEA7+swIXkuWqS1hPO0
	+8Yn32Z43GxvJigCjmhteWUfNdWsIMkJl5cdZt4NnM0ykSPdZtn3CiBdg/CJIAIjrE6Rw3JBhnx
	yKbDO2PDix74d7MVxrj7ViCD7pycM6x7qYlYj2FV/hcmSPiq/CoPaEh0MJytG/jIoDj8M2V/1EW
	t60NGWAY66mw6/H0UUgc3UB3lOr0NlQ5CEGqdKQCtw0YVjXi7T29Ov6IP2U5OY9a6NV079AMx/A
	AlRu1UvU/Qdr/Byy2AWpamz8EUdS9tP0zUiV0ZMGgFp9h8tyRBxmh/40eh/CsjRAGyscuBcl7uM
	SP5XnHGsGhND2Cz1u6yASp6d45d+MfF8r9/mAD5ThpTqoWDdVvG8xYoTyKk1nKu5YVLdmR97y1z
	4/LddYS61C/bYKJ76qbi1V6KeqYxW
X-Received: by 2002:a05:600c:1c06:b0:4a2:fe11:9a8a with SMTP id 5b1f17b1804b1-4ac121940c8mr112451065e9.0.1793405743716;
        Fri, 30 Oct 2026 17:15:43 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/55] scripts/install-buildtools: Update to 5.0.21
Date: Sat, 31 Oct 2026 01:14:22 +0100
Message-ID: <7474522691c0cc9e520f2b9004013b183c87e328.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249075
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

Update to the 5.0.21 release of the 5.0 series for buildtools

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index f33f192e468..0094f7c3a8e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.20'
-DEFAULT_INSTALLER_VERSION = '5.0.20'
+DEFAULT_RELEASE = 'yocto-5.0.21'
+DEFAULT_INSTALLER_VERSION = '5.0.21'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
