Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id A57A773195
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 05:01:07 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id z133so4152704iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=H3DTtFKAiQD2NDtuM/8qe9X4Ht5jUh7wECCbnyGF4ss=;
	b=sYV1qEbbcDSjpIPbFJ/ODpQXHAYCccky6o/fxZK1XMN4gqPkO14uRa45W/TeoEgkJ6
	vNRH90WVHsp9Ihx61SLgaVJisr13W+bv0w+Qf0n9pbOK0k4Ar0WVRoUdc16p2gM1r5Xv
	I2NSZYU8szLXgMZDFp7s7rh/bV0/J6BQlRo0ullyTpvkVT9/jlC6ttEHxbeMj7dHB0Fp
	xu27o4vwZhlCLIZPs1IbFok1GJDYSnZJDxihJ1TmRjvnvweIWIsIyypFjeOehVxbOGg8
	tQ8ju/JHN0oopuPVjfpWOvr4nt3rCvLO/96NtUvhgznNS8oSQ7445oPky6AdH7/Y/dF1
	gwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=H3DTtFKAiQD2NDtuM/8qe9X4Ht5jUh7wECCbnyGF4ss=;
	b=CA3AbmufT3efG9iQIjJRk7spStxc0zPgARgg+ZTNxvtD1Nsl3XcCWn99mYqzpCbsOg
	GIdWw/9L0CxF0nk+KTZJvxqMTR6ISNzlBG0ud4XsH96SWBlopaGTBWYMrWjCOukW1UT0
	pbcuHTDuxiZ4aY7za060zIYm6IRUsu2yFOc//JjZOXsdLQR4l1mW9tThPq6ynCV7dSp+
	nxuYsNAcBoLeuAV1Qnz3Ta+U1afcJVumaFlB8uFZauDLoGaX9WH6L9TBm1TcZmRzfxBM
	WXUzdWG06SyffxnuBq0EoO9G75N/FWaWhKGSJstpIdP5VbuJSywX3jgQI9yfQ+WV8FRc
	8cHw==
X-Gm-Message-State: AD7BkJKS8G+s+P5oPkIFh3Go+d2xneY9CTLtsE2BpYSSXKlKqfHMkCzMjOAxflTP0Kwe2Q==
X-Received: by 10.107.6.40 with SMTP id 40mr6285792iog.176.1459486868373;
	Thu, 31 Mar 2016 22:01:08 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id z8sm5150069igp.3.2016.03.31.22.01.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 22:01:07 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 22:00:58 -0700
Message-Id: <1459486859-14736-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459486859-14736-1-git-send-email-armccurdy@gmail.com>
References: <1459486859-14736-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] libassuan: use package specific licensing
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
X-List-Received-Date: Fri, 01 Apr 2016 05:01:10 -0000

 - The main libassuan.so library is LGPLv2.1+
 - Test apps (in tests sub directory) and documentation are GPLv3+
 - Windows CE specific binaries (gpgcedev.dll and gpgcemgr) are GPLv3+

When building the current OE recipe, the test apps are compiled but
not installed. The Windows CE specific binaries are not compiled.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libassuan/libassuan_2.4.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libassuan/libassuan_2.4.2.bb b/meta/recipes-support/libassuan/libassuan_2.4.2.bb
index 57eab38..f376d63 100644
--- a/meta/recipes-support/libassuan/libassuan_2.4.2.bb
+++ b/meta/recipes-support/libassuan/libassuan_2.4.2.bb
@@ -2,7 +2,9 @@ SUMMARY = "IPC library used by GnuPG and GPGME"
 HOMEPAGE = "http://www.gnupg.org/related_software/libassuan/"
 BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 
-LICENSE = "GPLv3 & LGPLv2.1+"
+LICENSE = "GPLv3+ & LGPLv2.1+"
+LICENSE_${PN} = "LGPLv2.1+"
+LICENSE_${PN}-doc = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/assuan.c;endline=20;md5=0f465544183405055ec179869fc5b5ba \
@@ -21,7 +23,7 @@ BINCONFIG = "${bindir}/libassuan-config"
 inherit autotools texinfo binconfig-disabled pkgconfig
 
 do_configure_prepend () {
-	# Else these could be used in prefernce to those in aclocal-copy
+	# Else these could be used in preference to those in aclocal-copy
 	rm -f ${S}/m4/*.m4
 }
 
-- 
1.9.1


