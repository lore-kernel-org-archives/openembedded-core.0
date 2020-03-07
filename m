Return-Path: <jpuhlman@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id F37A061AEF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 13:51:08 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id u68so1849148pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 05:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fP37FWXG6s38WyHCrZBxpplrDAwJaYJUxjvyRKtck/A=;
	b=q9c4ib9nvktUjgx7+u5wc3eod4BGog7OjJCpM/pVWLnAno4vo6XLAUswIbk0/mqqqn
	ebChmAD1VRXQ68cgUHAWNABQ+uVjPYyZgpRYOAlBgyD/MFwzks9NbvxWRq9FzoAljCFA
	PBFnwesQZrE8JkogQqGynTGahLBmpovm2cIwf420IbT5WW0CnmPFb8pv2B0K0Ixvr1uq
	Mg7KjqHML+WXGIvK0VEF5hn/Vu1BJaFmOe4vba3seiyLkNTdqhTZGF8YRjeZny9meU4b
	PgNmhdK3aek+PoB34NbbfXLcrpn2LAAwVNxJEjTV/828FxchsoqoWFoxynQdFIeBGCYK
	A8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=fP37FWXG6s38WyHCrZBxpplrDAwJaYJUxjvyRKtck/A=;
	b=r/PUnvQNePaAUntRJH62ivqELJLkw41xs9VMYjCEYdlHjh/zmF45bIMHGyZFwb55X6
	5U/wTEoeEtuNgjxw5/GRU57HWGcRwgNM2203T1SIZuV1MUmI6ogT5xwIXdOHquD7G8Bu
	0M5OTW3MaDA55jEfeBwjx+/SzlvT2WznsmfR0OUKiq3PnyYzelB0qzlgeKNom8bzQchC
	tOIgM6WOEBMJUkHZZxdy0j6fD/tsvjVeGbpVOKD/mSvsbjjrpCfSHoQPmtxGy9RSULf/
	S7zYndS+jnnywbvpaHnj4cSbj1NL+r9rOig9XEoDXMzvSIWB3PK6v0NtpsjfIhiTN+6F
	HLdQ==
X-Gm-Message-State: ANhLgQ0X1CKpUyQHnmTE13N1XSKqmFY6P6SafpLDMaQYnaRQNnTm8lKH
	EDFPHpPDHyhNuI0735LrJxSsL+pB
X-Google-Smtp-Source: ADFU+vvoTpMoUVKf0wYxwlMsw94gz/SHkaLVZhl5m6Q3NcDd3ZH5oy5FAWwrgWddr99SBWcBUx9Mnw==
X-Received: by 2002:aa7:9497:: with SMTP id z23mr8715666pfk.229.1583589069919; 
	Sat, 07 Mar 2020 05:51:09 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	h12sm23133454pfk.124.2020.03.07.05.51.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 05:51:09 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id BDF832A089C; Sat,  7 Mar 2020 05:51:08 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 05:51:05 -0800
Message-Id: <20200307135105.12838-3-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200307135105.12838-1-jpuhlman@mvista.com>
References: <20200307135105.12838-1-jpuhlman@mvista.com>
Subject: [PATCH 3/3] xinit: make manpages multilib identical
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
X-List-Received-Date: Sat, 07 Mar 2020 13:51:10 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../0001-Make-manpage-multilib-identical.patch     | 28 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-app/xinit_1.4.1.bb      |  2 ++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch

diff --git a/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch b/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
new file mode 100644
index 0000000000..649905574c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xinit/0001-Make-manpage-multilib-identical.patch
@@ -0,0 +1,28 @@
+From d642e60d8963f1b90569cd0ab5c29ac2c9bfe939 Mon Sep 17 00:00:00 2001
+From: Jeremy Puhlman <jpuhlman@mvista.com>
+Date: Fri, 6 Mar 2020 22:28:14 +0000
+Subject: [PATCH] Make manpage multilib identical
+
+Upstream-Status: Submitted
+
+Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
+---
+ man/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/man/Makefile.am b/man/Makefile.am
+index 9c6569f..608e933 100644
+--- a/man/Makefile.am
++++ b/man/Makefile.am
+@@ -12,7 +12,7 @@ MAN_SUBSTS+=	-e 's|__XSERVERNAME__|$(XSERVERNAME)|g' \
+ 		-e 's|__XCONFIGFILEMAN__|$(XCONFIGFILEMAN)|g' \
+ 		-e 's|__xinitdir__|$(XINITDIR)|g' \
+ 		-e 's|__bindir__|$(bindir)|g' \
+-		-e 's|__libdir__|$(libdir)|g' \
++		-e 's|__libdir__|$(prefix)/lib*|g' \
+ 		-e 's|__configdir__|$(XINITDIR)|g'
+ 
+ 
+-- 
+2.23.0
+
diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
index 5626ebbd52..c9e28d9bba 100644
--- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
+++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18f01e7b39807bebe2b8df101a039b68"
 
 PE = "1"
 
+SRC_URI += "file://0001-Make-manpage-multilib-identical.patch"
+
 SRC_URI[md5sum] = "6d506ab2efc17a08e87778654e099d37"
 SRC_URI[sha256sum] = "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa54abb9"
 
-- 
2.13.3


