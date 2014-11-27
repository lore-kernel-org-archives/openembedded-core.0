Return-Path: <alexandru.damian@intel.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A4C48601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 17:02:31 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so6967160wgh.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 09:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Is6pAHF+Byz5DsTsesA+2wBt8ckT8te1kEKvJp5v+I=;
	b=ctfPFnKyqL26eO0eLKgYlPHj/I8a+PRLiLfrNbMx4FA3FBxH8Pn/H+9PTUk3waovTL
	2TInF9gb9vi/8ZW+w7a67u4MQaHK7FDF5b3Vn/wrfHLkmEEZTByOj6NExOX9P2jQs1bp
	zHbcRsQQT5Th3RcApF5e+RT1Lml8zep6Swxzy4cAl3rp9yIKRdABIMroCoDDEJSBS9f8
	gcJmbcTvUmQAMd9GIVZmg3wnCUjuQUf5usBGZ0JQ5iLjRK7fMZPP4XV5AeblmKNUln3E
	1iu+O/a5UGVgfYVR/2/G3z1LjYwnwZ4JcrehBvLna/a3AdM5pbQz2iwQJxZZUWQcogWR
	GaGw==
X-Gm-Message-State: ALoCoQlJsSA9op2qDHeq2vHlpBPez7QEbPfsClDP3DTpOi0LSGBAoZSg5khXO2uycI0/VIfFvd5m
X-Received: by 10.180.90.241 with SMTP id bz17mr53663197wib.41.1417107751205; 
	Thu, 27 Nov 2014 09:02:31 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id h14sm12401824wic.8.2014.11.27.09.02.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Nov 2014 09:02:29 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id 46A6C563B9C; Thu, 27 Nov 2014 17:02:29 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Nov 2014 17:02:27 +0000
Message-Id: <1417107747-31792-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/1] toaster.bbclass: use the openembedded-core name
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
X-List-Received-Date: Thu, 27 Nov 2014 17:02:37 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Fixing the bug where the openembedded-core name was registered
as "meta" in toaster.

[YOCTO #6962]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 1525317..a7dd0aa 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -71,7 +71,7 @@ python toaster_layerinfo_dumpdata() {
         layer_url = 'http://layers.openembedded.org/layerindex/layer/{layer}/'
         layer_url_name = _get_url_map_name(layer_name)
 
-        layer_info['name'] = layer_name
+        layer_info['name'] = layer_url_name
         layer_info['local_path'] = layer_path
         layer_info['layer_index_url'] = layer_url.format(layer=layer_url_name)
         layer_info['version'] = _get_layer_version_information(layer_path)
-- 
1.9.1


