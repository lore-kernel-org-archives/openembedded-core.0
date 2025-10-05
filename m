Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E22CAC5BB
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 20:05:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.17771.1759694722381860905
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 13:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WZwx4FPb;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e29d65728so23813685e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 13:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759694721; x=1760299521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RU+lHY4n5qsrB3mzJVVvge4QRsjyeOHjx0AfxIRFu0=;
        b=WZwx4FPbi9Yk7NxcCAlagS1g8lrYbeODMbO/x/BP2u6nEsn9I/Qc808mmKn2UU0xcK
         SJ4E5qAFOVGFueHzo6JbBJP7hOhzeZgM4Fq5QJl24p9OWcQJ9dYc4oINV9Y4lYFSKJ26
         TRKLKQQE3ulxG+Pl7mITpguWLwd80Le8rU9l4VNlf8VoSzAZIz9J5U+4jfmbPsLV0Nbs
         ajCE97mxMcey1+trz4dVfS0Eslm33FMNsRJmbvW6xuIEo349NG5/HYytRKjEhALDyGvf
         Ll09H4iadw+bpfO59nztwb5HxYOHQ05cMqq3PxebnnuWJ7djjnC+KDtJyhwJCqLTpvuM
         zvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759694721; x=1760299521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RU+lHY4n5qsrB3mzJVVvge4QRsjyeOHjx0AfxIRFu0=;
        b=iWj1vcut1ewYNENid3/IGCBHalK2OqqljGIFLqnc6l4+hU5hl3KXEFk7DgsyWqszOS
         GJ0niwtmBmC0hWqBYWQlMRA8Ti5qheIadR6cKCLM3HAVPrwcSGZl24x75br+GEQjCSwt
         oAhF768FCotmfXjucHvPBjn3x8xvJCrdGWf90WElYLji4L1J0TvC3YqJkzyhyTbZ+d+m
         vaI0VP4jLWD5AtegzHN1cXIrcqGus9UbIEk2PUNKdUVImLR7q/4CpfKO3mjcQtV93r11
         vHS5SKgLGHfMeQMCPS358Wplyp0ebZyg7sEJ10Iz7Iouth1rHRUikdBBOJDa8NLmCWqO
         /Mjw==
X-Gm-Message-State: AOJu0Yxgx+4vlZFlXXVlDe6U+Putz7vq90RXq9RP3URHk7CytzGhWb23
	Ihys6VVhhXDRCs64kY31efLEUqi1R/LBSr1sVimeVZMDG4Zq+gVsmjeZYSp4a31d2Ts=
X-Gm-Gg: ASbGnctZYG9unKpg9TZrwqB5o8XRxwBOHl6MhJ/yfE6GTxVq2VTxcAmpb8YfaqFK/B2
	bLLfFCKZfDm/l1xLlV7eO9PQeuWrZgF/I9AonsWiFStE5Ms1x0rb+eWD64vesM5rGIN4GJgifQY
	3lyF2qDSl9VpS5kX+ISTGPbtwTShfHkhTqB/o6ppTKApGrJVkoK7Mqvi8k251aV5osZOhiiMHdQ
	F5GuSoewFpmgHumlZ3GxJ6ChulJKFTRYARH1XA+yyVpyR18ilEjizqWK1EEJ55iocpKVAbpgypD
	mqTVLNOLWhzODTHs9OZzR6Dir1+tWYlXyJ0TH4dZVHeL7bas1sxPdzsw1VxyMHyrx5sNA8k8BSX
	0xrXDF0fFksz3JZOuCOtoSMJV+KRxrOw94Y7Qa1y8CGpLIzKxJU/nzGo=
X-Google-Smtp-Source: AGHT+IFs1z8suBZYHR3ko1uDW1BwOrZFyrm7NRs98tmJj4B63KIdZ6vXs23ltGyKHUudY+ImrAnH7g==
X-Received: by 2002:a05:600c:8b41:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-46e71111cb2mr74267905e9.6.1759694720525;
        Sun, 05 Oct 2025 13:05:20 -0700 (PDT)
Received: from acert-swift3.. ([194.126.177.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab8fdsm17487090f8f.15.2025.10.05.13.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 13:05:20 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.30
Date: Sun,  5 Oct 2025 22:05:14 +0200
Message-ID: <20251005200517.32697-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 20:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224442

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.30 release of the 4.0 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 3c86a087e8..5c990b1f8e 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.28'
-DEFAULT_INSTALLER_VERSION = '4.0.28'
+DEFAULT_RELEASE = 'yocto-4.0.30'
+DEFAULT_INSTALLER_VERSION = '4.0.30'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


