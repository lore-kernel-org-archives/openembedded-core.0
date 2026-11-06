Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1456.1793986364324316440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Y5ypp0Jv;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7d06ecaf709so517767137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986363; x=1794591163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8cwa+OMsOo1WZqeXoKAZgLo6QwEBedOoqawD4YF/Nio=;
        b=Y5ypp0Jvh4Sv98iAY5ANo1OV3wou8LZyY8/g9DYlB3p0n8pzKvajMKBtpkwpihTeFC
         KWjbP8MOHSnTA+YpZfRsQe3piOy1wT/Wl8JXm0wBC85dB0cCWRlpLNLIZCE1SeGbHFOG
         PYNfTQFBQSKzqttp105oAk9L7dT6rqvvmDHe8AiJgQzn2FEBUEsf4M9GS06ZlsDoNsgq
         Hnzfz+74DJT7gAHPYN+XN9mf+sKXaQoLrHGMF+6FHhrKA1cl16IccSxvC+wX6MrCK7wF
         S3VQiSFkcj2QyI/XmX2VHTG4GU1lu0AtOfVnB1BuQccq7QSNFfitWonR9NtbBCawFdWm
         7J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986363; x=1794591163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8cwa+OMsOo1WZqeXoKAZgLo6QwEBedOoqawD4YF/Nio=;
        b=smUccYPx2KjlPEvd/V3P+5IKA6COS8L511Hk+C09zDjfYthb1aVht10tOKTEh80Csr
         Lo7HO9cQjDij76PT8k5ESKAZSzGUYNM83D9tPh6WVoR4tdgSLEi193V7dozIBXiQ5WQu
         0j3jjMywQArlIHBdrZZ+aEz4LkuyQl+4WhZwQSDFIrf8wlrEDK/RYAl9xhvEgxsdjunz
         fS8/zVlxi93EIXOfhERN285+/uDcYmSbk7o5llhzkB+U9K2CbbSBRL5iSavNnPHzfOG6
         X0I0a+h2hCClmjXTudlO/7Cjt1HWDykeYa9OfWkm2y4/U2m2Rte7a8BVWOkLCPUmWOKb
         zqmQ==
X-Gm-Message-State: APuU4Z9fgm0enzpzhvT+hbh0jhgwLxzTUJ9ZWBYzGAKuHFldNoOzcJ+O
	Ja7zq63pQdgLZL7w/zHdvI8Ml8kIxESGst0ma7rCtIBbVq+A+uGmYods
X-Gm-Gg: AYBFou2pB0dsUV3A252LRwXe5HTFjEzqBuGMnOeoW7gsv1WffYqPHlyvpiDtr49wyFm
	9IiO/H5z2Uk6OL0ntKR1Gy1UfZMw8h+B/7Q2goDxPVT15FKKi+pRyRSjYRSqgJ5OYgZKVreufDx
	pTlmqceHzs4InAJ9M2BfCg/jXPXCp8s2XCm3g8+SDnrvb0PhxvUcSwIFOIv0x4Hip9OVByQm66v
	dC8gm3WBPDb/BezlcBG0YfbhhKEjVABRqEE4WKfQu2dzO85JfVyygBSghssjT9laYK2H6AI+knv
	g9NTgl8UEGHrEbpAQkBqXwPryQs7LhyUWEUEJsBtLxJfrN4GzQ3EeMsYTpj5v3f4NxcNEYmu6T+
	7OOG/XSJ1e8CebZjrWiPA/T9ulNlyKhBjSnZyIOWGdbfNJDG1Ir7s2z2hFq6zt6lerZlbNfy2Ug
	DiJlhgiIokB0Mak6ic672jmwsj4NUnA2/spDeF1+QtgmvlFZ9f4kfthrwp2Gig5mSnHsOg1ZZ5o
	nQUt6u204afJUGwYhL7vwDRP8QelVyBbSQbXlaYhIXCfqO41LSCmJDO+I+iIw4abFcLFQROi3wS
	qUBOrOFBqEkiaJH2f2nMtRHsKJLbzxzpC6CCHP12hha7cxVCOEJprHufCDF2TathsyJDFaWxS3X
	0YIQhpX7CjzFtV41PAVAc6tg8mOEvDnLV73hG+JkRDh5y6vZY5hdZFeofOSU7klHDyNt2ucyckH
	mKzVyhxDTsG087b33s6J796O/VbtWWs0Zqnj8S2r2HYHuBSQ==
X-Received: by 2002:a05:6102:2925:b0:7d0:5688:f4fd with SMTP id ada2fe7eead31-7d2a15a3388mr1818156137.17.1793986362986;
        Fri, 06 Nov 2026 09:32:42 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 07/08] rootfs: don't carry debug rootfs postinst registrations into the image
Date: Fri,  6 Nov 2026 12:32:34 -0500
Message-ID: <20261106173235.4155305-8-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249707
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The debug rootfs is created in the image's rootfs directory, with the
same package manager, so its package installs use the image's intercept
scripts. Postinsts register their packages in those scripts, and the
intercepts are only run once, for the image, after the debug rootfs has
been moved aside.

So a package that is only installed in the debug rootfs (from
IMAGE_INSTALL_DEBUGFS) and has an on-target postinst is registered with
delay_to_first_boot, and do_rootfs then tries to save its postinst from
the image, where it isn't installed:

  ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke rpm. Command
  '.../rpm -q --root=.../rootfs --queryformat %{postin} <pkg>' returned 1:
  package <pkg> is not installed

Other intercepts get the debug packages added to their package lists in
the same way.

The debug rootfs is a debug sysroot, it isn't booted, so there is nothing
to defer its postinsts to. Save the image's intercept scripts before the
debug packages are installed, and put them back afterwards, so the
intercepts only see what the image installed.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/lib/oe/rootfs.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index e0365da285..aac93dc42e 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -145,6 +145,16 @@ class Rootfs(object, metaclass=ABCMeta):
                     shutil.copy(os.path.join(root, f),
                                 self.image_rootfs + relative_dir)
 
+        # The debug rootfs is installed with the image's intercept scripts, and
+        # postinsts register their packages in them (delay_to_first_boot, for
+        # example). The intercepts are only run for the image, so a package
+        # installed only in the debug rootfs would have its postinst saved
+        # against an image that doesn't contain it. Put the image's intercepts
+        # back once the debug packages are installed.
+        intercepts_dir = self.pm.intercepts_dir
+        bb.utils.remove(intercepts_dir + '-orig', True)
+        shutil.copytree(intercepts_dir, intercepts_dir + '-orig', symlinks=True)
+
         bb.note("  Install complementary '*-dbg' packages...")
         self.pm.install_complementary('*-dbg')
 
@@ -162,6 +172,9 @@ class Rootfs(object, metaclass=ABCMeta):
             bb.note("  Install extra debug packages...")
             self.pm.install(extra_debug_pkgs.split(), True)
 
+        bb.utils.remove(intercepts_dir, True)
+        bb.utils.rename(intercepts_dir + '-orig', intercepts_dir)
+
         bb.note("  Removing package database...")
         for path in package_paths:
             if os.path.isdir(self.image_rootfs + path):
-- 
2.43.0

