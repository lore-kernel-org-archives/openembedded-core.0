Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4244.1794170814125001721
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2026 12:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Ms7yeuyG;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so534554eec.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 12:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170813; x=1794775613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/tjEacieRlhYyArzqKJG0dwF9phcd9757mq1KNE1KOU=;
        b=Ms7yeuyG0kq4ySJUMJE+sTiC6a57ktzUMBxBm8SgFhvnLHcMMyqNKimRI3C56O8VWz
         B30o9UkyBewfMb02tI4pNvXWf84czy/j1GWjPFiby5ARp3GeyeJzqH90PZSI4hwapzKY
         tdXZjUqnkas989/VkOI3dkkaLfbMun3CGHAfQme64OfZ3EELSHayp1DxgIogvr6/3uw5
         XM/ydwINJDHhbdgnB2QZzWQySjhpUB0FaesL9DJsV2IxawuohfmZP7eZx0Xt6/rEJ3yp
         HBi3PaxE3TI9gpPIXlNK12Ut2/ufetVAqtxNFCdZBF6iOlU1fOajage73JNGaj4DhomF
         HIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170813; x=1794775613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tjEacieRlhYyArzqKJG0dwF9phcd9757mq1KNE1KOU=;
        b=XGQCMyZLYwgZXYLdX94teX371TWJa+Fy7aThJTiIMcPupp3esamRDfMibv5L4eLfg4
         3aoZ4ZC4s6cS5q9fYSNC3TEKrQ9m13Rduy57iZZhbeg8dAYHEwdDNA68j6aWXeF5Jz50
         ad0kV4O39fnziyFzlNwnnkiqVr0K1n87REwuxhqQ4Dovnigx79Kcsyx/693MkjfJFSg9
         q567ewCxxwC/O7MJtDsYxm6oKYeAWGSiuhqWxFENzOzFSwUvPotv5MvddCp2sjFloEkC
         t2y42iiQhWu5arLFE89l740/h23SuvvqR3iWUuADzJpD9mANh9sMtpGxYtdFg5QzzLnd
         p26g==
X-Gm-Message-State: APuU4Z/p+0GbLnBuHOIfAVri0FvXLS9i1K5d7FVxPsiawLVVmjA13tvY
	Q8V4qwPa/cQe20ZfHgOWc7jcniz3Nbg7C4Ugdu5O8z/RM1nx31VcJMfD0ghbRAdVMqA=
X-Gm-Gg: AYBFou0VAxhK1+6t1/UKjPr9HSgsbeK0KFR5qGYDucZHArph5SOwOoDI7/O+jEflc/l
	9xFpFIDznTLXF8JyBAx+yT82cqMOzLwt+/ZJE/+pe6fH0TjJJkSD1XW81O7BSgrBqXGjFfpYcp3
	ceqLQKkAXG5TVgcEqJx2j/Bf5Ty1MAXiG639+zkDKspndAjuHzC5JCSwt8715y4tRkgArq4j4E+
	ClE5c/tfVhH57kvcsLbRjD3vhhKIeIkethqZ2CRqqMxAaBk0DJZ93Gc3SgwO/ExrKv0b5XLXjWi
	WfC1G/mHJkNbIE56MqN3PiksmO5GXesXDvK9aOrXcjxCX7CrVaBdlY4I6gYa/VtGQ9ARRqtWuDe
	eLAsJdnr1HCDu5g3ZDBe0haI1VxA4ddQWRkjsJwOrdwZ8aUSBp/1LXRQfuUhCOMD5l/cEPJTR4v
	oi8MfaiaU1/Yop5Bah512XjSrRqscWeGvHdvX+xo7sAFH1wBDFw6XJGO7mL3vcY4dT5cd5gXz4g
	JeSO5HzI7KyLKJdaBG5lqTK4i9wQmt6OHux+S6PluUCWRPwNCoOoyh87r3IjHN84J0RZXr4XPOv
	MudYYDHNW9JgRBkrf0Opv7xS1rNe3gvb/UXWKZvwggtmbrySlg4wiwmF3YYDcB/XEWP74yd6p/b
	picR69XDAowDjFXhPVWOmjIgS2b+UU/9OkCnrdC3t9Ur+8zW4kpqPnlN8pAOLSxJqISuEuLdC7L
	PlJJ+cwr43MzJOfoLjqG6eQuOj8gqBo70N8O+lDMHbYigUh7xHJktkWrshbXpHmUR0fvE178t1u
	3NK7HyzichN50t4uSpXE7wQHQkfaAmBfoZYR5n4U2lokhEQNlbsSV2UHQ83bPCyCdgu9BAljKGv
	5T79ig==
X-Received: by 2002:a05:7300:10a:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-37256bf1a40mr4727319eec.16.1794170813300;
        Sun, 08 Nov 2026 12:46:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265c0701csm7603100eec.13.2026.11.08.12.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:46:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] ptest, packagegroup-core-buildessential: Add clang with clang toolchain
Date: Sun,  8 Nov 2026 12:46:50 -0800
Message-ID: <20261108204650.3577385-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2026 20:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249770
Content-Type: text/plain; charset="utf-8"

When the target is built with the clang toolchain, python's sysconfig
and perl's Config record ${TARGET_PREFIX}clang as the C compiler, so
anything compiling on the target through them fails when only gcc is
installed:

  FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-yoe-linux-clang'

The target clang package installs the ${TARGET_PREFIX}clang symlinks.
Add it to packagegroup-core-buildessential, and in ptest.bbclass append
it to the ptest RDEPENDS of any recipe built with clang whose ptest
already pulls in gcc, g++, their -symlinks packages or
packagegroup-core-buildessential. This covers python3, python3-cffi,
elfutils and others without per-recipe appends.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/classes-recipe/ptest.bbclass                         | 8 ++++++++
 .../packagegroups/packagegroup-core-buildessential.bb     | 1 +
 2 files changed, 9 insertions(+)

diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptest.bbclass
index 0f80fbc1d8..de77089002 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -136,6 +136,14 @@ python () {
     if not(d.getVar('PTEST_ENABLED') == "1"):
         for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'do_install_ptest_base']:
             bb.build.deltask(i, d)
+
+    # On-target compile tests need the clang driver when built with clang
+    if d.getVar('TCOVERRIDE') == 'toolchain-clang':
+        var = 'RDEPENDS:%s-ptest' % d.getVar('PN')
+        rdeps = bb.utils.explode_deps(d.getVar(var) or '')
+        if any(p in rdeps for p in ('gcc', 'gcc-symlinks', 'g++', 'g++-symlinks',
+                                    'packagegroup-core-buildessential')):
+            d.appendVar(var, ' clang')
 }
 
 QARECIPETEST[missing-ptest] = "package_qa_check_missing_ptest"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 2cd67ad05f..d33af54d26 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -29,3 +29,4 @@ RDEPENDS:packagegroup-core-buildessential = "\
     pkgconfig \
     "
 
+RDEPENDS:packagegroup-core-buildessential:append:toolchain-clang = " clang"
