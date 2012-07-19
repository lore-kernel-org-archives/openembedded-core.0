Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVm-0001ch-U2
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:35 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:14 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so1708130wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=iGqVIDLZ8/lPN3JyGBPZYxT902patu7hQH9MNsi5SdM=;
	b=ScumzVObMOr+2aChOx35GoVf35ZhkwY2PHUI6+inYtLQVANn+Odf9IoGeRjcpIgZQG
	t0liTC4t8YYw5C0o6ktGJrMy+EonikcZdergH1s8GNAVWXu9jZPWs/vxiqeN5SNESfdw
	4PNF/14dude5whS4zfSB+kMKJfgHgWAXMNQWzbFWH5XPP2cZLgP9LofjGvJUQnyOEco3
	D1NVUQvUsQaO3xGMMFbVV3bNA+OZkQ1mu9lq1Z/1y3n09RnAcpwbypz/CgJlBuQ++AXu
	CnIpT/HCVnae9y2qGx+7a81zaQgH/QlGItRtGKBrM6AfkHTQzvLYwpT1cgv009e9ZIIO
	krzg==
Received: by 10.180.106.97 with SMTP id gt1mr17714787wib.5.1342714323727;
	Thu, 19 Jul 2012 09:12:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.12.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:12:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:10 +0100
Message-Id: <fc17428639f26c7d402f012d550957b67d6c5a2b.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmcM1P+5FAxUN+i8ttavHlwSOfyTpMbSB1D1UDs/QnRYvfnnxNc64k7F6IdDWDn3j4aMKMj
Subject: [PATCH 23/26] webkit-gtk: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:38 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
index 180861e..58f467c 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://Source/WebCore/rendering/RenderApplet.h;endline=22;md
                     file://Source/WebKit/gtk/webkit/webkit.h;endline=21;md5=b4fbe9f4a944f1d071dba1d2c76b3351 \
                     file://Source/JavaScriptCore/parser/Parser.h;endline=23;md5=b57c8a2952a8d0e655988fa0ecb2bf7f"
 
+PR = "r1"
+
 # Choice of language backends - icu has issues on Big Endian machines so use pango
 ICU_LIB = "icu"
 ICU_LIB_powerpc = "pango"
@@ -25,7 +27,7 @@ SRC_URI = "\
 SRC_URI[md5sum] = "f2f01b1fdc7262a2eede81ebed0970b2"
 SRC_URI[sha256sum] = "9a126a76b40ca61adb1f1626e1567f976740af2332948cc5189489dbd01e3b28"
 
-inherit autotools lib_package pkgconfig
+inherit autotools lib_package gtk-doc pkgconfig
 
 S = "${WORKDIR}/webkit-${PV}/"
 
@@ -38,7 +40,6 @@ EXTRA_OECONF = "\
                 --enable-link-prefetch \
                 --with-gtk=2.0 \
                 --disable-geolocation \
-                --disable-gtk-doc \
                 ${@base_contains('DISTRO_FEATURES', 'opengl', '--enable-webgl', '--disable-webgl', d)} \
                 UNICODE_CFLAGS=-D_REENTRANT \
                "
-- 
1.7.10



