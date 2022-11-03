Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D755C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 14:54:23 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.20123.1667487254584824666
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 07:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IGmuDT4K;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id b29so1801804pfp.13
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJvYB3j/Ih36a5ffxRGzNbb+lkl/CBukCd8H0I60tQQ=;
        b=IGmuDT4KU/0AhMsTivfKW7JOF1ofYua9iYl1wMnxpcS1QGjaEK+GE/Tj3jO2svqoSa
         kTz6X9rgXqYVK60bzQAD6COQGiaeHkraqHsRzLNIz0Vko5HgYbqPh+fyNW5FNQOkFeRt
         B4KMAiR92VZ7Rqp5oVTbjqqvQX3+SZ1aWF36eYMhDbrJ1J7Cnlud6qkgnChN3K/HOFJJ
         m1qOgP+8xOXmLPHx13mjyvKcCWJ/4P/IQ5NXYoPKx7p5/5HPmoDLm6jf7UtezCtEtn4X
         y9VYvI/a1X7sQLDR3jtZI5Vj0gGhUH356tjD6NHbeJyWvFUN8ZwEPeTb+Y5TlaKo7qSR
         yL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJvYB3j/Ih36a5ffxRGzNbb+lkl/CBukCd8H0I60tQQ=;
        b=x0lDLI9GVzrvSni3d7JT+XkGl/DR6i6djfxABSbUrc/y97X/372XFrq4CtYEqrwWZW
         KL3dL38KH2Sl8dr8eMNJzcR9mDBl0wumNdt5VCmBNUb3G936HJkZnK1uUBwpXj4le8NR
         tl3NgmI+PVsuxmQ11CbechNXslS54SALa405K8ZroOt9QTfMroTyD65gq6mz+VCpT13O
         baVRoEVVTLAjg8V336JYtSsNB3WzQ4nxZHFjdI8xnbV8fPwe3/6X2DTNtvGaOedWyNC8
         3O18fUkMxfL+zT7591Qn8TBOnE4cfbuxiuIjssfWbA3KzL8aY+gU9PO1ao59vzi1PA3H
         V77A==
X-Gm-Message-State: ACrzQf2VdjysurojlEC0rjygR9Rh7AFTbvJ15gWdAtPGi7JvlJMKEBcB
	Li3+qh3jH4U91kbwdJrEQk4NCikO5FHvxw==
X-Google-Smtp-Source: AMsMyM6D1pM5b762CQnkSULZr+6suqQ2/uqdB4BZK3vne5kywAkY0VGH2SAP83IaTcPwCb/kUacxvQ==
X-Received: by 2002:aa7:96c7:0:b0:56b:c569:99c with SMTP id h7-20020aa796c7000000b0056bc569099cmr30729791pfq.4.1667487253460;
        Thu, 03 Nov 2022 07:54:13 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e97:dd3b:a8e8:d7aa])
        by smtp.gmail.com with ESMTPSA id z8-20020a6553c8000000b0046f6d7dcd1dsm892344pgr.25.2022.11.03.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 07:54:13 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] python3-typing-extensions: upgrade 4.3.0 -> 4.4.0
Date: Thu,  3 Nov 2022 07:54:10 -0700
Message-Id: <20221103145410.860492-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 14:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172634

* Add SUMMARY, DESCRIPTION, BUGTRACKER and SECTION
* Update HOMEPAGE to agree with PyPi

https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-440-october-6-2022

Release 4.4.0 (October 6, 2022)

* Add typing_extensions.Any a backport of python 3.11's Any class
  which is subclassable at runtime. (backport from python/cpython#31841,
  by Shantanu and Jelle Zijlstra). Patch by James Hilton-Balfe
  (@Gobot1234).
* Add initial support for TypeVarLike default parameter, PEP 696.
  Patch by Marc Mueller (@cdce8p).
* Runtime support for PEP 698, adding typing_extensions.override.
  Patch by Jelle Zijlstra.
* Add the infer_variance parameter to TypeVar, as specified in PEP
  695. Patch by Jelle Zijlstra.

License-Update: update copyright years; align with CPython LICENSE

See https://github.com/python/typing_extensions/pull/63

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

Changes in v2:
 * Remove devtool hints about license change
 * Improve recipe by adding SUMMARY, DESCRIPTION, BUGTRACKER, SECTION
 * Update HOMEPAGE to agree with PyPi
 * Add License-Update info

 .../python/python3-typing-extensions_4.3.0.bb | 14 -----------
 .../python/python3-typing-extensions_4.4.0.bb | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb
deleted file mode 100644
index 9638491eb44..00000000000
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-HOMEPAGE = "https://github.com/python/typing"
-LICENSE = "PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
-
-# The name on PyPi is slightly different.
-PYPI_PACKAGE = "typing_extensions"
-
-SRC_URI[sha256sum] = "e6d2677a32f47fc7eb2795db1dd15c1f34eff616bcaf2cfb5e997f854fa1c4a6"
-
-inherit pypi python_flit_core
-
-BBCLASSEXTEND = "native nativesdk"
-
-UPSTREAM_CHECK_REGEX = "/typing-extensions/(?P<pver>(\d+[\.\-_]*)+)/"
diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
new file mode 100644
index 00000000000..27ec7560ea7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Backported and Experimental Type Hints for Python 3.7+"
+DESCRIPTION = "The typing_extensions module serves two related purposes:\
+\
+* Enable use of new type system features on older Python versions. For \
+  example, typing.TypeGuard is new in Python 3.10, but typing_extensions \
+  allows users on previous Python versions to use it too.\
+* Enable experimentation with new type system PEPs before they are accepted \
+  and added to the typing module."
+HOMEPAGE = "https://github.com/python/typing_extensions"
+BUGTRACKER = "https://github.com/python/typing_extensions/issues"
+SECTIONS = "libs"
+LICENSE = "PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2"
+
+# The name on PyPi is slightly different.
+PYPI_PACKAGE = "typing_extensions"
+
+SRC_URI[sha256sum] = "1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa"
+
+inherit pypi python_flit_core
+
+UPSTREAM_CHECK_REGEX = "/typing-extensions/(?P<pver>(\d+[\.\-_]*)+)/"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


