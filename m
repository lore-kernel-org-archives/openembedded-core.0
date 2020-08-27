Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.16775.1598527740356102548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kYX9bQY4;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id c15so5001386wrs.11
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yDCpueOljvu2o4S0dl2gxH+KbvkYP3za/D5pkZZBQzY=;
        b=kYX9bQY4DBB1qf8jn5nPehUAPZlzcE+dyXDrUwe2S/RO2i0U7ztqStqImhYz3Vm9Mj
         WVjZ5K+VNEQyPkNRhjAW4IHLucb3FbuJWqFKVfyX4TsYomz3exQNY6LvtAiv2fthJci8
         joG4YAKe01gBR9tfPKoe7GA+bxVfWRgQk7pW0PDOKzWOI4lcNcnDq/UJEB0gxVqEV4d3
         SBQYxpA8jHy8zrLGJ8jXk2cXy/FrS9VFo2j12Mfdg5RZL5I2LqiHGWojNE8HqPJ46luo
         yMgVlb5QuliVlNhQx9kkSB4ycFMd1zF83AjL+7ZHwSz2MP5v5QP1mww0059CzVcY18E1
         pOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yDCpueOljvu2o4S0dl2gxH+KbvkYP3za/D5pkZZBQzY=;
        b=LJ8CB0O7gZM1FKoCyEu86YtC5l0SE7lsgfhugchJbZBNojqr+4nocTGgS/kujFiFR8
         30FPBvOYtnsmaO/rWxEDM57rJLRmVuLqWMhxz3M82XlZe7Aw/ILvVm1V0tfzbP0Co3f+
         ZdZZY9iZ8v6GiavvsCSq+i+2VnORiif77iNCNcIU6f/M6z4bQ4QCYHwnYbP4xShKl07u
         4SYqjaKHRk+5FUl4EqWXIcol6DnaBecL+qtPHDMk9k3tmQqkNIHvwwNQMT0xh6v6K8Jv
         IElzibh4+ROAto8HJ6zW955PzbqwRSDFMJVPQebdcHsQuPOYEhxfyX4at5qYXPjEM8Mg
         IDaQ==
X-Gm-Message-State: AOAM530X0np4wYzFrwtifWVyFNgH87krTSaREaXHK1QeM9AVxaF33qMF
	xDYYwGgjph62IiBgpW+mFgdPnRCAjPpuCg==
X-Google-Smtp-Source: ABdhPJybwbavvY+7V8gmQdLgKReuuXxRF6pT/SY4yumHd3RwAoOPLx++R25FySxLVkc3Rz7FMxvasg==
X-Received: by 2002:a5d:4642:: with SMTP id j2mr19323693wrs.82.1598527738594;
        Thu, 27 Aug 2020 04:28:58 -0700 (PDT)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.ad001.siemens.net (c-82-192-240-69.customer.ggaweb.ch. [82.192.240.69])
        by smtp.gmail.com with ESMTPSA id k11sm5326133wrq.85.2020.08.27.04.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:28:58 -0700 (PDT)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-gplv2][PATCH 1/1] util-linux: remove GPLv3 and pylibmount
Date: Thu, 27 Aug 2020 13:28:16 +0200
Message-Id: <20200827112816.2138122-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200827112816.2138122-1-adrian.freihofer@siemens.com>
References: <20200827112816.2138122-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

python bindings are GPLv3+.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 recipes-core/util-linux/util-linux_%.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-core/util-linux/util-linux_%.bbappend

diff --git a/recipes-core/util-linux/util-linux_%.bbappend b/recipes-core/util-linux/util-linux_%.bbappend
new file mode 100644
index 0000000..abd31c5
--- /dev/null
+++ b/recipes-core/util-linux/util-linux_%.bbappend
@@ -0,0 +1,10 @@
+# pylibmount is GPLv3 -> remove
+LICENSE = "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+
+PACKAGECONFIG_remove = "pylibmount"
+
+do_install_append() {
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
+    rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/libmount/__init__.*
+    rm -rf ${D}${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__
+}
-- 
2.25.4

