Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYHB-0004ip-Pf
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:46 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:32:06 -0700
Received: by wibhm11 with SMTP id hm11so3067681wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=d8pxPjMDGEcAxpt0tflUSbJ1qnz0CIiw/5d0oGyGRIs=;
	b=RI4AGu+75V2xmQ8HTDGRllAlmnL5PDPfqBshi5jfX+rM1B4mXat9iuZ73NKDCfY7Sl
	GAuvGgyhDsaEaZWGkZt/wFkKDYf1lMdy1HS21fawkW5rU5yvvSRqwRGVyJUOiunqWJBz
	l6KSKVaXlfXnUqOFrHAQZLJwryH0kosrblbzE0DMUJi0rLD3h7uTorsd4kh1UholEOsT
	4pfnkVhrDIvR2IVsUML2z9FHFrHVYKtMCeJMv14FHMY2yax3aKPCFuN+MgFo1bQd864Y
	SHdOXIO0nyi+tKqu7A2ttmzO1J8VqwE5Z60BX7fsDshOyhrDr18oCsD4T+b02hVHdTX+
	SONw==
Received: by 10.180.106.137 with SMTP id gu9mr16104961wib.20.1343824324553;
	Wed, 01 Aug 2012 05:32:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.32.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:32:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:16 +0100
Message-Id: <ff43c1a5c4db3e71db06b37155ebae364df7e365.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkm+truM8YrCzAoOIhQR/f+JJPRxV7xWxx+x78tETMgpOIt7apIfqMHoq0UQZdD+LTZRw/t
Subject: [PATCH 10/12] poky: add EGL and OpenGLESv2 features
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:47 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-yocto/conf/distro/poky.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-yocto/conf/distro/poky.conf b/meta-yocto/conf/distro/poky.conf
index cc9fa6c..de7a36c 100644
--- a/meta-yocto/conf/distro/poky.conf
+++ b/meta-yocto/conf/distro/poky.conf
@@ -10,7 +10,7 @@ TARGET_VENDOR = "-poky"
 
 LOCALCONF_VERSION = "1"
 
-DISTRO_FEATURES_append = " largefile opengl"
+DISTRO_FEATURES_append = " largefile opengl opengles2 egl"
 
 PREFERRED_VERSION_linux-yocto ?= "3.4%"
 PREFERRED_VERSION_linux-yocto_qemux86 ?= "3.4%"
-- 
1.7.10



