Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E575C46467
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:26 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.70864.1669472181133551071
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Rutu/84M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id w79so6488470pfc.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KW+qEXhlx4bo1t5T0m025ca43OhWR4crejEKQvQphjM=;
        b=Rutu/84Ms7vzeQvaRKWWhAXqyp6Sdzf+PM6znZwAiBYUaeXryECPIu0HJuq/EA2jAS
         XLFyQ5bARcGocdDaLEBw2BssKq8isIBsVYDF5otfVFw1Pdpkju0y9IG7X6QE5rEHtqv2
         VrFBqa0azGDIwFtSx5PhH5SHfIkQReKN2hVF1wYX5pQ87ayyIYOVg4KqOKSp2HSWoBTV
         z1eVgsu7eh+MYSlXjDBNXmSEc61Gt07dFTBdE7Ii/OA179immrorXYtishgfTMVOBOnM
         piIQ6aakXEySlWBwS+99vP1nfXBJisFGhqZRx6b1fwLlpWWC37EBxjIb0/NzWcyedKbP
         WsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KW+qEXhlx4bo1t5T0m025ca43OhWR4crejEKQvQphjM=;
        b=Ow72dE1h9vk2rGhjhYQTuZqPPKc8dyrSeMD4ze2Jm4jUMqNDH0G4pkFNrdEN3iOH6w
         oqvcgxxxbtQKUsiB11jWy3X6GOaL2hUP19TD0VTLG99+9UHkt3b6j7fR4p+TdSUG4eyV
         JpOJuaEgAnEnf1CrZ9ff+E6er/U+onErsKTTOgokHCEpl7W9ensuwADT2xuNzvf7WTkt
         24IfymD4SC/vVx9GthEgpFPLpaHoxx9JJIW1l0m3UxdyY+ESHBDb1HXVho9oZ1kHVQ9N
         DWPMuR+0pDq1zmivhuqRmsVicoSNAVEU0cQjn+6MF8yqbXt7l7W6ftWJMmyhCMGpJDgP
         Y1Eg==
X-Gm-Message-State: ANoB5pklo2enr4AaMy6uywLlKQ4wk36Sd/PPnBigXcc5LnE2d/1MXRpD
	bDF+fsy2XTQvX3uZtcenvkd7ljwp4KaPLuwnIgo=
X-Google-Smtp-Source: AA0mqf5RGUhy37u1/1+RcMIl5SD+woU09oK1kAsu9vTYfZNPtsPjBo8tIxE5+lwAdEw6wHfx+4Uffw==
X-Received: by 2002:a62:648a:0:b0:572:76dd:3756 with SMTP id y132-20020a62648a000000b0057276dd3756mr24206599pfb.9.1669472180137;
        Sat, 26 Nov 2022 06:16:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 37/37] create-spdx: default share_src for shared sources
Date: Sat, 26 Nov 2022 04:14:41 -1000
Message-Id: <30cdb7fbec8e9cf5c5a25e28a1102fa562a7f6c2.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173830

From: Konrad Weihmann <kweihmann@witekio.com>

if a source is using work-shared but isn't a kernel,
like for instance llvm-source from meta-clang, share_src was
previously undefined leading to a crash of the python code.
Default to WORKDIR and just override it in case the source being
a kernel recipe.
Additionally changes the variable names in the following, as
they imply that it's only about the kernel, which is not the case
in every case

(From OE-Core rev: 34fa68a0b07328c4ed4eef81f8cde80137a91f18)

Signed-off-by: Konrad Weihmann <kweihmann@witekio.com>
On-behalf-of: Avnet Embedded <AvnetEmbedded@avnet.eu>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/create-spdx.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index af6afcc653..f0513af083 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -795,6 +795,7 @@ def spdx_get_src(d):
             bb.build.exec_func('do_unpack', d)
         # Copy source of kernel to spdx_workdir
         if is_work_shared_spdx(d):
+            share_src = d.getVar('WORKDIR')
             d.setVar('WORKDIR', spdx_workdir)
             d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
             src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
@@ -802,8 +803,8 @@ def spdx_get_src(d):
             if bb.data.inherits_class('kernel',d):
                 share_src = d.getVar('STAGING_KERNEL_DIR')
             cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
-            cmd_copy_kernel_result = os.popen(cmd_copy_share).read()
-            bb.note("cmd_copy_kernel_result = " + cmd_copy_kernel_result)
+            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
 
             git_path = src_dir + "/.git"
             if os.path.exists(git_path):
-- 
2.25.1


