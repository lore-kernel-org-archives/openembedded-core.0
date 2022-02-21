Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DECC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:57 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.4760.1645478696559535771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CZKX8D5Q;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 iq13-20020a17090afb4d00b001bc4437df2cso396507pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wzVGVNLTLiIe1i6ZEER7SeSqgTeR4YPKEXwgyumnRQQ=;
        b=CZKX8D5QaBeMIA1p1gKGe0h2lqkWkJgiit9ZQwXweDYPWw3yBS2ztb8SNOAj0xamZg
         ORG4M7KG0RO6JOTUj+sHp4cGb6QCugt6J9mTERhOk121SG6BwDkCFDBeekpPoJZlm88+
         GYKnHHO+Nkn+TBECUGj6R17Cmoh5FHDfM+0lSUvIHSdav0mzu4/qT91COhkYa+eCHJzp
         xbYuFFnrGDVHeMUtZ9kUqpFvo8eA3LJstZgWIH5hp9LmaJQRf/pfQEzYmHbc9E1E6z/p
         LDJiBJlhiIfYbbG9O40TbbnDrn8gayc1E3/XysIOM4MH6Vky3nnYlrZIqj5xaqd8Ne1x
         8GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzVGVNLTLiIe1i6ZEER7SeSqgTeR4YPKEXwgyumnRQQ=;
        b=wBXU9Hs7lx36QxKeeMKjqyCyxiXXz1U3iGpW6zIz030xm1dnJr5ngPaCwjapSvkAT9
         u5uC7PEGuAj6QfPqareRO/SOAKr2fOFnfu8bxwR6kmaKor1mYvU7sS8hBb+/5qHmooEU
         qkqnaFDpKumjdcMDD3bRBDbLQesegubMe0/FrtO95byNfucQ4shFePc+gLkYTYnSX7ZF
         hPTx3ZPHPPbSNubltyDv6CdGdTrrG008moAJvT6FhCZVFWo0Pbaf9kVByjQlIOcolrJt
         DLK/XyEKjvsy96EZKIuDAx+XZiS8F5Z/n82+5cAiuGlovdTyseyu6lZQrI19K9Vhz3pF
         EZoQ==
X-Gm-Message-State: AOAM532eJR0H3TA5LFCabhZMPBra9FbEOnZ/0z5gVCAwBhgh1/p9fVc1
	DYy3qkrZ35nBNG64bno/iK0jVq/57gwj9Q==
X-Google-Smtp-Source: 
 ABdhPJwLuog6K4ajUsolftO0aKcxNOK/NfLb8P13g4tnlIyR45Pk1pi1dOri+rVssyfJOAzZVg6i0w==
X-Received: by 2002:a17:902:ed8c:b0:14f:d623:f41e with SMTP id
 e12-20020a170902ed8c00b0014fd623f41emr2079906plj.167.1645478695603;
        Mon, 21 Feb 2022 13:24:55 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 32/32] python3-nose: drop recipe
Date: Mon, 21 Feb 2022 13:23:47 -0800
Message-Id: 
 <3071336da7ba931774c91ba3a937f277c7b7c7d7.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162108

The code has not been touched since 2016 and numerous files still have
Python2 syntax code in them. This causes do_compile errors when
packaging a wheel (PEP-517 packaging).

Nothing in oe-core depends on python3-nose.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 -
 meta/recipes-devtools/python/python-nose.inc   | 18 ------------------
 .../python/python3-nose_1.3.7.bb               |  2 --
 3 files changed, 21 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-nose.inc
 delete mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 7a65612b7c6..333685cd8b8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -616,7 +616,6 @@ RECIPE_MAINTAINER:pn-python3-mako = "Oleksandr Kravchuk <open.source@oleksandr-k
 RECIPE_MAINTAINER:pn-python3-markdown = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-python3-markupsafe = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.com>"
-RECIPE_MAINTAINER:pn-python3-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-numpy = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-python3-pathlib2 = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-devtools/python/python-nose.inc b/meta/recipes-devtools/python/python-nose.inc
deleted file mode 100644
index 08c380d637c..00000000000
--- a/meta/recipes-devtools/python/python-nose.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Extends Python unittest to make testing easier"
-HOMEPAGE = "http://readthedocs.org/docs/nose/"
-DESCRIPTION = "nose extends the test loading and running features of unittest, \
-making it easier to write, find and run tests."
-SECTION = "devel/python"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
-SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
-
-inherit pypi
-
-RDEPENDS:${PN} = "\
-  ${PYTHON_PN}-unittest \
-  "
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-nose_1.3.7.bb b/meta/recipes-devtools/python/python3-nose_1.3.7.bb
deleted file mode 100644
index 13dbf96179a..00000000000
--- a/meta/recipes-devtools/python/python3-nose_1.3.7.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-nose.inc
-- 
2.30.2


