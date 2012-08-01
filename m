Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYHD-0004dz-MG
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:47 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:32:07 -0700
Received: by wibhm11 with SMTP id hm11so3067694wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=iIx0I+HGx4uuD92Z01cHzTH7aHcbGPDM9JPA9s5MeXU=;
	b=erX1yFOLf5utZ+/raC1cEpe5WKmx2pys1CtCSwEfqmiUyXwcZ8qCcvaMzC4wKBhIZ1
	jz/0rUi5u+kgsVyqrFxfJ8qtFDqdW+rahYvSkTYDsTNr6XvBXWcl8cr5MwK/T5A1ALO5
	IHX3VN6ZnyfE1rlZXkzfYUnEBa7QgYZvKK27oIWT7N9Epz6JtLMQxruwrHjmIRe7gdtE
	TXMJDGP+hem8IZ0CHX2H2m1XafGVkovKmxQZPI4r+aRT6k1TAzc9eFsBQw66hKqHUp3R
	XTIp9ZTIJa+vIPP/NAHHOxD0ox3N1e+a2JLtqIExpTd96c+ZXlFJVd60/5x67uxzs6Sr
	dEaA==
Received: by 10.180.97.35 with SMTP id dx3mr1167607wib.1.1343824325805;
	Wed, 01 Aug 2012 05:32:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.32.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:32:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:17 +0100
Message-Id: <e1a9f9ba3e0e95d33db4fdea1e5f57ad947cd013.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnsS//4hibpWJ/uXYxyopFyxeLpmCLhO3qu7dJZIwgOnQXJ6gAhxUFYqLG5fMnrILyfDPQl
Subject: [PATCH 11/12] mesa: no need to depend on python-native, the class does that
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:48 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index e5e91a3..698f4fe 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r3"
+INC_PR = "r4"
 PE = "2"
 
 
@@ -20,7 +20,7 @@ PROTO_DEPS = "xf86driproto glproto"
 LIB_DEPS += "${@base_contains('DISTRO_FEATURES', 'x11', \
              'virtual/libx11 libxext libxxf86vm libxdamage libxfixes', '', d)}"
 
-DEPENDS = "libxml2-native makedepend-native python-native flex-native bison-native ${LIB_DEPS}"
+DEPENDS = "libxml2-native makedepend-native flex-native bison-native ${LIB_DEPS}"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'x11', '${PROTO_DEPS}', '', d)}"
 
 PROVIDES = "virtual/libgl virtual/libgles2 virtual/egl"
-- 
1.7.10



