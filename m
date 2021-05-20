Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.509.1621543761264249412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gIs1w53L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id u133so9945555wmg.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6ckwrzVDLy7TnZomBKvH2SRSubGGMArGD8puFvDnUXA=;
        b=gIs1w53L2jdPpkg4EUeedWiIU3dcyAZoqIpzkwwvJawTmFGVmFIdf1d1+Lb8A0Gpt6
         ZQslMf7cVDP/K4A4X1mtnSxgPWIsxJpFGqLQYMJLoHe80N2o+KpcqQtDHy/liU8sEDSe
         m5cr6S00RCuE8SUHmg0hcNNFxO4rcLhGRat8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6ckwrzVDLy7TnZomBKvH2SRSubGGMArGD8puFvDnUXA=;
        b=RRM4/3Pwerk9qjhyk6i3i0Yv9FvBl0shcYHkPNZIv1Vf5hm2qJGhRGtmIm2IB81Y3o
         8bZIc9hWnrlHhIKoyaUzy5kDm6LnZqGeM20+rfia6U4kpZHm2Jyv65agOoLnTopwG/J/
         RAEOGQr5lIEeKmPfuq7vJhH3tgVeR7GoNABP1sxjH33MLt8B9T/mSKUPWYCSgS/QMfcb
         DjSUBn4k1vPsjxUAJYdmx5EDUeDUWyTtTuz/FGNaYLeYnNu6Yqqi2rRKwm64JTIY5/av
         jbG5Owl+Xx4bwtdejkdAFALrMURTVPQthzLZYJXRApHec2qg/K0aspBdjXGfa3S8GxCY
         w7fg==
X-Gm-Message-State: AOAM531mE2NOzbdRCDSEVbh7vtRnQBZu1ifF7lpWHtQVv20nQcoPE9EC
	RFUW/HEsLmdQQUUtPnM0r1hKXFNx3UbAJA==
X-Google-Smtp-Source: ABdhPJxxwiZUqeALL1j+C9ySZjBbZMsNlwmHvpqmmHtQP3MTbvcH6/gydul3aB71o8Vpwvs6wRxWyQ==
X-Received: by 2002:a05:600c:221a:: with SMTP id z26mr5811982wml.122.1621543759797;
        Thu, 20 May 2021 13:49:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:19 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: [hardknott] [PATCH 28/28] meta/lib/oe/rootfs.py: Fix typo "Restoreing" -> "Restoring"
Date: Thu, 20 May 2021 21:49:02 +0100
Message-Id: <20210520204902.2527687-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d634adda4e9..16493577e3b 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -167,7 +167,7 @@ class Rootfs(object, metaclass=ABCMeta):
             pass
         os.rename(self.image_rootfs, self.image_rootfs + '-dbg')
 
-        bb.note("  Restoreing original rootfs...")
+        bb.note("  Restoring original rootfs...")
         os.rename(self.image_rootfs + '-orig', self.image_rootfs)
 
     def _exec_shell_cmd(self, cmd):
-- 
2.30.2

