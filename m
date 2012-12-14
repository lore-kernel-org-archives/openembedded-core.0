Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TjWrm-0001BD-F3
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 16:08:22 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Dec 2012 06:53:21 -0800
Received: by mail-ea0-f197.google.com with SMTP id d14so2371284eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 06:53:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=PUNmWxg01QaHK/rDMYd+tGuEDG5GFNJsDHvok/gulfM=;
	b=fhRlIoioYf3ot1PPYp26MjemZL7g1mo8bfDINTbnBCRcZizq4vYPuoI/zywIfICY+G
	fzgbZM6UIsNwOjG20c+z2wlXc3FZPa8m1kCpzLAb20ef2rqndbqCOFD8F8hQ6WUK5sUr
	ScxiXA0WFg6MUFrV4Ee2Ez4aPvUwkj75XqTjhP5OehwamdP62hieNUBTGjgw3lgNFlEV
	4+QVAcN4M/zdqJHiHRfGFAZH1feZxbav130pxsTcKmhmj83rHqtb9vbdC6VDJkwx4HsH
	yDAlJmVk9Y0RXWmBSez/DCRqFpOAk84Rhe4N89jUgTHO1cDDsYUhRMTKZ2uERYYPJXC1
	hslA==
X-Received: by 10.180.101.104 with SMTP id ff8mr3124480wib.11.1355496798876;
	Fri, 14 Dec 2012 06:53:18 -0800 (PST)
X-Received: by 10.180.101.104 with SMTP id ff8mr3124472wib.11.1355496798824;
	Fri, 14 Dec 2012 06:53:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm3sm12612555wib.9.2012.12.14.06.53.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Dec 2012 06:53:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2012 14:51:23 +0000
Message-Id: <1355496684-1498-9-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
References: <1355496684-1498-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlOR3k7bHPpKlLJxM1Q24tk3GtQp9848OOmJyY5rqy52aZVlvwrgvqxAeyxvAYkjaM/1HxhR6+sCVQ5pL5ugD66xdc6dtiGbxEhuK8izGprVvhRYAJ3ThBbT+Yu1Adp2x9uqzpbae6lm7MzNs8Vq8jsGPXbF3d3V0nQRgRVCkfjJm2fxsw1HB31dvn9fW5MRQT0hCez
Subject: [PATCH 8/9] font-util: fix out-of-tree builds
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
X-List-Received-Date: Fri, 14 Dec 2012 15:08:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
index 723cb0c..2e8c7e6 100644
--- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
+++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
@@ -17,7 +17,7 @@ RDEPENDS_${PN}_class-native = "mkfontdir-native mkfontscale-native"
 PR = "${INC_PR}.0"
 
 do_configure_prepend() {
-        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" fontutil.m4.in
+        sed -i "s#MAPFILES_PATH=\`pkg-config#MAPFILES_PATH=\`PKG_CONFIG_PATH=\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" ${S}/fontutil.m4.in
 }
 
 BBCLASSEXTEND = "native"
-- 
1.7.10



