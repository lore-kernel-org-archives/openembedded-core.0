Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D95BE71BE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:52 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n11-v6so5888747wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=E0o7lyiVW8aOls1/ArWtGMwmaG+5AuJ9DkJNN3kROfY=;
	b=pk+q0jyJAFg9DMdP25Fd4s2rkWV74eOQ2ShAi5WkUEvaFof1hi+/H5877uI9GHROk0
	QPbfoBoDCOjv7OrDqxEXdgPYyJg0T3veLx+UGmG9hgzos614yEIn4Urs1CJLPfMvbTW6
	39rWA/QnFWe2EZmmxjaBMNvMEYYj60uiY5pL4HJXswtphBoYGfnrfOu1Tw3XggnAnU3Q
	VeEoNSUpc89Edkiy9EFf63Ka0VjM0i97+oTT8lVGdd5Bsr6UL5MKfXS1gTc2+shFi4sr
	8jAJz08yD6S49FZYtikMtcrA3DcxggA07j+cBOuis5ZUNUHSMWIHxpPL0Bm4TPyeH2cj
	pZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=E0o7lyiVW8aOls1/ArWtGMwmaG+5AuJ9DkJNN3kROfY=;
	b=D4Wv92zOmvFyqzZa5dLr3Rmg0wkIdDTs8KLHjr0SHBzcsVknYSaVJ3tSJ4arYT+xF3
	VeTxZKlRFsr5YRBQ/eLQOzLbp/lhNj3G2LzNU1rJrl9Ojm8e8HAa/mGKyU+fXLVzuQN1
	Y/pQD1nc8pI3Qq+q7CskBJEvbkn7l1PrXzpyh5aROtisCUaXHPE1QCpjLj2L7hhrFqcp
	oa9N+QVTTIrRPt56IthPDB/3lgzsmu4EY/XosT91hhd9YeE5S6m9zajk9jVYAjoTAAwB
	27zStKtznCl7bsAVRuPouKLM4Ur7uTTatk52d0iLn6bHBrtL4ZOdv75ZTq5iBrGLAoKf
	WJfw==
X-Gm-Message-State: AOUpUlGZYltW6RDz5LBR0NjbVFXVlergsXdMy9KndACMCD9a7NptDJIT
	3zdhWhLWsg5pmcXDq2+3ojtH/rQOP9w=
X-Google-Smtp-Source: AAOMgpclp63wfD1l02/G5kxKvS0bXYiFNwQcUhr2HPn4Hr4c8q4JoAf+vAmKigFm9sd0FQ/qQIYtYQ==
X-Received: by 2002:a1c:9e89:: with SMTP id
	h131-v6mr4491843wme.13.1532705573294; 
	Fri, 27 Jul 2018 08:32:53 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:34 +0100
Message-Id: <20180727153248.22838-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 02/16] libidn2: add new version
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
X-List-Received-Date: Fri, 27 Jul 2018 15:32:53 -0000

libidn 1.x is deprecated, add the parallel-installable libidn2.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/libidn/libidn2_2.0.5.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-extended/libidn/libidn2_2.0.5.bb

diff --git a/meta/recipes-extended/libidn/libidn2_2.0.5.bb b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
new file mode 100644
index 00000000000..aaf9ecd7e78
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn2_2.0.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Internationalized Domain Name support library"
+DESCRIPTION = "Implementation of the Stringprep, Punycode and IDNA specifications defined by the IETF Internationalized Domain Names (IDN) working group."
+HOMEPAGE = "http://www.gnu.org/software/libidn/"
+SECTION = "libs"
+LICENSE = "(GPLv2+ | LGPLv3) & GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ab90e75ef97cc6318ce4f2fbda62fe4d \
+                    file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/idn2.c;endline=16;md5=0283aec28e049f5bcaaeee52aa865874 \
+                    file://lib/idn2.h.in;endline=27;md5=c2cd28d3f87260f157f022eabb83714f"
+
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "eaf9a5b9d03b0cce3760f34b3124eb36"
+SRC_URI[sha256sum] = "53f69170886f1fa6fa5b332439c7a77a7d22626a82ef17e2c1224858bb4ca2b8"
+
+DEPENDS = "virtual/libiconv libunistring"
+
+inherit pkgconfig autotools gettext texinfo gtk-doc lib_package
+
+LICENSE_${PN} = "(GPLv2+ | LGPLv3)"
+LICENSE_${PN}-bin = "GPLv3+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


