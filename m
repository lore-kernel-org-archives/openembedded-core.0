Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470C0C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:14 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.2283.1643826492967011366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g93zmz6Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id o12so166096eju.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WHn7yE0AYbcLRzVbyWfQ8dZPYpZG6Rycgj784s4DQ3s=;
        b=g93zmz6QswIaYQJs1iPkZKkkuDLVUd77U0zWypbrg5LFz6aj5HYdI2r/swjK6e+i4g
         3WiFmj+ySP3SWmvKl4unzGIYYyA+uNu9hTS2FTTFfCxIv9kSIjXFiFPHBkvESyyjs0he
         /1fCypNEFC3qpFCPbN2X9k3wJsZZB7FrHnM66VL59SJd9Vt4Sk3lt38KEYSLqbVHAlD/
         mlRvgpCex+HN1XR3qlxwQSqDtw7lnKiyHISyu1jgF7hiB5tqlHz0/HN0o4/yYYtlQBf1
         Gxws7FwmSKacxdFeWTeBD2cvmGOnX+vpIlg3d4nuoR4Ad+LMkXFWYJak2ckWDS0Dzkl/
         Stjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WHn7yE0AYbcLRzVbyWfQ8dZPYpZG6Rycgj784s4DQ3s=;
        b=0ot88cLob3DeJSIKM9yLf2czFF36O3vRk61uwhCBY0fV+hNaiTQDQTwo5htxuK8jQs
         g4oc+55DkQFnJnGgsvXOxMtvSgAwfNDwbYp7+xmnpOgMJfhwmctd4Jn9FG7TQAea0/3k
         mj6yEG2p8jH5Y/u4jjq2GHcOdBU8LLoBp2bbN8wjenjxkvMdFnA/d3yEktAj5zIWhJlW
         2nheXHXmCPFz02/WNjuZpXvWWlvGOIJKAM1AIogbgRGpRK1rlkUcBbDsnoI/Lyq/G8x4
         FR8D+Jk9x5ZcyIEJLnuchOqPkSI9g+KKrm7KOhY/1KNcdndAm12AMFkXosIAlAP0wR8A
         8lKw==
X-Gm-Message-State: AOAM530gXI5ZFkcL1sTui7Moq47P8whTthArkV62XhDcklXiGrUynufp
	DWBUBqYSs3ctutPw8dS1sUIpymEBRYY=
X-Google-Smtp-Source: 
 ABdhPJywI4RS7AR1x4+sid7w61R/sm6xenfsJdq/O+JJ+TbM2lpzkfJXZYfXuDJiyUOC8oSqsTDFDw==
X-Received: by 2002:a17:906:730a:: with SMTP id
 di10mr26451279ejc.489.1643826491582;
        Wed, 02 Feb 2022 10:28:11 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:10 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/33] python3-pycryptodome: update 3.12.0 -> 3.14.0
Date: Wed,  2 Feb 2022 19:27:35 +0100
Message-Id: <20220202182758.919991-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161235

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python-pycryptodome.inc         | 2 +-
 meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb  | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb  | 5 +++++
 ...cryptodomex_3.12.0.bb => python3-pycryptodomex_3.14.0.bb} | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.12.0.bb => python3-pycryptodomex_3.14.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 071af557ea..29fe80d224 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
 
 inherit pypi
 
-PYPI_PACKAGE_EXT = "zip"
+PYPI_PACKAGE_EXT = "tar.gz"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-io \
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb
deleted file mode 100644
index a732441a7a..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "12c7343aec5a3b3df5c47265281b12b611f26ec9367b6129199d67da54b768c1"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb
new file mode 100644
index 0000000000..fb2f8d5ff0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.14.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "ceea92a4b8ba6c50d8d70f2efbb4ea14b002dac4160ce4dda33f1b7442f8158a"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.12.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.12.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.14.0.bb
index 5f88419ce4..b83549840d 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.12.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.14.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "922e9dac0166e4617e5c7980d2cff6912a6eb5cb5c13e7ece222438650bd7f66"
+SRC_URI[sha256sum] = "2d8bda8f949b79b78b293706aa7fc1e5c171c62661252bfdd5d12c70acd03282"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.20.1


