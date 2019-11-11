Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id C36FC7FAA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 18:30:25 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id c184so11263053pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 10:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EhTtpeSQR9dndN/cJBZLsQv7EfcgQiZUVWGJD/lk7Oc=;
	b=pSOzxJqA/YvO9hr/7wUn0/EspQ5gPR8Rc+lJYHY+G89u2hlFVPmMEmkVGdvbesdSfv
	PE5BU/k7ZDiIVF5lqvTsJ6Tyc5mBwFUebnpT3tTEiEOQNsfh10KvyZWQEiyNfL5HTz9L
	7IQGXal4DN064k2dHR7vaiPMmS5aWi53bLQFrRVlFLnakrkpW09/Dv+LEDoaeQYTr42L
	vXT8hMzgckZL3PbzS0sYFAE8HMZXGlNDQpotMCJ9v/JqQywb8hlX3cHlXRsQR5uIlurF
	VmgtzwgfEi9dk809NKs+30D6jJv1ojksc9AtlXAGYvB5GFe+WiZ9V7Fp38zhzPMog+Xs
	LEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EhTtpeSQR9dndN/cJBZLsQv7EfcgQiZUVWGJD/lk7Oc=;
	b=pT2XIUhoFcmWNqd4TbqjBJRU8lKrtja9B5NcXEu8OdWr6Y/GTiq+pdn9gCZBoYDCYU
	PqiiCi52edVs4TfWfcMbwYOwAhSOqwj7TWemRvGsEZ5/egB2cMMtlOdW+vX0N90sKATM
	u8EMpSS7++hEbORbeLhecWPXN+xNUv4LEERh+8DI/DqrYWdpKeYJjRAaC/xw61Tz2R67
	htZ7c6vVSjpUBmfLIT4IzVafBI85KADTy8LllDAl9LdCqVJiBmzaBKXElNg7IXipEcSv
	I4d6lHGk5RaoHqU+ljYC/IFyisZZEcsHiUTaGrZ5Z/SO0T4AC34MQYhD/QECvmSW+iuU
	GMHw==
X-Gm-Message-State: APjAAAUeDntmrM14vzIur33I/clFnOnOIpdVWb9XLgVi2IKbGpF1c5J5
	UkcJFVUdnktrblV1MGyYvheTwe2f
X-Google-Smtp-Source: APXvYqwOWYC5rSKJhn7F2nxCTHZOM0MmezUGh/NkbKPm1eOQKxJeUBu/N8eMLg39XkTOBMz6KnqXLg==
X-Received: by 2002:a63:3281:: with SMTP id
	y123mr30944502pgy.252.1573497026760; 
	Mon, 11 Nov 2019 10:30:26 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:604a:b703:29ca:5c7d])
	by smtp.gmail.com with ESMTPSA id
	l62sm17731698pgl.24.2019.11.11.10.30.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 10:30:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 10:30:01 -0800
Message-Id: <0b9748c655b6f733b504e70288f4b91dca2e4d58.1573496794.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573496794.git.akuster808@gmail.com>
References: <cover.1573496794.git.akuster808@gmail.com>
Subject: [zeus 19/21] libtirpc: create the symbol link for rpc header files
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
X-List-Received-Date: Mon, 11 Nov 2019 18:30:26 -0000

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Since the Sun RPC is deprecated in glibc, the rpc header files
are not provided any more, but it allows alternative RPC
implementations, such as TIRPC or rpcsvc-proto, to be used.

So we create the symbol link for rpc header files for tirpc to
be more compatible with the glibc version and the application usage.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
index 9c480b8..8977a37 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.1.4.bb
@@ -23,6 +23,20 @@ EXTRA_OECONF = "--disable-gssapi"
 
 do_install_append() {
         chown root:root ${D}${sysconfdir}/netconfig
+        install -d ${D}${includedir}/rpc
+        install -d ${D}${includedir}/rpcsvc
+        for link_header in ${D}${includedir}/tirpc/rpc/*; do
+            if [ -f $link_header -a ! -e ${D}/${includedir}/rpc/$(basename $link_header) ]; then
+                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpc/$(basename $link_header)
+            fi
+        done
+        for link_header in ${D}${includedir}/tirpc/rpcsvc/*; do
+            if [ -f $link_header -a ! -e ${D}/${includedir}/rpcsvc/$(basename $link_header) ]; then
+                ln -sf ../tirpc/rpc/$(basename $link_header) ${D}${includedir}/rpcsvc/$(basename $link_header)
+            fi
+        done
+        ln -sf  tirpc/netconfig.h ${D}/${includedir}/netconfig.h
+
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


