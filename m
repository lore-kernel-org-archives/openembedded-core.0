Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.37514.1628865110177526534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=c2sOv71G;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so20864452pjn.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ofCZmj2go/X1GmnM24CWrrnyi0WgPO7BThYURdml8w4=;
        b=c2sOv71GT7clV1TlM1O6BAy2DD0h7B5UCn6YK8jZD2PX9imu8aT3vhAyqZQftsogq7
         ld/JF1of1caMWqHK7pSbT2O2ALZVBzihxAcIUNxiG0T5pRqTr9CsHHVmw1iN6I3CoRiN
         NdqFjjlDx11EvWrYQGlo/4O0bW+w3DIJopg6fcY+otZMeXDaHVa+kwKqtKGrMXf71tj3
         QAozoohq6Sh/rWaK+6XxSOOoqYxkwawFkEduJLOk9OzJRfmDEuQgVHIprG+3xebiYPdg
         hmXQjVTz47WH09MOO2WRAo2HuknOtiJY3AMnj/GAkd1t82IUUsgC9+tKsetdKjp8eWXA
         AUew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ofCZmj2go/X1GmnM24CWrrnyi0WgPO7BThYURdml8w4=;
        b=NqTnBQoVBB2C0pfna5Iyr8p9ZKhYOa32CUj2i5NyjXWeH7arSmnG/1HUB/CHc3Ppax
         92hr6eMlq303XokKROeHU3cna8WC91omWw7kHsKeUAJ634j5ZDyoTRPZ4HyroZDvbKL7
         fnz0LVPAonGyIURbDniOacaAWtQJczKKCGdcln7bA5KjULzd42L0LZLaH+Kd0v7G8ycS
         vqQ+uHeTRZzs+i2QV7nY2ypRw5yELgqMtRYOm/HOtdirtJ74y0Pf1RUiq+gRdq41OfKm
         KwsrobpbimmbSUbic3d8hT1Ee+ySGv2ny4zll0ah3Xe88+pwFOjMjpBWwg4lq+K8ukgX
         LFWg==
X-Gm-Message-State: AOAM531zcsUxWAE6I4dcCg7oV+ecDpy0VMHTOSGCdZt4rrWtIEqgYcLW
	J0omXy+6zER6OBwFxMkevp7YS7rUgViECNSk
X-Google-Smtp-Source: ABdhPJzOysqkJqCjxnkdimfvQ5l3JHfiI5Y1vaKtogTCmGK3ORw92wfJtoQX4AJmznk/Peah7zSe3A==
X-Received: by 2002:a17:90a:9205:: with SMTP id m5mr2942306pjo.172.1628865109283;
        Fri, 13 Aug 2021 07:31:49 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:48 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/17] license: Exclude COPYING.MIT from pseudo
Date: Fri, 13 Aug 2021 04:29:48 -1000
Message-Id: <46dd415720eb507a3d181a289b155ac4cfc2219c.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Along with the other license exclusions, we need to exclude the
top level COPYING.MIT file else when:

COPY_LIC_DIRS     = "1"
COPY_LIC_MANIFEST = "1"

is set, we see eSDK failures from a pseudo abort.

[YOCTO #14366]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3eb580843de3f055e42fcce60b0f15c4190c0542)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dc91118340..73f99e87a8 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,8 +31,8 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
-PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
-# it would be better to copy them in do_install_append, but find_license_filesa is python
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '') + ' ' + d.getVar('COREBASE') + '/meta/COPYING').split())}"
+# it would be better to copy them in do_install:append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
     if d.getVar('CLASSOVERRIDE') == 'class-target' and enabled:
-- 
2.25.1

