Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bk0-f42.google.com (mail-bk0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 297CE6E7CF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 12:16:57 +0000 (UTC)
Received: by mail-bk0-f42.google.com with SMTP id 6so1844889bkj.29
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 04:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AmwAP3upqDqj0Il4Kyvrc3/lKeYR1m0EPvWV75GaHl0=;
	b=LiMPR91nuJh60QSfjJgB+Z9DRlmyKcBBO+WHdpPwkf68mIV5Lf5JwaGDLNxbBDQpn/
	ugZYy7MWuJuHW+vzyak376YnpfHBWmodZKuQQfPa3V9trqTDBIUH0pe4y+/xKuAEn+sH
	rn9Nqc0mqL3+fZ2rr5AnUilbmP3QoAi7COKh0mg6JUrMD45a7ycNYexzMo2ZgUdarbH+
	0oJ6TLGgCbPpGUyaKsBHZwOp9exdNyN0O1Z8ylKqcNg9wAfwGC9nyM5AV9cBixqy4jVC
	ost6cX2ZRPR/n5BpZ7FYvSIhpeWDmXdrywGZ+MQjHLa54sxJF8cI/i+1fSl6HHFVjYza
	8cLA==
X-Gm-Message-State: ALoCoQmzdkaFUEblNChBkzmCLHpWm9tV0eL73SZ1vwd5ppGl2eYYPUxMfg/jJeX/OrU9ADdWPf+Y
X-Received: by 10.204.201.74 with SMTP id ez10mr6678771bkb.83.1390652218224;
	Sat, 25 Jan 2014 04:16:58 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id np8sm6171071bkb.11.2014.01.25.04.16.56
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 25 Jan 2014 04:16:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Jan 2014 13:16:51 +0100
Message-Id: <1390652212-30440-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] openssh: package sshd PAM config inside openssh-sshd package
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
X-List-Received-Date: Sat, 25 Jan 2014 12:16:59 -0000

Without this PAM integration is broken after installing openssh-sshd

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index c61d16f..b124c8b 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -115,7 +115,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
-FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
1.7.10


