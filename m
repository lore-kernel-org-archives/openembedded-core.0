Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web08.7844.1614526641203041928
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dPt9B8wq;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id ci14so4568088ejc.7
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PYwFYEiaFv1evbOM1DhSs8fQQNQmMBPnStU73M4hqwU=;
        b=dPt9B8wqyeCbWTgywsM6gi4dpcbg3XlnwPgNgxh9/hzH9Gonu8d2Y1loS/B28C4VjQ
         kMYB58Jk/VCCckf8f1GZVWQP7mLPpdVJvLBMxCX45z+e99/0KnXKGsIuq4IAf+EnIFCg
         dQmaF+nxOF+rHD7jlY/frPH2OXEI11dZnRRwQsPhGui4b5zcTTAsdRoGS7QNtuAcUoHr
         Yy7Joh0dTVNe5l6cdX4Pkad6jGIc9cFyd7h/g+CALheSMiAjCLXOOWP70bHcK+kiyk0n
         xd2E0t3vQDfZfMgyIPdaufQnBqYpF3fePfaZNTr7lIJTT2Mt4ZPp8pKt0FrOwK26dUiB
         GgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PYwFYEiaFv1evbOM1DhSs8fQQNQmMBPnStU73M4hqwU=;
        b=twYKy2LvO8SEmrXsETnh4LTzGDCZVtXaIpIH4Mk1eHIrOE91U1rdau7A/xutLKVGqs
         3IZA3BYu9c8996MC2NUR/HMKP7NhfLzZ4iCXihCTWTVT7x42y3F7Fs9dPncHLPUnkuER
         V+IjdSpHYkfQBfiPNhZ6hWWWNBwAxzT3pygvSroBCno7uX1KoO2jE/RlPOD1H86v8K7e
         p3xULvhBErVf619VHKpcbFCZz4WHwVJCcCnrqeNIX9ff+JPH6qLZFUdbxyd0vlXgfmdN
         COgvJMEMznrt/t1fNKC/S0amu9swxVtDPGyzAsI6PIe51tbnrP3YScuOtV9OsKxeNEuA
         WEAQ==
X-Gm-Message-State: AOAM533j8R9Inr0ZRiKfYQOAxWk0Ktj5tLx5mDcvlHo93YnqMvS39pP8
	g2S3wCDWcdjz2AjDzSZNCagO30Uml7HcdA==
X-Google-Smtp-Source: ABdhPJyQl/tIglQB6N5wbiIq6yxyQgsZa+j8/38LxIH09fIU1Glsb5JwQ+j0HTmFcSWURZFLkDcWXw==
X-Received: by 2002:a17:906:2803:: with SMTP id r3mr12046201ejc.50.1614526639529;
        Sun, 28 Feb 2021 07:37:19 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:19 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/24] perl: update 5.32.0 -> 5.32.1
Date: Sun, 28 Feb 2021 16:36:49 +0100
Message-Id: <20210228153702.498275-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop perl-cross-makefile.patch as it is merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../perl/files/perl-cross-makefile.patch      | 29 -------------------
 .../perl/{perl_5.32.0.bb => perl_5.32.1.bb}   |  7 ++---
 2 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/perl-cross-makefile.patch
 rename meta/recipes-devtools/perl/{perl_5.32.0.bb => perl_5.32.1.bb} (98%)

diff --git a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch b/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
deleted file mode 100644
index 5d3f998200..0000000000
--- a/meta/recipes-devtools/perl/files/perl-cross-makefile.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Makefile: Avoid continual rebuilds of miniperl and associated races 
-
-In the Yocto Project, when we run "make install" we notice miniperl
-rebuilding multiple times. Usually this is harmless however sometimes
-race issues occur such as miniperl not being executable.
-
-The issue is that crosspatch is a phony target so it always rebuilds.
-Adding this as a dependency of miniperl means miniperl always rebuilds
-too.
-
-Avoid this by injecting a direct dependency avoiding the phony target.
-miniperl is then only rebuilt when its input changes as desired.
-
-Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/95]
-
-Index: perl-5.32.0/Makefile
-===================================================================
---- perl-5.32.0.orig/Makefile
-+++ perl-5.32.0/Makefile
-@@ -56,7 +56,7 @@ crosspatch: $(CROSSPATCHED)
- 
- # A minor fix for buildroot, force crosspatching when running "make perl modules"
- # instead of "make all".
--miniperlmain$O: crosspatch
-+miniperlmain$O: $(CROSSPATCHED)
- 
- # Original versions are not saved anymore; patch generally takes care of this,
- # and if that fails, reaching for the source tarball is the safest option.
diff --git a/meta/recipes-devtools/perl/perl_5.32.0.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.32.0.bb
rename to meta/recipes-devtools/perl/perl_5.32.1.bb
index 7d88c65322..1fafc0a8c9 100644
--- a/meta/recipes-devtools/perl/perl_5.32.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
 
 
 SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
-           https://github.com/arsv/perl-cross/releases/download/1.3.4/perl-cross-1.3.4.tar.gz;name=perl-cross \
+           https://github.com/arsv/perl-cross/releases/download/1.3.5/perl-cross-1.3.5.tar.gz;name=perl-cross \
            file://perl-rdepends.txt \
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-ExtUtils-MakeMaker-add-LDFLAGS-when-linking-binary-m.patch \
@@ -21,7 +21,6 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://0002-Constant-Fix-up-shebang.patch \
            file://determinism.patch  \
-           file://perl-cross-makefile.patch \
            "
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
@@ -30,8 +29,8 @@ SRC_URI_append_class-target = " \
            file://encodefix.patch \
 "
 
-SRC_URI[perl.sha256sum] = "efeb1ce1f10824190ad1cadbcccf6fdb8a5d37007d0100d2d9ae5f2b5900c0b4"
-SRC_URI[perl-cross.sha256sum] = "755aa0ca8141a942188a269564f86c3c82349f82c346ed5c992495d7f35138ba"
+SRC_URI[perl.sha256sum] = "03b693901cd8ae807231b1787798cf1f2e0b8a56218d07b7da44f784a7caeb2c"
+SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
 
 S = "${WORKDIR}/perl-${PV}"
 
-- 
2.29.2

