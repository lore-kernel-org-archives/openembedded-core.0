Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 34BB77E417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 10:39:06 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 7so5241679wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 03:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5+JpE4Gs1GxKI5kmKQm2jcNwmVU7bEQK1t9HXhWVZjo=;
	b=mC+Ot+/TfQ98hvfsStTwTxGDJG7ZNqTPKqKBhLevOvx9SyB8xK0o4Cx86sb1UyB3jI
	94hhLY2N9YPjB2kn/7K/hdjgbBgewZgKoCVFY2PasRB3OHf4lPo6fypxrwhttWSjfXLe
	Op1f9hSoTqqBWiagTlAisucb6LeF8mu//BqtZ3W19WdLlPDWwEIvthPBZwtcNcCJXpiy
	ZE8+ixpcr7pSmeOId9qUXPC+rt9jMxABxvNmqPLlhZv8zt84AAXtp9p/ouBIZDzdzfBA
	schldRl7VIwvA3XRnkJI8ZP5TBcJ6o8GGBdejnhsaU4/GDRXaA9zMCJUa30h/yKlVc0D
	6taQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5+JpE4Gs1GxKI5kmKQm2jcNwmVU7bEQK1t9HXhWVZjo=;
	b=a6VF3Vs8q2rBgUO3gjw7RfVYujZcwVva6+Lm1/8U3r3gvyNKUREiLSPlgjvjdT10ze
	R/YOZqRFLvnxhm8GgaWvDIZ38GD+l45R9FMhazXfKOKNtKaMJrZYTjB5wsG6YN+kkeVJ
	OK6RwX5UivGhwEtIqESIKgtuDB4dx9eSPAT8gklZ5Gsb64lF6HBPuJcOvSvLU++YZU+c
	VC3cyy5aiaisU57TsqkwIS8Rv6KHo5cRmZHc1qYSmNwKZCCKZVPouY/YCX2Hcvc7eNN2
	g4uJvWCzxWgiCJohG5ZKsqD3W2JvxZMcTlggmgZHmObsBvbNQkyfjp/JuHrKRizzNr+/
	zVHQ==
X-Gm-Message-State: APjAAAWAadk9n/F5xXnn/IjPNWCfu5xTprIwybXM2gZ2Bp81l1FEYAJM
	wKAwewPgwYDE/xZFUNiF633qJQj0YsU=
X-Google-Smtp-Source: APXvYqxUaVAQk5aeWGLqJkB+bAvhKvNaIcvQHF6PoKR3LDhL4k4a8sS/lcN/zO5RR4TSunwQSkxyZA==
X-Received: by 2002:a1c:cf4c:: with SMTP id f73mr10617485wmg.118.1558607946655;
	Thu, 23 May 2019 03:39:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q9sm9398289wmq.9.2019.05.23.03.39.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 03:39:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 12:39:00 +0200
Message-Id: <20190523103900.93969-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] chkconfig: fix upstream version check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2019 10:39:06 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
index 788a37b6ed0..d21dd697042 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/fedora-sysv/chkconfig.git \
           "
 
 SRCREV = "3e0b3909ff6328d232b27b9c32f1a9309c6cd0a4"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


