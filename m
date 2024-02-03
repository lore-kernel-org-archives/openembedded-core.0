Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F824C48297
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 19:15:13 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.23481.1706987708520977048
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Feb 2024 11:15:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hmy5BfP5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-295af27ec73so2549648a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 11:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706987707; x=1707592507; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRdz/ZqoncNDXp39oej7Ggd3zf14jjjsDQ7+sOgU9OI=;
        b=hmy5BfP5NZvgTf3zHIrN/oDZUt79mfPzRlo0nqjN5GGUtHTS4GiH3DmRkmtviq/Ik2
         TBch7cJbvi3Zi8Z01BeUGLzc6kM5eoWjXH0FISm1pSVBpqR0hRLbJZLQhTLAYkLj/zuc
         sPpjy6zJu3cawuZwX5kneQpfJC5fIpJg9cDOsiuMh4Cn9ff6yJd/qyEejaIahTJDzcmn
         Epb12nPKJeSE0/EWEvCsjSJJZyQ/WizHxi3LEzN3AGBSF/u2Hx9tf6Qm1A3VoHHyt2Xh
         u/Vr1uxX0NI/WIdAXBjOXxsXsPj95uPI9/aGOTrjbM2Qc76WVCrWGzgdNgN0ZZy/+/QC
         C8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706987707; x=1707592507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRdz/ZqoncNDXp39oej7Ggd3zf14jjjsDQ7+sOgU9OI=;
        b=XxT2W8cE5GMDgkH32jeN0+NY12UT/9X4+bnduj0uLBhuXtyW4evDAI1qRvGVdfHHe3
         TYcKtgNL70gGIN+DMgRE+K3Q17TYSSsv/9qJvrDiFOcY2Ze3wKGfKXaxqqjO8QyUiH4g
         GsUjIopER8FnRRzh/a3giFR/6CRHurj0vydCMDV+DLejAn+HpX8yA4VFspfZ0L78HePZ
         9six/RoCTomsyzGaG4AaYWXoSoMF59QXyC3PQ9ajVb6gRdQ5JZe18m10JGeaZy75vmfy
         HRH0/3eCKOwaTHsv9Euw8FYCleAFg28I2J7HxFSEYCI5Nxxs09SdClaFiBckxW8EmOjC
         EvXQ==
X-Gm-Message-State: AOJu0Yz6Glu/hW67Wc0iUHKTNMnx8T05Emqt4qJUJwxOeMtdy3emgd28
	MOkC/M3YxizDhJT3jlATp2aAJQi0LDpdkXxRRAZ9V6IJzgzkZhpJCpWyDWBYnu2NhuWmH4Ngean
	4Tec=
X-Google-Smtp-Source: AGHT+IFD9WIJ1czmhnnkjJIHbyrAJP6Zqsaeesg2apZWwcl9fefKGrkFjX/kpFDN+wZGaU7ZbgF4Hg==
X-Received: by 2002:a05:6a20:e687:b0:19c:b3e8:d380 with SMTP id mz7-20020a056a20e68700b0019cb3e8d380mr4871683pzb.47.1706987707185;
        Sat, 03 Feb 2024 11:15:07 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w63-20020a17090a6bc500b00296443780d7sm2376863pjj.47.2024.02.03.11.15.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 11:15:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 10/15] elfutils: Update license information
Date: Sat,  3 Feb 2024 09:14:37 -1000
Message-Id: <d0e082b8303ad9591983c95d19a199c8d22942da.1706987549.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706987549.git.steve@sakoman.com>
References: <cover.1706987549.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 19:15:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194854

From: William Lyu <William.Lyu@windriver.com>

Update license information for overall package, package libraries, and
package utilities in the recipe to match the license information as
described on the upstream website [1]:

"License. The libraries and backends are dual GPLv2+/LGPLv3+. The
utilities are GPLv3+."

[1] https://sourceware.org/elfutils

Signed-off-by: William Lyu <William.Lyu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c0728805f24cbd6a788871ae54af4ec8307e40d4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../elfutils/elfutils_0.189.bb                | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.189.bb b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
index d8bf82b022..67494cd35a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.189.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.189.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 DESCRIPTION = "elfutils is a collection of utilities and libraries to read, create and modify ELF binary files, find and handle DWARF debug data, symbols, thread state and stacktraces for processes and core files on GNU/Linux."
 SECTION = "base"
-LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-3.0-or-later & GPL-3.0-or-later"
+LICENSE = "( GPL-2.0-or-later | LGPL-3.0-or-later ) & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://debuginfod/debuginfod-client.c;endline=28;md5=f0a7c3170776866ee94e8f9225a6ad79 \
                     "
@@ -106,19 +106,18 @@ EXTRA_OEMAKE:class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Package utilities separately
+# Package utilities and libraries are listed separately
 PACKAGES =+ "${PN}-binutils libelf libasm libdw libdebuginfod"
 
-# Shared libraries are licensed GPL-2.0-only or GPL-3.0-or-later, binaries
-# GPL-3.0-or-later. According to NEWS file:
-# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
-# programs. There is now also a formal CONTRIBUTING document describing how to
-# submit patches."
+# According to the upstream website https://sourceware.org/elfutils, the latest
+# license policy is as follows:
+# "License. The libraries and backends are dual GPLv2+/LGPLv3+. The utilities
+# are GPLv3+."
 LICENSE:${PN}-binutils = "GPL-3.0-or-later"
 LICENSE:${PN} = "GPL-3.0-or-later"
-LICENSE:libelf = "GPL-2.0-only | LGPL-3.0-or-later"
-LICENSE:libasm = "GPL-2.0-only | LGPL-3.0-or-later"
-LICENSE:libdw = "GPL-2.0-only | LGPL-3.0-or-later"
+LICENSE:libelf = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE:libasm = "GPL-2.0-or-later | LGPL-3.0-or-later"
+LICENSE:libdw = "GPL-2.0-or-later | LGPL-3.0-or-later"
 LICENSE:libdebuginfod = "GPL-2.0-or-later | LGPL-3.0-or-later"
 
 FILES:${PN}-binutils = "\
-- 
2.34.1


