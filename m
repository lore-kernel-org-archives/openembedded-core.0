Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.4584.1596317030610706404
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2020 14:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P7u2gUl0;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id w9so34823053ejc.8
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2020 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TPXC7EvvjS+Bjl7i21RIN2mJNQiM9Y09mPXgMQUN4X8=;
        b=P7u2gUl0LHZMQQ2bTnbfPniBzvePKvcJ/HhgI9XcC0/sZRK2SNLr+BBeXZK3arxiG0
         wXvDQGeuSbFAcEh8C2rRCugXf/TXjS2jkA9btkz2N/hky0wkXOuoz09TAIIbGLDo+5QG
         rIm6SKqXP6GMzGKH7smaH1lNmQGyHWat5tLdhwNsX1ul3mwBZb1rInVx05jhrLUBtsxn
         S1+ay9e+zUpgqxdgQ3YX0ahuKX7GxLDGLBdITCUCXUwxHn1awFQoMnWTsJ9S9iwDEoBc
         Cxla4YU56fjiwHLaV0M4ZCQkCWzN4OyaMA4HPKapgBptqFaqCUmMXpnhGLeUvQE7xbHS
         jOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TPXC7EvvjS+Bjl7i21RIN2mJNQiM9Y09mPXgMQUN4X8=;
        b=QUd4r4O71ElaC71XZDmh1kMURM7UpyQx+LpzUIEKywZ/hC3uzITKCN9VoT67JLpl2C
         YeWC09JprLegX6dMhen0+lezt1BzCclwuY+6ZvaVhCYzWaQlS3D0j63O9UW5H4/XwpJn
         7OC3DQ3l6imTPEIw1eMzGSlXA+lLoeAnbtoXCA808ILNpLKqJu2eq9kdeGd9Ji/F3qDB
         CCljy6BszvkAF9ecEqiPCWNSggUXQgtNN0LQ5+uoGd8vWI3TJKuWhDslN+ffSjxfqsUo
         758yHthsDruVNlHkDFrSagwUcowEtzoDVZ0Qw9Cc5uIwiVrhigNiw9d43fizhJWCbe7u
         orDw==
X-Gm-Message-State: AOAM533579oXA3hunsPKaRXZltHNH62b59YOzhrSYehevcwP1npMYEaw
	w50nHN6Ik2TCDkwe3iSyw07QEsBkvsQ=
X-Google-Smtp-Source: ABdhPJz6Bn4N6aW2cYWpG/8v+e8wvOn8WMnKRHV6nuZlClUB8s5GZ7dBm7ugEopMBguXuxGkx0FwyA==
X-Received: by 2002:a17:906:7752:: with SMTP id o18mr9669759ejn.150.1596317029041;
        Sat, 01 Aug 2020 14:23:49 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id cm22sm12168803edb.44.2020.08.01.14.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 14:23:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/13] glib-2.0: correct build with latest meson
Date: Sat,  1 Aug 2020 23:23:29 +0200
Message-Id: <20200801212335.14922-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200801212335.14922-1-alex.kanavin@gmail.com>
References: <20200801212335.14922-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
index 83596e0efb..adad7e62ee 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
@@ -2,4 +2,4 @@
 have_proc_self_cmdline = true
 
 [binaries]
-env = "/usr/bin/env"
+env = '/usr/bin/env'
-- 
2.27.0

