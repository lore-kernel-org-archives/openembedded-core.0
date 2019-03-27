Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D6257D178
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:45 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y7so15389413wrn.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FIKlVp/bxFLLhvEIZ5CpSwpfDi8JA0UgZ32ejdZ0UBA=;
	b=pkxDUqARCXjfWCtqRUIJINiR+uZ18i8u3FujV6Vl0+jlMNyIegRGiKrQRNfa7PWHn8
	6+zw9HhPAwyDFw5tQucMx3S+IfJ/iMnK0Z1gV2VlrdAjH3SZVS5x8P9aya6mhNnbwH7F
	LH5Rzu6jVNkMdDZ2EoUiZjtRRDBXJ64FoHI6mN3Z+2GwO8y3vFpMOMV9LPrU2QYH8P+q
	UxMfsPFdRsd9lGXbDGimjdWFttje6oINe3ebQxJduEsisNwuIdHa4Lsy74pAjlUvMKb2
	mkHP75fhqtp8OyRYeJfq/Wq8keRsFL60qBAHmqPOwT0KmyYjpnjOkkcrAfjR2m/Nx+XA
	7Sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FIKlVp/bxFLLhvEIZ5CpSwpfDi8JA0UgZ32ejdZ0UBA=;
	b=gd+Nzf0e1Kx6pLHFoBrgKPXKSmk+mMtgZERpY8dlQ0obmMzJU/eiH5sUc+4d8FY1lM
	qqjUX1NJkRv4zbYtcsy1gRZKxtXCFUEow5U/3pnmRd+EVI3xRDjzgJmqWuCnpBhxETsU
	RWfmRFwvhBuaeF73HJXoH4AbJKR/lU/EMoV9ppABGyN1Wh+ONfuzaihHFtkVSVx8KctS
	UKBO2IFBizSBF+6riJtfhO1nhZE1Q7VkM1SzPeiy/ylD2NY4FgfC4ubQdnzqzAqUTLxD
	q9UHyaMKn4Dhhmtp9BsQOquMdwfKZBEDxSycXkt6iAFXCfJ17Mw87WZrOYnItoQjvGOe
	0KnA==
X-Gm-Message-State: APjAAAVT/78laZpOtGvWQr1KSXQfHmC9iqn55ULaGqBAYVrZidShX5pv
	SfY9kTTIsi4soF7C/yAlXRu+P1zPesM=
X-Google-Smtp-Source: APXvYqy0HgG9yLzrmSZKn2a9kwjOkbBX13O/62jbV1dLCdd/fgA1r/4vjLbnbb8h+I//jziK7qiZhQ==
X-Received: by 2002:a05:6000:120c:: with SMTP id
	e12mr10831358wrx.187.1553707005946; 
	Wed, 27 Mar 2019 10:16:45 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:31 +0100
Message-Id: <20190327171633.34697-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/8] qemu: remove support for building against host sdl
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:45 -0000

This hasn't been the default for a long time (as some distros don't
support it), and with gtk+ being the new default shouldn't
be needed at all.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e503aa866d3..dccbd83548a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -87,14 +87,6 @@ export LIBTOOL="${HOST_SYS}-libtool"
 
 B = "${WORKDIR}/build"
 
-do_configure_prepend_class-native() {
-	# Append build host pkg-config paths for native target since the host may provide sdl
-	BHOST_PKGCONFIG_PATH=$(PATH=/usr/bin:/bin pkg-config --variable pc_path pkg-config || echo "")
-	if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
-		export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
-	fi
-}
-
 do_configure() {
     ${S}/configure ${EXTRA_OECONF}
 }
-- 
2.17.1


