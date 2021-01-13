Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.7020.1610540014666362913
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 04:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lvs+wMdQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id lt17so2768992ejb.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 04:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=utSl+V92pjd7RCZl2vHT1PO6INJYOhfxDOu+c/bTAdM=;
        b=lvs+wMdQj8phmCKOgELnYW0u2ymJuDA3UGXwy3L/XEvtFZVgK8SQ5mXIvImTtU91a5
         y7l22MkWHogzOPfO9I72IqcPHetPCNN1QkBf8dFknJB1UwDY5sLKWul/f/0MoE3hIhPh
         6uyV7TRVuxp0EwzvqwKoqwAZ/jRj7IeQ2oyn1nQz31mECN3rGRwpgwomDJlJTVrddpfc
         G9VmtCd7UYe+iS6yltCtGpTmrmbSJtQ2YIbxiqEmi5EWip4IcukBQyIlgwQfSB77ck9e
         kZUSsjSWtiZT7Rta5L/hH3gtT3aDyhfQFqRaGxkwWoOJwpfDvFA4yNCqW8RxoHGd6LKU
         wH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=utSl+V92pjd7RCZl2vHT1PO6INJYOhfxDOu+c/bTAdM=;
        b=snH0kqNZ+xRiOXoegHLO1ai2JFGTPTvKk19es5bdnCoR2ZPlSsjn7LbX4kiKzZ2gwz
         q+r6JjjnOxKAPkUgCnpsk+VxL5Wt3Zs7Lps2GW4jEn3JumEMoi+j5XrqjXs1j3YBUjr6
         tw8K6JeyScqTO2+ByyUYZkKzry5yVTepo0LYrvFOHOvM7sXHQIsjbFyjQnHtAXVXO0G+
         Xs0G1e12kGMRox3eZtn4SFA+iaaxocvSNG1ZmJe4YyYczIjDrCvu4t87/idECAkhlZvU
         K+CwMBsPqFuTHskdZ+IjzT6dhlt8RlSovupeSa5LTxZ6Pte3+sA8UbcUGF/EhoTE2guk
         EQdw==
X-Gm-Message-State: AOAM5338L7tG7U52T3VhTrw4+Y+Sakdur3bqdkqbqEH4BbAyq7f/Qj8k
	poxIXwL3CicMl2EA+afPG47O5TS2WvQ=
X-Google-Smtp-Source: ABdhPJwIQV7lQ0hNmLJS5loDw1Y+uPil80zzm3kkom/faU2B9K9YI2a4V1eMX+2cn0BGIMpxm+4PSQ==
X-Received: by 2002:a17:906:6449:: with SMTP id l9mr1453279ejn.320.1610540013172;
        Wed, 13 Jan 2021 04:13:33 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n13sm637320ejr.93.2021.01.13.04.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 04:13:32 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [gatesgarth][PATCH] license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to PSEUDO_IGNORE_PATHS
Date: Wed, 13 Jan 2021 13:07:28 +0100
Message-Id: <20210113120728.2356542-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1659C9354D6DFE03.26130@lists.openembedded.org>
References: <1659C9354D6DFE03.26130@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* now without ${COREBASE}/meta in PSEUDO_IGNORE_PATHS after:
  73d538f207 bitbake.conf: Prevent pyc file generation in pseudo context
  the do_package tasks are failing when LICENSE_CREATE_PACKAGE is enabled
  pseudo.log shows that it's because of license texts copied from
  ${COREBASE}/meta:
  path mismatch [46 links]: ino 96733640 db '/OE/build/tmp-glibc/work/all-oe-linux/foo/1.0/image/usr/share/licenses/foo/generic_Apache-2.0' req '/OE/build/openembedded-core/meta/files/common-licenses/Apache-2.0'.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f90176d6c0..dc91118340 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,6 +31,7 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-- 
2.27.0

