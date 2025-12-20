Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF803E668B4
	for <webhook@archiver.kernel.org>; Sat, 20 Dec 2025 11:27:46 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36809.1766230060370935251
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Dec 2025 03:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L26r2BvQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso9450965e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 03:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766230059; x=1766834859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkZVIkh7sG66dmp1VRZw06kp+rraurxzPrysrpJ10v0=;
        b=L26r2BvQSguI1fVL5j2TbvTdoogxtCU52U4O9yTT13/+xfN5m3CYwA9h40EFrSlYOH
         ldJlBwkeX9xPO61zes6puY2ouYSey0wJtSB66nFzQ6PAI0HB38LGPOssOoGNLWHL4Fgk
         +HBwBjaeejqHNtp7J7xNRjZd0h+sb0qhxThSzUtDzsKXcu2GFVdI80zY21WqUqtJGpsz
         IEesxCsi6DNMoWY3p/5YfXsD+ikCC3hz43J2THkUwGyvjad5fab+SOJlKc8AYgdNB28B
         t/eexMeCNcOQd5pQOsfrOt7LuxrP3jagBO4QyvXM0sHNqHoc2c2puoHswW0cxzIeDWF0
         oFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766230059; x=1766834859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkZVIkh7sG66dmp1VRZw06kp+rraurxzPrysrpJ10v0=;
        b=uEa4GPHwuUqzG5c7uVtg/e5EeBF5QEblyetUH85F6hXKZkvWbJyYCxuAu7Ec/ah0sj
         mSt/B9gd+cSG8T7n3IjHuZFYBXRvm3GO6Bfx8NawZRLq5TEHJyB+Dn8zCnDilLBdl0Qk
         ReeSi5PbTLdZRKv1lkkyU+HiQHZu8kk+bsFiZyxzoD2wzbi3kuHWWSj1wTxND1EoQzIp
         8yg4KoXFe3Dsy0TKVVKO77zrGFyALVJ/ctvWwESZnX+SvCK1hBe77f3m4VCnrp6QRlEj
         432eqh5yxp8/v0juqJyZz/o6nvFBs6M9DGb8NfktwROm3k03Lx1X/HvLysNc4mVLl8rG
         ZbZA==
X-Gm-Message-State: AOJu0Yw6G5vtKruIStHjfnWoXHAA8EjdngPK24d/kZX/RjVbCfCKBFdj
	kOKTAMPWhPRbbdDYotoZ7XH+QTisz1HFG9YyX7mRrfWXwXFtksfvGvcDtt0BSQ==
X-Gm-Gg: AY/fxX6zITYRDzdnGte0dqb3+m/YbsQ0B6viMPBKIl16B1iPWwIoo47C7WeUMC0vWOg
	pcOG9b5inASRagURdVjBsZ5emFsqwzt5q7gVsfxwu3KUvepstq46stM8DsdsYEljX1XVwjeObin
	9b0wAl3Yu9ezKVib/6ZXTA5ETREVR/lk1Jp68HmAs32u/20V1lEjUyFjuEyi4p8FmpENesOyXJD
	bMifJN2+S3YiqQVjN4AluZl8NUO+bpiBKE/UoFbc4XfwG8/w2NioBr+T9uydFOtStW3QuLyAKL0
	dXi0N5IiLVvk+Kxxzs88dQQeKiliBiBun0VwpDWwiYtGHgVLj6KqeDAY3Xvgga6YyxoQs3UmyT8
	iDEEN1P8U5oOo1wRxCEOzqBdMFYHAWjEstw0cqRvyrulSMglExaxoqkjapuIVZs05/KCWsZq4Nj
	Kkjf8euJ08
X-Google-Smtp-Source: AGHT+IHRQK12FpVZNHl74ephIuKBbl+KxWQ22gbmvWuXpCMK0DNdqxq6e/t9LodJNr9Mv2A6LgWUQA==
X-Received: by 2002:a05:600c:45c8:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d195558bemr54173535e9.11.1766230058494;
        Sat, 20 Dec 2025 03:27:38 -0800 (PST)
Received: from acert-swift3.. ([2a02:810d:624:a00:6a5d:8d5f:b7ce:4240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa64cesm10182272f8f.35.2025.12.20.03.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 03:27:38 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.31
Date: Sat, 20 Dec 2025 12:27:33 +0100
Message-ID: <20251220112735.9373-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Dec 2025 11:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228248

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.31 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5c990b1f8e..2c9f3f25c6 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.30'
-DEFAULT_INSTALLER_VERSION = '4.0.30'
+DEFAULT_RELEASE = 'yocto-4.0.31'
+DEFAULT_INSTALLER_VERSION = '4.0.31'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


