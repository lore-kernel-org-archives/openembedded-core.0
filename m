Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB3C4450D
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:31 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1662.1784055861143103688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=N1uo99KS;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-451fd21113cso1289514fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055860; x=1784660660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZ9wBQng0hCIeeARECFLh9POpoisr5tJoqzK/vKvPDc=;
        b=N1uo99KSWVmBzdXsG6CEhdNB0c5T5pVSAKcaMfmF5QrU38rNyKFS5OauwOhCVMBAb8
         e9LbNkdpOTrBwL7vEZin/3TFhgvw9evOemfXiqXkW4odFbo750rFQeL7nscCOpqBvfbX
         sxJxvcEqLoByy6eeXOB+xRcY+0cIBzUsCql1C5qBFuXUFvIIkeUxC/BIhtLWLmtKl29D
         6sm99zDqBP0njDWCcaKR6iqB9LeMigQ83BMDMaGyWM5pMc/2fXjmcEnC5VmaH9Bnzk7C
         +KaKi8P3eyIyHsa2RF1pICO2kk+XRdzu6Vlf8tO7AAmOIyMp2Ib8v+3pgiX/8v3sWgJZ
         Yn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055860; x=1784660660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZ9wBQng0hCIeeARECFLh9POpoisr5tJoqzK/vKvPDc=;
        b=WsUTDM2TyKuWWSELfZC6ynTEpi84EtcfRT12/ClksbPv2bavpAOngX1KqnW6ks1Jx5
         fs1sC3TPjojbrXv0Ins/HY08UnIxrncSDMryRTV1AS046PN8NGQWy70//2CO5+f0jGZS
         hucGDX3h8pG+yshLTwzul1w+yzJjtQCiYUdkfc/gyOyYT92U5JAcRjS2kYiiXFWN8fuu
         pzI4q+2jiS65bpLB7B70oAarK7/krd6WpbDRbfRrulHlzZruLvWdy8sIBDtK/Kwr0tP3
         s/UG/a3PmH7hDkd6ajYiFfrYgkMQFrECpgzYXTbJOV0sjSiXDabYERTsxnNoLDOe/pfX
         rr1A==
X-Gm-Message-State: AOJu0Yz3LacwPLT+GipLBB74yrIAOFzBSlSZ/10GNKEOuvx97UQ/YT27
	YskwaoS8UYPewKqO4lYE5wGR7O9zMOEUJAPn2lLSAp/pUvmk7Yrars0WtvAI4A==
X-Gm-Gg: AfdE7ckE2GS28nJBMdhmUwo561LbGULLmRqtx9jAkBVcxyLaCgCjfPJFNOBOTLod254
	CD85zBr6Hvow7m/HsVBeFVOp21UFJH7/DSAj7DyrOPailzzyhuvJM2BaLiSxEWX4pvtH5H1Z7Gi
	Es25C5qP3RH6eifJqQjIuUccMkps6BdsiVBFAq+bkC6FseOdPN+lu7vmsxzL/1/q4qdPHlNCsAJ
	ftYrYCs8w/Aw+Ttb1iZYKQXLRaqKJSfae+FNUufY+AYMp8f7DnkvoO6JRY5LfOFKufW6KadObiy
	fgH4oY/MDRNCTAtJ1gu4NxC8m7Pn6IlRsAZckBydpjQZCS70M2bpWYd2dfdTz+0s76ZaMCkl/qc
	kkwxyienK5UTy/zHRkefiKYUYbwfODfUCZq4XZ8BSFcV4B2nA20wqRBfVeR0QsVKtUx2FTvi6XE
	9eeuwfebFZig==
X-Received: by 2002:a05:6871:522a:b0:42f:f3b2:e2c9 with SMTP id 586e51a60fabf-451f1b873c8mr7197776fac.0.1784055860239;
        Tue, 14 Jul 2026 12:04:20 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:19 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 15/22] libgit2: Replace deprecated SPDX identifier
Date: Tue, 14 Jul 2026 12:31:25 -0600
Message-ID: <20260714190405.3328796-16-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240923

GPL-2.0-with-GCC-exception is a deprecated SPDX license identifier.
Replace it with "GPL-2.0-only WITH GCC-exception-2.0"

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-support/libgit2/libgit2_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgit2/libgit2_1.9.4.bb b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
index e46e5d49fd..10999f972e 100644
--- a/meta/recipes-support/libgit2/libgit2_1.9.4.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.9.4.bb
@@ -1,6 +1,6 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
-LICENSE = "GPL-2.0-with-GCC-exception & MIT & OpenSSL & BSD-3-Clause & Zlib & ISC & LGPL-2.1-or-later & CC0-1.0 & BSD-2-Clause"
+LICENSE = "GPL-2.0-only WITH GCC-exception-2.0 AND MIT AND OpenSSL AND BSD-3-Clause AND Zlib AND ISC AND LGPL-2.1-or-later AND CC0-1.0 AND BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8eacfdc17c8f4d219e131a073973b97d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
-- 
2.54.0


