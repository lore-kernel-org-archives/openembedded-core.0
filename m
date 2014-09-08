Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCF271361
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Sep 2014 11:58:58 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so2487335wib.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=YUq5CHIKF4+rQC2ioU4GuTIO2MbyxLeX12hvBgMFJQM=;
	b=PMmxvfcqnuzzg4aB7k23FcNFruFcMXF6Ki/tSelvrMHN8WeC1W3PgbnAA2wc3hvVCK
	B5hjiQyY4Pu4wsE4u79F+QhUjSahT23+8kFY7q7wDBLCljO17WozCbz3H9yYbLahlylK
	EUy9+QjP/a8WkSTPkPUCxsxEED75Aa8si/ZKDE8E9y+pKMY87lsaND+2TaF811OQ1bgF
	ei0TYdH0PPKSnaJc8Lie1zjo9iEc5P5YV9jRo7P4UoH8LP655KLyyt6D/cdzlTzHwOJ7
	vKO5CQ3Gogyb+Wyqbodoujkvjo+pc1EANmE77DsqjiB6bTrU2nAO97b6o6mQRO6WC/WP
	8w8w==
X-Gm-Message-State: ALoCoQlaJ1h+E0jnIRCxnbEmI9a1x7AxE9wz08bgxaW+VpLHx3LYhFYBbRJ5RXeoSQ+Za8y4wgqJ
X-Received: by 10.195.11.234 with SMTP id el10mr34617966wjd.95.1410177538936; 
	Mon, 08 Sep 2014 04:58:58 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	gl10sm11003928wib.1.2014.09.08.04.58.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 04:58:58 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Sep 2014 12:58:23 +0100
Message-Id: <b518a8b0337e677b18652bab8b97d5854f2c2129.1410177322.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
In-Reply-To: <cover.1410177322.git.ross.burton@intel.com>
References: <cover.1410177322.git.ross.burton@intel.com>
Subject: [PATCH 05/27] lighttpd: install config file without execute permissions
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
X-List-Received-Date: Mon, 08 Sep 2014 11:58:58 -0000

From: Dan McGregor <dan.mcgregor@usask.ca>

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
index 0acc37d..20d5c1c 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
@@ -51,7 +51,7 @@ SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d ${D}${sysconfdir}/lighttpd.d ${D}/www/pages/dav
 	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 
 	install -d ${D}${systemd_unitdir}/system
-- 
1.7.10.4


