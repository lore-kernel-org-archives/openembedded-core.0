Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C951C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.1899.1645557477151856505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwuslJlf;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id om7so534087pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wzVGVNLTLiIe1i6ZEER7SeSqgTeR4YPKEXwgyumnRQQ=;
        b=qwuslJlftufC9wQsA/pSgqQLXpC/HCn1ZuWaX+6O470CQydNeGxNmDc0DdZJ1SuRyB
         T+2u5CutVp+XkWg2pbQlPgiF0dmg2ljl4dnNBPkjgsQryv6A7oJ7tLDgsEALzVV2/hvr
         8i8OfVkyCmuQNo6e3pg3sNF34VDvq5yGlOyChPBRmmV8xaT8TD3w2hd/8a58ab+0XPPc
         UwaxvVA0ZKCBkn9nXZJiLEbqAfYbkO7pAW89k3C2v0tzz1kfr3sVQW5KRbkUo+exeaNz
         PJq6aOFUjkt4NqEiVRcg4W8fTGl18udq5StdVviLNxkb2zB9JXvM8UDAaeQMScwQKWg0
         +o1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wzVGVNLTLiIe1i6ZEER7SeSqgTeR4YPKEXwgyumnRQQ=;
        b=0UYRUDPmxlZGvEJfE/UYXkVZvbYO5N3ROL0y4kcwtX5UlR9R4hDvR5swiWmDg5ym+d
         qq+Lpm2IIvQfVVatEfnXaktlRpWiW25rW2+KKXUo60HzkkEnKSvOyAMMsmS+ZOmwPFrn
         LTIkwkTrdj22EEPl1W1u3NThqJqKRqizgGcv7oN6+EuvDO8Irj4veJcMlod0wTLXjyti
         ph+5uh06xSAnIqVciNROZpf+OHrwkJMJ9cX8GRzlA0OD6QH1GAesgsg+DoCKO1BKlOTq
         Agz2oIXikKrAb69dtqRGAKeFCmnHUDxqaK0y57cqnd3hKwUJ31+mJ6BhxFbjxnnJ5HIh
         qUMw==
X-Gm-Message-State: AOAM532dOlAfco/9FK5BpFC0MP2KNBHYHYaaI4kxLmJJA6Gr7+lySaMO
	OZMIf0WzlgqlMp99opH0CqzCgajLq4EDyw==
X-Google-Smtp-Source: 
 ABdhPJxZFPP5yIfcxkFnfcfpgAiY6SGV+imGrvUVwFHHD/Uve+QlALel4G/e+a0mVZ4AYGzsLk1dzQ==
X-Received: by 2002:a17:90a:9206:b0:1bc:30a6:5df4 with SMTP id
 m6-20020a17090a920600b001bc30a65df4mr5623671pjo.134.1645557476157;
        Tue, 22 Feb 2022 11:17:56 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:55 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 32/32] python3-nose: drop recipe
Date: Tue, 22 Feb 2022 11:16:58 -0800
Message-Id: 
 <94ecf5bd9cce6d1c82bc87e389901e843a5255e4.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162223

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


