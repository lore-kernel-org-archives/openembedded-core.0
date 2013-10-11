Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8A50E6CC7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 13:37:55 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id cb5so1175454wib.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 06:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ikpvomH1xI68js+NZvnfsgiCHPjj7479zZYQRL2W/JA=;
	b=ZuASqDV/TcIAWWYOkFtxOfYVXNXr7lbm0AjH0H5sITq71g4YBjsroOQ3XHo4RktQx5
	xhPR9H4Q36Mn/6raQPiP5bNvuibkZj5CcgF/S6oo+Ce1t9VqB4dQ/hE415AiOjr3CsrZ
	7Nv0NFhHQuV4YsQgVcQMFTiZgduRPzGceooeu9F1YoRLoiAkKhiguRwTYosk24jnz7BZ
	dZ/ThzyTs5P7fJjmqZKAMl2t5aYXd9InU+KMpm78EohxkGdHs38t87FzOOu9bERc2tGt
	zR+UL+7RQ3tUBFYGNM0zow9Qc5hUy71/slpmUVazdYoO+XswgGHeT8MvHmPVphw1oTa4
	CyPw==
X-Gm-Message-State: ALoCoQl6qnswPlGdbeRf/G4HOtqStRZuHUPRISQLFNvKi6xOHFRZmhXC4Io3+u7oFAxhFTLoOKci
X-Received: by 10.194.123.227 with SMTP id md3mr17218229wjb.17.1381498676375; 
	Fri, 11 Oct 2013 06:37:56 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id ey4sm5790095wic.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 11 Oct 2013 06:37:54 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 15:37:44 +0200
Message-Id: <1381498665-21514-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
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
X-List-Received-Date: Fri, 11 Oct 2013 13:37:56 -0000

Without this PAM integration is broken after installing openssh-sshd

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/openssh/openssh_6.2p2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
index bb5c79e..4b44bf4 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
@@ -120,7 +120,7 @@ PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc $
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd"
-FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd"
+FILES_${PN}-sshd += "${sysconfdir}/ssh/moduli ${sysconfdir}/ssh/sshd_config ${sysconfdir}/ssh/sshd_config_readonly ${sysconfdir}/default/volatiles/99_sshd ${sysconfdir}/pam.d/sshd"
 FILES_${PN}-sftp = "${bindir}/sftp"
 FILES_${PN}-sftp-server = "${libexecdir}/sftp-server"
 FILES_${PN}-misc = "${bindir}/ssh* ${libexecdir}/ssh*"
-- 
1.8.3.1


