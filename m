Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C11C433FE
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 17:52:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.60.1668793950140637232
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 09:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L83YlGgG;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y13so5561089pfp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 09:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tXrULKcBkZxVgjzRxoFMmjvk2qVYkiEbUJq0dVfR9E=;
        b=L83YlGgGi485cINwtYMwlSI6YxmwIH3taFvNs6h41MmGuwtRauSCdW2KIYGK03wNV5
         gNxr3BYhG0PHI5rlkm9NDqj1RvOLRsFgl/etdZcOpFCyT1FEmv76WRqNC3MyCI3XIp7s
         Owp4qJ1p+ADCJcHXlSGI1QNEnqm/Xk1q0lh9buALM/lXjA2GW4oVnP7KN4gr9l00pvk8
         8Y/0+GVQo1swgwos1ItQQPmSXjO4Rz/IqzwMX86w+CESCfFUV280fvzHfW/opUXsToQo
         Z8NC54ghTZOew2q+cUgF9qVHzGadFZsDNOtYB6viUFvqMtRFVtDmTt+R+Ss7cWgnY6wf
         oKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tXrULKcBkZxVgjzRxoFMmjvk2qVYkiEbUJq0dVfR9E=;
        b=F3LhlCr7Ecn6r34WtF5HqjrHsx9gT+xptB4BNUycGNyhiaeVqYKhC21/Jvf6Ufg/SX
         zH0HiFCp2d6s+hlFntICd+tnrensgs2eqIC5QKC3hwwFMNidFlM+TxsXZixqQ2zoFF6R
         MRl9T3F9HKKTjwuVS+w0ERX9MfRwcqSoBq7iGjj07Lxf4HFsWjzplobvluIkSFJ/XryV
         ocIEWam/JTyl31S6zi0ehbCkDr0qUhIkmD2dbBgfDq4mpXco7Fl4owpcafnS+Cizn984
         ktZkVYRlRWnj3SRjMVR45/auJ12t39uf3dnyp4mDIOSBJG056y94LHfP2yod/zoH6Oh1
         pw4w==
X-Gm-Message-State: ANoB5pkgxEHJUe6j/e7DN77MNBSlRSFaQ1vRp8VWkHa1TBjaU9Ok/3MU
	ps8DLOUzaBtQEzcpFz5zsbZj4PhcdHwEhw==
X-Google-Smtp-Source: AA0mqf4MH8cZRd6LCLYDY0/Gg5B8BuHBoaNgZXQrd8YJWbDYcui6HPD6vA5PDLWBtHGTQTX7TTOh0w==
X-Received: by 2002:a63:145e:0:b0:473:c377:b82 with SMTP id 30-20020a63145e000000b00473c3770b82mr7873593pgu.113.1668793952082;
        Fri, 18 Nov 2022 09:52:32 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:6693:e191:c3fe:39ff])
        by smtp.gmail.com with ESMTPSA id k28-20020aa79d1c000000b0056c702a370dsm3443173pfp.117.2022.11.18.09.52.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 09:52:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libtest-fatal-perl: add recipe for 0.016
Date: Fri, 18 Nov 2022 09:52:05 -0800
Message-Id: <74ae6498d65b11537ea8547d1a5206d2c6aec78a.1668793524.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1668793524.git.tim.orling@konsulko.com>
References: <cover.1668793524.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 17:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173485

Test::Fatal - incredibly simple helpers for testing code with exceptions

https://metacpan.org/release/RJBS/Test-Fatal-0.016

* Dependency for liburi-perl ptest.
* Add self as maintainer
* Add to ptest-packages.inc (fast)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../perl/libtest-fatal-perl_0.016.bb          | 36 +++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 141578a7a99..42e705bda95 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -389,6 +389,7 @@ RECIPE_MAINTAINER:pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-libtest-fatal-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtest-needs-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libtimedate-perl = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index b0925e13dd0..983f1dd72a5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -33,6 +33,7 @@ PTESTS_FAST = "\
     libpcre-ptest \
     libssh2-ptest \
     libtimedate-perl-ptest \
+    libtest-fatal-perl-ptest \
     libtest-needs-perl-ptest \
     libtry-tiny-perl-ptest \
     liburi-perl-ptest \
diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb
new file mode 100644
index 00000000000..6d36c94eeb5
--- /dev/null
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Incredibly simple helpers for testing code with exceptions"
+DESCRIPTION = "Test::Fatal is an alternative to the popular Test::Exception.\
+It does much less, but should allow greater flexibility in testing \
+exception-throwing code with about the same amount of typing."
+HOMEPAGE = "https://github.com/rjbs/Test-Fatal"
+BUGTRACKER = "https://github.com/rjbs/Test-Fatal/issues"
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f7c73bf24be1bc7759bde9c15000db6c"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "7283d430f2ba2030b8cd979ae3039d3f1b2ec3dde1a11ca6ae09f992a66f788f"
+
+S = "${WORKDIR}/Test-Fatal-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS:${PN} += "\
+    libtry-tiny-perl \
+    perl-module-carp \
+    perl-module-exporter \
+    perl-module-test-builder \
+"
+
+RDEPENDS:${PN}-ptest += "\
+    perl-module-extutils-makemaker \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec \
+    perl-module-overload \
+    perl-module-test-builder-tester \
+    perl-module-test-more \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


