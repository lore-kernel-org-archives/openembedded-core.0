Received: from mail-wg0-f51.google.com ([74.125.82.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAi7b-0003eI-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 15:36:57 +0100
Received: by mail-wg0-f51.google.com with SMTP id 8so490602wgl.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 06:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=69YY6y/xrnQGsCS401qv1hIQSln1ZOlYQEEV8b7ij68=;
	b=pPqc6kEsMckGIsNrGdZKnEGmKydhMnNS0qR+32/LYj7Yx1u7cpG/gB3MQPKl3mtkMx
	QkeJncdBAihnYl6uM4fJJQ+c7H5140OyfITCevEP86E9hsvv31EtbHdPzhyazwIq6ZuN
	6duAWNJ2yem/L8YLAm2gAVxvyLnKAXQzxq62DJ24p6yxXw5H4vwTLzxXIj0aOx7RE92T
	gvZ5JZFDl4wpStQRr3mC8nwYE8HP/1l94BaUokk9EOsIG/yqOByCAGNfn8+t9tKEy2g5
	R1GmAh0VMDk6p7LZIj46eUUgQFd/NEX9bx3dm0Ov5ARSWRG1fSrohUmOkBwsUtqStkzt
	/mig==
X-Received: by 10.180.102.164 with SMTP id fp4mr4224839wib.1.1361974818643;
	Wed, 27 Feb 2013 06:20:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bs6sm9053829wib.4.2013.02.27.06.20.17
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 06:20:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 14:17:45 +0000
Message-Id: <2707a659cbd0e567a29c464cc7fc7276668e1b99.1361974597.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
In-Reply-To: <cover.1361974597.git.ross.burton@intel.com>
References: <cover.1361974597.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl7At++B47M73nVMrwqCUgpumMvEdgDmONLj/XcPVR0D31c4O1C32lG2AaxkZQqizaofPrE
Subject: [PATCH 6/7] systemd: remove --with-distro option, it's not used
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
X-List-Received-Date: Wed, 27 Feb 2013 14:37:11 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 0e13d78..1773aed 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -40,9 +40,6 @@ UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
                             "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
-# This will disappear with systemd 197
-SYSTEMDDISTRO ?= "debian"
-
 GTKDOC_DOCDIR = "${S}/docs/"
 
 PACKAGECONFIG ??= ""
@@ -52,8 +49,7 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 
 # The gtk+ tools should get built as a separate recipe e.g. systemd-tools
-EXTRA_OECONF = " --with-distro=${SYSTEMDDISTRO} \
-                 --with-rootprefix=${base_prefix} \
+EXTRA_OECONF = " --with-rootprefix=${base_prefix} \
                  --with-rootlibdir=${base_libdir} \
                  --sbindir=${base_sbindir} \
                  --libexecdir=${base_libdir} \
-- 
1.7.10.4



