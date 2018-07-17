Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8257899F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 16:39:28 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id a19-v6so36347wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9dMhqk8l2qeGwTKn5FRXKrRLncC8OOjwJ5hAnGY3K9s=;
	b=qAtpIGlwzjSM+Tb4PJouD+tTx9wHzphrzZNGylzaI89XMLHOW1OasJ4m0x44XlFJXA
	wUPba5JGkkvpiTV/M2of0Bs1RYzB7VDPTpyNk22BCof/Vnz3yXvQZRHcaRNmjivcLLV5
	FMpUui4fDzaz0tndwFGBGxJoSk7sjaZ1rW+O0b0aBlE0vQkfsXxfZNhxeivvC3wgFNCA
	yu7S5FQhTbfKRh8rFDxCOCX8kg6FBYq7RaNghucuzwK8oXk1Eoc6qcE7cRfoQ96mq/5U
	psnOA2B1cAbXhYYPQvo5sNK0Rse+2DI75/9ZgU5Bh7V8gi19LB8iuj5A8j6M8Gtbfd9Q
	afZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9dMhqk8l2qeGwTKn5FRXKrRLncC8OOjwJ5hAnGY3K9s=;
	b=IDhz2vB41C0FubsB9O1exfuG5PwTIKTxbe96C9mgH+yJtOXj9Nrw7DQqfpJdE7jPd/
	9IrURpi5TyuW2fTa1P5fms3Ua1XsEijGUjluojnq7L5Wt5b7Gtf/ugN8fIRa8mE7QlAo
	JLeAdbYeCmmxTG9m/tTXT1dFnQnhOd4EPPEOHNgTjLoQmY/G41XJrKWkQxs+ZnWLgBYr
	zVkpv2D0LKeTTTZ4LG+XwVgSOmSnn1fbAHhR3KPPl3yhCYBR94sOjIYZtS41m6W2mvTP
	i1aVurQgqxSW6FxSXUVBGEuH9JkT9DHV31HB/INdb5N17kiLIpXoPUJ2UIeiC9C3bzBg
	Rrmg==
X-Gm-Message-State: AOUpUlHeJM+vyLlzuTmz1XkH0sCQ/P0812Mjq67u76TeqbzUbtBw70A7
	kSzh7oJTiCOnOKG5rGjOLu3QkwKx
X-Google-Smtp-Source: AAOMgpd/ICGXB3abrp+zUcKDhUbdMJAPrXJi6fJlg7erzeKE6U7K0unGkDa8S7SWZVyZ5Z8BZYXN9Q==
X-Received: by 2002:a1c:5b09:: with SMTP id p9-v6mr2046343wmb.0.1531845568662; 
	Tue, 17 Jul 2018 09:39:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i125-v6sm15958wmd.11.2018.07.17.09.39.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jul 2018 09:39:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 17:39:07 +0100
Message-Id: <20180717163910.3196-12-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180717163910.3196-1-ross.burton@intel.com>
References: <20180717163910.3196-1-ross.burton@intel.com>
Subject: [PATCH 12/15] harfbuzz: upgrade 1.7.5 -> 1.8.4
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
X-List-Received-Date: Tue, 17 Jul 2018 16:39:28 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.4.bb}              | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.7.5.bb => harfbuzz_1.8.4.bb} (86%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
similarity index 86%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
index 0a9b029461f..4d5964d6bb7 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.7.5.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.8.4.bb
@@ -11,9 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 DEPENDS = "glib-2.0 cairo fontconfig freetype"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-
-SRC_URI[md5sum] = "1466ab51fc5aaa6af4065936939cec62"
-SRC_URI[sha256sum] = "84574e1b1f65ca694cb8fb6905309665c0368af18a312357f8ff886ee2f29563"
+SRC_URI[md5sum] = "f176eeda0a4e51a056d3ea6b9e65c27f"
+SRC_URI[sha256sum] = "3c592f86fa0da69e2e0e98cae9f5d5b61def3bb7948aa00ca45748f27fa545fd"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
@@ -30,6 +29,8 @@ EXTRA_OECONF = " \
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
+LEAD_SONAME = "libharfbuzz.so"
+
 FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
 FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/libharfbuzz-icu.so \
-- 
2.11.0


