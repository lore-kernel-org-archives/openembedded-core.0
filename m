Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 22D0F6D2AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:08:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r10so6122106wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=f5seOtDxv3xLTomayUjjxe7cQElKRAze6e4hs7Vv+Lc=;
	b=fXozfuR5V1UjG0wsMoLQG2EyhL7vmGCIlBPiWoCMYwzsQR2ZgKzPK9FFFTngr5PgMt
	nUnPUcA7A0rluMoA9C2H9YF41dB/Ibo4stpqW9O0S1BCNgA9sOgoMIXrY+6fciddUjbq
	rsth85JNJM/F6HAqDMFvRTZSbV8FSU8YhUQcu0L/rMAxCwSTzfuOaqW6SGLlgMfC5lr6
	t00tg0Q2Pm+r0o0SzmcBHXp13FE69r5SeKol9Xx72k3KsLqZX1lifiaDle7vn1gAE+Jr
	YIe+ehRKkl/kTZFMCDeanEoMP5dVn3AR5846oUelVVvEHW7jKIOZK/CitriEGdDD/vY4
	QjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f5seOtDxv3xLTomayUjjxe7cQElKRAze6e4hs7Vv+Lc=;
	b=P7eiUf821tNBGmvTGKEuGC8m+fpV94q58D3QXUF6jCd1d8K5Q09PRkTrTozcjkvzfP
	f/9/YYDXHsI6jDyVq4/fRQ2qk0DEKcwbBnawd5ea57iVSJHxvihZE/jCDw+lLecgCa73
	aEnEpcxNgLmsHBmLDpgHqO1srAoJKpp8htNbLkSJKAIdfEz4xcffME+vI5IFaaJeR6dZ
	kwrAsc8UO8O/9f+LQmaXlEzn9sxPNGxMmxBTw3okQijSI/PlsSdSjbtRL2N5C7ZsZcUI
	NAQwCA9DgTrSy0IslAJ9OPAJq23ay0nKoEeyJzSFNQd5TlHR0+VFRqZ7IaXnDfw3bGE2
	rY0Q==
X-Gm-Message-State: AA+aEWaRFQi3G+znZ3nCf9PckS1BGYjl14agAAmf4cwipZQhVa+Ia/9c
	7on7D5CnvYscWNObt/3UcoSKzB07Nu8=
X-Google-Smtp-Source: AFSGD/UPj1Ywl3T2pUJzuysfoX9jMfKo1Okzj2rjS7+W0nEVED4VZg69VhbwQ4xeD4xoxNfN4lV0dw==
X-Received: by 2002:adf:c711:: with SMTP id k17mr3128149wrg.197.1544807332547; 
	Fri, 14 Dec 2018 09:08:52 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m15sm4436993wrr.95.2018.12.14.09.08.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:08:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:08:50 +0000
Message-Id: <20181214170850.1625-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libpsl: add
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
X-List-Received-Date: Fri, 14 Dec 2018 17:08:52 -0000

A Public Suffix List is a collection of Top Level Domains (TLDs) suffixes. TLDs
include Global Top Level Domains (gTLDs) like .com and .net; Country Top Level
Domains (ccTLDs) like .de and .cn; and Brand Top Level Domains like .apple and
.google. Brand TLDs allows users to register their own top level domain that
exist at the same level as ICANN's gTLDs. Brand TLDs are sometimes referred to
as Vanity Domains.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libpsl/libpsl_0.20.2.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta/recipes-support/libpsl/libpsl_0.20.2.bb

diff --git a/meta/recipes-support/libpsl/libpsl_0.20.2.bb b/meta/recipes-support/libpsl/libpsl_0.20.2.bb
new file mode 100644
index 00000000000..b3b0d78a8e3
--- /dev/null
+++ b/meta/recipes-support/libpsl/libpsl_0.20.2.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Public Suffix List library"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5437030d9e4fbe7267ced058ddb8a7f5 \
+                    file://COPYING;md5=f41d10997a12da5ee3c24ceeb0148d18"
+
+SRC_URI = "https://github.com/rockdaboot/${BPN}/releases/download/${BP}/${BP}.tar.gz"
+SRC_URI[md5sum] = "f604f7d30d64bc673870ecf84b860a1e"
+SRC_URI[sha256sum] = "f8fd0aeb66252dfcc638f14d9be1e2362fdaf2ca86bde0444ff4d5cc961b560f"
+
+DEPENDS = "libidn2"
+
+inherit autotools gettext gtk-doc manpages pkgconfig lib_package
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[manpages] = "--enable-man,--disable-man,libxslt-native"
-- 
2.11.0


