Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97120CDB482
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:41 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.75796.1697319934832826704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vm5zdjnt;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.179, mailfrom: steve@sakoman.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3576121362eso8418345ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319934; x=1697924734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ugn0cvDz9iaCQZzC1MFO+TmlKee7+Oa475xty861DmY=;
        b=Vm5zdjntWlFLRuU1aJO6hguzBkMSbaoSZPr1Cd+ANZNlEpA3w1hGcRBSRB6sczCXcS
         p24rep0piMZS436I702xbCMtGlJjnP+JFkfVv4jQEFeoe2cOkbzExJC3sTUXSl7M9vah
         KCrmcDnt131681OuhMMCndZUaHx7cg9JcJj3W5kFYLGKcQnZHdGB/fuvMdi3cmiKX2++
         4ua+AtpMDcWQuoDRmBXSDQixLNAdvlnKbY6y7f44zi/YCOV/FUauDX2DuBWN/tqlwLEH
         GbQuJJvhzvCIKO+as7p4CptgZ8UNF16kGlrz+XpPsElbcuiwa0bt0tYNAMMbavDSsWcW
         mtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319934; x=1697924734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ugn0cvDz9iaCQZzC1MFO+TmlKee7+Oa475xty861DmY=;
        b=OuqZ90+L38vVPd4j5NsZlWcmNReKXeu6xpHBp0TR/4AXqlQTIfCGi0sTqTTO15d5Ij
         85ZYTr4JMXg3nn/c+ILjWtmwH9mA5e+9u8rHjSGW12lvhhn3DbMebv75NqvK64QcNZWm
         SDdebIch2V+z6BUgkWaLxjD4iQHbcVtnWBWGbrxsiqI5NeMTYKTUeMfd7FPOt9ZOQRsW
         kbmnq4HA0qnQ3rgPLEwUVrZ/AcrolrrusltiIfm014NCqVAeSOd/GTvAZ2bo9caeqxef
         jr6vZowp9zgMTe4MLkhrOeLsBMMijLcp7bfs93dQKOOL0eQXJMRQFjH/lXdyvZYt0Q9i
         q6OQ==
X-Gm-Message-State: AOJu0YyuET7fqM6Q/lj6lmCFk3uZZeOKoX79xlXRS5FCzT1sTedIYOqz
	J8Psiwb6B8RpmEDsDLAL2xDzhRh62WcOivEAWbg=
X-Google-Smtp-Source: AGHT+IHJvuDArLbMNkRazgIQmcwV4urrPqkgcTj1TIUML6OaeR6wPbuJhMmFhVFOFBfk3bfF2nnLMQ==
X-Received: by 2002:a05:6e02:1d9b:b0:34c:b981:52d4 with SMTP id h27-20020a056e021d9b00b0034cb98152d4mr38923098ila.31.1697319933703;
        Sat, 14 Oct 2023 14:45:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/13] python3-urllib3: upgrade 1.26.13 -> 1.26.14
Date: Sat, 14 Oct 2023 11:44:55 -1000
Message-Id: <aefb7af6b56269d45170beb99e6c878bf2448b78.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697319777.git.steve@sakoman.com>
References: <cover.1697319777.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189134

From: Tim Orling <ticotimo@gmail.com>

https://github.com/urllib3/urllib3/blob/1.26.14/CHANGES.rst#12614-2023-01-11

1.26.14 (2023-01-11)
    Fixed parsing of port 0 (zero) returning None, instead of 0. (#2850)
    Removed deprecated getheaders() calls in contrib module.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 55ab1bf20e6893088acb6460e9004dac8e205559)
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.13.bb => python3-urllib3_1.26.14.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb b/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
rename to meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
index 7af95117cf..f35a141df2 100644
--- a/meta/recipes-devtools/python/python3-urllib3_1.26.13.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_1.26.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "c083dd0dce68dbfbe1129d5271cb90f9447dea7d52097c6e0126120c521ddea8"
+SRC_URI[sha256sum] = "076907bf8fd355cde77728471316625a4d2f7e713c125f51953bb5b3eecf4f72"
 
 inherit pypi setuptools3
 
-- 
2.34.1


