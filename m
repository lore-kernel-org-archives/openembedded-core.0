Return-Path: <jpuhlman@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id BEE5960B07
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 18:54:06 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id dw13so2213967pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 10:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uhDJVHcy2O2FsSnxnKMsQrwh6LD7RhMRq5yMoc9ScVc=;
	b=duO9wXScYf6DGbcTGRx8WMSa1nExevRtsoPOxW2dQnbKVioMCikob58vWU6WMjdqXG
	reX45ZIHxZLtQvkMjOfqL8XIPBrZ51RsktEReyTsKJmc2vWkaT+9ibt0J0I4JptDprwE
	S9XkGZA8szbOZ5NGOcQOFxzhJlG6s33P7+/+83pygmWRuBSQnz1lXQskObCdVmzV9XSB
	a9ANqHdjqaBvMsmzJacPysw0ou1MN2rZL2GTwP2bP8B/v8jYhrRNU4jfhp4Nv2dpoQ/u
	105SaT6nfgqO5zmdLhN5cl8nk5Lgid9a9anD8YM8LDm0S+8Bdo4pm1+nlTGeldZNLbVh
	TW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=uhDJVHcy2O2FsSnxnKMsQrwh6LD7RhMRq5yMoc9ScVc=;
	b=Jbpf4zss7qxHTmxq+LP3VTNaXy2s5VMixBPtaPxlNFOZ46xD483DCIr07uyBWVrZ0y
	KOw2EPblgCguF4wTBbGAQVCBSTcPd6jUzXN8kyfYlL5isgYJF8eFtNNCNWNtTZ4Q5r2U
	fuWFZrhwV6ZjVEcIUIkh3HU9+gQ38d35zMPWGg6zIeh9UCfKbJ0llM1TBD54B4aRdz8w
	LbNlpWock/sfLo0OmM+IEPF2h7JYeookLIuGTBXY+Hvh0DqF4MBVGsaA0pWDMiiY87EG
	2F+UWS9UOyt1CQ8mmYIXlp5U5e/G9fO3Qg03Ra5xmU5+GKRUQ2E1Frq/2Imwi86IAS5x
	wsRw==
X-Gm-Message-State: APjAAAUuCVK8M8Pta61R9nLW1fGDABtiXz6n9+P5ZDdbgNJYYNidzFiD
	ZV1hkZqiyVi1nZ0eYUu3bmeX9edwRH8=
X-Google-Smtp-Source: APXvYqyqlTg+Vs6FfL8nsYy2Pdg/Ex0x+lf5boNMl0hWcQz734NTwmYuEUE2Y+MkXgfjYQtBcciVqg==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr10775408pjz.74.1582397647615;
	Sat, 22 Feb 2020 10:54:07 -0800 (PST)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	c188sm7187741pfb.151.2020.02.22.10.54.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 10:54:06 -0800 (PST)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 1BF132A0501; Sat, 22 Feb 2020 10:54:05 -0800 (PST)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 10:54:00 -0800
Message-Id: <20200222185400.32136-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] readline/ediline: Fix conflicting manpages.
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
X-List-Received-Date: Sat, 22 Feb 2020 18:54:07 -0000
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

  file /usr/share/man/man3/history.3 conflicts between attempted installs of libedit-doc-20191231+3.1-r0.corei7_64 and readline-doc-8.0-r0.corei7_64

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-core/readline/readline.inc               | 8 +++++++-
 meta/recipes-devtools/libedit/libedit_20191231-3.1.bb | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index 07f54a76f1..4babcbd69a 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -44,7 +44,13 @@ BBCLASSEXTEND = "native nativesdk"
 
 CONFFILES_${PN} += "${sysconfdir}/inputrc"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "history.3"
+ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
+
 # OpenSuse injects versions into libreadline leading to conficits between our native one and theirs
 # see their spec file for where this is injected. Extra versioning is harmless so we just do the same.
 SRC_URI_append_class-native = " file://rl-native.map"
-LDFLAGS_append_class-native = " -Wl,--version-script=${WORKDIR}/rl-native.map"
\ No newline at end of file
+LDFLAGS_append_class-native = " -Wl,--version-script=${WORKDIR}/rl-native.map"
diff --git a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
index 7116c9ddbc..267fdcc54a 100644
--- a/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20191231-3.1.bb
@@ -17,3 +17,9 @@ SRC_URI[md5sum] = "2e22a51131de94ff2df24901f7cfe416"
 SRC_URI[sha256sum] = "dbb82cb7e116a5f8025d35ef5b4f7d4a3cdd0a3909a146a39112095a2d229071"
 
 BBCLASSEXTEND = "native nativesdk"
+
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_${PN} = "history.3"
+ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
-- 
2.20.1


