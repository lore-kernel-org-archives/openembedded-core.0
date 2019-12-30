Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id B6A2B7D258
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 20:36:54 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m8so33797441edi.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 12:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+09iYB3Rap8cXHWrq+gxvZNvHmjbxqvD9Q9qkxFvADw=;
	b=hOGUDMnSnD94CfjodSaPCEYfzRa/+Gbj1gLx/+S2EcdWtgCD87ukTZHjUacyvDRO3a
	vnbDocYY0w4EpoC/KW61XVO8TuEH4p1qIJOonaNVwq5yfkPjJD7zUfV1z8ql5kLLl0hY
	VrHteDkbQTL0QmsiNOc/2pX602GTXiifGgrBOcxnmwDGlADam/7jRu5VhYkekw1B9Rgd
	VS/MCVq4m9717WtP4+6Psi+WSY1C3tWAZfZVrAiBWoxojf30acbzySNkisAWMG5bpTOD
	kU5gV/TkU6E7FOoZphRKiMDcDz2O6WjVcdC/TCPyLtgnF5u4nqPojk6u0uUGWLKArxjm
	7f4A==
X-Gm-Message-State: APjAAAW2M6y6BzAXsncGdg7towD5wij7RrAH1//oEfS5beKOJsExeMV+
	PAioBux/RvEiYgXQi4OD20CYls/r7D8=
X-Google-Smtp-Source: APXvYqxugSXoV62fWSj3lJx+yPHEQdVG6osw1L1o6pQ7qIavXzQr3PWHniJ/XaKlJX3bEPBEZvWgeA==
X-Received: by 2002:a17:906:6a48:: with SMTP id
	n8mr48200518ejs.196.1577738215300; 
	Mon, 30 Dec 2019 12:36:55 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([79.97.20.138])
	by smtp.gmail.com with ESMTPSA id
	s22sm2898818ejm.43.2019.12.30.12.36.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 30 Dec 2019 12:36:54 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2019 20:36:55 +0000
Message-Id: <20191230203655.291233-1-git@andred.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] systemd: fix ${PN}-journal-remote systemd unit
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
X-List-Received-Date: Mon, 30 Dec 2019 20:36:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit d31ff84a5f47 ("systemd: fix PN-container package splitting"),
d0b2cedfb099 in poky, created a new package for the remote journal,
but introduced a typo during declaration of the systemd unit part
of that package.

Fix it.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-core/systemd/systemd_243.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_243.2.bb b/meta/recipes-core/systemd/systemd_243.2.bb
index ac7a5f86b3..12c5eabab8 100644
--- a/meta/recipes-core/systemd/systemd_243.2.bb
+++ b/meta/recipes-core/systemd/systemd_243.2.bb
@@ -408,7 +408,7 @@ FILES_${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
                               ${systemd_system_unitdir}/systemd-journal-remote.service \
                               ${systemd_system_unitdir}/systemd-journal-remote.socket \
                              "
-SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
+SYSTEMD_SERVICE_${PN}-journal-remote = "systemd-journal-remote.socket"
 
 
 FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
-- 
2.24.1


