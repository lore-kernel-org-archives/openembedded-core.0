Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF96C4167B
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:47 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.14683.1699453005952945309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gn+cXNIA;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41cd52c51abso43646491cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699453005; x=1700057805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv4XgrkLxvFauv95oOFbBc5DqSd/ETkOzNmrev6jXDY=;
        b=gn+cXNIAWmfrRqtXe6WBzMTZwzfLAAg/gyv5M+69gKcwHIwFxX0Ji0YwmQpdjzn4XB
         pRDooxxrdjCn++SJJZSbLoDGjr+Gpxtrm5A435gV1Z2ydOLcdF9kJCpbtv81UKbErqi5
         gonIQeHHaKv0eaSK369BMY1I5oPbPYnMr09SVz33sZKBuyo9BqQmGhEqiJgMxaLv+bPd
         E/CCqNFvYCnf9KM/HaHzaHDDJQikAHFBYygY3FIzNVCF+2cDa6qzdQA3ACcnx3bCnedw
         WzLIQAXk5K2Supw4P1I99B6ZK5YoUcfm+NhKlxSi13cAwEtQmWfE33thoF8aQ3LOEzFo
         alKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699453005; x=1700057805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vv4XgrkLxvFauv95oOFbBc5DqSd/ETkOzNmrev6jXDY=;
        b=eLYheFQE18XzNYaX9jlr0TpXuJQfZXC41/trmEjZ0aV9Czf1uY8Muf4zze0OZJJm7m
         nj6fKcgkYDWVH0Dcxw58EBgoqEMSRZqk/cgyAL4qNPpnWy70DaF/ePpMWYngp1nfnRJT
         UZXc5KXYNz25MSCcZ8LhECFmIJ95Sab4ZIxCXd6zRye9mkH6lGrILiTEqot34APIMgJE
         8QtAugGQRcaR3ZZ+hMDWDGSU6W0I51LUxTQGdtOH0VCgHMt1X2tVJpKqfsiBv7marhyu
         ZjPJxWh+NxYmBykVxlIHzw6fDLyBr10Ms6VF8Umh44erGpfPTiWiboRpTPx7ZN/q3OkS
         4NUw==
X-Gm-Message-State: AOJu0YwIqUeAn+DJueCGj3j2+z3ZqHMIVsgHxaThYJwNoARALQjPelfw
	W2BGfyVMCIh7p18P3XKrqyg/zM2FNv+/CCO3
X-Google-Smtp-Source: AGHT+IFdsNWj90KdwROTEGfTeFeCxUHtlvMUNtHSIQZ88qJ8HM//baXBCi+JE7rXDO/gBadBX+lYcg==
X-Received: by 2002:a05:622a:149:b0:41e:1f5d:7009 with SMTP id v9-20020a05622a014900b0041e1f5d7009mr2256679qtw.25.1699453004907;
        Wed, 08 Nov 2023 06:16:44 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/12] kern-tools: update SRCREV to include SECURITY.md file
Date: Wed,  8 Nov 2023 09:16:25 -0500
Message-Id: <fd0d854129fc954d8d5b38350c008938b832ae1c.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190346

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To be compliant with the recent security policy, bumping
the SRCREV to pickup the SECUIRTY.md of the kern-tools
repository. It's contents are repeated below:

   How to Report a Potential Vulnerability?
   ========================================

   If you would like to report a public issue (for example, one with a released
   CVE number), please report it using the [https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Security
   Security Bugzilla].  If you have a patch ready, submit it following the same procedure as any
   other patch as described in README.md.

   If you are dealing with a not-yet released or urgent issue, please send a
   message to security AT yoctoproject DOT org, including as many details as
   possible: the layer or software module affected, the recipe and its version,
   and any example code, if available.

   Branches maintained with security fixes
   ---------------------------------------

   See [https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable release and LTS]
   for detailed info regarding the policies and maintenance of Stable branches.

   The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains a list of all
   releases of the Yocto Project. Versions in grey are no longer actively maintained with
   security patches, but well-tested patches may still be accepted for them for
   significant issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index e4b5eea659..941160ea9c 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "0ae81fdbb1ae1546371206aeb3f5fb530dff8ddc"
+SRCREV = "7160ebe8b865dd6028aef278efa219433db93f7e"
 PV = "0.3+git"
 
 inherit native
-- 
2.34.1


