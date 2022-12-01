Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A45FC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:27:42 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.44911.1669904859497233040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:27:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4To2EZSl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so2207899pjo.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgtvNF5TLEDD0P9mY5dDIwD9dGtLxvUfPYQpnfBKqxM=;
        b=4To2EZSl+YkeHRJNF/CHHHtvNTBPDV5Bzy4ZPsAuzybrotSuZnmQEL8PhhhXffhHXZ
         HGe4/XGESB7wcBv1NWLG8bhpWi7EGgcxSWHAaY06oxxoK+r77RFg6htbSwrVA4IKiQE3
         ldzGfn5VrGrb2SNKHRQju1wbxKBFahrrR3w9sK1AncF292QNRlr7mI7avdyjqK1XFvK0
         7+Vc4FSqRtNYFcd0rEVoUpFMpzGMKa5lqeLHKX5H78pvAbFqPce+FzuXN9VzL7yKlA4X
         8WglfunWutSmJOoGQIMPOzvuDbPVv3HfPaiXolEyLLiGmWBaQU6XtQILfLUzRNW+ouj8
         gVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgtvNF5TLEDD0P9mY5dDIwD9dGtLxvUfPYQpnfBKqxM=;
        b=Aol7Q1RQPs4grsm0dArPoO2mwAN7QHeBpjkQ0qVdCBexA3VZEaIp2/AlMs+lJBNmgr
         5uSC0khm1JIneUkrslSzL90hB8rJuuipN93i65c44D9Uy4Y6eDRRvcaheFz4hmZLBx91
         /cjtC84xjQvDHMYeOzAK6BTvCdjkPDjjhgf6yV6BKPdDPmDQdNoTy3+NCDav9DpaOuhd
         c6GDfKKZuCYQHf/J0bc7A03gPk1IdKEuxKfmzLnAM+zkCKni1mS/3ioqUlbTuUKv+ham
         MV+IOCLe2zRhfqtT8lNuPHaUBBUulgASiWZQiD0Xi1SawTaQYpJBsRK+mNVzHSiS7IKP
         /iHQ==
X-Gm-Message-State: ANoB5pkKy3DksfBv9NtaQ91Vgd836nGtPKmaPKZrm16B5TtbCrzP2ub3
	VbZZ5yCv6eBTyscZUEiLJ9qSJzVf2AnE9hlcFms=
X-Google-Smtp-Source: AA0mqf4EU59vex/7QJHSDYcmor38nPp2CO6hyRhXivVYDbft3IDabcx4pqEkbZ2mpcfexoajyEPHgQ==
X-Received: by 2002:a17:902:dac2:b0:188:f5c7:4d23 with SMTP id q2-20020a170902dac200b00188f5c74d23mr49076639plx.125.1669904858352;
        Thu, 01 Dec 2022 06:27:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.27.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:27:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/23] tiff: add CVE tag to b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
Date: Thu,  1 Dec 2022 04:26:59 -1000
Message-Id: <97ad71541996023075950337e8b133c1a8551e0f.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174091

From: Martin Jansa <martin.jansa@gmail.com>

* according to https://bugzilla.redhat.com/show_bug.cgi?id=2118863
  this commit should be the fix for CVE-2022-2868

* resolves false-possitive entry in:
  https://lists.yoctoproject.org/g/yocto-security/message/705

  CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch      | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
index 272dd3d713..83d5db7fc6 100644
--- a/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch
@@ -5,11 +5,12 @@ Subject: [PATCH] Move the crop_width and crop_length computation after the
  sanity check to avoid warnings when built with
  -fsanitize=unsigned-integer-overflow.
 
-Upstream-Status: Backport
-[https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294]
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/b258ed69a485a9cfb299d9f060eb2a46c54e5903?merge_request_iid=294]
 
 Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
 
+CVE: CVE-2022-2868
+
 ---
  tools/tiffcrop.c | 5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)
-- 
2.25.1


