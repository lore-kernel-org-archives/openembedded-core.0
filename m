Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fX-000088-Mb
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:07 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so4041428pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=Kpxf9hAvKP3PRdTyHTTFDQoaasHWDqBrRncZSvRKdBA=;
	b=Vv1Gi3r38TLmdQYmPgOk6SSkVB1alv5180RZc7qYKGWCEMnwWz0M+X50zBYQSVLm1q
	+mFB0A7wOnyYtrqwViRoHoCOTnucivGz8r3142ALRcIv0I0c7PxQZiwmyMOFBrFXwRUv
	Wal2Umlx7fcOehno8GArzBgJo/W3yUmY4b8HcSXQ9d6EmSbX/iAYv7jQoHdUAqA9vU7K
	kpXqkBOPHxzmfJum0odA2nBmyK5wghBEG+bqXwIsNU2WdKxWtH+dpN7vQ3QlKuQ4dFc7
	R2RFtgCNi3zPFHYcyxqsmc3u/eh0wknEymJog3/Dejt4kF0dpfBj6LsIQm3y047gQ1cj
	8TGQ==
X-Received: by 10.69.3.97 with SMTP id bv1mr27141760pbd.73.1363026316589;
	Mon, 11 Mar 2013 11:25:16 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.14
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:48 -0700
Message-Id: <de0543fc5737e4bc7be6e13dca996b338174c11f.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkWReTvlT2tWq/TQuYnXVQTLyc+AkExJV4uCNr26VjLLIhyfgvAiqVJ7tDA+yTnyvsRSv9A
Subject: [PATCH 05/12] xkeyboard-config: remove long-gone build dependencies
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
X-List-Received-Date: Mon, 11 Mar 2013 18:42:43 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
index 8ca2f6a..ccb9f74 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.8.bb
@@ -17,7 +17,7 @@ SRC_URI[md5sum] = "e66d567d85a954d589c5723fb0e1f3dd"
 SRC_URI[sha256sum] = "4e1cf5468d488aaf320ddfd439e03cbda0b213550fd734026d23138e4b2078ae"
 
 SECTION = "x11/libs"
-DEPENDS = "intltool-native xkbcomp-native glib-2.0 virtual/gettext"
+DEPENDS = "intltool-native virtual/gettext"
 
 PR = "r0"
 
-- 
1.7.10.4



