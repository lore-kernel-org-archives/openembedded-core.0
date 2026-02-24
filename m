Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240F0F5542B
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 23:02:47 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33592.1771974164945456650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 15:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RPtWtO6B;
 spf=pass (domain: gmail.com, ip: 209.85.167.195, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-45f171cb842so342444b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771974164; x=1772578964; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=RPtWtO6BRQV7ocbGJWu2ZTo/mlkFqcEaNr7jGjQlkpIVtyVGRVDVdhKY9osdr8nmMp
         9i2dt7Mjuove9GQoRyjvJb19gMNsUrSHJ9FA2xKe5Rrz+49UAdLxclrjPRW9P6ofIjNE
         ttDh0WjdaeeWDJXxxvWsDuvCa1CIQXTCM4+6RCEDGod/C0jlGC9X1zV3rcBmjWk6ynbH
         +PRs8AvLoYKnkY3AzY+WDU2H+phk0KkZC3ax3IQA3kGZ9DPtpMBI7NlM8s9SEXRG/avi
         5UOJdggiWr4CK4AKH3JnyvEIJmNtPjUiHFYRbuxy2NquiDos6TT+qAeQeapiN8KmaOjy
         Hsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974164; x=1772578964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7bs/2ESNOjlKv5F2a1L5fY1cfh3Mb2GOypfpxUG+ELw=;
        b=Eb6hMDWROS77XiA0NJHfO2X2hJ+6R5UJddtxxf+FVJqmXeRp/MHI91wiZyjyxKvDUI
         3o4Qd0AwD/9jGclEL4bR9zvKz5Bok0EFKHYGiBPwVIwl3Mibr/aW7tIJlpaMKasLTbWH
         erAlMCGknqKvlT3W9cuFY8tXVvW+6exjfvxO9Zrk7q6xtLi04hU7qQHm9bmFeO00P/ae
         YINhrD2WszpC+moUkuBsY/6/5aA4UpyWXiQMcCSD60s0RB2LHbbRbzYZLQX6gEtQeKTj
         0a3QeBe6H6a8C11CeESl+KrMg1Z+zYnM2t1Ti/mvAlKFN0qGn8W0ZV1upvwMjXZlbbAc
         NmFg==
X-Gm-Message-State: AOJu0YxttB6OqsiLR2LL0Tgxn3JfEHdpLX3he+0aLegdlfJVEy2v4D9W
	UWlOJjb9645DoEAoZZ/WBA/6goB+rfRy0SbmpwFfmr+IEsJPZH8xhRKh4Aue2mvK
X-Gm-Gg: AZuq6aIqOYZHATQE5oO0495m5R9nPmVA1KG1T8Fa7Z9jalHZjDi4OidlmYWs0O1TTrU
	k1WCuI/711n7T7hb9LslCe4O2YCIEY0F+Ul2y1hGm1c2NEz2fAZalpLn8YNGGsLllf/99uKOJ5a
	g4hbO2HopRC0ZTI02YBq2VJ3KF/Q8PhMlb4cq0DSk+Hms72DdtALhOzjDodqj+GOnYCDOQInLbz
	wjimiFmRqKztREtA892dbXjIfKRs+q7uqGaAXA9sBuBtWfRnpr1S+4hXss9ghKYS5L1CEOPuRKp
	kldymPhaQsoQRFd6YEvhnY6l2+VIOetKZHbyXX6FSgEHOWCT5I4EX19slIzqvPocQECxzq9pJe7
	wMCt93EIpiE1l44Tv3AF6m4IkFrPPWrS1vpPOtVAFeI727ZvYt0FH6bebsYSeReb7TH5i8mCEpi
	L+TlgoFw7e3grptMZBFojp
X-Received: by 2002:a05:6808:1997:b0:441:c8a2:ba26 with SMTP id 5614622812f47-4648bc76f6dmr914411b6e.7.1771974164054;
        Tue, 24 Feb 2026 15:02:44 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4200:11c0::ba6c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4644a1efc76sm7912024b6e.18.2026.02.24.15.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:02:43 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: benjamin.robin@bootlin.com,
	ross.burton@arm.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 2/8] gcc-source: Use allarch.bbclass
Date: Tue, 24 Feb 2026 16:00:15 -0700
Message-ID: <20260224230234.679049-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224230234.679049-1-JPEWhacker@gmail.com>
References: <20260220154123.376880-1-JPEWhacker@gmail.com>
 <20260224230234.679049-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:02:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231911

Converts the recipe to use allarch.bbclass. This is necessary because
SSTATE_PKGARCH is set to "allarch" based on if allarch is inherited or
not. If it is not, SSTATE_PKGARCH has the value "all", which means any
data written out based on it cannot be found (because "all" is not in
SSTATE_ARCHS)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 265bcf4bef..3ac679b1a6 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -1,11 +1,11 @@
-deltask do_configure 
-deltask do_compile 
-deltask do_install 
+deltask do_configure
+deltask do_compile
+deltask do_install
 deltask do_populate_sysroot
-deltask do_populate_lic 
+deltask do_populate_lic
 RM_WORK_EXCLUDE += "${PN}"
 
-inherit nopackages
+inherit nopackages allarch
 
 PN = "gcc-source-${PV}"
 WORKDIR = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
@@ -14,14 +14,8 @@ SSTATE_SWSPEC = "sstate:gcc::${PV}:${PR}::${SSTATE_VERSION}:"
 STAMP = "${STAMPS_DIR}/work-shared/gcc-${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 
-INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
-TARGET_ARCH = "allarch"
-TARGET_AS_ARCH = "none"
-TARGET_CC_ARCH = "none"
-TARGET_LD_ARCH = "none"
-TARGET_OS = "linux"
 baselib = "lib"
 PACKAGE_ARCH = "all"
 
-- 
2.53.0


