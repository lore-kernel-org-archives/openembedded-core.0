Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5EWTQA5cMKs+ZKHPpZ/BzjboLwz6lVUFip5oMh44+PStsN5ROFGr1kCSfC4fzbfREP8odQ7pAB
 n0o275O/llmA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:58 -0700
IronPort-SDR: QphN7OH/bPGXMTc8JBAeTeGc6srryAhFpP/Ii4e1enV4nzDQRFcXhk4qN2vf0D5ofFA0hpgl2x
 gkjFnONXf6EA==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621866"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 7/9] security_flags.inc: fix flags missing from SDK toolchain
Date: Thu, 26 Mar 2020 16:53:34 +0800
Message-Id: <d6df153991c91a1a14b561b3af52dcf96b73e6d7.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>

From: Tom Hochstein <tom.hochstein@nxp.com>

The security flags were missing from the SDK toolchain
because they were added specifically to class-target.
Add them to class-cross-canadian as well (since the SDK environment
file is created from cross-canadian target flags).

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Antoine Manache <a.manache@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index aaf04e9..568d036 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -57,6 +57,8 @@ SECURITY_STRINGFORMAT_pn-gcc = ""
 
 TARGET_CC_ARCH_append_class-target = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
+TARGET_CC_ARCH_append_class-cross-canadian = " ${SECURITY_CFLAGS}"
+TARGET_LDFLAGS_append_class-cross-canadian = " ${SECURITY_LDFLAGS}"
 
 SECURITY_STACK_PROTECTOR_pn-gcc-runtime = ""
 SECURITY_STACK_PROTECTOR_pn-glibc = ""
-- 
2.7.4

