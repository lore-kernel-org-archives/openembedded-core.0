Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D96ACDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 05:22:54 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.275684.1697606568530313257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 22:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVgeS8I1;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40838915cecso5959755e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 22:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697606566; x=1698211366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pe5YgXZNlfF+HwrfZwbPTHnU5uhkQVLvG4fI+xUSIUA=;
        b=iVgeS8I1OS3qH23mDpqTkUOmwkns0eCd6eLguEmp7ZYegxRy54jrfO2KIN3MoxihUP
         +4itV41z+D0Zv8jYWul/VaGoTrDeHc3DHmpR2gJzU3lgPDdfLnZdQzW2qna1OwEj8Dzb
         CSPYi8b/W7gOhhlVhNFxVVLSsEPlRWl0cBB+1nYqCAUbcXxYPCuup4AYI+MZKrRNMXhE
         9aCBbCZyTSSn5tC6x53stypeFvRVDyHTsNptDrQBGI+Wwr6sN/2im+UuYl2QBXM4X7aF
         3l1BeRkP2SoiYZ3uPRdWcfEFLAdqYDhqQy2XtA0LhDtjGvuGTTWi8Aa8JThXQ430d13I
         DHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697606566; x=1698211366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pe5YgXZNlfF+HwrfZwbPTHnU5uhkQVLvG4fI+xUSIUA=;
        b=klaMFpxVbrW6SGBP/j9K4cuKZllOIXaFBmLEAiy/hfjZluB0eYjQE+bDCCcI40W99o
         1KUhqxQLlJmcYhgnuU3DWlnO6+F6HaqYf9QgprW4mAqjvNoZTL8lPkeuLBgtfCBgYHeh
         0GCt7zFz+AJF0evG8w5xrmVvlfvhaaPH/2+h9CV4ZjUNsJI9Tjrd9j1wZsK//D0msH/H
         BbCzAaYzVAzucq/xV351G8MyTEVIYQYyYUbejji08Abra2GoHvUHsEP8rqUXKAyTNv7a
         RBlPq1FTVmpdTRBZkTVEeNncrMrp47pRpAgM8aJnozgLUfHdEu14Cj+UbV/AXxTPkv6g
         N6sA==
X-Gm-Message-State: AOJu0YwiWkwGISVAQZileExaH59UX0cPZ8RZUmfxjEjBhmgXN4GvmkzX
	AEpngugMzIsVn09YhuiYRmG8oZbJaV9C3Q==
X-Google-Smtp-Source: AGHT+IEOq/5qIrYfzbE4G527wMNp268HoMtRTcwfpY9yMn05eldXgMOoIzguqCdlm+XyTiysoofY2w==
X-Received: by 2002:a05:6000:43:b0:32d:570b:c0a4 with SMTP id k3-20020a056000004300b0032d570bc0a4mr3555255wrx.27.1697606565961;
        Tue, 17 Oct 2023 22:22:45 -0700 (PDT)
Received: from localhost.localdomain (91-161-217-16.subs.proxad.net. [91.161.217.16])
        by smtp.gmail.com with ESMTPSA id u11-20020a5d514b000000b0032db4825495sm1226528wrt.22.2023.10.17.22.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 22:22:45 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v2][OE-core] SECURITY.md: add file
Date: Wed, 18 Oct 2023 07:22:41 +0200
Message-Id: <20231018052241.5566-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 05:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189367

Add a SECURITY.md file with hints for security researchers and other
parties who might report potential security vulnerabilities.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 SECURITY.md | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 0000000000..1b63da4f69
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,22 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it using the
+[https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Security Security Bugzilla]
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to security AT yoctoproject DOT org, including as many details as
+possible: the layer or software module affected, the recipe and its version,
+and any example code, if available.
+
+Branches maintained with security fixes
+---------------------------------------
+
+See [https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS Stable release and LTS]
+for detailed info regarding the policies and maintenance of Stable branches.
+
+The [https://wiki.yoctoproject.org/wiki/Releases Release page] contains a list of all
+releases of the Yocto Project. Versions in grey are no longer actively maintained with
+security patches, but well-tested patches may still be accepted for them for
+significant issues.
-- 
2.39.2


