Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVe-0001kZ-NT
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:29 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:12:02 -0700
Received: by weyt11 with SMTP id t11so1708417wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=XC1NjorGRdmu2M2e6jcAyGhQSz2Fb3iSIhL2MgsEDFQ=;
	b=RG7Eihoq7GjIO7kNnDPIPd6mABcq0RWhuddd7Q+oRHslrFmCztPa39NXTC5snabzBr
	/9kmIzyzEHDP5qeNXYdMBkYn2YkzmBTTaRL2YZspyhbOzcKGz6kTnsi/fJ1Py7Mg28u8
	PbINs2xxoAv1YPIaFEZSPadC67Jp+1ottN0dKwGrctgGbHDtpfO5Ud3HDL2QXXoAdQ4A
	yIme587tGulAW8y2VXYrItmDh6SQAZfR7B8ZyV3B4B0HhIfIYXT1S9nI0AVhIN8/vLCS
	I0TndOAlzzcr5pjzeuFv2yri/lBbBTmGATqL3ef0kFIwgSAxJqaXMobvVif0BZZ2LHPp
	2iHA==
Received: by 10.180.88.102 with SMTP id bf6mr1696326wib.4.1342714320993;
	Thu, 19 Jul 2012 09:12:00 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:12:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:11:08 +0100
Message-Id: <867842d94d5271119bab3549915ea5e52aca2b97.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl9zoKWZ7ZVPP06ytWmhuY9kknKjddfy4D1/hQqey5YymPSZxVMCQ8VvS/iTxRhMRhzC0Cy
Subject: [PATCH 21/26] kmod: inherit gtk-doc, gnome-doc-utils-native isn't the package you were looking for
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:30 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 5f655fd..4723ee3 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -8,12 +8,12 @@ LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LICENSE_libkmod = "LGPL-2.1+"
 SECTION = "base"
 PV = "8"
-INC_PR = "r0"
-DEPENDS += "gnome-doc-utils-native"
+INC_PR = "r1"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
-inherit autotools
+inherit autotools gtk-doc
 
 SRC_URI = "git://git.profusion.mobi/kmod.git;protocol=git;branch=master \
            file://depmod-search.conf \
-- 
1.7.10



