Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 618C07E5F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:56:32 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id n190so14249346pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=U2aYek2jcQexvWc16Beww/TRpy50Sk6u9XSSn2Bbh48=;
	b=QhhSlsISu/sQa76G5KIB+roLXF2BHXcoo7JGchafS7NQQ16mOW9u3SDa8/fHmiaU8U
	JyMoH6rWaRqEOpQ4vmBPdVElvvLiFx2fkSDp5B7ForeafYa/v1mUsw5BtG4UU6IatLYw
	JzBqdq29CGhhqAjBdMRD6dcmkgodJA8JVl35Bl8OBZti2NCaq6QDeKWe/HMSspGZInQf
	lMLoBCQ6P9x9AsLNi7GuXejNrykD7lr3K2EE/SVzSPfUXjG6oQ8f7kdM8kgFRVAzhqAM
	aBXrXkuS4bne3qnui3y2mc/qFfItWZJnIHps5Uix60v84OCMIY9jGxzYn3ubPCMRKw3W
	U83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=U2aYek2jcQexvWc16Beww/TRpy50Sk6u9XSSn2Bbh48=;
	b=WiLJHfLH64EJe+UPHrO86Mv7WzBTdBLtMQK6oay0sOY1bOQUbFw5DJpgJ1cnFWsTPi
	dJGl74CpjrP1QXRdEEiplaubXrm/u8g30T/vl+iSSOk3gcPooMdgseEE3aJa0INjk+G0
	AMzXJ8TXGfS5tqEb0NegoG0R8mjnpRVgQ/nBTR+mRBVMwKvGCaCrzThFkJvpQNouOBJP
	TPM9c2VpZupDytOUWt6Ta6pVeTA9zKUU11Out6NkOHMVXKQlclN7HTUFkmjTVO48J/tP
	WmBQcsHHCT5oyzDB1r6G2dm7LDxfXna8V6A+5ThxPP0ec2wqG8HsdOMX8o5Vl2T/dcjO
	5eBg==
X-Gm-Message-State: APjAAAWtbngO5k0WBjpkFGSSy8v+gjwmUfdY4VYKKpYsE4va7Gs1SvlT
	vNzvyxqTnIVZmd6f92hruNnMW4eX
X-Google-Smtp-Source: APXvYqwNWvrgeA3blP27ri/NASyzShckKcYhzwbu8u3D6pkBYi+LXh0d2MEV0g49ocquBaLXgPUlGQ==
X-Received: by 2002:a17:90a:22b0:: with SMTP id
	s45mr1263277pjc.22.1568328993218; 
	Thu, 12 Sep 2019 15:56:33 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id t5sm314024pjw.15.2019.09.12.15.56.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Sep 2019 15:56:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 15:56:23 -0700
Message-Id: <20190912225624.28572-2-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912225624.28572-1-armccurdy@gmail.com>
References: <20190912225624.28572-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] busybox: drop inittab from SRC_URI ( now moved to busybox-inittab )
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
X-List-Received-Date: Thu, 12 Sep 2019 22:56:32 -0000
Content-Transfer-Encoding: 8bit

The reference to inittab should have been removed from busybox
SRC_URI when the file was moved into the busybox-inittab recipe:

  http://git.openembedded.org/openembedded-core/commit/?id=afb09abd2f0f7555ba156260a87fd3867f591310

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox_1.31.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox_1.31.0.bb b/meta/recipes-core/busybox/busybox_1.31.0.bb
index fa63965674..34b1f2cc91 100644
--- a/meta/recipes-core/busybox/busybox_1.31.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.0.bb
@@ -36,7 +36,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://syslog.cfg \
            file://unicode.cfg \
-           file://inittab \
            file://rcS \
            file://rcK \
            file://makefile-libbb-race.patch \
-- 
2.23.0


