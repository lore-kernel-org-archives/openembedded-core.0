Return-Path: <anders.roxell@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6AF615C4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 10:17:30 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id p5so4744847lbi.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 03:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=PW/c9nIWF06zQz23pG2a+yyt/NDPbyfKUcOU3KFQZIU=;
	b=PrTlKbtmG9pkV3hUah4n4k7ABXS4Ap5c17CiowuUrBScIafll8elEHTqw6DptAviyT
	BK+bg43unhC/h+CtKVEmAPUBtVxW8hx03/0k8aJbIqdAlD+qEzV9aQSrsN+UjGyYAOE+
	7gK6S1BGg8M+L+9smyZ6ztXvSXdgUGtfCjt6Q0Auez/YVylilbbTAxFTDddy7E7CDrpA
	r3vwXVVhba9FDlEJzmDF/EkqRPhCZQfmse+jg/UIVo9i2DOsVWw/cFwLxZ9V2BaqgO52
	2ULTFlRn4A5vAd5lVNP9puXSIjuVFY3qTMz2i1DtEqG2EUw7x4vYJeLEA4PTPmGfJmke
	f4iQ==
X-Gm-Message-State: ALoCoQldihIC6hFCpcfwysYQl+D4gj+B1dQDm8O1m73SHlrExtYjIYTiKqL2LNym81l/GhG2LfY8
X-Received: by 10.152.120.37 with SMTP id kz5mr15753796lab.21.1378721852099;
	Mon, 09 Sep 2013 03:17:32 -0700 (PDT)
Received: from localhost (c-853670d5.07-21-73746f28.cust.bredbandsbolaget.se.
	[213.112.54.133])
	by mx.google.com with ESMTPSA id w10sm5520741lbv.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 03:17:31 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Sep 2013 12:17:26 +0200
Message-Id: <1378721846-3634-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
References: <1378401050-30782-1-git-send-email-anders.roxell@linaro.org>
Cc: linaro-networking@linaro.org, patches@linaro.org
Subject: [PATCHv3] ltp: update to new release 20130904
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
X-List-Received-Date: Mon, 09 Sep 2013 10:17:31 -0000

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20130503.bb => ltp_20130904.bb} (94%)

diff --git a/meta/recipes-extended/ltp/ltp_20130503.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
similarity index 94%
rename from meta/recipes-extended/ltp/ltp_20130503.bb
rename to meta/recipes-extended/ltp/ltp_20130904.bb
index 387826d..5e10448 100644
--- a/meta/recipes-extended/ltp/ltp_20130503.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -21,17 +21,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio libcap acl openssl"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
+SRC_URI = "git://github.com/linux-test-project/ltp.git"
 
-SRC_URI[md5sum] = "d448d9e9731d7ef45352fc74633cc97f"
-SRC_URI[sha256sum] = "afdb1479e73d4da7f0d4d5d3fe1570bc5fc96e3317d4a5c10c59c046d3dfa4a0"
+SRCREV = "a8c42db5f9314211811c36275a21f83902830dc5"
+S = "${WORKDIR}/git"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
 inherit autotools
 
-RDEPENDS_${PN} = "perl"
+RDEPENDS_${PN} = "perl e2fsprogs-mke2fs"
 
 FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
 FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
@@ -62,7 +62,7 @@ do_extract_tarball() {
 do_install(){
 	install -d ${D}/opt/ltp/
 	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
-	
+
 	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
 	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 
-- 
1.8.1.2


