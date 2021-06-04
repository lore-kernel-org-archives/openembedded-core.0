Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.5866.1622798107727981353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EEZdvF7G;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id r11so10273936edt.13
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8WI7Ygz1kFlvDdVMHaqGf3GIxfYuqKeT9DE4eu4EZ8I=;
        b=EEZdvF7Gjmvk73baDJortQFuxZSX8GqJrRUnVgepfyyz5+DeiKyDPRyM4RcHi5mJJq
         OrIT1iVZ+iZ4HqzEteU1yejUvwYHIBfHJWj8WYR0QnCXyMqRygYGV95fj3GBRRfwuaQl
         daIyM5/KIn6Qydy8icW0cgTZCKNYucNg8DPlVmzvNcDjRJ97++SOSh+YMplS1WOQY8d2
         EuSHIU4unhQWRBcpqFsHdIBGNQjmDcsVDhbj1oFk/EXX0TFIANhy7C3Oq+r31welBjo8
         hsNS2aDxglNVw/+poOzC0BdAWYVtW4tJ9jIOHcN5WUqWVItSzLQKImoft4q9P6os4ABY
         cYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8WI7Ygz1kFlvDdVMHaqGf3GIxfYuqKeT9DE4eu4EZ8I=;
        b=AOPiCPfE9sQ3S8FA7QUH/gNnA2/YRis5N9YcwYue7PD4UvcP48pTAU6pVfnEUQDP81
         3fr07nv/kACUoWVEGej7ZnXNM2H7p53aBXUAjl4MYQhNYVSi5qJxsO1BkvfEtZKXx5tM
         pfAmlM3Am8bATndUg2HRB47DB5PA0zQ+ftzDUB6Du9qaGOc9WiMRFzmT1rjKBOl37Og6
         bVzCci5FEaw5rVb5Z+yOWlLwtG3MuouQRUV5NllTr7TtYnMQB4A5dLd1oEGHgU0kEq7Q
         0bCNMfyt9hNFvIMHyhqGcb5JoQGLzIr5J+dW3IGi4YXyAym2mFcgRrxiU2BxqNbjio24
         v5BA==
X-Gm-Message-State: AOAM530u7YQjF6D3nxVZq9HsWC6Jt6vbdKhx5PzrAl/ueomXq/O/Fela
	a5zhWTrDERj0Z4JUaBeJzD4uxthQWkjY1A==
X-Google-Smtp-Source: ABdhPJyyYarvl0NA499GLcTmZKZSVFNnCzJ9a1P28hn8rKAa77NAMs3FtzCgz0yXdN+6upnr4wvBSQ==
X-Received: by 2002:a05:6402:1d0c:: with SMTP id dg12mr3629158edb.155.1622798106386;
        Fri, 04 Jun 2021 02:15:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id br24sm2508544ejb.55.2021.06.04.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:15:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/10] perl-cross: 1.3.5 -> 1.3.6
Date: Fri,  4 Jun 2021 11:14:54 +0200
Message-Id: <20210604091458.1381144-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091458.1381144-1-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...nc_sel.sh-disable-thread_safe_nl_lan.patch | 27 +++++++++++++++++++
 ...{perlcross_1.3.5.bb => perlcross_1.3.6.bb} |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.5.bb => perlcross_1.3.6.bb} (86%)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch
new file mode 100644
index 0000000000..744e4e09c3
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch
@@ -0,0 +1,27 @@
+From d22f2bb5afcd278b68999f5ce0362328fc8c7723 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 3 Jun 2021 18:50:56 +0200
+Subject: [PATCH] cnf/configure_func_sel.sh: disable thread_safe_nl_langinfo_l
+
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/115]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ cnf/configure_func_sel.sh | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/cnf/configure_func_sel.sh b/cnf/configure_func_sel.sh
+index f48294f..90d350d 100644
+--- a/cnf/configure_func_sel.sh
++++ b/cnf/configure_func_sel.sh
+@@ -97,5 +97,9 @@ else
+ 	result "irrelevant"
+ fi
+ 
+-# Assume nl_langinfo_l is threadsafe if available
+-define d_thread_safe_nl_langinfo_l "$d_nl_langinfo_l"
++# thread_safe_nl_langinfo_l is not enabled by default
++# by upstream, and causes t/Langinfo.t to fail when it is
++# (starting from 5.34.0). This means the configuration is
++# either not well tested, or not at all tested, so we should
++# pick a safer option.
++define d_thread_safe_nl_langinfo_l "undef"
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
similarity index 86%
rename from meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index 0d81d4d0f1..b77bbd1fd4 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -16,10 +16,11 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://determinism.patch \
-"
+           file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
+           "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
+SRC_URI[perl-cross.sha256sum] = "4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.31.1

