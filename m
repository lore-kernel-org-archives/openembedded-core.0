Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 245066AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 14:35:20 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so68449354wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 07:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IC0TpdHj5lsivhZwWvvKlgIkJ722D+mwFAS8lWS997Y=;
	b=MSx/KuNTVJFQrIDU+1v9DzwF4OzhuRlgy7uUZk1Trtqom6h8RmE5t5u83Q2IppWkH2
	xm0DzFkxkRbccl5dgoZMxaypLlMLoaQSesuheUpTqbuRwpG+haLrO+9zLp7TbkbT3Z38
	4gB1NnSv2YH7QDVAXXGEz78urLhUE/EqWSVa+RMsoa9kyuGzZFaEHk9Mkcryt5XWe7r+
	qkwRuDm45wSeOpEvOJ03fSAOW0CUFGrIY/ppGSwsnEVXNEsoaAY887+LiuqpqFdkqxaT
	/goAwwn5wHPVg/wOaMk64r113EiLFfrhw9B5l9KeVbAXfMX5WryqOr7myKOd+d31jZFU
	dYUg==
X-Gm-Message-State: ALoCoQn/CwAo3IidHXOrL+1adTmLBLdrGZMTG9jsCWhBT1uof3YPGBchlNF7/e2Yzqbmk2aESBDd
X-Received: by 10.194.77.179 with SMTP id t19mr60479723wjw.30.1435070121260;
	Tue, 23 Jun 2015 07:35:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z9sm12982900wiv.9.2015.06.23.07.35.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 23 Jun 2015 07:35:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2015 15:30:02 +0100
Message-Id: <1435069807-13557-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
References: <1435069807-13557-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 1/6] eglibc: WIP fix paths for libexec
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
X-List-Received-Date: Tue, 23 Jun 2015 14:35:22 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 984362e..2425c82 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -35,7 +35,7 @@ libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${ba
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
 INSANE_SKIP_glibc_append_aarch64 = " libdir"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
+FILES_${PN} = "${libc_baselibs} ${libexecdir} ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
-- 
2.1.4


