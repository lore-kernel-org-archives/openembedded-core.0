Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.27038.1610325984911519919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uPwbADVj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id g15so11515994pgu.9
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=oDIJts6dZeewdueYFABJdx/a0I9OseaU7XTtKDBebKE=;
        b=uPwbADVjbWobdF+MixmeshFhpm0S0vP869u1BmX13L5JA8aBCQYsZ4YdecqHBkb6pL
         FGwj+vsABR52e7fNhG+OH404vmoQ7bkaggCGnO82lfMjrSw450U2WGLFDm3IcLy241JK
         GTJNqconcDn91150+w5EvsycaGPLAnW7G/B+lMoydpnxVMCj6m7XyjdNznNVAutwr9UN
         ltKP5WgatXD8aaz7dosM1KZTXRKyphXoZ3dJ/bwgJg66r0/9RTOjdxkNUP1i49ZzcLGm
         //GDqZsRiy7Yr4+I0oXc6+miQTdfxwu/R8NHdQVsgImtl0uIOz7vgI0DWuglUcfUB9AQ
         p3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=oDIJts6dZeewdueYFABJdx/a0I9OseaU7XTtKDBebKE=;
        b=ueNWW525VLJarcI+EpDQjHFJVfrKt8RtZ3CZpgS6MSUWFWHpy5zNG3PqWW3fnEquZi
         YaxFyTlTrNpvAkoM/hDkeGTeul6gnXwJTxD12OeMFiJGLXKF/xzYzoNmcSIIOck1E1nU
         LYRk59G+dPhcPgYIsXBQ6MQQfoyCcLzUyfmgzxVLhX+U1sruIYF+gIPJIZLHdBO8z+pc
         WlEFsNY3UQ3BDztFTYFdxytIli6V9VnqPrZqBuF6VE65iZQN0gQzqzk/jBaaIpjkPt7z
         MCVXuP8JZj5EtcuKU2gxAV5tgxU2ZzsD23GAgBKQrVyfdJssSv5N1xC2Vgcg1BlCuZRu
         GVoQ==
X-Gm-Message-State: AOAM533cLIHzgP7qspvVvNbmckSKF5Z3k27JOY7+OgU419pJ3speKqR3
	ZGpue7V4oRbHddAxK/5MAIcFBWFcTY930XxXa9k=
X-Google-Smtp-Source: ABdhPJyuvoZ86EIOgPvwJrcF2/VfZ1jiRD6owBEJh/FXBPd10Yn4cRVAapix0d3f7Ix/orAsXUlrhA==
X-Received: by 2002:a63:4b5c:: with SMTP id k28mr17239791pgl.294.1610325984106;
        Sun, 10 Jan 2021 16:46:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] oe-pkgdata-util: Added a test to verify oe-pkgdata-util without parameters
Date: Sun, 10 Jan 2021 14:45:45 -1000
Message-Id: <59272d46d61b3328ebd5c72d702d7e5b368afeb4.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Milan Shah <mshah@mvista.com>

A test is implemented on poky/meta/lib/oeqa/selftest/pkgdata.py to test
the scenario when oe-pkgdata-util is executed without parameters and
help is displayed.

See [YOCTO #10726] for detailed bug information.

Signed-off-by: Milan Shah <mshah@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b4e2eafa6eb71ca94ccc8a18d05b473b352367c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/pkgdata.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/pkgdata.py b/meta/lib/oeqa/selftest/cases/pkgdata.py
index 833a1803ba..254abc40c6 100644
--- a/meta/lib/oeqa/selftest/cases/pkgdata.py
+++ b/meta/lib/oeqa/selftest/cases/pkgdata.py
@@ -218,3 +218,9 @@ class OePkgdataUtilTests(OESelftestTestCase):
     def test_specify_pkgdatadir(self):
         result = runCmd('oe-pkgdata-util -p %s lookup-pkg zlib' % get_bb_var('PKGDATA_DIR'))
         self.assertEqual(result.output, 'libz1')
+
+    def test_no_param(self):
+        result = runCmd('oe-pkgdata-util', ignore_status=True)
+        self.assertEqual(result.status, 2, "Status different than 2. output: %s" % result.output)
+        currpos = result.output.find('usage: oe-pkgdata-util')
+        self.assertTrue(currpos != -1, msg = "Test is Failed. Help is not Displayed in %s" % result.output)
-- 
2.17.1

