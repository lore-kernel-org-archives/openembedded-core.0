Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F7DC61CE5
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 16:11:50 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.15849.1748967101436181178
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 09:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgMTNKrs;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747d59045a0so1968562b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748967100; x=1749571900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdRZWRB8Qk2id0oYIfFGNk21r/KQHIcUmcxD5r7zZ04=;
        b=dgMTNKrs+69Nngb1cVF6He2thDoLcpuINbF+El465dtPWlO95jOgEybKxM1A4rC3eo
         /wCht7qNMHUzMpchYiP46DqFKCBU6RcHVTV7XlkXTgTvJaWUrId3npZD6QxVl7QVivEH
         obdhtVSLCDzvDKS1nh0wForhJS+ulVDJ+5Q4nFiyWiHr6Cqaj7kpheaF6B11PnWb93Bz
         SF6r8C5E5mOycDFMIT6HVzmba2OfVJ8DpTPl2gBtplGQEiyKYchvYsxh1GxCHBvxBLlA
         ikZ2/h4Nj+NMU3pfCycn9rVLbwWaCapsU51t2/pNn0XM22Vvrh7S3mIOjPXdkRFvPQaP
         ilZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748967100; x=1749571900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdRZWRB8Qk2id0oYIfFGNk21r/KQHIcUmcxD5r7zZ04=;
        b=H6EALgX8mS5sdchgnP6aJE1OduhbHhW/a3KVTLbb0k9at1vyZux4TPkOCIqZe1xD6u
         GgIXxI47Tn4JHw5bP8BCz+jLWRw8uFrioQy/0jUrtiHhdM0ndw7jHtDL/Tu/lW3UbjyN
         08JKmvIUf2Rvnchz7gfnwvhcXs6MQTPXuQ3Cu2pDRAbhMfg0XIrKKcjxVJyUoJ0XRVwR
         BvnNTEXgeLc8UtlwoW1aEkGjXHStVKNMPYB96/yvYlSv2+ftKkXDs2LO5E9aQTafd7qE
         lLxVLO9eLQ46qfEDxknNujEONFwVllw5oXsMag1LIBj/vAjYgyOzGYJ8qWKJlAT0z6r1
         SDJA==
X-Gm-Message-State: AOJu0YxCB0IrlKPnj7zu6qee0KoqOeArRNmvW/aR/MeRPmj5Xul125ot
	3zSxtet0EKK/8N/IUcqf/geEsrjzRyFwIM/mFvykRcKZhKBPPtdnT2/ho+XK+g==
X-Gm-Gg: ASbGnct0WjGi37xT8sRUbbXjI+hirRVsneq/HPrDxKThReNOIFjhtSanZUTrROCZ2AZ
	VxyejULU+OcC8rWAvq55WkibD2fgimvSD3SJQw1dgHzU1O0+Kid5bJ/ql72omgXD3YxY8ILnWiJ
	LhjDbmhPedm0d2QfyCIR3K/yxXsTMkUm3C/EqmH9dIFOZtsFZtOvVd7h6cVlxKqfQpnq4+1i7r+
	lKP1uleFcdEVXacV0JonBTNpE9gfZCg5mJP8kT/16pR3ltzZI/yscZjHUDucF4gFeMmZ+vEh52Y
	ozd+BBtFGrG6+YfYWTNbd1D8ZL6QPxynaHcKobtUh4h0QLo04/En
X-Google-Smtp-Source: AGHT+IHqPlo/kWSRrw2c9nsfzV9dGlX3n9fsHxAeCa//OEKB9uuYF0J+3sTa2m7StzNXzvkyWupv8Q==
X-Received: by 2002:a05:6a00:2309:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-747c1c60247mr21378739b3a.22.1748967100265;
        Tue, 03 Jun 2025 09:11:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd441asm9596464b3a.153.2025.06.03.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 09:11:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 2/2] tcf-agent: Add $@ to RANLIB
Date: Tue,  3 Jun 2025 09:11:35 -0700
Message-ID: <20250603161135.1013947-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603161135.1013947-1-raj.khem@gmail.com>
References: <20250603161135.1013947-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 16:11:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217819

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
v5: Rebase

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

