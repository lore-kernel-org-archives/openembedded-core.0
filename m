Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.35164.1607956642776905493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PypVe7O6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id y8so8715783plp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rVnLgDkkIbOStsSYKqVmF44xpjP5griJLIDrTT6AtFM=;
        b=PypVe7O6G5sWefa0ddUcvmaYzXPLsSMucF/io6MVEBBVdEGvKlCb9NFrfDCO+nxCsC
         7KrlOaeDLzd2V+b9tDcu+R3zzPraTchlEFZq/x+k2+y4IBrl8wQa/4CEkT+/GBeWo7hS
         HM9EBllVu8sURT/eTs8KfcCmnJ2eH+UaOuOoz8W7YE0kFDx8BJ4yZnpd1Pm2/KDFqU+g
         ep0yMqlWNjgKuKu54YVGM5KAw3X0KRcWi6rIya1ISWtg0HhxCmt7FvqZtLzx7G1yha84
         SkjB6GV860rZpp3mFP/JESav/fCSDux5sqaPHO/iokR/Oui5K0R+tW1/pZ/sw7VADDdL
         Qz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rVnLgDkkIbOStsSYKqVmF44xpjP5griJLIDrTT6AtFM=;
        b=lnd90iySWyUtjxAG36qY2BjNI3SdA7M4HO0o0yN9USgAQhgbGENbjBMg3Hpl/fU7qB
         NiKPtrtWmV76wwq5Z1XEYc4n7Kx6nD01QsgytfIOzKH7yGNgoqzc4LBDjBF1wY5nXyk5
         pKcReqR0K+QM9cRrVYvIkYyHFcJRny/Pn9ndNeBsrnjDoCmlf5tsDuykKNvK7MVB3QMz
         OeeTc2AsIky4249K73SSHAp500vQqBcn5HcJ0UsiQgPopyB90i53Rhdzeshcm8jhg84R
         qenPri99oofnlZwfRNBGYXuz7M3ElWrnbCu7CjHo/FuPwgbVsnQWbqAuL33PZY9DRipJ
         6N3w==
X-Gm-Message-State: AOAM533YMUoVLoF+5FEng4C8Y629qaAe0q1b1p+hE9mL22SD93ZF6sb2
	vI6AaD6Btsc/ZEq4EitHvrR0eHcUIc1pq8Qg
X-Google-Smtp-Source: ABdhPJwW53s9fECT7H4O1XIYPx7e7bWg2Q9C7XN5wfX3lhs6kbjiQGlrVE4mXYZaUfSDsi2BjrEWwQ==
X-Received: by 2002:a17:902:9682:b029:db:f9ef:40f5 with SMTP id n2-20020a1709029682b02900dbf9ef40f5mr6874089plp.23.1607956641892;
        Mon, 14 Dec 2020 06:37:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:21 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/25] oeqa/devtool: use Yocto mirror for pv-1.5.3 tarball
Date: Mon, 14 Dec 2020 04:36:34 -1000
Message-Id: <ab3a9bd56d86ed22515906b2d23e6a83053fcd37.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Some of the selftests failed over the weekend with "access denied" errors
fetching this tarball.  Instead of relying on upstream when fetching the
tarball, use the Yocto source mirrors instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 988e0ff4131f46dfed14516ff5f61d72b9fb6941)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index d8bf4aea08..5f59d14402 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -269,7 +269,7 @@ class DevtoolAddTests(DevtoolBase):
         self.track_for_cleanup(tempdir)
         pn = 'pv'
         pv = '1.5.3'
-        url = 'http://www.ivarch.com/programs/sources/pv-1.5.3.tar.bz2'
+        url = 'http://downloads.yoctoproject.org/mirror/sources/pv-1.5.3.tar.bz2'
         result = runCmd('wget %s' % url, cwd=tempdir)
         result = runCmd('tar xfv %s' % os.path.basename(url), cwd=tempdir)
         srcdir = os.path.join(tempdir, '%s-%s' % (pn, pv))
-- 
2.17.1

