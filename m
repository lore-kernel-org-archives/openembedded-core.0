Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA543C5B543
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 21:02:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.3559.1748552562834296837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 14:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xc/BU1na;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3123eda2a1dso255799a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748552562; x=1749157362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YAK7qsLP+MLdQQsSQt+bWbgUDQgGylw7MRYrzYY4ICA=;
        b=Xc/BU1naUVYYpqHsRyE76gOKvyrjL2N6foomtHbvWgtPBDn2y4WfqYevKyaYdOqRUX
         dEvS+4EM4x+WqarPDEnok9OLEM+B9G0hYaYzxygTQ3EqGiK9jCPfBsew/zptHvQkexfY
         ihQh0AWS5p/aq4anvVl5Scy+dHWvH3/G5WaHTglpi8TuugS+LqRp6/3WH9L8kVG2QpsH
         yxFpshSfnaTFt+7nOf26D73+7TSaKM2lMnpN1uRKepGN+SVJROrq/rZPeC7czSCj9vG9
         rT5zCIVwhPAG33JQ0Qu7UxDCHhLIL0EHZxgvdVnyvtg9YB++yLN+GvMQlMI7wC8TiZSL
         tyQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748552562; x=1749157362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAK7qsLP+MLdQQsSQt+bWbgUDQgGylw7MRYrzYY4ICA=;
        b=v1VJatw6zsf5XC8XHg8tL26tdC8afjCY/UvMxlDVZ+QJuiplsR4IKdXhrN9DgHeVw6
         1URhdGi11gqC3axdDqhvnaC3YGFNs1SR+YwetqmBEhm0i7iDKLzNdnib5GZR6RpcxgzA
         Q3AkSgMSTcTXTs6x1QJ8U8wRQI71zQc/H6aprIoQZl7+giXZ72P8BVczmVZ9Xiyx6OOC
         LpSQ56Mbolaaw2kVM3u7GBtpiIyFsfvkZB/lwennW812A7DiY/ZMxpG8IjMAkS9dxXlc
         TxSvjXTdQGpCtZk+6u0jWpszd5yoJqrzUSAt1qJtleO5QYqKRk7UC2gKN+anjnWPvCzT
         i6mw==
X-Gm-Message-State: AOJu0YzEcBEzYRbaH1evBR9z62LAPG6pe4utkyXQrzwhG38Cm/8UNlak
	6g8TY5bkgQJ35cQm9Grjk5vznAzENi2zY6Pv4ISlkOneor8GE2XmS0ME1L1xto+1
X-Gm-Gg: ASbGnctyA+2rdQVDuSTM/ljRgCPNdlgvmtOq7HooIwyQ70DB/aMujR6D1IEXBeQbTJq
	D2HU5SbeWQMsrUyg5vC1IonOsomiUXpTU+XIoCdT85FNiHDpAoPVXzt2oElIOZroTyUkX3fUft3
	BffYEdEWUks1sHuA90a9EYUK7H8Z5anyyc2R9R5uMzeeXrLHHizaVN5gq8KxnnL2da7VtdS0hwI
	XjD3bSYUyI6wMF+3tpLJ6/rUaSQ8cXgFe/csqnsaLOlr/Hqpdfn0I2jBc1Fl2KlMr8ldYQuQ54P
	zUMB9TglXYeqZeaz8E9x6ejOXmnMaOY1QcxVJpRv789jUC4xBSKy6w==
X-Google-Smtp-Source: AGHT+IFXNKqyUT+D1Oefq1GKdJ9srSFcuAcfqAU//W4W9c/eULTyZ2kX0KJOBl2FVsskuEn3xFP7vw==
X-Received: by 2002:a17:90b:1850:b0:312:639:a06a with SMTP id 98e67ed59e1d1-31241b88426mr1212391a91.31.1748552561697;
        Thu, 29 May 2025 14:02:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bc89desm16486405ad.36.2025.05.29.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 14:02:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 1/3] tcf-agent: Add $@ to RANLIB
Date: Thu, 29 May 2025 14:02:37 -0700
Message-ID: <20250529210239.2070257-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 21:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217452

tcf-agent calls RANLIB ( if defined ) after calling AR to
create the archive [1], when RANLIB is set to gcc-ranlib this goes
unnoticed, since calling gcc-ranlib without any arguments silenlty
does nothing and exits with return code 0, however, calling binutils
ranlib or llvm-ranlib does demand library name as commandline option
and since it is not there it exits with code 1

aarch64-poky-linux-musl-llvm-ranlib
OVERVIEW: LLVM ranlib

Generate an index for archives

USAGE: aarch64-poky-linux-musl-llvm-ranlib archive...

OPTIONS:
   -h --help             - Display available options
   -V --version          - Display the version of this program
   -D                    - Use zero for timestamps and uids/gids (default)
   -U                    - Use actual timestamps and uids/gids
   -X{32|64|32_64|any}   - Specify which archive symbol tables should be
generated if they do not already exist (AIX OS only)
aarch64-poky-linux-musl-llvm-ranlib: error: an archive name must be
specified
make: *** [Makefile:53: obj/GNU/Linux/a64/Debug/libtcf.a] Error 1

When we add $@, to RANLIB then it becomes the make variable,
$@ - An automatic Makefile variable that expands to the target name (the
file being built)

so the makefile target now rightly adds the .a filename to RANLIB call.

Sent a patch upstream to add RANLIB for linux [2]

[1] https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/blob/master/agent/Makefile?ref_type=heads#L53
[2] https://gitlab.eclipse.org/eclipse/tcf/tcf.agent/-/merge_requests/7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 235936288ba..0aea4b88505 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -51,6 +51,12 @@ CFLAGS:append:riscv64 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:riscv32 = " ${LCL_STOP_SERVICES}"
 CFLAGS:append:loongarch64 = " ${LCL_STOP_SERVICES}"
 
+# This works with gcc-ranlib wrapper only because it exists without error if nothing
+# is passed as argument but binutils ranlib and llvm ranlib do not and expect an input
+# passing $@ ensures that Makefile default target which is the archive name in tcf makefiles
+# is passed to RANLIB, ensures that whichever ranlib is used, the behavior is identical
+RANLIB:append = " $@"
+
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
 	install -d ${D}${sysconfdir}/init.d/

