Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id DED4C7D6C5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 13:27:36 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id j20so2044210edq.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2019 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JWGPan9queNuEDPFhxI2FBXGLOtD6EodSqI7jkGEgq8=;
	b=deqSjfeSZBn85GdJvq8oVovtknlJlxpJHgLZQXYzZqJp2MyS9aRLamZJAdN0mWGjFJ
	vFE+2v6TRDsyEiBS3zM3LSxSyNtW1nPyi1Ce+t49Gl6VfF9iEI1+8U6+D2B9YatpsqX9
	dAlljkjLtcVLgZdqF2F9Wf4hzgI0VTecb4Kj7ILyuT8L2+cMnkFzxGb/7rb9leuUxw3y
	4Hvl11zG4JSnPTiHe0gJ9L/c6712ILV/VXnExNMxP3sQ+BUO0T4A0w8zi0bZ8assPbpy
	Fdi384thTcdErrXt1zisWB1t3addwtP1zvByRAnvRP/N1EogSYHIx6vhIY2awvdcK7hE
	opaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JWGPan9queNuEDPFhxI2FBXGLOtD6EodSqI7jkGEgq8=;
	b=SxsXpOpLKCBkYtFUf/sTZgmH46gZYV6PSPIAaR50fzpZg0rtPGK9sE9XnhRvGaCQpj
	YHFgvtE2OzR60ODLvdm1FN78PlQA28k6m9HRtRpiJ/JZTPHcLoOvvzkhk4g5TSL2KuaU
	vc7xGXWlyd73KmOXH+Bfw1VUU6GwQfcxpAjcWj/mKIFs5q/jqz6mEstGFX60AWbsm8Gh
	pxZG0rloF5DxIjomulL9Pf24UU2OYE7vSV95fIiNYyxW5+61Yx1k0U55MRcDIqxhKt+Z
	yRmb78Y2dUrHuACRxaoXIQtvYNhE6qGD2epeh73UxjDg4rFuSMVXoEBcfZQZL58ZYMa4
	1wiw==
X-Gm-Message-State: APjAAAUipVOmalMI8MzLis4GT1mOB2S2sGWg9UMj1p4ltXR2J/JAv4X+
	ApGYDZVLVcp0ZR4EX10jCsSNDI8zrcs=
X-Google-Smtp-Source: APXvYqzxPt3NBczS4eSV55rDgaYvLNq6QGJqeEPAzEO1QKlRnhUYeRS2Mr8f0z8QtXTexZUDuXJFVw==
X-Received: by 2002:a50:a704:: with SMTP id h4mr41799899edc.7.1555248457316;
	Sun, 14 Apr 2019 06:27:37 -0700 (PDT)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	h15sm6333696ejc.78.2019.04.14.06.27.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 14 Apr 2019 06:27:36 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2019 15:24:12 +0200
Message-Id: <20190414132414.18547-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] systemd: remove 2 obsolete useradds
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
X-List-Received-Date: Sun, 14 Apr 2019 13:27:37 -0000
Content-Transfer-Encoding: 8bit

- Users systemd-journal-remote and systemd-journal-upload are not used by
  systemd anymore. Systemd creates dynamic users for services without
  persistent data.
- Fix start of journal-remote

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-core/systemd/systemd_241.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 3a58f44a3b..8e493d5b55 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -334,9 +334,7 @@ SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt', '${PN}-binfm
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN} ${PN}-extra-utils \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-gateway', '', d)} \
                     ${@bb.utils.contains('PACKAGECONFIG', 'microhttpd', '${PN}-journal-remote', '', d)} \
-                    ${@bb.utils.contains('PACKAGECONFIG', 'journal-upload', '${PN}-journal-upload', '', d)} \
 "
 GROUPADD_PARAM_${PN} = "-r systemd-journal"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
@@ -345,9 +343,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--syste
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'timesyncd', '--system -d / -M --shell /bin/nologin systemd-timesync;', '', d)}"
 USERADD_PARAM_${PN}-extra-utils = "--system -d / -M --shell /bin/nologin systemd-bus-proxy"
-USERADD_PARAM_${PN}-journal-gateway = "--system -d / -M --shell /bin/nologin systemd-journal-gateway"
 USERADD_PARAM_${PN}-journal-remote = "--system -d / -M --shell /bin/nologin systemd-journal-remote"
-USERADD_PARAM_${PN}-journal-upload = "--system -d / -M --shell /bin/nologin systemd-journal-upload"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
 
@@ -401,7 +397,7 @@ FILES_${PN}-journal-remote = "${rootlibexecdir}/systemd/systemd-journal-remote \
                               ${systemd_system_unitdir}/systemd-journal-remote.service \
                               ${systemd_system_unitdir}/systemd-journal-remote.socket \
                              "
-SYSTEMD_SERVICE_${PN}-remote = "systemd-journal-remote.socket"
+SYSTEMD_SERVICE_${PN}-journal-remote = "systemd-journal-remote.socket"
 
 
 FILES_${PN}-container = "${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.conf \
-- 
2.20.1


