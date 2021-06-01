Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.58645.1622557113861325301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Y+h+sAUp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id y15so7546294pfl.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=0V1rPOMymp9JNAlW0TBq0OYWg/luCoduf3K0neq04ik=;
        b=Y+h+sAUpNr4EaV4EN0HpAWnNsm2tqOZPRuGje5oLCgaQb1rh+bJyO30RddsESQPqkm
         m2BCya4uZgge1b5xcZbMlLpixigEMhW7mjrGErzgxpLbcNZWmyuFw8+M2ZWCXa4B/rpj
         BwEy+HhRAyyFdMuVcAeu2NVQhXt03VqnG6l4qxVLknuxwBc1m58qKod9GktZKnhngQua
         aTrbwEjSD4oQ2RxC37nGZpxt8Lsf1lVJnfzd8dVZlofGbGyScXhSJO/TmvyI4UV8nweQ
         fUZklEWzfz1nnTVcDuPiW9KfiFjmCEB+1ZpoGvxYxOb4EaWksl57dO2ziOEd9CfsD2kH
         pwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0V1rPOMymp9JNAlW0TBq0OYWg/luCoduf3K0neq04ik=;
        b=cJen5woFGBBnimzpyDnOktzwO9hhzEoSJp9OwsoQIhg/hAJkZ6jCakpmFwe20+DSw8
         ondpAn0Ap+8L3/cbm6pqV7vp4uvE40NHohWUrLvwJm6IJtTAN+rnKiGD6HfFZgB5nxQs
         1bxMq/ieWZBcjkQiuUE1P5s9ZEeXLYg1uD9XiXskFxqyrFIB+XVI9jrgsaOmit4TfASD
         MAR5l0hLNLrxLcte77Sb2oOXqsBKK6pdpdNLrv1ObRKQUd5Tgvmk9oyziGpYklUFZGTL
         xKoBw0xxG7Zf4qiTMZRnvu77otZaX0kJUDBo0ayF4fF2l42jmpRMdGxTKmmW7zchbysj
         MpHw==
X-Gm-Message-State: AOAM533mu7EpnySbcVhMMeYvEHw/Swo7nEjaV4Ik1I7/xrSqIQevzgyZ
	b4bm4bTQOPsBXYEI6/uF9kb8SLjDvT39TrCFaB8=
X-Google-Smtp-Source: ABdhPJzqCQZ2jgQyWV0qEt/xieGGEqRZGK2FF6Xxixtimd5zD08kAASXWoRYvYzqAyj812LiEdEiFQ==
X-Received: by 2002:a63:f74b:: with SMTP id f11mr28274528pgk.327.1622557113004;
        Tue, 01 Jun 2021 07:18:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/26] cups: whitelist CVE-2021-25317
Date: Tue,  1 Jun 2021 04:17:49 -1000
Message-Id: <68ee8fd1ec0f09c6477578de40e1adfc7ba35027.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

This CVE relates to bad ownership of /var/log/cups, which we don't have.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0792312f3637ec160d2ef90781a8cb1f75b84940)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index acad3c98c1..151ef065fe 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -116,3 +116,7 @@ SYSROOT_PREPROCESS_FUNCS += "cups_sysroot_preprocess"
 cups_sysroot_preprocess () {
 	sed -i ${SYSROOT_DESTDIR}${bindir_crossscripts}/cups-config -e 's:cups_datadir=.*:cups_datadir=${datadir}/cups:' -e 's:cups_serverbin=.*:cups_serverbin=${libexecdir}/cups:'
 }
+
+# -25317 concerns /var/log/cups having lp ownership.  Our /var/log/cups is
+# root:root, so this doesn't apply.
+CVE_CHECK_WHITELIST += "CVE-2021-25317"
\ No newline at end of file
-- 
2.25.1

