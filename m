Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8FEC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 06:33:29 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.2214.1648190008404756365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 23:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R1neIwLs;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id bc27so5699291pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 23:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RFjuwEgu1u/PkEzx1CxfykDmrkr5T6F+xBU9+QGMMm8=;
        b=R1neIwLsOmZSYR2hnabV0UfviVA083SG7HLq583Db2WBzaqC6FKVdkcUkETDLXBypB
         LDIc9nJ0mROStgWdfg38Kt0J+QSCHAWZav1uRDoHGAFOZjqG/rGEogJRCX/ioyVzlDTu
         PcU1QyWCBkxe1z/v+P5RN83YKgnAutwjr1zVLz52/obiI8btAHKwDRsRfBBOtyFjVcgb
         9Gb/7UhmVcqJzHPKMi4dDMQcFXdq3YdxDKs6onllndOFwFvOBEkImm+9lpKmENm6aUBx
         oLadTFdI4xix6ZnuebHk1Dsv/Nk14NOYqv/tK+SdR4Sr08qK/hQeEAd83Rksn27kphp9
         evxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RFjuwEgu1u/PkEzx1CxfykDmrkr5T6F+xBU9+QGMMm8=;
        b=EnC21GCw0D5nP5vZCFmGfjeD4WJJCD37+Q2A/v+hhNixH34zsJfCK3LrrpKv25z2xP
         U2y+mDbEU7IkltPeUmffPh05+l7jg36RL1zXfqqNtRLCVFTtwQYc1Xyu/A+Y3IIztkGj
         8hzPtfz7e0JfKnGMTBYZCbrjl3QwxDXjZUDnyc5traKEFkG/QGcebRGryvTgxm9d0k+1
         kYtzDzfCoK7x6J95kb2r2OEGHOtnANaxv4PXX7ecfZd18/QBCClmoiZUnz9nLffmhywn
         LpmlGoQG/NYe6iN+0GDRoZ0t58p9pXuuA1D83h6zlf2ggOCcXXbAlYKlKqGkOnNno0oI
         +1jg==
X-Gm-Message-State: AOAM533hrOrNqVKel3xADEI5O/+18Bsef70CbBxQ0Osb1kY1ILaOmaIQ
	l6jXRqu9lkud4MCqWjtKCeAASbx6Aw4=
X-Google-Smtp-Source: 
 ABdhPJwMjlSk5XkM4w+NLSjASQ673AP3nCH6s9H37ZoTmOWDlm2GviEmmuauuoaW3n/JjmtH1gevIw==
X-Received: by 2002:a05:6a00:c94:b0:4fa:e134:4e6f with SMTP id
 a20-20020a056a000c9400b004fae1344e6fmr8630432pfv.66.1648190007214;
        Thu, 24 Mar 2022 23:33:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 t2-20020a63a602000000b0038062a0bc6fsm4144813pge.67.2022.03.24.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 23:33:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to latest master
Date: Thu, 24 Mar 2022 23:33:24 -0700
Message-Id: <20220325063324.2961736-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 06:33:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163626

brings following fixes

* 6d8a5157 fix invalid free of duplocale object when malloc has been replaced
* 760f5d7e fix __WORDSIZE on x32 sys/user.h
* bdb54540 sys/ptrace.h: add PTRACE_GET_RSEQ_CONFIGURATION from linux v5.13
* aa3bab6c sys/prctl.h: add PR_PAC_{SET,GET}_ENABLED_KEYS from linux v5.13
* a8300f5d elf.h: add NT_ARM_PAC_ENABLED_KEYS from linux v5.13
* dda21f10 netinet/in.h: add INADDR_DUMMY from linux v5.13
* ee05b11b bits/syscall.h: add landlock syscalls from linux v5.13
* 1ee8109e netinet/tcp.h: add tcp_zerocopy_receive fields from linux v5.12
* bc89c311 netinet/tcp.h: add TCP_NLA_* values up to linux v5.12
* 9ffd1454 s390x: add ptrace requests from linux v5.12
* f7d3db5b bits/syscall.h: add mount_setattr from linux v5.12
* e99c4258 signal.h: add new sa_flags from linux v5.11
* 993cccce signal.h: add SYS_USER_DISPATCH si_code value from linux v5.11
* 3dcbd896 signal.h: add si_code values for SIGSYS
* 30c8a145 netinet/tcp.h: add tcp zerocopy related changes from linux v5.11
* b54f481f netinet/if_ether.h: add ETH_P_CFM from linux v5.11
* c5ecaca7 sys/socket.h: add new SO_ socket options from linux v5.11
* f35b99b3 sys/prctl.h: add PR_SET_SYSCALL_USER_DISPATCH from linux v5.11
* b21f3ded bits/syscall.h: add epoll_pwait2 from linux v5.11
* 3aba2150 nice: return EPERM instead of EACCES
* 74a28a8a protect stack canary from leak via read-as-string by zeroing second byte
* 7c0c7a75 math: avoid runtime conversions of floating-point constants

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 04752f40c45..d29097106fa 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "f8bdc3048216f41eaaf655524fa286cfb1184a70"
+SRCREV = "6d8a515796270eb6cec8a278cb353a078a10f09a"
 
 BASEVER = "1.2.2"
 
-- 
2.35.1


