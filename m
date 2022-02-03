Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E2BC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:42 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.2922.1643917901378617881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MtTdVArG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id e28so3108230pfj.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nfhVau904lFdonh1+aQ04j0dUx0LAnyS99ID3a2Msn0=;
        b=MtTdVArG8TJPDCTui6bnW5j/4LbOZLbPplk+CzZiCw/Wr45UjlBMRI1R2O0IPi+3k9
         EcGdRERZEXf4mxblQlTRfT2WVgtK5yHv7n4MpNhb6wiQjuzv6lXUfI/SlqFxxLx9Gy3Z
         O5gFE63RuNzs6yPEsudxecpsaRUtYDXv+S6zCoeXF0oilN1mKAdul9NcMGidZzHxvOqL
         lCFEEmmsBT+9f9CwjH1iV1q1j5dYa/dZC4eph4Z/X8BEp2FgmUaQ2GmjjM3xGgkGXK1E
         /8cFBKuQkRNfMNYRXzVDGJpsk1DApXeLrGDolCsCEPEBc79wR2JkeXyOfGIkGh+6pgqV
         wLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfhVau904lFdonh1+aQ04j0dUx0LAnyS99ID3a2Msn0=;
        b=UsXq9XP1TrPhoNWGMJRFprBxi6U23p19aFjiuHQTCXSqHptW2d3bENiGLBgrXhtGsL
         3NgvtbroGugdCg2aueRs+D719umKwr5Os5qenitvFr2wknA7nMbhzrRwD80sJlnzeSu4
         L4t0QjYJCOPLRPjYIRVhOZwWub3N0h8eREC3kVeYu+o2A5bro85tzTlDnzEXRbenvpNI
         vk2J3KTcub99wabKaXwIXPuaIEjmhgKg7BZzbdlDVksw9rfpcf62RtNBJ7JcfhuguyZq
         FtecbvvnW2PHtpWM3J8vnbAkJ3stjVL7Fkcb4V9DtjN0IqKv2/BdIDFwiHCfigvDnPL2
         s+4w==
X-Gm-Message-State: AOAM5301I/T0P7YdG0lSNtsikBFpIxmth5rhbVLlc4Lm1yfGU+ivy17a
	lR5+WkHNQfTfaxcko/GPlxhXUFi1RbrNKWt/
X-Google-Smtp-Source: 
 ABdhPJwKgq+CmEzw0S1DEhd/9+oRDlChKobF5Qh0uNTipnK2f8PDNBu/wP4nYJzmcvmHqevWTowZag==
X-Received: by 2002:aa7:85c6:: with SMTP id z6mr35866041pfn.45.1643917900355;
        Thu, 03 Feb 2022 11:51:40 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/20] shadow-sysroot: sync license with shadow
Date: Thu,  3 Feb 2022 09:50:41 -1000
Message-Id: 
 <9cc84297f6a1de54cb7fdcd772e5f32f697c522f.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161312

From: Ross Burton <ross@burtonini.com>

This recipe is just a single data file from shadow, but as we can't
easily tell what license that specific file is under just copy the full
license statement.

(From OE-Core rev: f0e2f3b1f855ea6e184bd1d8d796279fedcbfa33)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/shadow/shadow-sysroot_4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
index 5f7ea00bf1..4e68f826c6 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Shadow utils requirements for useradd.bbclass"
 HOMEPAGE = "http://github.com/shadow-maint/shadow"
 BUGTRACKER = "http://github.com/shadow-maint/shadow/issues"
 SECTION = "base utils"
-LICENSE = "BSD | Artistic-1.0"
+LICENSE = "BSD-3-Clause | Artistic-1.0"
 LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdfce45cd7d5"
 
 DEPENDS = "base-passwd"
-- 
2.25.1


