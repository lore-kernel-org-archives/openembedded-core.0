Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7C97276E4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 15:30:07 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q10-v6so32349012wrd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gcv2SM1BDjAczbNgeSZPfVErhgPNPAmQ1c8em+rQYaI=;
	b=FlGYsGuEkCQ8mmmK2csfPb2Bb9d/JEXCKTL0+PpKHSDIylgeY4bLui2uyY+v4Zmp7D
	YcEtm5Y3AxGJcGGsyF2IanypLFlyju3sIn9QI0kQ4qoL8ANiTQu8tq0Q4UoEB3b/Xn8i
	jSuR+m0CnEk9HFRTFD66B45LHpKwsIU26U6bukFRbR3LYjjvnv/l8acGA62u3jIrnY3J
	7QB1kInXTgLFyXDXeMeE4oezYsAgb0tHeOFCcpxasqkjsWDeKmt9LUpWeilFpE+EY7ql
	+wGcPHnMXbfnUSy42WvvrG0u6ToowGlKhN0bw2rAR9hNt448R3va72HY/Gxydh2iDCT3
	LGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gcv2SM1BDjAczbNgeSZPfVErhgPNPAmQ1c8em+rQYaI=;
	b=leLvihAMHBV0psp8a2uORz415cpgd2iIPqzxsHD5GigUfYSizIuqkPH6gQdLMsI+O4
	d+g3rJefH2FF/cuBh56Dt+g7MzVUdhJhgxlonC+YtdZE9q3VOeAoG7zQac5YOA77S6YB
	w/O9L97aFS/PBqWkV1edV6UgGTVcits2wP7S4lH5YUBcUUYFZjMamGqwyaD8bruCybpJ
	HZD4husmNrCdOgQbe2hnLrXtZP/jNRTG163zYLhtWvEFYcYItWHMLaGthpBc6p7V1lrp
	kHCnajjqpJLap3tlXiEHE9375OfABA40ZpkZTZAjz85EK7YyiZ15QJMI7axPHCaMJfjv
	ddNw==
X-Gm-Message-State: AOUpUlFsZOeuS7lf5f0C+/+/RZlXclK2fUBK9XaKmEgg/Sj+ML/87wtv
	wNQ/WYa9km//+Xq3Ci4KwD4LMSmB
X-Google-Smtp-Source: AAOMgpdDaQy9NXvoir0TRzcECspmcgSZaXNCz9kjh3eYJ7wjndTGCPsEKGSRNwDKxqoEIw7R09kAcA==
X-Received: by 2002:a5d:48cd:: with SMTP id
	p13-v6mr13454124wrs.0.1531755007713; 
	Mon, 16 Jul 2018 08:30:07 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b190-v6sm21645089wma.24.2018.07.16.08.30.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 08:30:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 16:30:05 +0100
Message-Id: <20180716153005.16552-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] atk: add explicit gettext-native dependency
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
X-List-Received-Date: Mon, 16 Jul 2018 15:30:08 -0000

In native builds we attempt to turn off i18n but this doesn't work in Meson
yet[1] but as the gettext class reduces dependencies in native builds we need to
add gettext-native to DEPENDS explicitly.

[1] https://github.com/mesonbuild/meson/issues/821

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/atk_2.28.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
index a051247d8ff..d64df37f5de 100644
--- a/meta/recipes-support/atk/atk_2.28.1.bb
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
                     file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "gettext-native glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
-- 
2.11.0


