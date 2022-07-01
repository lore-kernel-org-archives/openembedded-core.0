Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB3BC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:52:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.37084.1656676376863186271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WLRzs0in;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id k7so2831872wrc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q7WTuOWBmuhVwWcBC0Xez5JpGM3T01FBn/NPGl0lufE=;
        b=WLRzs0inwA/vQjYM5CXCkmHS12VjEzzYE4q2WNEg3auaQ7SezmYF12d42JphzvZXei
         XhdYNauVPoUoFhyD408pyAdoRhtddQo9AUSjL19n9VCL5Pv5CxwUiv1R1zOYxcf5c7f6
         t2CvXQgRhjcrr6gKR+T9EDW6wEITnUgRPFN90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q7WTuOWBmuhVwWcBC0Xez5JpGM3T01FBn/NPGl0lufE=;
        b=eAlBtf25oZe3HjobGCoCuAY1BZacjAx/TKl+H2+v2Z//+NXF5d6dSoN9j2wYrNEw1L
         GxRC2BAqj2WQqAItuoKHx55bQ49zBV6ZAsCLpFwZ/TywoHQUgHNw3YVpttAEPkZWLGGH
         A0kbiW1P3ML3w6JWUxhjUmiKBVDYrSjIjC0oZDp7/x8uLyxojCMpEzCrOfvtLk6rb9H9
         FwTPYWD86VkHRcrQ8xUSyMcvNsh/Aro0jsQ6kUuwcR8r3kYye9exRHzkBZI2dfXFkqJl
         wY6ipa6p07GDjAw+UMUI031T4doCCV+bp0A1PJFShPFlfDS+vhJuSBYmhvb5llIX73t6
         Jiog==
X-Gm-Message-State: AJIora/ay9rvTa6rarQ9dSfhzMkG5LupiW9io0IpC47gWC3DQj7xsorv
	nuqd7+XL6s4JlxCQAXxWNRXVLf3/ugkByA==
X-Google-Smtp-Source: 
 AGRyM1uWnuusyoXHyFX0qDZBRsN2yioia7ZmGJ7C7gRhcBapTY7Uce3Wi/ZGK2Udl+oqjuIAJPsnug==
X-Received: by 2002:a5d:59a7:0:b0:21b:cd67:52d9 with SMTP id
 p7-20020a5d59a7000000b0021bcd6752d9mr13807311wrr.194.1656676374580;
        Fri, 01 Jul 2022 04:52:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b003a0502c620dsm6239295wmq.44.2022.07.01.04.52.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:52:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] insane: Reword staging to refer to populate_sysroot
Date: Fri,  1 Jul 2022 12:52:53 +0100
Message-Id: <20220701115253.770729-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:52:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167465

'staging' is a term lost in time. This code now operates on the sysroots,
adjust the naming and messages to be more correct/appropriate.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/insane.bbclass | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index e6b0f081e61..fc7bb431e09 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1149,13 +1149,14 @@ python do_package_qa_setscene () {
 }
 addtask do_package_qa_setscene
 
-python do_qa_staging() {
-    bb.note("QA checking staging")
+python do_qa_sysroot() {
+    bb.note("QA checking do_populate_sysroot")
     sysroot_destdir = d.expand('${SYSROOT_DESTDIR}')
     for sysroot_dir in d.expand('${SYSROOT_DIRS}').split():
         qa_check_staged(sysroot_destdir + sysroot_dir, d)
-    oe.qa.exit_with_message_if_errors("QA staging was broken by the package built above", d)
+    oe.qa.exit_with_message_if_errors("do_populate_sysroot for this recipe installed files with QA issues", d)
 }
+do_populate_sysroot[postfuncs] += "do_qa_sysroot"
 
 python do_qa_patch() {
     import subprocess
@@ -1347,10 +1348,6 @@ python do_qa_unpack() {
     unpack_check_src_uri(d.getVar('PN'), d)
 }
 
-# The Staging Func, to check all staging
-#addtask qa_staging after do_populate_sysroot before do_build
-do_populate_sysroot[postfuncs] += "do_qa_staging "
-
 # Check for patch fuzz
 do_patch[postfuncs] += "do_qa_patch "
 
-- 
2.34.1


