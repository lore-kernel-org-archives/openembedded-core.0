Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web12.35288.1612792570532503195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YhjeHNKX;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.47, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f47.google.com with SMTP id 123so3435537ooi.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XFk5A3KeWhi4YMCp37feDKMXMoiHH5VF+xyM8Kqg6o8=;
        b=YhjeHNKXhGSPXHQXbMEwdoGyNjtOKomW5BF8F33RB2K2tJfEADKrbw0Fdi4zNTqqX0
         H0JDNp+Shm5bUpbjoIRZs779XkWeknq8uL2pRsEJj8VsS9WO3o8I+kwZeJN66e0TVZV9
         DfDqC7et0hMpH9LuB3c0GxtdeKjjIa02P06lbu2qQlUXr63bCvNd44/+9AcuqtEDqprA
         D57ovO/ayRdgl9XPl3DsX4FhkMmcqyC8mhlEG0yztFxWPmzs/KJK8ON59wJcyvRl2UtW
         T4SeOpkgc1MQhIegSbRfkdiCi5HEvwLXPSPT/MH9ovsGfpaeoLKY1Zlfh+ApVYxqQ5hQ
         fPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFk5A3KeWhi4YMCp37feDKMXMoiHH5VF+xyM8Kqg6o8=;
        b=p0EfVKkKsYOoaEnf7U7EJOxo2kyAVYvlMjwnwy5Pw0wbzAfQn1KLYHF76xeN049aG4
         GIDsKVkkivNuEuXAPrWzGTtBU92AgtDEuXVt5IYAykSkjwIcZhesbzmeUjMlvqiYrY7N
         PuHjIX3pmXz4qpZ2PXjlsGJ73X8JR4emjFyZARZRcgSYqcCYYvN+5+/cGbLroMj8W1Hl
         y+wNml8YilSKs32poiAOKhz4k/z++HpXzLlgWBjlfGi5pGuUJKrn/Y5+qI1RJxGLDKLn
         o/gl8OyWzbria1MQMWdMS4LS9BuVY08E7DSEz9HbCvyljJVZmOa8WjMicCTidjxBKmBN
         Af0w==
X-Gm-Message-State: AOAM533mNA5PQ2yGV7wUdKNpOQX5xm+KfBVMp8mL4bs97Af+m+Bxn/ft
	kjwCW17dnBthvH9tFV8SyVbi5b3FjWXMMiflaTI=
X-Google-Smtp-Source: ABdhPJyi7uy4bksk9NBZbcFvgmlDyxElKnmv5MZZjouOEls/h39a1Uxs1YOpnCo5eZUlhxTLvYvkxQ==
X-Received: by 2002:a4a:e6d2:: with SMTP id v18mr12650824oot.40.1612792569465;
        Mon, 08 Feb 2021 05:56:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.56.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:56:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/28] wic/selftest: test_permissions also test bitbake image
Date: Mon,  8 Feb 2021 03:52:20 -1000
Message-Id: <89ba6986a09caf15c0833520bba79b3ad28c755e.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

existing test case test_permissions use Wic command as standalone
tools to create wic image and check that wic image for permissions.

add extra steps to the test case to also check against image build
using bitbake do_image_wic.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 551ce73a90757ba43501fe5cf9ac84a7b77de549)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index d4c0db8bda..0435aa29c9 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -516,6 +516,9 @@ part /part2 --source rootfs --ondisk mmcblk0 --fstype=ext4 --include-path %s"""
     def test_permissions(self):
         """Test permissions are respected"""
 
+        # prepare wicenv and rootfs
+        bitbake('core-image-minimal core-image-minimal-mtdutils -c do_rootfs_wicenv')
+
         oldpath = os.environ['PATH']
         os.environ['PATH'] = get_bb_var("PATH", "wic-tools")
 
@@ -549,6 +552,19 @@ part /etc --source rootfs --fstype=ext4 --change-directory=etc
                     res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
                     self.assertEqual(True, files_own_by_root(res.output))
 
+                config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "%s"\n' % wks_file
+                self.append_config(config)
+                bitbake('core-image-minimal')
+                tmpdir = os.path.join(get_bb_var('WORKDIR', 'core-image-minimal'),'build-wic')
+
+                # check each partition for permission
+                for part in glob(os.path.join(tmpdir, 'temp-*.direct.p*')):
+                    res = runCmd("debugfs -R 'ls -p' %s 2>/dev/null" % (part))
+                    self.assertTrue(files_own_by_root(res.output)
+                        ,msg='Files permission incorrect using wks set "%s"' % test)
+
+                # clean config and result directory for next cases
+                self.remove_config(config)
                 rmtree(self.resultdir, ignore_errors=True)
 
         finally:
-- 
2.25.1

