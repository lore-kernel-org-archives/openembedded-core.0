Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.17507.1590940431271772725
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:53:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KjQO1Qnu;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id k19so5396750edv.9
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Q8mPGCS92nVw8sX19smr47W92r4gPDfqpU6q7mx75o=;
        b=KjQO1QnuFVNkKW/2b3An4g89KWVoHik+RSS/JrGsK/f69DbkCTpd2cx3utNQPckTgT
         yQtC7hFwVqqfhLBwstU5W+JfKr1xR1K6A7sD2I2Erxvev22cIeTSeLjHvq+Rp4iZ0s3r
         NkvsQtJO8vtipB5sG78xDZDmLOX3ZtzjUDaWpt72eVZErLFE9WWqiIT/Dr71UHCAc0xD
         zuxUhL2vaim9HkIxc8KVzQqG+/z7GSfprcXjUgGS8E7eDINBGVQU58v4h37Tox5XZ5nc
         Hqf5xeIaOAgXOeEaWbND9YFKPJkDXjYW1nW/UKkzdOhZcCqp/jJhfZjatAqagK2MhBCd
         V8/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Q8mPGCS92nVw8sX19smr47W92r4gPDfqpU6q7mx75o=;
        b=CfnfuQSO8vIJ1cRnPzZPBgGKLF17LqSq45G3wMlDrWtzaiKEDWoQ29R2E6IyWIbA+a
         Th6D1u2akv6Bni8k3SywZUPedcG6cF8OUb6BflWAyYYDDjs4hAmbOb6bVBPZJZjB9Bik
         lmOH5tstLwE9iAGYT1S1BVnXKShdSPrfIuXWswLziUk/H2NxjGNE9hAclu2U5PRqVaY2
         QHin2AAaBNEeBD+6Iv6IN0cy4QwirPg7zcH6gzfn7LtMVikbttyHm4rKt8E+y0Eh97ik
         84HZGOVngbIv/QBUd2teOOCDy3H533IViBKujWEOxLMqxW6nVYIdvX1woerCNevcgdLT
         xTMA==
X-Gm-Message-State: AOAM532i2SC/IbBgo+fmBzpqg8BRJksBs7wWhKDd0Fzb8kcNdmxxyO3A
	EBkWV+zApaRtp1XfkWquCGFZawl6
X-Google-Smtp-Source: ABdhPJyHL1MtwSxuNIphDwFTK7jZJNx4PXtfc8Uj2TAQxiALQkd8UZr0sTJRzIbhUskEMgfFT2+ioA==
X-Received: by 2002:aa7:c682:: with SMTP id n2mr5120900edq.18.1590940429677;
        Sun, 31 May 2020 08:53:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:53:49 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 26/70] sudo: upgrade 1.8.31 -> 1.9.0
Date: Sun, 31 May 2020 17:52:10 +0200
Message-Id: <20200531155254.10283-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: additional copyright statements, all BSD
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/sudo/sudo.inc                          | 2 +-
 meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.9.0.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.31.bb => sudo_1.9.0.bb} (92%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 5d27d46928..86a18be7e2 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=4d1b44b1576eea036d78b8cc961aa93d \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=828cd502ad216ff869bf83adf3301e02 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.8.31.bb b/meta/recipes-extended/sudo/sudo_1.9.0.bb
similarity index 92%
rename from meta/recipes-extended/sudo/sudo_1.8.31.bb
rename to meta/recipes-extended/sudo/sudo_1.9.0.bb
index 39d8817c32..76266537b6 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.31.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "ce17ff6e72a70f8d5dabba8abf3cd2de"
-SRC_URI[sha256sum] = "7ea8d97a3cee4c844e0887ea7a1bd80eb54cc98fd77966776cb1a80653ad454f"
+SRC_URI[md5sum] = "060b91a6b171cb7ce587222664549b2c"
+SRC_URI[sha256sum] = "ab231439c5dfdf4ecbef74f10d5f7e9686c2255c2f3887085b5c5e13281bf95c"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.26.2

