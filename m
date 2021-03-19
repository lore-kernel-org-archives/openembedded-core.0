Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.3522.1616143517107937429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iODF0oek;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a7so8357082ejs.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zg87AaZhdRLjT+5zbMyB+iSGvPmSBT2+NsknPRyzZZ0=;
        b=iODF0oekoyLuyXqymUW20PXk+7479knIU6/dsg/n1mcPalCes3NifpzJEzVcI8TMya
         P8n+53XaR/zgowuq+Wnv7TboU3a9g+kVc6W8a5464SCEDfoFceTOyaD0gGQDIyfTKzah
         VfzM1C5uuddiALWCjCQNKVvQJZRJC3F3uR+4YzWcOI7ek5wCdsNVLs+ajZUzb1/Yr0Mn
         uMiPH1bv4DFKkf43GKnX9P9XTWAelM8jhBTlvdaoApDqjlJiYJTOyW4ULUrYvPGFA0ms
         cqokRoFLWimgwNBrvYSC4zd4JFL2u5RNt+v3PIkXB4PYaKBz1rAyfiUrsx9p1jDcKVN3
         6/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zg87AaZhdRLjT+5zbMyB+iSGvPmSBT2+NsknPRyzZZ0=;
        b=OIOre1V9Z8YXQZNEOF2HeiqKWdTKCj8/FDE1iLaToet66hpAGHvGYrDO/2adrw2zBn
         8UuliyGGaej5+bFrnnFmcBoOu37KrK66CIWWhJLbO+eWidaHIQYAO0qMNEoqPn3Q6zG0
         dSWG7O4AVpaGB0yb7RgNXYZmbEJCP/YBk5RU49DA4fpGF6tblHoo2Uv7RsDBvKxhFazt
         Xiyi1LY+9FjufA7tva0pJTwlH/sRZtc5BMp1JR9fYQr6UJwd1OeEEnd38Y9z92ijhVAA
         J+X/78VvN3luljqDR8vs8RKqpVKBu8cS2q7ENzSvWUOwFuITRPr+BWYVjXLoQ/lkChRf
         26xQ==
X-Gm-Message-State: AOAM532/qFbVB2FuQ7jyX8/AKZf1QejLgth7HdyXhrNuVQEj+sjfa1QD
	ig/2AcQD/YgqfIrhJ50h0DuSkQ9H7uMCEA==
X-Google-Smtp-Source: ABdhPJxpUwaIsVyDtnO1gmuEsGPEmWMUWK8R7+cPOw6qogfSxMHVBXr5NRQ+/EK0E8c3UDapSs8Qaw==
X-Received: by 2002:a17:906:12db:: with SMTP id l27mr3033581ejb.500.1616143515770;
        Fri, 19 Mar 2021 01:45:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/16] xxhash: import from meta-oe
Date: Fri, 19 Mar 2021 09:43:58 +0100
Message-Id: <20210319084401.576728-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319084401.576728-1-alex.kanavin@gmail.com>
References: <20210319084401.576728-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed for newer versions of apt.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc    |  1 +
 meta/recipes-support/xxhash/xxhash_0.8.0.bb | 23 +++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-support/xxhash/xxhash_0.8.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 99aaa1e763..048ad9d9c3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -799,6 +799,7 @@ RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwayland = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER_pn-xxhash = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denis@denix.org>"
diff --git a/meta/recipes-support/xxhash/xxhash_0.8.0.bb b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
new file mode 100644
index 0000000000..9e38872361
--- /dev/null
+++ b/meta/recipes-support/xxhash/xxhash_0.8.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Extremely fast non-cryptographic hash algorithm"
+DESCRIPTION = "xxHash is an extremely fast non-cryptographic hash algorithm, \
+working at speeds close to RAM limits."
+HOMEPAGE = "http://www.xxhash.com/"
+LICENSE = "BSD-2-Clause & GPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
+
+SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+SRCREV = "94e5f23e736f2bb67ebdf90727353e65344f9fc0"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	oe_runmake all
+}
+
+do_install () {
+	oe_runmake DESTDIR=${D} install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

