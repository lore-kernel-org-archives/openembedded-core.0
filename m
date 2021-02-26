Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.10045.1614349586346870814
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j4yFkKjx;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.50, mailfrom: steve@sakoman.com)
Received: by mail-io1-f50.google.com with SMTP id p16so9797805ioj.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hsORcm0Eb5T1kUEq0+tql+otxE4Xg/TIrdpu6/m1B74=;
        b=j4yFkKjxG8Gul+zQvlMJQT/U7u7q7IXQtmt0fKlnHoOJM8II9scBD12ZWw9lzTX9Yu
         P6lLExzBpPwfFgm81PfdMHY8vAVmHu9OSfHAchIRt/3JICS6ROy8xmjjrZyVGUVdn9jl
         imxKImdLj0hJdZIH3sqRT0rqlxo1nqEK1n4db1SGaL2IAcBSN0nFEiETCyC2LghoLPl9
         ywa/OOzaF1Y5StaNbn/7BWopFcOvwIXG8lHyMKtY7zEWU8c6quhk+63eDBd8/Q7anVGE
         YuqxynkuDXfK5rllkaZCgCYzLBAto83hhbkOQSaOPdbUYv0sVVXjHwve2iAI/DeTNDuU
         aJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hsORcm0Eb5T1kUEq0+tql+otxE4Xg/TIrdpu6/m1B74=;
        b=LKd00p4fwLdcjnrgPW/1l0xnsPs3A+KaJhJEdvLYM5k9BRplhv4Eiww+qYeMyrws6U
         v8IC99/S1cfLYkanSSniTGp8HYWKFb5ERaY9m22PFYAY3BNRkmNlmxtXlbAyAMpvm9YS
         BkSRh2SjOi1oXTyyRZkYh38ND1oPr/8ci6d9dovqreW0PSaEtgEvecfIx3ohyo22G44j
         cLSYilsfx4arGPB36BbjVoee+zBM2laYONcVBIWoTt6zqjWlltTHSrouvJh+B2+OjPpi
         vC5fvW6XXfQ8UbkhfYnWHzDHPn0HnL/TJ+TU8SurUKhqgHkWkWMBvK2wjeX3PhznqBNv
         roKg==
X-Gm-Message-State: AOAM530er88gaXy12CI9Gu6ENmHaa77J4wg1E0On8MTAUW+HeKyR2cOg
	ca8KHl8+m/tk5gL1XStoRgZ0PpiR3XHBizPd
X-Google-Smtp-Source: ABdhPJw8Ma0QqUCu45NChX8llp7HhYNV0z82IxZxpFXSrBmlJ0CGE7nt3sAejq9OMfuQ6Qt3s24SkQ==
X-Received: by 2002:a02:3ec7:: with SMTP id s190mr3152559jas.11.1614349585096;
        Fri, 26 Feb 2021 06:26:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.26.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/40] oeqa: reproducible: Add more logging
Date: Fri, 26 Feb 2021 04:24:00 -1000
Message-Id: <025c2a637b675f79f31b0cc50b1141655a1dd349.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

The reproducible build tests can take a long time, so having more
logging messages at various points in the build can help debug where the
build is taking a long time.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b792afe8759d62af8e713b86dad8f6721961a05)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index d01a2665c2..d4800022df 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -161,6 +161,7 @@ class ReproducibleTests(OESelftestTestCase):
                 SSTATE_MIRRORS = ""
                 ''')
 
+        self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
         bitbake(' '.join(self.images))
@@ -187,6 +188,7 @@ class ReproducibleTests(OESelftestTestCase):
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
         vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
+
         vars_B = self.do_test_build('reproducibleB', False)
 
         # NOTE: The temp directories from the reproducible build are purposely
@@ -201,6 +203,7 @@ class ReproducibleTests(OESelftestTestCase):
                 deploy_A = vars_A['DEPLOY_DIR_' + c.upper()]
                 deploy_B = vars_B['DEPLOY_DIR_' + c.upper()]
 
+                self.logger.info('Checking %s packages for differences...' % c)
                 result = self.compare_packages(deploy_A, deploy_B, diffutils_sysroot)
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
-- 
2.25.1

