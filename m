Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 924F67D0B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:44:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r4so4508259wrq.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=T2FDlrCOIXJW8H9txGDzo0blSXRuxw1xRjhvybzTUK0=;
	b=a5IxTDnMmK0RY3EJjXnWQ0e2yfxi6BEcuhqw4FIzhm4STJSRRqoNaHau9c12WC4YMV
	rA5+Mm6rx+ViKBUbnwQi4dVWcSH5gzTzvtQ7yQrnC0Fc8jj+HlNxIOmw3R27Duclvdc/
	fXM1sUKYyybP3YnxDrtedT2iPb0N6xV/qReKIFNvdiT3iCVCB3YvCuQAIJyvBWUWIogP
	EPqr8pZMSnioe1x3l5TpTIMqRsWReP30w1Y8PhzoFGNEM/yJlm03g5fE/OaXo1d786hL
	Z8v22GvL44rA2RzkBSCAOUKz3G+DbgLxzqVTYUcShxgVJ7mKNtWcWhzy+c3KVYJhXy2x
	yjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T2FDlrCOIXJW8H9txGDzo0blSXRuxw1xRjhvybzTUK0=;
	b=fd8VdO4+257vcliW222NTzpz52MmR1Xj7mZxbuEd0trQNJOXaXYcQB9PYTXVSfCUp6
	AFYngbxFkXGiZLEC0GQ28ZeygfPkuFNUngNbaVPZFCJz//Pt6HAjnKi5YFvrxRPbc7N6
	uT3Q5v15jTiPk1MH0jo9riKtd9x74JQPe1e16bzapa94c3ac6RYRNf6MC5ZU+tYl2lto
	ObVOdlGCqipp0rqVc57EApBo/eifP1Ai9l7ysBchrQillu+zffZgcN3mqCCl9ZGr1x55
	tUhX5KE5nlH2n04QqpV6woHZTlVOHYu+frgKh3xqPvVafsDmOzjZAd4utIgmjoBBN2xZ
	paeA==
X-Gm-Message-State: APjAAAVyH7EVL4GQ3//cJNOfZFUncrUC+fCh3KxKsNv0tD+ELLvd6Kqv
	G2JEyg6Dc+vVqx5H5bap1Hqm7xkSr6U=
X-Google-Smtp-Source: APXvYqx78ugTId0yHAeiAom5gRfP+Zk2xv9qDMhNH51gwNderwH2OaxTHB8+vlSJitV4hbYZIdOLfg==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr17796767wrt.253.1553557456065;
	Mon, 25 Mar 2019 16:44:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d7sm19973764wmf.31.2019.03.25.16.44.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 16:44:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 23:44:13 +0000
Message-Id: <20190325234413.12652-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Mon, 25 Mar 2019 23:44:15 -0000

This isn't a git snapshot recipe but a release that is fetched over it.  For
clarity, put the PV in the filename.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.10.bb} | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-devtools/libcomps/{libcomps_git.bb => libcomps_0.1.10.bb} (98%)

diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
similarity index 98%
rename from meta/recipes-devtools/libcomps/libcomps_git.bb
rename to meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
index ff6820851fe..1c4f3bde65e 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_0.1.10.bb
@@ -9,7 +9,6 @@ SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Add-crc32.c-to-sources-list.patch \
            "
 
-PV = "0.1.10"
 SRCREV = "86a82fcd155c27092340d15a34f5c75c4da88243"
 
 S = "${WORKDIR}/git"
-- 
2.11.0


