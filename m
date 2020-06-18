Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.10531.1592494900644589277
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WOp4RoIH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id 97so4877842otg.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=sV81n4KxrMiVoLHgUC3x54oaBBrN5gGXW/SwrZ+lurY=;
        b=WOp4RoIHUyicPY8ZWfFIETXc+/vFygsOPcAsItAYPAZdO3sxwXZ6oQOd5flJyD1Wjf
         PdMNG0h1hEvYaGUtD7dY2qUUKhtaYq8fKY4eHD78+VWQTucci2qBBJHbuQypTiktlm4q
         UCS+bQuzLeNod1H9qjpajH7QEX7x7BoauhiCJzuiB7fbJIxgOML6wPZi6t/FTConHw5n
         yZu/E64068AZZU14zZzz3aujyVyJ2dzxrDE1P1MRTBweKbbKpepTwMpwRYjL7WyRQBVJ
         SPCC7aTU1ioheNnoAFqY0Z2c/Fg407EJR0zP3hozSVyJRAgmPGNs/vt25E+CaGArrLwa
         S5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=sV81n4KxrMiVoLHgUC3x54oaBBrN5gGXW/SwrZ+lurY=;
        b=phIyFpuiFrYurG5F2npJUDDvNmMTX5ebTQk9gEMYfanJ2cW/WIbTRk7b0njjda2rFZ
         UY8F+7kUYwQ38PAZpG8YcldP8d6E241aKxWIjeGnQPAV1L8aNlH2JnyM32zLzaFzM+55
         cThoaXvuPpqiYTI+Csw3hFraeziY4six5yw6U5dPT1kCLCJMNdPRmbJpLY1erhXVbfFR
         m9mATuDGlknEdtfIrFG8z+WI7grEEyBitiG1t207Evg9q/s8GnZn1mqDeaWgtoVEnpM/
         I1heTUtjFIgqAAYWLokzHaCbO/DUszm/ciNyMOhJQhEfa1lImZymUIJMXFUVFTpX3keT
         020w==
X-Gm-Message-State: AOAM532S3liIu/F5O8baMy6SlcAv78K/D+sfRFbfMk7fvlHRvYZq1g6W
	mZh5hhIpfV7a/013uw+WFC/BtXaFyk3rEA==
X-Google-Smtp-Source: ABdhPJxAze7rMhC2Y4wU5jv55x7LoeVUXwN4KBii0oKV6svCHa4tMmGWnt4ERijq2dNA65dk3NiEOQ==
X-Received: by 2002:a9d:3df7:: with SMTP id l110mr3910093otc.214.1592494899246;
        Thu, 18 Jun 2020 08:41:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/21] libtirpc: remove extra "-fcommon" from CFLAGS
Date: Thu, 18 Jun 2020 05:40:32 -1000
Message-Id: <4745fcf05736c3e26601769c4fdcd1a5ec25efb3.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: Richard Leitner <richard.leitner@skidata.com>

commit daed7eedba ("Avoid multiple-definiton with gcc -fno-common") of
libtirpc fixed the -fno-common issues. Therefore it should be save to
remove the extra "-fcommon" in CFLAGS.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e4546701775fe98532f011f5ad146cfb1b33715)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index 6100d157e5..10a324c3b6 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -19,8 +19,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gssapi"
 
-CFLAGS += "-fcommon"
-
 do_install_append() {
 	chown root:root ${D}${sysconfdir}/netconfig
 }
-- 
2.17.1

