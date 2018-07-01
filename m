Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD9C74592
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Jul 2018 10:33:38 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id t6-v6so395067wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Jul 2018 03:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CGFNRWnYTly4gXviAxr22E0/OtR4igNo72cpfiU3KT0=;
	b=pIf84v/g7ehRqSM4pgUB4lwEcXiLRXotayXjD/zgk84kTV80Bq4a9BS7KW/+8sEuym
	ekRrf68TWJymwkZNfw0JpXQ+udyVgfICTo5t/bsBF9h4HuYMiolcEbEedeuZ6ObT6BaF
	2cK4Rme8tRcpEINGF5a5ywzB+X4066+boNVWn37SnJR0VzDIAD3IkGwhIcW0K35iRf8w
	mnDOrYBIPCAQKyV/O0AfvGG9klTjP5zGTsJ2XADk2+drZLeBZ6p7AkWRvOj2nDlW+kxG
	YvIt0yxLMxQHWS7FAXN0hmp1ky+TDgEhGj+n68xa31URhzGRoolfOcKs7a4lp4Gp5gfC
	lQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CGFNRWnYTly4gXviAxr22E0/OtR4igNo72cpfiU3KT0=;
	b=CejWnhmvm3S6fVtT+lN/Alf5bG1uGRCgTJ57amgq3nBJC2lJZ8GJMA/M4N2ZVFoCcz
	F4Osc2w/fc/phw6D1HAuWLp9SwKP5zNQjB+U1CBl+09ojWYJR0gvJSzslhKc6FVn48p7
	WrlDa16YDTeU6eKb1C14brnLsug65IAXChEMZPCLln+Sdq8Eww5tjYduMPiwzENQv65p
	VJyVqBm5A0HcYforkmFQYrq8EXivDGp65oZZDR57b7GR3bTOrjO1cV2MmwKyotpxWCWN
	AaP4u+C+09mobMFR0C/nIOl8oENP51j+rl2doohDWuRl7z/YlCEesFCzZuWIQqVopRp+
	qepA==
X-Gm-Message-State: APt69E0QDOOSdUq4zexASzYC1n3TvDgsMl9p2XRHgxLzQaYboc6yb+PG
	1D3lbgRwPlSUtzF7BysSGsW1RhCN
X-Google-Smtp-Source: AAOMgpc2Hkj7jPlvN37gxIlVUoWl58r2V/z4Er59BPalmELNgzfcI2iHOFGGJZM7lzAC9HEHDk4ZTw==
X-Received: by 2002:adf:e491:: with SMTP id
	i17-v6mr1817825wrm.145.1530441219068; 
	Sun, 01 Jul 2018 03:33:39 -0700 (PDT)
Received: from localhost.localdomain ([213.205.242.44])
	by smtp.gmail.com with ESMTPSA id
	130-v6sm14337312wmr.1.2018.07.01.03.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Jul 2018 03:33:38 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Jul 2018 10:33:31 +0000
Message-Id: <1530441211-30826-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openssh: Add dependency on ssh for sftp
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
X-List-Received-Date: Sun, 01 Jul 2018 10:33:40 -0000

Add missing dependency on the ssh binary for the sftp client to avoid
failure at runtime if it's not been installed through another dependency
chain.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index b3da5f6..d147f43 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -146,6 +146,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
+RDEPENDS_${PN}-sftp += "${PN}-ssh"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
 
 RPROVIDES_${PN}-ssh = "ssh"
-- 
2.7.4


