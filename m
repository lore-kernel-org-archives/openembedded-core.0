Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 945F67E522
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 21:28:13 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n4so3489930wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+lBrA4Cr2/CKudSzDRvW9Pb1mp6N89T07UDUm8EQzLg=;
	b=J9E147ELRE1RG6jZPp371+HOaEucLu5WEmGDE8hndMRX5OixzOBFFwmPCcqG2Eb+so
	k/6WF2rWIxFP487rGtL3n/hcbRi7GLw8RRBoM/lgO4Jio6gqyXlVkmASOukzX4e5V6bK
	yPqlij07M0kguPJ5NqqmAwOTIgIsStwB8gEEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+lBrA4Cr2/CKudSzDRvW9Pb1mp6N89T07UDUm8EQzLg=;
	b=twUQ93Ht9TEp7yjygiFozNNar8D24yaIcDx0xy4eIrBhsXDHUGJtLI9fiXdUtKNfvY
	9hvM6TH0FQBPg1awTiKljVXuZ0WdWNP9dL6C7iCrIPobTNPVn/zpBrFPCnDSu2UnPMoD
	wGiVhPlaH5pYBc+M6PC72ACcK8AqGviB8VhAzpOia0vq4wz6zAf4OCg5gEkDldNpMN2J
	GBbSvW+zUEgkI3mJleEXyEeWePcZYHv+xhrzEXuX32PpLYWpEE6NF6wJRpUBAjvgAoS3
	vcPG3osyIyWNZYS5jhs0dyL21cWjwIj5frzEBSLI4DSkSm1HYjrwRVzVyu+IUH47hoRI
	6VKA==
X-Gm-Message-State: APjAAAVfb2ERd5JKzlsDkdlPhS6/7lHCmzCL+XLM1CMeUvJQF5402s+h
	zK4FGdzYCNBiTFROan/8tmu+wFZaYPk=
X-Google-Smtp-Source: APXvYqwA5vocKUT3tK43Wkhj+/nL75LbTSMaVWrZnqvTAeVcvv1hoP85ygTVRpgO7H8wuxX3hcqENw==
X-Received: by 2002:adf:a346:: with SMTP id d6mr3746122wrb.323.1559942894089; 
	Fri, 07 Jun 2019 14:28:14 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	f10sm4214949wrg.24.2019.06.07.14.28.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 07 Jun 2019 14:28:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 22:28:11 +0100
Message-Id: <20190607212811.19372-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190607212811.19372-1-richard.purdie@linuxfoundation.org>
References: <20190607212811.19372-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] openssh: Document skipped test dependency
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
X-List-Received-Date: Fri, 07 Jun 2019 21:28:13 -0000
Content-Transfer-Encoding: 8bit

In minimal images the agent-ptrace test is skipped unless gdb is
installed which explains the difference in test counts. We don't
want a build dependency on gdb and the test isn't critical so just
document the dependency.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 3e99dfa5754..0a5c2ffae5f 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -145,6 +145,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RRECOMMENDS_${PN}-sshd_append_class-target = " rng-tools"
+# gdb would make attach-ptrace test pass rather than skip but not worth the build dependencies
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed sudo coreutils"
 
 RPROVIDES_${PN}-ssh = "ssh"
-- 
2.20.1


