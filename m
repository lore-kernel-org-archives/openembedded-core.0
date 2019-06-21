Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49CBD6011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 09:55:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p11so5928555wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VbsSaUSBTIGMhg2o04OrNOumVFH28C6wEetwvAMS3+I=;
	b=fXjOl0uyg3rZtjinqp2KSn5j8BUbAbdF6z4yRMpi9+m9o1Q8s7EqMifLbH22fgQof2
	C0vq9DvqfxiwVrHELi0UXSk6R7e38hJ6UhwHJJr9fa0JwRahYYw0v+FWfOs9AZ/+zbWJ
	87eUorr888T8l2BwBUgXyoXz/4CCidl35Pswnc2+W7XNEIYMX9FgxJ5Jmf32nBYVloYh
	o9g8dytEjM9aKFw9sq/4TtRLZ1XzAYG4E0udjt8BUheFJCpIIRZmwaFjZAEHwQKrCLZ5
	cNoBPO0jIpjix6Ga1Oz17vQzSrcKlM6IOyagrWE8UPqiblO9kwOGL5D7Y4OMcb1ME4Fu
	4QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VbsSaUSBTIGMhg2o04OrNOumVFH28C6wEetwvAMS3+I=;
	b=cR2mV6wrIAuwhOkwUPBIMMo9L6H2Vtkbnimvme1pCXH1B5lZcqjzeFXJBpfIGOM8Pi
	l/qlKCjmTzLKqYIdYEB/r6a0uiMRnbjQZxfXckphtG7xuw5JJTyJj4t/3cK4ZRcyiN0P
	PCqKRosI0DRZiWYtm6Cy3l+vcgaekhZ1RkLsb0dIwW4nq1BCWnNWeIHp2Yexcfueh4MQ
	hN/QwZHciAXp44NmJ9hiu7yFdc2Kvy3rLo11yx+tGvu6Mm4q9awKYMrtRtAhuWCmFM2W
	mY5GUyccr1/n4vD4FLKFzdmGEea5RnMxzoLHMrfbeW7J/ekzmY7UurGdU8kelfHeSL8q
	ArGw==
X-Gm-Message-State: APjAAAWAnfItmvDKdvBELCOe9vyha4DGOGNZupZH9/BvPPC5puMVx440
	rGghhSvgQs63fGL6vx7w54DHWq3Jd48=
X-Google-Smtp-Source: APXvYqwcIUNW/B5c+aEvalpdOr7nlK52VU6mACKrKyvXZkr+Abhz7BM65vO3gLtCH6XtCzGJN8UeJg==
X-Received: by 2002:adf:ea88:: with SMTP id s8mr78611785wrm.68.1561110944702; 
	Fri, 21 Jun 2019 02:55:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d5sm2064912wrc.17.2019.06.21.02.55.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jun 2019 02:55:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 10:55:40 +0100
Message-Id: <20190621095541.1198-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] pigz: provide gzip
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
X-List-Received-Date: Fri, 21 Jun 2019 09:55:44 -0000

As pigz has the same command line interface to gzip, it should PROVIDE/RPROVIDE
gzip.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pigz/pigz_2.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
index 8c65ec34f06..a173268eaa8 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
 SRC_URI[md5sum] = "def2f6e19d9d8231445adc1349d346df"
 SRC_URI[sha256sum] = "a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73"
-PROVIDES_class-native += "gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
 
+PROVIDES = "gzip"
 DEPENDS = "zlib"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
@@ -38,6 +38,8 @@ do_install_append_class-native() {
 	ln -nsf gzip ${D}${bindir}/zcat
 }
 
+RPROVIDES_${PN} = "gzip"
+
 ALTERNATIVE_PRIORITY = "110"
 ALTERNATIVE_${PN} = "gunzip gzip zcat"
 ALTERNATIVE_${PN}_class-nativesdk = ""
-- 
2.11.0


