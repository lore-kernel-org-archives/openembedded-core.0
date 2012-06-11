Received: from mail-qa0-f48.google.com ([209.85.216.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Se6LW-0002F6-QO
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:15:58 +0200
Received: by qady23 with SMTP id y23so2919135qad.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=rygpOCl+tCCec20gz9qzVs3XZZWJ61i5qCYOyWqds9A=;
	b=iVr9zI4u5wagCnnK+/B3yAfV2rvgICt89bDIlynxDInwTf58aQVTbNCpqi+f0YkTis
	dRc30dIO1My7uvn1MY4dV3lFmdjtJt0lZZgFQT13lUGJdomA+6BIzm37/FRkI5KrCe3w
	xtb9ViVIgQXZvTWPm8Y46BzRJNlLS4cILCOMc14bejjF+wln0YUY76Zp9srStkl9rfck
	2daOJhphhFRnXUxYnlfpqr0946yN+V7SneWh3EtFP/G3a2zFEsMpx1aH5d6jkRMhV4DM
	tPuTRhDBJ1xKc2gS3K2CVIdeNXD74M19kbSLmmLk+2nczGyfm+DW8otTfmQP/zg1nwE4
	/06g==
Received: by 10.229.135.17 with SMTP id l17mr6626302qct.66.1339427124499;
	Mon, 11 Jun 2012 08:05:24 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id gy9sm29152339qab.22.2012.06.11.08.05.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jun 2012 08:05:23 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2012 18:05:12 +0300
Message-Id: <1339427112-6567-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm50/sbOTbXINLfJVh7j9uQykiJU5eZ0DyPq3ulMewJ9mgaSnLguJU1KRmXoZbMmPOelLkV
Subject: [PATCH] coreutils: Fix a typo in v6.9 (bracket not braket)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2012 15:15:58 -0000

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 6789b8c..5bfab16 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -65,7 +65,7 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "lbraket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs}"
+ALTERNATIVE_${PN} = "lbracket ${bindir_progs} ${base_bindir_progs} ${sbindir_progs}"
 
 ALTERNATIVE_PRIORITY[uptime] = "10"
 ALTERNATIVE_PRIORITY[hostname] = "10"
-- 
1.7.9.5



