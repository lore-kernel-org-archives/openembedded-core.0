Received: from mail-lb0-f174.google.com ([209.85.217.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TsSs6-0007x3-RQ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 07:41:28 +0100
Received: by mail-lb0-f174.google.com with SMTP id gi11so126177lbb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 22:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=LcP1UZHSqPB91SZ8FwLwBmsufE9lOrk4ySip/kngqiE=;
	b=gUScKiW6SKORIi+5L/osi/RsL3gVlziFpbfgECLXVO4twWfXjBtBM+odvcka2E0Sis
	zHOoqzh86aWLrmqA5GFc+0/7J6YRgZR+JsurquofjemsQdH52ONdOGAZq+P4YwO1Ebwj
	zFEIx4qB0A9Q35dWy4t8Nl9pTF81osVyZrXTYvmgdbB5DkBc8FHV/z/8fcylQ7/iYoqv
	xBzMVYOHg0WTWvLAmZRLEZH6AtceszTiFnNuYbj94E31Dxz4niLWxzoUXQhVEZL7yQBJ
	N5Ja2Nkr8fNCAEMNuezdEX+VjvduAZfcnTLkGNlG+5t3YOAtLS+OqwsVSb0RHFaWzBN+
	JBfw==
X-Received: by 10.112.101.135 with SMTP id fg7mr25860085lbb.87.1357626364670; 
	Mon, 07 Jan 2013 22:26:04 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id er8sm22078169lbb.9.2013.01.07.22.26.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Jan 2013 22:26:03 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TsSdN-0005Uk-6u; Tue, 08 Jan 2013 08:26:01 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: cristian.iorga@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 08:25:56 +0200
Message-Id: <1357626356-21074-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1357626356-21074-1-git-send-email-cazfi74@gmail.com>
References: <1357626356-21074-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH] bluez-hcidump: updated to upstream version 2.5
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
X-List-Received-Date: Tue, 08 Jan 2013 06:41:29 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../bluez/{bluez-hcidump_2.4.bb => bluez-hcidump_2.5.bb}           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_2.4.bb => bluez-hcidump_2.5.bb} (83%)

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
similarity index 83%
rename from meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
rename to meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
index 194c04d..667641b 100644
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -11,8 +11,8 @@ PR = "r0"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d39833de0ed26bddf784e9580b6f33c4"
-SRC_URI[sha256sum] = "bacd155e6420e480d8a30c0b0e6da990031890ee1000a31408e175ab7cf3cbd3"
+SRC_URI[md5sum] = "2eab54bbd2b59a2ed4274ebb9390cf18"
+SRC_URI[sha256sum] = "9b7c52b375081883738cf049ecabc103b97d094b19c6544fb241267905d88881"
 S = "${WORKDIR}/bluez-hcidump-${PV}"
 
 EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-- 
1.7.10.4



