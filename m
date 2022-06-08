Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A54CCA47E
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.7246.1654699247881747221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gZDWVOJM;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso18523049pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DIZGZX+OKKwfDjfs9n7LK8xC/UYzaI2JdmgQAQ1Qc4o=;
        b=gZDWVOJM3wpfXRDH2ham1ML4TSfi1l4SQ0ojgqqAYrIuzXykGmiW+nUXJgT2+d4SOv
         HPrLU5av4Uo4bNgIHRg62EPamqdwlpYI5BZAI/eysennAOPPw9VGap/OyM9PfdfhoQBU
         v/DRRZvDaeusJqezKZ42RwAeEvEPEmwepBQLT3CguKyBqVbZ7Zwnpaqe9bosCGpLaALe
         fnIv789yRZttgnr+gdaJ7m1effJgjiJADtlIuDRc0Kr6urGIj/YecafFSdcEEBc6/9vF
         7FOVC6fR7qZkITLZf/90RyDV0ClCLc1ZH1OnW2lmvzudfFizabn/RgsAMgySvAl6mLfu
         n9YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DIZGZX+OKKwfDjfs9n7LK8xC/UYzaI2JdmgQAQ1Qc4o=;
        b=FgkDBCjk5+sgVu+s1rfSPLAgxIFKW+xOQrff9m/AZBoI6sBsGApy+nLE7zn4BtKAWE
         qFT1urIyi1ZIy0uddEmV9VT0b5ltBa8OWu+rkXHQFMNXntRMvjYuyNBoIRPS/ePT+WPM
         v0tNlyjIn60WWCgUFs2I9Fb+CH47+urg+M9IJ/3jsNadOjHSTZToTUu+ZwOl4jHYff9D
         UqK0EahxBF6Onb7quZWL+9q/deMdkf8RtEEiI7GdCHb37OEeRNF5ivQkG4L6Ewre1VxA
         RwqZB5fEAoKKxvLfaHEk8osm+GXZ8p0eTVAyDHRbh8X3XJRaaRTknz/e82Ln905MHX4+
         /PTQ==
X-Gm-Message-State: AOAM533bGHmltUMvXmbnUonQ2CEQOjcKSS+Rngz+TnyMxneWcDSrJhbE
	mox+Yx71PUrb4tpstiMGDq5vcUrs40Izo+/g
X-Google-Smtp-Source: 
 ABdhPJxamEeAbJhFi3A6AXNVrVHb3chjHzH+dwq2BlDfvdSWvMmT0PUaM76WkNvp1KM+X5JIJ+NxIg==
X-Received: by 2002:a17:90a:408f:b0:1e3:23a:2370 with SMTP id
 l15-20020a17090a408f00b001e3023a2370mr37606414pjg.84.1654699246816;
        Wed, 08 Jun 2022 07:40:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/22] license.bbclass: Bound beginline and
 endline in copy_license_files()
Date: Wed,  8 Jun 2022 04:39:34 -1000
Message-Id: 
 <3001199ca8da38208649e8016e77880690835706.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166732

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Ensure that begin_idx (i.e., beginline - 1) and end_idx (i.e.,
endline) are positive numbers in copy_license_files(). This makes sure
the same lines are copied as populate_lic_qa_checksum() uses when it
calculates the checksum. Before, beginline=0 would typically lead to
that no lines were copied at all.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab3cc3651d08d226675c461da760cda0bb6c0ce0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/license.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 0c637e966e..4ebfc4fb92 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -84,17 +84,17 @@ def copy_license_files(lic_files_paths, destdir):
                     os.link(src, dst)
                 except OSError as err:
                     if err.errno == errno.EXDEV:
-                        # Copy license files if hard-link is not possible even if st_dev is the
+                        # Copy license files if hardlink is not possible even if st_dev is the
                         # same on source and destination (docker container with device-mapper?)
                         canlink = False
                     else:
                         raise
-                # Only chown if we did hardling, and, we're running under pseudo
+                # Only chown if we did hardlink and we're running under pseudo
                 if canlink and os.environ.get('PSEUDO_DISABLED') == '0':
                     os.chown(dst,0,0)
             if not canlink:
-                begin_idx = int(beginline)-1 if beginline is not None else None
-                end_idx = int(endline) if endline is not None else None
+                begin_idx = max(0, int(beginline) - 1) if beginline is not None else None
+                end_idx = max(0, int(endline)) if endline is not None else None
                 if begin_idx is None and end_idx is None:
                     shutil.copyfile(src, dst)
                 else:
-- 
2.25.1


