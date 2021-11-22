Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66A0C4332F
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 14:58:58 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web09.7401.1637593137713391532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 06:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iwG1uNSN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593134; i=@fujitsu.com;
	bh=8cRdlSM/5C9D97N5sW66e+hTRA3cMyR2yB7X7sts85k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iwG1uNSNaikHV/ofvgvbd1k17KF4n3c3gJTQm5SuIoHv9ohCV3emPE0VDF60ihYYu
	 VhWyP/r+dRl41VHqIrnshKNHKH8N229wWoTZYETYPIViq/Iv8W9bts7Wkhmz7NSpo4
	 co5bTjaaSU3DIbJfV13UOgJBPDhhsO4G8CBtH5KACysa3KGwst2c8M5ADsmA6NEEqz
	 wXdnx8s4n+zlD0oTdwbknF5dPE8FIPSK+hA39RPF22U78hQmaa/kCSLyN1d9FOeV7Z
	 MTJeEqm1M1qsAeAXutrG4qE1cY2bdVgt5JrnG4FW7CgS7Xheu0rOREbG6b6WSLnklP
	 uxKw0FsOsCzCg==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id F0/F2-05531-E20BB916;
 Mon, 22 Nov 2021 14:58:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSVdvw+x
  Eg7+b5Szu/HzH7sDocW7jCsYAxijWzLyk/IoE1oy1r5+xF8wUrvh1ra6BsUuwi5GLQ0jgMaNE
  +74jLBDOeSaJB+1NTBDOCUaJX3unMXYxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfP
  ewgYWEBS4mnc3xBTBYBVYndS7NBKngFnCS6tu5mA7ElBBQkpjx8zwxicwo4S9xesAXMFgKqWT
  XnEiNEvaDEyZlPWCCmS0gcfPGCGaJXUWL25WYWCLtCYtasNiYIW03i6rlNzBMYBWchaZ+FpH0
  BI9MqRvOkosz0jJLcxMwcXUMDA11DQyNdQ0sTXTMzvcQq3US91FLd8tTiEl1DvcTyYr3iytzk
  nBS9vNSSTYzAwE0pOOS0g/H96w96hxglOZiURHmNZs9OFOJLyk+pzEgszogvKs1JLT7EKMPBo
  STB+3gdUE6wKDU9tSItMwcYRTBpCQ4eJRFeB5A0b3FBYm5xZjpE6hSjLseVVUsWMQux5OXnpU
  qJ894GKRIAKcoozYMbAYvoS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEee3XA03hycwrgdv
  0CugIJqAjTh+fDnJESSJCSqqBaaVz9j9dGbYu1/59AQ4TLv/wXFTH0sJ/yzEiNOTa5yVzGy8e
  EZ/kxbdEcEnYn+nPmtfzlxjfmJ/PlMY2Z8KRE02qph/fbjxxaN40jc+uy347ly7Pv9qmsfbgs
  iUT0x6uWqChtPKSvtunm3630vQWXev5qhsg+Xd2Z1gIh9AxywALBc9CFTP3jfLf79XU/4i4af
  khkN9Z16pbZH3I8f5L0vOvbGPm1ExRnODbc2lq3cs39bYXSpL/8Rr0a16NZ/wp5xgV7fGHS6S
  yXb/3RdBX3Ued8vrfpdcaxe/eHOq4X2V+tDGXiEBX12b+r5uUXnrPexdXzB6v+J31il16tsCk
  rlDdozlZWRbPg7M7FiUrsRRnJBpqMRcVJwIAmsSAaGMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-271.messagelabs.com!1637593134!426702!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21613 invoked from network); 22 Nov 2021 14:58:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 14:58:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DE99E100478
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:58:53 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 918F8100476
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:58:53 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:58:50 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mesa: upgrade 21.2.5 -> 21.3.0
Date: Mon, 22 Nov 2021 22:58:32 +0800
Message-ID: <1637593113-99188-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
References: <1637593113-99188-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 14:58:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158573

New features:
VK_EXT_color_write_enable on lavapipe
GL_ARB_texture_filter_anisotropic in llvmpipe
Anisotropic texture filtering in lavapipe
VK_EXT_shader_atomic_float2 on Intel and RADV.
VK_EXT_vertex_input_dynamic_state on RADV.
VK_KHR_timeline_semaphore on lavapipe
VK_EXT_external_memory_host on lavapipe
GL_AMD_pinned_memory on llvmpipe
GL 4.5 compatibility on llvmpipe
VK_EXT_primitive_topology_list_restart on RADV and lavapipe.
ES 3.2 on zink
VK_KHR_depth_stencil_resolve on lavapipe
VK_KHR_shader_integer_dot_product on RADV.
OpenGL FP16 support on llvmpipe
VK_KHR_shader_float16_int8 on lavapipe
VK_KHR_spirv_1_4 on lavapipe
Experimental raytracing support on RADV
VK_KHR_synchronization2 on Intel
NGG shader based culling is now enabled by default on GFX10.3 on RADV.
VK_KHR_maintenance4 on RADV
VK_KHR_format_feature_flags2 on RADV.
EGL_EXT_present_opaque on wayland

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_21.2.5.bb => mesa-gl_21.3.0.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.2.5.bb => mesa_21.3.0.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.2.5.bb => mesa-gl_21.3.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.2.5.bb => mesa_21.3.0.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.2.5.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.2.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.3.0.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b687f8e4ab..ed60d98250 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "8e49585fb760d973723dab6435d0c86f7849b8305b1e6d99f475138d896bacbb"
+SRC_URI[sha256sum] = "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.2.5.bb b/meta/recipes-graphics/mesa/mesa_21.3.0.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.2.5.bb
rename to meta/recipes-graphics/mesa/mesa_21.3.0.bb
-- 
2.25.1


