Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBAAFED9EC
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 16:23:42 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80232.1773764617245229952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 09:23:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jj12cAUR;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so42454515e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773764615; x=1774369415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZEDZp2o0N53pr2k3Vl1RBJxI3bHw6rQQTosG0EaMBg=;
        b=jj12cAURFIBoeWsO16voylfBwOqwJ3s99SoihISApUhv6bo0yiGL5hlCRSCXqRyRtQ
         qoOcaDRUT//gbdKz6QMWxmxleWK96DzUdrZB6Y0D+4wNCrhuSNmwUl7Z3u3c1KsqpBQw
         Bif04DfcLISdxrDecAZ4fmouAZo/ApNBaRc+TtY53ASNlLzdlAagIFEPy6hpspuDY4C8
         cM8+Ehr1l2FZMoAXZ5ud0NiexdsaGO/pRXIGr/DH0ZO9W90Mn/nmXGcK90z9CcpDgxy6
         TF6v5KLaEv/xWcruE7UJgW2B2FkIhbIV5v3zY9hY7Xb+G+gLQbzNUTn8n/LEg/kqoXZp
         n8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773764615; x=1774369415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZEDZp2o0N53pr2k3Vl1RBJxI3bHw6rQQTosG0EaMBg=;
        b=b2wk1TY5cufJsCyZC/KvgFekReBLwUqABCG9zDsH0xEAvMpAknamIvl30BrcC1/q9x
         B+JTEQupUYvBBxdFlMQjBVmVVSasLFY9si7vgGxFcT3J2hbYXEHihE8jCQu4coCY9M2x
         jTRF5/STbdKbS2fWtDCmeuef6tT+fWnagdcpDLa5bfzzcppS6eUx01Q4i6DbP4UBZ3K9
         92yr9EijloUjRteC/I01VkG6FQxa6EglXRjRzuQK/i3abs+3beVdl1piwGdlI3N6xkBr
         5jv+6RFhG7ifdh2RB2Pm5kzwWqXowxB911A6PuulbUfKW2XMH5fm7DwWahKvm3C5vDhx
         q66Q==
X-Gm-Message-State: AOJu0YzHsddPJGD4C7b6/xxBDyMz79TYtAghlOi8dWx6Qs1fAwE8UNgu
	aPsFSYg/IBROSOmogFMMUxXU4KJX9FFOQqSeKksLuXdQIw6RWCf/o7jdmfEFpg==
X-Gm-Gg: ATEYQzyUmny1M92sIxLksSM07Zkyt950dFjW69QGRYkdhkUF+eaxzx4TbsEQwNc9aRN
	bW6wf9ALgA7CGIRUTzhkKKni0GpbUKp/1YPu4Ad/mLT/aCupcz+SZsPEJOMxSfe3+bLcNb3s5Bf
	FxT2LV2SkpCFgGdNP8y44UMS6T7yn2qRWdzzMgWKX4r8QAEbaKEOdyMgDiVJb90zfjvxn1R9LDs
	hWNzVTibQ6HAFJ79p2DRoq9XDpXXgPxRggD93Nb9f66zhPT/ric5aOEAniEHhg7mKX3zcvAxX8Y
	OB4X25ogSdCvP2BptQbUMxlippR+lz9ab6KXfcbacD2LJRCR05w38CC1DOZnRCdruwLNpVOYV2G
	E74Od4IUylisxNvjD0J2DbYoVSYAVeB+vi4SACOA0lZwzNZbUUuFKfgIbruVckzT0p+/rTMjEkf
	rnqOo5+KDTuTW1uAITCR/uddXgNRy89nyq
X-Received: by 2002:a05:600c:c8f:b0:485:2ce2:4c75 with SMTP id 5b1f17b1804b1-486f442206emr2904385e9.1.1773764614321;
        Tue, 17 Mar 2026 09:23:34 -0700 (PDT)
Received: from toster.lan ([185.228.162.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f420d946sm2691145e9.1.2026.03.17.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:23:33 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [PATCH v3] sanity: condition hash equivalence warnings to when it is in use.
Date: Tue, 17 Mar 2026 16:22:12 +0000
Message-ID: <20260317162211.321710-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 16:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233329

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

The warnings about the hash equivalence server are only valid when the signature is
being used, and for that we have to check the BB_SIGNATURE_HANDLER variable.

This fix the warning that is displayed when using the basic signature hash, OEBasicHash.

| WARNING:
| You are using a local hash equivalence server but have configured an sstate mirror.
| This will likely mean no sstate will match from the mirror.
| You may wish to disable the hash equivalence use (BB_HASHSERVE),
| or use a hash equivalence server alongside the sstate mirror.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---

 v2: add new top conditions for the BB_SIGNATURE_HANDLER and ident the existing one
 v3: ident the hash equivalence complete block

 meta/classes-global/sanity.bbclass | 51 +++++++++++++++---------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index a170c3f5f5..b5d905399b 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1006,33 +1006,34 @@ def check_sanity_everybuild(status, d):
                     mirror_base = urllib.parse.urlparse(mirror[:-1*len('/PATH')]).path
                     check_symlink(mirror_base, d)
 
-    # Check sstate mirrors aren't being used with a local hash server and no remote
-    hashserv = d.getVar("BB_HASHSERVE")
-    if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
-        bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
-
-    # Check that when SSTATE_DIR is shared between builds, hashserve database is not private to a build
-    hashserv_proto,_,hashserv_path,_,_,_ = bb.fetch2.decodeurl(hashserv)
-    if hashserv_proto == "unix":
-        dbdir = d.getVar("BB_HASHSERVE_DB_DIR") or d.getVar("PERSISTENT_DIR") or d.getVar("CACHE")
-        topdir = d.getVar("TOPDIR")
-        sstatedir = d.getVar("SSTATE_DIR")
-
-        if (hashserv_path.startswith(topdir) and dbdir.startswith(topdir) and not sstatedir.startswith(topdir)):
-            if bb.utils.is_path_on_nfs(sstatedir):
-                bb.warn("""Sstate directory is on a shared NFS (it is set via SSTATE_DIR to {}),
-    but hash equivalency database is inside this particular build directory {}.
-
-    This will prevent sstate reuse, and it is recommended to set up a permanently running hash equivalency server
-    according to https://docs.yoctoproject.org/dev-manual/hashequivserver.html""".format(sstatedir, topdir))
-            else:
-                bb.warn("""Sstate directory is shared between several builds (it is set via SSTATE_DIR to {}),
-    but hash equivalency database is inside this particular build directory {}.
+    if d.getVar("BB_SIGNATURE_HANDLER") == "OEEquivHash":
+        # Check sstate mirrors aren't being used with a local hash server and no remote
+        hashserv = d.getVar("BB_HASHSERVE")
+        if d.getVar("SSTATE_MIRRORS") and hashserv and hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
+            bb.warn("You are using a local hash equivalence server but have configured an sstate mirror. This will likely mean no sstate will match from the mirror. You may wish to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalence server alongside the sstate mirror.")
+
+        # Check that when SSTATE_DIR is shared between builds, hashserve database is not private to a build
+        hashserv_proto,_,hashserv_path,_,_,_ = bb.fetch2.decodeurl(hashserv)
+        if hashserv_proto == "unix":
+            dbdir = d.getVar("BB_HASHSERVE_DB_DIR") or d.getVar("PERSISTENT_DIR") or d.getVar("CACHE")
+            topdir = d.getVar("TOPDIR")
+            sstatedir = d.getVar("SSTATE_DIR")
+
+            if (hashserv_path.startswith(topdir) and dbdir.startswith(topdir) and not sstatedir.startswith(topdir)):
+                if bb.utils.is_path_on_nfs(sstatedir):
+                    bb.warn("""Sstate directory is on a shared NFS (it is set via SSTATE_DIR to {}),
+        but hash equivalency database is inside this particular build directory {}.
+
+        This will prevent sstate reuse, and it is recommended to set up a permanently running hash equivalency server
+        according to https://docs.yoctoproject.org/dev-manual/hashequivserver.html""".format(sstatedir, topdir))
+                else:
+                    bb.warn("""Sstate directory is shared between several builds (it is set via SSTATE_DIR to {}),
+        but hash equivalency database is inside this particular build directory {}.
 
-    This will prevent sstate reuse, and it is recommended to set the location for the database to a common path
-    via BB_HASHSERVE_DB_DIR, for example:
+        This will prevent sstate reuse, and it is recommended to set the location for the database to a common path
+        via BB_HASHSERVE_DB_DIR, for example:
 
-    BB_HASHSERVE_DB_DIR = \"${{SSTATE_DIR}}\"""".format(sstatedir, topdir))
+        BB_HASHSERVE_DB_DIR = \"${{SSTATE_DIR}}\"""".format(sstatedir, topdir))
 
     # Check that TMPDIR hasn't changed location since the last time we were run
     tmpdir = d.getVar('TMPDIR')
-- 
2.53.0


