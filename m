Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZTSV-0003Vs-01
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 22:56:03 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 May 2012 13:44:18 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so2991809wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 13:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=bzTMfZwYizpAjYsOZbxGc515FtiLeSji1/DyVbJpMT8=;
	b=ftlwt29D6zfVNJLWJRs9k9E1SDi5oVCCQkluafVR+hE1Nncl+0ro4W32qLFPY3Hx3A
	LDXqUOrByhg/frQojDbESPo1IZ2Q8RNrm+CLrr5kXsNZzu3i0tjnf6IQFcWWypTbSH3R
	8aQG9ANv5WA3Ko+rfqlJRfMzXHtJePwoZUbJiFxZYk1p3qsL8KQRf65MMTbt5DaQ2CGn
	mOCSZT9n9o3wfc2dddrBlosAwgvl0NLQkgkyV944pTvrNgCpOFYP5g9fYAI/vS19f0uu
	Uwq4yPA1hac9kLYAAls10TF1WBe111E9Y/dilSi/S8e+62YQHduYgkp5M6uAWEbzjMlk
	k6ng==
Received: by 10.216.212.1 with SMTP id x1mr8610802weo.143.1338324258001;
	Tue, 29 May 2012 13:44:18 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id
	fm1sm30464662wib.10.2012.05.29.13.44.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 May 2012 13:44:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2012 21:43:55 +0100
Message-Id: <edad5e84f146e0e2b4ff006582410a10764d9e2d.1338323483.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
In-Reply-To: <cover.1338323483.git.ross.burton@intel.com>
References: <cover.1338323483.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk8df66hZyd2nNVZgqsjkH1usltj5kri/y9SpQdTaT6ODmlwrf9a6bFq+NiKveu1DDLYZlv
Subject: [PATCH 2/4] connman: remove a deliberate sed that breaks all DBus access control for connman
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
X-List-Received-Date: Tue, 29 May 2012 20:56:03 -0000

---
 meta/recipes-connectivity/connman/connman.inc |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f2da8d9..b6b0253 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -53,10 +53,6 @@ USERADD_PARAM_${PN} = "--system --no-create-home \
 
 inherit autotools pkgconfig update-rc.d useradd
 
-do_compile_append() {
-	sed -i -e s:deny:allow:g src/connman-dbus.conf
-}
-
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
-- 
1.7.7.6



