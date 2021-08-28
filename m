Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web08.199.1630174426906546257
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Aug 2021 11:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qVHpbOTp;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.52, mailfrom: steve@sakoman.com)
Received: by mail-io1-f52.google.com with SMTP id g9so13526676ioq.11
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Aug 2021 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sRZSExdoFpynSjR0Gz4S2kMML6P+IdolwEABLGJom7A=;
        b=qVHpbOTp7+07fnIjmTgt075V7jcmZbpwDsMwhIsOiUkykUhVpVD/nRC0I1LpJ2gLcS
         MX7ArsVDOjnuj2Vh/XxEpRQ+6j+haiS+chgVexuNvHH//iNdGGHHvX5Ft8U8XpOv1nES
         kaouVP95iVsDpmpXm7/DQK2nZtp+Ma+roB69K0jBDxYH04XgQZ421qzJaF2C4Ib7h5j8
         4jUID5gwsEItKGkVSWxAQf7iMDPtqsLUHvnpTWOt2sTjh1e0XSnCUsfqkAwVrUI1Xat7
         WfhasbM0DFHs6CUdRLmFjexQy1CQLLYD0spfYNA35G06CEOdxi95LLxMdSrhNeExPfVn
         u7fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sRZSExdoFpynSjR0Gz4S2kMML6P+IdolwEABLGJom7A=;
        b=DecJTXN40JJlFkUtZXKyVWjq7Ary4dD+UvJNCkIuitZeIhmTUVE5xT5o3bpPG86kmN
         RwFVhDp7eLjtWWeTQPK7DiX3/SX2/bVlO8vKDOwCCE3BWXiMSbhXRkbRFh82NVgRQiw3
         KK+EYwPgElfx/RChwmSRwIT4Emw/QGR60ErRDyFUKWQ/ZNTJ83u9cc9jxb10OoQ9Hp2G
         RWag2mf8sVmgdsvlb3Lratfoico3ZXS4ZAe1ks4gJKbF4xw2pyRnzfcV6BFJ9htSDobq
         Q2Zhf7w2AQ72wjS+BdD7kaY8ASLoVUdXLCGgFNCum53ameLkP0/grBTCs1qofcNxuddA
         p0iA==
X-Gm-Message-State: AOAM530aGkQfmtrXUtBWqCbD7C+bBURMRIBntQXEMePIViEierWDhf+z
	GC09k75tz8reB5PKLNAr9Somo4wiewPSJxgp
X-Google-Smtp-Source: ABdhPJxm4yP0xAP+dYcwx77e6Il37TmA8nic7ghSmD8dHV3VR6k1FXZuDkwdJpJCTM++L7YHLclr6A==
X-Received: by 2002:a02:a18d:: with SMTP id n13mr13773200jah.120.1630174425515;
        Sat, 28 Aug 2021 11:13:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s16sm5511664iln.5.2021.08.28.11.13.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Aug 2021 11:13:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/36] rpm: Add fix for CVE-2021-20266
Date: Sat, 28 Aug 2021 08:11:10 -1000
Message-Id: <6c16aad7167eb98bc9995486f967431c39f9df15.1630174149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1630174149.git.steve@sakoman.com>
References: <cover.1630174149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Adding fix for CVE-2021-20266
Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]

Note: Hunk#2 and Hunk#3 refreshed to apply patch and match value of
dl_max variable to make it with current version
All Hunks are refreshed to solve patch-fuzz

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rpm/files/CVE-2021-20266.patch            | 109 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-20266.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
new file mode 100644
index 0000000000..f2fc47e321
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-20266.patch
@@ -0,0 +1,109 @@
+From ebbf0f0133c498d229e94ecf2ed0b41d6e6a142a Mon Sep 17 00:00:00 2001
+From: Demi Marie Obenour <athena@invisiblethingslab.com>
+Date: Mon, 8 Feb 2021 16:05:01 -0500
+Subject: [PATCH] hdrblobInit() needs bounds checks too
+
+Users can pass untrusted data to hdrblobInit() and it must be robust
+against this.
+
+Backported from commit 8f4b3c3cab8922a2022b9e47c71f1ecf906077ef
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/pull/1587/commits/9646711891df851dfbf7ef54cc171574a0914b15]
+CVE: CVE-2021-20266
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+
+---
+ lib/header.c | 48 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 31 insertions(+), 17 deletions(-)
+
+diff --git a/lib/header.c b/lib/header.c
+index 5b09f8352..ad5b6dc57 100644
+--- a/lib/header.c
++++ b/lib/header.c
+@@ -11,6 +11,7 @@
+ #include "system.h"
+ #include <netdb.h>
+ #include <errno.h>
++#include <inttypes.h>
+ #include <rpm/rpmtypes.h>
+ #include <rpm/rpmstring.h>
+ #include "lib/header_internal.h"
+@@ -1890,6 +1891,25 @@ hdrblob hdrblobFree(hdrblob blob)
+     return NULL;
+ }
+ 
++static rpmRC hdrblobVerifyLengths(rpmTagVal regionTag, uint32_t il, uint32_t dl,
++				  char **emsg) {
++    uint32_t il_max = HEADER_TAGS_MAX;
++    uint32_t dl_max = HEADER_DATA_MAX;
++    if (regionTag == RPMTAG_HEADERSIGNATURES) {
++	il_max = 32;
++	dl_max = 8192;
++    }
++    if (hdrchkRange(il_max, il)) {
++	rasprintf(emsg, _("hdr tags: BAD, no. of tags(%" PRIu32 ") out of range"), il);
++	return RPMRC_FAIL;
++    }
++    if (hdrchkRange(dl_max, dl)) {
++	rasprintf(emsg, _("hdr data: BAD, no. of bytes(%" PRIu32 ") out of range"), dl);
++	return RPMRC_FAIL;
++    }
++    return RPMRC_OK;
++}
++
+ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrblob blob, char **emsg)
+ {
+     int32_t block[4];
+@@ -1902,13 +1922,6 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
+     size_t nb;
+     rpmRC rc = RPMRC_FAIL;		/* assume failure */
+     int xx;
+-    int32_t il_max = HEADER_TAGS_MAX;
+-    int32_t dl_max = HEADER_DATA_MAX;
+-
+-    if (regionTag == RPMTAG_HEADERSIGNATURES) {
+-	il_max = 32;
+-	dl_max = 8192;
+-    }
+ 
+     memset(block, 0, sizeof(block));
+     if ((xx = Freadall(fd, bs, blen)) != blen) {
+@@ -1921,15 +1934,9 @@ rpmRC hdrblobRead(FD_t fd, int magic, int exact_size, rpmTagVal regionTag, hdrbl
+ 	goto exit;
+     }
+     il = ntohl(block[2]);
+-    if (hdrchkRange(il_max, il)) {
+-	rasprintf(emsg, _("hdr tags: BAD, no. of tags(%d) out of range"), il);
+-	goto exit;
+-    }
+     dl = ntohl(block[3]);
+-    if (hdrchkRange(dl_max, dl)) {
+-	rasprintf(emsg, _("hdr data: BAD, no. of bytes(%d) out of range"), dl);
++    if (hdrblobVerifyLengths(regionTag, il, dl, emsg))
+ 	goto exit;
+-    }
+ 
+     nb = (il * sizeof(struct entryInfo_s)) + dl;
+     uc = sizeof(il) + sizeof(dl) + nb;
+@@ -1973,11 +1980,18 @@ rpmRC hdrblobInit(const void *uh, size_t uc,
+ 		struct hdrblob_s *blob, char **emsg)
+ {
+     rpmRC rc = RPMRC_FAIL;
+-
+     memset(blob, 0, sizeof(*blob));
++    if (uc && uc < 8) {
++	rasprintf(emsg, _("hdr length: BAD"));
++	goto exit;
++    }
++
+     blob->ei = (int32_t *) uh; /* discards const */
+-    blob->il = ntohl(blob->ei[0]);
+-    blob->dl = ntohl(blob->ei[1]);
++    blob->il = ntohl((uint32_t)(blob->ei[0]));
++    blob->dl = ntohl((uint32_t)(blob->ei[1]));
++    if (hdrblobVerifyLengths(regionTag, blob->il, blob->dl, emsg) != RPMRC_OK)
++	goto exit;
++
+     blob->pe = (entryInfo) &(blob->ei[2]);
+     blob->pvlen = sizeof(blob->il) + sizeof(blob->dl) +
+ 		  (blob->il * sizeof(*blob->pe)) + blob->dl;
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 018b2f8700..c93654aa8f 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
            file://CVE-2021-3421.patch \
+           file://CVE-2021-20266.patch \
            "
 
 PE = "1"
-- 
2.25.1

