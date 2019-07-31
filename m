Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE717D718
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 11:53:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r1so69330535wrl.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UW+GGkjkgJsj/SIuYFzYuG8x3DNOYSl9e8NhYYp2Kuk=;
	b=avdAriN0G1rcVAYKodwLtFS+/y1haXF/HHsN5x4yyYire5mi6l+M1/cciW7X1HLJYL
	Hvo2CwyRXd5DHCl2lck2I5fwiM7xq2YJ9RiiDgK6c1zrMPGyPnamsCcTyDgcYuI2dy+Y
	1N/wB+kdLdG1bmdfk+RhdRvxSP6vj3YdO0mQD6Ggw9pTB0iRHXlFBZoaY6XxfZodpExQ
	c0lAiA8j5X7goeBLp99JLGlQPke0MPoccJvOGVS4NytY4UZ6jXQrJrEDTWkKSGUZujLT
	g7N4lEoAKlMRA+Babo8L2oh7+07dHTat+bc0cnWa4YUsfIM9/Ed5oXSpwnZyxzHj/GJ+
	/FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=UW+GGkjkgJsj/SIuYFzYuG8x3DNOYSl9e8NhYYp2Kuk=;
	b=I/OTYZxSY9IyyxgY8OnsmqhEODZaWN91L9plGVCwUjGQhygZbqCtTDSUoQFQP0bEcx
	syNLnk94W/pe0Y5hDavxshjTWIlWQ2Txd/dWPFU4WyWTbDk5ursnqT9rL2HKlZHBXKp4
	syfyfM+jW3kWC8Sl4Iv8DLh+iD/PHVPrirvcT7rDu5/rtQ4LFzHrktxRY5aNOit+/Xfw
	AUeP3+q9oCNDRGuH7MWeCX8QuFFd9gtGad6tqTnOKDoc1QMYunUk2LZG887p6X8F9lt6
	tH6sO85KOuUdeqbN2jIkZQcfBRXTHx1MgYQZWoIV9WwD8iT1uzTarrsYXByzuGdeC3gv
	op3w==
X-Gm-Message-State: APjAAAWli1I0Q9mplUg/GPF2YIhLvPjCSpsx90oG1CtIpfm7+xnrwrwD
	Gpf3C7FS1uwQ+LZrezzDjm3RqYTsxgQ=
X-Google-Smtp-Source: APXvYqzhRrkPwQcSp1ZCv62ogGs6jRMDhmP1PKkq7J9VK/xBAn51gPzFMqgf/ioZACR28ll886XL9g==
X-Received: by 2002:adf:f883:: with SMTP id u3mr133319410wrp.0.1564573986700; 
	Wed, 31 Jul 2019 04:53:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y16sm69422795wrw.33.2019.07.31.04.53.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 04:53:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 12:53:02 +0100
Message-Id: <20190731115302.18138-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] fortran-helloworld: neaten recipe
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
X-List-Received-Date: Wed, 31 Jul 2019 11:53:06 -0000
Content-Transfer-Encoding: 8bit

Use ${FC} instead of constructing the fortran name/arguments explictly, and
clean up installation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/recipes-test/fortran/fortran-helloworld.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
index 97313d7e249..3a464044775 100644
--- a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
+++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
@@ -11,15 +11,14 @@ SECURITY_CFLAGS = ""
 SECURITY_LDFLAGS = ""
 
 do_compile() {
-	${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS} ${WORKDIR}/hello.f95 -o ${B}/fortran-hello
+	${FC} ${LDFLAGS} ${WORKDIR}/hello.f95 -o ${B}/fortran-hello
 }
 
 do_install() {
-	install -d ${D}${bindir}
-	install ${B}/fortran-hello ${D}${bindir}
+	install -D ${B}/fortran-hello ${D}${bindir}/fortran-hello
 }
 
 python () {
     if not d.getVar("FORTRAN"):
         raise bb.parse.SkipRecipe("Fortran isn't enabled")
-}
\ No newline at end of file
+}
-- 
2.20.1


