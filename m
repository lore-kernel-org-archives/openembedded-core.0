Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TQEg2-00046Z-Et
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 11:52:11 +0200
Received: from mail-we0-f197.google.com ([74.125.82.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Oct 2012 02:38:17 -0700
Received: by mail-we0-f197.google.com with SMTP id x43so1830475wey.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 02:38:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=E2d9LglOPntdNIsKZRF8lBY60YfmgAmFoo+ihW/coQg=;
	b=my/MhNESDjHdjzAPM+DkvoB5OYcTLUVCt1YiUl8+3kep3SvKisJmomefLPkouvcXyb
	5yMwEdU36Ff7Qavsg/ff2IvW0mfftGo9LrR/M8KQOjERy+ddqZfr/EwgJiAUc1REnJHz
	e3Ra+m0/ZxVN2slRu8ROI21dSlSSXbNOZtrtD8SPTKCGJOY6Fc7BBZhlNrhnWouEcoIH
	3tzXUvKDeXGO2nsaWRDp1ZwGVvpIp6G4AZuDAa2N5WiKQVtER1Vd8wSH3+M8aCjKDwEU
	Ny+JoIfjcKrci3Ig6QjyDKPW9hEjgy0C/+kxCroscwnkyEGMDTSUvhTECUmRWfTwbdRz
	gOmQ==
Received: by 10.216.205.145 with SMTP id j17mr4717296weo.95.1350898305711;
	Mon, 22 Oct 2012 02:31:45 -0700 (PDT)
Received: by 10.216.205.145 with SMTP id j17mr4717293weo.95.1350898305619;
	Mon, 22 Oct 2012 02:31:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id w8sm50203841wif.4.2012.10.22.02.31.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 02:31:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 10:30:28 +0100
Message-Id: <81721346a29d0ac26f511328a1ea3eeba7e2f7df.1350898066.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1350898066.git.ross.burton@intel.com>
References: <cover.1350898066.git.ross.burton@intel.com>
In-Reply-To: <cover.1350898066.git.ross.burton@intel.com>
References: <cover.1350898066.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkMbduhxCTIkkrFZeCP6i+cSkKlWFIXECFALWPerLKKTMFyZWyZAPmrkkFCHFAv+4gC9yQX4LwO1edIp5J9ZwuN7WaqgRNeGa+mAefA0hA5G8gz+pDnBfYaVMFR0HncsnsKTUZTOhw41qvHfDFNHiiXKII0UYtGXUwZen+ubS6Afy4oyZpL7DXsKaf8PyLND1B234Ul
Subject: [PATCH 2/3] mtdev: New recipe for mtdev
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
X-List-Received-Date: Mon, 22 Oct 2012 09:52:11 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/mtdev_1.1.2.bb |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/mtdev_1.1.2.bb

diff --git a/meta/recipes-graphics/wayland/mtdev_1.1.2.bb b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
new file mode 100644
index 0000000..95d99ee
--- /dev/null
+++ b/meta/recipes-graphics/wayland/mtdev_1.1.2.bb
@@ -0,0 +1,20 @@
+inherit autotools pkgconfig
+
+SUMMARY = "Multitouch Protocol Translation Library"
+
+DESCRIPTION = " The mtdev is a stand-alone library which transforms all \
+variants of kernel MT events to the slotted type B protocol. The events put \
+into mtdev may be from any MT device, specifically type A without contact \
+tracking, type A with contact tracking, or type B with contact tracking"
+
+HOMEPAGE = "http://bitmath.org/code/mtdev/"
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea6bd0268bb0fcd6b27698616ceee5d6"
+
+SRC_URI = "http://bitmath.org/code/mtdev/mtdev-1.1.2.tar.bz2"
+SRC_URI[md5sum] = "d9c7700918fc392e29da7477ae20c5c2"
+SRC_URI[sha256sum] = "698dd11ca08b3a73ad33d8a5076f6d9e018d97afad3eba36f540b8ea7b775a30"
+
+PR = "r0"
-- 
1.7.10



