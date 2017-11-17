Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7F65A71BE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 21:43:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r68so9052547wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 13:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lYWS+x58ra8q0xVv9e52aphO6ib8vWgRiZ0Z/Xck9iM=;
	b=ITvxYMUDX8d4+ASllRkw9aEN6F5gFxOd8V3KLRjIe1XSHTWgI/D0gm/oQeS9vx1wF8
	oAS+uNc7BU3m6PblYcByBHTX7YORTELj3WqH57mJl3tG/9qJ/3cTkYxICoeceVcyRCIf
	gKCrCSJuhdhAyYmMUAOzSC+T6FbefmWzTWDOy9cghRJQlKwABM4OMZ/IgVoMMlG45QVW
	54nsQg7ndB1K++sX6jbaSG5akpmUb0jonL8eEonz+f2CanlBMzU5/QCD2y3QkM3ZZ9r4
	IzfzzFxmkU7YdeC+ZGZUhtwjOrqVdf61cb69ql3zbRlHH31rjY5jbYm5ji+8SaxoBCOl
	9wZg==
X-Gm-Message-State: AJaThX56fBBwB9qyUGHHTUybEmsJp7VZ0L/voPED5Nra7Vr0hidGRxro
	HyInIGb8VDD02OHGY5oaLnF9Uzla
X-Google-Smtp-Source: AGs4zMZ6DIOrDRGogZYda9vrPwuKnYKAwecfjjuWb7VOM2vN/YFcVENc++N5ZoUIXbv7tnfMM7Jphw==
X-Received: by 10.80.166.196 with SMTP id f4mr9423908edc.278.1510955032895;
	Fri, 17 Nov 2017 13:43:52 -0800 (PST)
Received: from bri0771.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36])
	by smtp.gmail.com with ESMTPSA id m7sm3841903eda.91.2017.11.17.13.43.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 13:43:52 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 21:43:51 +0000
Message-Id: <20171117214351.5952-1-git@andred.net>
X-Mailer: git-send-email 2.15.0.rc0
MIME-Version: 1.0
Subject: [PATCH] base: add automatic dependency on xz-native for .txz SRC_URI
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
X-List-Received-Date: Fri, 17 Nov 2017 21:43:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

.txz is .tar.xz, so add it, as this can actually be found in the
wild.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8c8697761c..8dd4091717 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -624,7 +624,7 @@ python () {
             d.appendVarFlag('do_unpack', 'depends', ' lzip-native:do_populate_sysroot')
 
         # *.xz should DEPEND on xz-native for unpacking
-        elif path.endswith('.xz'):
+        elif path.endswith('.xz') or path.endswith('.txz'):
             d.appendVarFlag('do_unpack', 'depends', ' xz-native:do_populate_sysroot')
 
         # .zip should DEPEND on unzip-native for unpacking
-- 
2.15.0.rc0


