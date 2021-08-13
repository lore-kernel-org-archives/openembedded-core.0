Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.37348.1628865155612239885
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=nFJRYFOL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so16262166pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9q742YBCpXXxlt/MR+N5rkkR0Nfr+fRiNlKa8ePS+l4=;
        b=nFJRYFOLzwdnydPLkm6Fg+mQrb13SLiwusfHZexp0u/sP/IvDEVd66io8zyUx2Ujgu
         af+1swmrJwrSoQ+HmkNQdOD58Ooo6bXEutPBfSLkvivBb73IHFV6X84F9Fw/B+ERzllE
         SBSIb4alpiaq0wmWL79wlCrMW81jWtgv+kfBgXJK/3aVGo82QRFwQCGr0iHtMHj1ucCS
         qoM+oiTNhORxxlkpjG7Vi2X5AYxc0a5bcmQzbJOeRbNGZdpV8kRSHC9blbv7lSXD+T8V
         KRZakQUcsObMui3BJgVNoY/aovVQ2fBWy/cXOLqmiTWLsnuynpLlGbDDvPVhnBGehQqF
         Xtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9q742YBCpXXxlt/MR+N5rkkR0Nfr+fRiNlKa8ePS+l4=;
        b=Oati3fOghlfJob9WlMMtM5JNLtPSJGemZKiplB6JdHNdzGlvnoSgYzf5O8CJkxClgx
         MYP5ck1kl1Gs2k+85neZ1cjpkGn4+TRjdruz2GhD/hUGGjSo++/6ziQcIKWPZOOsBBz4
         YSc1T7HlckCl/JQb86JLLTF1O+3e+zA01Wf4XvETaVanoa98lY/13oiX6U9PIAQQQqD4
         fefwWHawqgAHQ7wn+p1FDQAEZZe4HDojGcpWf4pfkDT6EfBwMyH1aSpTSYFQOYHYbwgZ
         ysTsAWku12CibjPCEaky6ETmNl+IJiOe5SsTlHsQyRjQ4zkCK/Qtghn2bwrWBBmlzpvi
         A+1A==
X-Gm-Message-State: AOAM530aaN7v4SoWS/WJiKwGqsFXmcZZ3EB1OlJOiecraGy4Etjg/woe
	eDh6z4OcjabE/4Np6eoYqEl4oVI4wl1XB8PR
X-Google-Smtp-Source: ABdhPJxvSUAZC90ozB0BjkDHOjC1vi+FB6vTVu5lbFirEU7oQtL1uSbe9gwqsD27hFM67Zj6CXudTA==
X-Received: by 2002:a17:902:ced0:b029:12d:4ce1:ce3a with SMTP id d16-20020a170902ced0b029012d4ce1ce3amr2327475plg.0.1628865154734;
        Fri, 13 Aug 2021 07:32:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.32.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:32:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/17] cve-check: improve comment about CVE patch file names
Date: Fri, 13 Aug 2021 04:29:55 -1000
Message-Id: <b72c597ee7f75e88a6db7009e7c955b970791062.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8aa613480663e11ecc62278d8c57ca719eb23899)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index df6ebfd29d..f9e5cfa451 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -166,9 +166,12 @@ def get_patches_cves(d):
     pn = d.getVar("PN")
     cve_match = re.compile("CVE:( CVE\-\d{4}\-\d+)+")
 
-    # Matches last CVE-1234-211432 in the file name, also if written
-    # with small letters. Not supporting multiple CVE id's in a single
-    # file name.
+    # Matches the last "CVE-YYYY-ID" in the file name, also if written
+    # in lowercase. Possible to have multiple CVE IDs in a single
+    # file name, but only the last one will be detected from the file name.
+    # However, patch files contents addressing multiple CVE IDs are supported
+    # (cve_match regular expression)
+
     cve_file_name_match = re.compile(".*([Cc][Vv][Ee]\-\d{4}\-\d+)")
 
     patched_cves = set()
-- 
2.25.1

