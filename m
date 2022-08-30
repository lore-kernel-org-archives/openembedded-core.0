Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A70ECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:12:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web09.7742.1661832749773655854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c3gC+hzB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832748; i=@fujitsu.com;
	bh=+pUcY6UKIMv+R5Q7vDrQ5j+adnQjnoEyCjRPIpIcXBQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=c3gC+hzB8CirpCOgqdgypUkl/su6oj4n1qEQwZgqpqdLoBxm5ttlVwmWNYHlbPZiO
	 FxN9MV+Lc9XNZQbjXfibMj6dLg7m31DENM7IpVct1jGPduOgjygvfPSPFdphuiTSOg
	 0Euq5jgUQDuqT5LfsBcuVpkoNQdqonYkEVnQ7+0T9s7BbtkDCGvXa0EjwzQpafvcfl
	 TPrkPQHjJB1Yn5btYNudbhATwtnLFwtYwhUt+U2gAqG2+qf2b1cZ22oEUrDAqXo2bo
	 3lX+T7lTdZ+8a6AgEPHRCTWLWZTjuRtRykdkT0zDQ42L/LIrpirN+vSPGV+i+25gdc
	 GznO0jnrJuSnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWVe7jzf
  Z4MhGOYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePN31PMBT9EK37susjYwDhJuIuRi0NI4D6j
  xN5D/SwQzmUmifZrc5ggnL2MEm97brF1MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgJPElj0fWEFsFgFViVfL9zKD2LxA8ZZFh8BsCQEFiSkP34PZnALOEpMPfwPrFQKq+f
  jlDxtEvaDEyZlPWCDmS0gcfPECqldRYvblZhYIu1Jiz6x+JghbTeLquU3MExgFZyFpn4WkfQE
  j0ypG66SizPSMktzEzBxdQwMDXUNDU11LM11DM73EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAME4pThDYwbh33y+9Q4ySHExKorwLW3mThfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwXu4GygkWpaanVqRl5gBjCiYtwcGjJMLr3QWU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS1
  5+XqqUOO/UXqAiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3Qw/QFJ7
  MvBK4Ta+AjmACOuLhEm6QI0oSEVJSDUzRhwXy2nTzwtr7y0IWOCXxcefevu7f9fSnyfz/gXvk
  juk2H7U5c3Xx0U1nywxXz5ZWipk8T1xWWXRKyob0JRymRgclxWoyG3dsUFQXFmf31T9UlLixm
  l+pYuE+s6xtfVZFrrK/Nr3icvOtj9/rnrXCfcemNKbfPG09UtqOmYLl11qEVyzPvi9jXq/ZVr
  Cd3ZFf8t6M4t8v1T9MnH7b9RpD7BeXy8tdTihkJccK5DrfW+dWEWDGNdfm5J4q3eTdTqFCHa2
  cp249LFxQdmxr+M1QYbPwrjXHrOJnLGznPv/FdubxqZM+le+3c607bvTNx9/gWtBn+6w8sy/e
  l0SiAne9Y3idwN95XeeR+io3JZbijERDLeai4kQAmkHTcGoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1661832747!209322!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16887 invoked from network); 30 Aug 2022 04:12:27 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:12:27 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id C3A517B
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:26 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B775873
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:12:26 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:12:24 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libatomic-ops: upgrade 7.6.12 -> 7.6.14
Date: Tue, 30 Aug 2022 12:11:51 +0800
Message-ID: <1661832712-12546-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
References: <1661832712-12546-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:12:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170055

License-Update:  Adjust/reformat content of LICENSING.txt
=========================================================
 "libatomic_ops_gpl.a" changed to "libatomic_ops_gpl.a file"
 "sysdeps" changed to "atomic_ops/sysdeps"
 "This applies only to test code, sample applications," changed to
 "This applies only to the test code"

Changelog:
==========
 Add note to README that AO malloc code has same license as AO stack
 Adjust/reformat content of LICENSING.txt
 Avoid AO_stack_t to cross CPU cache line boundary
 Do not assume 'ordered except earlier write' for UWP/arm64
 Do not name GCC intrinsics as C11 ones in ChangeLog and configure
 Eliminate '-pedantic is not option that controls warnings' GCC-6.3 message
 Ensure result of AO_test_and_set is always AO_TS_CLEAR or AO_TS_SET
 Fix 'AO_malloc redefinition' MS VC warning caused by attributes mismatch
 Fix 'use of undeclared SIG_BLOCK' Clang error if -std=c89 on Cygwin
 Fix AO_compare_and_swap_full asm code for clang on sparc
 Fix a typo in comment of AO_stack_push_explicit_aux_release
 Fix code indentation in main() of test_stack.c
 Refine AO_UNIPROCESSOR macro description in configure
 Remove outdated comment about unsupported Win64 in atomic_ops_stack.h
 Repeat black list check on CAS fail in stack_push_explicit_aux_release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libatomic-ops_7.6.12.bb => libatomic-ops_7.6.14.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.12.bb => libatomic-ops_7.6.14.bb} (80%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
similarity index 80%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
index 8ea8436977..fad92df507 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.12.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
@@ -5,13 +5,13 @@ SECTION = "optional"
 PROVIDES += "libatomics-ops"
 LICENSE = "GPL-2.0-only & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
+                    file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
                     "
 
 SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "f0ab566e25fce08b560e1feab6a3db01db4a38e5bc687804334ef3920c549f3e"
+SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.25.1


