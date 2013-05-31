Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id AE53E6A56F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:10 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id n12so1316935wgh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=B626soVeCF+bg4l4ynka7DewP6J+Bvk0Ab/P9Azl79I=;
	b=k/YoEdMyRYeey1wt6PcE4gnqoQt4temjbwpSxo8FEkekm+pfByhAXhgn4u4CBxd4yZ
	sQ8zW3jECc+Efh3D4pWORhhQmlnEshMMJDhrIOVCm/8PvhtKq5y34aNP70zZiRDhTvWd
	cZwADP+H8T3KF2oL2vedZI4wgY/f8+Vqe4eRyUEcHQZjbze2lshB0YS+21OEooVBF3+w
	XXwWEr/pB327SyxSrt9RIZ2paYt4uhRiZlZOhVzMMplzHDV8ctcpyARq3fuiQT0VAZCf
	NRzvoGG0iBL5qT/NhAizB4MIl2Gbvz5ifd+nOEUqLkzG/YT06H8e42GS8lthnWRb5R7v
	v73w==
X-Received: by 10.180.184.75 with SMTP id es11mr3719369wic.38.1370012951428;
	Fri, 31 May 2013 08:09:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:40 +0100
Message-Id: <d8b9b69916d532e7b6cdaa0dc94c3d40ddeb52ab.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmOoxfqJ/b6ayuFmU25QlCXs2yVERssjW+a+Ps298C9weA/FO9nNdBvYqtTHYxM739KUYjk
Subject: [PATCH 04/11] gtk+3: explicitly disable introspection
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
X-List-Received-Date: Fri, 31 May 2013 15:09:11 -0000

If someone is/has been using meta-gir then it's possible for this floating
option to become enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
index 3c03add..9bd5b9d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
@@ -43,6 +43,7 @@ EXTRA_OECONF += " \
                  --disable-xinerama \
                  --enable-modules \
                  --disable-cups \
+                 --disable-introspection \
 "
 
 do_install_append() {
-- 
1.7.10.4


