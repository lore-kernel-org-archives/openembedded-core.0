Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6998B7E32C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:13 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 20so8460349pgr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PIhgxR0uVuQBUmaDIYmQN3c9yXXdDltYxgnC83MZcIE=;
	b=YNVaY5SosjHPIACe4bTsFam7nXDH1a/Sgakm7zo1S4z3TrUm8bb+KlhdSiS/GJlOdS
	JnojNlSujGvaB6ldfiSjLKP+vIWjoM9nkIQ8LlVvU0yUfFxGH1PfcjJamtYBzyPG27+g
	T+dkQLp/1+KAOZG/Q7skA416mfI23fg+TVtLqzYw4SJ7NYLD6qBHHBIUvsbeoFdEdt2y
	kqy7pghnqfiAqmQIseLfqnO0QOk95/V6Lr1OCIIGb7CA0qYnZgkha6a+lCqEVB8Vca4U
	qB5O+DplJMmotdBx4x+/hfBkYvq2ln+b8XKBpMGXZapTdvhNeMjGt687oWZOluiutcDy
	tmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PIhgxR0uVuQBUmaDIYmQN3c9yXXdDltYxgnC83MZcIE=;
	b=UmZBNME14t0qFo+Xn9IdNjc4LXGb6PydH3pTFsyThTh2GBZGjwmkVQ1rcRkB+G+ooi
	xffelrz4HNJ2Z1DugDmbZAw1LrdqyqgbJhFgsAjsvsShTCilcDRSRbcPHBPfiod8Z7dK
	zmDTpH1hthFpbh1NTT7wfkEFAOE6S7bwsXllqEKRUBLF9kvcxlx5S5TpQY6VLXVoxnzu
	t3RwB7zK03IGdeb9zDEJWHca3uBLJn2yrFq5xq4vnli04y9OhNTlH2KpJ57tRc1k2Yio
	iDHJrUtV/IFA9kHPMPIw3dZSAnBns4vj685HA48zSm6Kzv2eOF0CiERylnTlka3Q/x52
	Bj2A==
X-Gm-Message-State: APjAAAVRq38dEp3iBB99GQN8Kpmw0/4+l487yhibS5nks24+IZ1BOQaG
	aL3wXMSy5xhoHpBYCB+SMsMvoQAW
X-Google-Smtp-Source: APXvYqyLqMDU3fdR1qIhA0q1BvQThIawLAFrl2k2Y0VEcpDGjo7oH0NZmFT1WntD1oVsk1UaFrBY7w==
X-Received: by 2002:a62:2cc2:: with SMTP id
	s185mr31252907pfs.106.1559574434455; 
	Mon, 03 Jun 2019 08:07:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:06:49 -0700
Message-Id: <5d70ab1ba3570ff24d5d118805ed0d9bafad022d.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 06/21] openssh: Avoid PROVIDES warning from rng-tools dependency
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:13 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Avoid the warning:

WARNING: Nothing RPROVIDES 'nativesdk-rng-tools' (but virtual:nativesdk:/home/pokybuild/yocto-worker/build-appliance/build/meta/recipes-connectivity/openssh/openssh_7.9p1.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index 976bcc5..3b4ed72 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -148,7 +148,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RRECOMMENDS_${PN}-sshd += "rng-tools"
+RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
 
 RPROVIDES_${PN}-ssh = "ssh"
-- 
2.7.4


