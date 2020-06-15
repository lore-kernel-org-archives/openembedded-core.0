Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.26702.1592249786762276425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 12:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HWQVOhz9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e9so8011571pgo.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 12:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=guH6wejtyPltOdR+zez1rxJPEqAWwtzjl2Kyjz6joCo=;
        b=HWQVOhz9+5DJ31cRHJWGR/w7JAuf9K7X6KAjCHtrUuSbnZayixvsFSjBusBQ0s0mel
         hRtwd/MSLgV9DbmyNq9IVjoSf95VmL8+7PbrE44aI47WWo83F5fpLxsMbFtNY2nKNn1l
         p6y4U/jX+b1zUwxshT5Fl4fyIchYICZ6r7bvYQIviGhfIwCTfjS2sJIbjhtgdMfg2P8q
         sE8LvEjpjU3rSNY3sYLVqKZ1DCNPtZ3HCIFOUm0MroHtq03zIbvqyQd4+174PA8cTMxU
         N6XIZ5seg91PI8sN8j4OTlfUiLCQ9nPg7VN+YqR2EkvvhKpTcRWlZFcRuZVopoJHIE94
         GYWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=guH6wejtyPltOdR+zez1rxJPEqAWwtzjl2Kyjz6joCo=;
        b=EPRhnFmI1kcY58mXZ6F2UWEmXMWZS62Aq80rocZN2DiqQRBwkbdw1kEXU/ZFJByYFF
         EQ6HFJRCWhMBlYS7fNNAcXCf182/9cXIEo9XWbQUn6ei0AV1eOdQTGIb9hfmoKkCEBbi
         F7dxHy4hHyeCMtUyqEsLatdDUNKsoG3FNzAU7AkyzxLqe5jjo3F92iOJkfaaNtCGU7Iq
         b8CbbrD2cXCXA0IMQmmg2MdJbgfxA3cOjBonEnDjG5/9jWg3dsArtjkpdwoMxdM53dut
         6UVGBCASBgrrBL4R70tkLI8TGfAvC2WLVzQGeiLn63ZvikX51a5g+nMupRNw8FjSIWPG
         Jutw==
X-Gm-Message-State: AOAM5334tuOnbQkKtmZ8Dh0FVmQiecgb7oXY5QOGFxvBhK+4ZZQcNUl8
	VJsRkG8IosxZZPgcU9+XaED53qCMlYA=
X-Google-Smtp-Source: ABdhPJydoB2gOl7vrP72CJqK8+YZw1Fp+cZsOVo2XLyqcWxsKha+xOaJubshdqu3tN/p8PFNEo8/sA==
X-Received: by 2002:a63:d944:: with SMTP id e4mr22268562pgj.376.1592249785736;
        Mon, 15 Jun 2020 12:36:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u1sm12405492pgf.28.2020.06.15.12.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 12:36:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/21] cve-check: include epoch in product version output
Date: Mon, 15 Jun 2020 09:35:29 -1000
Message-Id: <99f6de1c74b581054c74c6b4598a5d47facc9964.1592249381.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592249381.git.steve@sakoman.com>
References: <cover.1592249381.git.steve@sakoman.com>

From: Ralph Siemsen <ralph.siemsen@linaro.org>

In the generated cve.log files, include the epoch in the product
version. This better matches how versions are displayed elsewhere,
in particular the bb.warn("Found unpatched CVE...") that appears
on the terminal when CVEs are found.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e1c3c0b6e5b01304e2127f5058986697e82adf93)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 556ac6e67f..514897e8b8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -301,7 +301,7 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
 
     for cve in sorted(cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
-        write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
+        write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
         if cve in whitelisted:
             write_string += "CVE STATUS: Whitelisted\n"
-- 
2.17.1

