Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.2956.1604001814186121655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 13:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A3CYdwG5;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id b8so4156510wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 13:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Om+HFgqD+9fZWDzGADs752o6cVeZiTEu9oA/kXtVEXg=;
        b=A3CYdwG5t26Y9f8BvKxFZ9g3cK1pw6PgKXvRCiHxmnwfBmnQ6WbTUs/IMxRW4eD6rL
         3MJbDfWaj40qvVG7SpcoeXpS0wJvpUA/Erd+cjJ0Ws5Z/uL8fT+NmfgFUneW5NdPh28j
         c3TwrB93xAVm/vESpeDcWkNzDPgvC3CgTvilXisqVx2mKe28xYPOQBT0Drj4aHVpSS7u
         C0+XloBUpgpYtbghdiXDataF3DqUENbFazo4MUc4XY22+Lu7uGHxEx18MbMOGtWD30WH
         Pf2SH0lm4U19qQ1gw+U2LGUvkH42HlP95B0BVjpDEzP6Ffv1vNDaOnwofE/UZuBfnS4d
         CPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Om+HFgqD+9fZWDzGADs752o6cVeZiTEu9oA/kXtVEXg=;
        b=hbjCfpkdINMuRGVA0v0UZz4d/h03KHOkuEy6J3xBh/NZVOdzwpp+/9EGUwzJ32n1ax
         k0l9EAMNNVlEri3x+y5Buf+ybfyos++rbJnpYTf37Ps36ngcWHkdbEXR0Q0I6YH/d7hN
         f4GzHnpPGDGC8klozKCrmN+mWjzHiGAmwoZfO4KseDFsgMMiNswFs2VboTIM3WczKOrC
         4vq934H/eQN1Lh60/siBg9EygPCI6/CigiINlDZ4rFQ9atnVsWYONVbmUuPm0msLBsHE
         Ugh1nHuAtJL1dBIvB7itafjFfOq+K9BFt02KwAFuoWRW5qvvDWNOrjZvxEwVZAlKEmTQ
         50/Q==
X-Gm-Message-State: AOAM530JquFwsjeCw1aHTfoorm9UWyKD91REfGU7zVsx9frBsMzSSIHh
	5Myopp5+yNcmMtt+CjhT1G+0vBJFG7nNqw==
X-Google-Smtp-Source: ABdhPJzikSI/WMr8cG/7lk/000eXHBrrvCgqBA/DdDl5MfGjDW1DHmHrjFI6cV2TP9mRV4Hu4i8tCA==
X-Received: by 2002:adf:82a7:: with SMTP id 36mr653925wrc.1.1604001812504;
        Thu, 29 Oct 2020 13:03:32 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b63sm1519422wme.9.2020.10.29.13.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 13:03:31 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v5 2/6] spirv-tools: enable native build and install more header files
Date: Thu, 29 Oct 2020 20:03:17 +0000
Message-Id: <20201029200321.1886511-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201029200321.1886511-1-quaresma.jose@gmail.com>
References: <20201029200321.1886511-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-graphics/spir/spirv-tools_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/spir/spirv-tools_git.bb b/meta/recipes-graphics/spir/spirv-tools_git.bb
index 8e8388e8d4..d1c2436cd9 100644
--- a/meta/recipes-graphics/spir/spirv-tools_git.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_git.bb
@@ -29,7 +29,11 @@ EXTRA_OECMAKE += "-DSPIRV_WERROR=OFF"
 do_install_append() {
 	install -d ${D}/${includedir}/spirv
 	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/1.2/* ${D}/${includedir}/spirv	
+	install -d ${D}/${includedir}/spirv/unified1
+	install -m 0644 ${DEST_DIR}/spirv-headers/include/spirv/unified1/* ${D}/${includedir}/spirv/unified1
 }
 
 FILES_SOLIBSDEV = ""
 FILES_${PN} += "${libdir}/*.so"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.1

