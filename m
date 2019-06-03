Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 18D247E3A6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:22 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id 83so1630920pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eMEY9T3GcoWCifSPn+PmT4QCyIUo7q/HR2R74vXHDqA=;
	b=TD9j9EJTeaW2ErocBDHoC7Ho3Y2yBWYBHz0qJJYNt5RMJ4VHrpT3Rw6m/KupH4reaM
	ivFVbp/7bDfe/Dpz1E0VLVRm+8M34SawIvN34ir616K03k1Xl8FyalkMGDEuLDCvNnhK
	7IknKB8EWf8j+CAnWPZVi87mGypOHnfE+LJmVdM2k+ZXU5KPJzCJX78xKuSosj+d6Uk2
	F1ZcBKp2nltFvuDIITbW6SPjB8VYq9+nvY2aF7H2wr3rkdtxgKarQs5MrvsVQGZWul/D
	VhZfo8grkk/k5GZ2MDN6vqYv/GwqIawRyrw2DBjv08H3FLFs+as5wxtT/XImTv6k74im
	PDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eMEY9T3GcoWCifSPn+PmT4QCyIUo7q/HR2R74vXHDqA=;
	b=d40P7ogq6w5y4+yzyL6+HgA9xXGdcjmqspQ6FsepJDw6USckoOq9Fojjd4ESYoySHz
	kaPWnBWRpgGXyVmRHIk7vD3sjEC92JRHJSjuDogfH64NPb+uBRxzEFekIMa11nnfxkQh
	2gBDgobe85ypY8KIaBPEpbSFrvO8USCIyu2eNSseh82TaE0aPq8Qg/sERtLcULpooKtE
	rjIW75NpDA0rNIXS7s1ozos+7Bet/A6GKMrS62k0q+QNUY1v0GU0lFomwNMB/69sHTv1
	N6bHI74ru4KMQx1Rc39+E0MH9R+0cwZmjtDN9ce+HuJwpmduahkdqNvY6EJgUbquUULE
	iQZg==
X-Gm-Message-State: APjAAAULT6jxoOH1ufGFZY4xzbP5WKqoqD6/iMXfHAdmJVAF6KY3n+Sx
	oUhzszxXhxWfPgziYMVW04VBU/No
X-Google-Smtp-Source: APXvYqyhrvAzguB8ySUkphAlAIDOLt+aqbKD5xpdoDFv6XQixIz4Ai1YiUitKyehqL08r1Erm/WoTg==
X-Received: by 2002:a63:4104:: with SMTP id o4mr29789130pga.345.1559574443105; 
	Mon, 03 Jun 2019 08:07:23 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:07:00 -0700
Message-Id: <e9ec74e10b9c65ac4c014bce57b2d28806766df1.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 17/21] openssh: Add sudo dependency for ptest
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Without this we see test failures due to the sudo binary being missing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_7.9p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.9p1.bb b/meta/recipes-connectivity/openssh/openssh_7.9p1.bb
index 3b4ed72..6c8f732 100644
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
2.7.4


