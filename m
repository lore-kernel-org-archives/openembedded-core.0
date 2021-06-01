Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.58660.1622557162365347116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cPtaYkdi;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id r1so10793112pgk.8
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eNLLfiYyawzsRnrYk2f/EWRKb3MiUaNZmGzy0vmoOHE=;
        b=cPtaYkdiRKcM5HROj4Vsqr/IeNsj8XX1W9hE4VLuVMJOAffqUwq6co9sJYVuIcruVG
         dtQjlkSKOSTEDC+HgPhVe00t+uN8NPpdHrfXBBxftx2NM3Wc+a4SLOBYkb/4xHIipdoW
         6xGYYul1Rm+bncwSBEkCOlqku0L/w1CYlk7KXcTr+iDg96f3y/Q5JZ+3vw7PU+yhCUkw
         +cG/Yh0ylz1pEYiUn3UBUaLCQLbl8VSto1G4Du0X02nYb+1yZSHLEqJVjgmuPbPdf20T
         fCVgFjuBX/uMz+DB3nhTjoMytcWthB/vYtmM87lUwyFdXJrw3LZiiXoHHdAkYGYHX38K
         Jcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eNLLfiYyawzsRnrYk2f/EWRKb3MiUaNZmGzy0vmoOHE=;
        b=fiZ1OcPwF6EOk4k1t7EtJ91xcBW7nMwwL0dnppTGGRi/YKppIaLkjB5g/2b1F3H2Ny
         rMGfqxnRu0xpXktjNg8Uu7YO7LkX3GjTLsNHmPo2zL7hco3vC1kxwuzTYMe85MoYN8/Z
         a1vmenrv6OjrcTVorusY6qO+L7owb4SX+GXdUS23X7sTaptC3blIz7i8qyg/2pEWy6VN
         GdrFWEbjm8jaTUpp1zU3kJ7NXFwXC/Kh0GmryABQqZvVDZcwP9O0YJD6+1BCg08Y4yS5
         WsdxSeZB+KRy94RhnSGU7asr9luTpSopd2/H6rYtt0Os0k/8yEw9zCINIn2fnXkQQmuD
         e1Vg==
X-Gm-Message-State: AOAM532qqzx89m78MQkLxeutrYytdQOGupyQJH0zKkgkeMGMk2c3fWDW
	GrHrpuFzeCtAmrHKcPxszH7PN/OveL8X3G3kY+0=
X-Google-Smtp-Source: ABdhPJz7WHwz/zWPOEcHZYtMPKMzSVHrqgdTUKXKdTVekcdIaJtSFRyjmOdI+sNbIZyNMPp0Soiwig==
X-Received: by 2002:a63:581c:: with SMTP id m28mr28093034pgb.353.1622557161436;
        Tue, 01 Jun 2021 07:19:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 24/26] oeqa/runtime/rpm: Drop log message counting test component
Date: Tue,  1 Jun 2021 04:18:12 -1000
Message-Id: <fb22cf1891fa8d057348c5270715c45ac3ab9e25.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This test is flawed since multiple parts of the system can write to the log
and we obtain different numbers of log messages depending on factors we
can't control.

Drop the log testing component of the test.

[YOCTO #12465]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ad815dbafda0b90f5164f05d22dbbc26cb53f13)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 8e18b426f8..7a9d62c003 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -141,13 +141,4 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
 
         self.tc.target.run('rm -f %s' % self.dst)
 
-        # if using systemd this should ensure all entries are flushed to /var
-        status, output = self.target.run("journalctl --sync")
-        # Get the amount of entries in the log file
-        status, output = self.target.run(check_log_cmd)
-        msg = 'Failed to get the final size of the log file.'
-        self.assertEqual(0, status, msg=msg)
 
-        # Check that there's enough of them
-        self.assertGreaterEqual(int(output), 80,
-                                   'Cound not find sufficient amount of rpm entries in /var/log/messages, found {} entries'.format(output))
-- 
2.25.1

