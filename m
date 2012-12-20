Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlhuC-0006f1-T9
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:19:31 +0100
Received: from mail-wg0-f70.google.com ([74.125.82.70])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 07:04:42 -0800
Received: by mail-wg0-f70.google.com with SMTP id ds1so2646670wgb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 07:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=iXjPVsg4zy+FOU4Oiwo9eVU7BriXmus33AB6JTVjv/0=;
	b=XJ7PQ81haxsXHjGmLwF8CW4IeerlEpBQz94icNL9ac8Z+w7YaUYldzwOienXS5HgzB
	OPG3Pfb9RpjXmYHHn7RSejApbM+O3B8oBkAP7TA33urRSrULiwjJr/hTxA0QwVmwlHWg
	qIVnq/Z0R5GrdWTWWa9vRqITMz3FWJSeDgzDBw/8WV3Zw9xuoYOfc6otsd9CTUVyLOqT
	luS5XxIFTYukynzzrr2JC8svN7BRKSEH3LlXRk0wObp5iec23B6+82d3JA4aQIZ+EqXB
	Om5bkrxLBz+1RES5ybLT+KQ97Y2lnOt4zxSLhHPfqCVyKnjFedqoPlEHAL3893xlF8h+
	Qvpg==
X-Received: by 10.194.9.197 with SMTP id c5mr18210407wjb.20.1356015880208;
	Thu, 20 Dec 2012 07:04:40 -0800 (PST)
X-Received: by 10.194.9.197 with SMTP id c5mr18210391wjb.20.1356015880036;
	Thu, 20 Dec 2012 07:04:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm13494932wiv.6.2012.12.20.07.04.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 07:04:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2012 15:02:54 +0000
Message-Id: <1356015774-13746-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnerHHTViDBp4TGU/rpQAKevvbewzZqp0WDn5LVKuGatpdfq1v7Xuh9r2NzEr8S3Ih21jG2uLoptNe6xQynJ2/MNAyCO8idoaCpuZhzD7XUtVgSGNXAItY5TKfpdQrx1Iscro1/YjNk5+lodMdzoVdNpL5AqU9zU+99EF17ygCiP+Zsor785FOnOcy+4G2fGfFy6mNF
Subject: [PATCH V2] python: add -crypt as a dependency on -math
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 15:19:31 -0000

random.py imports hashlib, so add this missing dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc |    2 +-
 scripts/contrib/python/generate-manifest-2.7.py      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 1e16c6b..3c7be7e 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -139,7 +139,7 @@ RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
 FILES_${PN}-mailbox="${libdir}/python2.7/mailbox.* "
 
 DESCRIPTION_${PN}-math="Python Math Support"
-RDEPENDS_${PN}-math="${PN}-core"
+RDEPENDS_${PN}-math="${PN}-core ${PN}-crypt"
 FILES_${PN}-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${libdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
 
 DESCRIPTION_${PN}-mime="Python MIME Handling APIs"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 5c52724..6a11c89 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -291,7 +291,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
-    m.addPackage( "${PN}-math", "Python Math Support", "${PN}-core",
+    m.addPackage( "${PN}-math", "Python Math Support", "${PN}-core ${PN}-crypt",
     "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so random.* sets.*" )
 
     m.addPackage( "${PN}-mime", "Python MIME Handling APIs", "${PN}-core ${PN}-io",
-- 
1.7.10



