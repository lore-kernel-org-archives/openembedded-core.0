Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9D90678133
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:43 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id n23so169392293pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8y6TS+EcNpDaiTSbRkgf0f+KCOnSr8eo4qFg1xsngT8=;
	b=RyVzfjfo5XoCt3fi/Qkfkyul4LHAk0KFGJUEb63w1ojZwetjNhcNjRhSPH9IH/FtT3
	UG5Imug2g7Q4aIAFMNyd/ypGx7ldxtz7YcgKwBcJTTEOZUFXRhS37TN6CJJAgIRkhl92
	BVcFI3+Mz53daVadJUzNy82wdrreiqzKwOeDuapfsPy2w3UDujvR4cDjrxAxS+eXLNAb
	TkHCbGRHr3tRj5YirIIfDRoYEsYa7tfmIDiZP2lYYLH2fn6WU4nFWj5wXHB8byc96rel
	eEK7zhlblFzGhrl+UMg7Ri1u7+OqzL87031esnRvQwmqn55qN4moK+/x4C3FWffk8jEO
	n2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8y6TS+EcNpDaiTSbRkgf0f+KCOnSr8eo4qFg1xsngT8=;
	b=Jm1/VW5UTLdBcKyMJSZa3Xskbahdk6+0xLiKv2Iyl1nHCicN7TC0X0yrl9CKUFuxd4
	h3YwZD13TdicH1ye3yWbAFOrYJsXQ+CTrKsegsULROrTSfm9DJDCr+SFKaWAcF6A6ZbD
	14uZGE8sbkkAD+vk+72LbhFxfHozXVObjrpXVrGtlV2h52aHGPRzM5305ONtlanjzE1E
	6mUBXtydXqg3/fI7MH2/PE6Y7o/UN5g89MVKGn0e7NQc6Hldow9HneJx6KdCd8k5fLhj
	QlWYOECnHqxbPlMKf9V2b8fofXWy4TD29zzJLIwuyvAZ/gf/FNDAbQ0+AotiuzVZanX6
	IkKA==
X-Gm-Message-State: AODbwcCYyM8W8gVqmIE0H3ue0c+Ue1CCpc8f4R/RNDYsQcNsh9H/XY35
	PXYCAOu2wwKWyw==
X-Received: by 10.99.55.88 with SMTP id g24mr45478530pgn.176.1495723664688;
	Thu, 25 May 2017 07:47:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	z14sm13966523pfg.109.2017.05.25.07.47.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 May 2017 07:47:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 07:47:32 -0700
Message-Id: <20170525144732.15447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [meta-perl][PATCH] meta-perl: Make glibc-gconv deps apply for glibc based systems alone
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
X-List-Received-Date: Thu, 25 May 2017 14:47:43 -0000

musl does not provide separate gconv packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb | 2 +-
 meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
index 0c53b6a27..1ef9f0bc3 100644
--- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
 DEPENDS += "libidn"
 # We must need glibc-gconvs to enable charset related functions,
 # such as Net::LibIDN::idn_to_ascii().
-RDEPENDS_${PN} += "glibc-gconvs"
+RDEPENDS_${PN}_append_libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/T/TH/THOR/Net-LibIDN-${PV}.tar.gz"
 SRC_URI[md5sum] = "c3e4de2065009d67bcb1df0afb473e12"
diff --git a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
index 934be0399..275ccb8c9 100644
--- a/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
+++ b/meta-perl/recipes-perl/libtext/libtext-iconv-perl_1.7.bb
@@ -10,7 +10,7 @@ documentation."
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=6;md5=fadf2919c7128e887d26b4d905f90649"
-RRECOMMENDS_${PN} += "glibc-gconvs"
+RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconvs"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MP/MPIOTR/Text-Iconv-${PV}.tar.gz"
 
-- 
2.13.0


