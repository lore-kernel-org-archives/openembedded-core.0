Return-Path: <alexandru.damian@intel.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 89963733DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 12:07:17 +0000 (UTC)
Received: by pdjz10 with SMTP id z10so19003825pdj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 04:07:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YUPnKkt9xCyAION0gZFFrOxz3LVV+JDO/JiLjMIsiMA=;
	b=T4QPxttobF5ENe1R7Rp/Kt/43krP6fJnklXdON/TFk1MFj97AJZUcKKWBCgWjm8ycv
	0/KuIjwnr9XAJVNvy2ASe9FNfkslQWMVUfsRxA3HAOBImGDZXBbdjHl55cgVqCVXyQbp
	oNYWq0Et8nWrC39rVCnyoWZVBOWK45sbRGJ0vbl6k4pb4XlSHROGTNhajhEXO9859KBE
	skvM4TtKbgPOq4FrHE99xytKsQFzrlHbMMCiiXuNEEuKfC969jfuLAf1vvW14a7QkVUR
	rzQMdTPOyglQvyKkTfPmjCnuWWIagFNMYAES0k3HRAOBGU643HkYJUqOYr2fNK+lDex8
	Z5mw==
X-Gm-Message-State: ALoCoQmpUd5Wi6OsZ+8tDlFfur1CDIyA5ocHMahNNW4zXMON+lOPxQcMlmPpUWxRywXh8i6skuAg
X-Received: by 10.70.49.43 with SMTP id r11mr14675226pdn.25.1423829238494;
	Fri, 13 Feb 2015 04:07:18 -0800 (PST)
Received: from adamian-desk.local ([83.217.123.106])
	by mx.google.com with ESMTPSA id e5sm6625560pdj.20.2015.02.13.04.07.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Feb 2015 04:07:17 -0800 (PST)
Received: by adamian-desk.local (Postfix, from userid 1000)
	id D7B4656159B; Fri, 13 Feb 2015 11:14:30 +0000 (GMT)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 11:14:29 +0000
Message-Id: <1423826069-10810-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [[PATCH][Dizzy] 1/1] toaster.bbclass: use the openembedded-core name
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
X-List-Received-Date: Fri, 13 Feb 2015 12:07:17 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Fixing the bug where the openembedded-core name was registered
as "meta" in toaster.

[YOCTO #7317]

(From OE-Core rev: ab9f17893c4b004906ec232da300915145c125e0)

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


