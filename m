Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2989C70795
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:40 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so933536wiw.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QlBTGNFcm0sON9621MPvmN9TuIKseqvSoipqT5Wm9AM=;
	b=Ekmyn9ODMe6VvT0CLiRhJ12rD83ZnTxUbArPczEpQ9w6T0Kt2tuzRy+Nd7dVm7b8VO
	GSZ2alnryxeG54ku8beiAsHUKVfjFTphaaLWk0liPSpo7zQi21T4yE5/i5j9iSWY1wzM
	CAVKvuYrePyTS7xrOY4KP+mWT7bIvBzR55rJFFYqgAVUYAcU8ytsJDFluQG/SvA/g0tx
	zSume4YQR6be1aByfrp2Kq8s/gx8riRsTo7YtM+OFP5Q+CxVxjmQT+LAofExDEDcqbqo
	R1/BRATSQxe/Mk96RWE9CiFELqTzgaohC/g2+GBgslSFn52R3u0hSi+H8oTQ0r7hwnoo
	s/hg==
X-Gm-Message-State: ALoCoQlYe5VOu7BqJ9mG0x+YAvchiupaPwlziscdhTupbvVjeRncQh97OKcQxS2NKKvwZX4I3m4Q
X-Received: by 10.180.83.8 with SMTP id m8mr17540910wiy.8.1406054321684;
	Tue, 22 Jul 2014 11:38:41 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:21 +0100
Message-Id: <1406054301-9027-11-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 11/11] pango: upgrade to 1.36.5
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:41 -0000

Update pango-ptest to reflect moved test suite.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/pango/pango.inc                            |    4 ++--
 meta/recipes-graphics/pango/{pango_1.36.3.bb => pango_1.36.5.bb} |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/pango/{pango_1.36.3.bb => pango_1.36.5.bb} (55%)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index c02d8c0..1ad46a3 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -90,8 +90,8 @@ FILES_${PN} = "${sysconfdir}/pango/* ${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-FILES_${PN}-ptest += "${libexecdir}/pango/installed-tests/* \
+FILES_${PN}-ptest += "${libexecdir}/installed-tests/* \
                       ${datadir}/installed-tests/pango"
-FILES_${PN}-dbg += "${libexecdir}/pango/installed-tests/.debug"
+FILES_${PN}-dbg += "${libexecdir}/installed-tests/.debug"
 
 RDEPENDS_${PN}-ptest += "gnome-desktop-testing liberation-fonts"
diff --git a/meta/recipes-graphics/pango/pango_1.36.3.bb b/meta/recipes-graphics/pango/pango_1.36.5.bb
similarity index 55%
rename from meta/recipes-graphics/pango/pango_1.36.3.bb
rename to meta/recipes-graphics/pango/pango_1.36.5.bb
index 7782f92..5c20497 100644
--- a/meta/recipes-graphics/pango/pango_1.36.3.bb
+++ b/meta/recipes-graphics/pango/pango_1.36.5.bb
@@ -8,5 +8,5 @@ SRC_URI += "file://run-ptest \
             file://multilib-fix-clean.patch \
 "
 
-SRC_URI[archive.md5sum] = "d9532826e95bdb374355deebc42441bb"
-SRC_URI[archive.sha256sum] = "ad48e32917f94aa9d507486d44366e59355fcfd46ef86d119ddcba566ada5d22"
+SRC_URI[archive.md5sum] = "2500930093c3ed38acb40e4255bce2f1"
+SRC_URI[archive.sha256sum] = "be0e94b2e5c7459f0b6db21efab6253556c8f443837200b8736d697071276ac8"
\ No newline at end of file
-- 
1.7.10.4


