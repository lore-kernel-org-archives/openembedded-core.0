Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9305160C6F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:29:03 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id 6so26235768wre.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2TQY8kQveBSax5u4rXG4tJ/IRdTDoUuwQcNcIFYf2uE=;
	b=LRO3BPXqFjIWOkKycMrXjHyJi9TliCQX6SW7qsgz9/uSLvtr4NQ5NqUsWRUVfB5BZ9
	5ONHbln95pTjcRF2T2e6h/GInOYtfA588VEAFg8W/n98r7wAs9VMtPUZEmgrECID9An2
	YPvltxJh9oWW4FBPNO/ZDyi15V3mO+BpYi2JHJRZcDVjTsPeV6rUo6XUFFn/rUlsf4Xn
	dVAJdKNAFYSH/AkjPNQjLJvQVcoDeGvXRaCup3Euu4Ya6H7stHxyS0feTWBvUCZCiNLu
	tWBBWFPlPxnNr2xV50UB/88JlHpliw9J8whSxBDj5n5xaSjSUFM+Fso7IqlRxWJOis4Y
	wDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2TQY8kQveBSax5u4rXG4tJ/IRdTDoUuwQcNcIFYf2uE=;
	b=TA6hVUV5YZZ1MSn7J1HK8jYYFIRomqecLKrIdlnWzyhZZC0ZYk8VxfMbt90BjliiVe
	vDIJ2QQVwFi2aR4dTouTmGDs0ivH1FPTsBFna1RQIla/giHHYsmXHd/G8s7Ev+/XXnDW
	UUmhK4CVi4jgF8r0VrIi/4tBah+51m/MfMKw0/aWOBmyisGSPlTmP0ozvDLBk2Fp7cHS
	xnvgCql++zWL7mKq4fw9iFP619ZkLMcOwchcyRoJQu4dF3jwN0rMfuc/VahPUzfCr+5v
	DWvKEkIGnpGRR/Xa1Kx9KCqu5gLUx45mB9a4J7e7r8Z/SM7SFfHzsAxf0uiLo6s2fJrP
	A4jw==
X-Gm-Message-State: ANhLgQ3tx8ErzsydjmkePG7mxlOZof4MU9wuUJa14WaychtU3cjbWQV7
	imqM2HTCYbiqyuMN8tsSJhSvTozh
X-Google-Smtp-Source: ADFU+vtl+Hq/YuILNiKqFbJQWEFtcxwLKFz222E4nuZfZaKtvf030QDq/0H4Q6+sCgY3U0WqC3vonA==
X-Received: by 2002:adf:b35e:: with SMTP id k30mr6544563wrd.362.1584458943863; 
	Tue, 17 Mar 2020 08:29:03 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.29.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:29:03 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:23:03 +0000
Message-Id: <20200317152303.4600-12-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 11/11] systemd: Enable acl based on DISTRO_FEATURES
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
X-List-Received-Date: Tue, 17 Mar 2020 15:29:04 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_245.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_245.bb b/meta/recipes-core/systemd/systemd_245.bb
index 72021a0991ae..09ea07833d71 100644
--- a/meta/recipes-core/systemd/systemd_245.bb
+++ b/meta/recipes-core/systemd/systemd_245.bb
@@ -57,10 +57,9 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'audit efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit efi ldconfig pam selinux smack sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-    acl \
     backlight \
     binfmt \
     gshadow \
-- 
2.17.1


