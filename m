Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id CF9536CEA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 14:13:32 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id u56so5545899wes.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2013 07:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fQGrp8CL3TOzeAH8GNaD8XFfJGaXXDcS9lblTZDAxh0=;
	b=Rr0w3Pcf/nZvSxq+Wf9zLBVl3T7vfn6rh4CH2iYN8pFdxrjrvfSsVK+8XGLWtXXi3m
	r0e5GTOpFnx9bKoKZrUcmx5SdKR8bU5iXOhxaMa/+ztSTv24YtWIdrisgNwpdW7PRJnk
	lDL52U8JdsRu4QMOipvac9+eOgOODXUY2FFXgRmyA5qBMWmatKLhDOjuJ/CUQa7ZDr9i
	KCRasZO5h4SApi5KaQSTcK762ou2P9fdyHysrIxdujrrH7+rzyh6oaq51JZ+8iVF19gt
	g/74QkrGJoX5QU5cF1VVLywuzvUaTUQjjIAmKjKJivuypOEMmWmdWMBt8NC6lacb3F/k
	9Gyw==
X-Gm-Message-State: ALoCoQnWM4DUdkbvIVa78F4fxxMKiX16L5CjvfroxynEnX+gYxD6A+bVuUCFyilkMTFoqRZ6VbGk
X-Received: by 10.194.176.74 with SMTP id cg10mr1384639wjc.75.1381241613715;
	Tue, 08 Oct 2013 07:13:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dq11sm5551459wid.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Oct 2013 07:13:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2013 15:13:20 +0100
Message-Id: <1381241603-29429-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/4] gtk+: remove unused configure options
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
X-List-Received-Date: Tue, 08 Oct 2013 14:13:34 -0000

--without-libjasper and --without-libtiff were removed when GTK+ and gdk-pixbuf
separated, in 2.22.0

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+_2.24.20.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
index baa5c9a..ad3b4e9 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.20.bb
@@ -31,7 +31,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 SRC_URI[md5sum] = "9d7833331d7accd80668e29d7f567ce5"
 SRC_URI[sha256sum] = "cc66bcbf9239a7d9861175c681ba95894b55c70dc0b37aad8345c46ecfda0da3"
 
-EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
+EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
 
 LIBV = "2.10.0"
 
-- 
1.7.10.4


