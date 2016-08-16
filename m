Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 701CD758DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:46:26 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i5so15712765wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qVzzUloUnL1a844ZHQDFxoBBI0iTCsERgYEq5nTbCZ0=;
	b=T4PSwR7jNQhCPD9o3ft+uNdWKQc4Vlp8qqo8PiwYtc8hBurMbzLUOIU2E6lVy58pLK
	efyl951cRiDKcF9Ch0yhcydgmsFJHFuruR/Ly/wUGgLXcao4QdTq29rfCE1OqFq4xmA7
	egljlPE0u0YZQ0E7E2NeQY4+A465lhyses+NHEiUFHqN8cmLCamBEXgXQ+ijmnOJwGv8
	8nJOBvfwO3rSZRi5Ql2i1xXxwN3uSq/aLpkgTaGeTOaJPAG7HLSUpJfDoUXe53SwX/zP
	Mn3kiWKLPnXJ69An4GsYm7gD0ovrUXFnQJ2SlO5RqzRdXjnM4QcLG29rzN7Iiy9+PwYe
	sJDQ==
X-Gm-Message-State: AEkoouvCdwbu4YlF0IjaCbPJU8RrNbLQxvHlUdpxZz4jKHIL1p7LU26egfGFvAj2P4Jz2Q==
X-Received: by 10.194.164.229 with SMTP id yt5mr36443995wjb.39.1471344387106; 
	Tue, 16 Aug 2016 03:46:27 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	q139sm21122383wmb.18.2016.08.16.03.46.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Aug 2016 03:46:26 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 11:46:46 +0100
Message-Id: <1471344406-30599-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] openssh: add ed25519 host key location to read-only sshd config
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
X-List-Received-Date: Tue, 16 Aug 2016 10:46:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's simply been missing.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-connectivity/openssh/openssh_7.2p2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
index 21eefab..3df825b 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
@@ -115,6 +115,7 @@ do_install_append () {
 	echo "HostKey /var/run/ssh/ssh_host_rsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_dsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 	echo "HostKey /var/run/ssh/ssh_host_ecdsa_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
+	echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysconfdir}/ssh/sshd_config_readonly
 
 	install -d ${D}${systemd_unitdir}/system
 	install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
-- 
2.8.1


