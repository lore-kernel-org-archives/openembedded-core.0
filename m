Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SeRTt-0007rq-GL
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 15:50:01 +0200
Received: by qabg1 with SMTP id g1so2962064qab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 06:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3jEYb1uNRd6qpw0GJDGvaX5exrBNJIdryzoJp5RK5pY=;
	b=cUJ3nmYS3Tx6nsUozr4LoRlguw/FaJW5mXgJ07Rp/BRZhvqSsBGeYFLqU0gAaGpmVm
	hPSzqGn/2UPnwcCikMoZY1iM20zYeRzRc4Nk8vV0v2b8cB/Ga3p/exH/qQQNHEhCnyum
	cwh4oA+ov0iwb8Ojglvu0sOE80Xx8+VM8mwcKSHKukuLeaq98IbVZuDwLIfAQuOrb4Pd
	DvxbHvg4cZtiO7Ltk/2arHw40AfzU1vs9DMVt0UrKfBcJl+JY+D1MTyMYFeHFzf9oLBt
	iSsHecQ5QyZRbMRKB43obRqaM9YgyGrPx3Aez4NdTNCAf05bszUXQe7BBZp7wGMkrgM/
	159w==
Received: by 10.224.105.203 with SMTP id u11mr19963939qao.41.1339508366268;
	Tue, 12 Jun 2012 06:39:26 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id dq7sm3372207qab.0.2012.06.12.06.39.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jun 2012 06:39:25 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 16:39:19 +0300
Message-Id: <1339508359-6581-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQneZMDzt2cxIkp+5z13tTf2IxEvftkgkmSLI5O2wE4vp3YYRTPFeiLVtRV7aCfu+3V3Kf0m
Subject: [PATCH] eglibc-package: Reorder PACKAGES to avoid having static libraries in dev
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
X-List-Received-Date: Tue, 12 Jun 2012 13:50:01 -0000

Move ${PN}-dev at the end of $PACKAGES to avoid having some static libraries
in dev and let staticdev have those libraries packaged first.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index ce37155..b3186f5 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -20,7 +20,7 @@ USE_LDCONFIG ?= "1"
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
 
-PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-dev ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX}"
+PACKAGES = "${PN}-dbg ${PN} catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGSUFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-extra-nss${PKGSUFFIX} eglibc-thread-db${PKGSUFFIX} ${PN}-pic ${PN}-staticdev ${PN}-doc libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUFFIX} ${PN}-pcprofile libsotruss${PKGSUFFIX} ${PN}-dev"
 
 # The ld.so in this eglibc supports the GNU_HASH
 RPROVIDES_${PN} = "glibc${PKGSUFFIX} rtld(GNU_HASH)"
-- 
1.7.9.5



