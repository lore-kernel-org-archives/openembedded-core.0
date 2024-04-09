Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280D2C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:37 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.130847.1712646636313859235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hFEEvsbj;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646636; x=1744182636;
  h=from:to:cc:subject:date:message-id;
  bh=lYjMHWPpfT7RzRa/oooPWwLP11fRHsuMVfmasacfG/E=;
  b=hFEEvsbj8px9sMzfz5YoS6g5BSnSvoE+UPZZ9N5DaYXeTeQ7RjBW/BT4
   qjJ766mQAO2lMP/q1qeuQje3mgjj9QpUOqVaIciyudpK148pZAvWwrkjm
   eumLiCqOMaZrL0ff51Nd5ax1Tnf3cHgn5oRFT/0v3vLUSBKhPhvFqHADT
   0r+cYlmk1q82e4Y+FF9h2cCZJdk5s2e6h1Iq1r1EMbn9lqbsqdzCiAkhd
   ELMvU/B3XtED2Y9q28xZHPcbpMfIOpDAK3+M22mQL+Dv6z0rNus2sPTos
   ziROxtX/M40Adge2a+rvq+SkPJiIx9CQHCNq/3uZo0zbiWATDI/BBj8EV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="133820333"
X-IronPort-AV: E=Sophos;i="6.07,188,1708354800"; 
   d="scan'208";a="133820333"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:33 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9181FDCC02
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8571AD5D14
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 190674018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AA03D1A0002;
	Tue,  9 Apr 2024 15:10:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/33] babeltrace2: upgrade 2.0.5 -> 2.0.6
Date: Tue,  9 Apr 2024 15:09:48 +0800
Message-Id: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--5.473300-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/yUIIxwDaU5mr8boZEVitthjIgofMgahPrXTv
	92h/oRdl1jypNY0wtaYzazJJCfcMapgEwrpPpXj8GYJhRh6ssevOhLimqQauQwaIV0U1S84Pd8u
	5EqsUWd+1h3Ci3ttLrfOpgCtw+YSX5uisLquWGszii75UldPq9hbg7BiLXi+XuzdiHYg4JjMGga
	FXVN25ASdqNdJtmywSzbPoUo0CxxDRhEyb9f1sjvx0ykrbAxjCRzUPAqhCjthgPgeggVwCFr8FH
	rw7frluqQckQSfdcyRIGIywrjubdRQP7xKjlK+PzuCAd7BUaraR1LeQ+VpnJdW0pkpPR1DaDuhh
	x8YYGQ9bJcQH3furV3k48PxckV+kHxPMjOKY7A8LbigRnpKlKSPzRlrdFGDwrtyN0DHIIRluBOW
	02RRT+z2GRlI0mve/CiHLa5gCeJrjV0R/wI447g==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* bt2: disable some warnings for 'native_bt.c'
* bt2: compile 'native_bt.c' with '-Wno-undef'
* Fix: src.ctf.lttng-live: expect NEW_STREAM/METADATA for inactive streams
* Fix: 'babeltrace2 convert': don't consider the '--plugin-path' opt.
* include/babeltrace2/plugin/plugin-dev.h: "define" -> "definition
* Fix: doc: escape double quote in bt_p alias
* Fix: bt2: pass _TraceClassConst to destruction listeners
* fix: 'load_module()' deprecated in Python 3.12
* tests: retry os.rename on PermissionError failure in lttng_live_server.py
* doc: fix uptream -> upstream typos
* fix: test_message_iterator.py hangs on Python 3.12
* plugin-dev: mark symbols meant to be public with __attribute__((visibility("default")))
* Silence -Wunused-but-set-variable error with clang
* Fix: Windows DLL path lookup with Python >= 3.8
* doc/man: make default values of boolean init. params. clearer
* RFC: docs: fix: Match stated automake requirement
* fix: make flake8 6.x happy
* fix: running black on python 3.11
* bt_query_executor_create_with_method_data(): fix docs note
* Fix: ctf-writer: null dereference in bt_ctf_trace_common_add_stream_class
* Update working version to Babeltrace v2.0.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.0.5.bb => babeltrace2_2.0.6.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
index 9a4007fb25..d6c75d7580 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.5.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=http
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
            "
-SRCREV = "66e76d1ea601705928899138f02730a3a2a3153d"
+SRCREV = "0a6632f77801f3218a288604c646f8a39cb0d2c4"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


