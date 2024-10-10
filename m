Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCE0CFC5F2
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 18:44:42 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.51927.1728585872718049360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 11:44:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2tGXlc52;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e0cd1f3b6so1024126b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 11:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1728585872; x=1729190672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Uc7H5PHcT9IgEvOA12n8AnyxteSXCUM4MAAIATE/7M=;
        b=2tGXlc526TUZYZNZ8fY/ARtCHlumMhYKPrxjViJoGNN0MdoMDHkhJinmy1t+ohHOmQ
         YPO2nTZlk0CqxBlptALZyQBgOv7IyzPZvAswxuFfsvCYgJOCD+HiZpYMKy1hTT0Qv074
         ebjCCaTfo446HJFn23JSi57ZeZgilPzp7BGJMY+TbFaNpoTDv7lcZriyFWgz5XoRA4PW
         /r6cK7bbZZ0MgAUxNncliscA+CDhgaV9V5U8scbxNoCrCji16t9/ESr84jKlycmcuDPQ
         5xiczQX9nlh+uRMn7OitSiJyti/su+V2kwtac+Z8O3tl6HiRJn3FsI7yTeNlJtH68Ekb
         Td3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728585872; x=1729190672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uc7H5PHcT9IgEvOA12n8AnyxteSXCUM4MAAIATE/7M=;
        b=ARVkQ7kn+tkkfI44+094m3hS5LWkB+93T92Frxc7FIFXeiPHMiujmdESwjoFWZ8kAi
         VzgafYhJaJv7QC4bZRr/5kcLleYvsXWjOQJ9dOQj9g9hgrn7T3uIBy6yVRdV6H9LQzQX
         pNaxdrubg5ND7OaUqCrssFv0bN+IIHIDTOv8uETBXBtUQyMX0qScpDnNZW+nNCnv81tt
         XMifxH3BGUUn5OSfuM1jldgKsJK40QWXA0Nq6JQkV66jckAb3dPXN6i2E/3IjAE0BLRS
         cZN4hyvIs7FSM5pYJsnoZ0Rrp+DRvTjBrtS68x8yo3AZE/GD9f6PyzH4QovcuU4q6cZH
         I+4g==
X-Gm-Message-State: AOJu0YwyiiuZuRRydszYeIg1227IfAcn+rLqgxcbhBrJm5OGWgQCXvBX
	webRWTEf0JYBIANWDpHmeqdhFmngggzoDHzqk6yPMUdI90uJhiKgCVtlRugk7+s8TTWOHh+3O22
	E
X-Google-Smtp-Source: AGHT+IENAAo3N5L+7nJDj2BAqUgcMMi0xu5nJlUPffbzeCIuQusZnKZyM+LTK+OB+6lMElxVL5RKjw==
X-Received: by 2002:a05:6a20:b598:b0:1d8:ad79:e094 with SMTP id adf61e73a8af0-1d8ad79f38bmr7327238637.24.1728585871807;
        Thu, 10 Oct 2024 11:44:31 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2aa9390dsm1331454b3a.129.2024.10.10.11.44.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 11:44:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/2] selftest/runtime_test/virgl: Disable for all fedora
Date: Thu, 10 Oct 2024 11:44:21 -0700
Message-Id: <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728585736.git.steve@sakoman.com>
References: <cover.1728585736.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 18:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205425

We can't support vgem on RHEL derived distros so disable this test for
all fedora hosts rather than specific versions.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 7dcdfd0ab2..93c6da1889 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -258,7 +258,7 @@ class TestImage(OESelftestTestCase):
 
         distro = oe.lsb.distro_identifier()
         if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
-            distro.startswith('almalinux') or distro.startswith('rocky')):
+            distro.startswith('almalinux') or distro.startswith('fedora') or distro.startswith('rocky')):
             self.skipTest('virgl headless cannot be tested with %s' %(distro))
 
         render_hint = """If /dev/dri/renderD* is absent due to lack of suitable GPU, 'modprobe vgem' will create one suitable for mesa llvmpipe software renderer."""
-- 
2.34.1


