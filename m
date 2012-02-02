Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rt6VS-0002Yh-9R
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 00:55:59 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 02 Feb 2012 15:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="113485999"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.238])
	by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2012 15:48:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Feb 2012 15:47:44 -0800
Message-Id: <d58903b22aa879484a5eaa01efad5c031ea485fa.1328226197.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328226197.git.sgw@linux.intel.com>
References: <cover.1328226197.git.sgw@linux.intel.com>
Subject: [PATCH 05/14] openssl: Update to 0.9.8t (gplv2)
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
X-List-Received-Date: Thu, 02 Feb 2012 23:55:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../configure-targets.patch                        |    0
 .../debian/ca.patch                                |    0
 .../debian/config-hurd.patch                       |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/engines-path.patch                      |    0
 .../debian/kfreebsd-pipe.patch                     |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/perl-path.diff                          |    0
 .../debian/pic.patch                               |    0
 .../debian/pkg-config.patch                        |    0
 .../debian/rc4-amd64.patch                         |    0
 .../debian/rehash-crt.patch                        |    0
 .../debian/rehash_pod.patch                        |    0
 .../debian/series                                  |    0
 .../debian/shared-lib-ext.patch                    |    0
 .../debian/stddef.patch                            |    0
 .../debian/version-script.patch                    |    0
 .../parallel-make-fix.patch                        |    0
 .../shared-libs.patch                              |    0
 .../{openssl_0.9.8s.bb => openssl_0.9.8t.bb}       |    0
 24 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/config-hurd.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/engines-path.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/kfreebsd-pipe.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/perl-path.diff (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/pkg-config.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/rc4-amd64.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/rehash-crt.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/rehash_pod.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/series (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/shared-lib-ext.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/stddef.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/parallel-make-fix.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-0.9.8s => openssl-0.9.8t}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_0.9.8s.bb => openssl_0.9.8t.bb} (100%)

diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/configure-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/configure-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/configure-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/ca.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/ca.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/ca.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/config-hurd.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/config-hurd.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/config-hurd.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/debian-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/debian-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/debian-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/engines-path.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/engines-path.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/engines-path.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/kfreebsd-pipe.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/kfreebsd-pipe.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/kfreebsd-pipe.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/make-targets.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/make-targets.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-dir.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-dir.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-dir.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-section.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/man-section.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/man-section.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-rpath.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-rpath.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-rpath.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-symbolic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/no-symbolic.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/no-symbolic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/perl-path.diff b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/perl-path.diff
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/perl-path.diff
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pic.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pic.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pic.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pkg-config.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/pkg-config.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/pkg-config.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rc4-amd64.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rc4-amd64.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rc4-amd64.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash-crt.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash-crt.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash-crt.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash_pod.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/rehash_pod.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/rehash_pod.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/series b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/series
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/series
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/shared-lib-ext.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/shared-lib-ext.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/shared-lib-ext.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/stddef.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/stddef.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/stddef.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/version-script.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/debian/version-script.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/debian/version-script.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/parallel-make-fix.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/parallel-make-fix.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/parallel-make-fix.patch
diff --git a/meta/recipes-connectivity/openssl/openssl-0.9.8s/shared-libs.patch b/meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl-0.9.8s/shared-libs.patch
rename to meta/recipes-connectivity/openssl/openssl-0.9.8t/shared-libs.patch
diff --git a/meta/recipes-connectivity/openssl/openssl_0.9.8s.bb b/meta/recipes-connectivity/openssl/openssl_0.9.8t.bb
similarity index 100%
rename from meta/recipes-connectivity/openssl/openssl_0.9.8s.bb
rename to meta/recipes-connectivity/openssl/openssl_0.9.8t.bb
-- 
1.7.6.5



