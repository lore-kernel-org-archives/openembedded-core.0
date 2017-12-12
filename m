Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5B56678882
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 17:23:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id v26so14689901pfl.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 09:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ufwotM8DOYgQgTeZTMqvSbdfex0tvkbOIw3Ulg/y27c=;
	b=naDq6erSZfEjBKQxZt+QPe0+RuHiVfaPOLav4DHeEIdTlTwgszojI3hTN6P6SVQvvQ
	B96lWFeKm6eCmepwXAiIITpFTxBVCsL70oaxbK7YfB1HXKj4e2WSXdewZYRGRRdEE4zr
	b92TPyPP7P1EMMTVX460uSLX6LcvUIwnHDJHw38xGtpO0bTBIUoiSzG2IqAP6+VmIf4R
	ftIgOLrYN4te9TRvPVbuYHBk398VCVH65uxStSzaDnMF+2dgQDdtzKZw63SxwGiJbKeC
	fanZgMajc68b4xser+lBDwbXMHlrxvgHjrHJ4MtOsnjg1fAA7Otq6BK2Nn/+obOp5wfs
	2ieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ufwotM8DOYgQgTeZTMqvSbdfex0tvkbOIw3Ulg/y27c=;
	b=AEPYNzRrC8iDIKgkguxAn7rpgh2aKNusBHld1FzlI1T0MsIc6CRcx5h/hrUkijexzH
	4oQrpA17JHQckfbPzuk9iswgGNgiquIa0olBVvTu+POK1gNfN26uQF1fgwtbeW+K0ifo
	RQysXeBBdOQtjKrMQyurSPnL/Z6Nz2WJefywa4Zco8FWk9RiwWsD0BXzcV7PtOkDIgOR
	YNgKKwiNBaN2niBDPPVWxGDEcjU02L8gmYXxh0jLk/+Fusy1zh8/3A3PczRhPzH2ZYUi
	uSPU+eeEjXcj/xOEhao/z1gsW88B49Nq8h69Jckj4aC0nnjxlVi+81WBDO6Ifa9KaD4Z
	zAzA==
X-Gm-Message-State: AKGB3mKEHiJIW28EeDHrjpNsYy9ChP1u+2yP5ueQxHc32aiarHl8Sfq9
	3MrFECX8xM2Ur7r9uyr/ouSwfQ==
X-Google-Smtp-Source: ACJfBotpRthzihpQwOtiMpBLPoTAH9DbolMhly+nyB4X7f0s3GcSHfxe45YzNWm1nzRBGgx09Y1PoA==
X-Received: by 10.84.242.69 with SMTP id c5mr2918451pll.73.1513099407087;
	Tue, 12 Dec 2017 09:23:27 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id
	k197sm18790329pga.42.2017.12.12.09.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Dec 2017 09:23:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Dec 2017 09:23:10 -0800
Message-Id: <20171212172317.601-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171212172317.601-1-raj.khem@gmail.com>
References: <20171212172317.601-1-raj.khem@gmail.com>
Subject: [PATCH 2/9] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Tue, 12 Dec 2017 17:23:26 -0000

This makes it easy to override them in bbappends

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.29.1.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
index d92bbbce5d..07a72e2b5a 100644
--- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
@@ -18,9 +18,10 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV = "90276f15379d380761fc499da2ba24cfb3c12a94"
+SRCREV ?= "90276f15379d380761fc499da2ba24cfb3c12a94"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
-     git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
+     ${BINUTILS_GIT_URI} \
      file://0003-configure-widen-the-regexp-for-SH-architectures.patch \
      file://0004-Point-scripts-location-to-libdir.patch \
      file://0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
-- 
2.15.1


