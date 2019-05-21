Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFD67E2B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:28:38 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d18so59277wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bdWLAmIYycnBPiR5Z20ZQWgPwBNT9dSZ7OztU69DkWA=;
	b=IFoJi0WNQ/x63D9XumKqzQPDr/733MkY/4zRJUPGarW8r97x2cp+4V3QqopvinKddY
	F/BYQCmNOkWOFPwi6IBoj57OUE9pNjXxIqn7qNG8fye/xsjHdDEHn4pNbe9DBx/4OKZo
	Sx/jyMDB6OSkKFmWiLTlEul9Mhyjx9U8m8HO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bdWLAmIYycnBPiR5Z20ZQWgPwBNT9dSZ7OztU69DkWA=;
	b=m18LzybmcmwU0jfqY+s4tMnx2dTxLihIaYcfWST2m+7EtoiMO2QCle/N7xPswxtaPh
	941JCXy5MR5CnLSUrk68aLbR+ri1Z93+N7yd8EhPUf8wXUusfgCo0ru/vSjYPDEQhzDi
	nzB91IrZoLX0ihfPHHRbP0cMj4FmGHw5I+fbzH33UnwlqNqCJxmHMOqkSEdN69+6bJYr
	g0sBl5UklW19kvus1/h58tBVVo1E5Z2RxvcGziX4LY3xe7SP7N386MROcRa0Mxt0ogl5
	kjT+iAhkDymgHi1MtFj2eZmJnQYq8zlh5AjKenTatZcc72oyfWC6l45J4e/1Hk0wdbxj
	IA1Q==
X-Gm-Message-State: APjAAAV1dE6cYe1iUGaEBJOCipK2U3vXq+y2//jgAta5tWC2HeB621aw
	cLHJXDD+a4TT8aJM8ZsbRgI+TSCrkQk=
X-Google-Smtp-Source: APXvYqy1zkCQNdD3qVWVGfc9iyLTFfatvbtP1X3JTOUqTn8UnSFZJ1x/GJs7YdwFWxxVIyy6zvPlmw==
X-Received: by 2002:a5d:4d51:: with SMTP id a17mr18952107wru.260.1558477718834;
	Tue, 21 May 2019 15:28:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z74sm5585446wmc.2.2019.05.21.15.28.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:28:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 23:28:32 +0100
Message-Id: <20190521222835.23928-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
References: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/6] openssh: Add sudo dependency for ptest
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
X-List-Received-Date: Tue, 21 May 2019 22:28:38 -0000
Content-Transfer-Encoding: 8bit

Without this we see test failures due to the sudo binary being missing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index 3b4ed7223b3..6c8f7327a94 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
@@ -149,7 +149,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
-RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed"
+RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo"
 
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
-- 
2.20.1


