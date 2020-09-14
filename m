Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.61409.1600092784187248083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:13:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WFB/T523;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id w7so12756931pfi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fsPqZ9KjxDbdNiRmEUFhjHWwcV6yMMo9CofGkr9eCtU=;
        b=WFB/T5231sWk6X+ixhw2ZQRXnTP9kV3FFuffpebZTCnDUjhnArHNd1CRtqoan0EXRD
         vfYnb47MBoh3EL994WcMqJwzxmMTXHlCbcJy5K/Hd59p/55fb13i1V2EA1ZGNt8m2ZwD
         x/atbHFUaApJ0uDWYUbrYgprDBuSYtrTEj94xm/Tq0PjpU2lzTMGNAsNZWXaSv102bD1
         ATMYhioRQ5xTBXvV9ux2SisKP1WmsGsdVijjK8w0Bnn4rAq9fOYJdlalKdW9yFZH9/hv
         Tqjv+i54GIcr30gc+pN2couEhCP9TyNyDPMQqWpX1pqjGvzbIWQOPS7UIv0bubNEvb9X
         cuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fsPqZ9KjxDbdNiRmEUFhjHWwcV6yMMo9CofGkr9eCtU=;
        b=Y2EAS4SvG6Ioxo8q6sNef8qZogO1FFOfUsL5Nu7TP5GRjXTVfEgv/Qx7Nh0EH5PYuU
         MGJ22UPt9cYE5g7VrARqPcnbIPfRq3mDoK/TxadOIJRRLX7OLRAZVWUB1/oOAjLmKXqO
         QkvOueJy7RLNXO7j6P5iTgzX1f1S5eotDpQKdFyzaE6di80abDPaZChBrvFjk2rIRSQb
         rAecpv5sZVzlydDYIM2sp2a7bLSyMdymWjljiM1yCBVb9JZgVoYXGJJPVYCghfqcG19V
         1DiHl7RFNq6jcM5yZERqJNGRZePhv2eT/WaACAWYoFnlyyMn4STltExWGlBnp/yiNgBp
         i+MA==
X-Gm-Message-State: AOAM5322vrFvp9+YiFPL0TRFQ2WKLPP9oXlBuKvQy8ErZRM5Sx+eLrUv
	k+aR8HM/b5QIY+F2q4n9DAstYHy3c4hR8TIjlEc=
X-Google-Smtp-Source: ABdhPJwbGqwK7QCtxQqYZRTlAa5cjXt2TL+9s45zwTCcbtW0ZxEoddOQ40s56kkpCpVMKcLxocpkEg==
X-Received: by 2002:a17:902:a715:b029:d0:89f3:28cf with SMTP id w21-20020a170902a715b02900d089f328cfmr14570011plq.11.1600092781927;
        Mon, 14 Sep 2020 07:13:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.13.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:13:01 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 23/24] cve-update-db-native: use context manager for cve_f
Date: Mon, 14 Sep 2020 04:11:41 -1000
Message-Id: <be2f8a26b46a413a1821eeab906e66c6cda4a47f.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff422652e1b5db62205fafc75ce56bb5951d478d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index d22b66f6c7..328f6ab364 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -50,8 +50,6 @@ python do_populate_cve_db() {
     except OSError:
         pass
 
-    cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
-
     bb.utils.mkdirhier(db_dir)
 
     # Connect to database
@@ -60,7 +58,7 @@ python do_populate_cve_db() {
 
     initialize_db(c)
 
-    with bb.progress.ProgressHandler(d) as ph:
+    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a') as cve_f:
         total_years = date.today().year + 1 - YEAR_START
         for i, year in enumerate(range(YEAR_START, date.today().year + 1)):
             ph.update((float(i + 1) / total_years) * 100)
@@ -108,7 +106,6 @@ python do_populate_cve_db() {
             if year == date.today().year:
                 cve_f.write('CVE database update : %s\n\n' % date.today())
 
-        cve_f.close()
         conn.commit()
         conn.close()
 }
-- 
2.17.1

