Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5Jur-0005xJ-KF
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:45:58 +0100
Received: by mail-we0-f171.google.com with SMTP id u54so268015wey.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 09:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=4sH+WO4JD4rjDuuV9eXOmSZ1cN0JKfaTLDHdDcZnfvA=;
	b=Am4Lh+Yf0ZmQMpzsC6e7oLBKGReUvTf5VXas8jZ6K6MRIx8P2+tUgW6CHeiS+uRSah
	cdutNsU8YLGjsxySy+dKvKuG7Sxdq2WyRVG+96UW/tKPE7eJW40YUaMwxS15am/pw9kD
	kzXntEyKPzcuSKFslnQpLa0/aRYzghclQS++wpV1zSZun9d+hdIMZKPmhxjS5h9iqGZb
	2FET8AUetwkn3cLYN7KmrzvatilvzApUmusRMu41IG015W6iVe0UUFOMceVeIFjIKRnR
	Rc1vWIp0UuOfA9gpFcWpc6z5+9EXAyuGM7HO1nZubuxikA0fI6Wk+kURIYBVItaK9dOs
	z7hA==
X-Received: by 10.194.161.135 with SMTP id xs7mr32735556wjb.41.1360690154136; 
	Tue, 12 Feb 2013 09:29:14 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fx5sm41045683wib.11.2013.02.12.09.29.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 09:29:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 17:26:56 +0000
Message-Id: <1360690016-30849-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1360690016-30849-1-git-send-email-ross.burton@intel.com>
References: <1360690016-30849-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlxOTJQp+bCT74DTL7UrKUu/S6cOxR99he38aVqxYDo9mflB2lbpMsriHtxZ0hjUI4/Sza9
Subject: [PATCH 2/2] gtkhtml2: remove, nothing depends on it
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
X-List-Received-Date: Tue, 12 Feb 2013 17:45:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb |   38 ---------------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb

diff --git a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
deleted file mode 100644
index 2fafcec..0000000
--- a/meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SECTION = "libs"
-DEPENDS = "gtk+ glib-2.0 libxml2"
-DESCRIPTION = "A GTK+ HTML rendering library."
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-SRCREV = "1161"
-PV = "2.11.0+svnr${SRCPV}"
-PR = "r4"
-
-SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-media.patch;striplevel=0;name=patch3 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-end-element-signal.patch;striplevel=0;name=patch4 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-dom-functions.patch;striplevel=0;name=patch5 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/iain-mem-leak.patch;striplevel=0;name=patch6 \
-          "
-
-SRC_URI[patch2.md5sum] = "05fc3627ca364095702dc804f41c8391"
-SRC_URI[patch2.sha256sum] = "df5cca50a8f95333505d7920929fea251daea3be25be6834a1c50a742d9eb674"
-
-SRC_URI[patch3.md5sum] = "d3fe4cda3545f3e4718f1acc186608ab"
-SRC_URI[patch3.sha256sum] = "3aefaa17ffa38143bf5df1161c51ab402d35bfbee41ab4643c313edf569165d5"
-
-SRC_URI[patch4.md5sum] = "651b1601d8a1b21c8a3040fadb729043"
-SRC_URI[patch4.sha256sum] = "d067e8331bf9c6851f1c6067d991a7f54327f532900b405ebdf8e149c071f381"
-
-SRC_URI[patch5.md5sum] = "041be9711a16e629d01487664ba97152"
-SRC_URI[patch5.sha256sum] = "42956fb41341cf82ae8bce18b4cf96a7e2aa631b1b60657afb6d7e9be7cd138c"
-
-SRC_URI[patch6.md5sum] = "4e11dc7899d68f2be2e06ccee01d296d"
-SRC_URI[patch6.sha256sum] = "1e2cc080e654c1839c5cb4b4adf4c62a23e7da208427f3ba0b16cfed9e5cfa98"
-
-S = "${WORKDIR}/trunk"
-
-inherit pkgconfig autotools
-
-EXTRA_OECONF = " --disable-accessibility"
-- 
1.7.10.4



