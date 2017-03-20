Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C41B77A0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:47:44 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r137so14284445pfr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Q+5x7OSkya86NqGWWyB9JTWNhZqWJusEMA2JkW9DfAg=;
	b=hrG5xzfNMvFeBFXNfrCngdA2mCG4IDJ+qGoDnRSEvOn2tsbtKQlsa3g1l34alqtUi8
	54xg6vv+UGuBTQRpNRAalrzNY9Se76Che4W4VZgunQjYiMLdrxmCWbKMVUtu7NR10zwW
	bQCLV5DKrnFrxy3jmCjEo7tzOfLVvDANag4+hisVbPglFc3Oec3lDAWQhE0OWb4NGgGc
	sRCAwGF6kGXYMPiZEmlhtVyo+pxPvC4JqYp3a2ey2gRqOaiL3RPVMSVIQNuWlpgP6ZHc
	18kTh96dV9XoIkzm9Vl0QcG6SOoTp1xhKJotVnN5wRLUjrt9vMNerP5ALEoCvRUitokv
	QZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Q+5x7OSkya86NqGWWyB9JTWNhZqWJusEMA2JkW9DfAg=;
	b=tn9mYuqbrWwswnM0IGaDhAAQPNcuh1/DyG+U4K6rz+Wl0Oi5DobOe3jbCL3LTAMRHY
	tsLfHNU4gNDGmXxBNvIX/EwsOZg+IY/Wclt8k8oe/ZSpyR9VhgwJNvuN5nv+9wKM8YTU
	O9drWgMQunlxIDDfQACHZTCflHiFYgnHH2qhxNuqolAK5cBkX+aUtKWVynDL1ofJCHGh
	6YBjO6HUZuMWIsIlDTtwiUIIEHmjspxRJlpFOH+mCtJdVg9mejxiDhHWMibnxhdkClX6
	UW1Xp8cR7WoPzw3/Os3s4daES+Nz8R7UbtKmQZTOsOnZ1UlvIS4+FnN46CZ9wOUDlS7f
	Tbhg==
X-Gm-Message-State: AFeK/H1GAO4Ee2m6079S5xzvb6PuAZZM78jrACLqZiLEfKVxhMNL6MrRy2q8vW2ZlTzw0Q==
X-Received: by 10.98.50.5 with SMTP id y5mr15530841pfy.169.1490028466203;
	Mon, 20 Mar 2017 09:47:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k2sm34536513pga.29.2017.03.20.09.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 09:47:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 09:47:34 -0700
Message-Id: <edf97ca26a06a915d06bf7a522338dc88bdfdf65.1490028304.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490028304.git.raj.khem@gmail.com>
References: <cover.1490028304.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] acpitests: Point Makefile CC to use OE synthesized CC
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
X-List-Received-Date: Mon, 20 Mar 2017 16:47:45 -0000

Default CC is same as used here, there is no need to
duplicate it, as a plus it helps in compiling acpitests with
non-gcc cross compilers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/acpica/acpitests_20140828.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/acpica/acpitests_20140828.bb b/meta/recipes-extended/acpica/acpitests_20140828.bb
index 1f6f190c2e..409da5ccc4 100644
--- a/meta/recipes-extended/acpica/acpitests_20140828.bb
+++ b/meta/recipes-extended/acpica/acpitests_20140828.bb
@@ -18,7 +18,7 @@ SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-EXTRA_OEMAKE = "'CC=${TARGET_PREFIX}gcc ${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}' 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "'CC=${CC}' 'OPT_CFLAGS=-Wall'"
 
 # The Makefiles expect a specific layout
 do_compile() {
-- 
2.12.0


