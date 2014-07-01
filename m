Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 27EC765D33
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 16:04:44 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so9903422wes.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jul 2014 09:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3hBv7A+VWLxYAXA1QU94Vj7PNDAmFk2tmN5nsSNQckE=;
	b=am7UqYw8Utit+g+Aza8+onbl+7Iim+r/VNSgVoZf+f5YMcKLoHh/V2rIu+qtfogllN
	CesDMKMSSoI0904UzUT3/W5lQxMXMs3/RTiMTuQsKGltht9ZYZX27836G8QLeunprDKF
	geolkfmtzL2oMFj1jG8wfZGJTiGq6iYZV+vkAOfJPB3LmLi6QoPePjEc9mTLK5IQBqwV
	bykroMkS40Otn7DmdyvGEHSQoKeLpzo9ZQNN4KyfmGKmn4a8IugUMEAgMFtlsqNARQ+R
	fI6wSu58Kb+PpFzi466IGovqpyy6z7Q8CWC9O7E+tU9Y8eCxJCKpuRnoQtRr7zOP6KHQ
	o9CQ==
X-Gm-Message-State: ALoCoQmxkCBqNVLILGwSgItAWpw5qY1vIZeZmemKP/suEP9Co8qLbWK4Kab6/4NN+kYrI3pHlOiv
X-Received: by 10.180.75.75 with SMTP id a11mr36972720wiw.3.1404230685366;
	Tue, 01 Jul 2014 09:04:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	hb8sm44716753wib.12.2014.07.01.09.04.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 09:04:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Jul 2014 17:04:41 +0100
Message-Id: <1404230681-4022-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] bitbake.conf: automatically add libexecdir/BPN/.debug to -dbg
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
X-List-Received-Date: Tue, 01 Jul 2014 16:04:45 -0000

pkglibexecdir is a fairly common location for package-specific binaries (in
automake this is $libexecdir/$PACKAGE), and binaries in there are already
installed to FILES_PN, so add the corresponding .debug directory to
FILES_PN-dbg.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b3833f3..7676765 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -295,7 +295,7 @@ RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
 DOTDEBUG-dbg = "${bindir}/.debug ${sbindir}/.debug ${libexecdir}/.debug ${libdir}/.debug \
             ${base_bindir}/.debug ${base_sbindir}/.debug ${base_libdir}/.debug ${libdir}/${BPN}/.debug \
-            ${libdir}/matchbox-panel/.debug /usr/src/debug"
+            ${libdir}/matchbox-panel/.debug ${libexecdir}/${BPN}/.debug /usr/src/debug"
 
 DEBUGFILEDIRECTORY-dbg = "/usr/lib/debug /usr/src/debug"
 
-- 
1.7.10.4


