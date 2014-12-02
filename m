Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 99A8365C9F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:53:54 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id r20so28497406wiv.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=J1HvOnPjsLzAifUHvHDYTv4dW7aZ94u3/hYwDw+t47M=;
	b=YyEnhtjCXr3v7i6n/AE2iCjngpcc8H1kZ/wDtV+pGvHjda4/xFsqHOYmy3uoVZc8yz
	rmkHJf7BQW5KgzYTJudAUX2FJHk+5jvqJ1XJ8a1JAjT8kWzc59U57GiMZWJnQ7cZ2ljm
	/MEmPlKSSxi7pfNLB3a3oZQ3IAlsS0JFHsE0ixurvUJY0VrUgUGVl/k7DbRGSjw/K+6J
	+oMgxTtwiIf3maZmRE7meqV5YUcqcoX98QzkZXyi5Z2N+A5xe9TSWinQQMr4NMhn9ahd
	dmQmqgBHLdbs/DHsoHh5llZN4ZfV6dyLFOmRjFA2iuNiCbBB9Ud/tGwCDDCQVNZM1Obj
	UVEA==
X-Gm-Message-State: ALoCoQkBWa5rRHzzaDPZsRlg3CyQS0RPeo+jj1elLnFumaw6t9sPabswyrvKJr/RqbPtjWPxJSOb
X-Received: by 10.194.193.2 with SMTP id hk2mr3149wjc.40.1417535635331;
	Tue, 02 Dec 2014 07:53:55 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id j2sm32437034wjs.28.2014.12.02.07.53.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:53:54 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:53:23 +0000
Message-Id: <cd75de8fef0a91548662bb86d3f6a6336ece242f.1417535164.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
In-Reply-To: <cover.1417535164.git.ross.burton@intel.com>
References: <cover.1417535164.git.ross.burton@intel.com>
Subject: [PATCH 1/4] eglibc: WIP fix paths for libexec
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
X-List-Received-Date: Tue, 02 Dec 2014 15:53:58 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/glibc/glibc-package.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 6212e5b..7a89db8 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -33,7 +33,7 @@ RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
 libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 
-FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
+FILES_${PN} = "${libc_baselibs} ${libexecdir} ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
 FILES_ldd = "${bindir}/ldd"
 FILES_libsegfault = "${base_libdir}/libSegFault*"
 FILES_libcidn = "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so.*"
-- 
1.7.10.4


