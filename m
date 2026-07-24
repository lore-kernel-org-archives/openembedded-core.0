Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0E7C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 15:31:09 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21898.1784907063297505031
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 08:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V+M49CvJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6128bd9b3so254086a34.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784907062; x=1785511862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jTgDRHI4WRAEXHXz8So5fcLlS5sGibQurxhCcl52BU8=;
        b=V+M49CvJEJpx5tOqq4jhgizvZKeC7AlD72uIa1uxKCIlkFzePda09IpO9gBMh9uj4I
         Ge7nmx4NrASdvde+fdJ8LMNBjlpt/MuVz0Kgv6R8/qY+ylfsGSv55OBg3pYuhlPCcjVX
         tb8gLalYnOpH7JmJOfjXphx9Q0f81RWUgaHVc9H0uKnT6xtN1CQc+N9+L6ffpMKP2nHm
         /JOVzaMCr6KsnsSAJ+po2ScW5B+zf6pBPqKGZxXMGw8VDJ3fbunqnkTvigcsUBuDfoBD
         dwnJQintWDC8bFDDfWbkGfEJB31WiycjtkXzLL2E0sV7SOGQN9krWdPyHmkjaqnJoN6e
         u52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784907062; x=1785511862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jTgDRHI4WRAEXHXz8So5fcLlS5sGibQurxhCcl52BU8=;
        b=DDlFzAdbOWMxIkJrCEO+Qj7mYYvgg7lfScOEaJ0BZD6w+GmjGqdOUYlQEirRcZuczH
         oa8Lwsh+m8KMBv7PocIF4aEEnwWpX86gbposdeh3lN80At3puEaVyF8XUm2onppQeQQv
         jMH8jEOeISQlyQBjhI0ZN8hZoWt1sZwIjlSCU8RXKwB+fRiPl2DeOBYhQC7f47qgVlN6
         qW4v8kBU69kjWHe+y6mgYmVKuRL1eQ5zCxBz/WOxf5+0uLft2b4yc5LvnOWFLy89ABCY
         9EpMXgoCdCDJt5zZX4WIh7Z4/N3eVL9dvOd5TgjhKuMJXhQAz3hY30hcLmd8crEsm4WA
         YQtQ==
X-Gm-Message-State: AOJu0YyMOzCpiEKANFeJDA8VPYK7xSTpSvQPedhuf29ySID6pNLUYZtQ
	KeK2/DYLYQXO4nI+lYAeBK1iQs0guml7Oo8Qjoj0rxmZdQc83AdK706Nlhk8tQ==
X-Gm-Gg: AR+sD13BUt38LpOWW7buIUDXvb5Wf8x4bntxhWNha54RcFkJXkG6X646Hnbk8reNjzt
	oTI1mS+k6eemEyrWZRY5269LAf9J7ayS/usc5lI0vj58lhfOSfDaq3oPcvVkgf4YLvABby+whQS
	8l47NzGVxliCXFGC1z+moL2ikbH+7OfAr1TSvx1TrE4JGl8WgDMRvBNpgas0vQ7yg/lGueqhzUZ
	9ZsHXz6uezbNmZIpUnTnIjB0aUpnx2vyrn8/O4HaII80I+nuJJOgdnNapxZetMxtL41sKDyQgDG
	KJ5C7beArSyNs45oT0awgdZESSzsm+fR0s2qWd/jrR/DdOYoCpkXB3fiNL5kAY5ICBIK1+sctXp
	jGttgsxKsC2YuUAjfxqlAYhFLQqOmabDcH8oLIW7l5Dp/QxAY26lhqZ54eG4sIih8k7uQsiFyip
	M=
X-Received: by 2002:a05:6830:83a6:b0:7e9:cf6f:aef8 with SMTP id 46e09a7af769-7ee440279b2mr5415123a34.11.1784907062402;
        Fri, 24 Jul 2026 08:31:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::5d97])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee29db292esm6126551a34.6.2026.07.24.08.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:31:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib: oe: sbom: Improve SPDX parsing error debugging
Date: Fri, 24 Jul 2026 09:30:55 -0600
Message-ID: <20260724153055.3930069-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 15:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241939

Improves the debugging output when parsing an SPDX file fails by
reporting the file name (since this is not normally visible from the
backtrace). Continue to raise the exception after reporting the file
name to get the full backtrace.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 28778651d5..e02382c3cc 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -977,6 +977,9 @@ def load_jsonld(d, path, required=False):
         if required:
             bb.fatal("No SPDX document named %s found" % path)
         return None
+    except Exception as e:
+        bb.error(f"Unable to parse SPDX document {path}: {e}")
+        raise e
 
     if not objset.doc:
         bb.fatal("SPDX Document %s has no SPDXDocument element" % path)
-- 
2.54.0


