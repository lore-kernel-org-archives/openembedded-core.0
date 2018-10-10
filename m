Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3473279AA2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 15:07:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n1-v6so6144611wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=JRAqizIrrgEA1ouqhPwUlfptywtUoGMw4sSPNUGErIc=;
	b=Rigmrv+M7GVGox5a2AmHV1Na/bqjezE226+8N9YJoBnrwdFGjwfhxhXi4rBE9tZ1e2
	ujyc26u+jDIv6AHgEEq7dUUh4EzEnX02qrK3OBfxSVmGw3nlSHMSA0J6WcNehjVU0J4n
	DRX/JiLceV4Fg/Za5pHYClWKbWvOCwsE/ChFePVUdAvC8InuSHu3YVSFqFJFc9cmX8HA
	KuIWXzSGoEbTTjtGju1no9LJD8yfAvo+SRHf+6GMExJaZiyaEDmR9MXoJV7KaQwwoKIR
	mK5yPS9iPn2heL4SDXf2fiuN00CYdE+tfVhhiREY8KfuHoIdtH9tjwbkm6ECL/Urr/kb
	+/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=JRAqizIrrgEA1ouqhPwUlfptywtUoGMw4sSPNUGErIc=;
	b=ZRQodR9uCjd5qi5Q1JWgcqIGb6cb0w9SVwj7KF5PKXbC3t1FJIB7Rx1lGns/3k4oBm
	vzAFTP885FeTqIuWhbyhXe6gO0JBwWInPEJ5wwBeFmPG90TFzcJhpdCXrPJw62uHDfpa
	lK8XMzbeVB9GtU6StV6R7bEdVYwLP8am10aGAlbBws/bnwFN2oujIPE3lvHmNQkH7q8r
	wS5AaAZ5JDtpD7LA4hCOHm4Ju4gS3pXvKFWDkaFoubYmwWrhipXT0y+/uxJj0xQMH7aQ
	DJ/zP0wZC8dV5ZjODBQAO+urRIISee35zHjidaZdvXBCdepB/Laab1Gr2AfJKEkSFNWb
	yYjA==
X-Gm-Message-State: ABuFfoj+CIEggxRXk7UzdFyJss+8huAKK7bXR4gcXSyLAe117bY3y5+c
	0SgayQ3tS4HQHMdqHaCVBPs8ZCxcxpE=
X-Google-Smtp-Source: ACcGV61C+PcJSAXoS6LbQNz91dhKSAsIhEYhqWQTTL9gM8+XSxdIJy54roDuNi4BQskDyUS8+q0TzQ==
X-Received: by 2002:adf:fccc:: with SMTP id
	f12-v6mr26646493wrs.166.1539184071325; 
	Wed, 10 Oct 2018 08:07:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b14-v6sm5080372wrp.42.2018.10.10.08.07.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 08:07:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Oct 2018 16:07:48 +0100
Message-Id: <20181010150748.31336-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libproxy: correctly disable the KDE module
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
X-List-Received-Date: Wed, 10 Oct 2018 15:07:51 -0000

The configuration option is WITH_KDE now, as it supports both KDE4 and KDE5.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
index 4633ca57816..dd7ad922d3b 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
 PACKAGECONFIG[gnome3] = "-DWITH_GNOME3=yes,-DWITH_GNOME3=no"
 
 EXTRA_OECMAKE += " \
-    -DWITH_KDE4=no \
+    -DWITH_KDE=no \
     -DWITH_MOZJS=no \
     -DWITH_NM=no \
     -DWITH_PERL=no \
-- 
2.11.0


