Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 15F8760616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:32:03 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x23so2601510lfi.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Nic+ryLYUXqeLlU9TVvRzJumMyoKTRjC5bBpkwLyUA=;
	b=CZ5jD0LLIxEgSM8Q/sn13vhIPGQl8W6gGcNa8rsdcgRyGVKVIEssC5K04WM4DzupKk
	JvKO26BrpAy0lJfRGzd+B++kDLqLjKiMAMGxfWwTNo7rAzqCenCTBG6YYp3U+rzieJOK
	2Isee8DSMQ6E0KjtGGSRLm3oymMS07uZDB7kF0lL0SPy51tCMKOnW8YGUyUl18Fq8kHn
	YTXQ4BvPYW4KuQksIZTpJDCnIO2+8ZIQlzHAoQXWi0+eLCT8XeHY8eBQ7kbbMV7/3oBn
	n11R6tLoJqagXFo00Vmu1W5Zq7yJgoDfmZPfkEOxfEbMIb1bzh5ECZMukyK51eryJZzs
	9SQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Nic+ryLYUXqeLlU9TVvRzJumMyoKTRjC5bBpkwLyUA=;
	b=ST3b27bDEU4mK2fYw2nA5KEXbci3yGzCrGo/pPQF1TCMpEVLVadcErss5mjt/gtMP2
	Wl4pkgGnJBYHIAJ830Z3tX47bqihiMSTC1M11Qr7nC7jV24h7BU/DB0kPMq+NwAWliWB
	tBAMwx8/TOPB3bAY8k6tXb5xSTCuA2ldifgASbV49kZK8diK+RO6+cZevyHOXKVU4lth
	74YNkTN8AaNDsYoCk34MnWFUdXtIhH/9UkmtZcL4a+VMVrp8gbkb8eExu/3H2kqjC1lg
	qw3Ox+GKGThDPqrd/WG7S+jksiHS4gv9tVQka7vG/xEoGC1TAWd/lNq//Q9buj8y8KKU
	ur6A==
X-Gm-Message-State: AA6/9RlpydeWs/2tA5Zz8FzgvFHJZD4J+CEj8/ycWil1x7Z2J27Y6XUBAE73SAsX7LSeAQ==
X-Received: by 10.28.211.71 with SMTP id k68mr3026375wmg.21.1476891124439;
	Wed, 19 Oct 2016 08:32:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a7sm66770722wjj.22.2016.10.19.08.32.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Oct 2016 08:32:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Oct 2016 17:31:57 +0200
Message-Id: <20161019153157.17806-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161019153157.17806-1-Martin.Jansa@gmail.com>
References: <20161019153157.17806-1-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] sstate-sysroot-cruft: Add /etc/ld.so.conf to whitelist
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
X-List-Received-Date: Wed, 19 Oct 2016 15:32:05 -0000

* it reports at least 2 issues in every build (this file in
  native and target sysroot) add it to whitelist

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/sstate-sysroot-cruft.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index e282e47..d9917f5 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -143,6 +143,18 @@ WHITELIST="${WHITELIST} \
   .*/var/cache/fontconfig/ \
 "
 
+# created by oe.utils.write_ld_so_conf which is used from few bbclasses and recipes:
+# meta/classes/image-prelink.bbclass:    oe.utils.write_ld_so_conf(d)
+# meta/classes/insane.bbclass:                oe.utils.write_ld_so_conf(d)
+# meta/classes/insane.bbclass:                oe.utils.write_ld_so_conf(d)
+# meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb:    oe.utils.write_ld_so_conf(d)
+# meta/recipes-gnome/gobject-introspection/gobject-introspection_1.48.0.bb:        oe.utils.write_ld_so_conf(d)
+# introduced in oe-core commit 7fd1d7e639c2ed7e0699937a5cb245c187b7c811
+# and more visible since added to gobject-introspection in 10e0c1a3a452baa05d160a92a54b2e33cf0fd061
+WHITELIST="${WHITELIST} \
+  [^/]*/etc/ld.so.conf \
+"
+
 SYSROOTS="`readlink -f ${tmpdir}`/sysroots/"
 
 mkdir ${OUTPUT}
-- 
2.10.1


