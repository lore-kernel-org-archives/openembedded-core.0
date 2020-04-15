Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.7528.1586917936203810404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 19:32:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PtiRKT/Z;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: jpuhlman@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id r25so2433414oij.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 19:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ApO4Uzso7J0GdWV8NVMEmzz5/KHpgyI7E2mmslLbXc=;
        b=PtiRKT/ZqrNnRhGocYxKExfbKra+IG6fFnU0J4Qx04a90bGplsaYGdOTsSUf9h7DuE
         eHryC02D6k70468EgRLM4mEzLgkQ8HsXGNe16t0IJvbmd0phHPjXQpy4IJz6vU2QH/mt
         lBiyXAFaP4SX1qjJHb323MPtgrWTXyfsZEs2XpbYovSth5WQLnAaSXKz/bKld5yqWYao
         nhqK7Qm10g7WceyxYGfS9S5pb/lBq16XJPROi51BhuvRcLHjmcUtSoap/C46q5++5hvB
         E9hepRQUbWZ3F5n8kFVJAcpLDcEM1YRC3Hc2X24Gp2KzFNrquXD6RE2Kq/MJq0yQ5m30
         KFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=4ApO4Uzso7J0GdWV8NVMEmzz5/KHpgyI7E2mmslLbXc=;
        b=uDGZAsF5pVuTH7Opf/gP3DqUZWCOJmgp9DSdVooNzRhlKw+gnubWOqNuVsVeQHE8f1
         mCxQkTctSzhIVMX1A8dZWlNMg1xeUJ9nCZJBlmgvg3xG97I5D9X2RQ58JceKp9Vf++v6
         RWTAl0vJPG92cHbhm2wCeBlmCDtOpsCWT8v4y2RphCqTteWLz73jY8xhCcnIdqCt1ZBm
         jioO4qAzliSVoDpRu/nR9KWGVtM2ld4apfJB5OUQymoq/Z+cIDb+4RSCVwfYAmHd+6+f
         smbsY4qC+lXlTONtbJt744Sdh7ROLaMRq5PF31bBYR/55jrPBuUuhiMMCKx5IOhCaMO1
         9YjA==
X-Gm-Message-State: AGi0PuYbdVk/pRb4C0hGUXuBkGB41zE+U15ph2lfXcUkWPmklhHJAono
	hK5CH3DkjIVKdUXnlDvDtCjQOr1R
X-Google-Smtp-Source: APiQypLnqcpdnZuH6fyZ00+s5V+wZ5RjDP4zSVxbCE49Q3EkJCeYnKeUJVZLIi8qYLIi8rkPPGA4qQ==
X-Received: by 2002:a05:6808:256:: with SMTP id m22mr16927013oie.48.1586917935334;
        Tue, 14 Apr 2020 19:32:15 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id h65sm6000888oth.34.2020.04.14.19.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 19:32:15 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 31DB42A04D4; Tue, 14 Apr 2020 19:32:13 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH 2/2] buildtools-extended-tarball: Add libstc++.a
Date: Tue, 14 Apr 2020 19:32:05 -0700
Message-Id: <20200415023205.26050-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415023205.26050-1-jpuhlman@mvista.com>
References: <20200415023205.26050-1-jpuhlman@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index dd780c5d57..e38967af3f 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.20.1

