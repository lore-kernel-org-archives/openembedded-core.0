Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8F65372608
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 12:42:52 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so20572766wev.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 04:42:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=s7r0ohdRs5e21KFAMJHwTRRO1+wCPpguqxw2Cu2RLSk=;
	b=fk9v/XB6Kxbq3u7e3KJQr6Sn/9XTAjdi/RCNDzd500NODf54TaorlXG8Vkt43yfDe6
	S+/xjMwfiMsry7bjWj1USxWw9XGleHRaLE0YOFc82y/z/o2d5Z9LE/ASxjn7U2/yrzUm
	8YAxnm12UI+0mlxQCIi+l49+IJ7WagHzgDwxydCim9ZqAhlYDdxl2Pb/LErtrEtXSRqK
	kZ/hAR0KAxg/HGY7zeoFUFWcqzV8aSPQcyWwgxSARhBffYhmjpVATdUK5J1igRnV70RW
	f0X4FJCR1KJcWMOSLUnjzTpM6JsEHC5ikGVjf5BTIPxDXL8rEY1A5IlxGuicI2v9sfir
	OslA==
X-Gm-Message-State: ALoCoQnqnXg26IKC6pa5uqb/j6fUJR52/S64t/jEHKfwoV46uRTVSntjfPSnSNnrsFPByE0ZqTEX
X-Received: by 10.194.173.233 with SMTP id bn9mr6876196wjc.123.1422448972995; 
	Wed, 28 Jan 2015 04:42:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id z13sm95129wiv.8.2015.01.28.04.42.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 04:42:52 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 12:41:07 +0000
Message-Id: <1422448867-9744-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] security_flags: disable PIE on expect
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
X-List-Received-Date: Wed, 28 Jan 2015 12:42:56 -0000

Disable PIE in expect as otherwise it tries to link the shared library as an
executable.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/security_flags.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index f996184..033638c 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -27,7 +27,7 @@ SECURITY_CFLAGS_pn-directfb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-glibc = ""
 SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.7.10.4


