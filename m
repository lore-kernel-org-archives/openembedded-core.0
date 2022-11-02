Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27964C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 03:19:02 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.2246.1667359141624211872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 20:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRkwvsZT;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id l6so15047054pjj.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 20:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDkFeN3A7dN6ItcFngsJHkYnROqueznbuAq/TLpeiXM=;
        b=gRkwvsZTW4rkk4FCUdNnD9wV9PofCaQeeQRYId+ySd8CIi7h9WICcod5QhyaLuKuL4
         EaYoJBw5jaWk9WiFpm5fKoDo2b542n9m9VC9c+yg3/nAvAoV+FT4SD4u4SzAzUIGJLK9
         UbwXGunLk0Gmmll6vpq6q79T4wp/IpTAOBI5/TnmHAH8VZCEbdnCO6kLoauDxNChR7Sx
         C/5zNzQDLjL6NDX2NAwz2mftDOWFWZA5ScqpDDq9vZBuioRs80P6XCwANCYgVQZ3wIXe
         S4IXBSjnw9+86Dsobqaa80IzAkpQGtBlrqxye861VKOduNOTGMfc2uAXGlv/PnDm8yRv
         4LFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDkFeN3A7dN6ItcFngsJHkYnROqueznbuAq/TLpeiXM=;
        b=7h+bg3J65nGmUFT47Q2XdsaYHRWNe3zYsjHrC1jvXHG0lB0cTpVfiZy4g6k8dKMQkq
         07fqQeW71CsXnn7sx5psRDTecLcTTAmWPRmETIuKwvwIvNMHNuc6/fHpKsyFDL16LWCQ
         Br6Y4cify5Js3QcmIBemVcGzTU6GZN8RuuK6BOFRnD4RRjHECD9PERIUWCmtpKfS+tC7
         WzJ0Q1sYfJpu+YUxAcqCtvt2AfSJh2hGsQpzYz01F27DC3lSpShmeqcWXpTh4jJ+DEnb
         zWIWbWkUbi7J0kk13xcgF5VJNWjZ6KvkzM0skRQ0jXYQhNE+HGGpIyMmxFs6psvQuwgL
         tL6g==
X-Gm-Message-State: ACrzQf1j3LcCTZeBWmgcGA3376L/vRw8y7gbz0csadhUSGRGEf8W/wpm
	2ZXtaLW5qU5dCDH3o5wL61dY2mnJNJl0rg==
X-Google-Smtp-Source: AMsMyM6jII1+BTn05F8YRrcmjpaqyGuxJgm77Oqfv5OduUy48ayQwKJyyVJM4fv2GOWlPJRBVBvP8A==
X-Received: by 2002:a17:90a:6d22:b0:213:7e1e:9be0 with SMTP id z31-20020a17090a6d2200b002137e1e9be0mr23055970pjj.17.1667359140427;
        Tue, 01 Nov 2022 20:19:00 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:5e16:97a8:56b5:1576])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090a16d600b002139459e121sm269644pje.27.2022.11.01.20.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 20:18:59 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 10/11] python3-typing-extensions: upgrade 4.3.0 -> 4.4.0
Date: Tue,  1 Nov 2022 20:18:29 -0700
Message-Id: <20221102031830.3606777-10-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102031830.3606777-1-tim.orling@konsulko.com>
References: <20221102031830.3606777-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 03:19:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172572

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

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-typing-extensions_4.3.0.bb | 14 ----
 .../python/python3-typing-extensions_4.4.0.bb | 69 +++++++++++++++++++
 2 files changed, 69 insertions(+), 14 deletions(-)
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
index 00000000000..c8cbb215f04
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
@@ -0,0 +1,69 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -13,12 +13,11 @@
+#  
+#  In May 2000, Guido and the Python core development team moved to
+#  BeOpen.com to form the BeOpen PythonLabs team.  In October of the same
+# -year, the PythonLabs team moved to Digital Creations (now Zope
+# -Corporation, see http://www.zope.com).  In 2001, the Python Software
+# -Foundation (PSF, see http://www.python.org/psf/) was formed, a
+# -non-profit organization created specifically to own Python-related
+# -Intellectual Property.  Zope Corporation is a sponsoring member of
+# -the PSF.
+# +year, the PythonLabs team moved to Digital Creations, which became
+# +Zope Corporation.  In 2001, the Python Software Foundation (PSF, see
+# +https://www.python.org/psf/) was formed, a non-profit organization
+# +created specifically to own Python-related Intellectual Property.
+# +Zope Corporation was a sponsoring member of the PSF.
+#  
+#  All Python releases are Open Source (see http://www.opensource.org for
+#  the Open Source Definition).  Historically, most, but not all, Python
+# @@ -74,8 +73,9 @@
+#  distribute, and otherwise use Python alone or in any derivative version,
+#  provided, however, that PSF's License Agreement and PSF's notice of copyright,
+#  i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,
+# -2011, 2012, 2013, 2014 Python Software Foundation; All Rights Reserved" are
+# -retained in Python alone or in any derivative version prepared by Licensee.
+# +2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022 Python Software Foundation;
+# +All Rights Reserved" are retained in Python alone or in any derivative version
+# +prepared by Licensee.
+#  
+#  3. In the event Licensee prepares a derivative work that is based on
+#  or incorporates Python or any part thereof, and wants to make
+# @@ -180,9 +180,9 @@
+#  Agreement, Licensee may substitute the following text (omitting the
+#  quotes): "Python 1.6.1 is made available subject to the terms and
+#  conditions in CNRI's License Agreement.  This Agreement together with
+# -Python 1.6.1 may be located on the Internet using the following
+# +Python 1.6.1 may be located on the internet using the following
+#  unique, persistent identifier (known as a handle): 1895.22/1013.  This
+# -Agreement may also be obtained from a proxy server on the Internet
+# +Agreement may also be obtained from a proxy server on the internet
+#  using the following URL: http://hdl.handle.net/1895.22/1013".
+#  
+#  3. In the event Licensee prepares a derivative work that is based on
+# 
+#
+
+HOMEPAGE = "https://github.com/python/typing"
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
+BBCLASSEXTEND = "native nativesdk"
+
+UPSTREAM_CHECK_REGEX = "/typing-extensions/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.34.1


