Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5W1e-00059U-NH
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:31:58 +0200
Received: by mail-pv0-f175.google.com with SMTP id 30so571774pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=GDoi84pLgSsXjplpFMXf3BewTHwuCc9dUKt7Q8+6nL4=;
	b=Dlx9CKhheK6qrE+7AtH8Ahcf3ePo5JFa3UrQAquF96HCXaMCPJHn9m6VUy0wUValzH
	JHc76ji9ybd3mkjQJKq8Qk393vcnQNQl0NFuNjH92voNLoYB9iWss6qRJA5OPtwHvU9o
	07qA5B4ZYRXhEkFd4beEH2wW1gN6G/4cw0tO8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tcG7xMMzuz8PmM0rk+ecQ8/oUI3v+adg4FN5ZiqvuoyVTkrlr8QjkeF112rVWxqLSv
	RfwTNZouDpVeD3yrRIeLJpw0XhGm5yoeSspcxiZwnloOPdWSPoz2ux8x4dgDtzYm55yR
	lEdhBcdJSCzAohIuQdp+4EMh9gfZAJOGcSDRQ=
Received: by 10.143.86.10 with SMTP id o10mr2797069wfl.240.1301632199305;
	Thu, 31 Mar 2011 21:29:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id 25sm2387827wfb.10.2011.03.31.21.29.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:29:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:29:50 -0700
Message-Id: <9bb7e952b151b39ccdff74d2bf4d2fcb1c2df3ae.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
Subject: [PATCH 31/46] chkconfig_1.3.49.bb: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Fri, 01 Apr 2011 04:31:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-extended/chkconfig/chkconfig_1.3.49.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
index 97da4a4..83adb14 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.49.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://fedorahosted.org/releases/c/h/chkconfig"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-DEPENDS = "libnewt gettext popt"
+DEPENDS = "libnewt popt"
 
 PR = "r0"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${P}.tar.bz2"
 SRC_URI[md5sum] = "9b5e91d25f4f3b21f4c0bdf55a721431"
 SRC_URI[sha256sum] = "775100a9d6f70fbd8f33ed24b560b6842161fc496c21b1fc6d2aed646f9d855f"
 
-inherit autotools
+inherit autotools gettext
 
 do_install_append() {
     mkdir -p ${D}/etc/chkconfig.d
-- 
1.7.4.1



