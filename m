Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1A8745C1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:43 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i194-v6so4928085pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4G0FxhK4ny4S4DNqksOQvurfb9LCXySfOv2S4y1e6Sk=;
	b=lvA0/Tazj0DpSO4qFkKe2u9F6CzPYGAHCEI1FYZ69f3an5Mg1G0H6ryd27/f0622lc
	3xHqTqBZ1JysY9g1AJS+oXfClw+UKzmS56IzIfx2RDKExYDG0nGIXx54XFbMMJNpPSM/
	oafu/aElvD8kK2c0H2gM2dG+WIHvRmDjU6XDWQcz+5fWyGKXly66fOpCuNimP6IuCeKZ
	RX/z7zlCjuxr0KYbpxbX37n2LhbYX59zolxBYunvCEFK14d2L/p8CLYF2IeX5TlQBTze
	3Vp6fTrC64O+RZjj5t7uv1NsTiHOIlojM66snqhoCUr3UWUZDjI7qk7xy8n7sKoZjDcX
	S8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4G0FxhK4ny4S4DNqksOQvurfb9LCXySfOv2S4y1e6Sk=;
	b=tmucn29LX4fECGmYYzPYlw1mmKiPF2DkIFrA97PUIGz6deBLTJ+QEWjHzw8xziikJv
	WDH3eafmu5SrH7PZsRlAARS6hRSG/ra0e0WjGrq/yNnT20bZOcRw3QKV2k2SDVa0TuIM
	O9IMKGgSFIabX8NCnSbNwie0Gr8jBC9FzElEk0pOnmCD/Yexjq5rBi5WwWpz1j9t1H2Q
	h8wNTHVHbLLoFaQJjrIBhLjm2H9BVqfWQJg60ovPHnAbCyeR8+VMjfXQmri/+zl4j6Bc
	pwWjH35TWIC0x9kkJEEjJaoCodtNkSidpAjPblJseTJ78aDc5C73oc1D/o4nKWIllpLA
	rQ9Q==
X-Gm-Message-State: ALQs6tAVKxQjN9Qg2k9AKw0wUgh0jQB4KJJb0Y+nuLeQfl9BbGH2CFQ1
	SFbCmKW0fZ4fkn2njwu6uS4a+A==
X-Google-Smtp-Source: AB8JxZph9Aec7lzufiXRlD4DMduGQXAQR4oS/Cb50MBV8NobqLU5pwcHkivWo8YMVEAqdSwc6FeEJA==
X-Received: by 2002:a63:458:: with SMTP id 85-v6mr8289511pge.156.1525030604366;
	Sun, 29 Apr 2018 12:36:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:10 -0700
Message-Id: <98928704cb26b5646fc39c18c0f007504caa52cf.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 23/24] ppp: Install net/ppp_defs.h on musl
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:43 -0000

This header is used by other apps e.g. ippool
glibc provides an internal version which it should not

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
index a5f764f6ec..a1bb7d71c1 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.7.bb
@@ -80,6 +80,10 @@ do_install_append () {
 	chmod u+s ${D}${sbindir}/pppd
 }
 
+do_install_append_libc-musl () {
+	install -Dm 0644 ${S}/include/net/ppp_defs.h ${D}${includedir}/net/ppp_defs.h
+}
+
 CONFFILES_${PN} = "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/chap-secrets ${sysconfdir}/ppp/options"
 PACKAGES =+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-minconn ${PN}-password ${PN}-l2tp ${PN}-tools"
 FILES_${PN}        = "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindir}/pppd ${systemd_unitdir}/system/ppp@.service"
-- 
2.17.0


