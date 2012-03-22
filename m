Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SAfup-0001Lu-Fd
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 12:10:47 +0100
Received: by mail-we0-f175.google.com with SMTP id a1so1696213wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 04:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Y5XO3dB2zBsiZ9cFGvRJy2GY6ZAJ+GJrDKXGXlKcxSo=;
	b=Qc8hRvMr7jOOnHy0h1viLF7WWTOj5FBwh0onAPso4LotovRPeXy8nmlW1pViVVphog
	GrCh9jutIY3ocNyOhIHWwNP/C3ABSqwXiiWjXL7m/lbyn+34SYvux4oFfGNcjScEPVaz
	LAQdPXQ8ME4yhzw/LZbe1OcnH35MVzky9ZJykwohxGCHCOhjd6JNGT91HDe7AvYoV2iD
	IhxDZDevNR4a/Nw9OUoOhprGj1PLNYy7yjdHBT71hh7M2kYav8EcYEowNXzT8gtN9CnD
	lko0wuGdpH5QnQnpFL6FMOkcfZNqAgSE/td62rUyWvzYbTvZXPaaWaxby7zZmPYPHQed
	QVIw==
Received: by 10.216.225.12 with SMTP id y12mr4253684wep.39.1332414114964;
	Thu, 22 Mar 2012 04:01:54 -0700 (PDT)
Received: from localhost.localdomain (p5B0A13EE.dip.t-dialin.net.
	[91.10.19.238])
	by mx.google.com with ESMTPS id fn2sm7546875wib.0.2012.03.22.04.01.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 04:01:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2012 12:05:58 +0100
Message-Id: <1332414362-6406-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
References: <1332414362-6406-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] bluez4: use systemd_unitdir
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
X-List-Received-Date: Thu, 22 Mar 2012 11:10:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-connectivity/bluez/bluez4_4.99.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
index 97c77b4..5033d34 100644
--- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
+++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://bluetooth.conf \
             file://sbc_mmx.patch \
@@ -22,7 +22,7 @@ RDEPENDS_${PN}-dev = "bluez-hcidump"
 PACKAGES =+ "libasound-module-bluez"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${base_libdir}/systemd/"
+FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
-- 
1.7.4.4



