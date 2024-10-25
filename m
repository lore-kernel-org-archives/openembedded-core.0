Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31978D11710
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:40:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.5569.1729834797808071354
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YVQdJaF6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1729834798; x=1761370798;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ndgGTNTRnFMuqsjj/ZvBb3pYf93e2L3PMib/s8Y4g3M=;
  b=YVQdJaF6KZ976NwFDV/Y1rfxBmr3+8OYQLSuCdFvTszfnsqrK2Swpf1F
   SZ+MRQ/FKSsjPT5b4qC1nF5iAjvxwzRd6EKyJSevEoUEZkpk4uA3QjvwQ
   6rdy1KckIrJJFZ7wvIUKMdGIYJuO7bp5//BPU6lSEK18DCQIDpOBMQIT4
   NR3uhOokPjejC1cobKXPlf1osqaBipwcS1WviqWCWHP/c2x9BB5P49tdS
   Ub8y9yzwuiMx2jsxi5p3CPiO81SGQFPqaniNW6udTaIEXaW2ICuI6GRlb
   t+8HVxMlQpAN5+nRFMRKVQtZhxAuUtkQbfNF3pn9ZSxvRxwHIV+WZoMMb
   g==;
X-CSE-ConnectionGUID: gLo96gnTQwG/u+pGlYxyIg==
X-CSE-MsgGUID: NALXi2kVTPCUMYmOVWKD9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="177969170"
X-IronPort-AV: E=Sophos;i="6.11,231,1725289200"; 
   d="scan'208";a="177969170"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 14:39:55 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9799ECA1E9
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id CD323D4C30
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66BE341050
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:39:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 11E871A01E9;
	Fri, 25 Oct 2024 13:39:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/22] less: upgrade 661 -> 668
Date: Fri, 25 Oct 2024 13:39:12 +0800
Message-Id: <1729834769-4717-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28752.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28752.005
X-TMASE-Result: 10--4.751700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrQR7lWMXPA1t4YeSlHZYFog7t
	FvCWixbmOizVMXf88OqkUIaZS9ssK5NeSFI51cWDRynTwl9ZYh6Siza26cvwNEfF8UWUKZ+BILY
	VnX0ZmF6LABgkiw4rilaGmH63IY9RR7suMn39hmP8dMpK2wMYwkc1DwKoQo7YXGd7YVXzr9UhS0
	ofkAkz2SL637QCIVpi8vc3EUpCmrVTqTvkr4no8CsIuzCLc2mNGYkyyELuGKTfc2Xd6VJ+ym0/5
	xIcSdKr4vM1YF6AJbb2xnRRfQRo4hZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDmQhK6CMXcnBfa0K
	w/TiTq+IwR2EyoHMg27XfWCbztvGjAILQmt6Sa8+FOoRnpEduUdCw36HEVQj2NWVVLU+V4eIrGo
	dwUBW+4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206314

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Make 256/true colors work better on Windows without -Da
* Fix build using --with-secure
* Fix crash when using --header on command line
* Fix possible crash when scrolling left/right or toggling -S
* Fix bug when using #stop in a lesskey file
* Fix bug when using --shift or --match-shift on command line with
  a parameter starting with '.'
* Fix bug in R command when file size changes
* Fix bug using --header when file does not fill screen
* Fix ^X bug when output is not a terminal
* Fix bug where ^Z is not handled immediately
* Fix bug where first byte from a LESSOPEN filter is deleted if it is
  greater than 0x7F
* Fix uninitialized variable in edit_ifile
* Fix incorrect handling of UTF-8 chars in prompts

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/less/{less_661.bb => less_668.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_661.bb => less_668.bb} (95%)

diff --git a/meta/recipes-extended/less/less_661.bb b/meta/recipes-extended/less/less_668.bb
similarity index 95%
rename from meta/recipes-extended/less/less_661.bb
rename to meta/recipes-extended/less/less_668.bb
index 061a494f0f..63fc367e33 100644
--- a/meta/recipes-extended/less/less_661.bb
+++ b/meta/recipes-extended/less/less_668.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2b5f0167216e3ef0ffcb0c31c374e287eb035e4e223d5dae315c2783b6e738ed"
+SRC_URI[sha256sum] = "2819f55564d86d542abbecafd82ff61e819a3eec967faa36cd3e68f1596a44b8"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.34.1


