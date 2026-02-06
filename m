Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71858EE2091
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 12:19:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9950.1770380354465291467
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 04:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=juLixjCO;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso7230415e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 04:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380353; x=1770985153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcz57SYIm3N9yzU63zTOklKvx4o7ZR1QdURPbWINJk8=;
        b=juLixjCOVOEqj0smXsNYYPZle9IR67PFLx0TgRpIHwr90poyjPK9PEPHfZQoPVAyYM
         Z3QlkkWGtlQgS4PvfdXbi11NMvYla7UPhN2yC1h84f7gNPFrNbPZMJsXgUNJTov7b40j
         qSanWAYUzkqF6e6fFxalU8qkOhr7pB7CB5EF1L1zswD6NWnfY0c5zRSxoVrfDwWbupQH
         HXN7wOsQE7jtC6kA3zlVSbketuMUlDLmaq/0y1PNHFBoh5uBaVw+zd677L6MDCpwx/HD
         zZX0Sp5TWoOeM7z8Rjo3fVZN3jQHIJBM3vofqKMO8PWTSXlEMh+YlRUP4h+9Sq7JupCK
         uSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380353; x=1770985153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcz57SYIm3N9yzU63zTOklKvx4o7ZR1QdURPbWINJk8=;
        b=if+JcE+oAiwVCz6+CtPwKBEtRdb+DqRlqeL7PnuCXt9Nks6fBRHGsZiXnBEqSmgVHp
         DUaNU3xok2eNl6vhHSF1c+JnT0VJLhSxYWYbVtXgaxUZChwNz76vTl/BOYOXnTgC4bi+
         BW8niAy1H7UcMo0+Aa8xBuyvy382nzmRkaulsMYq1ij5Z0ieOvZZgWLWozGw6q4AEEOH
         AfIuKLBCceQ0x+fkgnDOGFKeSlDviMsoffzfQpuni89xcreeQQ1ilzpqvrlNYXBIBl/J
         YRkc9vI6l5JviI0DLEEeWE9yFQprHJRJ0qP9IadE+jn4M5KJcrrnB5Zrx0aR+s+LOl+W
         tx3A==
X-Gm-Message-State: AOJu0YzPIvxydTV2sG69PiPm6wks5dTkRqsR8aYcFqoGUPWM8Fuogv3X
	bF3BXXtIwo5TfPM/xVRYm5SV19zvcdsZxcwntxRyRHH2Q68K21Rdj6yrrB+4AQ==
X-Gm-Gg: AZuq6aLk6T0/BZ7Z8FxR2nrmnK6/0KoXIK0OB67sz5V/+LYNLX9JZrxqa7Hd1TR8ip0
	hjkboa81xEyW6LTEruVyvSfeElbOD8v3vZ3zKd/c/n+n7lPgsh+e5exoLnsrfALd27SWQfGJaJA
	0xB5rMcvIVMnStIgJkClXoZuBLeNGaLr204I0taj+B5PE8LYzDWHu+thvSYx9WxVEQDZp1UM7Rv
	CDG9ILC1pDzu1A4mgUUyt1/51+iIWNfcomHNoaGbL25oo1aflvTGu1OHq8In9MVvyJuWuOlopjn
	GVYboEjED6mbmH8PCnp5QVW59tUHpY3UHvsySMDGb4qdre07RMiLemGUWs4lN4ixDhW/gNIZsBp
	E4H4B1YCqBtyj0pBJOUh+5D5uWdCeQHTz37fQmXKQu1aS2ag7z4i3BOa0S+7/2qJRr4a7MMoi9U
	/8Cu0W64ZXp6cCuDkFAQCKIg==
X-Received: by 2002:a05:600c:a416:b0:477:58af:a91d with SMTP id 5b1f17b1804b1-483255d164emr18684465e9.5.1770380352658;
        Fri, 06 Feb 2026 04:19:12 -0800 (PST)
Received: from acert-swift3.. ([95.90.195.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48320638ff7sm53719565e9.0.2026.02.06.04.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:19:12 -0800 (PST)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.32
Date: Fri,  6 Feb 2026 13:18:53 +0100
Message-ID: <20260206121855.1895055-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 12:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230615

Update to the 4.0.32 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 2c9f3f25c6..c105dfe462 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.31'
-DEFAULT_INSTALLER_VERSION = '4.0.31'
+DEFAULT_RELEASE = 'yocto-4.0.32'
+DEFAULT_INSTALLER_VERSION = '4.0.32'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.43.0


