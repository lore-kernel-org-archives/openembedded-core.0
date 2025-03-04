Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A0AC28B30
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.18201.1741079370122954640
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bXJ1GfeZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079374; x=1772615374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WwvWZt5EuGw7NLM0SK/mfNbjjy9w2WyofRPD61s880o=;
  b=bXJ1GfeZaWluG8CwyXJJDUcCrribU9OMtYtM0HjOmnwrs/5rVLAsQPXr
   46ZzcjfVCvLA8pW8DnlG0fTmb2/n703+Hi0y/dAVVeQ7VPqd7roUhbo79
   VaLzuZtnZi4vSLXkgw4TNTaAdqyCFVJIrYJWrZMg//LvLEgqEx1FpLrtb
   l3VP3EmtSrR5tAMWREtbGNwaCf8YfntwaU6smdpADzThHmTBHznp3f4At
   2AglJxx3pGGqf5PJ5oyd/OHGWREYNx0yf1qs9XDtC5pRPSlIoTmgrm9J7
   OnUOVNeNBMI7Z1f7gU44TGf+5etzdZiStGDog2PbMMauyx7PDMzpkir5D
   w==;
X-CSE-ConnectionGUID: n7n9LJU6RY6Nf5tlkq7Wlw==
X-CSE-MsgGUID: 2aVsNioNRqiuj0nYQAxm1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="191869485"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="191869485"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:32 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE6DBE9F12
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 946F4D729D
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 525C21A009A;
	Tue,  4 Mar 2025 17:09:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 21/31] python3-pyelftools: upgrade 0.31 -> 0.32
Date: Tue,  4 Mar 2025 17:09:06 +0800
Message-Id: <1741079356-13445-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212247

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyelftools_0.31.bb => python3-pyelftools_0.32.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.31.bb => python3-pyelftools_0.32.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.31.bb b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyelftools_0.31.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.32.bb
index 0774caafdb..13e9efff8d 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.31.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "c774416b10310156879443b81187d182d8d9ee499660380e645918b50bc88f99"
+SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.43.0


