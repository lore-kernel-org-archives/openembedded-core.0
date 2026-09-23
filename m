Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA5EC98302
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 04:30:17 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129.1790137809513093022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 21:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WvtedvPp;
 spf=pass (domain: mvista.com, ip: 74.125.229.12, mailfrom: hprajapati@mvista.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664c2da6so275637eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 21:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790137809; x=1790742609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PEzf9bqd5FdZPrHdRUABiGlFJZ/M07rzwKdWTtpRi/k=;
        b=WvtedvPpm79xNqLkEeVvqikThlLtSM5kPtw4JWZyWiLebYzZpkdpmS8cc4SD6b54/h
         38ZnpYHmcBUMiHaS8fN5s8Ovv93JpufNhYpTyi70YjdLqvjw1SW3bcJDwrm1DCc8h2C1
         Kw4Qhvh0WtJ2GQHOXqayKE7VVMxk9vJyBMT3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790137809; x=1790742609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PEzf9bqd5FdZPrHdRUABiGlFJZ/M07rzwKdWTtpRi/k=;
        b=lk0dGRHYOdHI5lgvfFK4JZ5rPqP2qJVEJYO62W07x0/CaNuAwvemU+ktRUB41LxWO/
         g5FsU2t4TEyB5vtAEglJB1oRffyKp1EB4laczZRH8uH5bvJJAZNTMq3oP4WMxmEsrwSj
         KRh4qf8OnhHF/G1HBUI+1Isg1CAjeln8yTiCPGD9dRJFQBitm9W30Rcz+1LUJJmBJig9
         NXlUqnbZ7KJoPJ7NhRZuEcunjDiqJ+RX6dnVxEJOcD5A9+xQE9TiMgtPEznmEnMEMb0g
         vdlG582J5mzD2Dih3CEOjGz6KXElo/tnje3LO7OwxLZJJivuJ66g7dnftyr8CHJLXfSG
         BHRA==
X-Gm-Message-State: AFuF++m56rUy1joSrEqbSVKFRfUHfOyiYzGzllnGUngg4d0NKd5kWuFZ
	hPsi8CSff6GcrekV/CjWPhkqI5ZBCgXxdl67Xj6gaPqLG3AQUcolvuOckRk9AtIQiWIibXlJlIy
	+9q2UBNI=
X-Gm-Gg: AYBFou1E7xHHv2rWTtKPrDHjtTNBcit65t0w6XZ3qpLHf5Sa9AJRS5eJVvL3Uo8vZhD
	kd7x01Z4HAFYOTIisOQZk77pgY+gB6bfuWIBz75Snt6kWOHaqNiTviND1z1jEqego1obI/Ots0x
	bdigCNvod5VP4PaCWRtcNhk0JBVRLAqlNp4WAY/vrMWpa8hxADsqkWhpyuNeWZ4iOXqGtuOptT7
	LD8ZrvfleU52ugZf670ePEju+7ZFwLNmgcVQs+SzoQCe1PJLk7WnNcX3qmk7QfLR7kcFBCaH070
	yPzaWUNdZt4sA6q7seubg7Wet1S2eh7mHzOGskXkgh+bYJCnxcTn2UGSqilqAz5gKgTL5kqw47z
	VQvMZW4GwgUVbbW6aiKy0//nl/85lLPaRdBcUn/gbasHU26jwDWK785Z77gTA4OzZVkROBP/NFe
	CIyxeKDNbEbW4YzvQJYb64Dir8NtM8JM8oCt7Z92W6fJ6g8MsKAeF7LCw27FznnPG8pMRDkfASp
	r6NSNJsSMosZ9W9a9hIaA==
X-Received: by 2002:a05:693c:66cd:10b0:33b:9540:89c6 with SMTP id 5a478bee46e88-33eb2bff7c3mr1021937eec.6.1790137808149;
        Tue, 22 Sep 2026 21:30:08 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.213])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96f47d52sm2960347eec.28.2026.09.22.21.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 21:30:07 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] vim: fix backport format for CVE-2026-73076
Date: Wed, 23 Sep 2026 10:00:00 +0530
Message-ID: <20260923043000.8731-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 04:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246434

updated Backport format as per CVE guidelines.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-support/vim/files/CVE-2026-73076.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/files/CVE-2026-73076.patch b/meta/recipes-support/vim/files/CVE-2026-73076.patch
index 92c9e10c4a..9ef6aec99a 100644
--- a/meta/recipes-support/vim/files/CVE-2026-73076.patch
+++ b/meta/recipes-support/vim/files/CVE-2026-73076.patch
@@ -15,7 +15,7 @@ https://github.com/vim/vim/security/advisories/GHSA-r22p-fhw4-84p2
 Signed-off-by: Christian Brabandt <cb@256bit.org>
 
 CVE: CVE-2026-73076
-Upstream-Status: Backport from https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452
+Upstream-Status: Backport [https://github.com/vim/vim/commit/581a2f3ac9c6f96a26324f6b2c8c11415fd0d452]
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
 ---
  runtime/autoload/vimball.vim | 58 ++++++++++++++++++++++--------------
-- 
2.50.1


