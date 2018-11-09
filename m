Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F3686C31D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 16:53:12 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r63-v6so2650097wma.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 08:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=um5/XmekwjUpx19xo1gPS34WG5RpwwgUEqr1m8TjqZA=;
	b=HNMPHocJnQvozBumVXv332i5JtxosN7bqxtEjDGnHHk+vgZaq9VFExhSPdbSyOudxz
	asbbRouw8ivmMb10BhGL6MtPfta/hBY5K0cA43QBVkeZE+iqZhmK8LmI/eedSV34u2xF
	RJALPVfgfaQ56q5vlxV7ohljU1yEc1FaVXIo0XU6rBXnnMDXpAxdzJND5HBUDBP90Tg5
	RTXJ49STKj0b0Blw//nsZyxTh1lJ87+AMDex3vudGRm6nID9T9TgFRwK7GvJ99xDFaVy
	J5tsCBQ58lXqkQ11Ej2Cn5A/ZwVt5oLKvmFSrujjUSbAu3tqtNftLnY/2COEHmaBgVUc
	ttXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=um5/XmekwjUpx19xo1gPS34WG5RpwwgUEqr1m8TjqZA=;
	b=FmAwSitIDUeO8wTPwLMz7cNjODaG2E/+awhST9+jeb97VjotN0GcnJY/xxj3/gGyoh
	9xxbpwGSUxnQlMuJV/tYybyOZdG67Xhsxfp456Gl0HYvOPtdzcOdzvX2RA1mLlGSJgpx
	Pieprqzbepll87pfGSl/YpVGb9d9Vc/s4eqNRTm7wLLtja0bw00v/UM9XWApSQu5xT7E
	xL/A7hLJBcohrwt3VOqQYMsHDP/jwm9Fku9POZ1CF480/jkn4wV8x8rqWhTMmvFA49pT
	LlGEtfZBMHpF85vG33Nydzl6pKG8aB8jEJrTqhYO3m9CKaKaQIKG8lky+MgjN3R9Muct
	HVxQ==
X-Gm-Message-State: AGRZ1gLu7F7OceLUogLjrGSP2FRmBJBKGV6k7PLM5mtodiEaed0j+1SK
	RB48+H3ou5rvlHTz2U55/RvH5jLM6NA=
X-Google-Smtp-Source: AJdET5fa4a5wNt2yT6GVcrqelkipIMoY6wgabn2ZJcXckVfGu4vgCqF05Zm0ojeiv2zAkQirNWOuwg==
X-Received: by 2002:a7b:c153:: with SMTP id
	z19-v6mr111066wmi.132.1541782393443; 
	Fri, 09 Nov 2018 08:53:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	67-v6sm6521878wrm.32.2018.11.09.08.53.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 08:53:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 16:53:11 +0000
Message-Id: <20181109165311.12118-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] curl: actually apply latest CVE patches
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
X-List-Received-Date: Fri, 09 Nov 2018 16:53:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/curl/curl_7.61.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 53cfc4a5186..56327a632b4 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ef889a37a5a874490ac7ce116396f29a"
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2018-14618.patch \
+           file://CVE-2018-16839.patch \
+           file://CVE-2018-16840.patch \
+           file://CVE-2018-16842.patch \
 "
 
 SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
-- 
2.11.0


