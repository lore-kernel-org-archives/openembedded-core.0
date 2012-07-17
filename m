Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrCwB-0005J9-U4
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 20:56:00 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 17 Jul 2012 11:44:39 -0700
Received: by weyt11 with SMTP id t11so433935wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 11:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=k73KkmnGkLXfoPatSrvLjg82MEiu/gdIbJRcn86t5Kw=;
	b=XJCytHCn8jAi8j3yAN0B8Hyac+otwPj7b8tdBH9xYAteNfNxY2IjjucE/GFUk0ZIgg
	UMdUyVf+wub6PbJQ76CEweDCuus2dpYDPwLhkVaZyrfVRHv13CNfUB9o4tpCDzt9o3LA
	yUInEkV/uqK98AWhuSFr2FoYZWBhPrwi5wDNRENOArQt754A4IDpo9gtLzhLmWJ2N56/
	wuf1ESUdP3SAcvkC0TB49tpQFwuw8eafoUEifICa7fszps7+r+HZf0v143KB0q+luMLK
	YtWOdFnYwSQsIiehiCNDZUD/7t+XzSBkiJkTrtIqIC3qn3rtG46InJpqN7jzBQWUwRjy
	RM9A==
Received: by 10.216.131.221 with SMTP id m71mr6848wei.32.1342550677607;
	Tue, 17 Jul 2012 11:44:37 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id k20sm28346138wiv.11.2012.07.17.11.44.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 11:44:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 19:44:20 +0100
Message-Id: <66df0bb01e0162d51bb20b03d11157d42a057563.1342550573.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342550573.git.ross.burton@intel.com>
References: <cover.1342550573.git.ross.burton@intel.com>
In-Reply-To: <cover.1342550573.git.ross.burton@intel.com>
References: <cover.1342550573.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQljEpNgbrdHqeiyyxmjI7/Ebfo+ZpVIAZgp48b9VCRTtIneo1uAKOD9Dus0Szk0HEiCav4e
Subject: [PATCH 2/2] webkit-gtk: remove spurious install_prepend hack
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
X-List-Received-Date: Tue, 17 Jul 2012 18:56:00 -0000

This "fix" causes an (ignored) error now, so at some point it was fixed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index 3cef0e4..180861e 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -78,10 +78,6 @@ do_configure_append() {
 	done
 }
 
-do_install_prepend() {
-	cp ${S}/Programs/.libs/jsc ${S}/Programs/jsc-1 || true
-}
-
 do_install_append() {
 	rmdir ${D}${libexecdir}
 }
-- 
1.7.10



