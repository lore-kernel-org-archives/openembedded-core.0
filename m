Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1469.1795801790215358016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=AugZEBOh;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so5934698f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801788; x=1796406588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TbK3sA41GjV8mdIiwpbxSDsaJb0zTFEFWN7nm5uHXr8=;
        b=AugZEBOhiKPg3YE0xoarNQHxFMWG0EDDTrlNEM4nEtw8rKAX3k+dgcmEIkcV7KD1Q9
         8opQB9j+RfsQBU23UEZ0BNf1R4gLv3c0efv/tagQX/uJc7hUL6IBgEMiHNeQEyRmKcqW
         GWV9E1tf8YdJsHGv5a4C5PqorDxI5V3ifRJlK2EDZqIl1TzeV40vZ/zhqSBxS4geM0H0
         vuPU+DIBcsyHuAJfmjdd3dSR3onqTJj29JvhGXdnlbLrXgm2A+YXHA5P0smw61Ywwry7
         6tk5DcWLpPmsMOFLFyVnQWV5V45J7H+NTzXLg0IT27MWMNQLk061LkOCJbpPnEki/wDh
         ryiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801788; x=1796406588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TbK3sA41GjV8mdIiwpbxSDsaJb0zTFEFWN7nm5uHXr8=;
        b=T7ebqmwblAe8hvz5nW7s9L+jUJg0uKj2V40+ul090WkeDPUX7SfJyydL9iO+WHEcWY
         e+ZTffcQmnXolb6qESSCOkWCfajSN0Rymci2JbHh+V7N0TsfgO0W5fjd4urrQXAu1dZ8
         s+01VBGtaRcE/Ty0oLbFMoV923hNmcmY6138wyf4PAAVloW7E62xVm8hYjFOqXier+DV
         V7yFP/DZ6eBGAsGnDyw17rXl54ki2Aoo6s0oHO/1T2RFLP7q6pyyGU6oiundp4+2jjXB
         OXIji51LClnWsxuKzrd+Jnozo6cDeNzahec6EXom7eqgdBWKOk6cJwrFnLRau8r14zmh
         aCeQ==
X-Gm-Message-State: APuU4Z+5a4DMRcJghMDCEQMrdwFhpGcakf2UH3nZkTmVqsRHIr0wOGGs
	CM9iIkEzJ1pQNZNkFJettp0OMow6LHJJYcIdXL92Wio/meEH5E+N7qVimOg+jMvqslj8Ahqt/g5
	z5wMEHtY=
X-Gm-Gg: AZFdTZeiMnFezjx3Z3oEwVNx6mc22Ig5XbNfru/P6zhGB6RwCAuf9bl4iyyukJz5N+6
	T09taXq2H3e7O9REgpmVYAkbUEMDJLTrwLXrNwWznIa0P9zoH0rN02lj/lbx2nQ7eopO5prbhMg
	WnOW2fizUny01lUQ6wr1HfC8xIEbReGQYJu2imJP94rufboFbK8HcSqQqw4Q/iCNhXEgtRRxuG9
	POSKvOcxoLMY4JpELQCFIkTuwMHnzMWzmu2wj+DBpdWPT3MQg4+e2STxMupYH8mEiIZzmtKvlpq
	njAD/p8LwpPyPE8lHh8wUC70H4v0aJve3BkZYm6VRlxuBJrWR3BPa8Zd98fnZ+ygwE4Cs4WyUOC
	lQ6iHfaJo3yeGxjMDzDJpdTra2KVPDNybxQc7efvctZ6oZJlRH2ZK5XO0ZEnk6zNXjoC6tK9nCF
	u3P2u5KFXSfenfhWlj7RFwXx7LPngdnip1adG148sSAy7FxiGv3xRK0cwArXM/Zi2oEdRfbTuf6
	WBrWhoybPM1IClkvHqL0yCvz++lC2U0ccpRRpcwwH45biG2H0wYROE7AMk9wITMNQcgivPC8GlT
	kum9A0hK0hgfQzh2OQj2BcPrwJLq8WviQN3Ak/HxT0Qn6fBJdQNq/i4uE5TAGzKFTdozViYjyXG
	F3bXFl7HOXgv9Ars2PZSgm2cEKGsAhVFUG2/bKuQ/F/7G6FjlDg==
X-Received: by 2002:a05:6000:2903:b0:49d:7e8c:e8a2 with SMTP id ffacd0b85a97d-4abb244870cmr55469719f8f.33.1795801788366;
        Fri, 27 Nov 2026 09:49:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/37] linux-yocto/6.6: perf cs-etm: fix a compilation issue in cs_etm_decoder__set_tid()
Date: Fri, 27 Nov 2026 18:49:08 +0100
Message-ID: <329969d7980584242f2c9adea2cb851eaedcb1e7.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251431
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/6.6:

1/1 [
    Author: Valentin Caron
    Email: valentin.caron@foss.st.com
    Subject: perf cs-etm: fix a compilation issue in cs_etm_decoder__set_tid()
    Date: Mon, 9 Nov 2026 18:14:57 +0100

    When compiling coresight tool with the command:
    make -C tools/perf CORESIGHT=1 all

    The following build issue occurs:
    util/cs-etm-decoder/cs-etm-decoder.c:551:15: error: too many arguments to
    function 'cs_etm_decoder__buffer_packet'
      551 |         ret = cs_etm_decoder__buffer_packet(etmq, packet_queue,
          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    Fix this by removing the parameter "etmq" from function call to match its
    declaration:
    cs_etm_decoder__buffer_packet(struct cs_etm_packet_queue *packet_queue,
    			      const u8 trace_chan_id,
    			      enum cs_etm_sample_type sample_type)

    Fixes: 99d324594165 ("perf cs-etm: Queue context packets for frontend")
    Signed-off-by: Valentin Caron <valentin.caron@foss.st.com>
    Signed-off-by: Sasha Levin <sashal@kernel.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 22 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index eb44fdc10af..73f136c1280 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,7 +14,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7593447608d70ada4e27630e9047fdf459b3fd6f"
+SRCREV_machine ?= "259b95b0821202a0da8c3f8f5d571619e5f13b11"
 SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index d39247e3314..fe975d3e425 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -17,7 +17,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "33978ed066431901d7e235059590916deb73fa28"
+SRCREV_machine ?= "ad54989725c77d1d5312143337fa27111fc552b1"
 SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 PV = "${LINUX_VERSION}+git"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2a812631ae9..32180461f65 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,17 +18,17 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7fba77c3443f7ffb974bca08c44cd741ae422baf"
-SRCREV_machine:qemuarm64 ?= "b98967f55ff0be50f7ad0dbcc5938c76278d96b5"
-SRCREV_machine:qemuloongarch64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemumips ?= "6a6d5067d6dac276c4c0d0829a0483d47b67c7de"
-SRCREV_machine:qemuppc ?= "da6b28016510be8a0c0ecdf864f48d2a1851ab71"
-SRCREV_machine:qemuriscv64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemuriscv32 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemux86 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemux86-64 ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
-SRCREV_machine:qemumips64 ?= "a1afaf058fb596aa7e7750378ccb3f9b77297256"
-SRCREV_machine ?= "3ad693476cb4cc113480e15b2ae7da1e432b5262"
+SRCREV_machine:qemuarm ?= "998bdbd96cbad13521429c68b3563c11e3a467bf"
+SRCREV_machine:qemuarm64 ?= "cd681556b87360f7c06f363e014ae9b45c7cdaa6"
+SRCREV_machine:qemuloongarch64 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemumips ?= "3bd41d59cf64bbf5148da6494cda59b9699e6552"
+SRCREV_machine:qemuppc ?= "2044f334db4be041f163eeeb1823d250910b7c34"
+SRCREV_machine:qemuriscv64 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemuriscv32 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemux86 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemux86-64 ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
+SRCREV_machine:qemumips64 ?= "de116283909c1f4a20cafc24d9aaca1b2cd0f002"
+SRCREV_machine ?= "4631166882bfa8bade7427e732d9fdd64ec98c2b"
 SRCREV_meta ?= "e6abd7216734dffc4233c1cba3d5ab79175d19aa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
