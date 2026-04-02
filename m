Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B360CD6AAE6
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 15:39:46 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18706.1775144385812337383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 08:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=n9hkyDAd;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b941762394aso135970266b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144384; x=1775749184; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/C8KhMLcbrVh84zLrMFVuqYLFLIl2wV6BhWrNjANAE=;
        b=n9hkyDAd3u+mZOG835XS1XKZyz4U1bapPeITwWI2yRa0Ilbx+yvUKcViaXELmHTWPg
         d59hOP2YtWdJWPyhORXzaRH7gBiHs7H4U9EQfEn26zpR8C/OdOfvvDl+t8I8nf4DQxDF
         O8b9mj1eU2V7lljkpnF+NYZmEa4phvQt9d7J9oOB1rduWmAZ56bUATapGelDyHHM5Ngr
         g0FU8qdcobBSfFSJ9o1twGEXIOVa4WgEhlWIp8kxjYYShVNv8fHXvxv5cDpCSrxWs8pF
         8DfBNOiW4qJJj4LtWW1zOO0GmjoY7jqjkllF1HXZe/AtqV7nq532GBgZlO4R61JP/CY+
         sj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144384; x=1775749184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D/C8KhMLcbrVh84zLrMFVuqYLFLIl2wV6BhWrNjANAE=;
        b=QKHuBmoOgm8e4aumwIemG4otPcd/CEPLMNrwz6pbFMrjq68H+me4ucu5iprZNemEa/
         RuSrNTFuM1puofI4qe5/oNDlY/RoiJXsBmJHcENHqOcFJg0fLKkeNBAxQGcirEv8iXaT
         c5pTbD1dq/2NjezT9qyj/1mXCbitSMLwBG0TqOxGGBlpPnGX45J39ZQSB0f73qwqjYEq
         m1q2JXTdEx2A/9q4B7QTjWn9DNohEXdaP9Mfmo3vAobuGIkgo8vBxg+f7lPdCYQCPmkk
         dG7ScVq9u7Osr4x9mClPCMceiUpxQ7xA23j8b88P77M+QlPeSe6ZzWPwBvUQUnpM8D5/
         c7qQ==
X-Gm-Message-State: AOJu0YxoBFJAIuwo9wpaUuUmcR6Vwj8JSNxRKPXdFmHPwxlqsOQRw+7O
	QZHlNzY5eJNRjMZhnP2srX8OrXty+VPveBZIEBZjUMVNyCVy5MLvvu7/
X-Gm-Gg: ATEYQzzcklrzullFJOtaF96RK6rqPSDCg16l7viRzeD8Ah34ua8xHAqEhIrmrA1BhLa
	B4hoaFn3By8JnWKrUxx9AU0yjyVYjxJCnRVdQ2vM+uC9Z9tNiRCnZVzL3b1zi+hUeWD0Url4NTp
	TiG7xZtLblcpcdvETGxSbHsneYJtiW2K3ZKVYTvGYnIIywHt8ArdcbYOKVFznSfc4kn8BkaX2Ss
	dulrG6dRsgFUjHSx+qIHrca450UzDwIQv1gm9N+8amtnj05nHYPHnkr+JFqq3K0GEiZ7o0HYEs0
	y3Nr5DaBoXbPQIvMBZaHSZcTim9bSMFk5KGf+k02zksk08WtGPGnLIKao08XNrfYBtDYh/ytPEU
	bI/F7ePLqz3s2cA0JbAbV4a35ZGTAhXJzdY5jqMlh91Xnjcgy5HTcoVHor46EH2gGMwiiZoaNl8
	Cc7Ov63uRyVb+FrIy2hYg63BCD15OyBA==
X-Received: by 2002:a17:907:3c88:b0:b96:e593:fd1e with SMTP id a640c23a62f3a-b9c3ea20d0amr196482766b.0.1775144383988;
        Thu, 02 Apr 2026 08:39:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:fb7f:9298:379f:1206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm101831066b.47.2026.04.02.08.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:39:43 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 17:39:40 +0200
Subject: [PATCH v2 4/4] package: update the comment block explaining
 'emit_pkgdata'
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v2-4-259169372299@gmail.com>
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144377; l=896;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=4ESzs/DGgXjRBfU4HBATSUDwgxjwI1WroFqBWPzxMjI=;
 b=JpjCsw5mQOizf1TSy8H1j/mS3xh4bXvRA6yCJabwENDvtzq4rMToZXySGdFywah4gMz3WN929
 XihiFDTCYT4DtODrUNI9go/xTGvXqlw6JpIJ/wiEK5dtB8bgGHfG/5m
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234543

The comment block mentioned PKGDATA_DIR which is now used
differently.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/package.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index bd32a6ede5..fc3c539f68 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -41,7 +41,7 @@
 #
 # k) package_depchains - Adds automatic dependencies to -dbg and -dev packages
 #
-# l) emit_pkgdata - saves the packaging data into PKGDATA_DIR for use in later
+# l) emit_pkgdata - saves the packaging data into PKGDESTWORK for use in later
 #    packaging steps
 
 inherit packagedata
@@ -610,4 +610,3 @@ python do_packagedata_setscene () {
     sstate_setscene(d)
 }
 addtask do_packagedata_setscene
-

-- 
2.43.0


