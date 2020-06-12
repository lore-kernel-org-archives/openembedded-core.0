Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.341.1591994744761858690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 13:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id er17so4994469qvb.8
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 13:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=VkpelLMzFzBAjpKqFPFficX2CHo7PFVIwc54Duuwc8o=;
        b=VgTPffwUaCcDSH17pd5YEiO6A5+6Du/UbN5tYG8DbOtFHRajT4ZQ6mK0NUn1RbEtuL
         vbtU53XmvhoCamARHnafK+EtRyp5k424lErAovOoZrXJmYJIVGiFR0UsxwIhrY/XUDZA
         RZ3ZnDQi06RbiWY6IEGq2SSaTiKPgTkLva8tFdg0dBbcgSCj90mm8EM0qF1YKympugn6
         jHvOoPo+E1+o6b9IV70PPLT6F78O0LHmXQOn3SqoV3PIQuTEkChBwUcJt5uK6hRnAivL
         cfujwmYvtoXRYbykokH2SyjZCQ4NZYfda/UQvVBqLZ77asATb+PpxE3MbQT75YIVSFLU
         Gk3A==
X-Gm-Message-State: AOAM531wpv6M27q1vtVu9iYEZRFJAqJpAE4DsALzVtd5VsBsLtKx81N8
	GXQFCWAmgdKEsrJtaYseHgEbo5n10Z4=
X-Google-Smtp-Source: ABdhPJwVPesv5FQGgNDLFtyY/ngWiF8pnS9zpw/GVwO+GlOcy1Ufus5r6HaqY99CounlJMIYiwRN+A==
X-Received: by 2002:a0c:d40b:: with SMTP id t11mr14633633qvh.0.1591994743677;
        Fri, 12 Jun 2020 13:45:43 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id o33sm5578369qtj.44.2020.06.12.13.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 13:45:42 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] util-linux: Split out zramctl in a specific package
Date: Fri, 12 Jun 2020 17:45:30 -0300
Message-Id: <20200612204531.1119475-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-core/util-linux/util-linux.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 532cceb935..e3ef558d7e 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -270,6 +270,7 @@ ALTERNATIVE_LINK_NAME[umount] = "${base_bindir}/umount"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 ALTERNATIVE_LINK_NAME[utmpdump] = "${bindir}/utmpdump"
 ALTERNATIVE_LINK_NAME[wall] = "${bindir}/wall"
+ALTERNATIVE_LINK_NAME[zramctl] = "${sbindir}/zramctl"
 
 ALTERNATIVE_${PN}-doc = "\
 blkid.8 eject.1 findfs.8 fsck.8 kill.1 last.1 lastb.1 libblkid.3 logger.1 mesg.1 \
-- 
2.27.0

