Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id BBC3678F6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 10:23:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id v16-v6so1038313wro.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rBxzgbyGgORbn+aAH6I1FZmL0oVma+ZAFAbpZwy/mz8=;
	b=mAlBE1eqHuIT1SOu3ul25PBpL/OV/Q44pBgny3ajY7MkSJTE7rrmeBM+VF4pbPAQo7
	3qpJfqzmFDubNzUlS8VfpspnSVNwBgpikbJ7JEWSmpT8EUwkJTgQxJZh+/l/ooP44Jp9
	JK76KpBWqWRZxuXqHM+moRoaernTnhAGRKQZm7RQu/LI1iModGBvevDRdugFCbKy5zkU
	PfVBIgOBY7iLssuHH6PlKvmWc/ktVJR9741SpuaSHGxLKfZop/8jfgKjYGGqSrXtRMrC
	JDPpxciLA7AQvlnOEuNdI+3QHpPdMLvoHssrmPQSSMz9fYHNIeyX+J36Iz9+5XvNSe9y
	wToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rBxzgbyGgORbn+aAH6I1FZmL0oVma+ZAFAbpZwy/mz8=;
	b=G1x/bemkvTx6TcT6ngcoFDOnuYYgxApvVwUTrJiM2aVbYq9bzp0LrJSExhxT9MRbDx
	WOhC68sY2RlOtp082D+t+46wCrT9FLXxupGnERQrgF5tzjHoxfzXQ/9SJTGFKVMmA8rp
	V1QGqsOjzgDLwWZIaUblzqSN7jS4aAYEbv3EUewpTXkQgKvstH2ooui/Ct78DbeeoIeE
	biuAunGORDZ1H/i+yJmElRqa62YE6o0fxjff9SxbwXj2OrKMuNxExW689n4CbxYeM215
	vsygJBjzJ6M+HgedXKq+A6ynpWQTWAteZHtM1C4PRojcF93uZkkMqdtt0BAxCcafSkwm
	pbmg==
X-Gm-Message-State: APzg51A8axJVSAP3su0Qq4l/e7A0QentxgU8fgiCr0PFnUCr0c4YnQ8n
	PACExzFdpiH7tD/53MzEn6lR3iml
X-Google-Smtp-Source: ANB0VdYl+iAuqdUoMfJB17P2T7160HANk28PZIVkwv2Yv9sFKTZD/r+CN6FyjfZCY4ntuo479yV9ZQ==
X-Received: by 2002:adf:d20a:: with SMTP id g10-v6mr758158wri.66.1535451807332;
	Tue, 28 Aug 2018 03:23:27 -0700 (PDT)
Received: from localhost.localdomain ([79.140.126.226])
	by smtp.gmail.com with ESMTPSA id
	198-v6sm771823wmm.0.2018.08.28.03.23.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Aug 2018 03:23:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 12:23:16 +0200
Message-Id: <ffc15167779f47510566b92218c06930b84a3856.1535451643.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1535451643.git.alex.kanavin@gmail.com>
References: <cover.1535451643.git.alex.kanavin@gmail.com>
Subject: [RFC PATCH 5/6] openssh: depend on libressl
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
X-List-Received-Date: Tue, 28 Aug 2018 10:23:27 -0000

From: Alexander Kanavin <alexander.kanavin@linux.intel.com>

Please see the previous commit for the libressl rationale.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_7.7p1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
index b3da5f6..db5e437 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=429658c6612f3a9b1293782366ab29d8"
 
 # openssl 1.1 patches are proposed at https://github.com/openssh/openssh-portable/pull/48
-DEPENDS = "zlib openssl10"
+DEPENDS = "zlib libressl"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz \
-- 
2.7.4


