Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 928146C7FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 22:45:08 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id ex4so3708198wid.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 14:45:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XMwhagg4T28gbbw9mCqmj3ifj1CwDYM69Gxu9OLCYsI=;
	b=VH5kAt4NVquloRolLVWkoxIG6dF3apGno+xkfA7XKG3pJezxXeHJajf5NCYlGbgr1x
	3PiFSYvkefxI7ulC0K/YsGaZ29VJzoK4VUV0lbJa4iZ9aBhMOWLvIlaOjRF9m3L7J+2Y
	b5/2pkYyLAv42ZzHQAUbZH+HkEPDU49Ou8uOZ5NDYJLnralvQYNdvAtzU5hsS/3QQ7fM
	oDiCG+bpOb7ttuznjMbRoQVVtlZ+jHvR+6G39L/1Lc1KnPd4/rwr/8bmzDYMJSwRZ/DG
	RwuU67q2sx+xM0auZPQx0S9zyubRLV9m5dRYXDBwsZHqHAt1Dd9/yXptklR/ZoP1iB1f
	ne0A==
X-Gm-Message-State: ALoCoQmlOd2lvk+RatXGblFhM7jz/rokTfphYV9uDRDj3h27/vRn18SV7BFsTo7J4GLdoL6AglDs
X-Received: by 10.180.87.232 with SMTP id bb8mr11940373wib.48.1390257908480;
	Mon, 20 Jan 2014 14:45:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uc9sm5733776wib.2.2014.01.20.14.45.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jan 2014 14:45:07 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 22:45:00 +0000
Message-Id: <1390257902-31739-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] gdk-pixbuf: upgrade to 2.30.3
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
X-List-Received-Date: Mon, 20 Jan 2014 22:45:08 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.30.1.bb => gdk-pixbuf_2.30.3.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.1.bb => gdk-pixbuf_2.30.3.bb} (94%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
similarity index 94%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
index 408178d..dd1f27f 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.3.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            "
 
-SRC_URI[md5sum] = "e5ae32be7927c9bc94d8593a881eeb3f"
-SRC_URI[sha256sum] = "a3263b1e15668c009313bf04ab67420bec9f2b167c402a71a486307cadee8d30"
+SRC_URI[md5sum] = "81161cc895eb43afd9ae7354b87e2261"
+SRC_URI[sha256sum] = "c229c53f59573eab9410b53690a4b9db770312c80a4d84ecd6295aa894574494"
 
 inherit autotools pkgconfig gettext pixbufcache
 
-- 
1.7.10.4


