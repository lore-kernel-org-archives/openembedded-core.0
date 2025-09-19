Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BBCCA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 03:57:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.7851.1758254269316072328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 20:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSNkOSA6;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b54abd46747so1697061a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 20:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758254268; x=1758859068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeK5mVNEWZ8gE6BZOJ9ss6Ul6Klz+2sjyJG9IoHf0ps=;
        b=bSNkOSA6ko/nDG1C+pL4OFSs63Cdt47Flygg2yE2tH3V50LwkmfQGoHBOwQnk7mLjF
         F5wAvBIG+EGwJCSukLPb8D2Axmyjf0afEM4p4irSlHCl+0duakEkbvh9Z1ICqpgGYJ8I
         zchfyWJzkZnjOubGeHDwIs4J8Mn6IBY1QMG1AcfDAPqQvCSjMKml8tOb+0mw31HnnZnn
         nZJ5Mu0TdJ+ZBustRyKGxZKOPcgUEjzLYpWVHhK7ZqGfpW5uPjKD8TIuYVxt/VYVINWU
         nQNvD2YwbNtVgTo0EorRaywdwu8rT04HLQ9vp+3TJlqJtW9+AGjLRjwLR1tat3oN7W80
         O+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758254268; x=1758859068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FeK5mVNEWZ8gE6BZOJ9ss6Ul6Klz+2sjyJG9IoHf0ps=;
        b=Vm2yX+Oj3/HjU5p7CB/FwOIuM+hEX2kMnTCLyUKN9lxJWP5Fu0Iht0BV/nyLXCescs
         +UrrHN5IOAJ/638UPSm/VIFSZ5wredAC8nOXpki8GBdKZR8btOlybB4wDSlufUT0gpyG
         9amzOEIJtZ6rTvrmMdH9zpp3/eUm+RZiL5o0vKO+Gw/llw+q8EK51lMPORvx/cipaAdd
         ok/5c3AsbmGDOpXg1oOlaXm38begcIF8+suDNoXgWREdzCJUdGzwdPlEe95a3hMZP3bx
         Nz1wUD4qCl6Bz11/w0G8q/2e/5ZjSDVWEiHiAKWqNpcnpIHVfVyYq6QYCgVdu1XZ8Ne6
         /0lA==
X-Gm-Message-State: AOJu0Ywnk8ZQ2moA+lwT4muj1yAmWhOzbCJq/RKy0k4FR7Z5hkpbxFwC
	+KxfRNtMcKm13O8zd8lnfF1FF9GnzvWWCIpR0B7IpUrE5+XtBJMBq7ana7R3gQ==
X-Gm-Gg: ASbGncs61tf6NV8uBLb2v1yqa9jXMhZgs9wJafziSNagnI58+wvlSZAg5XS5ZgQe0Np
	XrY/tTXRH0PkY7+Wz2rZnBQKh1xez0qV4xoIe3qUZxx/LKCD9mB26m5WxZDjPd4eciQu7pTIzrb
	oG9t3IveShcoDB/2xbXAJ5NT62UGxjgctQJmZBB23gbImdPnVewWaE4uD29ocZ4r9o83s0GGOkW
	80MWsRcq9F7pBiiXXTUluQ+A1NmUf4jaXwpwzBGoBUU9Nj+BHqOCP1ZaggMhyavmI4gIuhRLffo
	0828scsw+IX3Ksoy0po/h/GiqLlaV1VpOtIWU6sUD/7RsQZA23RCTbalS3Ur4fnlmlJxh5gQVo7
	GzA==
X-Google-Smtp-Source: AGHT+IEJE8Pnu6pk09BDVS3rKajC6NnHQqy6WM7Jdr/XsigJ5mpOnGZNULwKOne3KxBGl5EVQ+ltNA==
X-Received: by 2002:a17:902:dad1:b0:25c:e2c:6678 with SMTP id d9443c01a7336-269ba402261mr35214975ad.5.1758254268433;
        Thu, 18 Sep 2025 20:57:48 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:7f9c:b789:de11:2858])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c098sm39693275ad.33.2025.09.18.20.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 20:57:48 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Philip Lorenz <philip.lorenz@bmw.de>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [scarthgap][PATCH 2/2] shared-mime-info: Handle USE_NLS
Date: Fri, 19 Sep 2025 09:27:35 +0530
Message-ID: <20250919035735.6586-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 03:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223721

From: Philip Lorenz <philip.lorenz@bmw.de>

Skip building of translations when NLS is disabled.

(From OE-Core rev: b58a3f4e9c78522423a94821b7ba7a35eb18f75a)

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 .../recipes-support/shared-mime-info/shared-mime-info_2.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
index b8a377e2b2..52daccc977 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb
@@ -17,7 +17,10 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
 
-EXTRA_OEMESON = "-Dupdate-mimedb=true"
+EXTRA_OEMESON = " \
+                 -Dupdate-mimedb=true \
+                 -Dbuild-translations=${@'false' if d.getVar('USE_NLS') == 'no' else 'true'} \
+                "
 
 FILES:${PN} += "${datadir}/mime"
 FILES:${PN}-dev += "${datadir}/pkgconfig/shared-mime-info.pc ${datadir}/gettext/its"
-- 
2.43.0


