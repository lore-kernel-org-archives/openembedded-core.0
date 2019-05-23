Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 267287C446
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:29:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 15so5577869wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qkSz99cOzmESW5cOnOsRj2ICs4FEK3DUpZ/P848dkUQ=;
	b=eZuRKLX/NU4xEoXCaOh/7WlgZFWptdzVYmeM+Ud/Z6jUtg3/ohuZNnjE/4HAC6xHZU
	aHIRRXNCKLr4aQEOJGVp2BNv7LVd/uxbWrXw/RplAGN/7Do8hasJG1TDXdZXDR6sTByA
	szMAXTm20ZFsVQygv4n1u0uPhkUFDydhQJK4ENTGfC4IVxM4wWrQHvOjYEHaV6GDSWdq
	TS0C2XamVa7KcQX1EtYi7Qm7tpGYPsaUFb3Ykl/m0bZlnAPbbEtZYWJgKfucpLfib+1q
	jC12d+DWosKwdHWRDsE3GTehdBeZxK1j8J+o8Cv0NzCLlAI5M0/4R0WIHl9HTUehLsVN
	rArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qkSz99cOzmESW5cOnOsRj2ICs4FEK3DUpZ/P848dkUQ=;
	b=Kj5sEmT9f9XY6Prd8YLSizCz68fHsNXAfvSnkg2ywgcQkE4n9vekAYSjBIsRV/LY6M
	TW6hNWXr6oc2Uo6DuPrV454rCvZp+iPaW7a/iGLlaSuc4Hk5PpohHGv34QYdqvkqRS0B
	IinzSI13n6YUlkXRUHa2XSgZrt4s0gtQEMGvE4hQic1xy3tIrOED6gmjAXblxcsIj1HJ
	4O2JNcaF9o46MLb2H3s9ibTQ+/oHwOPCpfkLpzIxCJkkL/ZWihCsc5/QM/8m9tKPYXi/
	TtIYGB8i47gdkbm3AfFcVSnGgFNyjNnTOX4hLBxrqM4jjyKPo7f+C+1eqbqX8ggWZ2WY
	RByg==
X-Gm-Message-State: APjAAAWXZp20esKX9PJOyKiV9cjj/FIp/GAoGmrzRZBEqxOHiGrxyCUN
	u7KpB1UXLbtflQmnoFE6GgD/CWPO
X-Google-Smtp-Source: APXvYqxVOGwj75cLkc9QzOplBP7QokL4JgGvsqm6eC7D4cCUgtqgsq+XPj7WfASIZ70Jnhlq9HHaGw==
X-Received: by 2002:a1c:dc46:: with SMTP id t67mr12093273wmg.140.1558614596652;
	Thu, 23 May 2019 05:29:56 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	p17sm11282112wrq.95.2019.05.23.05.29.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 05:29:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2019 14:29:41 +0200
Message-Id: <20190523122941.21058-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] package_manager: add help packages based on languages selected in IMAGE_LINGUAS
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
X-List-Received-Date: Thu, 23 May 2019 12:29:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is the one-line mentioned in [1].

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199769.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/lib/oe/package_manager.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2835c1ddf8..bd2432f6d3 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -566,6 +566,7 @@ class PackageManager(object, metaclass=ABCMeta):
 
             for lang in split_linguas:
                 globs += " *-locale-%s" % lang
+                globs += " *-help-%s" % lang
 
         if globs is None:
             return
-- 
2.20.1


