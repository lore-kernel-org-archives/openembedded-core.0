Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 741A67DAD9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:28:07 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id cb4so242627plb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+DZXR8A2Ut7FLt2HBuWHpkWHGzMZ7U5DoP5KXuJk0z4=;
	b=pefsYBL+u3kgRt+jQGM6YzsOZl8LTEfbl1WA8ri/LZmz+PpaaTsVoUpsGpOBHz+0yh
	TmXhQ+8vsZZZcMOkslulbLlOutIXxsxAMvoUovp2EvxKqEbWVodp9wZuzS2kF9+lANHc
	rKp4PwGoDBwkbj8jzULGcz6vEtzweQqUqIh/mJ/HeEsQHEdnInbVlMJULmILSk0tMfVG
	M8fvT8Z6C5QgNgsS7Nnnh1mqc2fPEcwF/MJPRm4yE0mwtyA+NWFD7mJJCxIZuHQFylCl
	aXgFaZp1OodX8EXRPQ2oTcoXhztkn575WUBhiFGy2fpua08YePRrMvpAK0VwEzcnkTTb
	o3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+DZXR8A2Ut7FLt2HBuWHpkWHGzMZ7U5DoP5KXuJk0z4=;
	b=quqJiozcyqH5JQ2IcqeBiD9LqX8wlVsL7GY/MtnA00khuHMh1WAkpqleOtt5J6tvi/
	p4CDHypTVjkolQqE949970kZxJaD+2NJKJrANdFGZ6L+Ux7LaGn+LT8cL3DB4a0MOJpl
	IdfECO+kPpobv6U525nWzc94N0AZxLFNQE6Lbez3eFaF2CwRXNst1x1aHjuZz+LQLcE9
	Q988dvmIV6rF4WCIAC4L3iI4+RAbaePmFqRkRxwdnjIlGWssmAKUOCS2qIowCXyNq95n
	LU4P+h85+z1RXA1x+15Woe04ZvMa2RrLOgd9LUwf0Vsb9JwKXRPQJSSdPZnIWShKFD7p
	vS8g==
X-Gm-Message-State: APjAAAXgIMPjuuU5F1FlamgXxRWzk0hGs89YrU0sloQ1lV4c+j7JB2f5
	bMcnES/PeeyhJkqJeh2YCHuZ1kBJ
X-Google-Smtp-Source: APXvYqwO/llZ3Oq/b3ILLrBCcEJLbBzhx5x6q6fqmz1HWffa9k57mmXRkkO0GtifRi78+uuojDceiQ==
X-Received: by 2002:a17:902:9a4a:: with SMTP id
	x10mr19026040plv.113.1556983688614; 
	Sat, 04 May 2019 08:28:08 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.28.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:28:07 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:27:19 -0700
Message-Id: <2a4ae609e4d1ed51a1aab08c13278a058910eff2.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 43/43] linux-yocto/5.0: update TCP patch to mainline version
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
X-List-Received-Date: Sat, 04 May 2019 15:28:07 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the SRCREVs to drop our temporary workaround for TCP
timeout issues and switch to the mainline version:

  tcp: add sanity tests in tcp_add_backlog()
  Revert "tcp: fix issues relaed to implement coalescing on backlog queue"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index ef3f0a0..54f86da 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a3309af7ab77156bd8d731df3a97126d3d897916"
-SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
+SRCREV_machine ?= "494384666b623a23e19cbbc54574d08e31496a03"
+SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 206e6c3..7201921 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d905ae925fc4a60d63f45e1922163da683d8a3bc"
-SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
+SRCREV_machine_qemuarm ?= "f07da0a13d6f503b72594776b5e8a9795da6d6a0"
+SRCREV_machine ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 4ccf907..ae8f643 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "17c4b7e9db4d17aa713c85d0c3d2d84af962864a"
-SRCREV_machine_qemuarm64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemumips ?= "e5c23fb31438dab373a50afc40f6e4ab0c568485"
-SRCREV_machine_qemuppc ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemux86 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemux86-64 ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_machine_qemumips64 ?= "743d799797ad6828472087e1da8c67fdab87bf75"
-SRCREV_machine ?= "14b6c1fc020fa357245e9ac9c6c69d253bc7ce30"
-SRCREV_meta ?= "2d838e11b084a96dd70e5cc0fec01d2e492f72c3"
+SRCREV_machine_qemuarm ?= "99f3821bdc8718af3ef6e96d594b593d644ab2e4"
+SRCREV_machine_qemuarm64 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemumips ?= "1128cfe6c7915535c4066b75342c952640e65d72"
+SRCREV_machine_qemuppc ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemux86 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemux86-64 ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_machine_qemumips64 ?= "55e385d52db438df1ff7ad3845c9076b2bb221eb"
+SRCREV_machine ?= "891531d68e5101bf64be1cc1cb31e3d1255cf382"
+SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.7.4


