Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 810047382E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 12:58:33 +0000 (UTC)
Received: by wiwl15 with SMTP id l15so14637891wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 04:58:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Vq1Y/4Y1zqtUM7kjjtl6G+5Hh59Sn+Jsg3Y138PVx+Y=;
	b=SaQe32rfOmBt+7rDq+8ctmQa2slhmoDKDZJZ7JuWmx2Qkc+vFaPGNqbNAr5HxBV6xG
	OgmQulRUb6kjrj75rVIR9ZIJfaitPpRzEPJinDFgi9Ck90vlm8LoG++ohv3MdUqG8pmD
	77VNFA5yMMq0pOCBVPM5vngAOye+8iBn1tSzIxH5o1fIFzHtAg+Wa3LG2ZVuK1A7on7x
	17sIL5Ws11VHG5KwD61XQBzfV5+mZBxIikyPecjzYLFOUAoh+uSJvahtk2G2q/V/Ji6D
	xHFU0WMLfTf1hM/2wyjNzJpsaqfUG3AnNqSU0PgwBwiatSKLuw9Mo4vFUrnW1AMQTe7m
	Yzxg==
X-Gm-Message-State: ALoCoQnMNEI1u2ulyFfFH1BFGIT9KBCpE2rvL9Oo937zKARytQGUQbgT4xQ/W8L9GHwPhdozdIFf
X-Received: by 10.180.214.99 with SMTP id nz3mr36216880wic.82.1425301114286;
	Mon, 02 Mar 2015 04:58:34 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id hs7sm15971808wib.4.2015.03.02.04.58.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Mar 2015 04:58:33 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 12:56:06 +0000
Message-Id: <1425300967-22557-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] security_flags: remove PIE flags from flex and gstreamer1.0-plugins-bad
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
X-List-Received-Date: Mon, 02 Mar 2015 12:58:35 -0000

These recipes both fail to build with "relocation R_X86_64_PC32 against
undefined hidden symbol `__init_array_start' can not be used when making a
shared object" when using PIE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/security_flags.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 16a5748..f3f0082 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -29,6 +29,7 @@ SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-enchant = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
@@ -43,6 +44,7 @@ SECURITY_CFLAGS_pn-grub-efi-i586-native = ""
 SECURITY_CFLAGS_pn-grub-efi-x86-64-native = ""
 SECURITY_CFLAGS_pn-gst-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gstreamer1.0-plugins-bad = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
-- 
1.7.10.4


