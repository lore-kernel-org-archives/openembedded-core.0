Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72F3E731C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 04:40:36 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id xm6so3716351pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 21:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sX3DBJ3fsE498oKHbfNFblpQde5rm5wKGHhuW2PZinA=;
	b=N6TACJHA5AyKkAYhHYVbHZEZVN1HzUtMC2Pdvd8I/2beYZorYSAf0Hy8/BY/2OIlta
	OcBikD5E5Spn96ZLck8azd8dRYL2pQeo3Lmkdq7RG9EQqxflmEsXu2ahvzNetbvwDXwU
	Fxob5NOTQVnGN19uUcIqFOb57TYcKXvsmNcWLswJCn+jOr0FUlwYdsbapMl9GkBzzwoa
	O1EVZ8Ixmj5rLLaSuGmn3cMy95OnTmLdheOnqK2DRmnTtqJQsxtLh4vNq0bJAMIhvzTM
	ckrmTMLhv+8bafyisw+QucmU5AeKd3rHgqQo0ALNoSPt2YdjYlheHuniv+LGPivHMi5Z
	cNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=sX3DBJ3fsE498oKHbfNFblpQde5rm5wKGHhuW2PZinA=;
	b=LxZp1ZikFQlEjSyIDqjOhGasT8rZXGQDCTKIokDX7ehvjOknVAfgIMjAOTzuOCfRZr
	FzLg4J3zyhN0+QhlrmygWg1lZRC5JZyFBtSt08/9PmZMR9RLCSvoxIDGpMHaXk9yp7AS
	5GfhUvPivAw446dsSLy5Fr1lK9g/ldBQ/oHag5XhVVhyYG66SsWYCwsRpo3dyojDATIc
	ZSZLe9KnGZlZwlkIOP+EELeFlV2/LWfDprJDpoQNPDpKjjrdQ6wlso0G7LQJIHHBn6wn
	JiY6zuG5ROmtWAa7A4WbjsZC38OBtU98L3ZjnFXiZQqVzKiacREvZEl24dj3hiPUNvPS
	R9WA==
X-Gm-Message-State: AOPr4FUFMa4/fceUJEwsHM4SaKeDLzBRI9ZBYCvxoyAaXGAqoMexDdSv/7kZ3urnkA4uew==
X-Received: by 10.66.141.171 with SMTP id rp11mr7693700pab.92.1463546436892;
	Tue, 17 May 2016 21:40:36 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id e2sm8324447pfd.20.2016.05.17.21.40.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 21:40:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 May 2016 21:40:24 -0700
Message-Id: <6eab8634c4bd5d29ce8198f36cb108be7f85ceae.1463546289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
References: <c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
In-Reply-To: <cover.1463546289.git.raj.khem@gmail.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH 5/5] sysprof: Disable nios2 support
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
X-List-Received-Date: Wed, 18 May 2016 04:40:36 -0000

From: Marek Vasut <marex@denx.de>

sysprof does not support nios2 yet, so disable it.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 5a8ee58..55e9c6f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -11,8 +11,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 PROFILE_TOOLS_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sysprof', '', d)}"
-# sysprof doesn't support aarch64
+# sysprof doesn't support aarch64 and nios2
 PROFILE_TOOLS_X_aarch64 = ""
+PROFILE_TOOLS_X_nios2 = ""
 PROFILE_TOOLS_SYSTEMD = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-analyze', '', d)}"
 
 RRECOMMENDS_${PN} = "\
-- 
2.8.2


