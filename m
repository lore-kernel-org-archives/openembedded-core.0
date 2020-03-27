Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.17629.1585329932302909937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 10:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k9nqAk1O;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id c187so12280642wme.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3sc+tC1tPLIpDcxIN/A1800ZgTg6YSQVNtKm6qlABmo=;
        b=k9nqAk1OUoUzG4XrNH4NabdeED8PaoMlnPBmnB4l3/5r+IADfzwHCT53TgZFenl1eV
         VvO55QOL+opg97RzqOOzvZwKHFJKQOHGKbM+2isrmaN2lfBl3Afi3hI8RFRTwlkH4L4F
         202/KPNuA4iFAwqcDNCCIPuM15kW86nKOYnZ6LnZ7TXXM1OHnWZG2EVJvPT2FmZCQILx
         Kk/z3KqUXSsJLsEIlOhsafnSoOutPZwmJEU80lB3ZEqXgW3M1/aOo5laehUeTWmwQY3C
         MJhFB20cnGpFJMe3gXQOHKCrBJHS3dItgTASzDm5DVgPj/RMOyBH/ivZbBBvdoYOgKhQ
         Z9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3sc+tC1tPLIpDcxIN/A1800ZgTg6YSQVNtKm6qlABmo=;
        b=Qf8skMy5gZCgCOndcnDx+Gujbos3+oR7y5cT+OS/NTyXm598Zv4h/bVrzsxe8xl1W6
         ZNWB9pJJXnZkhZIQ9mdC3j5mUpeBmeMd7mExg4gnkMk+ItNWoOZ+1K6cstGsjKr/OrzY
         eMOak7FjScQ8GCfoAI5MxY6JpWa1JhyINGyG8q+34qyDNctqAYgm+dTRGp25RkHMAbDr
         AxSZPCbIRTZFske4H7i6fyIplrkW+UhLaRGsdfWEjR24RiC94bYYHqw80NZhbRMehrLg
         VKZ4n5rRy0qcsyhUe5nE3wX9vuqT4R4ev6eaNPLGAMO7nA0L/B4M7XFs9H8Qiwfj92jT
         bJCA==
X-Gm-Message-State: ANhLgQ0D4h7ISOF5WOBFsSwp7yG8qFQX8vRjZKmSYbXY0tuGknek3f+0
	fCyvOZ4ftcECSzf8kY5BXdSCWoao
X-Google-Smtp-Source: ADFU+vsGpYu6Ic99inzlz8eC6EatuD69da9DHnhp1cWejF4dnMra5IEUhKU4zbgvGQOPxe766cz5+g==
X-Received: by 2002:a1c:a9d5:: with SMTP id s204mr6492761wme.172.1585329927579;
        Fri, 27 Mar 2020 10:25:27 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id g186sm9281419wmg.36.2020.03.27.10.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 10:25:27 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH v3 03/13] systemd: Replace nonarch_base_libdir with rootlibexecdir
Date: Fri, 27 Mar 2020 17:25:10 +0000
Message-Id: <20200327172520.62888-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327172520.62888-1-alex.kiernan@gmail.com>
References: <20200327172520.62888-1-alex.kiernan@gmail.com>

Use rootlibexecdir consistently rather than nonarch_base_libdir for udev
rules.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v3: None
Changes in v2:
- new (s/nonarch_base_libdir/rootlibexecdir/)

 meta/recipes-core/systemd/systemd_244.3.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 809dbcb9a69b..214eee316b63 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -546,11 +546,11 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysusers.d \
                 ${exec_prefix}/lib/environment.d \
                 ${localstatedir} \
-                ${nonarch_base_libdir}/udev/rules.d/70-uaccess.rules \
-                ${nonarch_base_libdir}/udev/rules.d/71-seat.rules \
-                ${nonarch_base_libdir}/udev/rules.d/73-seat-late.rules \
-                ${nonarch_base_libdir}/udev/rules.d/99-systemd.rules \
-                ${nonarch_base_libdir}/modprobe.d/systemd.conf \
+                ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
+                ${rootlibexecdir}/udev/rules.d/71-seat.rules \
+                ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
+                ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
+                ${rootlibexecdir}/modprobe.d/systemd.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.network1.conf \
-- 
2.17.1

