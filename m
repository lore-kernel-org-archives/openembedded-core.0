Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2DFAF31E47
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:46:47 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.135476.1775749607541666505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B7/SH4u3;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-46808125c65so426451b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775749606; x=1776354406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lIj13suHO6fjaOvMQoGb1y97eHIT+B38J/6i3MrF/Gg=;
        b=B7/SH4u3NOF35he4o5WhsqZe4WzMr8aLu+cTDPQl2ph8D4ZdFf0vV8WvcTWErIKrC7
         R4rE2jJUOacJg9nFfvPUcQIKzAwtZUFdQHAUYFLicFRdqoATJuoIIItJW63njSmloPkc
         PjfmYqI6gTuaPeT0QSt5qLXM98xbAD53m5SolAy+1ZEXTBTuPj6kM8xp1JBYU+42cd1q
         ZUM2Ns0jAL2QJxOgM7SsudCcQIHsvqkG2Hdfr/4XH7WdRL9PqrpbWnknxgfAVzRRjx+U
         XEoUk8Rk94JNMfwkmBGkhkUOwTskDKoqBiXOSC74IHF4kh/Zzp2ZpZz2eEYy2Y2LC9rx
         67Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775749606; x=1776354406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIj13suHO6fjaOvMQoGb1y97eHIT+B38J/6i3MrF/Gg=;
        b=Xgt4353h6vhJIjQvr2CIKuTqvaBa/4dcoyqt/aO1eYOR/7nQ0pZ7d/7gmVvL7Lf34z
         xA3Z9+EoG7whKbzW0E4d8rT+G9TrHxYAPG/a6NZsyEaRf3A8KBgu/Hpnt4g2BGPfH3SU
         q45GNd060KQIv2IFXglpdguqnk7Ju1hNOHjMTwoN6cYuQ6cU5reYl1QVUtwPZrweFOzn
         u0qlD4Wnp+3KDARtb2qzRdNNmca6x6wpL+0vjNIdhlCng9SqX3bg+0GWH+tc3DVWX840
         eo7OkuIGJFJCgJBtNu+8PDsclwwMiU7KnDkVQwmOpF6eFSJViBYuq5w+0rio8St1CKHq
         W7TA==
X-Gm-Message-State: AOJu0YxzMp/ffwqr4slNLr23LMO7u0kDhL8AbJAB38yK4suVzaIt/aQs
	2JncWKdPWq4fr0dZF9+BmzfFJ/5zHvDih/tfpqDcpx+6zLIoIXpheKqIVokSIg==
X-Gm-Gg: AeBDiesfTQog5UWoP1YTnDDnDsv7P4PimLTdOzSU+Cl5zO8meyIGW8gkv91BSOUMjH3
	13tIwIY/qreohY6cK9EndzGkTSYd7QPKKEntkUZGPgy9vzjhniJfJvJlHZZaK79sAuITanpKSM0
	NXqhyJVndsSvICP1uVc4HnK7GII49GOfd3M2GuksXdtTDnRc2FfTuKJNXfwqoeRKrOxnYqHDSCR
	VZBzIJ9NED10VcgxhomWl1h4HmeQxyKl27rrX3EOWKjnA+7zYyx8y3BgQbXl0BlEBp1mnL7/ENb
	5xajCi8b5EkWSmSEiSzQrgEEoJHwM9Rbz047/+TmR15QFtEephO8Tz4wD3gKJklnEEzJkRJPEQp
	I+JQec0Ej9y2A3iS/ngB76OVsBe4Rn5l4vSQDW7mLeGOExnufwBSGLH8r0vr2L6Odouhuhts06q
	FIschr7zZj5IluQtSuzMjX
X-Received: by 2002:a05:6808:2445:b0:467:ee67:d2b8 with SMTP id 5614622812f47-4772428d03emr1956712b6e.39.1775749606487;
        Thu, 09 Apr 2026 08:46:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4200:11c0::edd8])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d9387a763sm13975309b6e.18.2026.04.09.08.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 08:46:46 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes-global/package: Ensure -src package is handled in signatures
Date: Thu,  9 Apr 2026 09:46:43 -0600
Message-ID: <20260409154643.2423860-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 15:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234926

populate_packages() will automatically insert a -src package if
PACKAGE_DEBUG_SPLIT_STYLE is "debug-with-srcpkg", even if there is not
-src package in PACKAGES. However, when the -src package is not in
PACKAGES, it is not accounted for in the task signatures which results
in errors.

[YOCTO #16238]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-global/package.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index bd32a6ede5..e50a2e586e 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -443,6 +443,12 @@ PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDE
 def gen_packagevar(d, pkgvars="PACKAGEVARS"):
     ret = []
     pkgs = (d.getVar("PACKAGES") or "").split()
+    # populate_packages will add a -src package if debug-with-srcpkg which must
+    # be replicated here
+    if d.getVar('PACKAGE_DEBUG_SPLIT_STYLE') == 'debug-with-srcpkg':
+        src_pkg = "%s-src" % d.getVar("PN")
+        if src_pkg not in pkgs:
+            pkgs.append(src_pkg)
     vars = (d.getVar(pkgvars) or "").split()
     for v in vars:
         ret.append(v)
-- 
2.53.0


