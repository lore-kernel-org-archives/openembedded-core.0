Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D429DC87FD3
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 13:12:34 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.6310.1754140351121573508
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 06:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0zRoRUH;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-af93c3bac8fso182349766b.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754140349; x=1754745149; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nY+QzghTAg3suNPkqrdn4xNI1Qepkyjuhx0JmKN0gc0=;
        b=l0zRoRUHgCFwt4TFKRTQCFvEbHCWc5vQq1+CSOTEJIFiGyVlUNNkfc9rjoBuHKt//f
         O8bNIb84m71I11eUdwq8w1/xxSOR7cfZMQBYkVfF5MGuXxz/nMh1RcoqF7AkD6vaEJ9+
         fWjI5kshwOUd/LYuGXEmBZKb4wUPrvCZFDl50oK5qKkfLL/Hfa5TtoN+zT5KQvwU/yH4
         HQrT6AsbNM1WcsKmfgkezLxg8qSmhUb2KEH1sojQOiky/86+p1vGuwOjuEa1W3Pv6AUY
         ZSSTD8+d1AQw0jKOjBxfeV3gUW3zPpNDVY1oZVkglDNLLkxqCJPSRQEwNOynqVtb8zLX
         Y6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754140349; x=1754745149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nY+QzghTAg3suNPkqrdn4xNI1Qepkyjuhx0JmKN0gc0=;
        b=MP/TldryHhDqljc4uBhyddhHObphgkYHYWfMoquXcRWCmsYYJjxZF7qVjamcbJFu0v
         NITqyRxEyMkallUo7h+4Ojyla7R7oAW46Gsu7BaQkFaXmiQY95e2SXPz0A6y8QcTDVfd
         WQE51xGGKLpUvAEah6Rexo3aBx/Yg45J1u8LWraONRrMR+kXoRwwcIyosXU/8rTW9MVH
         x5kKIU+WybkdqWFJ+4c7S8NyItiM/y9hCSpDM/+CQiNbnz78yrOjvR5ta+Eg75CzZblY
         MrC5X62tMyKWTeN8owujQcRYKy5+vS2nGAn4oO0Q68oUJ2phe1i+0dOq/8CVrLER5L7z
         MH5w==
X-Gm-Message-State: AOJu0Yz8NOfRNPAaC7UNjnuJmH4Te7tcB8XKxQ2WIGDjpApm7ilgiOnP
	ikGCBMtNGGRvt7l4W0fsp7sfQgzz0SxhyLLoVM2RvjtRuPSCfsN0EGLJZ4ZHWg==
X-Gm-Gg: ASbGnctCQebwZ3Pa4E1in8cEBzM8HaIhyY8O3ToJhaJvWU7qrBwPeJjxIDlwpxqvSvs
	BTltV1r7nPF0ibRICIz01iFQ+Nh5croX+6G8ET6VOc2UFfkE4jYefazQPtt8ZJjXQqHA/7rvMV5
	4CDNpEg6eMJykxf6fI+vNKj3FdgQlIcBP9nK7Nv/7I2uSBF0xpgzxeAKkQeWXF4TzgtNC3Y3pnd
	jTiLua1g6UpTLbA6K54hA/nEyD32uH2cLHuZ5SdJ6yNRc+YrRoaJgFepwhyBGwbltfFYy5NqMWh
	s8MdIjE7GukOKYon/JlM0QFBMtPcsI5HMqdmLn6NCnBizs5mi0VV8h3jNcyyOrFcyBhGVZoCjwN
	1ie43zeOkVB5nDyZrUp8=
X-Google-Smtp-Source: AGHT+IEKn9NLIhvbEu2nzknjFOL0p+LeDZ7qiwAvagdLn1+PlATF3egUzND6/i1D+u1meXKBjN0tvw==
X-Received: by 2002:a17:907:6d14:b0:ae1:f1e3:ccea with SMTP id a640c23a62f3a-af93ffbfcf7mr357425566b.7.1754140349087;
        Sat, 02 Aug 2025 06:12:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af937214cf1sm217963866b.143.2025.08.02.06.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 06:12:28 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] dpkg: add ptest support
Date: Sat,  2 Aug 2025 15:12:27 +0200
Message-ID: <20250802131227.677594-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250802131227.677594-1-skandigraun@gmail.com>
References: <20250802131227.677594-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 13:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221382

Added it to slow tests, as it takes betwen 165 and 190 seconds on my
machine to execute (qemux86-64 + kvm).

The test folder's Makefile contains a list of passing, failing and manual
tests. By default, only the expected-to-pass tests are executed by the
Makefile (unless magic environment variable is set).

The run-ptest script mimics the default behavior of executing the
expected-to-pass tests, however they are executed one by one, instead of
running them as one batch - that way it is easier to determine exactly
which tests pass and which fail.

One other thing that might worth a note, is that the tests folder that needs to be
installed contains a number of subfolders called "DEBIAN". When packaging them
at least with rpm, these folders are omitted from the package. 
However these are essential for the tests, as they contain test data. As a 
workaround, these folders are renamed during installation to DEBIAN-ptest, 
and before execution the run-ptest script restores their names.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/dpkg/dpkg.inc           | 17 ++++++++-
 meta/recipes-devtools/dpkg/dpkg/run-ptest     | 37 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |  1 +
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 4451e00b48..7e08225b99 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -100,6 +100,7 @@ PTESTS_SLOW = "\
     coreutils \
     curl \
     dbus \
+    dpkg \
     e2fsprogs \
     elfutils \
     gettext \
diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index dea1894a4c..48dc069740 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -11,7 +11,7 @@ RDEPENDS:${PN}:class-native = ""
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
-inherit autotools gettext perlnative pkgconfig perl-version update-alternatives bash-completion
+inherit autotools gettext perlnative pkgconfig perl-version update-alternatives bash-completion ptest
 
 PERL:class-native = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
 
@@ -56,6 +56,19 @@ do_install:append () {
 	fi
 }
 
+do_install_ptest () {
+        install -d ${D}${PTEST_PATH}/tests ${D}${PTEST_PATH}/src/sh
+        install -m 0755 ${S}/src/sh/dpkg-error.sh ${D}${PTEST_PATH}/src/sh/
+        cp --preserve=mode,timestamps -R ${S}/tests/* ${D}${PTEST_PATH}/tests
+
+        # The folder has a number of test folders called DEBIAN, but these are
+        # explicitly omitted from some packages, e.g. from rpm.
+        # However these are essential for the tests, so rename them to DEBIAN-ptest, and at runtime
+        # from the run-ptest script restore their names
+        find ${D}${PTEST_PATH}/tests -name DEBIAN -type d | xargs -n1 -I{} mv "{}" "{}-ptest"
+}
+
+
 PROV = "virtual/update-alternatives"
 PROV:class-native = ""
 PROV:class-nativesdk = ""
@@ -90,6 +103,8 @@ RDEPENDS:${PN}-perl += "perl-module-carp perl-module-constant \
                         perl-module-time-hires perl-module-time-piece \
                         perl-module-xsloader"
 
+RDEPENDS:${PN}-ptest += "make coreutils findutils"
+
 # Split out start-stop-daemon to its own package.  Note that it
 # is installed in a different directory than the one used for
 # the bitbake version.
diff --git a/meta/recipes-devtools/dpkg/dpkg/run-ptest b/meta/recipes-devtools/dpkg/dpkg/run-ptest
new file mode 100644
index 0000000000..6a4f16a6e1
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/run-ptest
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+rm -f dpkg-test.log
+cd tests
+
+RESULT=0
+
+# During installation the "DEBIAN" folders are renamed to avoid
+# problems with packaging. Restore their names here.
+for d in $(find . -name DEBIAN-ptest -type d); do
+        dname=$(dirname "$d")
+        mv ${d} ${dname}/DEBIAN
+done
+
+# This allows running tests that require root access (which we have)
+export DPKG_AS_ROOT=1
+
+# The test suite has also a number of test that are expected to fail,
+# and some manual tests also. By default, only the tests are executed
+# by the Makefile which are expected to pass - do the same also.
+#
+# It is possible to run all tests with "make test" also, however
+# it is hard to parse the actual results, what is broken, what is not
+# due to the amount of output.
+
+for test in $(grep "TESTS_PASS +=" Makefile | cut -f3 -d" "); do
+    make ${test}-test >> ../dpkg-test.log 2>&1
+
+    if [ $? -eq 0 ]; then
+        echo OK: $test
+    else
+        echo FAIL: $test
+        RESULT=1
+    fi
+done
+
+exit ${RESULT}
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
index cc30b71109..d793c26d57 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.22.21.bb
@@ -6,6 +6,7 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.22.
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
            file://add_armeb_triplet_entry.patch \
+           file://run-ptest \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
            file://0001-script.c-avoid-use-of-chroot.patch \
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \

